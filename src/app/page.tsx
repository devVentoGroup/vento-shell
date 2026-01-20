import Image from "next/image";

export default function Home() {
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
      description: "Gerencia, auditoría y configuración.",
      href: "https://viso.ventogroup.co",
      status: "soon",
      logo: "/logos/viso.svg",
    },
    {
      id: "nexo",
      name: "NEXO",
      description: "Inventario (LOC/LPN) y logística operativa.",
      href: "https://nexo.ventogroup.co",
      status: "active",
      logo: "/logos/nexo.svg",
    },
    {
      id: "fogo",
      name: "FOGO",
      description: "Recetario, producción y lotes (FIFO).",
      href: "https://fogo.ventogroup.co",
      status: "soon",
      logo: "/logos/fogo.svg",
    },
    {
      id: "origo",
      name: "ORIGO",
      description: "Compras, proveedores y recepción.",
      href: "https://origo.ventogroup.co",
      status: "soon",
      logo: "/logos/origo.svg",
    },
    {
      id: "pulso",
      name: "PULSO",
      description: "POS y operación de ventas.",
      href: "https://pulso.ventogroup.co",
      status: "soon",
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

  const DIRECT_APPS: AppLink[] = [];

  const APP_STYLES: Record<string, { accent: string; soft: string; text: string }> = {
    viso: {
      accent: "bg-violet-400",
      soft: "bg-violet-50",
      text: "text-violet-700",
    },
    nexo: {
      accent: "bg-amber-400",
      soft: "bg-amber-50",
      text: "text-amber-700",
    },
    fogo: {
      accent: "bg-orange-400",
      soft: "bg-orange-50",
      text: "text-orange-700",
    },
    origo: {
      accent: "bg-emerald-400",
      soft: "bg-emerald-50",
      text: "text-emerald-700",
    },
    pulso: {
      accent: "bg-cyan-400",
      soft: "bg-cyan-50",
      text: "text-cyan-700",
    },
    aura: {
      accent: "bg-rose-400",
      soft: "bg-rose-50",
      text: "text-rose-700",
    },
  };

  const StatusPill = ({
    status,
    accentClass,
  }: {
    status: AppStatus;
    accentClass: string;
  }) => {
    const label = status === "active" ? "Activo" : "Próximamente";
    const cls =
      status === "active"
        ? `bg-white ${accentClass} ring-1 ring-inset ring-zinc-200`
        : "bg-zinc-100 text-zinc-600 ring-zinc-200";

    return (
      <span className={`inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium ${cls}`}>
        {label}
      </span>
    );
  };

  const AppCard = ({ app }: { app: AppLink }) => {
    const isActive = app.status === "active";
    const style = APP_STYLES[app.id] ?? {
      accent: "bg-zinc-200",
      soft: "bg-zinc-50",
      text: "text-zinc-700",
    };

    return (
      <div className="rounded-2xl border border-zinc-200 bg-white p-5 shadow-sm transition hover:shadow-md">
        <div className="flex items-start justify-between gap-3">
          <div>
            <div className="text-base font-semibold text-zinc-900">{app.name}</div>
            <div className="mt-1 text-sm leading-6 text-zinc-600">{app.description}</div>
          </div>
          <div className="flex items-center gap-2">
            {app.logo ? (
              <span
                className={`flex h-9 w-9 items-center justify-center rounded-xl border border-zinc-200 ${style.soft}`}
              >
                <Image src={app.logo} alt={`${app.name} logo`} width={20} height={20} />
              </span>
            ) : null}
            <StatusPill status={app.status} accentClass={style.text} />
          </div>
        </div>

        <div className="mt-4 flex items-center justify-between">
          <div className={`h-1 w-12 rounded-full ${style.accent}`} />
          {isActive ? (
            <a
              href={app.href}
              className="inline-flex items-center justify-center rounded-xl bg-zinc-900 px-4 py-2 text-sm font-semibold text-white hover:bg-zinc-800"
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
              Próximamente
            </button>
          )}
        </div>
      </div>
    );
  };

  return (
    <div className="relative min-h-screen bg-white text-zinc-900">
      <div className="pointer-events-none absolute inset-0">
        <div className="absolute left-0 top-0 h-64 w-64 rounded-full bg-zinc-100 blur-3xl" />
        <div className="absolute right-0 top-10 h-72 w-72 rounded-full bg-amber-50 blur-3xl" />
      </div>
      {/* Top bar */}
      <header className="border-b border-zinc-200 bg-white">
        <div className="mx-auto flex w-full max-w-6xl items-center justify-between px-6 py-5">
          <div className="flex items-baseline gap-3">
            <div className="text-lg font-semibold tracking-tight">Vento OS</div>
            <div className="text-sm text-zinc-500">Workspace</div>
          </div>

          <div className="text-sm text-zinc-500">ventogroup.co</div>
        </div>
      </header>

      <main className="relative mx-auto w-full max-w-6xl px-6 py-10">
        {/* Hero */}
        <section className="mb-10">
          <div className="inline-flex items-center gap-2 rounded-full border border-zinc-200 bg-white px-3 py-1 text-xs font-semibold uppercase tracking-wide text-zinc-500">
            Hub operativo
          </div>
          <h1 className="mt-4 text-3xl font-semibold tracking-tight">Centro de aplicaciones</h1>
          <p className="mt-2 max-w-2xl text-base leading-7 text-zinc-600">
            Accede a los módulos de Vento Group. Este Hub es un launcher: cada aplicación vive independiente
            para mantener el sistema estable y escalable.
          </p>
        </section>

        {/* Internal apps */}
        <section className="mb-12">
          <div className="mb-4 flex items-center justify-between">
            <h2 className="text-lg font-semibold">Operación interna</h2>
            <div className="text-sm text-zinc-500">VISO · NEXO · FOGO · ORIGO · PULSO · AURA</div>
          </div>

          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {INTERNAL_APPS.map((app) => (
              <AppCard key={app.id} app={app} />
            ))}
          </div>
        </section>

        {/* Direct apps (removido por ahora) */}

        <footer className="mt-12 border-t border-zinc-200 pt-6 text-sm text-zinc-500">
          <div className="flex flex-col gap-1 sm:flex-row sm:items-center sm:justify-between">
            <div>Vento OS · Hub</div>
            <div>Versión MVP · Launcher</div>
          </div>
        </footer>
      </main>
    </div>
  );
}
