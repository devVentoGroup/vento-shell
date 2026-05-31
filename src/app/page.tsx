import Image from "next/image";
import Link from "next/link";
import { redirect } from "next/navigation";

import { createClient } from "@/lib/supabase/server";

type AppAccess = "enabled" | "disabled";

type AppLink = {
  id: string;
  name: string;
  shortName: string;
  description: string;
  operationalFocus: string;
  href: string;
  permissionCode: string;
  logo: string;
  accent: string;
  accentSoft: string;
  glow: string;
  gradient: string;
};

type ResolvedAppLink = AppLink & {
  access: AppAccess;
};

const INTERNAL_APPS: AppLink[] = [
  {
    id: "viso",
    name: "VISO",
    shortName: "Gerencia",
    description: "Dirección, auditoría, equipo, roles y visión ejecutiva del ecosistema.",
    operationalFocus: "Control gerencial",
    href: "https://viso.ventogroup.co",
    permissionCode: "viso.access",
    logo: "/logos/viso.svg",
    accent: "text-violet-700",
    accentSoft: "bg-violet-50 border-violet-100",
    glow: "shadow-violet-500/20",
    gradient: "from-violet-500 to-fuchsia-500",
  },
  {
    id: "nexo",
    name: "NEXO",
    shortName: "Inventario",
    description: "Inventario, stock, remisiones, ubicaciones y abastecimiento interno.",
    operationalFocus: "Logística operativa",
    href: "https://nexo.ventogroup.co",
    permissionCode: "nexo.access",
    logo: "/logos/nexo.svg",
    accent: "text-amber-700",
    accentSoft: "bg-amber-50 border-amber-100",
    glow: "shadow-amber-500/20",
    gradient: "from-amber-500 to-orange-500",
  },
  {
    id: "fogo",
    name: "FOGO",
    shortName: "Producción",
    description: "Recetario, preparaciones, lotes de producción y trazabilidad FIFO.",
    operationalFocus: "Cocina y producción",
    href: "https://fogo.ventogroup.co",
    permissionCode: "fogo.access",
    logo: "/logos/fogo.svg",
    accent: "text-orange-700",
    accentSoft: "bg-orange-50 border-orange-100",
    glow: "shadow-orange-500/20",
    gradient: "from-orange-500 to-red-500",
  },
  {
    id: "origo",
    name: "ORIGO",
    shortName: "Compras",
    description: "Órdenes de compra, proveedores, recepción y abastecimiento externo.",
    operationalFocus: "Compras y proveedores",
    href: "https://origo.ventogroup.co",
    permissionCode: "origo.access",
    logo: "/logos/origo.svg",
    accent: "text-emerald-700",
    accentSoft: "bg-emerald-50 border-emerald-100",
    glow: "shadow-emerald-500/20",
    gradient: "from-emerald-500 to-teal-500",
  },
  {
    id: "pulso",
    name: "PULSO",
    shortName: "POS",
    description: "Clientes, redenciones, salón, pedidos y operación comercial en punto de venta.",
    operationalFocus: "Ventas y experiencia",
    href: "https://pulso.ventogroup.co",
    permissionCode: "pulso.access",
    logo: "/logos/pulso.svg",
    accent: "text-cyan-700",
    accentSoft: "bg-cyan-50 border-cyan-100",
    glow: "shadow-cyan-500/20",
    gradient: "from-cyan-500 to-sky-500",
  },
];

function splitPermissionCode(permissionCode: string) {
  const normalized = permissionCode.trim();
  const dotIndex = normalized.indexOf(".");

  if (dotIndex === -1) {
    return {
      appId: normalized,
      code: "access",
    };
  }

  return {
    appId: normalized.slice(0, dotIndex),
    code: normalized.slice(dotIndex + 1),
  };
}

