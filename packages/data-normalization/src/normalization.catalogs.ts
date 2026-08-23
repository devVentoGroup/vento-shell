import type {
  NormalizableFieldDescriptor,
  NormalizableFieldSemanticClass,
  NormalizationRepresentationRole,
  NormalizationSourceRole,
} from './normalization.types.js';
import type {
  CommercialCapitalizationCatalogResolver,
  CommercialCapitalizationLocale,
  CommercialCapitalizationPhraseCandidate,
  CommercialCapitalizationSegmentBoundary,
  CommercialCapitalizationTokenCandidate,
} from './normalization.rules.js';

/**
 * Canonical connector and official-exception catalogs for SHELL-NORM-004::GLOBAL.
 *
 * This module is pure and deterministic. It does not persist catalog state, infer
 * business authority, select a runtime locale implicitly, access I/O, or create
 * identity, uniqueness, merge, or commit authority.
 */

export const COMMERCIAL_CONNECTOR_CATALOG_ID =
  'VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0' as const;

export const OFFICIAL_TEXT_EXCEPTION_CATALOG_ID =
  'VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0' as const;

export const COMMERCIAL_CONNECTOR_FAMILIES = [
  'preposiciones y contracciones',
  'artículos',
  'conjunciones coordinantes',
] as const;

export type CommercialConnectorFamily = typeof COMMERCIAL_CONNECTOR_FAMILIES[number];

export const COMMERCIAL_CONNECTOR_ENTRIES = [
  { entry: 'a', family: 'preposiciones y contracciones' },
  { entry: 'al', family: 'preposiciones y contracciones' },
  { entry: 'con', family: 'preposiciones y contracciones' },
  { entry: 'de', family: 'preposiciones y contracciones' },
  { entry: 'del', family: 'preposiciones y contracciones' },
  { entry: 'e', family: 'conjunciones coordinantes' },
  { entry: 'el', family: 'artículos' },
  { entry: 'en', family: 'preposiciones y contracciones' },
  { entry: 'la', family: 'artículos' },
  { entry: 'las', family: 'artículos' },
  { entry: 'lo', family: 'artículos' },
  { entry: 'los', family: 'artículos' },
  { entry: 'o', family: 'conjunciones coordinantes' },
  { entry: 'para', family: 'preposiciones y contracciones' },
  { entry: 'por', family: 'preposiciones y contracciones' },
  { entry: 'sin', family: 'preposiciones y contracciones' },
  { entry: 'u', family: 'conjunciones coordinantes' },
  { entry: 'y', family: 'conjunciones coordinantes' },
] as const satisfies readonly {
  readonly entry: string;
  readonly family: CommercialConnectorFamily;
}[];

export type CommercialConnectorEntry = typeof COMMERCIAL_CONNECTOR_ENTRIES[number]['entry'];

export const COMMERCIAL_CONNECTOR_POSITIONS = [
  'NAME_START',
  'DECLARED_SEGMENT_START',
  'INTERNAL',
] as const;

export type CommercialConnectorPosition = typeof COMMERCIAL_CONNECTOR_POSITIONS[number];

export const COMMERCIAL_CONNECTOR_RESULTS = [
  'CONNECTOR_INITIAL_CAPITALIZED',
  'CONNECTOR_INTERNAL_LOWERCASED',
  'CONNECTOR_PRESERVED_BY_EXCEPTION',
  'CONNECTOR_PRESERVED_AMBIGUOUS',
  'CONNECTOR_POLICY_BLOCKED',
] as const;

export type CommercialConnectorEvaluationResult = typeof COMMERCIAL_CONNECTOR_RESULTS[number];

export const OFFICIAL_EXCEPTION_FAMILIES = [
  'OFFICIAL_BRAND_EXCEPTION',
  'CONTROLLED_ACRONYM_EXCEPTION',
  'MEASUREMENT_UNIT_EXCEPTION',
  'OFFICIAL_LEGAL_NAME_EXCEPTION',
] as const;

export type OfficialExceptionFamily = typeof OFFICIAL_EXCEPTION_FAMILIES[number];

export const OFFICIAL_EXCEPTION_ENTRY_FIELDS = [
  'exception_key',
  'family',
  'canonical_form',
  'scope_kind',
  'domain_scope',
  'entity_scope',
  'field_scope',
  'semantic_class',
  'representation_role',
  'source_role',
  'language_profile',
  'match_mode',
  'accepted_variants',
  'application_mode',
  'authority_type',
  'authority_owner',
  'evidence_reference',
  'status',
  'valid_from',
  'valid_to',
  'catalog_version',
  'supersedes',
  'reason',
] as const;

export const OFFICIAL_EXCEPTION_SCOPE_KINDS = [
  'FULL_VALUE',
  'PHRASE',
  'TOKEN',
  'STRUCTURED_COMPONENT',
] as const;

export type OfficialExceptionScopeKind = typeof OFFICIAL_EXCEPTION_SCOPE_KINDS[number];

