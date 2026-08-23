import type {
  NormalizableFieldDescriptor,
  NormalizableFieldSemanticClass,
  NormalizationOperationKind,
  NormalizationRepresentationRole,
  NormalizationSourceRole,
  NormalizationTreatmentMode,
} from './normalization.types.js';
import {
  COMMERCIAL_CONNECTOR_CATALOG_ID,
  OFFICIAL_TEXT_EXCEPTION_CATALOG_ID,
} from './normalization.catalogs.js';
import type {
  CommercialCapitalizationLocale,
  CommercialCapitalizationSegment,
} from './normalization.rules.js';

/**
 * Canonical orthographic dictionary for SHELL-NORM-005::GLOBAL.
 *
 * This module is pure and deterministic. It has no I/O, persistence, implicit
 * locale, implicit clock, search heuristics, identity authority, merge
 * authority, or Supabase dependency.
 */

export const CANONICAL_ORTHOGRAPHIC_DICTIONARY_ID =
  'VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0' as const;

export const CANONICAL_ORTHOGRAPHIC_DICTIONARY_LOCALE = 'es-CO' as const;

export const ORTHOGRAPHIC_DICTIONARY_ENTRY_FIELDS = [
  'dictionary_entry_key',
  'locale',
  'source_form',
  'canonical_form',
  'match_scope',
  'semantic_class',
  'domain_scope',
  'entity_scope',
  'field_scope',
  'representation_role',
  'source_role',
  'case_projection_mode',
  'decision_mode',
  'status',
  'valid_from',
  'valid_to',
  'dictionary_version',
  'supersedes',
  'evidence_reference',
  'approval_reference',
  'reason',
] as const;

export const ORTHOGRAPHIC_DICTIONARY_MATCH_SCOPES = [
  'FULL_VALUE',
  'PHRASE',
  'TOKEN',
] as const;

export type OrthographicDictionaryMatchScope =
  typeof ORTHOGRAPHIC_DICTIONARY_MATCH_SCOPES[number];

export const ORTHOGRAPHIC_DICTIONARY_CASE_PROJECTION_MODE =
  'PRESERVE_RESOLVED_CASE_PATTERN' as const;

export type OrthographicDictionaryCaseProjectionMode =
  typeof ORTHOGRAPHIC_DICTIONARY_CASE_PROJECTION_MODE;

export const ORTHOGRAPHIC_DICTIONARY_DECISION_MODES = [
  'REPLACE_ORTHOGRAPHY',
  'PRESERVE_AS_APPROVED',
  'REVIEW_REQUIRED',
] as const;

export type OrthographicDictionaryDecisionMode =
  typeof ORTHOGRAPHIC_DICTIONARY_DECISION_MODES[number];

export const ORTHOGRAPHIC_DICTIONARY_RESOLUTION_LEVELS = [
  'FIELD_SCOPE',
  'ENTITY_SCOPE',
  'DOMAIN_SCOPE',
  'VENTO_OS_TRANSVERSAL_SCOPE',
] as const;

export type OrthographicDictionaryResolutionLevel =
  typeof ORTHOGRAPHIC_DICTIONARY_RESOLUTION_LEVELS[number];

export const ORTHOGRAPHIC_DICTIONARY_PRECEDENCE = [
  { rank: 1, rule: 'excepción oficial de frase válida más larga' },
  { rank: 2, rule: 'excepción oficial de token o componente estructurado' },
  { rank: 3, rule: 'protección técnica por clase, representación o fuente' },
  { rank: 4, rule: 'entrada de diccionario más específica' },
  { rank: 5, rule: 'entrada de frase más larga dentro de la misma especificidad' },
  { rank: 6, rule: 'entrada de token exacto' },
  { rank: 7, rule: 'token sin entrada' },
  { rank: 8, rule: 'forma ambigua o conflictiva' },
] as const;

export const ORTHOGRAPHIC_DICTIONARY_STATUSES = [
  'DRAFT',
  'APPROVED_ACTIVE',
  'SUSPENDED',
  'SUPERSEDED',
  'RETIRED',
  'REJECTED',
] as const;

export type OrthographicDictionaryStatus =
  typeof ORTHOGRAPHIC_DICTIONARY_STATUSES[number];

export const ORTHOGRAPHIC_DICTIONARY_RESULTS = [
  'DICTIONARY_CANONICAL_EMITTED',
  'DICTIONARY_ALREADY_CANONICAL',
  'DICTIONARY_PRESERVED_PROTECTED',
  'DICTIONARY_NOT_APPLICABLE',
  'DICTIONARY_AMBIGUOUS_REVIEW',
  'DICTIONARY_CONFLICT_BLOCKED',
  'DICTIONARY_POLICY_BLOCKED',
] as const;

export type OrthographicDictionaryEvaluationResult =
  typeof ORTHOGRAPHIC_DICTIONARY_RESULTS[number];

