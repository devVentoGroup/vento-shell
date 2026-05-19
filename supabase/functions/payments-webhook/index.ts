import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "jsr:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type, x-event-checksum, x-wompi-signature, x-signature",
};

type WebhookPayload = {
  event?: string;
  id?: string;
  data?: {
    id?: string;
    transaction_id?: string;
    status?: string;
    reference?: string;
    transaction?: {
      id?: string;
      status?: string;
      reference?: string;
      metadata?: Record<string, unknown>;
    };
  };
  signature?: {
    properties?: string[];
    checksum?: string;
  };
  timestamp?: number | string;
};

function mapProviderStatus(rawStatus: string | null | undefined): string {
  const normalized = (rawStatus ?? "").toLowerCase();
  if (["approved", "paid", "completed", "successful"].includes(normalized)) return "approved";
  if (["declined", "failed", "error", "voided"].includes(normalized)) return "rejected";
  if (["cancelled", "canceled", "expired"].includes(normalized)) return "cancelled";
  if (["refunded", "reversed"].includes(normalized)) return "refunded";
  return "error";
}

async function sha256Hex(value: string) {
  const encoded = new TextEncoder().encode(value);
  const digest = await crypto.subtle.digest("SHA-256", encoded);
  return Array.from(new Uint8Array(digest))
    .map((byte) => byte.toString(16).padStart(2, "0"))
    .join("");
}

function readPath(input: unknown, path: string): unknown {
  return path.split(".").reduce<unknown>((current, key) => {
    if (current && typeof current === "object" && key in current) {
      return (current as Record<string, unknown>)[key];
    }
    return undefined;
  }, input);
}

async function verifyWompiChecksum(payload: WebhookPayload, eventSecret: string, headerChecksum: string | null) {
  const properties = payload.signature?.properties;
  const expectedChecksum = payload.signature?.checksum ?? headerChecksum;
  if (!properties?.length || !expectedChecksum || payload.timestamp === undefined || payload.timestamp === null) return false;

  const rawProperties = properties.map((property) => {
    const value = readPath(payload.data ?? {}, property);
    return value === null || value === undefined ? "" : String(value);
  });
  const generated = await sha256Hex(`${rawProperties.join("")}${String(payload.timestamp)}${eventSecret}`);
  return generated.toLowerCase() === expectedChecksum.toLowerCase();
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });

  try {
    const webhookSecret = Deno.env.get("WOMPI_EVENTS_SECRET") ?? Deno.env.get("WOMPI_WEBHOOK_SECRET");
    if (!webhookSecret) {
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

    const payload: WebhookPayload = await req.json();
    const checksumHeader = req.headers.get("x-event-checksum");
    const signatureValid = await verifyWompiChecksum(payload, webhookSecret, checksumHeader);
    if (!signatureValid) {
      return new Response(JSON.stringify({ error: "invalid webhook checksum" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const eventId = payload?.id ?? payload?.data?.id ?? crypto.randomUUID();
    const txFromData = payload?.data?.transaction_id ?? payload?.data?.transaction?.metadata?.transaction_id;
    let transactionId = typeof txFromData === "string" ? txFromData : null;
    const checkoutReference = payload?.data?.transaction?.reference ?? payload?.data?.reference ?? null;
    const providerReference = payload?.data?.transaction?.id ?? checkoutReference;
    const providerStatus = mapProviderStatus(payload?.data?.transaction?.status ?? payload?.data?.status ?? null);

    const { data: existingEvent } = await admin
      .schema("payments")
      .from("webhook_events")
      .select("id, processed")
      .eq("provider", "wompi")
      .eq("provider_event_id", eventId)
      .maybeSingle();

    if (existingEvent?.processed) {
      return new Response(JSON.stringify({ ok: true, duplicate: true }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    if (!transactionId && checkoutReference) {
      const { data: txByReference } = await admin
        .schema("payments")
        .from("transactions")
        .select("id")
        .eq("provider", "wompi")
        .eq("idempotency_key", checkoutReference)
        .maybeSingle();
      transactionId = txByReference?.id ?? null;
    }

    if (!transactionId) {
      await admin.schema("payments").from("webhook_events").upsert(
        {
          provider: "wompi",
          provider_event_id: eventId,
          signature_valid: signatureValid,
          processed: false,
          payload,
        },
        { onConflict: "provider,provider_event_id" },
      );
      return new Response(JSON.stringify({ ok: false, error: "missing transaction_id in metadata" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const { error: markError, data: markData } = await admin.rpc("mark_payment_transaction_status", {
      p_transaction_id: transactionId,
      p_provider_reference: providerReference,
      p_status: providerStatus,
      p_payload: payload,
    });

    await admin.schema("payments").from("webhook_events").upsert(
      {
        provider: "wompi",
        provider_event_id: eventId,
        transaction_id: transactionId,
        signature_valid: signatureValid,
        processed: !markError,
        processed_at: markError ? null : new Date().toISOString(),
        payload,
      },
      { onConflict: "provider,provider_event_id" },
    );

    if (markError) {
      return new Response(JSON.stringify({ error: markError.message }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    return new Response(JSON.stringify({ ok: true, result: markData }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error instanceof Error ? error.message : "unknown error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }
});