export const OFFICIAL_EXCEPTION_MATCH_MODES = [
  'EXACT',
  'CASEFOLD_EXACT',
  'EXPLICIT_ALIAS',
] as const;

export type OfficialExceptionMatchMode = typeof OFFICIAL_EXCEPTION_MATCH_MODES[number];

export const OFFICIAL_EXCEPTION_APPLICATION_MODES = [
  'PRESERVE_MATCHED_FORM',
  'EMIT_CANONICAL_FORM',
  'VALIDATE_ONLY',
  'DERIVE_ONLY',
] as const;

export type OfficialExceptionApplicationMode = typeof OFFICIAL_EXCEPTION_APPLICATION_MODES[number];

export const OFFICIAL_EXCEPTION_RESULTS = [
  'EXCEPTION_CANONICAL_EMITTED',
  'EXCEPTION_PRESERVED_OFFICIAL',
  'EXCEPTION_VALIDATED_NO_REWRITE',
  'EXCEPTION_DERIVATION_ONLY',
  'EXCEPTION_NOT_APPLICABLE',
  'EXCEPTION_AMBIGUOUS_REVIEW',
  'EXCEPTION_POLICY_BLOCKED',
] as const;

export type OfficialExceptionEvaluationResult = typeof OFFICIAL_EXCEPTION_RESULTS[number];

export const OFFICIAL_EXCEPTION_AUTHORITY_TYPES = [
  'INTERNAL_CANONICAL_OWNER',
  'BRAND_OWNER_OR_MANUFACTURER',
  'LEGAL_OR_REGULATORY_SOURCE',
  'CONTROLLED_STANDARD_OR_DOMAIN_CATALOG',
  'APPROVED_EXTERNAL_EVIDENCE',
] as const;

export type OfficialExceptionAuthorityType = typeof OFFICIAL_EXCEPTION_AUTHORITY_TYPES[number];

export const OFFICIAL_EXCEPTION_STATUSES = [
  'ACTIVE',
  'SUSPENDED',
  'RETIRED',
] as const;

export type OfficialExceptionStatus = typeof OFFICIAL_EXCEPTION_STATUSES[number];

export interface OfficialExceptionNormativeForm {
  readonly form_key: string;
  readonly family: OfficialExceptionFamily;
  readonly canonical_form: string;
  readonly allowed_scope_kinds: readonly OfficialExceptionScopeKind[];
  readonly match_mode: OfficialExceptionMatchMode;
  readonly allowed_application_modes: readonly OfficialExceptionApplicationMode[];
  readonly allowed_semantic_classes: readonly NormalizableFieldSemanticClass[];
}

const BRAND_FORMS = [
  {
    form_key: 'EXC-BRAND-001',
    family: 'OFFICIAL_BRAND_EXCEPTION',
    canonical_form: '3M',
    allowed_scope_kinds: ['TOKEN', 'FULL_VALUE'],
    match_mode: 'CASEFOLD_EXACT',
    allowed_application_modes: ['PRESERVE_MATCHED_FORM', 'EMIT_CANONICAL_FORM'],
    allowed_semantic_classes: ['OFFICIAL_BRAND_FORM', 'COMMERCIAL_NAME'],
  },
  {
    form_key: 'EXC-BRAND-002',
    family: 'OFFICIAL_BRAND_EXCEPTION',
    canonical_form: 'iPhone',
    allowed_scope_kinds: ['TOKEN', 'PHRASE'],
    match_mode: 'CASEFOLD_EXACT',
    allowed_application_modes: ['PRESERVE_MATCHED_FORM', 'EMIT_CANONICAL_FORM'],
    allowed_semantic_classes: ['OFFICIAL_BRAND_FORM', 'COMMERCIAL_NAME'],
  },
  {
    form_key: 'EXC-BRAND-003',
    family: 'OFFICIAL_BRAND_EXCEPTION',
    canonical_form: 'Coca-Cola',
    allowed_scope_kinds: ['PHRASE', 'FULL_VALUE'],
    match_mode: 'CASEFOLD_EXACT',
    allowed_application_modes: ['PRESERVE_MATCHED_FORM', 'EMIT_CANONICAL_FORM'],
    allowed_semantic_classes: ['OFFICIAL_BRAND_FORM', 'COMMERCIAL_NAME'],
  },
] as const satisfies readonly OfficialExceptionNormativeForm[];

const CONTROLLED_ACRONYM_FORMS = [
  'NEXO', 'VISO', 'ORIGO', 'NUMERA', 'FOGO', 'PULSO', 'VGR', 'SAU', 'VCF', 'COP',
].map((canonicalForm, index) => ({
  form_key: `EXC-ACRONYM-${String(index + 1).padStart(3, '0')}`,
  family: 'CONTROLLED_ACRONYM_EXCEPTION' as const,
  canonical_form: canonicalForm,
  allowed_scope_kinds: canonicalForm === 'COP'
    ? ['TOKEN', 'STRUCTURED_COMPONENT'] as const
    : ['TOKEN'] as const,
  match_mode: 'CASEFOLD_EXACT' as const,
  allowed_application_modes: [
    'PRESERVE_MATCHED_FORM',
    'EMIT_CANONICAL_FORM',
    'VALIDATE_ONLY',
  ] as const,
  allowed_semantic_classes: canonicalForm === 'COP'
    ? ['CONTROLLED_VOCABULARY_CODE', 'MEASUREMENT_OR_UNIT_CODE', 'COMMERCIAL_NAME'] as const
    : ['CONTROLLED_VOCABULARY_CODE', 'COMMERCIAL_NAME'] as const,
})) satisfies readonly OfficialExceptionNormativeForm[];