export const ORTHOGRAPHIC_DICTIONARY_ACTIVATION_CONDITIONS = [
  'existe una política activa para dominio, entidad y campo',
  'la clase semántica admite corrección mediante diccionario',
  'la representación y el rol de fuente permiten mutación o derivación',
  'el perfil lingüístico es es-CO',
  'la versión del diccionario es compatible con capitalización, conectores y excepciones',
  'la entrada está APPROVED_ACTIVE y dentro de vigencia',
  'la coincidencia exacta y fronteras pueden resolverse',
  'no existe excepción oficial o protección de mayor precedencia',
  'no existe conflicto entre entradas activas aplicables',
  'la proyección de caja puede resolverse determinísticamente',
  'decisión, entrada y versiones pueden quedar trazadas',
] as const;

export const ORTHOGRAPHIC_DICTIONARY_AMBIGUOUS_FORMS = ['expresso'] as const;

export interface OrthographicDictionaryNormativeEntry {
  readonly dictionary_entry_key: string;
  readonly source_form: string;
  readonly canonical_form: string;
  readonly match_scope: OrthographicDictionaryMatchScope;
  readonly decision_mode: OrthographicDictionaryDecisionMode;
}

export const ORTHOGRAPHIC_DICTIONARY_NORMATIVE_ENTRIES = [
  {
    dictionary_entry_key: 'ORTHO_ES_CO_MAIZ_MAIZ',
    source_form: 'maiz',
    canonical_form: 'maíz',
    match_scope: 'TOKEN',
    decision_mode: 'REPLACE_ORTHOGRAPHY',
  },
  {
    dictionary_entry_key: 'ORTHO_ES_CO_CLASICO_CLASICO',
    source_form: 'clasico',
    canonical_form: 'clásico',
    match_scope: 'TOKEN',
    decision_mode: 'REPLACE_ORTHOGRAPHY',
  },
  {
    dictionary_entry_key: 'ORTHO_ES_CO_FRIO_FRIO',
    source_form: 'frio',
    canonical_form: 'frío',
    match_scope: 'TOKEN',
    decision_mode: 'REPLACE_ORTHOGRAPHY',
  },
] as const satisfies readonly OrthographicDictionaryNormativeEntry[];

export interface OrthographicDictionaryEntry {
  readonly dictionary_entry_key: string;
  readonly locale: typeof CANONICAL_ORTHOGRAPHIC_DICTIONARY_LOCALE;
  readonly source_form: string;
  readonly canonical_form: string;
  readonly match_scope: OrthographicDictionaryMatchScope;
  readonly semantic_class: NormalizableFieldSemanticClass;
  readonly domain_scope: string;
  readonly entity_scope: string | null;
  readonly field_scope: string | null;
  readonly representation_role: NormalizationRepresentationRole;
  readonly source_role: NormalizationSourceRole;
  readonly case_projection_mode: OrthographicDictionaryCaseProjectionMode;
  readonly decision_mode: OrthographicDictionaryDecisionMode;
  readonly status: OrthographicDictionaryStatus;
  readonly valid_from: string;
  readonly valid_to: string | null;
  readonly dictionary_version: typeof CANONICAL_ORTHOGRAPHIC_DICTIONARY_ID;
  readonly supersedes: readonly string[];
  readonly evidence_reference: string;
  readonly approval_reference: string;
  readonly reason: string;
}

export interface OrthographicDictionaryActivationBinding {
  readonly scope_level: OrthographicDictionaryResolutionLevel;
  readonly semantic_class: NormalizableFieldSemanticClass;
  readonly domain_scope: string;
  readonly entity_scope: string | null;
  readonly field_scope: string | null;
  readonly representation_role: NormalizationRepresentationRole;
  readonly source_role: NormalizationSourceRole;
  readonly status: OrthographicDictionaryStatus;
  readonly valid_from: string;
  readonly valid_to: string | null;
  readonly supersedes: readonly string[];
  readonly evidence_reference: string;
  readonly approval_reference: string;
  readonly reason: string;
}

export type OrthographicDictionaryEntryBuildResult =
  | { readonly ok: true; readonly entry: OrthographicDictionaryEntry }
  | { readonly ok: false; readonly reason: string };

export interface OrthographicDictionaryPolicy {
  readonly descriptor: NormalizableFieldDescriptor;
  readonly policy_active: boolean;
  readonly operation_kind: 'APPROVED_DICTIONARY_CORRECTION';
  readonly treatment_mode: NormalizationTreatmentMode;
  readonly allowed_operations: readonly NormalizationOperationKind[];
  readonly policy_version_ref: string;
}

export interface OrthographicDictionaryTextAdapter {
  readonly segmentation_version_ref: string;
  readonly case_mapping_version_ref: string;
  readonly segment: (value: string) => readonly CommercialCapitalizationSegment[];
  readonly graphemes: (value: string) => readonly string[];
  readonly to_upper: (value: string, locale: CommercialCapitalizationLocale) => string;
  readonly to_lower: (value: string, locale: CommercialCapitalizationLocale) => string;
}

export type OrthographicHigherPrecedenceDisposition =
  | 'CLEAR'
  | 'PROTECTED'
  | 'REVIEW'
  | 'BLOCKED';

export interface OrthographicHigherPrecedenceDecision {
  readonly disposition: OrthographicHigherPrecedenceDisposition;
  readonly reference: string | null;
  readonly detail: string | null;
}

