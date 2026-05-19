import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "jsr:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });

  try {
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

    const { data: activeRule, error: ruleError } = await admin
      .schema("club")
      .from("cashback_rules")
      .select("*")
      .eq("is_active", true)
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    if (ruleError || !activeRule) {
      return new Response(JSON.stringify({ ok: true, created: 0, reason: "no_active_rule" }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const { data: orders, error: ordersError } = await admin
      .from("orders")
      .select("id, client_id, total_amount, status, source, created_at")
      .eq("source", "vento_pass")
      .in("status", ["paid", "completed", "delivered"])
      .not("client_id", "is", null)
      .order("created_at", { ascending: false })
      .limit(200);

    if (ordersError) {
      throw ordersError;
    }

    let created = 0;
    const now = Date.now();

    for (const order of orders ?? []) {
      const userId = order.client_id as string | null;
      if (!userId) continue;

      const { data: ent } = await admin
        .schema("club")
        .from("entitlements")
        .select("club_active, effective_until")
        .eq("user_id", userId)
        .maybeSingle();

      const isActive = Boolean(
        ent?.club_active &&
          (!ent.effective_until || new Date(ent.effective_until).getTime() > now),
      );
      if (!isActive) continue;

      const orderTotal = Number(order.total_amount ?? 0);
      const orderMinor = Math.max(0, Math.round(orderTotal * 100));
      if (orderMinor < Number(activeRule.min_order_total_minor ?? 0)) continue;

      const raw = Math.floor((orderMinor * Number(activeRule.percent_bps ?? 0)) / 10000);
      const capPerOrder = Number(activeRule.cap_per_order_minor ?? 0);
      const capped = capPerOrder > 0 ? Math.min(raw, capPerOrder) : raw;
      if (capped <= 0) continue;

      const eligibleAt = new Date(
        new Date(order.created_at as string).getTime() +
          Number(activeRule.settlement_delay_hours ?? 24) * 60 * 60 * 1000,
      ).toISOString();

      const { error: insertError } = await admin
        .schema("club")
        .from("earn_events")
        .upsert(
          {
            user_id: userId,
            order_id: order.id,
            rule_id: activeRule.id,
            purchase_minor: orderMinor,
            cashback_minor: capped,
            status: "pending",
            eligible_at: eligibleAt,
            metadata: { source: "club-sync-earn-events" },
          },
          { onConflict: "user_id,order_id,rule_id" },
        );

      if (!insertError) created += 1;
    }

    return new Response(JSON.stringify({ ok: true, created }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error instanceof Error ? error.message : "unknown error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }
});
