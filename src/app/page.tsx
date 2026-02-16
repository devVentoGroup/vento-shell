import Image from "next/image";
import { redirect } from "next/navigation";

import { createClient } from "@/lib/supabase/server";

type AppStatus = "active" | "soon";

type AppLink = {
  id: string;
  name: string;
  description: string;
  href: string;
  status: AppStatus;
  logo?: string;
};

const INTERNAL_APPS: AppLink[] = [
  {
    id: "viso",
    name: "VISO",
    description: "Gerencia, auditoria y configuracion.",
    href: "https://viso.ventogroup.co",
    status: "soon",
    logo: "/logos/viso.svg",
  },
  {
    id: "nexo",
    name: "NEXO",
    description: "Inventario (LOC/LPN) y logistica operativa.",
    href: "https://nexo.ventogroup.co",
    status: "active",
    logo: "/logos/nexo.svg",
  },
  {
    id: "fogo",
    name: "FOGO",
    description: "Recetario, produccion y lotes (FIFO).",
    href: "https://fogo.ventogroup.co",
    status: "soon",
    logo: "/logos/fogo.svg",
  },
  {
    id: "origo",
    name: "ORIGO",
    description: "Compras, proveedores y recepcion.",
    href: "https://origo.ventogroup.co",
    status: "active",
    logo: "/logos/origo.svg",
  },
  {
    id: "pulso",
    name: "PULSO",
    description: "Scanner de clientes y redenciones.",
    href: "https://pulso.ventogroup.co/",
    status: "active",
    logo: "/logos/pulso.svg",
  },
  {
    id: "aura",
    name: "AURA",
    description: "Marketing, contenidos y aprobaciones.",
    href: "https://aura.ventogroup.co",
    status: "soon",
    logo: "/logos/aura.svg",
  },
];

const APP_STYLES: Record<string, { accent: string; soft: string; text: string; ring: string }> = {
  viso: {
    accent: "bg-violet-500",
    soft: "bg-violet-50",
    text: "text-violet-700",
    ring: "group-hover:ring-violet-300/80",
  },
  nexo: {
    accent: "bg-amber-500",
    soft: "bg-amber-50",
    text: "text-amber-700",
    ring: "group-hover:ring-amber-300/80",
  },
  fogo: {
    accent: "bg-orange-500",
    soft: "bg-orange-50",
    text: "text-orange-700",
    ring: "group-hover:ring-orange-300/80",
  },
  origo: {
    accent: "bg-emerald-500",
    soft: "bg-emerald-50",
    text: "text-emerald-700",
    ring: "group-hover:ring-emerald-300/80",
  },
  pulso: {
    accent: "bg-cyan-500",
    soft: "bg-cyan-50",
    text: "text-cyan-700",
    ring: "group-hover:ring-cyan-300/80",
  },
  aura: {
    accent: "bg-rose-500",
    soft: "bg-rose-50",
    text: "text-rose-700",
    ring: "group-hover:ring-rose-300/80",
  },
};

function StatusPill({ status, accentClass }: { status: AppStatus; accentClass: string }) {
  if (status === "active") {
    return (
      <span
        className={`inline-flex items-center rounded-full border border-zinc-200 bg-white px-2.5 py-1 text-xs font-semibold ${accentClass}`}
      >
        Activo
      </span>
    );
  }

  return (
    <span className="inline-flex items-center rounded-full border border-zinc-200 bg-zinc-100 px-2.5 py-1 text-xs font-semibold text-zinc-600">
      Proximamente
    </span>
  );
}

function AppCard({ app }: { app: AppLink }) {
  const isActive = app.status === "active";
  const style = APP_STYLES[app.id] ?? {
    accent: "bg-zinc-300",
    soft: "bg-zinc-50",
    text: "text-zinc-700",
    ring: "group-hover:ring-zinc-200",
  };

  return (
    <article
      className={`group relative overflow-hidden rounded-2xl border border-zinc-200 bg-white p-5 shadow-sm transition duration-150 hover:-translate-y-0.5 hover:shadow-lg ${style.ring} ring-1 ring-transparent`}
    >
      <div className="pointer-events-none absolute inset-0 bg-gradient-to-br from-white via-white to-zinc-50 opacity-0 transition duration-150 group-hover:opacity-100" />

      <div className="relative flex items-start justify-between gap-3">
        <div>
          <h3 className="text-base font-semibold tracking-tight text-zinc-900">{app.name}</h3>
          <p className="mt-1 text-sm leading-6 text-zinc-600">{app.description}</p>
        </div>
        <div className="flex items-center gap-2">
          {app.logo ? (
            <span className={`flex h-10 w-10 items-center justify-center rounded-xl border border-zinc-200 ${style.soft}`}>
              <Image src={app.logo} alt={`${app.name} logo`} width={22} height={22} />
            </span>
          ) : null}
          <StatusPill status={app.status} accentClass={style.text} />
        </div>
      </div>

      <div className="relative mt-5 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <span className={`h-1.5 w-14 rounded-full ${style.accent} transition-all duration-150 group-hover:w-20`} />
          <span className="text-xs text-zinc-500">{isActive ? "Disponible hoy" : "En preparacion"}</span>
        </div>

        {isActive ? (
          <a
            href={app.href}
            className="inline-flex items-center justify-center rounded-xl bg-zinc-900 px-4 py-2 text-sm font-semibold text-white transition hover:bg-zinc-800"
          >
            Abrir
          </a>
        ) : (
          <button
            type="button"
            disabled
            className="inline-flex cursor-not-allowed items-center justify-center rounded-xl bg-zinc-100 px-4 py-2 text-sm font-semibold text-zinc-500"
            aria-disabled="true"
          >
            Proximamente
          </button>
        )}
      </div>
    </article>
  );
}

