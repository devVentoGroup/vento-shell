import type { HTMLAttributes, ReactNode } from 'react';

import './kiosk-task-surface.css';

export type KioskTaskSurfaceProps = Omit<
  HTMLAttributes<HTMLElement>,
  'children' | 'aria-label'
> & {
  surfaceClass: 'FIXED_KIOSK';
  ariaLabel: string;
  persistentContext: ReactNode;
  blockingState?: ReactNode;
  workIdentity: ReactNode;
  stepContent: ReactNode;
  primaryAction?: ReactNode;
  secondarySupport?: ReactNode;
  resultAndReceipt?: ReactNode;
};

export function KioskTaskSurface({
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
}: KioskTaskSurfaceProps) {
  const rootClassName = ['ui-kiosk-task-surface', className].filter(Boolean).join(' ');
  const hasActionRail = primaryAction != null || secondarySupport != null;

  return (
    <section
      {...rest}
      aria-label={ariaLabel}
      className={rootClassName}
      data-surface-class={surfaceClass}
    >
      <div
        className="ui-kiosk-task-surface__persistent-context"
        data-kiosk-slot="PERSISTENT_CONTEXT"
      >
        {persistentContext}
      </div>

      {blockingState != null ? (
        <div
          className="ui-kiosk-task-surface__blocking-state"
          data-kiosk-slot="BLOCKING_STATE"
        >
          {blockingState}
        </div>
      ) : null}

      <div
        className="ui-kiosk-task-surface__work-identity"
        data-kiosk-slot="WORK_IDENTITY"
      >
        {workIdentity}
      </div>

      <div className="ui-kiosk-task-surface__work-body">
        <div
          className="ui-kiosk-task-surface__step-content"
          data-kiosk-slot="STEP_CONTENT"
        >
          {stepContent}
        </div>

        {hasActionRail ? (
          <div className="ui-kiosk-task-surface__action-rail">
            {primaryAction != null ? (
              <div
                className="ui-kiosk-task-surface__primary-action"
                data-kiosk-slot="PRIMARY_ACTION"
              >
                {primaryAction}
              </div>
            ) : null}

            {secondarySupport != null ? (
              <div
                className="ui-kiosk-task-surface__secondary-support"
                data-kiosk-slot="SECONDARY_SUPPORT"
              >
                {secondarySupport}
              </div>
            ) : null}
          </div>
        ) : null}
      </div>

      {resultAndReceipt != null ? (
        <div
          className="ui-kiosk-task-surface__result-and-receipt"
          data-kiosk-slot="RESULT_AND_RECEIPT"
        >
          {resultAndReceipt}
        </div>
      ) : null}
    </section>
  );
}
