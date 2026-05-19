import "jsr:@supabase/functions-js/edge-runtime.d.ts"
import { createClient } from "jsr:@supabase/supabase-js@2"

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
}

const json = (body: Record<string, unknown>, status = 200) =>
  new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  })

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders })
  if (req.method !== "POST") return json({ success: false, error: "Method not allowed" }, 405)

  const supabaseUrl = Deno.env.get("SUPABASE_URL")
  const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")
  const workerSecret = Deno.env.get("ACCOUNT_DELETION_WORKER_SECRET")

  if (!supabaseUrl || !serviceRoleKey) {
    return json({ success: false, error: "Missing Supabase configuration" }, 500)
  }

  const authHeader = req.headers.get("Authorization") ?? ""
  const bearer = authHeader.startsWith("Bearer ") ? authHeader.slice(7) : null
  if (!workerSecret || bearer !== workerSecret) {
    return json({ success: false, error: "Unauthorized" }, 401)
  }

  const supabase = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  })

  const nowIso = new Date().toISOString()
  const { data: requests, error: fetchError } = await supabase
    .from("account_deletion_requests")
    .select("id, user_id")
    .eq("request_type", "full_account")
    .eq("status", "pending")
    .lte("execute_after", nowIso)
    .order("requested_at", { ascending: true })
    .limit(200)

  if (fetchError) {
    return json({ success: false, error: fetchError.message }, 500)
  }

  let processed = 0
  let failed = 0

  for (const request of requests ?? []) {
    const requestId = request.id as string
    const userId = request.user_id as string | null

    if (!userId) {
      await supabase
        .from("account_deletion_requests")
        .update({
          status: "failed",
          error_message: "Solicitud sin user_id",
        })
        .eq("id", requestId)
      failed += 1
      continue
    }

    await supabase
      .from("account_deletion_requests")
      .update({
        status: "processing",
        error_message: null,
      })
      .eq("id", requestId)

    try {
      const { error: anonymizeError } = await supabase.rpc("anonymize_user_personal_data", {
        p_user_id: userId,
      })
      if (anonymizeError) throw anonymizeError

      const { error: deleteAuthError } = await supabase.auth.admin.deleteUser(userId)
      if (deleteAuthError) throw deleteAuthError

      const { error: completeError } = await supabase
        .from("account_deletion_requests")
        .update({
          status: "completed",
          completed_at: new Date().toISOString(),
          error_message: null,
        })
        .eq("id", requestId)

      if (completeError) throw completeError
      processed += 1
    } catch (error) {
      await supabase
        .from("account_deletion_requests")
        .update({
          status: "failed",
          error_message: error instanceof Error ? error.message : "Unknown error",
        })
        .eq("id", requestId)
      failed += 1
    }
  }

  return json({ success: true, processed, failed, scanned: (requests ?? []).length })
})