async function resolveAccess(app: AppLink): Promise<AppAccess> {
  const supabase = await createClient();

  const { data: fullCodeResult, error: fullCodeError } = await supabase.rpc(
    "has_permission",
    {
      p_permission_code: app.permissionCode,
      p_site_id: null,
      p_area_id: null,
    }
  );

  if (!fullCodeError) {
    return fullCodeResult ? "enabled" : "disabled";
  }

  const { appId, code } = splitPermissionCode(app.permissionCode);

  const { data: splitCodeResult, error: splitCodeError } = await supabase.rpc(
    "has_permission",
    {
      p_app_id: appId,
      p_code: code,
      p_site_id: null,
      p_area_id: null,
    }
  );

  if (splitCodeError) return "disabled";

  return splitCodeResult ? "enabled" : "disabled";
}

async function resolveApps(): Promise<ResolvedAppLink[]> {
  const accessResults = await Promise.all(INTERNAL_APPS.map(resolveAccess));

  return INTERNAL_APPS.map((app, index) => ({
    ...app,
    access: accessResults[index],
  }));
}

function initialsFromEmail(email: string) {
  if (!email) return "US";

  return (
    email
      .split("@")[0]
      .split(/[._-]+/)
      .filter(Boolean)
      .slice(0, 2)
      .map((part) => part[0]?.toUpperCase() ?? "")
      .join("") || "US"
  );
}

function AccessPill({ access }: { access: AppAccess }) {
  if (access === "enabled") {
    return (
      <span className="inline-flex items-center gap-1.5 rounded-full border border-emerald-200 bg-emerald-50 px-2.5 py-1 text-xs font-semibold text-emerald-700">
        <span className="h-1.5 w-1.5 rounded-full bg-emerald-500" />
        Disponible
      </span>
    );
  }

  return (
    <span className="inline-flex items-center gap-1.5 rounded-full border border-zinc-200 bg-zinc-100 px-2.5 py-1 text-xs font-semibold text-zinc-500">
      <span className="h-1.5 w-1.5 rounded-full bg-zinc-400" />
      Sin acceso
    </span>
  );
}

function AppCard({ app, index }: { app: ResolvedAppLink; index: number }) {
  const isEnabled = app.access === "enabled";

  return (
    <article
      className={`group relative overflow-hidden rounded-[28px] border border-white/80 bg-white/82 p-5 shadow-xl shadow-zinc-900/5 ring-1 ring-zinc-900/5 backdrop-blur-xl transition duration-200 hover:-translate-y-1 hover:shadow-2xl ${app.glow}`}
    >
      <div
        className={`pointer-events-none absolute -right-16 -top-20 h-44 w-44 rounded-full bg-gradient-to-br ${app.gradient} opacity-10 blur-2xl transition duration-200 group-hover:opacity-20`}
      />
      <div className="pointer-events-none absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-white to-transparent" />

      <div className="relative flex items-start justify-between gap-4">
        <div className={`flex h-14 w-14 items-center justify-center rounded-2xl border ${app.accentSoft} shadow-sm`}>
          <Image src={app.logo} alt={`${app.name} logo`} width={34} height={34} />
        </div>

        <div className="flex flex-col items-end gap-2">
          <AccessPill access={app.access} />
          <span className="text-xs font-semibold text-zinc-400">
            0{index + 1}
          </span>
        </div>
      </div>

      <div className="relative mt-6">
        <div className="flex items-end justify-between gap-3">
          <div>
            <h3 className="text-2xl font-semibold tracking-tight text-zinc-950">
              {app.name}
            </h3>
            <p className={`mt-1 text-sm font-semibold ${app.accent}`}>
              {app.shortName}
            </p>
          </div>
        </div>

        <p className="mt-4 min-h-[72px] text-sm leading-6 text-zinc-600">
          {app.description}
        </p>

        <div className="mt-5 rounded-2xl border border-zinc-200/80 bg-zinc-50/70 px-4 py-3">
          <div className="text-[11px] font-semibold uppercase tracking-[0.16em] text-zinc-400">
            Enfoque operativo
          </div>
          <div className="mt-1 text-sm font-semibold text-zinc-800">
            {app.operationalFocus}
          </div>
        </div>
      </div>

      <div className="relative mt-6 flex items-center justify-between gap-3">
        <span
          className={`h-1.5 flex-1 rounded-full bg-gradient-to-r ${app.gradient} ${
            isEnabled ? "" : "opacity-25 grayscale"
          }`}
        />

        {isEnabled ? (
          <a
            href={app.href}
            className="inline-flex h-11 items-center justify-center rounded-2xl bg-zinc-950 px-5 text-sm font-semibold text-white shadow-lg shadow-zinc-900/15 transition hover:-translate-y-0.5 hover:bg-zinc-800"
          >
            Abrir app
          </a>
        ) : (
          <button
            type="button"
            disabled
            className="inline-flex h-11 cursor-not-allowed items-center justify-center rounded-2xl bg-zinc-100 px-5 text-sm font-semibold text-zinc-400"
            aria-disabled="true"
          >
            Bloqueada
          </button>
        )}
      </div>
    </article>
  );
}

