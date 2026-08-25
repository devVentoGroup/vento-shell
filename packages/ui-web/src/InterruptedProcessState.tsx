import type { HTMLAttributes, ReactNode } from 'react';

import './interrupted-process-state.css';

export type InterruptedProcessStatus =
  | 'NO_CHECKPOINT'
  | 'DRAFT_ONLY'
  | 'CHECKPOINT_AVAILABLE'
  | 'VALIDATING'
  | 'RESUMABLE'
  | 'RESUMABLE_WITH_REVIEW'
  | 'WAITING_FOR_DEPENDENCY'
  | 'HANDOFF_REQUIRED'
  | 'REASSIGNMENT_REQUIRED'
  | 'CONFLICT'
  | 'RESULT_UNKNOWN'
  | 'REAUTH_REQUIRED'
  | 'RECONCILIATION_REQUIRED'
  | 'SUPERSEDED'
  | 'COMPLETED'
  | 'EXPIRED'
  | 'INVALID';

export interface InterruptedProcessSummary {
  readonly lastProgress?: ReactNode;
  readonly preservedWork?: ReactNode;
  readonly changesSinceInterruption?: ReactNode;
  readonly pendingOrUnknownResults?: ReactNode;
  readonly claimAndCustodySummary?: ReactNode;
  readonly expiryOrDependencySummary?: ReactNode;
}

export type InterruptedProcessStateProps = Omit<
  HTMLAttributes<HTMLElement>,
  'children' | 'aria-label'
> & {
  status: InterruptedProcessStatus;
  ariaLabel: string;
  persistentContext: ReactNode;
  workIdentity: ReactNode;
  interruptionSummary: InterruptedProcessSummary;
  blockingState?: ReactNode;
  primaryAction?: ReactNode;
  secondarySupport?: ReactNode;
  resultAndReceipt?: ReactNode;
};

const summaryFieldOrder = [
  ['LAST_PROGRESS', 'lastProgress'],
  ['PRESERVED_WORK', 'preservedWork'],
  ['CHANGES_SINCE_INTERRUPTION', 'changesSinceInterruption'],
  ['PENDING_OR_UNKNOWN_RESULTS', 'pendingOrUnknownResults'],
  ['CLAIM_AND_CUSTODY', 'claimAndCustodySummary'],
  ['EXPIRY_OR_DEPENDENCY', 'expiryOrDependencySummary'],
] as const;

export function InterruptedProcessState({
  status,
  ariaLabel,
  persistentContext,
  workIdentity,
  interruptionSummary,
  blockingState,
  primaryAction,
  secondarySupport,
  resultAndReceipt,
  className,
  ...rest
}: InterruptedProcessStateProps) {
  const rootClassName = ['ui-interrupted-process-state', className].filter(Boolean).join(' ');
  const hasActionRail = primaryAction != null || secondarySupport != null;

  return (
    <section
      {...rest}
      aria-label={ariaLabel}
      className={rootClassName}
      data-interrupted-process-status={status}
    >
      <div
        className="ui-interrupted-process-state__persistent-context"
        data-interrupted-process-slot="PERSISTENT_CONTEXT"
      >
        {persistentContext}
      </div>

      {blockingState != null ? (
        <div
          className="ui-interrupted-process-state__blocking-state"
          data-interrupted-process-slot="BLOCKING_STATE"
        >
          {blockingState}
        </div>
      ) : null}

      <div
        className="ui-interrupted-process-state__work-identity"
        data-interrupted-process-slot="WORK_IDENTITY"
      >
        {workIdentity}
      </div>

      <div
        className="ui-interrupted-process-state__summary"
        data-interrupted-process-slot="STEP_CONTENT"
      >
        {summaryFieldOrder.map(([field, key]) => {
          const value = interruptionSummary[key];
          return value != null ? (
            <div
              className="ui-interrupted-process-state__summary-field"
              data-interrupted-summary-field={field}
              key={field}
            >
              {value}
            </div>
          ) : null;
        })}
      </div>

      {hasActionRail ? (
        <div className="ui-interrupted-process-state__action-rail">
          {primaryAction != null ? (
            <div
              className="ui-interrupted-process-state__primary-action"
              data-interrupted-process-slot="PRIMARY_ACTION"
            >
              {primaryAction}
            </div>
          ) : null}

          {secondarySupport != null ? (
            <div
              className="ui-interrupted-process-state__secondary-support"
              data-interrupted-process-slot="SECONDARY_SUPPORT"
            >
              {secondarySupport}
            </div>
          ) : null}
        </div>
      ) : null}

      {resultAndReceipt != null ? (
        <div
          className="ui-interrupted-process-state__result-and-receipt"
          data-interrupted-process-slot="RESULT_AND_RECEIPT"
        >
          {resultAndReceipt}
        </div>
      ) : null}
    </section>
  );
}
