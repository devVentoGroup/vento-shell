"use client";

import * as React from "react";

type ButtonVariant = "primary" | "secondary" | "outline" | "ghost" | "danger";
type ButtonSize = "sm" | "md" | "lg";

type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  variant?: ButtonVariant;
  size?: ButtonSize;
  fullWidth?: boolean;
  loading?: boolean;
};

const baseStyle: React.CSSProperties = {
  borderRadius: "var(--radius-md)",
  border: "1px solid transparent",
  fontWeight: 700,
  letterSpacing: 0.2,
  display: "inline-flex",
  alignItems: "center",
  justifyContent: "center",
  gap: 8,
  transition: "transform 140ms ease, box-shadow 140ms ease, background 140ms ease",
  cursor: "pointer",
};

const sizeStyles: Record<ButtonSize, React.CSSProperties> = {
  sm: { padding: "8px 12px", fontSize: 12 },
  md: { padding: "10px 16px", fontSize: 14 },
  lg: { padding: "12px 18px", fontSize: 15 },
};

const variantStyles: Record<ButtonVariant, React.CSSProperties> = {
  primary: {
    background: "var(--color-brand)",
    color: "var(--color-on-brand)",
    borderColor: "var(--color-brand-600)",
    boxShadow: "var(--shadow-1)",
  },
  secondary: {
    background: "var(--color-surface-2)",
    color: "var(--color-ink)",
    borderColor: "var(--color-border)",
  },
  outline: {
    background: "transparent",
    color: "var(--color-ink)",
    borderColor: "var(--color-border)",
  },
  ghost: {
    background: "transparent",
    color: "var(--color-brand)",
    borderColor: "transparent",
  },
  danger: {
    background: "var(--color-danger)",
    color: "var(--color-on-brand)",
    borderColor: "var(--color-danger)",
  },
};

export function Button({
  variant = "primary",
  size = "md",
  fullWidth,
  loading,
  disabled,
  style,
  children,
  ...props
}: ButtonProps) {
  const isDisabled = disabled || loading;
  const mergedStyle: React.CSSProperties = {
    ...baseStyle,
    ...sizeStyles[size],
    ...variantStyles[variant],
    ...(fullWidth ? { width: "100%" } : null),
    ...(isDisabled ? { opacity: 0.6, cursor: "not-allowed" } : null),
    ...style,
  };

  return (
    <button
      {...props}
      type={props.type ?? "button"}
      disabled={isDisabled}
      aria-busy={loading ?? false}
      style={mergedStyle}
    >
      {loading ? "Cargando..." : children}
    </button>
  );
}