export interface OrthographicDictionaryPrecedenceResolver {
  readonly connector_catalog_version_ref: typeof COMMERCIAL_CONNECTOR_CATALOG_ID;
  readonly exception_catalog_version_ref: typeof OFFICIAL_TEXT_EXCEPTION_CATALOG_ID;
  readonly evaluate: (
    value: string,
    descriptor: NormalizableFieldDescriptor,
  ) => OrthographicHigherPrecedenceDecision;
}

export type OrthographicDictionaryProductBoundary = 'VENTO_OS' | 'VITAL';

export interface OrthographicDictionaryEvaluationContext {
  readonly product_boundary: OrthographicDictionaryProductBoundary;
  readonly policy: OrthographicDictionaryPolicy;
  readonly locale: typeof CANONICAL_ORTHOGRAPHIC_DICTIONARY_LOCALE;
  readonly capitalization_profile_ref: 'VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0';
  readonly capitalization_version_ref: string;
  readonly dictionary_version_ref: typeof CANONICAL_ORTHOGRAPHIC_DICTIONARY_ID;
  readonly effective_at: string;
  readonly text_adapter: OrthographicDictionaryTextAdapter;
  readonly precedence_resolver: OrthographicDictionaryPrecedenceResolver;
}

export interface OrthographicDictionaryTokenEvaluation {
  readonly input: string;
  readonly output: string;
  readonly result: OrthographicDictionaryEvaluationResult;
  readonly dictionary_entry_key: string | null;
  readonly resolved_scope_level: OrthographicDictionaryResolutionLevel | null;
  readonly protected_reference: string | null;
}

export interface OrthographicDictionaryEvaluation {
  readonly result: OrthographicDictionaryEvaluationResult;
  readonly input: string;
  readonly output: string;
  readonly changed: boolean;
  readonly blocked: boolean;
  readonly review_required: boolean;
  readonly dictionary_version_ref: typeof CANONICAL_ORTHOGRAPHIC_DICTIONARY_ID;
  readonly policy_version_ref: string;
  readonly version_refs: readonly string[];
  readonly matched_entry_keys: readonly string[];
  readonly evidence_references: readonly string[];
  readonly approval_references: readonly string[];
  readonly token_evaluations: readonly OrthographicDictionaryTokenEvaluation[];
  readonly detail: string | null;
}

const MUTABLE_PAIRS = new Set([
  'PRIMARY_VALUE::AUTHORITATIVE_SOURCE',
  'DISPLAY_OVERRIDE::APPROVED_OVERRIDE',
]);

const DERIVATION_PAIR = 'OUTPUT_PROJECTION::OUTPUT_ONLY';

const PROTECTED_SEMANTIC_CLASSES = new Set<NormalizableFieldSemanticClass>([
  'OFFICIAL_BRAND_FORM',
  'OFFICIAL_LEGAL_NAME',
  'MEASUREMENT_OR_UNIT_CODE',
  'TECHNICAL_IDENTIFIER',
  'CONTACT_IDENTIFIER',
  'SECRET_OR_SIGNATURE_MATERIAL',
  'UNCLASSIFIED_PRESERVE',
]);

function nonEmpty(value: string): boolean {
  return value.trim().length > 0;
}

function exactUnique(values: readonly string[]): boolean {
  return values.every(nonEmpty) && new Set(values).size === values.length;
}

function parseInstant(value: string): number | null {
  if (!nonEmpty(value)) return null;
  const parsed = Date.parse(value);
  return Number.isFinite(parsed) ? parsed : null;
}

function normativeEntry(
  entryKey: string,
): OrthographicDictionaryNormativeEntry | null {
  return ORTHOGRAPHIC_DICTIONARY_NORMATIVE_ENTRIES.find(
    (entry) => entry.dictionary_entry_key === entryKey,
  ) ?? null;
}

function scopeShapeValid(binding: OrthographicDictionaryActivationBinding): boolean {
  const domain = binding.domain_scope;
  const entity = binding.entity_scope;
  const field = binding.field_scope;

  if (!nonEmpty(domain)) return false;

  if (binding.scope_level === 'VENTO_OS_TRANSVERSAL_SCOPE') {
    return domain === 'VENTO_OS_TRANSVERSAL_SCOPE' && entity === null && field === null;
  }
  if (domain === 'VENTO_OS_TRANSVERSAL_SCOPE') return false;

  if (binding.scope_level === 'DOMAIN_SCOPE') {
    return entity === null && field === null;
  }
  if (binding.scope_level === 'ENTITY_SCOPE') {
    return entity !== null && nonEmpty(entity) && field === null;
  }
  return entity !== null && nonEmpty(entity) && field !== null && nonEmpty(field);
}

