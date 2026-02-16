"use client";

import { FormEvent, useState } from "react";

import { createClient } from "@/lib/supabase/client";

type Props = {
  returnTo: string;
  defaultEmail?: string;
};

export function LoginForm({ returnTo, defaultEmail }: Props) {
  const [email, setEmail] = useState(defaultEmail ?? "");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setError("");
    setLoading(true);

    try {
      const supabase = createClient();
      const { error: signInError } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (signInError) {
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

  return (
    <div className="relative w-full overflow-hidden rounded-3xl border border-slate-200/90 bg-white p-7 shadow-xl shadow-slate-300/30">
      <div className="absolute left-0 top-0 h-1.5 w-full bg-gradient-to-r from-slate-900 via-slate-700 to-slate-500" />

      <h2 className="text-xl font-semibold tracking-tight text-slate-900">Iniciar sesion</h2>
      <p className="mt-1 text-sm text-slate-600">Acceso unico para todo Vento OS.</p>

      <form onSubmit={handleSubmit} className="mt-6 grid gap-4">
        <label className="grid gap-1.5">
          <span className="text-xs font-semibold uppercase tracking-wide text-slate-500">Email</span>
          <input
            type="email"
            name="email"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
            autoComplete="email"
            required
            className="h-11 rounded-xl border border-slate-200 bg-slate-50/60 px-3.5 text-sm text-slate-900 outline-none transition-colors focus:border-slate-400 focus:bg-white focus:ring-2 focus:ring-slate-200"
          />
        </label>

        <label className="grid gap-1.5">
          <span className="text-xs font-semibold uppercase tracking-wide text-slate-500">Contrasena</span>
          <input
            type="password"
            name="password"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
            autoComplete="current-password"
            required
            className="h-11 rounded-xl border border-slate-200 bg-slate-50/60 px-3.5 text-sm text-slate-900 outline-none transition-colors focus:border-slate-400 focus:bg-white focus:ring-2 focus:ring-slate-200"
          />
        </label>

        {error ? (
          <div className="rounded-xl border border-red-200 bg-red-50/95 p-3 text-sm text-red-800">{error}</div>
        ) : null}

        <button
          type="submit"
          disabled={loading}
          className="inline-flex h-12 items-center justify-center rounded-xl bg-slate-900 px-4 text-sm font-semibold text-white shadow-lg shadow-slate-900/25 transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
        >
          {loading ? "Ingresando..." : "Entrar"}
        </button>

        <p className="text-xs text-slate-500">
          Redireccion: <span className="font-mono text-slate-600">{returnTo}</span>
        </p>
      </form>
    </div>
  );
}
