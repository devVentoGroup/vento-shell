import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "jsr:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

type DeliveryQuotePayload = {
  site_id?: string;
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
    if (!apiKey) return json({ error: "missing_google_maps_key" }, 500);

    const body: DeliveryQuotePayload = await req.json();
    const siteId = (body.site_id ?? "").trim();
    const destination = body.destination;
    const destinationLatitude = Number(destination?.latitude);
    const destinationLongitude = Number(destination?.longitude);

    if (!siteId) return json({ error: "site_id_required" }, 400);
    if (!validCoordinate(destinationLatitude, destinationLongitude)) {
      return json({ error: "invalid_destination_coordinates" }, 400);
    }

    const { data: satellite, error: satelliteError } = await admin
      .schema("pass")
      .from("pass_satellites")
      .select("site_id, latitude_override, longitude_override, sites(latitude, longitude)")
      .eq("site_id", siteId)
      .eq("is_active", true)
      .maybeSingle();

    if (satelliteError || !satellite) return json({ error: "satellite_not_found" }, 404);

    const originLatitude = Number(satellite.latitude_override ?? satellite.sites?.latitude);
    const originLongitude = Number(satellite.longitude_override ?? satellite.sites?.longitude);
    if (!validCoordinate(originLatitude, originLongitude)) {
      return json({ error: "satellite_coordinates_missing" }, 409);
    }

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

    if (ratesError) return json({ error: "delivery_rates_lookup_failed", message: ratesError.message }, 500);
    const rate = (ratesData?.[0] ?? null) as RateRow | null;
    if (!rate) {
      return json({ error: "out_of_delivery_coverage", billed_distance_km: billedDistanceKm }, 409);
    }

    const fee = Number(rate.customer_fee_amount);
    if (!Number.isFinite(fee) || fee < 0) return json({ error: "invalid_delivery_rate" }, 500);

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
