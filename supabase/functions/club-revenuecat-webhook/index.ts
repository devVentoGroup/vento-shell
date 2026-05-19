import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "jsr:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type, x-revenuecat-signature",
};

type RevenueCatEvent = {
  type?: string;
  app_user_id?: string;
  product_id?: string;
  entitlement_ids?: string[];
  expiration_at_ms?: number | null;
  purchased_at_ms?: number | null;
  event_timestamp_ms?: number | null;
  original_transaction_id?: string | null;
  aliases?: string[];
};

function toIso(ms?: number | null): string | null {
  if (!ms || Number.isNaN(ms)) return null;
  return new Date(ms).toISOString();
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });

  try {
    const webhookSecret = Deno.env.get("REVENUECAT_WEBHOOK_SECRET");
    const signature = req.headers.get("x-revenuecat-signature");
    if (!webhookSecret || !signature || signature !== webhookSecret) {
      return new Response(JSON.stringify({ error: "unauthorized webhook" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      return new Response(JSON.stringify({ error: "missing Supabase env" }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const admin = createClient(supabaseUrl, serviceRoleKey, {
      auth: { persistSession: false, autoRefreshToken: false },
    });

    const payload = await req.json();
    const event: RevenueCatEvent = payload?.event ?? payload;

    const appUserId = event.app_user_id;
    if (!appUserId) {
      return new Response(JSON.stringify({ error: "missing app_user_id" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const entitlementIds = event.entitlement_ids ?? [];
    const hasClubEntitlement = entitlementIds.includes("club");
    const status = hasClubEntitlement ? "active" : "expired";

    const { data: plan } = await admin
      .schema("club")
      .from("plans")
      .select("id, code")
      .eq("code", "club_monthly_co_v1")
      .maybeSingle();

    await admin
      .schema("club")
      .from("subscriptions")
      .insert({
        user_id: appUserId,
        plan_id: plan?.id ?? null,
        provider: "revenuecat",
        provider_customer_id: appUserId,
        provider_entitlement_id: "club",
        status,
        current_period_start: toIso(event.purchased_at_ms),
        current_period_end: toIso(event.expiration_at_ms),
        cancel_at_period_end: false,
        raw_payload: payload,
      });

    await admin
      .schema("club")
      .from("entitlements")
      .upsert(
        {
          user_id: appUserId,
          club_active: hasClubEntitlement,
          plan_code: plan?.code ?? "club_monthly_co_v1",
          source: "revenuecat",
          effective_from: toIso(event.purchased_at_ms),
          effective_until: toIso(event.expiration_at_ms),
          metadata: {
            event_type: event.type ?? null,
            entitlement_ids: entitlementIds,
            product_id: event.product_id ?? null,
          },
        },
        { onConflict: "user_id" },
      );

    await admin
      .schema("club")
      .from("audit_events")
      .insert({
        event_name: "club_webhook_processed",
        user_id: appUserId,
        actor: "revenuecat_webhook",
        event_data: payload,
      });

    return new Response(JSON.stringify({ ok: true }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error instanceof Error ? error.message : "unknown error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }
});
