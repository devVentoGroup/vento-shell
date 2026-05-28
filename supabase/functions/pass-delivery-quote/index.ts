import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "jsr:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

type DeliveryQuotePayload = {
  site_id?: string;
  satellite_id?: string;
  destination?: {
    label?: string;
    address?: string;
    latitude?: number;
    longitude?: number;
  };
};

type RateRow = {
  id: string;
  distance_km: number;
  customer_fee_amount: number | string;
  eta_minutes: number | null;
};

type SatelliteRow = {
  id: string;
  site_id: string;
  latitude_override: number | null;
  longitude_override: number | null;
  sites?: { latitude: number | string | null; longitude: number | string | null } | null;
};

type SiteRow = {
  id: string;
  latitude: number | string | null;
  longitude: number | string | null;
};

type QuoteRow = {
  id: string;
  expires_at: string;
};

function logQuote(event: string, payload: Record<string, unknown>) {
  console.log("[pass-delivery-quote]", event, JSON.stringify(payload));
}

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function googleKey() {
  return Deno.env.get("GOOGLE_MAPS_SERVER_API_KEY") ?? Deno.env.get("GOOGLE_MAPS_API_KEY") ?? "";
}

function validCoordinate(latitude: number, longitude: number) {
  return Number.isFinite(latitude) && Number.isFinite(longitude) && latitude >= -90 && latitude <= 90 && longitude >= -180 && longitude <= 180;
}

function isUuid(value: string) {
  return /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(value);
}

