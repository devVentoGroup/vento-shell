import type { HTMLAttributes, ReactNode } from 'react';

import './tablet-task-surface.css';

export type TabletSurfaceClass = 'PERSONAL_TABLET' | 'SHARED_TABLET';

export type TabletTaskSurfaceProps = Omit<
  HTMLAttributes<HTMLElement>,
  'children' | 'aria-label'
> & {
  surfaceClass: TabletSurfaceClass;
  ariaLabel: string;
  persistentContext: ReactNode;
  blockingState?: ReactNode;
  workIdentity: ReactNode;
  stepContent: ReactNode;
  primaryAction?: ReactNode;
  secondarySupport?: ReactNode;
  resultAndReceipt?: ReactNode;
};

export function TabletTaskSurface({
  surfaceClass,
  ariaLabel,
  persistentContext,
  blockingState,
  workIdentity,
  stepContent,
  primaryAction,
  secondarySupport,
  resultAndReceipt,
  className,
  ...rest
}: TabletTaskSurfaceProps) {
  const rootClassName = ['ui-tablet-task-surface', className].filter(Boolean).join(' ');
  const hasActionRail = primaryAction != null || secondarySupport != null;

  return (
    <section
      {...rest}
      aria-label={ariaLabel}
      className={rootClassName}
      data-surface-class={surfaceClass}
    >
      <div
        className="ui-tablet-task-surface__persistent-context"
        data-tablet-slot="PERSISTENT_CONTEXT"
      >
        {persistentContext}
      </div>

      {blockingState != null ? (
        <div
          className="ui-tablet-task-surface__blocking-state"
          data-tablet-slot="BLOCKING_STATE"
        >
          {blockingState}
        </div>
      ) : null}

      <div
        className="ui-tablet-task-surface__work-identity"
        data-tablet-slot="WORK_IDENTITY"
      >
        {workIdentity}
      </div>

      <div className="ui-tablet-task-surface__work-body">
        <div
          className="ui-tablet-task-surface__step-content"
          data-tablet-slot="STEP_CONTENT"
        >
          {stepContent}
        </div>

        {hasActionRail ? (
          <div className="ui-tablet-task-surface__action-rail">
            {primaryAction != null ? (
              <div
                className="ui-tablet-task-surface__primary-action"
                data-tablet-slot="PRIMARY_ACTION"
              >
                {primaryAction}
              </div>
            ) : null}

            {secondarySupport != null ? (
              <div
                className="ui-tablet-task-surface__secondary-support"
                data-tablet-slot="SECONDARY_SUPPORT"
              >
                {secondarySupport}
              </div>
            ) : null}
          </div>
        ) : null}
      </div>

      {resultAndReceipt != null ? (
        <div
          className="ui-tablet-task-surface__result-and-receipt"
          data-tablet-slot="RESULT_AND_RECEIPT"
        >
          {resultAndReceipt}
        </div>
      ) : null}
    </section>
  );
}
