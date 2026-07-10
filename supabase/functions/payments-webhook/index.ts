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

type WebhookEventRecord = {
  id: string;
  processed: boolean;
};

type TransactionReferenceRecord = {
  id: string;
};

function jsonResponse(body: Record<string, unknown>, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function mapProviderStatus(rawStatus: string | null | undefined): string {
  const normalized = (rawStatus ?? "").toLowerCase();
  if (["approved", "paid", "completed", "successful"].includes(normalized)) return "approved";
  if (["declined", "failed", "error", "voided"].includes(normalized)) return "rejected";
  if (["cancelled", "canceled", "expired"].includes(normalized)) return "cancelled";
  if (["refunded", "reversed"].includes(normalized)) return "refunded";
  return "error";
}

function asCleanString(value: unknown) {
  return String(value ?? "").trim();
}

function isValidUuid(value: string) {
  return /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{12}$/i.test(value);
}

function asWebhookEventRecord(value: unknown) {
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    return null;
  }

  const record = value as Record<string, unknown>;
  const id = asCleanString(record.id);

  if (!id) {
    return null;
  }

  return {
    id,
    processed: record.processed === true,
  } satisfies WebhookEventRecord;
}

function asTransactionReferenceRecord(value: unknown) {
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    return null;
  }

  const record = value as Record<string, unknown>;
  const id = asCleanString(record.id);

  return id ? { id } satisfies TransactionReferenceRecord : null;
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

async function verifyWompiChecksum(
  payload: WebhookPayload,
  eventSecret: string,
  headerChecksum: string | null,
) {
  const properties = payload.signature?.properties;
  const expectedChecksum = payload.signature?.checksum ?? headerChecksum;

  if (!properties?.length || !expectedChecksum || payload.timestamp === undefined || payload.timestamp === null) {
    return false;
  }

  const rawProperties = properties.map((property) => {
    const value = readPath(payload.data ?? {}, property);
    return value === null || value === undefined ? "" : String(value);
  });

  const generated = await sha256Hex(`${rawProperties.join("")}${String(payload.timestamp)}${eventSecret}`);

  return generated.toLowerCase() === expectedChecksum.toLowerCase();
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  if (req.method === "GET") {
    return jsonResponse({ ok: true, service: "payments-webhook" });
  }

  if (req.method !== "POST") {
    return jsonResponse({ error: "method_not_allowed" }, 405);
  }

  try {
    const webhookSecret = Deno.env.get("WOMPI_EVENTS_SECRET") ?? Deno.env.get("WOMPI_WEBHOOK_SECRET");

    if (!webhookSecret) {
      return jsonResponse({ error: "unauthorized_webhook" }, 401);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !serviceRoleKey) {
      return jsonResponse({ error: "missing_supabase_env" }, 500);
    }

    const admin = createClient(supabaseUrl, serviceRoleKey, {
      auth: { persistSession: false, autoRefreshToken: false },
    });

    let payload: WebhookPayload;

    try {
      payload = await req.json();
    } catch {
      return jsonResponse({ error: "invalid_json_body" }, 400);
    }

    const checksumHeader = req.headers.get("x-event-checksum");
    const signatureValid = await verifyWompiChecksum(payload, webhookSecret, checksumHeader);

    if (!signatureValid) {
      return jsonResponse({ error: "invalid_webhook_checksum" }, 401);
    }

    const eventId = asCleanString(payload.id) || asCleanString(payload.data?.id) || crypto.randomUUID();
    const checkoutReference = asCleanString(payload.data?.transaction?.reference ?? payload.data?.reference);
    const providerReference = asCleanString(payload.data?.transaction?.id ?? checkoutReference) || null;
    const providerStatus = mapProviderStatus(payload.data?.transaction?.status ?? payload.data?.status ?? null);

    const { data: existingEventResult, error: existingEventError } = await admin.rpc(
      "checkout_get_payment_webhook_event",
      {
        p_provider: "wompi",
        p_provider_event_id: eventId,
      },
    );

    if (existingEventError) {
      console.error("payments-webhook event lookup failed", {
        provider: "wompi",
        provider_event_id: eventId,
        code: existingEventError.code,
        message: existingEventError.message,
      });

      return jsonResponse({ error: "webhook_event_lookup_failed" }, 500);
    }

    const existingEvent = asWebhookEventRecord(existingEventResult);

    if (existingEvent?.processed) {
      return jsonResponse({ ok: true, duplicate: true });
    }

    const txFromData = asCleanString(
      payload.data?.transaction_id ?? payload.data?.transaction?.metadata?.transaction_id,
    );

    let transactionId = txFromData && isValidUuid(txFromData) ? txFromData : null;

    if (!transactionId && checkoutReference) {
      const { data: txByReferenceResult, error: txByReferenceError } = await admin.rpc(
        "checkout_find_payment_transaction_by_reference",
        {
          p_provider: "wompi",
          p_reference: checkoutReference,
        },
      );

      if (txByReferenceError) {
        console.error("payments-webhook transaction reference lookup failed", {
          provider: "wompi",
          reference: checkoutReference,
          code: txByReferenceError.code,
          message: txByReferenceError.message,
        });

        return jsonResponse({ error: "transaction_reference_lookup_failed" }, 500);
      }

      transactionId = asTransactionReferenceRecord(txByReferenceResult)?.id ?? null;
    }

    if (!transactionId) {
      const { error: recordMissingTransactionError } = await admin.rpc(
        "checkout_record_payment_webhook_event",
        {
          p_provider: "wompi",
          p_provider_event_id: eventId,
          p_transaction_id: null,
          p_signature_valid: signatureValid,
          p_processed: false,
          p_payload: payload,
        },
      );

      if (recordMissingTransactionError) {
        console.error("payments-webhook missing transaction event record failed", {
          provider: "wompi",
          provider_event_id: eventId,
          code: recordMissingTransactionError.code,
          message: recordMissingTransactionError.message,
        });
      }

      return jsonResponse({ ok: false, error: "missing_transaction_id" }, 400);
    }

    const { error: markError, data: markData } = await admin.rpc("mark_payment_transaction_status", {
      p_transaction_id: transactionId,
      p_provider_reference: providerReference,
      p_status: providerStatus,
      p_payload: payload,
    });

    const { error: recordEventError } = await admin.rpc(
      "checkout_record_payment_webhook_event",
      {
        p_provider: "wompi",
        p_provider_event_id: eventId,
        p_transaction_id: transactionId,
        p_signature_valid: signatureValid,
        p_processed: !markError,
        p_payload: payload,
      },
    );

    if (recordEventError) {
      console.error("payments-webhook event record failed", {
        provider: "wompi",
        provider_event_id: eventId,
        transaction_id: transactionId,
        code: recordEventError.code,
        message: recordEventError.message,
      });
    }

    if (markError) {
      return jsonResponse({ error: markError.message }, 400);
    }

    return jsonResponse({ ok: true, result: markData });
  } catch (error) {
    return jsonResponse(
      { error: error instanceof Error ? error.message : "unknown_error" },
      500,
    );
  }
});
