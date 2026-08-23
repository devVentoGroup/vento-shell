export const ERROR_NORMALIZATION_POLICY_ID =
  'VENTO_SUPABASE_TECHNICAL_ERROR_NORMALIZATION@1.0.0' as const;

export const ERROR_SEMANTIC_LAYERS = [
  'NATIVE_DIAGNOSTIC',
  'TECHNICAL_NORMALIZATION',
  'CONTRACTUAL_OUTCOME',
  'PUBLIC_MESSAGE',
] as const;

export const ERROR_SEMANTIC_FAMILIES = [
  'REQUEST_VALIDATION',
  'AUTHENTICATION_INVALID',
  'AUTHORIZATION_DENIED',
  'RESOURCE_NOT_VISIBLE',
  'STATE_OR_VERSION_CONFLICT',
  'IDEMPOTENCY_CONFLICT',
  'BUSINESS_INVARIANT',
  'RATE_OR_CAPACITY',
  'DEPENDENCY_FAILURE',
  'RESULT_UNKNOWN',
  'INTERNAL_UNDISCLOSED',
] as const;

export const TECHNICAL_ERROR_SOURCES = [
  'POSTGRES',
  'POSTGREST',
  'SUPABASE_AUTH',
  'SUPABASE_STORAGE',
  'SUPABASE_REALTIME',
  'SUPABASE_FUNCTIONS',
  'NETWORK',
  'ADAPTER',
  'RUNTIME',
  'UNKNOWN',
] as const;

export const RETRY_DIRECTIVES = [
  'DO_NOT_RETRY',
  'RETRY_IF_CONTRACT_ALLOWS',
  'BOUNDED_RETRY_IF_CONTRACT_ALLOWS',
  'RECONCILE_BEFORE_RETRY',
] as const;

export type ErrorSemanticFamily = (typeof ERROR_SEMANTIC_FAMILIES)[number];
export type TechnicalErrorSource = (typeof TECHNICAL_ERROR_SOURCES)[number];
export type RetryDirective = (typeof RETRY_DIRECTIVES)[number];
export type OperationKind = 'QUERY' | 'COMMAND';
export type DiagnosticRuntime = 'SERVER' | 'BROWSER' | 'NATIVE';
export type DispatchState = 'NOT_DISPATCHED' | 'DISPATCHED' | 'UNKNOWN';
export type EffectCertainty = 'NO_EFFECT_CONFIRMED' | 'EFFECT_CONFIRMED' | 'UNKNOWN';

export interface ContractOutcome {
  readonly code: string;
  readonly family: ErrorSemanticFamily;
  readonly contractId: string;
  readonly contractVersion: string;
}

export interface RetryContract {
  readonly directive: RetryDirective;
  readonly maxAttempts?: number;
}

export interface ErrorNormalizationMapping {
  readonly mappingId: string;
  readonly mappingVersion: string;
  readonly source: TechnicalErrorSource;
  readonly nativeCode: string;
  readonly contractId: string;
  readonly contractVersion: string;
  readonly family: ErrorSemanticFamily;
}

export interface TechnicalFailureInput {
  readonly source: TechnicalErrorSource;
  readonly dispatchState: DispatchState;
  readonly nativeCode?: string;
  readonly httpStatus?: number;
  readonly sqlState?: string;
  readonly message?: string;
  readonly hint?: string;
  readonly details?: string;
  readonly stack?: string;
  readonly constraint?: string;
  readonly schema?: string;
  readonly table?: string;
  readonly routine?: string;
  readonly cause?: unknown;
}

export interface ErrorNormalizationContext {
  readonly productBoundary: 'VENTO_OS';
  readonly operation: OperationKind;
  readonly runtime: DiagnosticRuntime;
  readonly contractId: string;
  readonly contractVersion: string;
  readonly mappingVersion: string;
  readonly effectCertainty: EffectCertainty;
  readonly retryContract: RetryContract;
  readonly contractOutcome?: ContractOutcome;
  readonly correlationId?: string;
  readonly attemptId?: string;
  readonly idempotencyKey?: string;
  readonly expectedVersion?: string;
}