const UNIT_FORMS = [
  { canonical_form: 'g', technical_family: false },
  { canonical_form: 'kg', technical_family: false },
  { canonical_form: 'ml', technical_family: false },
  { canonical_form: 'l', technical_family: false },
  { canonical_form: 'un', technical_family: false },
  { canonical_form: 'dz', technical_family: false },
  { canonical_form: 'count', technical_family: true },
  { canonical_form: 'mass', technical_family: true },
  { canonical_form: 'volume', technical_family: true },
].map((item, index) => ({
  form_key: `EXC-UNIT-${String(index + 1).padStart(3, '0')}`,
  family: 'MEASUREMENT_UNIT_EXCEPTION' as const,
  canonical_form: item.canonical_form,
  allowed_scope_kinds: ['TOKEN', 'STRUCTURED_COMPONENT'] as const,
  match_mode: 'CASEFOLD_EXACT' as const,
  allowed_application_modes: item.technical_family
    ? ['PRESERVE_MATCHED_FORM', 'VALIDATE_ONLY'] as const
    : ['PRESERVE_MATCHED_FORM', 'EMIT_CANONICAL_FORM', 'VALIDATE_ONLY'] as const,
  allowed_semantic_classes: item.technical_family
    ? ['CONTROLLED_VOCABULARY_CODE', 'MEASUREMENT_OR_UNIT_CODE'] as const
    : ['MEASUREMENT_OR_UNIT_CODE', 'STRUCTURED_PRESENTATION_NAME'] as const,
})) satisfies readonly OfficialExceptionNormativeForm[];

const LEGAL_SUFFIX_FORMS = [
  'SAS', 'S.A.S.', 'SA', 'S.A.', 'LTDA', 'CIA',
].map((canonicalForm, index) => ({
  form_key: `EXC-LEGAL-${String(index + 1).padStart(3, '0')}`,
  family: 'OFFICIAL_LEGAL_NAME_EXCEPTION' as const,
  canonical_form: canonicalForm,
  allowed_scope_kinds: ['TOKEN'] as const,
  match_mode: 'EXACT' as const,
  allowed_application_modes: ['PRESERVE_MATCHED_FORM'] as const,
  allowed_semantic_classes: ['OFFICIAL_LEGAL_NAME'] as const,
})) satisfies readonly OfficialExceptionNormativeForm[];

export const OFFICIAL_EXCEPTION_NORMATIVE_FORMS: readonly OfficialExceptionNormativeForm[] = [
  ...BRAND_FORMS,
  ...CONTROLLED_ACRONYM_FORMS,
  ...UNIT_FORMS,
  ...LEGAL_SUFFIX_FORMS,
];

export type NonActivableCandidateKind =
  | 'BRAND_OR_MIXED_FORM'
  | 'CONTROLLED_ACRONYM_OR_CODE'
  | 'STRUCTURAL_OR_LEXICAL_FORM';

export interface NonActivableExceptionCandidateCase {
  readonly case_key: string;
  readonly kind: NonActivableCandidateKind;
  readonly observed_forms: readonly string[];
}

const BRAND_CANDIDATE_FORMS: readonly (readonly string[])[] = [
  ['Oster', 'oster'],
  ['Wellmix', 'Welmix'],
  ['Volnic', 'VOLNIC PALLOMARO'],
  ['Daza', 'acero daza'],
  ['MODELO DUC 72 R'],
  ['TORNADO MODELO (TH33M.110.)'],
  ['Hatsu'],
  ['Vento'],
  ['Molka'],
  ['Saudo'],
  ['Nutella'],
  ['Klim'],
  ['Kraft'],
  ['Kinder Bueno'],
];

const ACRONYM_CANDIDATE_FORMS = [
  'BBQ', 'HIT', 'AA', 'CMS', 'PAM', 'REF', 'T26', 'WIP', 'AVSA', 'FC', 'SVV',
] as const;

const STRUCTURAL_CANDIDATE_FORMS = [
  'Botellla', 'Costo', '1', 'presentacion', 'piezas', 'bolsas', 'Six Pack', 'six_pack', 'Bolsa 1 kg',
] as const;

