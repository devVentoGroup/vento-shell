import type { HTMLAttributes, ReactNode } from 'react';

import './sensitive-action-confirmation.css';

export type SensitiveActionConfirmationState =
  | 'READY'
  | 'PENDING'
  | 'BLOCKED'
  | 'RESULT_UNKNOWN';

export type SensitiveActionConfirmationProps = Omit<
  HTMLAttributes<HTMLElement>,
  'aria-label' | 'children'
> & {
  open: boolean;
  ariaLabel: string;
  actionId: string;
  title: string;
  description: string;
  consequence: string;
  resourceLabel?: string;
  contextSummary?: ReactNode;
  state: SensitiveActionConfirmationState;
  statusLabel?: string;
  reasonControl?: ReactNode;
  confirmControl: ReactNode;
  cancelControl: ReactNode;
};

export function SensitiveActionConfirmation({
  open,
  ariaLabel,
  actionId,
  title,
  description,
  consequence,
  resourceLabel,
  contextSummary,
  state,
  statusLabel,
  reasonControl,
  confirmControl,
  cancelControl,
  className,
  ...rest
}: SensitiveActionConfirmationProps) {
  if (!open) return null;

  const rootClassName = ['ui-sensitive-action-confirmation', className]
    .filter(Boolean)
    .join(' ');

  return (
    <section
      {...rest}
      className={rootClassName}
      aria-label={ariaLabel}
      aria-busy={state === 'PENDING' ? true : undefined}
      data-action-id={actionId}
      data-state={state}
    >
      <header className="ui-sensitive-action-confirmation__header">
        <h2 className="ui-sensitive-action-confirmation__title">{title}</h2>
        <p className="ui-sensitive-action-confirmation__description">{description}</p>
      </header>

      {resourceLabel ? (
        <p className="ui-sensitive-action-confirmation__resource">{resourceLabel}</p>
      ) : null}

      {contextSummary ? (
        <div className="ui-sensitive-action-confirmation__context">{contextSummary}</div>
      ) : null}

      <p className="ui-sensitive-action-confirmation__consequence">{consequence}</p>

      {statusLabel ? (
        <p className="ui-sensitive-action-confirmation__status">{statusLabel}</p>
      ) : null}

      {reasonControl ? (
        <div className="ui-sensitive-action-confirmation__reason">{reasonControl}</div>
      ) : null}

      <div className="ui-sensitive-action-confirmation__controls">
        <div className="ui-sensitive-action-confirmation__cancel">{cancelControl}</div>
        <div className="ui-sensitive-action-confirmation__confirm">{confirmControl}</div>
      </div>
    </section>
  );
}