export interface PublicTechnicalError {
  readonly ok: false;
  readonly code: string;
  readonly family: ErrorSemanticFamily;
  readonly retry: RetryDirective;
  readonly requiresReconciliation: boolean;
  readonly correlationId?: string;
}

export interface ProtectedTechnicalDiagnostic {
  readonly source: TechnicalErrorSource;
  readonly nativeCode?: string;
  readonly httpStatus?: number;
  readonly sqlState?: string;
  readonly message?: string;
  readonly hint?: string;
  readonly details?: string;
  readonly stack?: string;
  readonly constraint?: string;
  readonly schema?: string;
  readonly table?: string;
  readonly routine?: string;
  readonly cause?: unknown;
  readonly correlationId?: string;
  readonly attemptId?: string;
  readonly idempotencyKey?: string;
  readonly expectedVersion?: string;
}

export interface NormalizedTechnicalError {
  readonly ok: false;
  readonly policyId: typeof ERROR_NORMALIZATION_POLICY_ID;
  readonly family: ErrorSemanticFamily;
  readonly operation: OperationKind;
  readonly runtime: DiagnosticRuntime;
  readonly effectCertainty: EffectCertainty;
  readonly retry: RetryDirective;
  readonly requiresReconciliation: boolean;
  readonly contractOutcome: ContractOutcome | null;
  readonly mapping: Readonly<{
    mappingId: string;
    mappingVersion: string;
  }> | null;
  readonly publicError: PublicTechnicalError;
  readonly protectedDiagnostic: ProtectedTechnicalDiagnostic | null;
  readonly redactionApplied: true;
}

const semanticFamilySet = new Set<string>(ERROR_SEMANTIC_FAMILIES);
const sourceSet = new Set<string>(TECHNICAL_ERROR_SOURCES);
const retrySet = new Set<string>(RETRY_DIRECTIVES);
const forbiddenMappingKeys = new Set([
  'message',
  'messagePattern',
  'hint',
  'details',
  'regex',
  'stack',
]);

function invariant(condition: unknown, message: string): asserts condition {
  if (!condition) throw new Error(message);
}

function nonEmpty(value: string, label: string): void {
  invariant(typeof value === 'string' && value.trim().length > 0, `${label} must be non-empty`);
}

function assertOutcome(outcome: ContractOutcome, context: ErrorNormalizationContext): void {
  nonEmpty(outcome.code, 'contractOutcome.code');
  nonEmpty(outcome.contractId, 'contractOutcome.contractId');
  nonEmpty(outcome.contractVersion, 'contractOutcome.contractVersion');
  invariant(semanticFamilySet.has(outcome.family), 'contractOutcome.family is unsupported');
  invariant(outcome.contractId === context.contractId, 'contract outcome belongs to another contract');
  invariant(
    outcome.contractVersion === context.contractVersion,
    'contract outcome belongs to another contract version',
  );
}

function assertRetryContract(contract: RetryContract): void {
  invariant(retrySet.has(contract.directive), 'retry directive is unsupported');
  if (contract.directive === 'BOUNDED_RETRY_IF_CONTRACT_ALLOWS') {
    invariant(
      Number.isInteger(contract.maxAttempts) && Number(contract.maxAttempts) > 0,
      'bounded retry requires a positive maxAttempts',
    );
  }
}

function assertContext(context: ErrorNormalizationContext): void {
  invariant(context.productBoundary === 'VENTO_OS', 'VITAL and other product boundaries are excluded');
  invariant(context.operation === 'QUERY' || context.operation === 'COMMAND', 'operation is unsupported');
  invariant(
    context.runtime === 'SERVER' || context.runtime === 'BROWSER' || context.runtime === 'NATIVE',
    'runtime is unsupported',
  );
  nonEmpty(context.contractId, 'contractId');
  nonEmpty(context.contractVersion, 'contractVersion');
  nonEmpty(context.mappingVersion, 'mappingVersion');
  assertRetryContract(context.retryContract);
  if (context.contractOutcome) assertOutcome(context.contractOutcome, context);
}

