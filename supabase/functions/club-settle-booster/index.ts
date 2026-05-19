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

    const nowIso = new Date().toISOString();
    const { data: pendingEvents, error: pendingError } = await admin
      .schema("club")
      .from("earn_events")
      .select("id, user_id, order_id, cashback_minor, status, eligible_at")
      .eq("status", "pending")
      .lte("eligible_at", nowIso)
      .order("eligible_at", { ascending: true })
      .limit(200);

    if (pendingError) throw pendingError;

    let settled = 0;

    for (const event of pendingEvents ?? []) {
      const userId = event.user_id as string;
      const cashbackMinor = Number(event.cashback_minor ?? 0);
      if (!userId || cashbackMinor <= 0) continue;

      // 1) Ensure wallet account exists
      await admin.schema("club").from("wallet_accounts").upsert(
        {
          user_id: userId,
          currency: "COP",
        },
        { onConflict: "user_id" },
      );

      // 2) Approve event
      await admin
        .schema("club")
        .from("earn_events")
        .update({
          status: "approved",
          processed_at: nowIso,
          updated_at: nowIso,
          metadata: { settled_by: "club-settle-booster" },
        })
        .eq("id", event.id)
        .eq("status", "pending");

      // 3) Ledger movement
      const { error: ledgerError } = await admin
        .schema("club")
        .from("wallet_ledger")
        .insert({
          user_id: userId,
          kind: "cashback_approved",
          amount_minor: cashbackMinor,
          reference_type: "order",
          reference_id: event.order_id,
          description: "Acreditacion de cashback Club (D+1)",
          metadata: { earn_event_id: event.id },
        });

      if (ledgerError) continue;

      // 4) Update wallet balances
      const { data: wallet } = await admin
        .schema("club")
        .from("wallet_accounts")
        .select("available_minor")
        .eq("user_id", userId)
        .maybeSingle();

      await admin
        .schema("club")
        .from("wallet_accounts")
        .update({
          available_minor: Number(wallet?.available_minor ?? 0) + cashbackMinor,
          updated_at: nowIso,
        })
        .eq("user_id", userId);

      // 5) Audit
      await admin.schema("club").from("audit_events").insert({
        event_name: "club_booster_settled",
        user_id: userId,
        actor: "club-settle-booster",
        event_data: {
          earn_event_id: event.id,
          order_id: event.order_id,
          amount_minor: cashbackMinor,
        },
      });

      settled += 1;
    }

    return new Response(JSON.stringify({ ok: true, settled }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error instanceof Error ? error.message : "unknown error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }
});