export function materializeOrthographicDictionaryEntry(
  entryKey: string,
  binding: OrthographicDictionaryActivationBinding,
): OrthographicDictionaryEntryBuildResult {
  const definition = normativeEntry(entryKey);
  if (!definition) return { ok: false, reason: 'unknown canonical dictionary entry' };
  if (!scopeShapeValid(binding)) {
    return { ok: false, reason: 'scope binding does not match the declared resolution level' };
  }
  if (!ORTHOGRAPHIC_DICTIONARY_STATUSES.includes(binding.status)) {
    return { ok: false, reason: 'dictionary status is not canonical' };
  }
  if (!nonEmpty(binding.evidence_reference) || !nonEmpty(binding.approval_reference)) {
    return { ok: false, reason: 'evidence_reference and approval_reference are required' };
  }
  if (!nonEmpty(binding.reason)) {
    return { ok: false, reason: 'reason is required' };
  }
  if (!exactUnique(binding.supersedes) && binding.supersedes.length > 0) {
    return { ok: false, reason: 'supersedes must contain unique non-empty references' };
  }

  const validFrom = parseInstant(binding.valid_from);
  const validTo = binding.valid_to === null ? null : parseInstant(binding.valid_to);
  if (validFrom === null || (binding.valid_to !== null && validTo === null)) {
    return { ok: false, reason: 'valid_from and valid_to must be concrete ISO date/time values' };
  }
  if (validTo !== null && validTo <= validFrom) {
    return { ok: false, reason: 'valid_to must be later than valid_from' };
  }

  return {
    ok: true,
    entry: {
      dictionary_entry_key: definition.dictionary_entry_key,
      locale: CANONICAL_ORTHOGRAPHIC_DICTIONARY_LOCALE,
      source_form: definition.source_form,
      canonical_form: definition.canonical_form,
      match_scope: definition.match_scope,
      semantic_class: binding.semantic_class,
      domain_scope: binding.domain_scope,
      entity_scope: binding.entity_scope,
      field_scope: binding.field_scope,
      representation_role: binding.representation_role,
      source_role: binding.source_role,
      case_projection_mode: ORTHOGRAPHIC_DICTIONARY_CASE_PROJECTION_MODE,
      decision_mode: definition.decision_mode,
      status: binding.status,
      valid_from: binding.valid_from,
      valid_to: binding.valid_to,
      dictionary_version: CANONICAL_ORTHOGRAPHIC_DICTIONARY_ID,
      supersedes: [...binding.supersedes],
      evidence_reference: binding.evidence_reference,
      approval_reference: binding.approval_reference,
      reason: binding.reason,
    },
  };
}

function safeLower(
  adapter: OrthographicDictionaryTextAdapter,
  value: string,
): string | null {
  if (!nonEmpty(adapter.case_mapping_version_ref)) return null;
  try {
    const lowered = adapter.to_lower(value, CANONICAL_ORTHOGRAPHIC_DICTIONARY_LOCALE);
    return typeof lowered === 'string' ? lowered : null;
  } catch {
    return null;
  }
}

function safeUpper(
  adapter: OrthographicDictionaryTextAdapter,
  value: string,
): string | null {
  if (!nonEmpty(adapter.case_mapping_version_ref)) return null;
  try {
    const uppered = adapter.to_upper(value, CANONICAL_ORTHOGRAPHIC_DICTIONARY_LOCALE);
    return typeof uppered === 'string' ? uppered : null;
  } catch {
    return null;
  }
}

function scopeLevel(entry: OrthographicDictionaryEntry): OrthographicDictionaryResolutionLevel | null {
  if (entry.domain_scope === 'VENTO_OS_TRANSVERSAL_SCOPE') {
    return entry.entity_scope === null && entry.field_scope === null
      ? 'VENTO_OS_TRANSVERSAL_SCOPE'
      : null;
  }
  if (!nonEmpty(entry.domain_scope)) return null;
  if (entry.entity_scope === null && entry.field_scope === null) return 'DOMAIN_SCOPE';
  if (entry.entity_scope !== null && nonEmpty(entry.entity_scope) && entry.field_scope === null) {
    return 'ENTITY_SCOPE';
  }
  if (
    entry.entity_scope !== null
    && nonEmpty(entry.entity_scope)
    && entry.field_scope !== null
    && nonEmpty(entry.field_scope)
  ) {
    return 'FIELD_SCOPE';
  }
  return null;
}

function scopeRank(level: OrthographicDictionaryResolutionLevel): number {
  if (level === 'FIELD_SCOPE') return 4;
  if (level === 'ENTITY_SCOPE') return 3;
  if (level === 'DOMAIN_SCOPE') return 2;
  return 1;
}

function scopeMatches(
  entry: OrthographicDictionaryEntry,
  descriptor: NormalizableFieldDescriptor,
): boolean {
  const level = scopeLevel(entry);
  if (level === null) return false;
  if (level === 'VENTO_OS_TRANSVERSAL_SCOPE') return true;
  if (entry.domain_scope !== descriptor.coordinate.owner_domain_ref) return false;
  if (level === 'DOMAIN_SCOPE') return true;
  if (entry.entity_scope !== descriptor.coordinate.owner_entity_ref) return false;
  if (level === 'ENTITY_SCOPE') return true;
  return entry.field_scope === descriptor.coordinate.semantic_field_ref;
}

