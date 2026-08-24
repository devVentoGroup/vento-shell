export type CookieWriteMode = 'READ_WRITE' | 'READ_ONLY';

export interface CookiePolicy {
    readonly allowSharedDomain: boolean;
    readonly sharedDomain?: string;
    readonly allowInsecureHttp: boolean;
}

export interface CanonicalCookieOptions {
    readonly path: '/';
    readonly sameSite: 'lax';
    readonly secure: boolean;
    readonly domain?: string;
}

export interface PublicSupabaseConfig {
    readonly url: string;
    readonly publicKey: string;
}

export interface NativeSessionStorage {
    getItem(key: string): Promise<string | null> | string | null;
    setItem(key: string, value: string): Promise<void> | void;
    removeItem(key: string): Promise<void> | void;
}

function invariant(condition: unknown, message: string): asserts condition {
    if (!condition) throw new Error(message);
}

function nonEmpty(value: string, label: string): string {
    invariant(typeof value === 'string' && value.trim().length > 0, `${label} must be non-empty`);
    return value.trim();
}

function decodeBase64UrlAscii(value: string): string | null {
    if (!/^[A-Za-z0-9_-]+$/u.test(value)) return null;
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
    const normalized = value.replaceAll('-', '+').replaceAll('_', '/');
    const padded = normalized + '='.repeat((4 - (normalized.length % 4)) % 4);
    let output = '';

    for (let index = 0; index < padded.length; index += 4) {
        const chunk = padded.slice(index, index + 4);
        const sextets = [...chunk].map((character) => (
            character === '=' ? 0 : alphabet.indexOf(character)
        ));
        if (sextets.some((entry) => entry < 0)) return null;

        const triple = (sextets[0] << 18)
            | (sextets[1] << 12)
            | (sextets[2] << 6)
            | sextets[3];
        output += String.fromCharCode((triple >> 16) & 0xff);
        if (chunk[2] !== '=') output += String.fromCharCode((triple >> 8) & 0xff);
        if (chunk[3] !== '=') output += String.fromCharCode(triple & 0xff);
    }

    return output;
}

function jwtRole(key: string): string | null {
    const parts = key.split('.');
    if (parts.length !== 3) return null;
    const payload = decodeBase64UrlAscii(parts[1]);
    if (!payload) return null;
    try {
        const parsed = JSON.parse(payload) as Readonly<Record<string, unknown>>;
        return typeof parsed.role === 'string' ? parsed.role : null;
    } catch {
        return null;
    }
}

function normalizeHostname(value: string, label: string): string {
    let host = nonEmpty(value, label).toLowerCase();
    if (host.endsWith('.')) host = host.slice(0, -1);
    if (host.startsWith('[') && host.endsWith(']')) host = host.slice(1, -1);
    invariant(!host.includes('/') && !host.includes('@'), `${label} must be a hostname without path or userinfo`);
    return host;
}

function isIpv4(host: string): boolean {
    const parts = host.split('.');
    return parts.length === 4 && parts.every((part) => (
        /^\d{1,3}$/u.test(part) && Number(part) >= 0 && Number(part) <= 255
    ));
}

function isIpLiteral(host: string): boolean {
    return isIpv4(host) || host.includes(':');
}

function isLocalhost(host: string): boolean {
    return host === 'localhost' || host.endsWith('.localhost');
}

