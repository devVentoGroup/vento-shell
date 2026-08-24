import type { HTMLAttributes } from 'react';

import './simulated-role-notice.css';

export interface SimulatedRoleNoticeProps
  extends Omit<HTMLAttributes<HTMLDivElement>, 'children'> {
  title: string;
  simulatedRoleLabel: string;
  description: string;
  nonExecutableLabel: string;
}

export function SimulatedRoleNotice({
  title,
  simulatedRoleLabel,
  description,
  nonExecutableLabel,
  className,
  ...rest
}: SimulatedRoleNoticeProps) {
  const rootClassName = ['ui-simulated-role-notice', className]
    .filter(Boolean)
    .join(' ');

  return (
    <div className={rootClassName} {...rest}>
      <div className="ui-simulated-role-notice__content">
        <p className="ui-simulated-role-notice__title">{title}</p>
        <p className="ui-simulated-role-notice__role">{simulatedRoleLabel}</p>
        <p className="ui-simulated-role-notice__description">{description}</p>
        <p className="ui-simulated-role-notice__non-executable">
          {nonExecutableLabel}
        </p>
      </div>
    </div>
  );
}