export const NON_ACTIVABLE_EXCEPTION_CANDIDATE_CASES: readonly NonActivableExceptionCandidateCase[] = [
  ...BRAND_CANDIDATE_FORMS.map((observedForms, index) => ({
    case_key: `CAND-BRAND-${String(index + 1).padStart(3, '0')}`,
    kind: 'BRAND_OR_MIXED_FORM' as const,
    observed_forms: observedForms,
  })),
  ...ACRONYM_CANDIDATE_FORMS.map((observedForm, index) => ({
    case_key: `CAND-ACRONYM-${String(index + 1).padStart(3, '0')}`,
    kind: 'CONTROLLED_ACRONYM_OR_CODE' as const,
    observed_forms: [observedForm],
  })),
  ...STRUCTURAL_CANDIDATE_FORMS.map((observedForm, index) => ({
    case_key: `CAND-STRUCT-${String(index + 1).padStart(3, '0')}`,
    kind: 'STRUCTURAL_OR_LEXICAL_FORM' as const,
    observed_forms: [observedForm],
  })),
];

export interface OfficialTextExceptionEntry {
  readonly exception_key: string;
  readonly family: OfficialExceptionFamily;
  readonly canonical_form: string;
  readonly scope_kind: OfficialExceptionScopeKind;
  readonly domain_scope: readonly string[];
  readonly entity_scope: readonly string[];
  readonly field_scope: readonly string[];
  readonly semantic_class: NormalizableFieldSemanticClass;
  readonly representation_role: NormalizationRepresentationRole;
  readonly source_role: NormalizationSourceRole;
  readonly language_profile: CommercialCapitalizationLocale;
  readonly match_mode: OfficialExceptionMatchMode;
  readonly accepted_variants: readonly string[];
  readonly application_mode: OfficialExceptionApplicationMode;
  readonly authority_type: OfficialExceptionAuthorityType;
  readonly authority_owner: string;
  readonly evidence_reference: string;
  readonly status: OfficialExceptionStatus;
  readonly valid_from: string;
  readonly valid_to: string | null;
  readonly catalog_version: typeof OFFICIAL_TEXT_EXCEPTION_CATALOG_ID;
  readonly supersedes: readonly string[];
  readonly reason: string;
}

export interface OfficialExceptionActivationBinding {
  readonly scope_kind: OfficialExceptionScopeKind;
  readonly domain_scope: readonly string[];
  readonly entity_scope: readonly string[];
  readonly field_scope: readonly string[];
  readonly semantic_class: NormalizableFieldSemanticClass;
  readonly representation_role: NormalizationRepresentationRole;
  readonly source_role: NormalizationSourceRole;
  readonly language_profile: CommercialCapitalizationLocale;
  readonly accepted_variants: readonly string[];
  readonly application_mode: OfficialExceptionApplicationMode;
  readonly authority_type: OfficialExceptionAuthorityType;
  readonly authority_owner: string;
  readonly evidence_reference: string;
  readonly status: OfficialExceptionStatus;
  readonly valid_from: string;
  readonly valid_to: string | null;
  readonly supersedes: readonly string[];
  readonly reason: string;
}

export type OfficialExceptionEntryBuildResult =
  | { readonly ok: true; readonly entry: OfficialTextExceptionEntry }
  | { readonly ok: false; readonly reason: string };

export interface CatalogCaseAdapter {
  readonly case_mapping_version_ref: string;
  readonly to_lower: (value: string, locale: CommercialCapitalizationLocale) => string;
  readonly to_upper: (value: string, locale: CommercialCapitalizationLocale) => string;
}

export interface OfficialExceptionEvaluationContext {
  readonly descriptor: NormalizableFieldDescriptor;
  readonly scope_kind: OfficialExceptionScopeKind;
  readonly case_adapter: CatalogCaseAdapter;
  readonly effective_at: string;
}

export interface OfficialExceptionEvaluation {
  readonly result: OfficialExceptionEvaluationResult;
  readonly input: string;
  readonly output: string;
  readonly changed: boolean;
  readonly review_required: boolean;
  readonly blocked: boolean;
  readonly matched_exception_keys: readonly string[];
  readonly detail: string | null;
}

export interface CommercialCatalogResolverOptions {
  readonly descriptor: NormalizableFieldDescriptor;
  readonly case_adapter: CatalogCaseAdapter;
  readonly exception_entries: readonly OfficialTextExceptionEntry[];
  readonly effective_at: string;
}

function nonEmpty(value: string): boolean {
  return value.trim().length > 0;
}

function exactUnique(values: readonly string[]): boolean {
  return values.every(nonEmpty) && new Set(values).size === values.length;
}

function findNormativeForm(formKey: string): OfficialExceptionNormativeForm | null {
  return OFFICIAL_EXCEPTION_NORMATIVE_FORMS.find((entry) => entry.form_key === formKey) ?? null;
}

function parseInstant(value: string): number | null {
  if (!nonEmpty(value)) return null;
  const parsed = Date.parse(value);
  return Number.isFinite(parsed) ? parsed : null;
}

