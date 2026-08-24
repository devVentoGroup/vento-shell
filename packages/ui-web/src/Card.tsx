import type { HTMLAttributes, ReactNode } from 'react';

import './card.css';

export type CardVariant = 'surface' | 'soft' | 'raised';

export type CardPadding = 'sm' | 'md' | 'lg';

export interface CardProps extends HTMLAttributes<HTMLDivElement> {
  children?: ReactNode;
  variant?: CardVariant;
  padding?: CardPadding;
}

function classes(...values: Array<string | false | null | undefined>) {
  return values.filter(Boolean).join(' ');
}

export function Card({
  children,
  variant = 'surface',
  padding = 'md',
  className,
  ...htmlProps
}: CardProps) {
  return (
    <div
      {...htmlProps}
      className={classes(
        'ui-card',
        `ui-card--${variant}`,
        `ui-card--padding-${padding}`,
        className,
      )}
    >
      {children}
    </div>
  );
}
