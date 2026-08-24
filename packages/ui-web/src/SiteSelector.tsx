'use client';

import type { ChangeEvent, SelectHTMLAttributes } from 'react';

import './site-selector.css';

export interface SiteSelectorOption {
  readonly id: string;
  readonly label: string;
}

type NativeSiteSelectorProps = Omit<
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

export interface SiteSelectorProps extends NativeSiteSelectorProps {
  label: string;
  confirmedSiteId: string | null;
  requestedSiteId?: string;
  options: readonly SiteSelectorOption[];
  onRequestChange: (siteId: string) => void;
  pending?: boolean;
  pendingLabel?: string;
  disabled?: boolean;
  placeholderLabel?: string;
}

function classes(...values: Array<string | false | null | undefined>) {
  return values.filter(Boolean).join(' ');
}

export function SiteSelector({
  label,
  confirmedSiteId,
  requestedSiteId,
  options,
  onRequestChange,
  pending = false,
  pendingLabel,
  disabled = false,
  placeholderLabel,
  className,
  ...selectProps
}: SiteSelectorProps) {
  const candidateSiteId = pending && requestedSiteId !== undefined
    ? requestedSiteId
    : confirmedSiteId ?? '';
  const candidateIsVisible = candidateSiteId !== ''
    && options.some((option) => option.id === candidateSiteId);
  const displayedSiteId = candidateIsVisible ? candidateSiteId : '';
  const controlDisabled = disabled || pending;
  const showPlaceholder = displayedSiteId === '' || placeholderLabel !== undefined;

  function handleChange(event: ChangeEvent<HTMLSelectElement>) {
    if (pending) return;

    const nextSiteId = event.currentTarget.value;
    if (nextSiteId === '' || nextSiteId === confirmedSiteId) return;

    onRequestChange(nextSiteId);
  }

  return (
    <div className="ui-site-selector" data-pending={pending ? 'true' : 'false'}>
      <label className="ui-site-selector__field">
        <span className="ui-site-selector__label">{label}</span>
        <select
          {...selectProps}
          className={classes('ui-site-selector__control', className)}
          value={displayedSiteId}
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
        <p className="ui-site-selector__pending">{pendingLabel}</p>
      ) : null}
    </div>
  );
}