export function materializeOfficialExceptionEntry(
  formKey: string,
  binding: OfficialExceptionActivationBinding,
): OfficialExceptionEntryBuildResult {
  const form = findNormativeForm(formKey);
  if (!form) return { ok: false, reason: 'unknown normative exception form' };
  if (!form.allowed_scope_kinds.includes(binding.scope_kind)) {
    return { ok: false, reason: 'scope_kind is not permitted by the normative form' };
  }
  if (!form.allowed_semantic_classes.includes(binding.semantic_class)) {
    return { ok: false, reason: 'semantic_class is not permitted by the normative form' };
  }
  if (!form.allowed_application_modes.includes(binding.application_mode)) {
    return { ok: false, reason: 'application_mode is not permitted by the normative form' };
  }
  if (binding.language_profile !== 'es-CO') {
    return { ok: false, reason: 'language_profile must be explicit es-CO' };
  }
  if (
    !exactUnique(binding.domain_scope)
    || !exactUnique(binding.entity_scope)
    || !exactUnique(binding.field_scope)
  ) {
    return { ok: false, reason: 'domain, entity and field scopes must be explicit non-empty unique refs' };
  }
  if (!exactUnique(binding.accepted_variants) && binding.accepted_variants.length > 0) {
    return { ok: false, reason: 'accepted_variants must be explicit unique non-empty values' };
  }
  if (binding.accepted_variants.includes(form.canonical_form)) {
    return { ok: false, reason: 'accepted_variants must not duplicate canonical_form' };
  }
  if (form.match_mode !== 'EXPLICIT_ALIAS' && binding.accepted_variants.length > 0) {
    return { ok: false, reason: 'accepted_variants require EXPLICIT_ALIAS match mode' };
  }
  if (!OFFICIAL_EXCEPTION_AUTHORITY_TYPES.includes(binding.authority_type)) {
    return { ok: false, reason: 'authority_type is not canonical' };
  }
  if (!OFFICIAL_EXCEPTION_STATUSES.includes(binding.status)) {
    return { ok: false, reason: 'status is not canonical' };
  }
  if (
    !nonEmpty(binding.authority_owner)
    || !nonEmpty(binding.evidence_reference)
    || !nonEmpty(binding.reason)
  ) {
    return { ok: false, reason: 'authority owner, evidence reference and reason are required' };
  }
  const validFrom = parseInstant(binding.valid_from);
  const validTo = binding.valid_to === null ? null : parseInstant(binding.valid_to);
  if (validFrom === null || (binding.valid_to !== null && validTo === null)) {
    return { ok: false, reason: 'valid_from and valid_to must be concrete ISO date/time values' };
  }
  if (validTo !== null && validTo <= validFrom) {
    return { ok: false, reason: 'valid_to must be later than valid_from' };
  }
  if (!exactUnique(binding.supersedes) && binding.supersedes.length > 0) {
    return { ok: false, reason: 'supersedes must contain unique non-empty refs' };
  }

  return {
    ok: true,
    entry: {
      exception_key: form.form_key,
      family: form.family,
      canonical_form: form.canonical_form,
      scope_kind: binding.scope_kind,
      domain_scope: [...binding.domain_scope],
      entity_scope: [...binding.entity_scope],
      field_scope: [...binding.field_scope],
      semantic_class: binding.semantic_class,
      representation_role: binding.representation_role,
      source_role: binding.source_role,
      language_profile: binding.language_profile,
      match_mode: form.match_mode,
      accepted_variants: [...binding.accepted_variants],
      application_mode: binding.application_mode,
      authority_type: binding.authority_type,
      authority_owner: binding.authority_owner,
      evidence_reference: binding.evidence_reference,
      status: binding.status,
      valid_from: binding.valid_from,
      valid_to: binding.valid_to,
      catalog_version: OFFICIAL_TEXT_EXCEPTION_CATALOG_ID,
      supersedes: [...binding.supersedes],
      reason: binding.reason,
    },
  };
}

function safeLower(adapter: CatalogCaseAdapter, value: string): string | null {
  if (!nonEmpty(adapter.case_mapping_version_ref)) return null;
  try {
    const lowered = adapter.to_lower(value, 'es-CO');
    return typeof lowered === 'string' ? lowered : null;
  } catch {
    return null;
  }
}

function safeUpper(adapter: CatalogCaseAdapter, value: string): string | null {
  if (!nonEmpty(adapter.case_mapping_version_ref)) return null;
  try {
    const uppered = adapter.to_upper(value, 'es-CO');
    return typeof uppered === 'string' ? uppered : null;
  } catch {
    return null;
  }
}

function connectorPosition(boundary: CommercialCapitalizationSegmentBoundary): CommercialConnectorPosition {
  return boundary === 'NO_SEGMENT_RESET' ? 'INTERNAL' : boundary;
}

