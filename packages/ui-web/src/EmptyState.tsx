import type { HTMLAttributes, ReactNode } from 'react';

import './empty-state.css';

export interface EmptyStateProps extends Omit<HTMLAttributes<HTMLDivElement>, 'title'> {
  title: ReactNode;
  description?: ReactNode;
  icon?: ReactNode;
  action?: ReactNode;
}

function classes(...values: Array<string | false | null | undefined>) {
  return values.filter(Boolean).join(' ');
}

export function EmptyState({
  title,
  description,
  icon,
  action,
  className,
  ...htmlProps
}: EmptyStateProps) {
  return (
    <div
      {...htmlProps}
      className={classes('ui-empty-state-root', className)}
    >
      {icon != null ? (
        <div className="ui-empty-state__icon" aria-hidden="true">
          {icon}
        </div>
      ) : null}
      <div className="ui-empty-state__title">{title}</div>
      {description != null ? (
        <div className="ui-empty-state__description">{description}</div>
      ) : null}
      {action != null ? (
        <div className="ui-empty-state__action">{action}</div>
      ) : null}
    </div>
  );
}
