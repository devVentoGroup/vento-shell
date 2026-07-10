import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "jsr:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

type CreateIntentPayload = {
  transaction_id?: string;
};

type JsonBody = Record<string, unknown>;

type PaymentTransactionRecord = {
  id: string;
  user_id: string;
  provider: string;
  idempotency_key: string;
  amount_minor: number | string;
  currency: string;
  status: string;
  order_id: string | null;
};

type UpdatedTransactionRecord = {
  id: string;
};

type FailureStatus = "error" | "cancelled";

type AdminClient = ReturnType<typeof createClient>;

function jsonResponse(body: JsonBody, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

async function sha256Hex(value: string) {
  const encoded = new TextEncoder().encode(value);
  const digest = await crypto.subtle.digest("SHA-256", encoded);

  return Array.from(new Uint8Array(digest))
    .map((byte) => byte.toString(16).padStart(2, "0"))
    .join("");
}

function asCleanString(value: unknown) {
  return String(value ?? "").trim();
}

function isValidWompiReference(reference: string) {
  return /^[A-Za-z0-9_-]{6,80}$/.test(reference);
}

function isValidUuid(value: string) {
  return /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(value);
}

function parseExpirationMinutes() {
  const raw = Number(Deno.env.get("WOMPI_CHECKOUT_EXPIRATION_MINUTES") ?? "20");

  if (!Number.isFinite(raw) || raw < 5 || raw > 120) {
    return 20;
  }

  return Math.floor(raw);
}


function buildPaymentReturnUrl({
  supabaseUrl,
  orderId,
  transactionId,
  reference,
  environment,
}: {
  supabaseUrl: string;
  orderId: string;
  transactionId: string;
  reference: string;
  environment: string;
}) {
  const configuredBaseUrl = asCleanString(Deno.env.get("WOMPI_RETURN_BASE_URL"));
  const baseUrl = configuredBaseUrl || `${supabaseUrl.replace(/\/+$/, "")}/functions/v1/payments-return`;
  const url = new URL(baseUrl);

  url.searchParams.set("orderId", orderId);
  url.searchParams.set("transactionId", transactionId);
  url.searchParams.set("reference", reference);
  url.searchParams.set("checkoutOpened", "true");
  url.searchParams.set("environment", environment);

  return url.toString();
}

function inferWompiEnvironmentFromPublicKey(publicKey: string) {
  if (publicKey.startsWith("pub_test_")) return "test";
  if (publicKey.startsWith("pub_prod_")) return "prod";
  return "unknown";
}

function inferWompiEnvironmentFromIntegritySecret(integritySecret: string) {
  if (integritySecret.startsWith("test_integrity_")) return "test";
  if (integritySecret.startsWith("prod_integrity_")) return "prod";
  return "unknown";
}

function asPaymentTransactionRecord(value: unknown) {
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    return null;
  }

  const record = value as Record<string, unknown>;

  return {
    id: asCleanString(record.id),
    user_id: asCleanString(record.user_id),
    provider: asCleanString(record.provider),
    idempotency_key: asCleanString(record.idempotency_key),
    amount_minor: record.amount_minor as number | string,
    currency: asCleanString(record.currency),
    status: asCleanString(record.status),
    order_id: asCleanString(record.order_id) || null,
  } satisfies PaymentTransactionRecord;
}

function asUpdatedTransactionRecord(value: unknown) {
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    return null;
  }

  const record = value as Record<string, unknown>;
  const id = asCleanString(record.id);

  return id ? { id } satisfies UpdatedTransactionRecord : null;
}

function getErrorDetail(error: unknown) {
  return error instanceof Error ? error.message : "unknown_error";
}

async function recordCheckoutFailure(
  admin: AdminClient,
  transactionId: string,
  reason: string,
  status: FailureStatus = "error",
  payload: Record<string, unknown> = {},
) {
  const { error } = await admin.rpc("checkout_fail_payment_transaction", {
    p_transaction_id: transactionId,
    p_status: status,
    p_reason: reason,
    p_source: "payments-create-intent",
    p_payload: payload,
  });

  if (error) {
    console.error("payments-create-intent compensation failed", {
      transaction_id: transactionId,
      reason,
      status,
      code: error.code,
      message: error.message,
    });
  }
}