function entryContractValid(entry: OrthographicDictionaryEntry): boolean {
  const definition = normativeEntry(entry.dictionary_entry_key);
  if (!definition) return false;
  if (
    entry.locale !== CANONICAL_ORTHOGRAPHIC_DICTIONARY_LOCALE
    || entry.dictionary_version !== CANONICAL_ORTHOGRAPHIC_DICTIONARY_ID
    || entry.source_form !== definition.source_form
    || entry.canonical_form !== definition.canonical_form
    || entry.match_scope !== definition.match_scope
    || entry.decision_mode !== definition.decision_mode
    || entry.case_projection_mode !== ORTHOGRAPHIC_DICTIONARY_CASE_PROJECTION_MODE
    || !ORTHOGRAPHIC_DICTIONARY_STATUSES.includes(entry.status)
    || !nonEmpty(entry.evidence_reference)
    || !nonEmpty(entry.approval_reference)
    || !nonEmpty(entry.reason)
    || scopeLevel(entry) === null
  ) {
    return false;
  }
  const validFrom = parseInstant(entry.valid_from);
  const validTo = entry.valid_to === null ? null : parseInstant(entry.valid_to);
  return validFrom !== null
    && (entry.valid_to === null || validTo !== null)
    && (validTo === null || validTo > validFrom)
    && (entry.supersedes.length === 0 || exactUnique(entry.supersedes));
}

function entryActiveAt(entry: OrthographicDictionaryEntry, effectiveAt: number): boolean {
  if (entry.status !== 'APPROVED_ACTIVE') return false;
  const validFrom = parseInstant(entry.valid_from);
  const validTo = entry.valid_to === null ? null : parseInstant(entry.valid_to);
  if (validFrom === null || (entry.valid_to !== null && validTo === null)) return false;
  return effectiveAt >= validFrom && (validTo === null || effectiveAt < validTo);
}

function descriptorCompatible(
  entry: OrthographicDictionaryEntry,
  descriptor: NormalizableFieldDescriptor,
): boolean {
  return entry.semantic_class === descriptor.semantic_class
    && entry.representation_role === descriptor.representation_role
    && entry.source_role === descriptor.source_role
    && scopeMatches(entry, descriptor);
}

function policyBlockDetail(context: OrthographicDictionaryEvaluationContext): string | null {
  const { policy } = context;
  if (context.product_boundary !== 'VENTO_OS') {
    return 'VITAL does not inherit the Vento OS transversal dictionary';
  }
  if (!policy.policy_active) return 'field policy is not active';
  if (policy.operation_kind !== 'APPROVED_DICTIONARY_CORRECTION') {
    return 'operation_kind must be APPROVED_DICTIONARY_CORRECTION';
  }
  if (!nonEmpty(policy.policy_version_ref)) return 'policy_version_ref is required';
  if (policy.descriptor.policy_version_ref !== policy.policy_version_ref) {
    return 'descriptor and effective policy versions differ';
  }
  if (!policy.allowed_operations.includes('APPROVED_DICTIONARY_CORRECTION')) {
    return 'field policy does not authorize APPROVED_DICTIONARY_CORRECTION';
  }
  if (PROTECTED_SEMANTIC_CLASSES.has(policy.descriptor.semantic_class)) {
    return 'semantic class is protected from ordinary dictionary correction';
  }

  const pair = `${policy.descriptor.representation_role}::${policy.descriptor.source_role}`;
  if (MUTABLE_PAIRS.has(pair)) {
    if (policy.treatment_mode !== 'DICTIONARY_MUTATION_ALLOWED') {
      return 'mutable representation requires DICTIONARY_MUTATION_ALLOWED';
    }
  } else if (pair === DERIVATION_PAIR) {
    if (policy.treatment_mode !== 'DERIVATION_ONLY') {
      return 'output projection requires DERIVATION_ONLY';
    }
  } else {
    return 'representation and source do not permit independent dictionary correction';
  }

  if (context.locale !== CANONICAL_ORTHOGRAPHIC_DICTIONARY_LOCALE) {
    return 'dictionary locale must be explicit es-CO';
  }
  if (context.capitalization_profile_ref !== 'VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0') {
    return 'capitalization profile is incompatible with this dictionary';
  }
  if (context.dictionary_version_ref !== CANONICAL_ORTHOGRAPHIC_DICTIONARY_ID) {
    return 'dictionary version is not the canonical active contract';
  }
  if (
    context.precedence_resolver.connector_catalog_version_ref !== COMMERCIAL_CONNECTOR_CATALOG_ID
    || context.precedence_resolver.exception_catalog_version_ref !== OFFICIAL_TEXT_EXCEPTION_CATALOG_ID
  ) {
    return 'connector or exception catalog version is incompatible with dictionary evaluation';
  }
  if (
    !nonEmpty(context.capitalization_version_ref)
    || !nonEmpty(context.text_adapter.segmentation_version_ref)
    || !nonEmpty(context.text_adapter.case_mapping_version_ref)
  ) {
    return 'capitalization segmentation and case mapping versions are required';
  }
  if (parseInstant(context.effective_at) === null) {
    return 'effective_at must be an explicit ISO date/time';
  }
  return null;
}

