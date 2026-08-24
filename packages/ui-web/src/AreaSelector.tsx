'use client';

import type { ChangeEvent, SelectHTMLAttributes } from 'react';

import './area-selector.css';

export interface AreaSelectorOption {
  readonly id: string;
  readonly label: string;
}

type NativeAreaSelectorProps = Omit<
  SelectHTMLAttributes<HTMLSelectElement>,
  | 'value'
  | 'defaultValue'
  | 'onChange'
  | 'disabled'
  | 'multiple'
  | 'children'
  | 'size'
  | 'autoFocus'
>;

export interface AreaSelectorProps extends NativeAreaSelectorProps {
  label: string;
  confirmedAreaId: string | null;
  requestedAreaId?: string | null;
  options: readonly AreaSelectorOption[];
  onRequestChange: (areaId: string) => void;
  pending?: boolean;
  pendingLabel?: string;
  disabled?: boolean;
  placeholderLabel?: string;
}

function classes(...values: Array<string | false | null | undefined>) {
  return values.filter(Boolean).join(' ');
}

export function AreaSelector({
  label,
  confirmedAreaId,
  requestedAreaId,
  options,
  onRequestChange,
  pending = false,
  pendingLabel,
  disabled = false,
  placeholderLabel,
  className,
  ...selectProps
}: AreaSelectorProps) {
  const candidateAreaId = pending && requestedAreaId !== undefined
    ? requestedAreaId
    : confirmedAreaId;
  const candidateAreaValue = candidateAreaId ?? '';
  const candidateIsVisible = candidateAreaValue !== ''
    && options.some((option) => option.id === candidateAreaValue);
  const displayedAreaId = candidateIsVisible ? candidateAreaValue : '';
  const controlDisabled = disabled || pending;
  const showPlaceholder = displayedAreaId === '' || placeholderLabel !== undefined;

  function handleChange(event: ChangeEvent<HTMLSelectElement>) {
    if (pending) return;

    const nextAreaId = event.currentTarget.value;
    if (nextAreaId === '' || nextAreaId === confirmedAreaId) return;

    onRequestChange(nextAreaId);
  }

  return (
    <div className="ui-area-selector" data-pending={pending ? 'true' : 'false'}>
      <label className="ui-area-selector__field">
        <span className="ui-area-selector__label">{label}</span>
        <select
          {...selectProps}
          className={classes('ui-area-selector__control', className)}
          value={displayedAreaId}
          onChange={handleChange}
          disabled={controlDisabled}
          aria-busy={pending || undefined}
        >
          {showPlaceholder ? (
            <option value="" disabled>
              {placeholderLabel ?? ''}
            </option>
          ) : null}
          {options.map((option) => (
            <option key={option.id} value={option.id}>
              {option.label}
            </option>
          ))}
        </select>
      </label>
      {pending && pendingLabel ? (
        <p className="ui-area-selector__pending">{pendingLabel}</p>
      ) : null}
    </div>
  );
}
