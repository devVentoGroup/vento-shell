import "jsr:@supabase/functions-js/edge-runtime.d.ts"
import { createClient } from "jsr:@supabase/supabase-js@2"

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
}

type Action = "request_full_deletion" | "request_data_cleanup"

type RequestBody = {
  action?: Action
  confirmation?: {
    otp_verified?: boolean
    phrase_verified?: boolean
  }
}

const json = (body: Record<string, unknown>, status = 200) =>
  new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  })

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders })
  if (req.method !== "POST") return json({ success: false, error: "Method not allowed", code: "method_not_allowed" }, 405)

  const supabaseUrl = Deno.env.get("SUPABASE_URL")
  const supabaseAnonKey = Deno.env.get("SUPABASE_ANON_KEY")
  const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")
  if (!supabaseUrl || !supabaseAnonKey || !serviceRoleKey) {
    return json({ success: false, error: "Missing Supabase env vars", code: "server_misconfigured" }, 500)
  }

  const authHeader = req.headers.get("Authorization") ?? ""
  const bearer = authHeader.startsWith("Bearer ") ? authHeader.slice(7) : null
  if (!bearer) return json({ success: false, error: "Missing auth token", code: "unauthorized" }, 401)

  const userClient = createClient(supabaseUrl, supabaseAnonKey, {
    global: { headers: { Authorization: `Bearer ${bearer}` } },
    auth: { persistSession: false, autoRefreshToken: false },
  })
  const adminClient = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  })

  const { data: authData, error: authError } = await userClient.auth.getUser()
  if (authError || !authData?.user) {
    return json({ success: false, error: "Unauthorized", code: "unauthorized" }, 401)
  }

  const user = authData.user

  let body: RequestBody
  try {
    body = (await req.json()) as RequestBody
  } catch {
    return json({ success: false, error: "Invalid JSON body", code: "invalid_body" }, 400)
  }

  const action = body.action
  if (!action) return json({ success: false, error: "Action is required", code: "action_required" }, 400)

  if (action === "request_full_deletion") {
    const otpOk = body.confirmation?.otp_verified === true
    const phraseOk = body.confirmation?.phrase_verified === true
    if (!otpOk || !phraseOk) {
      return json(
        { success: false, error: "OTP y frase de confirmación son obligatorios", code: "confirmation_required" },
        400,
      )
    }

    const nowIso = new Date().toISOString()

    const { error: anonymizeError } = await adminClient.rpc("anonymize_user_personal_data", {
      p_user_id: user.id,
    })

    if (anonymizeError) {
      return json({ success: false, error: "No se pudo anonimizar la cuenta", code: "anonymize_error" }, 500)
    }

    const { data: inserted, error: insertError } = await adminClient
      .from("account_deletion_requests")
      .insert({
        user_id: user.id,
        email: user.email?.toLowerCase() ?? "",
        request_type: "full_account",
        requested_via: "in_app",
        status: "completed",
        requested_at: nowIso,
        completed_at: nowIso,
        execute_after: nowIso,
        confirmation: {
          otp_verified: true,
          phrase_verified: true,
          immediate_execution: true,
        },
      })
      .select("id, status, completed_at")
      .single()

    if (insertError) {
      return json({ success: false, error: "No se pudo auditar la eliminación", code: "audit_insert_error" }, 500)
    }

    const { error: deleteAuthError } = await adminClient.auth.admin.deleteUser(user.id)
    if (deleteAuthError) {
      return json({ success: false, error: "Cuenta anonimizada, pero no se pudo cerrar acceso", code: "auth_delete_error" }, 500)
    }

    return json({
      success: true,
      request_id: inserted.id,
      status: inserted.status,
      completed_at: inserted.completed_at,
      deleted_now: true,
      should_sign_out: true,
    })
  }

  if (action === "request_data_cleanup") {
    const { error: userUpdateError } = await adminClient
      .from("users")
      .update({
        marketing_opt_in: false,
        updated_at: new Date().toISOString(),
      })
      .eq("id", user.id)

    if (userUpdateError) {
      return json({ success: false, error: "No se pudo limpiar preferencias de marketing", code: "cleanup_update_error" }, 500)
    }

    const { error: favoritesError } = await adminClient
      .schema("pass")
      .from("user_favorites")
      .delete()
      .eq("user_id", user.id)

    if (favoritesError) {
      return json({ success: false, error: "No se pudieron limpiar favoritos", code: "cleanup_favorites_error" }, 500)
    }

    const { data: inserted, error: insertError } = await adminClient
      .from("account_deletion_requests")
      .insert({
        user_id: user.id,
        email: user.email?.toLowerCase() ?? "",
        request_type: "data_cleanup",
        requested_via: "in_app",
        status: "completed",
        requested_at: new Date().toISOString(),
        completed_at: new Date().toISOString(),
        confirmation: { source: "user_request" },
      })
      .select("id, status")
      .single()

    if (insertError) {
      return json({ success: false, error: "Limpieza aplicada, pero no se pudo auditar la solicitud", code: "audit_insert_error" }, 500)
    }

    return json({ success: true, request_id: inserted.id, status: inserted.status })
  }

  return json({ success: false, error: "Unsupported action", code: "unsupported_action" }, 400)
})