function projectResolvedCasePattern(
  input: string,
  canonical: string,
  adapter: OrthographicDictionaryTextAdapter,
): string | null {
  let inputGraphemes: readonly string[];
  let canonicalGraphemes: readonly string[];
  try {
    inputGraphemes = adapter.graphemes(input);
    canonicalGraphemes = adapter.graphemes(canonical);
  } catch {
    return null;
  }
  if (
    inputGraphemes.length === 0
    || inputGraphemes.length !== canonicalGraphemes.length
    || inputGraphemes.join('') !== input
    || canonicalGraphemes.join('') !== canonical
  ) {
    return null;
  }

  let output = '';
  for (let index = 0; index < inputGraphemes.length; index += 1) {
    const inputGrapheme = inputGraphemes[index];
    const canonicalGrapheme = canonicalGraphemes[index];
    const inputLower = safeLower(adapter, inputGrapheme);
    const inputUpper = safeUpper(adapter, inputGrapheme);
    const canonicalLower = safeLower(adapter, canonicalGrapheme);
    const canonicalUpper = safeUpper(adapter, canonicalGrapheme);
    if (
      inputLower === null
      || inputUpper === null
      || canonicalLower === null
      || canonicalUpper === null
    ) {
      return null;
    }

    const inputHasCase = inputLower !== inputUpper;
    const canonicalHasCase = canonicalLower !== canonicalUpper;
    if (!inputHasCase && !canonicalHasCase) {
      output += canonicalGrapheme;
      continue;
    }
    if (inputHasCase !== canonicalHasCase) return null;

    if (inputGrapheme === inputUpper && inputGrapheme !== inputLower) {
      output += canonicalUpper;
      continue;
    }
    if (inputGrapheme === inputLower && inputGrapheme !== inputUpper) {
      output += canonicalLower;
      continue;
    }
    return null;
  }
  return output;
}

function casefoldEquals(
  left: string,
  right: string,
  adapter: OrthographicDictionaryTextAdapter,
): boolean | null {
  const leftLower = safeLower(adapter, left);
  const rightLower = safeLower(adapter, right);
  if (leftLower === null || rightLower === null) return null;
  return leftLower === rightLower;
}

function uniqueRefs(values: readonly string[]): readonly string[] {
  return [...new Set(values.filter(nonEmpty))];
}

function globalResult(
  input: string,
  output: string,
  result: OrthographicDictionaryEvaluationResult,
  context: OrthographicDictionaryEvaluationContext,
  evaluations: readonly OrthographicDictionaryTokenEvaluation[],
  entries: readonly OrthographicDictionaryEntry[],
  detail: string | null,
): OrthographicDictionaryEvaluation {
  const blocked = result === 'DICTIONARY_AMBIGUOUS_REVIEW'
    || result === 'DICTIONARY_CONFLICT_BLOCKED'
    || result === 'DICTIONARY_POLICY_BLOCKED';
  const reviewRequired = result === 'DICTIONARY_AMBIGUOUS_REVIEW';
  const finalOutput = blocked ? input : output;
  const matchedKeys = uniqueRefs(evaluations
    .map((evaluation) => evaluation.dictionary_entry_key ?? '')
    .filter(nonEmpty));
  const matchedEntries = entries.filter((entry) => matchedKeys.includes(entry.dictionary_entry_key));

  return {
    result,
    input,
    output: finalOutput,
    changed: !blocked && finalOutput !== input,
    blocked,
    review_required: reviewRequired,
    dictionary_version_ref: CANONICAL_ORTHOGRAPHIC_DICTIONARY_ID,
    policy_version_ref: context.policy.policy_version_ref,
    version_refs: uniqueRefs([
      context.policy.policy_version_ref,
      context.capitalization_profile_ref,
      context.capitalization_version_ref,
      context.precedence_resolver.connector_catalog_version_ref,
      context.precedence_resolver.exception_catalog_version_ref,
      context.dictionary_version_ref,
      context.text_adapter.segmentation_version_ref,
      context.text_adapter.case_mapping_version_ref,
    ]),
    matched_entry_keys: matchedKeys,
    evidence_references: uniqueRefs(matchedEntries.map((entry) => entry.evidence_reference)),
    approval_references: uniqueRefs(matchedEntries.map((entry) => entry.approval_reference)),
    token_evaluations: [...evaluations],
    detail,
  };
}

function ambiguousFormMatches(
  value: string,
  adapter: OrthographicDictionaryTextAdapter,
): boolean | null {
  for (const ambiguous of ORTHOGRAPHIC_DICTIONARY_AMBIGUOUS_FORMS) {
    const match = casefoldEquals(value, ambiguous, adapter);
    if (match === null) return null;
    if (match) return true;
  }
  return false;
}

function candidateEntriesForToken(
  token: string,
  entries: readonly OrthographicDictionaryEntry[],
  context: OrthographicDictionaryEvaluationContext,
  effectiveAt: number,
): readonly {
  readonly entry: OrthographicDictionaryEntry;
  readonly level: OrthographicDictionaryResolutionLevel;
  readonly sourceMatch: boolean;
  readonly canonicalMatch: boolean;
}[] | null {
  const candidates = [];
  for (const entry of entries) {
    if (!entryContractValid(entry)) return null;
    if (entry.match_scope !== 'TOKEN') continue;
    if (!descriptorCompatible(entry, context.policy.descriptor)) continue;

    const sourceMatch = casefoldEquals(token, entry.source_form, context.text_adapter);
    const canonicalMatch = casefoldEquals(token, entry.canonical_form, context.text_adapter);
    if (sourceMatch === null || canonicalMatch === null) return null;
    if (!sourceMatch && !canonicalMatch) continue;

    const level = scopeLevel(entry);
    if (level === null) return null;
    candidates.push({ entry, level, sourceMatch, canonicalMatch });
  }

  const matchingInactive = candidates.filter(({ entry }) => !entryActiveAt(entry, effectiveAt));
  const matchingActive = candidates.filter(({ entry }) => entryActiveAt(entry, effectiveAt));
  if (matchingActive.length === 0 && matchingInactive.length > 0) {
    return matchingInactive;
  }
  return matchingActive;
}

