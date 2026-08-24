'use client';

import {
  useId,
  useRef,
  useState,
  type HTMLAttributes,
  type KeyboardEvent,
  type ReactNode,
} from 'react';

import './app-shell.css';

type AppShellWithoutNavigation = {
  navigation?: undefined;
  navigationLabel?: never;
};

type AppShellWithNavigation = {
  navigation: ReactNode;
  navigationLabel: string;
};

export type AppShellProps = Omit<HTMLAttributes<HTMLDivElement>, 'children'> & {
  children: ReactNode;
  brand: ReactNode;
  skipToContentLabel: string;
  context?: ReactNode;
  notices?: ReactNode;
  headerActions?: ReactNode;
} & (AppShellWithoutNavigation | AppShellWithNavigation);

export function AppShell({
  children,
  brand,
  navigation,
  navigationLabel,
  skipToContentLabel,
  context,
  notices,
  headerActions,
  className,
  ...rest
}: AppShellProps) {
  const navigationId = useId();
  const mainId = useId();
  const navigationToggleRef = useRef<HTMLButtonElement>(null);
  const [navigationOpen, setNavigationOpen] = useState(false);
  const hasNavigation = navigation != null;
  const rootClassName = ['ui-app-shell', className].filter(Boolean).join(' ');

  const closeNavigation = () => {
    setNavigationOpen(false);
    navigationToggleRef.current?.focus();
  };

  const handleNavigationKeyDown = (event: KeyboardEvent<HTMLElement>) => {
    if (event.key === 'Escape' && navigationOpen) {
      closeNavigation();
    }
  };

  return (
    <div className={rootClassName} {...rest}>
      <a className="ui-app-shell__skip-link" href={`#${mainId}`}>
        {skipToContentLabel}
      </a>

      <header className="ui-app-shell__header">
        <div className="ui-app-shell__brand">{brand}</div>

        {hasNavigation ? (
          <button
            ref={navigationToggleRef}
            className="ui-app-shell__navigation-toggle"
            type="button"
            aria-controls={navigationId}
            aria-expanded={navigationOpen}
            onClick={() => setNavigationOpen((open) => !open)}
          >
            {navigationLabel}
          </button>
        ) : null}

        {context != null ? (
          <div className="ui-app-shell__context">{context}</div>
        ) : null}

        {headerActions != null ? (
          <div className="ui-app-shell__header-actions">{headerActions}</div>
        ) : null}
      </header>

      {notices != null ? (
        <div className="ui-app-shell__notices">{notices}</div>
      ) : null}

      <div
        className={[
          'ui-app-shell__body',
          hasNavigation ? 'ui-app-shell__body--with-navigation' : '',
        ]
          .filter(Boolean)
          .join(' ')}
      >
        {hasNavigation ? (
          <nav
            id={navigationId}
            className="ui-app-shell__navigation"
            aria-label={navigationLabel}
            data-mobile-open={navigationOpen ? 'true' : 'false'}
            onKeyDown={handleNavigationKeyDown}
          >
            {navigation}
          </nav>
        ) : null}

        <main id={mainId} className="ui-app-shell__main" tabIndex={-1}>
          {children}
        </main>
      </div>
    </div>
  );
}
