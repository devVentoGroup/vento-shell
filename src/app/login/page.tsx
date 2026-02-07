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
    <div className="relative min-h-screen overflow-hidden bg-slate-50 text-slate-900">
      {/* Fondo con más profundidad: gradiente + formas suaves */}
      <div className="pointer-events-none absolute inset-0">
        <div className="absolute -left-40 -top-40 h-[28rem] w-[28rem] rounded-full bg-amber-200/40 blur-[100px]" />
        <div className="absolute -right-32 top-1/4 h-80 w-80 rounded-full bg-slate-200/50 blur-[80px]" />
        <div className="absolute bottom-0 left-1/2 h-72 w-[32rem] -translate-x-1/2 rounded-full bg-amber-100/50 blur-[90px]" />
        <div className="absolute right-1/4 top-1/2 h-64 w-64 rounded-full bg-sky-100/30 blur-[70px]" />
        {/* Líneas suaves decorativas */}
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#94a3b8_0.5px,transparent_0.5px),linear-gradient(to_bottom,#94a3b8_0.5px,transparent_0.5px)] bg-[size:4rem_4rem] opacity-[0.04]" />
      </div>

      <div className="relative mx-auto flex w-full max-w-6xl flex-col gap-12 px-6 py-14 lg:flex-row lg:items-center lg:gap-16">
        <div className="flex-1">
          <div className="flex items-center gap-2">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-slate-900 text-white shadow-lg shadow-slate-900/20">
              <span className="text-lg font-bold tracking-tight">V</span>
            </div>
            <span className="text-sm font-semibold tracking-wide text-slate-500">Vento OS</span>
          </div>
          <h1 className="mt-8 text-4xl font-bold tracking-tight text-slate-900 lg:text-5xl">
            Login
          </h1>
          <p className="mt-4 max-w-lg text-base leading-7 text-slate-600">
            Acceso único para todas las aplicaciones de Vento Group. Mantente conectado con un
            solo perfil y entra directo a tu flujo diario.
          </p>

          <div className="mt-10 grid gap-4 sm:grid-cols-2">
            <div className="rounded-2xl border border-slate-200/80 bg-white/90 p-5 shadow-lg shadow-slate-200/50 backdrop-blur-sm">
              <div className="text-xs font-semibold uppercase tracking-wider text-slate-500">
                Seguridad
              </div>
              <p className="mt-2 text-sm leading-relaxed text-slate-700">
                SSO unificado y sesiones controladas.
              </p>
            </div>
            <div className="rounded-2xl border border-slate-200/80 bg-white/90 p-5 shadow-lg shadow-slate-200/50 backdrop-blur-sm">
              <div className="text-xs font-semibold uppercase tracking-wider text-slate-500">
                Acceso rápido
              </div>
              <p className="mt-2 text-sm leading-relaxed text-slate-700">
                Entra al Hub y sigue a tu app.
              </p>
            </div>
          </div>
        </div>

        <div className="w-full max-w-md shrink-0">
          <LoginForm returnTo={returnTo} defaultEmail={defaultEmail || undefined} />
        </div>
      </div>
    </div>
  );
}
