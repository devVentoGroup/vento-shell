import { redirect } from "next/navigation";

import { LoginForm } from "@/features/auth/login-form";
import { createClient } from "@/lib/supabase/server";

type SearchParams = { returnTo?: string; email?: string };

function safeReturnTo(value?: string) {
  const v = (value ?? "").trim();
  if (!v) return "/";
  if (v.startsWith("http://") || v.startsWith("https://")) return v;
  if (!v.startsWith("/")) return "/";
  return v;
}

export default async function LoginPage({
  searchParams,
}: {
  searchParams?: Promise<SearchParams>;
}) {
  const sp = (await searchParams) ?? {};
  const returnTo = safeReturnTo(sp.returnTo);
  const defaultEmail = sp.email ? decodeURIComponent(sp.email) : "";

  const supabase = await createClient();
  const { data: userRes } = await supabase.auth.getUser();
  if (userRes.user) {
    redirect(returnTo || "/");
  }

  return (
    <div className="mx-auto w-full max-w-5xl px-6 py-12">
      <div className="mb-8">
        <div className="text-sm font-semibold text-zinc-500">Vento OS</div>
        <h1 className="mt-2 text-3xl font-semibold tracking-tight text-zinc-900">Login</h1>
        <p className="mt-2 max-w-2xl text-sm text-zinc-600">
          Acceso unico para todas las aplicaciones de Vento Group.
        </p>
      </div>

      <LoginForm returnTo={returnTo} defaultEmail={defaultEmail || undefined} />
    </div>
  );
}
