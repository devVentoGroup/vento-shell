"use client";

import * as React from "react";

type ChipTone = "neutral" | "brand" | "success" | "warning" | "danger";

type ChipProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  selected?: boolean;
  tone?: ChipTone;
};

const toneStyles: Record<ChipTone, React.CSSProperties> = {
  neutral: {
    borderColor: "var(--color-border)",
    color: "var(--color-ink)",
    background: "var(--color-surface-2)",
  },
  brand: {
    borderColor: "var(--color-brand-600)",
    color: "var(--color-brand)",
    background: "var(--color-brand-soft)",
  },
  success: {
    borderColor: "var(--color-success)",
    color: "var(--color-success)",
    background: "rgba(31, 157, 106, 0.12)",
  },
  warning: {
    borderColor: "var(--color-warning)",
    color: "var(--color-warning)",
    background: "rgba(224, 138, 0, 0.12)",
  },
  danger: {
    borderColor: "var(--color-danger)",
    color: "var(--color-danger)",
    background: "rgba(224, 72, 74, 0.12)",
  },
};

export function Chip({
  selected,
  tone = "neutral",
  style,
  children,
  ...props
}: ChipProps) {
  return (
    <button
      {...props}
      type={props.type ?? "button"}
      style={{
        padding: "6px 12px",
        borderRadius: "var(--radius-pill)",
        border: "1px solid",
        fontSize: 12,
        fontWeight: 700,
        cursor: "pointer",
        ...(selected ? { boxShadow: "var(--shadow-1)" } : null),
        ...toneStyles[tone],
        ...style,
      }}
    >
      {children}
    </button>
  );
}