function selectMostSpecificTokenEntry(
  token: string,
  entries: readonly OrthographicDictionaryEntry[],
  context: OrthographicDictionaryEvaluationContext,
  effectiveAt: number,
):
  | { readonly kind: 'NONE' }
  | { readonly kind: 'INVALID' }
  | { readonly kind: 'INACTIVE'; readonly entries: readonly OrthographicDictionaryEntry[] }
  | { readonly kind: 'CONFLICT'; readonly entries: readonly OrthographicDictionaryEntry[] }
  | {
      readonly kind: 'SELECTED';
      readonly entry: OrthographicDictionaryEntry;
      readonly level: OrthographicDictionaryResolutionLevel;
      readonly canonicalMatch: boolean;
    } {
  const candidates = candidateEntriesForToken(token, entries, context, effectiveAt);
  if (candidates === null) return { kind: 'INVALID' };
  if (candidates.length === 0) return { kind: 'NONE' };

  const active = candidates.filter(({ entry }) => entryActiveAt(entry, effectiveAt));
  if (active.length === 0) {
    return { kind: 'INACTIVE', entries: candidates.map(({ entry }) => entry) };
  }

  const bestRank = Math.max(...active.map(({ level }) => scopeRank(level)));
  const top = active.filter(({ level }) => scopeRank(level) === bestRank);
  if (top.length !== 1) {
    return { kind: 'CONFLICT', entries: top.map(({ entry }) => entry) };
  }
  return {
    kind: 'SELECTED',
    entry: top[0].entry,
    level: top[0].level,
    canonicalMatch: top[0].canonicalMatch,
  };
}