async function buildCheckoutUrl({
  baseUrl,
  reference,
  amountMinor,
  currency,
  publicKey,
  integritySecret,
  redirectUrl,
  customerEmail,
  expirationTime,
}: {
  baseUrl: string;
  reference: string;
  amountMinor: number;
  currency: string;
  publicKey: string;
  integritySecret: string;
  redirectUrl: string | null;
  customerEmail: string | null;
  expirationTime: string;
}) {
  const url = new URL(baseUrl);

  const signature = await sha256Hex(
    `${reference}${amountMinor}${currency}${expirationTime}${integritySecret}`,
  );

  url.searchParams.set("public-key", publicKey);
  url.searchParams.set("currency", currency);
  url.searchParams.set("amount-in-cents", String(amountMinor));
  url.searchParams.set("reference", reference);
  url.searchParams.set("expiration-time", expirationTime);
  url.searchParams.set("signature:integrity", signature);

  if (redirectUrl) {
    url.searchParams.set("redirect-url", redirectUrl);
  }

  if (customerEmail) {
    url.searchParams.set("customer-data:email", customerEmail);
  }

  return url.toString();
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return jsonResponse({ error: "method_not_allowed" }, 405);
  }

  try {
    const authHeader = req.headers.get("authorization") ?? "";
    const bearer = authHeader.startsWith("Bearer ") ? authHeader.slice(7) : null;

    if (!bearer) {
      return jsonResponse({ error: "missing_bearer_token" }, 401);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const anonKey = Deno.env.get("SUPABASE_ANON_KEY");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !anonKey || !serviceRoleKey) {
      return jsonResponse({ error: "missing_supabase_env" }, 500);
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
      return jsonResponse({ error: "unauthorized" }, 401);
    }

    let body: CreateIntentPayload;

    try {
      body = await req.json();
    } catch {
      return jsonResponse({ error: "invalid_json_body" }, 400);
    }

    const transactionId = asCleanString(body?.transaction_id);

    if (!transactionId) {
      return jsonResponse({ error: "transaction_id_is_required" }, 400);
    }

    if (!isValidUuid(transactionId)) {
      return jsonResponse({ error: "invalid_transaction_id" }, 400);
    }

    const { data: txResult, error: txError } = await admin.rpc(
      "checkout_get_payment_transaction",
      { p_transaction_id: transactionId },
    );

    if (txError) {
      console.error("payments-create-intent transaction lookup failed", {
        transaction_id: transactionId,
        code: txError.code,
        message: txError.message,
      });
      return jsonResponse({ error: "transaction_lookup_failed" }, 500);
    }

    const tx = asPaymentTransactionRecord(txResult);

    if (!tx) {
      return jsonResponse({ error: "transaction_not_found" }, 404);
    }

    if (tx.user_id !== authData.user.id) {
      return jsonResponse({ error: "forbidden" }, 403);
    }

    if (tx.provider !== "wompi") {
      await recordCheckoutFailure(
        admin,
        tx.id,
        "unsupported_payment_provider",
        "error",
        { provider: tx.provider },
      );
      return jsonResponse({ error: "unsupported_payment_provider", provider: tx.provider }, 409);
    }

    if (tx.status !== "pending" && tx.status !== "requires_action") {
      return jsonResponse(
        {
          error: "transaction_not_payable",
          status: tx.status,
        },
        409,
      );
    }

    const reference = asCleanString(tx.idempotency_key);
    const currency = asCleanString(tx.currency).toUpperCase();
    const amountMinor = Number(tx.amount_minor);

    if (!tx.order_id) {
      await recordCheckoutFailure(admin, tx.id, "transaction_without_order", "error");
      return jsonResponse({ error: "transaction_without_order" }, 409);
    }

    if (!isValidWompiReference(reference)) {
      await recordCheckoutFailure(
        admin,
        tx.id,
        "invalid_wompi_reference",
        "error",
        { reference },
      );
      return jsonResponse({ error: "invalid_wompi_reference" }, 409);
    }

    if (currency !== "COP") {
      await recordCheckoutFailure(
        admin,
        tx.id,
        "unsupported_currency",
        "error",
        { currency },
      );
      return jsonResponse({ error: "unsupported_currency", currency }, 409);
    }

    if (!Number.isInteger(amountMinor) || amountMinor <= 0) {
      await recordCheckoutFailure(
        admin,
        tx.id,
        "invalid_amount_minor",
        "error",
        { amount_minor: tx.amount_minor },
      );
      return jsonResponse({ error: "invalid_amount_minor" }, 409);
    }

    const wompiPublicKey = asCleanString(Deno.env.get("WOMPI_PUBLIC_KEY"));
    const wompiIntegritySecret = asCleanString(Deno.env.get("WOMPI_INTEGRITY_SECRET"));
    const wompiCheckoutBaseUrl = asCleanString(
      Deno.env.get("WOMPI_CHECKOUT_BASE_URL") || "https://checkout.wompi.co/p/",
    );
    const expectedWompiEnvironment = asCleanString(Deno.env.get("WOMPI_ENVIRONMENT")) || null;

    if (!wompiPublicKey || !wompiIntegritySecret || !wompiCheckoutBaseUrl) {
      await recordCheckoutFailure(admin, tx.id, "missing_wompi_checkout_config", "error");
      return jsonResponse({ error: "missing_wompi_checkout_config" }, 500);
    }

    const publicKeyEnvironment = inferWompiEnvironmentFromPublicKey(wompiPublicKey);
    const integritySecretEnvironment = inferWompiEnvironmentFromIntegritySecret(wompiIntegritySecret);

    if (
      publicKeyEnvironment === "unknown" ||
      integritySecretEnvironment === "unknown" ||
      publicKeyEnvironment !== integritySecretEnvironment
    ) {
      await recordCheckoutFailure(
        admin,
        tx.id,
        "invalid_wompi_key_environment",
        "error",
        {
          public_key_environment: publicKeyEnvironment,
          integrity_secret_environment: integritySecretEnvironment,
        },
      );
      return jsonResponse({ error: "invalid_wompi_key_environment" }, 500);
    }

    if (
      expectedWompiEnvironment &&
      expectedWompiEnvironment !== publicKeyEnvironment
    ) {
      await recordCheckoutFailure(
        admin,
        tx.id,
        "wompi_environment_mismatch",
        "error",
        {
          expected_environment: expectedWompiEnvironment,
          actual_environment: publicKeyEnvironment,
        },
      );
      return jsonResponse({ error: "wompi_environment_mismatch" }, 500);
    }

    const expirationMinutes = parseExpirationMinutes();
    const expirationTime = new Date(Date.now() + expirationMinutes * 60 * 1000).toISOString();
    const wompiRedirectUrl = buildPaymentReturnUrl({
      supabaseUrl,
      orderId: tx.order_id,
      transactionId: tx.id,
      reference,
      environment: publicKeyEnvironment,
    });

    const rawRequest = {
      intent: "checkout",
      provider: tx.provider,
      generated_at: new Date().toISOString(),
      expires_at: expirationTime,
      environment: publicKeyEnvironment,
      checkout: {
        reference,
        amount_minor: amountMinor,
        currency,
        redirect_url: wompiRedirectUrl,
        expiration_time: expirationTime,
      },
    };

    let checkoutUrl: string;

    try {
      checkoutUrl = await buildCheckoutUrl({
        baseUrl: wompiCheckoutBaseUrl,
        reference,
        amountMinor,
        currency,
        publicKey: wompiPublicKey,
        integritySecret: wompiIntegritySecret,
        redirectUrl: wompiRedirectUrl,
        customerEmail: authData.user.email ?? null,
        expirationTime,
      });
    } catch (error) {
      await recordCheckoutFailure(
        admin,
        tx.id,
        "checkout_url_build_failed",
        "error",
        { detail: getErrorDetail(error) },
      );
      return jsonResponse({ error: "checkout_url_build_failed" }, 500);
    }

    const { data: updatedTxResult, error: updateError } = await admin.rpc(
      "checkout_mark_payment_transaction_requires_action",
      {
        p_transaction_id: tx.id,
        p_raw_request: rawRequest,
      },
    );

    if (updateError) {
      console.error("payments-create-intent transaction update failed", {
        transaction_id: tx.id,
        code: updateError.code,
        message: updateError.message,
      });

      await recordCheckoutFailure(
        admin,
        tx.id,
        "transaction_update_failed",
        "error",
        {
          code: updateError.code,
          message: updateError.message,
        },
      );

      return jsonResponse({ error: "transaction_update_failed" }, 500);
    }

    const updatedTx = asUpdatedTransactionRecord(updatedTxResult);

    if (!updatedTx) {
      return jsonResponse({ error: "transaction_update_conflict" }, 409);
    }

    return jsonResponse({
      ok: true,
      transaction_id: tx.id,
      order_id: tx.order_id,
      provider: tx.provider,
      amount_minor: amountMinor,
      currency,
      reference,
      checkout_url: checkoutUrl,
      expires_at: expirationTime,
      environment: publicKeyEnvironment,
      provider_payload: {
        reference,
        amount_in_cents: amountMinor,
        currency,
        redirect_url: wompiRedirectUrl,
        expiration_time: expirationTime,
      },
    });
  } catch (error) {
    return jsonResponse(
      {
        error: "unexpected_error",
        detail: getErrorDetail(error),
      },
      500,
    );
  }
});
