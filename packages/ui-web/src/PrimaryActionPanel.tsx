import type { ReactNode } from 'react';

import './primary-action-panel.css';

export type PrimaryActionPresentationState =
  | 'READY'
  | 'PENDING'
  | 'CONTEXTUAL_DISABLED'
  | 'REQUIRED_BLOCKED';

export type PrimaryActionPanelProps = {
  ariaLabel: string;
  actionId: string;
  label: string;
  description?: string;
  state: PrimaryActionPresentationState;
  statusLabel?: string;
  primaryControl: ReactNode;
  secondaryControl?: ReactNode;
};

export function PrimaryActionPanel({
  ariaLabel,
  actionId,
  label,
  description,
  state,
  statusLabel,
  primaryControl,
  secondaryControl,
}: PrimaryActionPanelProps) {
  return (
    <section
      className="ui-primary-action-panel"
      aria-label={ariaLabel}
      aria-busy={state === 'PENDING' ? true : undefined}
      data-action-id={actionId}
      data-state={state}
    >
      <div className="ui-primary-action-panel__copy">
        <div className="ui-primary-action-panel__heading-row">
          <p className="ui-primary-action-panel__label">{label}</p>
          {statusLabel ? (
            <span className="ui-primary-action-panel__status">{statusLabel}</span>
          ) : null}
        </div>
        {description ? (
          <p className="ui-primary-action-panel__description">{description}</p>
        ) : null}
      </div>

      <div className="ui-primary-action-panel__controls">
        <div className="ui-primary-action-panel__primary">{primaryControl}</div>
        {secondaryControl ? (
          <div className="ui-primary-action-panel__secondary">{secondaryControl}</div>
        ) : null}
      </div>
    </section>
  );
}