function assertFailure(failure: TechnicalFailureInput): void {
  invariant(sourceSet.has(failure.source), 'technical source is unsupported');
  invariant(
    failure.dispatchState === 'NOT_DISPATCHED'
      || failure.dispatchState === 'DISPATCHED'
      || failure.dispatchState === 'UNKNOWN',
    'dispatch state is unsupported',
  );
  if (failure.nativeCode !== undefined) nonEmpty(failure.nativeCode, 'nativeCode');
  if (failure.httpStatus !== undefined) {
    invariant(Number.isInteger(failure.httpStatus), 'httpStatus must be an integer');
  }
}

function assertMapping(mapping: ErrorNormalizationMapping): void {
  for (const key of Object.keys(mapping)) {
    invariant(!forbiddenMappingKeys.has(key), `mapping cannot branch on ${key}`);
  }
  nonEmpty(mapping.mappingId, 'mappingId');
  nonEmpty(mapping.mappingVersion, 'mappingVersion');
  nonEmpty(mapping.nativeCode, 'mapping.nativeCode');
  nonEmpty(mapping.contractId, 'mapping.contractId');
  nonEmpty(mapping.contractVersion, 'mapping.contractVersion');
  invariant(sourceSet.has(mapping.source), 'mapping source is unsupported');
  invariant(semanticFamilySet.has(mapping.family), 'mapping family is unsupported');
}

function resolveMapping(
  failure: TechnicalFailureInput,
  context: ErrorNormalizationContext,
  mappings: readonly ErrorNormalizationMapping[],
): ErrorNormalizationMapping | null {
  for (const mapping of mappings) assertMapping(mapping);
  if (!failure.nativeCode) return null;

  const matches = mappings.filter((mapping) => (
    mapping.mappingVersion === context.mappingVersion
    && mapping.source === failure.source
    && mapping.nativeCode === failure.nativeCode
    && mapping.contractId === context.contractId
    && mapping.contractVersion === context.contractVersion
  ));
  invariant(matches.length <= 1, 'multiple exact error mappings matched the same failure');
  return matches[0] ?? null;
}

function isUnknownCommandResult(
  failure: TechnicalFailureInput,
  context: ErrorNormalizationContext,
): boolean {
  return context.operation === 'COMMAND'
    && context.effectCertainty === 'UNKNOWN'
    && failure.dispatchState !== 'NOT_DISPATCHED';
}

function publicCode(
  family: ErrorSemanticFamily,
  outcome: ContractOutcome | undefined,
): string {
  if (outcome) return outcome.code;
  return family === 'RESULT_UNKNOWN' ? 'VENTO_RESULT_UNKNOWN' : 'VENTO_TECHNICAL_FAILURE';
}

function protectedDiagnostic(
  failure: TechnicalFailureInput,
  context: ErrorNormalizationContext,
): ProtectedTechnicalDiagnostic | null {
  if (context.runtime !== 'SERVER') return null;
  return {
    source: failure.source,
    ...(failure.nativeCode === undefined ? {} : { nativeCode: failure.nativeCode }),
    ...(failure.httpStatus === undefined ? {} : { httpStatus: failure.httpStatus }),
    ...(failure.sqlState === undefined ? {} : { sqlState: failure.sqlState }),
    ...(failure.message === undefined ? {} : { message: failure.message }),
    ...(failure.hint === undefined ? {} : { hint: failure.hint }),
    ...(failure.details === undefined ? {} : { details: failure.details }),
    ...(failure.stack === undefined ? {} : { stack: failure.stack }),
    ...(failure.constraint === undefined ? {} : { constraint: failure.constraint }),
    ...(failure.schema === undefined ? {} : { schema: failure.schema }),
    ...(failure.table === undefined ? {} : { table: failure.table }),
    ...(failure.routine === undefined ? {} : { routine: failure.routine }),
    ...(failure.cause === undefined ? {} : { cause: failure.cause }),
    ...(context.correlationId === undefined ? {} : { correlationId: context.correlationId }),
    ...(context.attemptId === undefined ? {} : { attemptId: context.attemptId }),
    ...(context.idempotencyKey === undefined ? {} : { idempotencyKey: context.idempotencyKey }),
    ...(context.expectedVersion === undefined ? {} : { expectedVersion: context.expectedVersion }),
  };
}

