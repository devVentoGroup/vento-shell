import type { HTMLAttributes } from 'react';

import './context-indicator.css';

export type ContextIndicatorState =
  | 'resolving'
  | 'active'
  | 'changing'
  | 'stale'
  | 'invalid'
  | 'unavailable';

export interface ContextIndicatorItem {
  readonly label: string;
  readonly value: string;
}

export interface ContextIndicatorProps extends Omit<HTMLAttributes<HTMLDivElement>, 'children'> {
  state: ContextIndicatorState;
  stateLabel: string;
  items: readonly ContextIndicatorItem[];
}

function classes(...values: Array<string | false | null | undefined>) {
  return values.filter(Boolean).join(' ');
}

export function ContextIndicator({
  state,
  stateLabel,
  items,
  className,
  ...htmlProps
}: ContextIndicatorProps) {
  return (
    <div
      {...htmlProps}
      className={classes('ui-context-indicator', className)}
      data-context-state={state}
    >
      <div className="ui-context-indicator__state">{stateLabel}</div>
      {items.length > 0 ? (
        <dl className="ui-context-indicator__items">
          {items.map((item, index) => (
            <div className="ui-context-indicator__item" key={`${index}:${item.label}`}>
              <dt className="ui-context-indicator__label">{item.label}</dt>
              <dd className="ui-context-indicator__value">{item.value}</dd>
            </div>
          ))}
        </dl>
      ) : null}
    </div>
  );
}
