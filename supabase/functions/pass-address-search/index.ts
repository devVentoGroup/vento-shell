import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "jsr:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

type AddressSearchPayload = {
  query?: string;
  place_id?: string;
  site_id?: string;
  latitude?: number;
  longitude?: number;
};

function validCoordinate(latitude: number, longitude: number) {
  return (
    Number.isFinite(latitude) &&
    Number.isFinite(longitude) &&
    latitude >= -90 &&
    latitude <= 90 &&
    longitude >= -180 &&
    longitude <= 180
  );
}

async function requireUser(req: Request) {
  const authHeader = req.headers.get("authorization") ?? "";
  const bearer = authHeader.startsWith("Bearer ") ? authHeader.slice(7) : null;
  if (!bearer) return { response: json({ error: "missing bearer token" }, 401) };

  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const anonKey = Deno.env.get("SUPABASE_ANON_KEY");
  if (!supabaseUrl || !anonKey) return { response: json({ error: "missing Supabase env" }, 500) };

  const userClient = createClient(supabaseUrl, anonKey, {
    global: { headers: { Authorization: `Bearer ${bearer}` } },
    auth: { persistSession: false, autoRefreshToken: false },
  });

  const { data, error } = await userClient.auth.getUser();
  if (error || !data?.user) return { response: json({ error: "unauthorized" }, 401) };
  return { user: data.user };
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

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return json({ error: "method_not_allowed" }, 405);

  try {
    const auth = await requireUser(req);
    if (auth.response) return auth.response;

    const apiKey = googleKey();
    if (!apiKey) return json({ error: "missing_google_maps_key" }, 500);

    const body: AddressSearchPayload = await req.json();
    const placeId = (body.place_id ?? "").trim();
    const latitude = Number(body.latitude);
    const longitude = Number(body.longitude);

    if (placeId) {
      const url = new URL("https://maps.googleapis.com/maps/api/place/details/json");
      url.searchParams.set("place_id", placeId);
      url.searchParams.set("fields", "place_id,name,formatted_address,geometry");
      url.searchParams.set("language", "es");
      url.searchParams.set("key", apiKey);

      const response = await fetch(url);
      const payload = await response.json();
      if (!response.ok || payload.status !== "OK") {
        return json({ error: "place_details_failed", status: payload.status, message: payload.error_message }, 502);
      }

      const result = payload.result;
      return json({
        ok: true,
        place: {
          place_id: result.place_id,
          label: result.name || result.formatted_address,
          address: result.formatted_address,
          latitude: result.geometry?.location?.lat,
          longitude: result.geometry?.location?.lng,
        },
      });
    }

    const query = (body.query ?? "").trim();
    if (query.length < 1) return json({ ok: true, predictions: [] });

    const url = new URL("https://maps.googleapis.com/maps/api/place/autocomplete/json");
    url.searchParams.set("input", query);
    url.searchParams.set("components", "country:co");
    url.searchParams.set("language", "es");
    if (validCoordinate(latitude, longitude)) {
      url.searchParams.set("location", `${latitude},${longitude}`);
      url.searchParams.set("origin", `${latitude},${longitude}`);
      url.searchParams.set("radius", "25000");
    }
    url.searchParams.set("key", apiKey);

    const response = await fetch(url);
    const payload = await response.json();
    if (!response.ok || (payload.status !== "OK" && payload.status !== "ZERO_RESULTS")) {
      return json({ error: "address_search_failed", status: payload.status, message: payload.error_message }, 502);
    }

    const predictions = (payload.predictions ?? [])
      .slice(0, 10)
      .sort((a: Record<string, unknown>, b: Record<string, unknown>) => {
        const distanceA = Number(a.distance_meters);
        const distanceB = Number(b.distance_meters);
        const hasDistanceA = Number.isFinite(distanceA);
        const hasDistanceB = Number.isFinite(distanceB);
        if (hasDistanceA && hasDistanceB) return distanceA - distanceB;
        if (hasDistanceA) return -1;
        if (hasDistanceB) return 1;
        return 0;
      })
      .slice(0, 6)
      .map((item: Record<string, unknown>) => ({
        place_id: item.place_id,
        description: item.description,
        main_text: (item.structured_formatting as Record<string, unknown> | undefined)?.main_text,
        secondary_text: (item.structured_formatting as Record<string, unknown> | undefined)?.secondary_text,
        distance_meters: item.distance_meters,
      }));

    return json({
      ok: true,
      predictions,
    });
  } catch (error) {
    return json({ error: error instanceof Error ? error.message : "unknown error" }, 500);
  }
});