export function captureStructuredSupabaseFailure(
  source: TechnicalErrorSource,
  native: unknown,
  dispatchState: DispatchState,
): TechnicalFailureInput {
  const record = native !== null && typeof native === 'object'
    ? native as Readonly<Record<string, unknown>>
    : {};
  const stringValue = (key: string): string | undefined => (
    typeof record[key] === 'string' ? record[key] : undefined
  );
  const statusCandidate = record.status ?? record.statusCode;
  const numericStatus = typeof statusCandidate === 'number'
    ? statusCandidate
    : typeof statusCandidate === 'string' && /^\d+$/u.test(statusCandidate)
      ? Number(statusCandidate)
      : undefined;

  return {
    source,
    dispatchState,
    ...(stringValue('code') === undefined ? {} : { nativeCode: stringValue('code') }),
    ...(numericStatus === undefined ? {} : { httpStatus: numericStatus }),
    ...(stringValue('sqlState') === undefined ? {} : { sqlState: stringValue('sqlState') }),
    ...(stringValue('message') === undefined ? {} : { message: stringValue('message') }),
    ...(stringValue('hint') === undefined ? {} : { hint: stringValue('hint') }),
    ...(stringValue('details') === undefined ? {} : { details: stringValue('details') }),
    ...(stringValue('stack') === undefined ? {} : { stack: stringValue('stack') }),
    ...(stringValue('constraint') === undefined ? {} : { constraint: stringValue('constraint') }),
    ...(stringValue('schema') === undefined ? {} : { schema: stringValue('schema') }),
    ...(stringValue('table') === undefined ? {} : { table: stringValue('table') }),
    ...(stringValue('routine') === undefined ? {} : { routine: stringValue('routine') }),
    ...(record.cause === undefined ? {} : { cause: record.cause }),
  };
}

export function normalizeSupabaseTechnicalError(
  failure: TechnicalFailureInput,
  context: ErrorNormalizationContext,
  mappings: readonly ErrorNormalizationMapping[] = [],
): NormalizedTechnicalError {
  assertFailure(failure);
  assertContext(context);
  const mapping = resolveMapping(failure, context, mappings);
  const unknownCommandResult = isUnknownCommandResult(failure, context);
  const family = context.contractOutcome?.family
    ?? (unknownCommandResult ? 'RESULT_UNKNOWN' : mapping?.family ?? 'INTERNAL_UNDISCLOSED');
  const retry = unknownCommandResult
    ? 'RECONCILE_BEFORE_RETRY'
    : context.retryContract.directive;
  const requiresReconciliation = unknownCommandResult;
  const publicError: PublicTechnicalError = {
    ok: false,
    code: publicCode(family, context.contractOutcome),
    family,
    retry,
    requiresReconciliation,
    ...(context.correlationId === undefined ? {} : { correlationId: context.correlationId }),
  };

  return {
    ok: false,
    policyId: ERROR_NORMALIZATION_POLICY_ID,
    family,
    operation: context.operation,
    runtime: context.runtime,
    effectCertainty: context.effectCertainty,
    retry,
    requiresReconciliation,
    contractOutcome: context.contractOutcome ?? null,
    mapping: mapping === null
      ? null
      : { mappingId: mapping.mappingId, mappingVersion: mapping.mappingVersion },
    publicError,
    protectedDiagnostic: protectedDiagnostic(failure, context),
    redactionApplied: true,
  };
}

export function toPublicTechnicalError(
  normalized: NormalizedTechnicalError,
): PublicTechnicalError {
  return { ...normalized.publicError };
}
