import type { ButtonHTMLAttributes, ReactNode } from 'react';

import './button.css';

export type ButtonVariant = 'primary' | 'secondary' | 'outline' | 'ghost' | 'danger';

export type ButtonSize = 'sm' | 'md' | 'lg';

export interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  children: ReactNode;
  variant?: ButtonVariant;
  size?: ButtonSize;
  loading?: boolean;
}

function classes(...values: Array<string | false | null | undefined>) {
  return values.filter(Boolean).join(' ');
}

export function Button({
  children,
  variant = 'primary',
  size = 'md',
  loading = false,
  disabled = false,
  type = 'button',
  className,
  'aria-busy': ariaBusy,
  ...htmlProps
}: ButtonProps) {
  return (
    <button
      {...htmlProps}
      type={type}
      disabled={disabled || loading}
      aria-busy={loading ? true : ariaBusy}
      className={classes(
        'ui-button',
        `ui-button--${variant}`,
        `ui-button--${size}`,
        loading && 'ui-button--loading',
        className,
      )}
    >
      {loading ? <span className="ui-button__spinner" aria-hidden="true" /> : null}
      <span className="ui-button__content">{children}</span>
    </button>
  );
}
