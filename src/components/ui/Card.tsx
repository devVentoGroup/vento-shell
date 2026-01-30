"use client";

import * as React from "react";

type CardVariant = "surface" | "soft" | "raised";
type CardPadding = "sm" | "md" | "lg";

type CardProps = React.HTMLAttributes<HTMLDivElement> & {
  variant?: CardVariant;
  padding?: CardPadding;
};

const paddingStyles: Record<CardPadding, React.CSSProperties> = {
  sm: { padding: 12 },
  md: { padding: 16 },
  lg: { padding: 20 },
};

const variantStyles: Record<CardVariant, React.CSSProperties> = {
  surface: {
    background: "var(--color-surface-1)",
    border: "1px solid var(--color-border)",
  },
  soft: {
    background: "var(--color-surface-2)",
    border: "1px solid var(--color-border)",
  },
  raised: {
    background: "var(--color-surface-1)",
    border: "1px solid var(--color-border)",
    boxShadow: "var(--shadow-1)",
  },
};

export function Card({
  variant = "surface",
  padding = "md",
  style,
  ...props
}: CardProps) {
  return (
    <div
      {...props}
      style={{
        borderRadius: "var(--radius-lg)",
        ...paddingStyles[padding],
        ...variantStyles[variant],
        ...style,
      }}
    />
  );
}
