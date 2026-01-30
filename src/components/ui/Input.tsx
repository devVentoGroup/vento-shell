"use client";

import * as React from "react";

type InputProps = React.InputHTMLAttributes<HTMLInputElement> & {
  label?: string;
  hint?: string;
  error?: string;
};

const fieldStyle: React.CSSProperties = {
  width: "100%",
  borderRadius: "var(--radius-sm)",
  border: "1px solid var(--color-border)",
  background: "var(--color-surface-2)",
  padding: "10px 12px",
  color: "var(--color-ink)",
  fontSize: 14,
};

export function Input({ label, hint, error, style, ...props }: InputProps) {
  const message = error || hint;
  const messageColor = error ? "var(--color-danger)" : "var(--color-ink-soft)";

  return (
    <label style={{ display: "grid", gap: 6 }}>
      {label ? (
        <span style={{ fontSize: 12, color: "var(--color-ink-soft)", fontWeight: 600 }}>
          {label}
        </span>
      ) : null}
      <input {...props} style={{ ...fieldStyle, ...style }} />
      {message ? (
        <span style={{ fontSize: 11, color: messageColor }}>{message}</span>
      ) : null}
    </label>
  );
}