export function resolveCommercialConnectorCandidate(
  token: string,
  boundary: CommercialCapitalizationSegmentBoundary,
  adapter: CatalogCaseAdapter,
): CommercialCapitalizationTokenCandidate | null {
  const lowered = safeLower(adapter, token);
  if (lowered === null || !/^[a-z]+$/u.test(lowered)) return null;
  const entry = COMMERCIAL_CONNECTOR_ENTRIES.find((item) => item.entry === lowered);
  if (!entry) return null;

  const position = connectorPosition(boundary);
  if (position === 'INTERNAL') {
    return { output: entry.entry, token_class: 'CONNECTOR_TOKEN' };
  }

  const head = safeUpper(adapter, entry.entry.slice(0, 1));
  if (head === null) return null;
  return {
    output: `${head}${entry.entry.slice(1)}`,
    token_class: 'CONNECTOR_TOKEN',
  };
}

function descriptorMatchesEntry(
  descriptor: NormalizableFieldDescriptor,
  entry: OfficialTextExceptionEntry,
): boolean {
  return entry.domain_scope.includes(descriptor.coordinate.owner_domain_ref)
    && entry.entity_scope.includes(descriptor.coordinate.owner_entity_ref)
    && entry.field_scope.includes(descriptor.coordinate.semantic_field_ref)
    && entry.semantic_class === descriptor.semantic_class
    && entry.representation_role === descriptor.representation_role
    && entry.source_role === descriptor.source_role
    && entry.language_profile === 'es-CO'
    && entry.catalog_version === OFFICIAL_TEXT_EXCEPTION_CATALOG_ID;
}

function activeAt(entry: OfficialTextExceptionEntry, effectiveAt: number): boolean {
  if (entry.status !== 'ACTIVE') return false;
  const validFrom = parseInstant(entry.valid_from);
  const validTo = entry.valid_to === null ? null : parseInstant(entry.valid_to);
  if (validFrom === null || (entry.valid_to !== null && validTo === null)) return false;
  return effectiveAt >= validFrom && (validTo === null || effectiveAt < validTo);
}

function valueMatchesEntry(
  value: string,
  entry: OfficialTextExceptionEntry,
  adapter: CatalogCaseAdapter,
): boolean {
  if (entry.match_mode === 'EXACT') return value === entry.canonical_form;
  if (entry.match_mode === 'CASEFOLD_EXACT') {
    const left = safeLower(adapter, value);
    const right = safeLower(adapter, entry.canonical_form);
    return left !== null && right !== null && left === right;
  }
  return value === entry.canonical_form || entry.accepted_variants.includes(value);
}

function mutablePair(descriptor: NormalizableFieldDescriptor): boolean {
  const pair = `${descriptor.representation_role}::${descriptor.source_role}`;
  return pair === 'PRIMARY_VALUE::AUTHORITATIVE_SOURCE'
    || pair === 'DISPLAY_OVERRIDE::APPROVED_OVERRIDE';
}

function derivationPair(descriptor: NormalizableFieldDescriptor): boolean {
  return descriptor.representation_role === 'OUTPUT_PROJECTION'
    && descriptor.source_role === 'OUTPUT_ONLY';
}

function protectedPair(descriptor: NormalizableFieldDescriptor): boolean {
  return descriptor.representation_role === 'EXTERNAL_ORIGINAL'
    || descriptor.representation_role === 'HISTORICAL_SNAPSHOT'
    || descriptor.representation_role === 'AUDIT_EVIDENCE'
    || descriptor.source_role === 'EXTERNAL_EVIDENCE'
    || descriptor.source_role === 'IMMUTABLE_SNAPSHOT';
}

function wordLike(value: string): boolean {
  return /^[\p{L}\p{N}]$/u.test(value);
}

function containsObservedForm(input: string, observed: string): boolean {
  let offset = 0;
  while (offset <= input.length - observed.length) {
    const index = input.indexOf(observed, offset);
    if (index < 0) return false;
    const before = index > 0 ? input[index - 1] : '';
    const afterIndex = index + observed.length;
    const after = afterIndex < input.length ? input[afterIndex] : '';
    const leftOk = !before || !wordLike(before) || !wordLike(observed[0]);
    const rightOk = !after || !wordLike(after) || !wordLike(observed[observed.length - 1]);
    if (leftOk && rightOk) return true;
    offset = index + 1;
  }
  return false;
}

export function findNonActivableExceptionCandidate(
  input: string,
): NonActivableExceptionCandidateCase | null {
  const ordered = NON_ACTIVABLE_EXCEPTION_CANDIDATE_CASES
    .flatMap((candidate) => candidate.observed_forms.map((form) => ({ candidate, form })))
    .sort((left, right) => right.form.length - left.form.length);
  return ordered.find(({ form }) => containsObservedForm(input, form))?.candidate ?? null;
}

function entryResult(
  input: string,
  output: string,
  result: OfficialExceptionEvaluationResult,
  matchedExceptionKeys: readonly string[],
  detail: string | null,
): OfficialExceptionEvaluation {
  const reviewRequired = result === 'EXCEPTION_AMBIGUOUS_REVIEW';
  const blocked = result === 'EXCEPTION_AMBIGUOUS_REVIEW' || result === 'EXCEPTION_POLICY_BLOCKED';
  const finalOutput = blocked ? input : output;
  return {
    result,
    input,
    output: finalOutput,
    changed: !blocked && finalOutput !== input,
    review_required: reviewRequired,
    blocked,
    matched_exception_keys: [...matchedExceptionKeys],
    detail,
  };
}