function MiniAppLogo({ app }: { app: ResolvedAppLink }) {
  return (
    <div
      className={`flex h-11 w-11 items-center justify-center rounded-2xl border bg-white/80 shadow-sm ${
        app.access === "enabled" ? "border-white" : "border-zinc-200 opacity-45 grayscale"
      }`}
      title={`${app.name} · ${app.access === "enabled" ? "Disponible" : "Sin acceso"}`}
    >
      <Image src={app.logo} alt={`${app.name} logo`} width={26} height={26} />
    </div>
  );
}

export default async function Home() {
  const supabase = await createClient();
  const { data: userRes } = await supabase.auth.getUser();
  const user = userRes.user;

  if (!user) {
    redirect("/login?returnTo=/");
  }

  async function signOutAction() {
    "use server";

    const supabase = await createClient();
    await supabase.auth.signOut();
    redirect("/login?returnTo=/");
  }

  const apps = await resolveApps();
  const accessibleApps = apps.filter((app) => app.access === "enabled");
  const blockedApps = apps.filter((app) => app.access === "disabled");

  const userEmail = user.email ?? "";
  const userInitials = initialsFromEmail(userEmail);

  return (
    <div className="relative min-h-screen overflow-hidden bg-[#F5F3EE] text-zinc-950">
      <div className="pointer-events-none absolute inset-0">
        <div className="absolute left-[-18rem] top-[-18rem] h-[44rem] w-[44rem] rounded-full bg-amber-200/45 blur-3xl" />
        <div className="absolute right-[-16rem] top-[-12rem] h-[42rem] w-[42rem] rounded-full bg-cyan-200/40 blur-3xl" />
        <div className="absolute bottom-[-18rem] left-[28%] h-[38rem] w-[38rem] rounded-full bg-violet-200/30 blur-3xl" />
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_0%,rgba(255,255,255,0.9),transparent_42%)]" />
      </div>

      <header className="relative z-10 border-b border-white/70 bg-white/65 backdrop-blur-2xl">
        <div className="mx-auto flex w-full max-w-7xl items-center justify-between px-5 py-4 sm:px-8">
          <div className="flex items-center gap-3">
            <div className="flex h-11 w-11 items-center justify-center rounded-2xl bg-zinc-950 text-sm font-black text-white shadow-xl shadow-zinc-900/20">
              V
            </div>

            <div>
              <div className="text-base font-semibold tracking-tight text-zinc-950">
                Vento OS
              </div>
              <div className="text-xs font-medium text-zinc-500">
                Workspace operativo
              </div>
            </div>
          </div>

          <div className="flex items-center gap-3">
            <div className="hidden text-sm font-medium text-zinc-500 md:block">
              ventogroup.co
            </div>

            <details className="group relative">
              <summary className="list-none">
                <span className="inline-flex cursor-pointer items-center gap-2 rounded-2xl border border-white/80 bg-white/80 px-3 py-2 text-sm font-semibold text-zinc-800 shadow-sm ring-1 ring-zinc-900/5 transition hover:bg-white">
                  <span className="inline-flex h-8 w-8 items-center justify-center rounded-full bg-zinc-950 text-xs font-bold text-white">
                    {userInitials}
                  </span>
                  <span className="hidden sm:inline">Usuario</span>
                </span>
              </summary>

              <div className="absolute right-0 z-30 mt-2 w-72 overflow-hidden rounded-3xl border border-white/80 bg-white/95 p-2 shadow-2xl shadow-zinc-900/15 ring-1 ring-zinc-900/5 backdrop-blur-xl">
                <div className="rounded-2xl px-3 py-3">
                  <div className="text-[11px] font-semibold uppercase tracking-[0.16em] text-zinc-400">
                    Sesión activa
                  </div>
                  <div className="mt-1 truncate text-sm font-semibold text-zinc-800">
                    {userEmail || "-"}
                  </div>
                </div>

                <Link
                  href="/"
                  className="mt-1 block rounded-2xl px-3 py-2.5 text-sm font-medium text-zinc-700 transition hover:bg-zinc-100"
                >
                  Mi perfil
                </Link>

                <Link
                  href="/"
                  className="mt-1 block rounded-2xl px-3 py-2.5 text-sm font-medium text-zinc-700 transition hover:bg-zinc-100"
                >
                  Configuración de usuario
                </Link>

                <form action={signOutAction} className="mt-1">
                  <button
                    type="submit"
                    className="block w-full rounded-2xl px-3 py-2.5 text-left text-sm font-semibold text-red-700 transition hover:bg-red-50"
                  >
                    Cerrar sesión
                  </button>
                </form>
              </div>
            </details>
          </div>
        </div>
      </header>

      <main className="relative z-10 mx-auto w-full max-w-7xl px-5 py-8 sm:px-8 sm:py-10">
        <section className="relative overflow-hidden rounded-[36px] border border-white/80 bg-white/72 p-6 shadow-2xl shadow-zinc-900/8 ring-1 ring-zinc-900/5 backdrop-blur-2xl sm:p-8 lg:p-10">
          <div className="pointer-events-none absolute inset-0 bg-[linear-gradient(135deg,rgba(255,255,255,0.82)_0%,rgba(255,255,255,0.42)_42%,rgba(255,255,255,0.18)_100%)]" />
          <div className="pointer-events-none absolute -right-28 -top-28 h-72 w-72 rounded-full bg-zinc-950/5 blur-3xl" />

          <div className="relative grid gap-10 lg:grid-cols-[1.35fr_0.65fr] lg:items-end">
            <div>
              <div className="inline-flex items-center gap-2 rounded-full border border-zinc-200/80 bg-white/70 px-3 py-1.5 text-xs font-semibold uppercase tracking-[0.18em] text-zinc-600 shadow-sm">
                Vento Group · Command Center
              </div>

              <h1 className="mt-6 max-w-3xl text-5xl font-semibold tracking-[-0.055em] text-zinc-950 sm:text-6xl lg:text-7xl">
                Vento OS
              </h1>

              <p className="mt-5 max-w-2xl text-lg leading-8 text-zinc-600">
                Centro premium de acceso a las aplicaciones internas de Vento Group.
                Cada módulo se habilita según permisos reales y flujo operativo.
              </p>

              <div className="mt-8 flex flex-wrap items-center gap-3">
                <div className="flex -space-x-2">
                  {apps.map((app) => (
                    <MiniAppLogo key={app.id} app={app} />
                  ))}
                </div>

                <div className="text-sm text-zinc-500">
                  {accessibleApps.length} apps disponibles · {blockedApps.length} bloqueadas por permiso
                </div>
              </div>
            </div>

            <div className="grid grid-cols-3 gap-3 lg:grid-cols-1">
              <div className="rounded-3xl border border-white/80 bg-white/75 p-4 shadow-lg shadow-zinc-900/5 ring-1 ring-zinc-900/5">
                <div className="text-[11px] font-semibold uppercase tracking-[0.16em] text-zinc-400">
                  Disponibles
                </div>
                <div className="mt-2 text-3xl font-semibold tracking-tight text-zinc-950">
                  {accessibleApps.length}
                </div>
              </div>

              <div className="rounded-3xl border border-white/80 bg-white/75 p-4 shadow-lg shadow-zinc-900/5 ring-1 ring-zinc-900/5">
                <div className="text-[11px] font-semibold uppercase tracking-[0.16em] text-zinc-400">
                  Bloqueadas
                </div>
                <div className="mt-2 text-3xl font-semibold tracking-tight text-zinc-950">
                  {blockedApps.length}
                </div>
              </div>

              <div className="rounded-3xl border border-white/80 bg-white/75 p-4 shadow-lg shadow-zinc-900/5 ring-1 ring-zinc-900/5">
                <div className="text-[11px] font-semibold uppercase tracking-[0.16em] text-zinc-400">
                  Total web
                </div>
                <div className="mt-2 text-3xl font-semibold tracking-tight text-zinc-950">
                  {apps.length}
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="mt-8">
          <div className="mb-5 flex flex-col gap-2 sm:flex-row sm:items-end sm:justify-between">
            <div>
              <h2 className="text-xl font-semibold tracking-tight text-zinc-950">
                Aplicaciones operativas
              </h2>
              <p className="mt-1 text-sm text-zinc-500">
                Acceso directo al ecosistema web interno.
              </p>
            </div>

            <div className="text-sm font-medium text-zinc-500">
              VISO · NEXO · FOGO · ORIGO · PULSO
            </div>
          </div>

          <div className="grid grid-cols-1 gap-5 md:grid-cols-2 xl:grid-cols-5">
            {apps.map((app, index) => (
              <AppCard key={app.id} app={app} index={index} />
            ))}
          </div>
        </section>

        <section className="mt-8 grid gap-5 lg:grid-cols-[1fr_1fr]">
          <div className="rounded-[28px] border border-white/80 bg-white/68 p-6 shadow-xl shadow-zinc-900/5 ring-1 ring-zinc-900/5 backdrop-blur-xl">
            <div className="text-[11px] font-semibold uppercase tracking-[0.18em] text-zinc-400">
              Estandarización
            </div>
            <h3 className="mt-3 text-lg font-semibold text-zinc-950">
              Un solo ecosistema, cinco módulos web.
            </h3>
            <p className="mt-2 text-sm leading-6 text-zinc-600">
              El Hub mantiene la entrada común del sistema, mientras cada app conserva
              su identidad visual, su flujo propio y sus permisos.
            </p>
          </div>

          <div className="rounded-[28px] border border-white/80 bg-zinc-950 p-6 text-white shadow-2xl shadow-zinc-900/18">
            <div className="text-[11px] font-semibold uppercase tracking-[0.18em] text-white/45">
              Seguridad
            </div>
            <h3 className="mt-3 text-lg font-semibold">
              Acceso controlado por permisos.
            </h3>
            <p className="mt-2 text-sm leading-6 text-white/65">
              Las tarjetas reflejan el acceso real del usuario. Si una app no está permitida,
              queda visible como parte del ecosistema, pero bloqueada para navegación.
            </p>
          </div>
        </section>

        <footer className="mt-10 border-t border-zinc-200/70 py-6 text-sm text-zinc-500">
          <div className="flex flex-col gap-1 sm:flex-row sm:items-center sm:justify-between">
            <div>Vento OS · Hub</div>
            <div>Launcher premium operativo</div>
          </div>
        </footer>
      </main>
    </div>
  );
}