export function applyOrthographicDictionary(
  input: string,
  entries: readonly OrthographicDictionaryEntry[],
  context: OrthographicDictionaryEvaluationContext,
): OrthographicDictionaryEvaluation {
  const policyBlock = policyBlockDetail(context);
  if (policyBlock) {
    return globalResult(input, input, 'DICTIONARY_POLICY_BLOCKED', context, [], entries, policyBlock);
  }

  const effectiveAt = parseInstant(context.effective_at);
  if (effectiveAt === null) {
    return globalResult(
      input,
      input,
      'DICTIONARY_POLICY_BLOCKED',
      context,
      [],
      entries,
      'effective_at is invalid',
    );
  }

  let segments: readonly CommercialCapitalizationSegment[];
  try {
    segments = context.text_adapter.segment(input);
  } catch {
    return globalResult(
      input,
      input,
      'DICTIONARY_POLICY_BLOCKED',
      context,
      [],
      entries,
      'segmentation adapter failed',
    );
  }
  if (
    segments.length === 0
    || segments.some((segment) => segment.text.length === 0)
    || segments.map((segment) => segment.text).join('') !== input
  ) {
    return globalResult(
      input,
      input,
      'DICTIONARY_POLICY_BLOCKED',
      context,
      [],
      entries,
      'segmentation must preserve the full input and all separators',
    );
  }

  const outputSegments = segments.map((segment) => segment.text);
  const evaluations: OrthographicDictionaryTokenEvaluation[] = [];
  let changed = false;
  let alreadyCanonical = false;
  let protectedFound = false;

  for (let index = 0; index < segments.length; index += 1) {
    const segment = segments[index];
    if (segment.is_separator) continue;

    const ambiguous = ambiguousFormMatches(segment.text, context.text_adapter);
    if (ambiguous === null) {
      return globalResult(
        input,
        input,
        'DICTIONARY_POLICY_BLOCKED',
        context,
        evaluations,
        entries,
        'case mapping could not evaluate an ambiguous-form guard',
      );
    }
    if (ambiguous) {
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_AMBIGUOUS_REVIEW',
        dictionary_entry_key: null,
        resolved_scope_level: null,
        protected_reference: 'DATA-NORM-ARC-007',
      });
      return globalResult(
        input,
        input,
        'DICTIONARY_AMBIGUOUS_REVIEW',
        context,
        evaluations,
        entries,
        'expresso remains excluded from automatic correction',
      );
    }

    let precedence: OrthographicHigherPrecedenceDecision;
    try {
      precedence = context.precedence_resolver.evaluate(segment.text, context.policy.descriptor);
    } catch {
      return globalResult(
        input,
        input,
        'DICTIONARY_POLICY_BLOCKED',
        context,
        evaluations,
        entries,
        'higher-precedence resolver failed',
      );
    }
    if (precedence.disposition === 'BLOCKED') {
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_POLICY_BLOCKED',
        dictionary_entry_key: null,
        resolved_scope_level: null,
        protected_reference: precedence.reference,
      });
      return globalResult(
        input,
        input,
        'DICTIONARY_POLICY_BLOCKED',
        context,
        evaluations,
        entries,
        precedence.detail ?? 'higher-precedence decision is blocked',
      );
    }
    if (precedence.disposition === 'REVIEW') {
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_AMBIGUOUS_REVIEW',
        dictionary_entry_key: null,
        resolved_scope_level: null,
        protected_reference: precedence.reference,
      });
      return globalResult(
        input,
        input,
        'DICTIONARY_AMBIGUOUS_REVIEW',
        context,
        evaluations,
        entries,
        precedence.detail ?? 'higher-precedence decision requires review',
      );
    }
    if (precedence.disposition === 'PROTECTED') {
      protectedFound = true;
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_PRESERVED_PROTECTED',
        dictionary_entry_key: null,
        resolved_scope_level: null,
        protected_reference: precedence.reference,
      });
      continue;
    }

    const selected = selectMostSpecificTokenEntry(segment.text, entries, context, effectiveAt);
    if (selected.kind === 'INVALID') {
      return globalResult(
        input,
        input,
        'DICTIONARY_POLICY_BLOCKED',
        context,
        evaluations,
        entries,
        'dictionary registry contains an invalid or non-canonical entry',
      );
    }
    if (selected.kind === 'INACTIVE') {
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_POLICY_BLOCKED',
        dictionary_entry_key: selected.entries[0]?.dictionary_entry_key ?? null,
        resolved_scope_level: selected.entries[0] ? scopeLevel(selected.entries[0]) : null,
        protected_reference: null,
      });
      return globalResult(
        input,
        input,
        'DICTIONARY_POLICY_BLOCKED',
        context,
        evaluations,
        entries,
        'matching dictionary entry exists but is not APPROVED_ACTIVE and effective',
      );
    }
    if (selected.kind === 'CONFLICT') {
      for (const entry of selected.entries) {
        evaluations.push({
          input: segment.text,
          output: segment.text,
          result: 'DICTIONARY_CONFLICT_BLOCKED',
          dictionary_entry_key: entry.dictionary_entry_key,
          resolved_scope_level: scopeLevel(entry),
          protected_reference: null,
        });
      }
      return globalResult(
        input,
        input,
        'DICTIONARY_CONFLICT_BLOCKED',
        context,
        evaluations,
        entries,
        'multiple active entries have the same effective specificity',
      );
    }
    if (selected.kind === 'NONE') {
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_NOT_APPLICABLE',
        dictionary_entry_key: null,
        resolved_scope_level: null,
        protected_reference: null,
      });
      continue;
    }

    if (selected.entry.decision_mode === 'PRESERVE_AS_APPROVED') {
      protectedFound = true;
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_PRESERVED_PROTECTED',
        dictionary_entry_key: selected.entry.dictionary_entry_key,
        resolved_scope_level: selected.level,
        protected_reference: selected.entry.dictionary_entry_key,
      });
      continue;
    }
    if (selected.entry.decision_mode === 'REVIEW_REQUIRED') {
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_AMBIGUOUS_REVIEW',
        dictionary_entry_key: selected.entry.dictionary_entry_key,
        resolved_scope_level: selected.level,
        protected_reference: selected.entry.dictionary_entry_key,
      });
      return globalResult(
        input,
        input,
        'DICTIONARY_AMBIGUOUS_REVIEW',
        context,
        evaluations,
        entries,
        'selected dictionary entry requires human review',
      );
    }

    if (selected.canonicalMatch) {
      alreadyCanonical = true;
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_ALREADY_CANONICAL',
        dictionary_entry_key: selected.entry.dictionary_entry_key,
        resolved_scope_level: selected.level,
        protected_reference: null,
      });
      continue;
    }

    const projected = projectResolvedCasePattern(
      segment.text,
      selected.entry.canonical_form,
      context.text_adapter,
    );
    if (projected === null) {
      evaluations.push({
        input: segment.text,
        output: segment.text,
        result: 'DICTIONARY_POLICY_BLOCKED',
        dictionary_entry_key: selected.entry.dictionary_entry_key,
        resolved_scope_level: selected.level,
        protected_reference: null,
      });
      return globalResult(
        input,
        input,
        'DICTIONARY_POLICY_BLOCKED',
        context,
        evaluations,
        entries,
        'resolved case projection is not deterministic',
      );
    }

    outputSegments[index] = projected;
    changed = changed || projected !== segment.text;
    evaluations.push({
      input: segment.text,
      output: projected,
      result: 'DICTIONARY_CANONICAL_EMITTED',
      dictionary_entry_key: selected.entry.dictionary_entry_key,
      resolved_scope_level: selected.level,
      protected_reference: null,
    });
  }

  const output = outputSegments.join('');
  if (changed) {
    return globalResult(
      input,
      output,
      'DICTIONARY_CANONICAL_EMITTED',
      context,
      evaluations,
      entries,
      null,
    );
  }
  if (alreadyCanonical) {
    return globalResult(
      input,
      input,
      'DICTIONARY_ALREADY_CANONICAL',
      context,
      evaluations,
      entries,
      null,
    );
  }
  if (protectedFound) {
    return globalResult(
      input,
      input,
      'DICTIONARY_PRESERVED_PROTECTED',
      context,
      evaluations,
      entries,
      null,
    );
  }
  return globalResult(
    input,
    input,
    'DICTIONARY_NOT_APPLICABLE',
    context,
    evaluations,
    entries,
    null,
  );
}
