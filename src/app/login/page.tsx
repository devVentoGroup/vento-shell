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
    <div className="relative min-h-screen bg-white text-zinc-900">
      <div className="pointer-events-none absolute inset-0">
        <div className="absolute -left-24 top-16 h-56 w-56 rounded-full bg-amber-100/60 blur-3xl" />
        <div className="absolute right-0 top-0 h-72 w-72 rounded-full bg-zinc-100/80 blur-3xl" />
        <div className="absolute bottom-0 left-1/2 h-56 w-56 -translate-x-1/2 rounded-full bg-amber-50 blur-3xl" />
      </div>

      <div className="relative mx-auto flex w-full max-w-6xl flex-col gap-10 px-6 py-12 lg:flex-row lg:items-center">
        <div className="flex-1">
          <div className="text-sm font-semibold tracking-wide text-zinc-500">Vento OS</div>
          <h1 className="mt-3 text-4xl font-semibold tracking-tight text-zinc-900 lg:text-5xl">
            Login
          </h1>
          <p className="mt-4 max-w-xl text-base leading-7 text-zinc-600">
            Acceso unico para todas las aplicaciones de Vento Group. Mantente conectado con un
            solo perfil y entra directo a tu flujo diario.
          </p>

          <div className="mt-8 grid gap-4 text-sm text-zinc-600 sm:grid-cols-2">
            <div className="rounded-2xl border border-zinc-200 bg-white/80 p-4 shadow-sm">
              <div className="text-xs font-semibold uppercase tracking-wide text-zinc-500">
                Seguridad
              </div>
              <div className="mt-2 text-zinc-700">SSO unificado y sesiones controladas.</div>
            </div>
            <div className="rounded-2xl border border-zinc-200 bg-white/80 p-4 shadow-sm">
              <div className="text-xs font-semibold uppercase tracking-wide text-zinc-500">
                Acceso rapido
              </div>
              <div className="mt-2 text-zinc-700">Entra al Hub y sigue a tu app.</div>
            </div>
          </div>
        </div>

        <div className="w-full max-w-md">
          <LoginForm returnTo={returnTo} defaultEmail={defaultEmail || undefined} />
        </div>
      </div>
    </div>
  );
}
