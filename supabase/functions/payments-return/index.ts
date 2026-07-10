import "jsr:@supabase/functions-js/edge-runtime.d.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

function escapeHtml(value: string) {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function getCleanParam(url: URL, ...names: string[]) {
  for (const name of names) {
    const value = url.searchParams.get(name);
    if (value && value.trim()) return value.trim();
  }

  return "";
}

function buildDeepLink(url: URL) {
  const appScheme = (Deno.env.get("WOMPI_RETURN_APP_SCHEME") || "vento-pass").trim();
  const orderId = getCleanParam(url, "orderId", "order_id");
  const transactionId = getCleanParam(url, "transactionId", "transaction_id");
  const reference = getCleanParam(url, "reference");
  const checkoutOpened = getCleanParam(url, "checkoutOpened", "checkout_opened") || "true";

  const deepLink = new URL(`${appScheme}://payment-return`);

  if (orderId) deepLink.searchParams.set("orderId", orderId);
  if (transactionId) deepLink.searchParams.set("transactionId", transactionId);
  if (reference) deepLink.searchParams.set("reference", reference);
  deepLink.searchParams.set("checkoutOpened", checkoutOpened);

  return deepLink.toString();
}

function htmlResponse(body: string, status = 200) {
  return new Response(body, {
    status,
    headers: {
      ...corsHeaders,
      "Content-Type": "text/html; charset=utf-8",
      "Cache-Control": "no-store",
    },
  });
}

Deno.serve((req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  const url = new URL(req.url);
  const deepLink = buildDeepLink(url);
  const escapedDeepLink = escapeHtml(deepLink);

  return htmlResponse(`<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Volviendo a Vento Pass</title>
  <style>
    :root {
      color-scheme: light;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      background: #fffbeb;
      color: #0f172a;
    }
    body {
      min-height: 100vh;
      margin: 0;
      display: grid;
      place-items: center;
      padding: 24px;
      box-sizing: border-box;
    }
    main {
      width: 100%;
      max-width: 420px;
      background: #ffffff;
      border: 1px solid rgba(15, 23, 42, 0.08);
      border-radius: 26px;
      padding: 24px;
      box-sizing: border-box;
      text-align: center;
    }
    h1 {
      margin: 0 0 10px;
      font-size: 24px;
      line-height: 1.15;
    }
    p {
      margin: 0 0 18px;
      color: #64748b;
      font-size: 14px;
      line-height: 1.5;
      font-weight: 600;
    }
    a {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      min-height: 48px;
      padding: 0 18px;
      border-radius: 16px;
      background: #67e8f9;
      color: #0f172a;
      text-decoration: none;
      font-weight: 900;
    }
    .small {
      margin-top: 16px;
      font-size: 12px;
      color: #94a3b8;
    }
  </style>
</head>
<body>
  <main>
    <h1>Volviendo a Vento Pass</h1>
    <p>Estamos abriendo la app para actualizar el estado de tu pedido.</p>
    <a href="${escapedDeepLink}">Abrir Vento Pass</a>
    <p class="small">Si la app no abre sola, toca el botón.</p>
  </main>
  <script>
    window.setTimeout(function () {
      window.location.href = ${JSON.stringify(deepLink)};
    }, 250);
  </script>
</body>
</html>`);
});
