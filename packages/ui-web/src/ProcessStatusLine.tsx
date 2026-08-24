import './process-status-line.css';

export type ProcessStatusLineStepState = 'REACHED' | 'CURRENT' | 'NOT_REACHED';

export type ProcessStatusLineStep = {
  stepId: string;
  label: string;
  description?: string;
  state: ProcessStatusLineStepState;
};

export type ProcessStatusLineProps = {
  ariaLabel: string;
  steps: readonly ProcessStatusLineStep[];
};

export function ProcessStatusLine({ ariaLabel, steps }: ProcessStatusLineProps) {
  return (
    <ol className="ui-process-status-line" aria-label={ariaLabel}>
      {steps.map((step) => (
        <li
          key={step.stepId}
          className="ui-process-status-line__step"
          data-state={step.state}
          aria-current={step.state === 'CURRENT' ? 'step' : undefined}
        >
          <span className="ui-process-status-line__marker" aria-hidden="true" />
          <span className="ui-process-status-line__content">
            <span className="ui-process-status-line__label">{step.label}</span>
            {step.description ? (
              <span className="ui-process-status-line__description">
                {step.description}
              </span>
            ) : null}
          </span>
        </li>
      ))}
    </ol>
  );
}