export function evaluateOfficialException(
  input: string,
  entries: readonly OfficialTextExceptionEntry[],
  context: OfficialExceptionEvaluationContext,
): OfficialExceptionEvaluation {
  if (!nonEmpty(context.case_adapter.case_mapping_version_ref)) {
    return entryResult(input, input, 'EXCEPTION_POLICY_BLOCKED', [], 'case mapping version is required');
  }
  const effectiveAt = parseInstant(context.effective_at);
  if (effectiveAt === null) {
    return entryResult(input, input, 'EXCEPTION_POLICY_BLOCKED', [], 'effective_at must be a concrete ISO date/time');
  }

  const candidate = findNonActivableExceptionCandidate(input);
  if (candidate) {
    return entryResult(
      input,
      input,
      'EXCEPTION_AMBIGUOUS_REVIEW',
      [],
      `non-activable candidate ${candidate.case_key} requires explicit review`,
    );
  }

  const compatible = entries.filter((entry) => (
    descriptorMatchesEntry(context.descriptor, entry)
    && entry.scope_kind === context.scope_kind
    && valueMatchesEntry(input, entry, context.case_adapter)
  ));
  if (compatible.length === 0) {
    return entryResult(input, input, 'EXCEPTION_NOT_APPLICABLE', [], null);
  }

  const active = compatible.filter((entry) => activeAt(entry, effectiveAt));
  if (active.length === 0) {
    return entryResult(
      input,
      input,
      'EXCEPTION_POLICY_BLOCKED',
      compatible.map((entry) => entry.exception_key),
      'matching exception exists but is not active for the declared effective_at',
    );
  }
  if (active.length !== 1) {
    return entryResult(
      input,
      input,
      'EXCEPTION_POLICY_BLOCKED',
      active.map((entry) => entry.exception_key),
      'multiple active exception entries match the same coordinate and scope',
    );
  }

  const [entry] = active;
  if (entry.application_mode === 'PRESERVE_MATCHED_FORM') {
    return entryResult(input, input, 'EXCEPTION_PRESERVED_OFFICIAL', [entry.exception_key], null);
  }
  if (entry.application_mode === 'VALIDATE_ONLY') {
    return entryResult(input, input, 'EXCEPTION_VALIDATED_NO_REWRITE', [entry.exception_key], null);
  }
  if (entry.application_mode === 'DERIVE_ONLY') {
    return entryResult(input, entry.canonical_form, 'EXCEPTION_DERIVATION_ONLY', [entry.exception_key], null);
  }
  if (protectedPair(context.descriptor)) {
    return entryResult(input, input, 'EXCEPTION_PRESERVED_OFFICIAL', [entry.exception_key], null);
  }
  if (derivationPair(context.descriptor)) {
    return entryResult(input, entry.canonical_form, 'EXCEPTION_DERIVATION_ONLY', [entry.exception_key], null);
  }
  if (!mutablePair(context.descriptor)) {
    return entryResult(
      input,
      input,
      'EXCEPTION_POLICY_BLOCKED',
      [entry.exception_key],
      'representation and source do not permit canonical emission',
    );
  }
  return entryResult(input, entry.canonical_form, 'EXCEPTION_CANONICAL_EMITTED', [entry.exception_key], null);
}

function activeCompatibleEntries(
  options: CommercialCatalogResolverOptions,
  scopeKind: OfficialExceptionScopeKind,
): readonly OfficialTextExceptionEntry[] {
  const effectiveAt = parseInstant(options.effective_at);
  if (effectiveAt === null) return [];
  return options.exception_entries.filter((entry) => (
    entry.scope_kind === scopeKind
    && descriptorMatchesEntry(options.descriptor, entry)
    && activeAt(entry, effectiveAt)
  ));
}

function outputForResolver(entry: OfficialTextExceptionEntry, input: string): string {
  if (entry.application_mode === 'EMIT_CANONICAL_FORM' || entry.application_mode === 'DERIVE_ONLY') {
    return entry.canonical_form;
  }
  return input;
}

function phraseTokens(value: string): readonly string[] {
  return value.split(' ');
}

function normativeFormNeedsBindingReview(
  input: string,
  options: CommercialCatalogResolverOptions,
): OfficialExceptionNormativeForm | null {
  const effectiveAt = parseInstant(options.effective_at);
  if (effectiveAt === null) return null;
  const activeKeys = new Set(options.exception_entries
    .filter((entry) => descriptorMatchesEntry(options.descriptor, entry) && activeAt(entry, effectiveAt))
    .map((entry) => entry.exception_key));
  for (const form of OFFICIAL_EXCEPTION_NORMATIVE_FORMS) {
    if (!form.allowed_semantic_classes.includes(options.descriptor.semantic_class)) continue;
    if (activeKeys.has(form.form_key)) continue;
    const loweredInput = safeLower(options.case_adapter, input);
    const loweredForm = safeLower(options.case_adapter, form.canonical_form);
    if (loweredInput === null || loweredForm === null) continue;
    if (containsObservedForm(loweredInput, loweredForm)) return form;
  }
  return null;
}

