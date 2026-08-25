import type { HTMLAttributes, ReactNode } from 'react';

import './recoverable-error-state.css';

export type RecoverableErrorCategory =
  | 'CONFLICT'
  | 'TECHNICAL_FAILURE'
  | 'VALIDATION_REQUIRED';

export interface RecoverableErrorDetail {
  readonly label: string;
  readonly value: string;
}

type RecoverablePreservedState = 'NONE' | 'LOCAL' | 'SERVER' | 'PARTIAL' | 'UNKNOWN';

export type RecoverableErrorStateProps = Omit<HTMLAttributes<HTMLElement>, 'children'> & {
  category: RecoverableErrorCategory;
  title: string;
  summary: string;
  preservedState: RecoverablePreservedState;
  preservedStateLabel: string;
  details: readonly RecoverableErrorDetail[];
  nextStep: string;
  primaryRecoveryControl?: ReactNode;
  secondaryRecoveryControls?: readonly ReactNode[];
  ownerLabel?: string;
  supportReference?: string;
};

export function RecoverableErrorState({
  category,
  title,
  summary,
  preservedState,
  preservedStateLabel,
  details,
  nextStep,
  primaryRecoveryControl,
  secondaryRecoveryControls = [],
  ownerLabel,
  supportReference,
  className,
  ...rest
}: RecoverableErrorStateProps) {
  const rootClassName = ['ui-recoverable-error-state', className].filter(Boolean).join(' ');
  const hasRecoveryControls = primaryRecoveryControl != null || secondaryRecoveryControls.length > 0;

  return (
    <section
      {...rest}
      className={rootClassName}
      data-error-category={category}
      data-preserved-state={preservedState}
    >
      <header className="ui-recoverable-error-state__header">
        <h2 className="ui-recoverable-error-state__title">{title}</h2>
        <p className="ui-recoverable-error-state__summary">{summary}</p>
      </header>

      <div className="ui-recoverable-error-state__preserved-state">
        <p className="ui-recoverable-error-state__preserved-label">{preservedStateLabel}</p>
      </div>

      {details.length > 0 ? (
        <dl className="ui-recoverable-error-state__details">
          {details.map((detail, index) => (
            <div className="ui-recoverable-error-state__detail" key={`${index}:${detail.label}`}>
              <dt className="ui-recoverable-error-state__detail-label">{detail.label}</dt>
              <dd className="ui-recoverable-error-state__detail-value">{detail.value}</dd>
            </div>
          ))}
        </dl>
      ) : null}

      <div className="ui-recoverable-error-state__next-step">
        <p className="ui-recoverable-error-state__next-step-label">{nextStep}</p>
      </div>

      {hasRecoveryControls ? (
        <div className="ui-recoverable-error-state__controls">
          {primaryRecoveryControl != null ? (
            <div className="ui-recoverable-error-state__primary-control">
              {primaryRecoveryControl}
            </div>
          ) : null}
          {secondaryRecoveryControls.length > 0 ? (
            <div className="ui-recoverable-error-state__secondary-controls">
              {secondaryRecoveryControls.map((control, index) => (
                <div className="ui-recoverable-error-state__secondary-control" key={index}>
                  {control}
                </div>
              ))}
            </div>
          ) : null}
        </div>
      ) : null}

      {ownerLabel || supportReference ? (
        <footer className="ui-recoverable-error-state__footer">
          {ownerLabel ? (
            <p className="ui-recoverable-error-state__owner">{ownerLabel}</p>
          ) : null}
          {supportReference ? (
            <p className="ui-recoverable-error-state__support-reference">{supportReference}</p>
          ) : null}
        </footer>
      ) : null}
    </section>
  );
}
