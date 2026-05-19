import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "jsr:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

type CreateIntentPayload = {
  transaction_id?: string;
};

async function sha256Hex(value: string) {
  const encoded = new TextEncoder().encode(value);
  const digest = await crypto.subtle.digest("SHA-256", encoded);
  return Array.from(new Uint8Array(digest))
    .map((byte) => byte.toString(16).padStart(2, "0"))
    .join("");
}

async function buildCheckoutUrl(
  baseUrl: string | null,
  reference: string,
  amountMinor: number,
  currency: string,
  publicKey: string | null,
  integritySecret: string | null,
  redirectUrl: string | null,
  customerEmail: string | null,
) {
  if (!baseUrl || !publicKey || !integritySecret) return null;
  try {
    const url = new URL(baseUrl);
    const signature = await sha256Hex(`${reference}${amountMinor}${currency}${integritySecret}`);
    url.searchParams.set("public-key", publicKey);
    url.searchParams.set("currency", currency);
    url.searchParams.set("amount-in-cents", String(amountMinor));
    url.searchParams.set("reference", reference);
    url.searchParams.set("signature:integrity", signature);
    if (redirectUrl) url.searchParams.set("redirect-url", redirectUrl);
    if (customerEmail) url.searchParams.set("customer-data:email", customerEmail);
    return url.toString();
  } catch {
    return null;
  }
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });

  try {
    const authHeader = req.headers.get("authorization") ?? "";
    const bearer = authHeader.startsWith("Bearer ") ? authHeader.slice(7) : null;
    if (!bearer) {
      return new Response(JSON.stringify({ error: "missing bearer token" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const anonKey = Deno.env.get("SUPABASE_ANON_KEY");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !anonKey || !serviceRoleKey) {
      return new Response(JSON.stringify({ error: "missing Supabase env" }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const userClient = createClient(supabaseUrl, anonKey, {
      global: { headers: { Authorization: `Bearer ${bearer}` } },
      auth: { persistSession: false, autoRefreshToken: false },
    });
    const admin = createClient(supabaseUrl, serviceRoleKey, {
      auth: { persistSession: false, autoRefreshToken: false },
    });

    const { data: authData, error: authError } = await userClient.auth.getUser();
    if (authError || !authData?.user) {
      return new Response(JSON.stringify({ error: "unauthorized" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const body: CreateIntentPayload = await req.json();
    const transactionId = body?.transaction_id;
    if (!transactionId) {
      return new Response(JSON.stringify({ error: "transaction_id is required" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const { data: tx, error: txError } = await admin
      .schema("payments")
      .from("transactions")
      .select("id, user_id, provider, idempotency_key, amount_minor, currency, status, order_id")
      .eq("id", transactionId)
      .maybeSingle();

    if (txError || !tx) {
      return new Response(JSON.stringify({ error: "transaction_not_found" }), {
        status: 404,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    if (tx.user_id !== authData.user.id) {
      return new Response(JSON.stringify({ error: "forbidden" }), {
        status: 403,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    if (tx.status !== "pending" && tx.status !== "requires_action") {
      return new Response(JSON.stringify({ error: "transaction_not_pending", status: tx.status }), {
        status: 409,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const wompiPublicKey = Deno.env.get("WOMPI_PUBLIC_KEY") ?? null;
    const wompiIntegritySecret = Deno.env.get("WOMPI_INTEGRITY_SECRET") ?? null;
    const wompiCheckoutBaseUrl = Deno.env.get("WOMPI_CHECKOUT_BASE_URL") ?? "https://checkout.wompi.co/p/";
    const wompiRedirectUrl = Deno.env.get("WOMPI_REDIRECT_URL") ?? null;
    const checkoutUrl = await buildCheckoutUrl(
      wompiCheckoutBaseUrl,
      tx.idempotency_key,
      Number(tx.amount_minor),
      tx.currency,
      wompiPublicKey,
      wompiIntegritySecret,
      wompiRedirectUrl,
      authData.user.email ?? null,
    );

    if (!checkoutUrl) {
      return new Response(JSON.stringify({ error: "missing_or_invalid_wompi_checkout_config" }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    await admin
      .schema("payments")
      .from("transactions")
      .update({
        status: "requires_action",
        raw_request: {
          intent: "checkout",
          provider: tx.provider,
          generated_at: new Date().toISOString(),
        },
      })
      .eq("id", tx.id);

    return new Response(
      JSON.stringify({
        ok: true,
        transaction_id: tx.id,
        order_id: tx.order_id,
        provider: tx.provider,
        amount_minor: tx.amount_minor,
        currency: tx.currency,
        reference: tx.idempotency_key,
        checkout_url: checkoutUrl,
        provider_payload: {
          public_key: wompiPublicKey,
          reference: tx.idempotency_key,
          amount_in_cents: tx.amount_minor,
          currency: tx.currency,
          redirect_url: wompiRedirectUrl,
        },
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error instanceof Error ? error.message : "unknown error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }
});