export default async function Home() {
  const supabase = await createClient();
  const { data: userRes } = await supabase.auth.getUser();
  if (!userRes.user) {
    redirect("/login?returnTo=/");
  }

  const activeCount = INTERNAL_APPS.filter((app) => app.status === "active").length;
  const soonCount = INTERNAL_APPS.filter((app) => app.status === "soon").length;

  return (
    <div className="relative min-h-screen bg-zinc-50 text-zinc-900">
      <div className="pointer-events-none absolute inset-0">
        <div className="absolute left-[-120px] top-[-100px] h-[360px] w-[360px] rounded-full bg-amber-200/40 blur-3xl" />
        <div className="absolute right-[-80px] top-[80px] h-[320px] w-[320px] rounded-full bg-cyan-200/35 blur-3xl" />
        <div className="absolute bottom-[-120px] left-1/3 h-[320px] w-[320px] rounded-full bg-violet-200/30 blur-3xl" />
      </div>

      <header className="relative border-b border-zinc-200/80 bg-white/90 backdrop-blur">
        <div className="mx-auto flex w-full max-w-6xl items-center justify-between px-6 py-5">
          <div className="flex items-baseline gap-3">
            <div className="text-lg font-semibold tracking-tight">Vento OS</div>
            <div className="text-sm text-zinc-500">Workspace</div>
          </div>
          <div className="text-sm text-zinc-500">ventogroup.co</div>
        </div>
      </header>

      <main className="relative mx-auto w-full max-w-6xl px-6 py-10">
        <section className="mb-8 rounded-3xl border border-zinc-200 bg-white/85 p-6 shadow-sm backdrop-blur">
          <div className="flex flex-col gap-6 lg:flex-row lg:items-end lg:justify-between">
            <div>
              <div className="inline-flex items-center gap-2 rounded-full border border-zinc-200 bg-zinc-50 px-3 py-1 text-xs font-semibold uppercase tracking-wide text-zinc-600">
                Hub operativo
              </div>
              <h1 className="mt-4 text-3xl font-semibold tracking-tight">Centro de aplicaciones</h1>
              <p className="mt-2 max-w-2xl text-base leading-7 text-zinc-600">
                Accede a los modulos de Vento Group. Este hub prioriza acceso rapido, control por rol y continuidad
                operativa.
              </p>
            </div>

            <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
              <div className="rounded-2xl border border-zinc-200 bg-white px-4 py-3">
                <div className="text-xs font-semibold uppercase tracking-wide text-zinc-500">Activas</div>
                <div className="mt-1 text-2xl font-semibold text-zinc-900">{activeCount}</div>
              </div>
              <div className="rounded-2xl border border-zinc-200 bg-white px-4 py-3">
                <div className="text-xs font-semibold uppercase tracking-wide text-zinc-500">Proximas</div>
                <div className="mt-1 text-2xl font-semibold text-zinc-900">{soonCount}</div>
              </div>
              <div className="rounded-2xl border border-zinc-200 bg-white px-4 py-3 col-span-2 sm:col-span-1">
                <div className="text-xs font-semibold uppercase tracking-wide text-zinc-500">Total apps</div>
                <div className="mt-1 text-2xl font-semibold text-zinc-900">{INTERNAL_APPS.length}</div>
              </div>
            </div>
          </div>
        </section>

        <section className="mb-12">
          <div className="mb-4 flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between">
            <h2 className="text-lg font-semibold tracking-tight">Operacion interna</h2>
            <div className="text-sm text-zinc-500">VISO · NEXO · FOGO · ORIGO · PULSO · AURA</div>
          </div>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {INTERNAL_APPS.map((app) => (
              <AppCard key={app.id} app={app} />
            ))}
          </div>
        </section>

        <footer className="mt-12 border-t border-zinc-200 pt-6 text-sm text-zinc-500">
          <div className="flex flex-col gap-1 sm:flex-row sm:items-center sm:justify-between">
            <div>Vento OS · Hub</div>
            <div>Launcher operativo</div>
          </div>
        </footer>
      </main>
    </div>
  );
}
