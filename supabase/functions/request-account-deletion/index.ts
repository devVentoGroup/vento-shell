import "jsr:@supabase/functions-js/edge-runtime.d.ts"
import { createClient } from "jsr:@supabase/supabase-js@2"

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
}

function isValidEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders })
  }

  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "Method not allowed" }), {
      status: 405,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    })
  }

  try {
    const body = await req.json() as { email?: string; confirm?: boolean }
    const email = typeof body.email === "string" ? body.email.trim().toLowerCase() : ""
    const confirm = body.confirm === true

    if (!email || !isValidEmail(email)) {
      return new Response(
        JSON.stringify({ error: "Email inválido o faltante." }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      )
    }

    if (!confirm) {
      return new Response(
        JSON.stringify({ error: "Debes confirmar que deseas eliminar tu cuenta y datos." }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      )
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
    const supabase = createClient(supabaseUrl, supabaseServiceKey)

    const { error } = await supabase.from("account_deletion_requests").insert({
      email,
      status: "pending",
    })

    if (error) {
      console.error("account_deletion_requests insert error:", error)
      return new Response(
        JSON.stringify({ error: "No pudimos registrar la solicitud. Intenta más tarde." }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      )
    }

    return new Response(
      JSON.stringify({
        success: true,
        message: "Hemos recibido tu solicitud. Procesaremos la eliminación de tu cuenta y datos en un plazo de 30 días. Si tienes dudas, contáctanos.",
      }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    )
  } catch (e) {
    console.error("request-account-deletion error:", e)
    return new Response(
      JSON.stringify({ error: "Error interno. Intenta más tarde." }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    )
  }
})
