"use client";

import { FormEvent, useEffect, useMemo, useState } from "react";

import { createClient } from "@/lib/supabase/client";

type Props = {
  returnTo: string;
  defaultEmail?: string;
};

export function LoginForm({ returnTo, defaultEmail }: Props) {
  const [email, setEmail] = useState(defaultEmail ?? "");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [error, setError] = useState("");
  const [recoveryOpen, setRecoveryOpen] = useState(false);
  const [recoveryEmail, setRecoveryEmail] = useState(defaultEmail ?? "");
  const [recoveryMessage, setRecoveryMessage] = useState("");
  const [recoveryError, setRecoveryError] = useState("");
  const [recoveryLoading, setRecoveryLoading] = useState(false);
  const [loading, setLoading] = useState(false);
  const [cooldownUntil, setCooldownUntil] = useState<number | null>(null);
  const [now, setNow] = useState(Date.now());

  const cooldownLeft = useMemo(() => {
    if (!cooldownUntil) return 0;
    return Math.max(0, Math.ceil((cooldownUntil - now) / 1000));
  }, [cooldownUntil, now]);

  useEffect(() => {
    if (!cooldownUntil) return;
    const id = window.setInterval(() => setNow(Date.now()), 500);
    return () => window.clearInterval(id);
  }, [cooldownUntil]);

  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (loading || cooldownLeft > 0) return;
    setError("");
    setLoading(true);

    try {
      const supabase = createClient();
      const { error: signInError } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (signInError) {
        const msg = (signInError.message || "").toLowerCase();
        if (msg.includes("rate limit")) {
          setCooldownUntil(Date.now() + 30_000);
          setError("Demasiados intentos. Espera 30 segundos y vuelve a intentar.");
          return;
        }
        setError(signInError.message);
        return;
      }

      window.location.href = returnTo || "/";
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : "No fue posible iniciar sesion.");
    } finally {
      setLoading(false);
    }
  }

  async function handleRecoverySubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const targetEmail = recoveryEmail.trim().toLowerCase();
    if (!targetEmail || recoveryLoading) return;

    setRecoveryError("");
    setRecoveryMessage("");
    setRecoveryLoading(true);

    try {
      const supabase = createClient();
      const redirectTo =
        process.env.NEXT_PUBLIC_SET_PASSWORD_URL ||
        "https://anima.ventogroup.co/api/set-password";
      const { error: resetError } = await supabase.auth.resetPasswordForEmail(targetEmail, {
        redirectTo,
      });

      if (resetError) {
        setRecoveryError(resetError.message || "No fue posible enviar el enlace.");
        return;
      }

      setRecoveryMessage("Listo. Revisa el correo y abre el enlace para crear una nueva contrasena.");
    } catch (err: unknown) {
      setRecoveryError(err instanceof Error ? err.message : "No fue posible enviar el enlace.");
    } finally {
      setRecoveryLoading(false);
    }
  }

  return (
    <>
    <div className="relative w-full overflow-hidden rounded-3xl border border-white/80 bg-white/90 p-7 shadow-2xl shadow-slate-300/35 backdrop-blur-xl">
      <div className="absolute left-0 top-0 h-1.5 w-full bg-gradient-to-r from-cyan-600 via-indigo-600 to-slate-900" />
      <div className="pointer-events-none absolute right-[-48px] top-[-48px] h-28 w-28 rounded-full bg-cyan-200/65 blur-2xl" />
      <div className="pointer-events-none absolute bottom-[-56px] left-[-56px] h-32 w-32 rounded-full bg-indigo-200/50 blur-2xl" />
      <div className="pointer-events-none absolute inset-0 bg-gradient-to-b from-white/40 via-transparent to-white/15" />

      <div className="relative mb-4 inline-flex items-center gap-2 rounded-full border border-slate-200 bg-white px-3 py-1 text-[11px] font-semibold uppercase tracking-[0.12em] text-slate-500">
        <span className="h-1.5 w-1.5 rounded-full bg-cyan-600" />
        SSO centralizado
      </div>
      <h2 className="relative text-2xl font-semibold tracking-tight text-slate-900">Iniciar sesion</h2>
      <p className="relative mt-1 text-sm text-slate-600">Acceso unico para todo Vento OS.</p>

      <form onSubmit={handleSubmit} className="relative mt-6 grid gap-4">
        <label className="grid gap-1.5">
          <span className="text-xs font-semibold uppercase tracking-wide text-slate-500">Email</span>
          <input
            type="email"
            name="email"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
            autoComplete="email"
            required
            className="h-11 rounded-xl border border-slate-200 bg-white/95 px-3.5 text-sm text-slate-900 outline-none transition-colors focus:border-cyan-400 focus:bg-white focus:ring-2 focus:ring-cyan-100"
          />
        </label>

        <label className="grid gap-1.5">
          <span className="text-xs font-semibold uppercase tracking-wide text-slate-500">Contrasena</span>
          <div className="relative">
            <input
              type={showPassword ? "text" : "password"}
              name="password"
              value={password}
              onChange={(event) => setPassword(event.target.value)}
              autoComplete="current-password"
              required
              className="h-11 w-full rounded-xl border border-slate-200 bg-white/95 px-3.5 pr-20 text-sm text-slate-900 outline-none transition-colors focus:border-cyan-400 focus:bg-white focus:ring-2 focus:ring-cyan-100"
            />
            <button
              type="button"
              onClick={() => setShowPassword((prev) => !prev)}
              className="absolute right-2 top-1/2 h-7 -translate-y-1/2 rounded-md border border-slate-200 bg-white px-2 text-xs font-semibold text-slate-600 transition hover:bg-slate-50"
            >
              {showPassword ? "Ocultar" : "Mostrar"}
            </button>
          </div>
        </label>

        {error ? (
          <div className="rounded-xl border border-red-200 bg-red-50/95 p-3 text-sm text-red-800">{error}</div>
        ) : null}

        <button
          type="submit"
          disabled={loading || cooldownLeft > 0}
          className="inline-flex h-12 items-center justify-center rounded-xl bg-gradient-to-r from-slate-900 via-indigo-900 to-cyan-800 px-4 text-sm font-semibold text-white shadow-lg shadow-indigo-900/30 transition hover:brightness-110 disabled:cursor-not-allowed disabled:opacity-60"
        >
          {loading
            ? "Ingresando..."
            : cooldownLeft > 0
              ? `Espera ${cooldownLeft}s`
              : "Entrar"}
        </button>

        <button
          type="button"
          className="text-left text-sm font-semibold text-slate-700 underline-offset-4 hover:underline"
          onClick={() => {
            setRecoveryEmail(email.trim() || recoveryEmail);
            setRecoveryError("");
            setRecoveryMessage("");
            setRecoveryOpen(true);
          }}
        >
          Olvide mi contrasena
        </button>

        <div className="grid gap-1.5">
          <p className="text-xs text-slate-500">
            Redireccion: <span className="font-mono text-slate-600">{returnTo}</span>
          </p>
          <p className="text-xs text-slate-500">
            Si tienes bloqueos de acceso, valida permisos de usuario y sede con tu lider.
          </p>
        </div>

        <div className="mt-1 rounded-lg border border-slate-200 bg-white/70 px-3 py-2 text-[11px] text-slate-500">
          Inicio seguro con autenticacion central de Vento OS.
        </div>
      </form>
    </div>
    {recoveryOpen ? (
      <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/40 px-4">
        <div className="w-full max-w-sm rounded-2xl border border-slate-200 bg-white p-5 shadow-2xl">
          <div className="flex items-start justify-between gap-4">
            <div>
              <h3 className="text-lg font-semibold tracking-tight text-slate-900">Recuperar contrasena</h3>
              <p className="mt-1 text-sm text-slate-600">
                Escribe tu correo y enviaremos un enlace para crear una nueva contrasena.
              </p>
            </div>
            <button
              type="button"
              className="rounded-full px-2 py-1 text-sm font-semibold text-slate-500 hover:bg-slate-100"
              onClick={() => setRecoveryOpen(false)}
              aria-label="Cerrar"
            >
              X
            </button>
          </div>

          <form onSubmit={handleRecoverySubmit} className="mt-5 grid gap-3">
            <label className="grid gap-1.5">
              <span className="text-xs font-semibold uppercase tracking-wide text-slate-500">Email</span>
              <input
                type="email"
                value={recoveryEmail}
                onChange={(event) => setRecoveryEmail(event.target.value)}
                required
                className="h-11 rounded-xl border border-slate-200 bg-slate-50/60 px-3.5 text-sm text-slate-900 outline-none transition-colors focus:border-cyan-400 focus:bg-white focus:ring-2 focus:ring-cyan-100"
              />
            </label>

            {recoveryError ? (
              <div className="rounded-xl border border-red-200 bg-red-50/95 p-3 text-sm text-red-800">
                {recoveryError}
              </div>
            ) : null}

            {recoveryMessage ? (
              <div className="rounded-xl border border-emerald-200 bg-emerald-50/95 p-3 text-sm text-emerald-800">
                {recoveryMessage}
              </div>
            ) : null}

            <button
              type="submit"
              disabled={recoveryLoading}
              className="inline-flex h-11 items-center justify-center rounded-xl bg-slate-900 px-4 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {recoveryLoading ? "Enviando..." : "Enviar enlace"}
            </button>
          </form>
        </div>
      </div>
    ) : null}
    </>
  );
}