function normalizeSharedDomain(value: string): string {
    let domain = nonEmpty(value, 'cookiePolicy.sharedDomain').toLowerCase();
    while (domain.startsWith('.')) domain = domain.slice(1);
    if (domain.endsWith('.')) domain = domain.slice(0, -1);
    invariant(!isLocalhost(domain), 'sharedDomain cannot be localhost');
    invariant(!isIpLiteral(domain), 'sharedDomain cannot be an IP address');
    invariant(domain.includes('.'), 'sharedDomain must be a qualified domain');
    invariant(
        domain.split('.').every((label) => /^[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?$/u.test(label)),
        'sharedDomain is invalid',
    );
    return domain;
}

function hostMatchesDomain(host: string, domain: string): boolean {
    return host === domain || host.endsWith(`.${domain}`);
}

export function assertSupabaseUrl(url: string): string {
    const normalized = nonEmpty(url, 'url');
    let parsed: URL;
    try {
        parsed = new URL(normalized);
    } catch {
        throw new Error('url must be a valid absolute URL');
    }
    invariant(parsed.protocol === 'https:' || parsed.protocol === 'http:', 'url must use http or https');
    invariant(parsed.hostname.length > 0, 'url must include a hostname');
    return normalized;
}

export function assertPublicSupabaseKey(publicKey: string): string {
    const normalized = nonEmpty(publicKey, 'publicKey');
    invariant(!normalized.startsWith('sb_secret_'), 'publicKey cannot be a Supabase secret key');
    invariant(normalized !== 'service_role', 'publicKey cannot be service_role');
    invariant(jwtRole(normalized) !== 'service_role', 'publicKey cannot carry the service_role role');
    return normalized;
}

export function assertPrivilegedSupabaseKey(serviceRoleKey: string): string {
    const normalized = nonEmpty(serviceRoleKey, 'serviceRoleKey');
    invariant(!normalized.startsWith('sb_publishable_'), 'serviceRoleKey cannot be a publishable key');
    if (normalized.startsWith('sb_secret_')) return normalized;
    invariant(jwtRole(normalized) === 'service_role', 'serviceRoleKey must be a Supabase secret or service_role key');
    return normalized;
}

export function assertPublicSupabaseConfig(config: PublicSupabaseConfig): PublicSupabaseConfig {
    return {
        url: assertSupabaseUrl(config.url),
        publicKey: assertPublicSupabaseKey(config.publicKey),
    };
}

export function assertNativeSessionStorage(storage: NativeSessionStorage): NativeSessionStorage {
    invariant(storage !== null && typeof storage === 'object', 'storage must be provided');
    for (const method of ['getItem', 'setItem', 'removeItem'] as const) {
        invariant(typeof storage[method] === 'function', `storage.${method} must be a function`);
    }
    return storage;
}

export function resolveCanonicalCookieOptions(input: Readonly<{
    currentHost?: string;
    isSecureContext: boolean;
    cookiePolicy: CookiePolicy;
}>): CanonicalCookieOptions {
    invariant(typeof input.isSecureContext === 'boolean', 'isSecureContext must be boolean');
    invariant(input.cookiePolicy !== null && typeof input.cookiePolicy === 'object', 'cookiePolicy is required');
    invariant(
        typeof input.cookiePolicy.allowSharedDomain === 'boolean',
        'cookiePolicy.allowSharedDomain must be boolean',
    );
    invariant(
        typeof input.cookiePolicy.allowInsecureHttp === 'boolean',
        'cookiePolicy.allowInsecureHttp must be boolean',
    );
    invariant(
        input.isSecureContext || input.cookiePolicy.allowInsecureHttp,
        'insecure HTTP requires explicit cookiePolicy.allowInsecureHttp',
    );

    const base: CanonicalCookieOptions = {
        path: '/',
        sameSite: 'lax',
        secure: input.isSecureContext,
    };

    if (!input.cookiePolicy.allowSharedDomain) return base;
    invariant(
        input.cookiePolicy.sharedDomain !== undefined,
        'cookiePolicy.sharedDomain is required when shared domain is enabled',
    );
    invariant(
        input.currentHost !== undefined,
        'currentHost is required when shared domain is enabled',
    );

    const domain = normalizeSharedDomain(input.cookiePolicy.sharedDomain);
    const host = normalizeHostname(input.currentHost, 'currentHost');
    if (isLocalhost(host) || isIpLiteral(host) || !hostMatchesDomain(host, domain)) return base;
    return { ...base, domain };
}