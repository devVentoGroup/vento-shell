import type { HTMLAttributes, ReactNode } from 'react';

import './cross-app-handoff.css';

export type CrossAppHandoffState =
  | 'OFFERED'
  | 'ACCEPTED'
  | 'REJECTED'
  | 'EXPIRED'
  | 'CANCELLED'
  | 'PARTIALLY_ACCEPTED'
  | 'RECONCILIATION_REQUIRED';

export type CrossAppHandoffProps = Omit<
  HTMLAttributes<HTMLElement>,
  'children' | 'aria-label'
> & {
  state: CrossAppHandoffState;
  ariaLabel: string;
  persistentContext: ReactNode;
  workIdentity: ReactNode;
  stepContent: ReactNode;
  blockingState?: ReactNode;
  primaryAction?: ReactNode;
  secondarySupport?: ReactNode;
  resultAndReceipt?: ReactNode;
};

export function CrossAppHandoff({
  state,
  ariaLabel,
  persistentContext,
  workIdentity,
  stepContent,
  blockingState,
  primaryAction,
  secondarySupport,
  resultAndReceipt,
  className,
  ...rest
}: CrossAppHandoffProps) {
  const rootClassName = ['ui-cross-app-handoff', className].filter(Boolean).join(' ');
  const hasActionRail = primaryAction != null || secondarySupport != null;

  return (
    <section
      {...rest}
      aria-label={ariaLabel}
      className={rootClassName}
      data-cross-app-handoff-state={state}
    >
      <div
        className="ui-cross-app-handoff__persistent-context"
        data-cross-app-handoff-slot="PERSISTENT_CONTEXT"
      >
        {persistentContext}
      </div>

      {blockingState != null ? (
        <div
          className="ui-cross-app-handoff__blocking-state"
          data-cross-app-handoff-slot="BLOCKING_STATE"
        >
          {blockingState}
        </div>
      ) : null}

      <div
        className="ui-cross-app-handoff__work-identity"
        data-cross-app-handoff-slot="WORK_IDENTITY"
      >
        {workIdentity}
      </div>

      <div
        className="ui-cross-app-handoff__step-content"
        data-cross-app-handoff-slot="STEP_CONTENT"
      >
        {stepContent}
      </div>

      {hasActionRail ? (
        <div className="ui-cross-app-handoff__action-rail">
          {primaryAction != null ? (
            <div
              className="ui-cross-app-handoff__primary-action"
              data-cross-app-handoff-slot="PRIMARY_ACTION"
            >
              {primaryAction}
            </div>
          ) : null}

          {secondarySupport != null ? (
            <div
              className="ui-cross-app-handoff__secondary-support"
              data-cross-app-handoff-slot="SECONDARY_SUPPORT"
            >
              {secondarySupport}
            </div>
          ) : null}
        </div>
      ) : null}

      {resultAndReceipt != null ? (
        <div
          className="ui-cross-app-handoff__result-and-receipt"
          data-cross-app-handoff-slot="RESULT_AND_RECEIPT"
        >
          {resultAndReceipt}
        </div>
      ) : null}
    </section>
  );
}
