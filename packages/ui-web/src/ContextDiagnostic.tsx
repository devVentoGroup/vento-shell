import type { HTMLAttributes } from 'react';

import type { ContextIndicatorItem, ContextIndicatorState } from './ContextIndicator';
import './context-diagnostic.css';

export type ContextDiagnosticState = Exclude<ContextIndicatorState, 'active'>;

export interface ContextDiagnosticCondition {
  readonly label: string;
  readonly message: string;
}

export interface ContextDiagnosticResolution {
  readonly instruction: string;
  readonly ownerLabel?: string;
  readonly reviewCondition?: string;
  readonly supportReference?: string;
}

export type ContextDiagnosticProps = Omit<HTMLAttributes<HTMLElement>, 'children'> & {
  state: ContextDiagnosticState;
  title: string;
  summary: string;
  conditions: readonly ContextDiagnosticCondition[];
  preservedContext: readonly ContextIndicatorItem[];
  blockedActions: readonly string[];
  resolution: ContextDiagnosticResolution;
};

export function ContextDiagnostic({
  state,
  title,
  summary,
  conditions,
  preservedContext,
  blockedActions,
  resolution,
  className,
  ...rest
}: ContextDiagnosticProps) {
  const rootClassName = ['ui-context-diagnostic', className].filter(Boolean).join(' ');

  return (
    <section {...rest} className={rootClassName} data-context-state={state}>
      <header className="ui-context-diagnostic__header">
        <h2 className="ui-context-diagnostic__title">{title}</h2>
        <p className="ui-context-diagnostic__summary">{summary}</p>
      </header>

      {conditions.length > 0 ? (
        <dl className="ui-context-diagnostic__conditions">
          {conditions.map((condition, index) => (
            <div className="ui-context-diagnostic__condition" key={`${index}:${condition.label}`}>
              <dt className="ui-context-diagnostic__condition-label">{condition.label}</dt>
              <dd className="ui-context-diagnostic__condition-message">{condition.message}</dd>
            </div>
          ))}
        </dl>
      ) : null}

      {preservedContext.length > 0 ? (
        <dl className="ui-context-diagnostic__preserved-context">
          {preservedContext.map((item, index) => (
            <div className="ui-context-diagnostic__preserved-item" key={`${index}:${item.label}`}>
              <dt className="ui-context-diagnostic__preserved-label">{item.label}</dt>
              <dd className="ui-context-diagnostic__preserved-value">{item.value}</dd>
            </div>
          ))}
        </dl>
      ) : null}

      {blockedActions.length > 0 ? (
        <ul className="ui-context-diagnostic__blocked-actions">
          {blockedActions.map((action, index) => (
            <li className="ui-context-diagnostic__blocked-action" key={`${index}:${action}`}>
              {action}
            </li>
          ))}
        </ul>
      ) : null}

      <div className="ui-context-diagnostic__resolution">
        <p className="ui-context-diagnostic__instruction">{resolution.instruction}</p>
        {resolution.ownerLabel ? (
          <p className="ui-context-diagnostic__owner">{resolution.ownerLabel}</p>
        ) : null}
        {resolution.reviewCondition ? (
          <p className="ui-context-diagnostic__review">{resolution.reviewCondition}</p>
        ) : null}
        {resolution.supportReference ? (
          <p className="ui-context-diagnostic__support-reference">
            {resolution.supportReference}
          </p>
        ) : null}
      </div>
    </section>
  );
}