function inactiveEntryNeedsReview(
  input: string,
  options: CommercialCatalogResolverOptions,
): OfficialTextExceptionEntry | null {
  const effectiveAt = parseInstant(options.effective_at);
  if (effectiveAt === null) return null;
  return options.exception_entries.find((entry) => (
    descriptorMatchesEntry(options.descriptor, entry)
    && !activeAt(entry, effectiveAt)
    && containsObservedForm(input, entry.canonical_form)
  )) ?? null;
}

function ensureNoActiveRegistryConflicts(options: CommercialCatalogResolverOptions): void {
  const effectiveAt = parseInstant(options.effective_at);
  if (effectiveAt === null) throw new Error('effective_at must be a concrete ISO date/time');
  const seen = new Map<string, string>();
  for (const entry of options.exception_entries) {
    if (!descriptorMatchesEntry(options.descriptor, entry) || !activeAt(entry, effectiveAt)) continue;
    const key = [
      entry.scope_kind,
      safeLower(options.case_adapter, entry.canonical_form) ?? entry.canonical_form,
      entry.semantic_class,
      entry.representation_role,
      entry.source_role,
    ].join('::');
    const prior = seen.get(key);
    if (prior && prior !== entry.exception_key) {
      throw new Error(`active exception registry conflict: ${prior} vs ${entry.exception_key}`);
    }
    seen.set(key, entry.exception_key);
  }
}

export function createCommercialCapitalizationCatalogResolver(
  options: CommercialCatalogResolverOptions,
): CommercialCapitalizationCatalogResolver {
  if (!nonEmpty(options.case_adapter.case_mapping_version_ref)) {
    throw new Error('case_mapping_version_ref is required');
  }
  ensureNoActiveRegistryConflicts(options);

  return {
    connector_catalog_version_ref: COMMERCIAL_CONNECTOR_CATALOG_ID,
    exception_catalog_version_ref: OFFICIAL_TEXT_EXCEPTION_CATALOG_ID,
    review_input: (value) => {
      const candidate = findNonActivableExceptionCandidate(value);
      if (candidate) return `non-activable candidate ${candidate.case_key} requires explicit review`;
      const inactive = inactiveEntryNeedsReview(value, options);
      if (inactive) return `exception ${inactive.exception_key} is not active for the declared evaluation context`;
      const unbound = normativeFormNeedsBindingReview(value, options);
      if (unbound) return `normative form ${unbound.form_key} requires explicit coordinate and authority binding`;
      return null;
    },
    official_phrase_candidates: (tokens, startIndex) => {
      const remaining = tokens.slice(startIndex);
      const entries = activeCompatibleEntries(options, 'PHRASE')
        .filter((entry) => entry.family === 'OFFICIAL_BRAND_EXCEPTION');
      const candidates: CommercialCapitalizationPhraseCandidate[] = [];
      for (const entry of entries) {
        const canonicalTokens = phraseTokens(entry.canonical_form);
        if (canonicalTokens.length > remaining.length) continue;
        const received = remaining.slice(0, canonicalTokens.length).join(' ');
        if (!valueMatchesEntry(received, entry, options.case_adapter)) continue;
        const output = outputForResolver(entry, received);
        candidates.push({ token_count: canonicalTokens.length, outputs: phraseTokens(output) });
      }
      return candidates;
    },
    official_token_candidates: (token) => activeCompatibleEntries(options, 'TOKEN')
      .filter((entry) => entry.family === 'OFFICIAL_BRAND_EXCEPTION')
      .filter((entry) => valueMatchesEntry(token, entry, options.case_adapter))
      .map((entry) => ({
        output: outputForResolver(entry, token),
        token_class: 'OFFICIAL_EXCEPTION_TOKEN' as const,
      })),
    protected_token_candidates: (token) => activeCompatibleEntries(options, 'TOKEN')
      .filter((entry) => (
        entry.family === 'CONTROLLED_ACRONYM_EXCEPTION'
        || entry.family === 'MEASUREMENT_UNIT_EXCEPTION'
      ))
      .filter((entry) => valueMatchesEntry(token, entry, options.case_adapter))
      .map((entry) => ({
        output: outputForResolver(entry, token),
        token_class: entry.family === 'CONTROLLED_ACRONYM_EXCEPTION'
          ? 'CONTROLLED_ACRONYM_TOKEN' as const
          : 'MEASUREMENT_OR_UNIT_TOKEN' as const,
      })),
    connector_candidates: (token, boundary) => {
      const candidate = resolveCommercialConnectorCandidate(token, boundary, options.case_adapter);
      return candidate ? [candidate] : [];
    },
  };
}
