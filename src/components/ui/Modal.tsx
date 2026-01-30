"use client";

import * as React from "react";
import { createPortal } from "react-dom";

type ModalProps = {
  open: boolean;
  title?: string;
  subtitle?: string;
  onClose: () => void;
  children: React.ReactNode;
  footer?: React.ReactNode;
};

export function Modal({ open, title, subtitle, onClose, children, footer }: ModalProps) {
  const [mounted, setMounted] = React.useState(false);

  React.useEffect(() => {
    setMounted(true);
  }, []);

  React.useEffect(() => {
    if (!open) return;
    const onKey = (event: KeyboardEvent) => {
      if (event.key === "Escape") onClose();
    };
    document.addEventListener("keydown", onKey);
    document.body.style.overflow = "hidden";
    return () => {
      document.removeEventListener("keydown", onKey);
      document.body.style.overflow = "";
    };
  }, [open, onClose]);

  if (!open || !mounted) return null;

  return createPortal(
    <div
      role="dialog"
      aria-modal
      style={{
        position: "fixed",
        inset: 0,
        background: "rgba(10, 8, 12, 0.42)",
        display: "grid",
        placeItems: "center",
        padding: 24,
        zIndex: 50,
      }}
      onClick={onClose}
    >
      <div
        onClick={(event) => event.stopPropagation()}
        style={{
          width: "min(520px, 92vw)",
          borderRadius: "var(--radius-lg)",
          background: "var(--color-surface-1)",
          border: "1px solid var(--color-border)",
          boxShadow: "var(--shadow-2)",
          padding: 18,
        }}
      >
        {title ? (
          <div style={{ marginBottom: 12 }}>
            <div style={{ fontSize: 18, fontWeight: 800, color: "var(--color-ink)" }}>
              {title}
            </div>
            {subtitle ? (
              <div style={{ marginTop: 4, fontSize: 13, color: "var(--color-ink-soft)" }}>
                {subtitle}
              </div>
            ) : null}
          </div>
        ) : null}

        <div>{children}</div>

        {footer ? <div style={{ marginTop: 16 }}>{footer}</div> : null}
      </div>
    </div>,
    document.body,
  );
}
