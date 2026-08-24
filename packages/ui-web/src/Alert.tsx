import type { HTMLAttributes, ReactNode } from 'react';

import './alert.css';

export type AlertVariant = 'neutral' | 'success' | 'warning' | 'danger';

export interface AlertProps extends Omit<HTMLAttributes<HTMLDivElement>, 'children'> {
  variant?: AlertVariant;
  children: ReactNode;
  icon?: ReactNode;
}

export function Alert({
  variant = 'neutral',
  children,
  icon,
  className,
  ...htmlProps
}: AlertProps) {
  const classes = ['ui-alert', `ui-alert--${variant}`, className]
    .filter(Boolean)
    .join(' ');

  return (
    <div {...htmlProps} className={classes}>
      {icon == null ? null : <span className="ui-alert__icon">{icon}</span>}
      <div className="ui-alert__text">{children}</div>
    </div>
  );
}