async function requireClients(req: Request) {
  const authHeader = req.headers.get("authorization") ?? "";
  const bearer = authHeader.startsWith("Bearer ") ? authHeader.slice(7) : null;
  if (!bearer) return { response: json({ error: "missing bearer token" }, 401) };

  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const anonKey = Deno.env.get("SUPABASE_ANON_KEY");
  const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!supabaseUrl || !anonKey || !serviceRoleKey) return { response: json({ error: "missing Supabase env" }, 500) };

  const userClient = createClient(supabaseUrl, anonKey, {
    global: { headers: { Authorization: `Bearer ${bearer}` } },
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const admin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });

  const { data, error } = await userClient.auth.getUser();
  if (error || !data?.user) return { response: json({ error: "unauthorized" }, 401) };
  return { admin, user: data.user };
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return json({ error: "method_not_allowed" }, 405);

  try {
    const context = await requireClients(req);
    if (context.response) return context.response;
    const { admin, user } = context;

    const apiKey = googleKey();
    if (!apiKey) {
      logQuote("config_error", { reason: "missing_google_maps_key" });
      return json({ error: "missing_google_maps_key" }, 500);
    }

    const body: DeliveryQuotePayload = await req.json();
    const requestedSiteId = (body.site_id ?? "").trim();
    const requestedSatelliteId = (body.satellite_id ?? "").trim();
    const destination = body.destination;
    const destinationLatitude = Number(destination?.latitude);
    const destinationLongitude = Number(destination?.longitude);

    if (!requestedSiteId && !requestedSatelliteId) return json({ error: "site_id_required" }, 400);
    if (!validCoordinate(destinationLatitude, destinationLongitude)) {
      logQuote("invalid_destination", {
        requestedSiteId,
        requestedSatelliteId,
        destinationLatitude,
        destinationLongitude,
      });
      return json({ error: "invalid_destination_coordinates" }, 400);
    }

    logQuote("quote_payload_received", {
      requestedSiteId,
      requestedSatelliteId,
      destinationLatitude,
      destinationLongitude,
    });

    let satellite: SatelliteRow | null = null;

    if (requestedSatelliteId && isUuid(requestedSatelliteId)) {
      const { data: satelliteByExplicitId, error: satelliteByExplicitIdError } = await admin
        .schema("pass")
        .from("pass_satellites")
        .select("id, site_id, latitude_override, longitude_override, sites(latitude, longitude)")
        .eq("id", requestedSatelliteId)
        .eq("is_active", true)
        .maybeSingle();

      if (satelliteByExplicitIdError) {
        logQuote("satellite_lookup_failed", {
          requestedSiteId,
          requestedSatelliteId,
          lookup: "satellite_id",
          error: satelliteByExplicitIdError.message,
        });
      } else {
        satellite = satelliteByExplicitId as SatelliteRow | null;
      }
    } else if (requestedSatelliteId) {
      logQuote("satellite_id_skipped_invalid_uuid", {
        requestedSiteId,
        requestedSatelliteId,
      });
    }

    if (!satellite && requestedSiteId && isUuid(requestedSiteId)) {
      const { data: satelliteBySiteId, error: satelliteBySiteIdError } = await admin
        .schema("pass")
        .from("pass_satellites")
        .select("id, site_id, latitude_override, longitude_override, sites(latitude, longitude)")
        .eq("site_id", requestedSiteId)
        .eq("is_active", true)
        .maybeSingle();

      if (satelliteBySiteIdError) {
        logQuote("satellite_lookup_failed", {
          requestedSiteId,
          requestedSatelliteId,
          lookup: "site_id",
          error: satelliteBySiteIdError.message,
        });
      } else {
        satellite = satelliteBySiteId as SatelliteRow | null;
      }
    }

    if (!satellite && requestedSiteId && isUuid(requestedSiteId)) {
      const { data: satelliteByImplicitId, error: satelliteByImplicitIdError } = await admin
        .schema("pass")
        .from("pass_satellites")
        .select("id, site_id, latitude_override, longitude_override, sites(latitude, longitude)")
        .eq("id", requestedSiteId)
        .eq("is_active", true)
        .maybeSingle();

      if (satelliteByImplicitIdError) {
        logQuote("satellite_lookup_failed", {
          requestedSiteId,
          requestedSatelliteId,
          lookup: "implicit_satellite_id",
          error: satelliteByImplicitIdError.message,
        });
      } else {
        satellite = satelliteByImplicitId as SatelliteRow | null;
      }
    }

    if (!satellite && requestedSiteId) {
      const normalizedCode = requestedSiteId.toLowerCase();
      const { data: satelliteByCode, error: satelliteByCodeError } = await admin
        .schema("pass")
        .from("pass_satellites")
        .select("id, site_id, latitude_override, longitude_override, sites(latitude, longitude)")
        .eq("code", normalizedCode)
        .eq("is_active", true)
        .maybeSingle();

      if (satelliteByCodeError) {
        logQuote("satellite_lookup_failed", {
          requestedSiteId,
          requestedSatelliteId,
          lookup: "code",
          error: satelliteByCodeError.message,
        });
      } else {
        satellite = satelliteByCode as SatelliteRow | null;
      }
    }

    let siteId = satellite?.site_id ?? "";
    let originLatitude = Number(satellite?.latitude_override ?? satellite?.sites?.latitude);
    let originLongitude = Number(satellite?.longitude_override ?? satellite?.sites?.longitude);

    if (!satellite && requestedSiteId && isUuid(requestedSiteId)) {
      const { data: siteById, error: siteByIdError } = await admin
        .from("sites")
        .select("id, latitude, longitude")
        .eq("id", requestedSiteId)
        .maybeSingle();

      if (siteByIdError) {
        logQuote("site_lookup_failed", {
          requestedSiteId,
          requestedSatelliteId,
          error: siteByIdError.message,
        });
      } else if (siteById) {
        const site = siteById as SiteRow;
        siteId = site.id;
        originLatitude = Number(site.latitude);
        originLongitude = Number(site.longitude);
        logQuote("site_id_resolved_without_satellite", {
          requestedSiteId,
          requestedSatelliteId,
          resolvedSiteId: siteId,
        });
      }
    }

    if (!siteId) {
      logQuote("origin_site_not_found", {
        requestedSiteId,
        requestedSatelliteId,
        lookup: "satellite_id_site_id_or_site",
      });
      return json({
        ok: false,
        reason: "satellite_not_found",
        requested_site_id: requestedSiteId || null,
        requested_satellite_id: requestedSatelliteId || null,
      });
    }

    if (satellite && requestedSiteId !== satellite.site_id) {
      logQuote("satellite_id_resolved_to_site_id", {
        requestedSiteId,
        requestedSatelliteId,
        satelliteId: satellite.id,
        resolvedSiteId: satellite.site_id,
      });
    }

    if (!validCoordinate(originLatitude, originLongitude)) {
      logQuote("satellite_coordinates_missing", {
        siteId,
        originLatitude,
        originLongitude,
      });
      return json({ error: "satellite_coordinates_missing" }, 409);
    }

    logQuote("quote_requested", {
      siteId,
      originLatitude,
      originLongitude,
      destinationLatitude,
      destinationLongitude,
    });

    const url = new URL("https://maps.googleapis.com/maps/api/distancematrix/json");
    url.searchParams.set("origins", `${originLatitude},${originLongitude}`);
    url.searchParams.set("destinations", `${destinationLatitude},${destinationLongitude}`);
    url.searchParams.set("mode", "driving");
    url.searchParams.set("units", "metric");
    url.searchParams.set("language", "es");
    url.searchParams.set("key", apiKey);

    const response = await fetch(url);
    const matrix = await response.json();
    const element = matrix.rows?.[0]?.elements?.[0];
    if (!response.ok || matrix.status !== "OK" || element?.status !== "OK") {
      logQuote("distance_calculation_failed", {
        siteId,
        originLatitude,
        originLongitude,
        destinationLatitude,
        destinationLongitude,
        httpStatus: response.status,
        providerStatus: matrix.status ?? null,
        elementStatus: element?.status ?? null,
        errorMessage: matrix.error_message ?? null,
      });
      return json({ error: "distance_calculation_failed", status: matrix.status, element_status: element?.status }, 502);
    }

    const distanceMeters = Number(element.distance?.value);
    const durationSeconds = Number(element.duration?.value);
    if (!Number.isFinite(distanceMeters) || distanceMeters < 0) {
      return json({ error: "invalid_distance_response" }, 502);
    }

    const distanceKm = distanceMeters / 1000;
    const billedDistanceKm = Math.max(1, Math.ceil(distanceKm));

    const { data: ratesData, error: ratesError } = await admin
      .schema("pass")
      .from("delivery_distance_rates")
      .select("id, distance_km, customer_fee_amount, eta_minutes")
      .eq("site_id", siteId)
      .eq("is_active", true)
      .gte("distance_km", billedDistanceKm)
      .order("distance_km", { ascending: true })
      .limit(1);

    if (ratesError) {
      logQuote("delivery_rates_lookup_failed", {
        siteId,
        distanceKm: Number(distanceKm.toFixed(2)),
        billedDistanceKm,
        error: ratesError.message,
      });
      return json({ error: "delivery_rates_lookup_failed", message: ratesError.message }, 500);
    }
    const rate = (ratesData?.[0] ?? null) as RateRow | null;
    logQuote("rates_lookup_completed", {
      siteId,
      originLatitude,
      originLongitude,
      destinationLatitude,
      destinationLongitude,
      distanceKm: Number(distanceKm.toFixed(2)),
      billedDistanceKm,
      ratesFound: ratesData?.length ?? 0,
      selectedDistanceKm: rate?.distance_km ?? null,
    });
    if (!rate) {
      return json({
        ok: false,
        reason: "out_of_delivery_coverage",
        site_id: siteId,
        distance_km: Number(distanceKm.toFixed(2)),
        billed_distance_km: billedDistanceKm,
      });
    }

    const fee = Number(rate.customer_fee_amount);
    if (!Number.isFinite(fee) || fee < 0) return json({ error: "invalid_delivery_rate" }, 500);

    await admin
      .schema("pass")
      .from("delivery_quotes")
      .delete()
      .eq("user_id", user.id)
      .eq("site_id", siteId)
      .is("used_at", null)
      .lt("expires_at", new Date().toISOString());

    const coordinateTolerance = 0.00005;
    const { data: reusableQuote, error: reusableQuoteError } = await admin
      .schema("pass")
      .from("delivery_quotes")
      .select("id, expires_at")
      .eq("user_id", user.id)
      .eq("site_id", siteId)
      .eq("rate_id", rate.id)
      .eq("billed_distance_km", Number(rate.distance_km))
      .eq("customer_fee_amount", fee)
      .is("used_at", null)
      .gt("expires_at", new Date().toISOString())
      .gte("destination_latitude", destinationLatitude - coordinateTolerance)
      .lte("destination_latitude", destinationLatitude + coordinateTolerance)
      .gte("destination_longitude", destinationLongitude - coordinateTolerance)
      .lte("destination_longitude", destinationLongitude + coordinateTolerance)
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    if (reusableQuoteError) {
      logQuote("delivery_quote_reuse_lookup_failed", {
        siteId,
        error: reusableQuoteError.message,
      });
    }

    const existingQuote = reusableQuote as QuoteRow | null;
    if (existingQuote) {
      logQuote("delivery_quote_reused", {
        siteId,
        quoteId: existingQuote.id,
        distanceKm: Number(distanceKm.toFixed(2)),
        billedDistanceKm: Number(rate.distance_km),
      });

      return json({
        ok: true,
        quote: {
          id: existingQuote.id,
          site_id: siteId,
          destination: {
            label: destination?.label ?? null,
            address: destination?.address ?? null,
            latitude: destinationLatitude,
            longitude: destinationLongitude,
          },
          distance_meters: Math.round(distanceMeters),
          distance_km: Number(distanceKm.toFixed(2)),
          billed_distance_km: Number(rate.distance_km),
          duration_seconds: Number.isFinite(durationSeconds) ? Math.round(durationSeconds) : null,
          customer_fee_amount: fee,
          expires_at: existingQuote.expires_at,
        },
      });
    }

    const { data: quote, error: quoteError } = await admin
      .schema("pass")
      .from("delivery_quotes")
      .insert({
        user_id: user.id,
        site_id: siteId,
        rate_id: rate.id,
        destination_label: destination?.label ?? null,
        destination_address: destination?.address ?? null,
        destination_latitude: destinationLatitude,
        destination_longitude: destinationLongitude,
        distance_meters: Math.round(distanceMeters),
        distance_km: Number(distanceKm.toFixed(2)),
        billed_distance_km: Number(rate.distance_km),
        duration_seconds: Number.isFinite(durationSeconds) ? Math.round(durationSeconds) : null,
        customer_fee_amount: fee,
        raw_provider: "google_distance_matrix",
        raw_response: {
          distance_text: element.distance?.text ?? null,
          duration_text: element.duration?.text ?? null,
          provider_status: matrix.status,
        },
      })
      .select("id, expires_at")
      .single();

    if (quoteError || !quote) return json({ error: "delivery_quote_create_failed", message: quoteError?.message }, 500);

    return json({
      ok: true,
      quote: {
        id: quote.id,
        site_id: siteId,
        destination: {
          label: destination?.label ?? null,
          address: destination?.address ?? null,
          latitude: destinationLatitude,
          longitude: destinationLongitude,
        },
        distance_meters: Math.round(distanceMeters),
        distance_km: Number(distanceKm.toFixed(2)),
        billed_distance_km: Number(rate.distance_km),
        duration_seconds: Number.isFinite(durationSeconds) ? Math.round(durationSeconds) : null,
        customer_fee_amount: fee,
        expires_at: quote.expires_at,
      },
    });
  } catch (error) {
    return json({ error: error instanceof Error ? error.message : "unknown error" }, 500);
  }
});
