import type { HTMLAttributes, ReactNode } from 'react';

import './task-navigation.css';

export type TaskNavigationPresentationState =
  | 'PRIMARY'
  | 'SECONDARY'
  | 'DISCOVERABLE'
  | 'CONTEXTUAL_DISABLED'
  | 'REQUIRED_BLOCKED';

export type TaskNavigationItem = {
  navigationId: string;
  intentCode: string;
  label: string;
  description?: string;
  href?: string;
  state: TaskNavigationPresentationState;
  statusLabel?: string;
  ownerLabel?: string;
  icon?: ReactNode;
};

export type TaskNavigationGroup = {
  groupId: string;
  label: string;
  description?: string;
  items: readonly TaskNavigationItem[];
};

export type TaskNavigationProps = Omit<
  HTMLAttributes<HTMLDivElement>,
  'children' | 'aria-label'
> & {
  ariaLabel: string;
  groups: readonly TaskNavigationGroup[];
  currentNavigationId?: string;
};

function assertUniqueIdentities(groups: readonly TaskNavigationGroup[]) {
  const groupIds = new Set<string>();
  const navigationIds = new Set<string>();

  for (const group of groups) {
    if (groupIds.has(group.groupId)) {
      throw new Error(`TaskNavigation received duplicate groupId: ${group.groupId}`);
    }
    groupIds.add(group.groupId);

    for (const item of group.items) {
      if (navigationIds.has(item.navigationId)) {
        throw new Error(
          `TaskNavigation received duplicate navigationId: ${item.navigationId}`,
        );
      }
      navigationIds.add(item.navigationId);
    }
  }
}

function isBlockedState(state: TaskNavigationPresentationState) {
  return state === 'CONTEXTUAL_DISABLED' || state === 'REQUIRED_BLOCKED';
}

export function TaskNavigation({
  ariaLabel,
  groups,
  currentNavigationId,
  className,
  ...rest
}: TaskNavigationProps) {
  assertUniqueIdentities(groups);

  const rootClassName = ['ui-task-navigation', className].filter(Boolean).join(' ');

  return (
    <div
      className={rootClassName}
      role="group"
      aria-label={ariaLabel}
      {...rest}
    >
      {groups.map((group) => (
        <div
          key={group.groupId}
          className="ui-task-navigation__group"
          data-group-id={group.groupId}
        >
          <div className="ui-task-navigation__group-header">
            <div className="ui-task-navigation__group-label">{group.label}</div>
            {group.description != null ? (
              <div className="ui-task-navigation__group-description">
                {group.description}
              </div>
            ) : null}
          </div>

          <ul className="ui-task-navigation__items" aria-label={group.label}>
            {group.items.map((item) => {
              const isCurrent = item.navigationId === currentNavigationId;
              const blocked = isBlockedState(item.state);
              const actionable = item.href != null && !blocked;
              const itemClassName = [
                'ui-task-navigation__item-content',
                `ui-task-navigation__item-content--${item.state.toLowerCase().replaceAll('_', '-')}`,
                isCurrent ? 'ui-task-navigation__item-content--current' : '',
              ]
                .filter(Boolean)
                .join(' ');

              const content = (
                <>
                  {item.icon != null ? (
                    <span className="ui-task-navigation__icon" aria-hidden="true">
                      {item.icon}
                    </span>
                  ) : null}

                  <span className="ui-task-navigation__text">
                    <span className="ui-task-navigation__label">{item.label}</span>

                    {item.description != null ? (
                      <span className="ui-task-navigation__description">
                        {item.description}
                      </span>
                    ) : null}

                    {item.statusLabel != null ? (
                      <span className="ui-task-navigation__status">
                        {item.statusLabel}
                      </span>
                    ) : null}

                    {item.ownerLabel != null ? (
                      <span className="ui-task-navigation__owner">
                        {item.ownerLabel}
                      </span>
                    ) : null}
                  </span>
                </>
              );

              return (
                <li key={item.navigationId} className="ui-task-navigation__item">
                  {actionable ? (
                    <a
                      className={itemClassName}
                      href={item.href}
                      aria-current={isCurrent ? 'page' : undefined}
                      data-navigation-id={item.navigationId}
                      data-intent-code={item.intentCode}
                      data-state={item.state}
                    >
                      {content}
                    </a>
                  ) : (
                    <span
                      className={itemClassName}
                      aria-current={isCurrent ? 'page' : undefined}
                      aria-disabled="true"
                      data-navigation-id={item.navigationId}
                      data-intent-code={item.intentCode}
                      data-state={item.state}
                    >
                      {content}
                    </span>
                  )}
                </li>
              );
            })}
          </ul>
        </div>
      ))}
    </div>
  );
}
