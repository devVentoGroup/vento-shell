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
      <div className="pointer-events-none absolute inset-0">
        <div className="absolute -left-28 -top-24 h-[28rem] w-[28rem] rounded-full bg-amber-200/40 blur-[95px]" />
        <div className="absolute -right-24 top-20 h-96 w-96 rounded-full bg-sky-200/30 blur-[90px]" />
        <div className="absolute bottom-[-120px] left-1/2 h-80 w-[34rem] -translate-x-1/2 rounded-full bg-violet-200/25 blur-[90px]" />
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#94a3b8_0.5px,transparent_0.5px),linear-gradient(to_bottom,#94a3b8_0.5px,transparent_0.5px)] bg-[size:3.5rem_3.5rem] opacity-[0.05]" />
      </div>

      <div className="relative mx-auto grid w-full max-w-6xl gap-10 px-6 py-14 lg:grid-cols-[1.1fr_0.9fr] lg:items-center">
        <section>
          <div className="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-white/85 px-3 py-1 text-xs font-semibold uppercase tracking-wide text-slate-600 backdrop-blur">
            Vento OS Access
          </div>

          <h1 className="mt-6 text-4xl font-bold tracking-tight text-slate-900 lg:text-5xl">
            Un solo acceso para todo el ecosistema
          </h1>

          <p className="mt-4 max-w-xl text-base leading-7 text-slate-600">
            Inicia sesion una vez y entra directo a tus modulos operativos. El acceso respeta tus permisos,
            sede activa y rol de trabajo.
          </p>

          <div className="mt-9 grid gap-4 sm:grid-cols-2">
            <article className="rounded-2xl border border-slate-200/80 bg-white/90 p-5 shadow-lg shadow-slate-200/40 backdrop-blur">
              <div className="text-xs font-semibold uppercase tracking-wide text-slate-500">Seguridad</div>
              <p className="mt-2 text-sm leading-relaxed text-slate-700">
                Sesion centralizada y control de acceso por permisos.
              </p>
            </article>
            <article className="rounded-2xl border border-slate-200/80 bg-white/90 p-5 shadow-lg shadow-slate-200/40 backdrop-blur">
              <div className="text-xs font-semibold uppercase tracking-wide text-slate-500">Continuidad</div>
              <p className="mt-2 text-sm leading-relaxed text-slate-700">
                Mismo usuario para Hub, Nexo, Origo y el resto de apps.
              </p>
            </article>
          </div>

          <div className="mt-8 inline-flex flex-wrap items-center gap-2 text-xs text-slate-500">
            <span className="rounded-full border border-slate-200 bg-white px-2.5 py-1">NEXO</span>
            <span className="rounded-full border border-slate-200 bg-white px-2.5 py-1">ORIGO</span>
            <span className="rounded-full border border-slate-200 bg-white px-2.5 py-1">PULSO</span>
            <span className="rounded-full border border-slate-200 bg-white px-2.5 py-1">FOGO</span>
            <span className="rounded-full border border-slate-200 bg-white px-2.5 py-1">AURA</span>
          </div>
        </section>

        <section className="w-full max-w-md justify-self-start lg:justify-self-end">
          <LoginForm returnTo={returnTo} defaultEmail={defaultEmail || undefined} />
        </section>
      </div>
    </div>
  );
}
