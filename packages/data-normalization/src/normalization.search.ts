import type {
  NormalizableFieldDescriptor,
  NormalizableFieldSemanticClass,
} from './normalization.types.js';

/**
 * Pure search and comparison policy for SHELL-NORM-006::GLOBAL.
 *
 * The module derives non-authoritative search representations. It has no I/O,
 * persistence, implicit locale, identity, uniqueness, merge, or write authority.
 */

export const TEXT_SEARCH_POLICY_ID =
  'VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0' as const;

export const SEARCH_REPRESENTATIONS = [
  'SEARCH_FORM_KEY',
  'SEARCH_ACCENT_KEY',
  'SEARCH_TOKEN_STREAM',
  'SEARCH_APPROVED_ALIAS_SET',
  'SEARCH_TRANSLITERATION_KEY',
  'SEARCH_STRUCTURED_COMPONENT_SET',
  'SEARCH_FREE_TEXT_TERMS',
] as const;

export type SearchRepresentation = typeof SEARCH_REPRESENTATIONS[number];

export const SEARCH_TOKEN_CLASSES = [
  'LEXICAL_TOKEN',
  'NUMERIC_TOKEN',
  'TECHNICAL_TOKEN',
  'INTERNAL_COMPOUND_TOKEN',
  'PUNCTUATION_BOUNDARY',
  'WHITESPACE_BOUNDARY',
  'UNRESOLVED_TOKEN_OR_BOUNDARY',
] as const;

export type SearchTokenClass = typeof SEARCH_TOKEN_CLASSES[number];

export const SEARCH_ALIAS_FIELDS = [
  'alias_key',
  'canonical_target_reference',
  'alias_form',
  'match_scope',
  'semantic_class',
  'domain_scope',
  'entity_scope',
  'field_scope',
  'language_profile',
  'source_authority',
  'approval_reference',
  'status',
  'valid_from',
  'valid_to',
  'alias_version',
] as const;

export const SEARCH_PROFILES = [
  'STRICT_TECHNICAL_LOOKUP',
  'STANDARD_COMMERCIAL_NAME',
  'OFFICIAL_FORM_LOOKUP',
  'STRUCTURED_PRESENTATION_LOOKUP',
  'FREE_TEXT_DISCOVERY',
  'RESTRICTED_HUMAN_OR_LOCATION',
] as const;

export type SearchProfile = typeof SEARCH_PROFILES[number];

export const SEARCH_MATCH_MODES = [
  'EXACT_VALUE_MATCH',
  'FORM_EQUIVALENT_MATCH',
  'ACCENT_TOLERANT_MATCH',
  'APPROVED_ALIAS_MATCH',
  'ORDERED_PHRASE_MATCH',
  'ALL_TOKEN_MATCH',
  'LAST_TOKEN_PREFIX_MATCH',
  'TRANSLITERATION_FALLBACK_MATCH',
  'SIMILARITY_CANDIDATE_ONLY',
] as const;

export type SearchMatchMode = typeof SEARCH_MATCH_MODES[number];

export const SEARCH_PIPELINE = [
  'AUTHORIZATION_AND_PURPOSE',
  'DOMAIN_ENTITY_FIELD_AND_SCOPE',
  'STATUS_VALIDITY_AND_STRUCTURED_FILTERS',
  'PROFILE_LOCALE_AND_VERSION',
  'QUERY_DERIVATION_WITH_ACTIVE_VERSION',
  'EXACT_VALUE_MATCH',
  'FORM_EQUIVALENT_MATCH',
  'ACCENT_TOLERANT_MATCH',
  'APPROVED_ALIAS_MATCH',
  'ORDERED_PHRASE_MATCH',
  'ALL_TOKEN_MATCH',
  'LAST_TOKEN_PREFIX_MATCH',
  'TRANSLITERATION_FALLBACK_MATCH',
  'SIMILARITY_CANDIDATE_ONLY',
  'STABLE_ORDER_EXPLANATION_AND_PAGINATION',
] as const;

export const SEARCH_RESPONSE_FIELDS = [
  'entity_id',
  'entity_type',
  'display_value',
  'matched_field',
  'match_mode',
  'match_level',
  'matched_terms_or_components',
  'search_profile',
  'language_profile',
  'algorithm_version',
  'scope_summary',
  'source_value_version_or_hash',
  'is_historical_or_inactive',
] as const;

export const STRUCTURED_PRESENTATION_COMPONENTS = [
  'product_id',
  'quantity',
  'input_unit_code',
  'stock_quantity',
  'stock_unit_code',
  'multiplier',
  'package_kind',
  'usage_context',
  'supplier_or_source_scope',
  'validity_or_status',
  'visible_label',
] as const;

export const SEARCH_CLASS_PROFILE_MATRIX: Readonly<Record<NormalizableFieldSemanticClass, SearchProfile | null>> = {
  COMMERCIAL_NAME: 'STANDARD_COMMERCIAL_NAME',
  STRUCTURED_PRESENTATION_NAME: 'STRUCTURED_PRESENTATION_LOOKUP',
  HUMAN_LABEL: null,
  OFFICIAL_LEGAL_NAME: 'OFFICIAL_FORM_LOOKUP',
  OFFICIAL_BRAND_FORM: 'OFFICIAL_FORM_LOOKUP',
  PERSON_OR_ACTOR_NAME: 'RESTRICTED_HUMAN_OR_LOCATION',
  ADDRESS_OR_LOCATION_TEXT: 'RESTRICTED_HUMAN_OR_LOCATION',
  FREE_TEXT: 'FREE_TEXT_DISCOVERY',
  CONTROLLED_VOCABULARY_CODE: 'STRICT_TECHNICAL_LOOKUP',
  MEASUREMENT_OR_UNIT_CODE: 'STRICT_TECHNICAL_LOOKUP',
  TECHNICAL_IDENTIFIER: 'STRICT_TECHNICAL_LOOKUP',
  CONTACT_IDENTIFIER: null,
  SECRET_OR_SIGNATURE_MATERIAL: null,
  UNCLASSIFIED_PRESERVE: null,
};

export interface SearchToken {
  readonly text: string;
  readonly token_class: SearchTokenClass;
}

export interface SearchTextAdapter {
  readonly unicode_version_ref: string;
  readonly case_mapping_version_ref: string;
  readonly tokenization_version_ref: string;
  readonly accent_folding_version_ref: string;
  readonly normalize_nfc: (value: string) => string;
  readonly case_fold: (value: string, locale: 'es-CO') => string;
  readonly tokenize: (value: string) => readonly SearchToken[];
  readonly fold_es_co_accents: (value: string, fold_diaeresis: boolean) => string;
}

export interface ApprovedSearchAlias {
  readonly alias_key: string;
  readonly canonical_target_reference: string;
  readonly alias_form: string;
  readonly match_scope: string;
  readonly semantic_class: NormalizableFieldSemanticClass;
  readonly domain_scope: string;
  readonly entity_scope: string | null;
  readonly field_scope: string | null;
  readonly language_profile: 'es-CO';
  readonly source_authority: string;
  readonly approval_reference: string;
  readonly status: 'APPROVED_ACTIVE' | 'SUSPENDED' | 'RETIRED' | 'REJECTED';
  readonly valid_from: string;
  readonly valid_to: string | null;
  readonly alias_version: string;
}

export interface SearchAliasResolver {
  readonly alias_catalog_version_ref: string;
  readonly resolve: (
    descriptor: NormalizableFieldDescriptor,
    scope_ref: string,
  ) => readonly ApprovedSearchAlias[];
}

export interface SearchAuthorizationResolver {
  readonly authorization_version_ref: string;
  readonly authorize: (
    purpose_ref: string,
    descriptor: NormalizableFieldDescriptor,
    scope_ref: string,
  ) => boolean;
}

export interface SearchPolicy {
  readonly policy_id: typeof TEXT_SEARCH_POLICY_ID;
  readonly algorithm_version: '1.0.0';
  readonly language_profile: 'es-CO';
  readonly profile: SearchProfile;
  readonly purpose_ref: string;
  readonly scope_ref: string;
  readonly descriptor: NormalizableFieldDescriptor;
  readonly enabled_representations: readonly SearchRepresentation[];
  readonly allow_edge_trim: boolean;
  readonly allow_internal_space_compaction: boolean;
  readonly allow_diaeresis_fold: boolean;
  readonly transliteration_enabled: false;
  readonly similarity_enabled: false;
}

export interface StructuredSearchComponent {
  readonly component: typeof STRUCTURED_PRESENTATION_COMPONENTS[number];
  readonly value: string;
}

export interface SearchDerivations {
  readonly source_value: string;
  readonly form_key: string;
  readonly accent_key: string | null;
  readonly tokens: readonly SearchToken[];
  readonly approved_aliases: readonly ApprovedSearchAlias[];
  readonly transliteration_key: null;
  readonly structured_components: readonly StructuredSearchComponent[];
  readonly free_text_terms: readonly string[];
  readonly version_refs: readonly string[];
}

export type SearchDerivationResult =
  | { readonly status: 'DERIVED'; readonly derivations: SearchDerivations; readonly blocking_detail: null }
  | { readonly status: 'BLOCKED'; readonly derivations: null; readonly blocking_detail: string };

export interface SearchCandidate {
  readonly entity_id: string;
  readonly entity_type: string;
  readonly source_value: string;
  readonly display_value: string;
  readonly matched_field: string;
  readonly scope_ref: string;
  readonly scope_specificity: number;
  readonly approved_business_priority: number | null;
  readonly stable_domain_sort_key: string;
  readonly source_value_version_or_hash: string;
  readonly is_historical_or_inactive: boolean;
  readonly structured_components?: readonly StructuredSearchComponent[];
}

export interface SearchResponse {
  readonly entity_id: string;
  readonly entity_type: string;
  readonly display_value: string;
  readonly matched_field: string;
  readonly match_mode: SearchMatchMode;
  readonly match_level: number;
  readonly matched_terms_or_components: readonly string[];
  readonly search_profile: SearchProfile;
  readonly language_profile: 'es-CO';
  readonly algorithm_version: '1.0.0';
  readonly scope_summary: string;
  readonly source_value_version_or_hash: string;
  readonly is_historical_or_inactive: boolean;
  readonly explanation: string;
}

export type SearchEvaluationResult =
  | { readonly status: 'RESULTS'; readonly results: readonly SearchResponse[]; readonly blocking_detail: null }
  | { readonly status: 'NO_RESULTS'; readonly results: readonly []; readonly blocking_detail: null }
  | { readonly status: 'BLOCKED'; readonly results: readonly []; readonly blocking_detail: string };

function nonEmpty(value: string): boolean {
  return value.trim().length > 0;
}

function uniqueNonEmpty(values: readonly string[]): readonly string[] {
  return [...new Set(values.filter(nonEmpty))];
}

function versions(adapter: SearchTextAdapter, aliases: SearchAliasResolver): readonly string[] {
  return uniqueNonEmpty([
    adapter.unicode_version_ref,
    adapter.case_mapping_version_ref,
    adapter.tokenization_version_ref,
    adapter.accent_folding_version_ref,
    aliases.alias_catalog_version_ref,
  ]);
}

function validatePolicy(policy: SearchPolicy): string | null {
  if (policy.policy_id !== TEXT_SEARCH_POLICY_ID || policy.algorithm_version !== '1.0.0') {
    return 'unsupported search policy identity or algorithm version';
  }
  if (policy.language_profile !== 'es-CO') return 'search requires explicit es-CO language profile';
  if (!nonEmpty(policy.purpose_ref) || !nonEmpty(policy.scope_ref)) {
    return 'purpose_ref and scope_ref are required';
  }
  if (policy.descriptor.representation_role !== 'SEARCH_DERIVATION') {
    return 'search requires SEARCH_DERIVATION representation role';
  }
  if (policy.descriptor.policy_version_ref !== policy.policy_id) {
    return 'descriptor and effective search policy versions differ';
  }
  const expectedProfile = SEARCH_CLASS_PROFILE_MATRIX[policy.descriptor.semantic_class];
  if (expectedProfile === null || expectedProfile !== policy.profile) {
    return 'semantic class does not authorize the selected search profile';
  }
  if (policy.enabled_representations.length === 0) return 'at least one representation is required';
  if (
    new Set(policy.enabled_representations).size !== policy.enabled_representations.length
    || policy.enabled_representations.some((entry) => !SEARCH_REPRESENTATIONS.includes(entry))
  ) {
    return 'enabled representations must be unique members of the closed vocabulary';
  }
  if (policy.transliteration_enabled || policy.similarity_enabled) {
    return 'transliteration and similarity are disabled in policy 1.0.0';
  }
  return null;
}

function compactAsciiSpaces(value: string): string {
  let output = '';
  let previousWasSpace = false;
  for (const character of value) {
    if (character === ' ') {
      if (!previousWasSpace) output += character;
      previousWasSpace = true;
    } else {
      output += character;
      previousWasSpace = false;
    }
  }
  return output;
}

function validateTokens(tokens: readonly SearchToken[], source: string): string | null {
  if (tokens.length === 0 && source.length > 0) return 'tokenizer returned no tokens for non-empty input';
  if (tokens.some((token) => token.text.length === 0 || !SEARCH_TOKEN_CLASSES.includes(token.token_class))) {
    return 'tokenizer returned an invalid token or boundary';
  }
  if (tokens.map((token) => token.text).join('') !== source) {
    return 'tokenizer must preserve the complete derived form and all boundaries';
  }
  return null;
}

function searchableTokens(tokens: readonly SearchToken[]): readonly string[] {
  return tokens
    .filter((token) => [
      'LEXICAL_TOKEN',
      'NUMERIC_TOKEN',
      'TECHNICAL_TOKEN',
      'INTERNAL_COMPOUND_TOKEN',
    ].includes(token.token_class))
    .map((token) => token.text);
}

export function deriveSearchRepresentations(
  input: string,
  policy: SearchPolicy,
  adapter: SearchTextAdapter,
  aliases: SearchAliasResolver,
  authorization: SearchAuthorizationResolver,
  structuredComponents: readonly StructuredSearchComponent[] = [],
): SearchDerivationResult {
  const policyBlock = validatePolicy(policy);
  if (policyBlock) return { status: 'BLOCKED', derivations: null, blocking_detail: policyBlock };
  if (!authorization.authorization_version_ref || !authorization.authorize(
    policy.purpose_ref,
    policy.descriptor,
    policy.scope_ref,
  )) {
    return { status: 'BLOCKED', derivations: null, blocking_detail: 'search authorization or purpose denied' };
  }
  if (input.length === 0) {
    return { status: 'BLOCKED', derivations: null, blocking_detail: 'empty query does not authorize broad search' };
  }
  const versionRefs = versions(adapter, aliases);
  if (versionRefs.length !== 5) {
    return { status: 'BLOCKED', derivations: null, blocking_detail: 'all algorithm and catalog versions are required' };
  }

  let nfc: string;
  let folded: string;
  let accent: string;
  let tokens: readonly SearchToken[];
  try {
    nfc = adapter.normalize_nfc(input);
    if (adapter.normalize_nfc(nfc) !== nfc) throw new Error('NFC adapter is not idempotent');
    folded = adapter.case_fold(nfc, 'es-CO');
    if (policy.allow_edge_trim) folded = folded.replace(/^ +| +$/gu, '');
    if (policy.allow_internal_space_compaction) folded = compactAsciiSpaces(folded);
    accent = adapter.fold_es_co_accents(folded, policy.allow_diaeresis_fold);
    tokens = adapter.tokenize(folded);
  } catch {
    return { status: 'BLOCKED', derivations: null, blocking_detail: 'versioned search adapter failed' };
  }
  if (folded.length === 0) {
    return { status: 'BLOCKED', derivations: null, blocking_detail: 'query contains no searchable content' };
  }
  if (accent.includes('\u0000') || folded.includes('\u0000')) {
    return { status: 'BLOCKED', derivations: null, blocking_detail: 'adapter returned an invalid search representation' };
  }
  const tokenBlock = validateTokens(tokens, folded);
  if (tokenBlock) return { status: 'BLOCKED', derivations: null, blocking_detail: tokenBlock };

  let approvedAliases: readonly ApprovedSearchAlias[];
  try {
    approvedAliases = aliases.resolve(policy.descriptor, policy.scope_ref).filter((entry) => (
      entry.status === 'APPROVED_ACTIVE'
      && entry.language_profile === policy.language_profile
      && entry.semantic_class === policy.descriptor.semantic_class
      && nonEmpty(entry.approval_reference)
      && nonEmpty(entry.source_authority)
    ));
  } catch {
    return { status: 'BLOCKED', derivations: null, blocking_detail: 'versioned alias resolver failed' };
  }
  if (new Set(approvedAliases.map((entry) => entry.alias_key)).size !== approvedAliases.length) {
    return { status: 'BLOCKED', derivations: null, blocking_detail: 'approved alias set contains conflicting identities' };
  }
  if (
    structuredComponents.some((entry) => (
      !STRUCTURED_PRESENTATION_COMPONENTS.includes(entry.component) || !nonEmpty(entry.value)
    ))
  ) {
    return { status: 'BLOCKED', derivations: null, blocking_detail: 'structured component set is invalid' };
  }

  const lexical = searchableTokens(tokens);
  return {
    status: 'DERIVED',
    blocking_detail: null,
    derivations: {
      source_value: input,
      form_key: folded,
      accent_key: policy.enabled_representations.includes('SEARCH_ACCENT_KEY') ? accent : null,
      tokens,
      approved_aliases: policy.enabled_representations.includes('SEARCH_APPROVED_ALIAS_SET')
        ? approvedAliases
        : [],
      transliteration_key: null,
      structured_components: policy.enabled_representations.includes('SEARCH_STRUCTURED_COMPONENT_SET')
        ? [...structuredComponents]
        : [],
      free_text_terms: policy.enabled_representations.includes('SEARCH_FREE_TEXT_TERMS') ? lexical : [],
      version_refs: uniqueNonEmpty([...versionRefs, authorization.authorization_version_ref]),
    },
  };
}

function exactTokenSequence(haystack: readonly string[], needle: readonly string[]): boolean {
  if (needle.length === 0 || needle.length > haystack.length) return false;
  for (let start = 0; start <= haystack.length - needle.length; start += 1) {
    if (needle.every((token, offset) => token === haystack[start + offset])) return true;
  }
  return false;
}

function selectMatch(
  query: SearchDerivations,
  candidate: SearchDerivations,
  candidateReference: string,
): { mode: SearchMatchMode; level: number; terms: readonly string[] } | null {
  const queryTokens = searchableTokens(query.tokens);
  const candidateTokens = searchableTokens(candidate.tokens);
  if (query.source_value === candidate.source_value) {
    return { mode: 'EXACT_VALUE_MATCH', level: 1, terms: [query.source_value] };
  }
  if (query.form_key === candidate.form_key) {
    return { mode: 'FORM_EQUIVALENT_MATCH', level: 2, terms: [query.form_key] };
  }
  if (query.accent_key !== null && query.accent_key === candidate.accent_key) {
    return { mode: 'ACCENT_TOLERANT_MATCH', level: 3, terms: [query.accent_key] };
  }
  const matchingAlias = query.approved_aliases.some((entry) => (
    entry.alias_form === query.form_key
    && entry.canonical_target_reference === candidateReference
  ));
  if (matchingAlias) {
    return { mode: 'APPROVED_ALIAS_MATCH', level: 4, terms: [query.form_key] };
  }
  if (exactTokenSequence(candidateTokens, queryTokens)) {
    return { mode: 'ORDERED_PHRASE_MATCH', level: 5, terms: queryTokens };
  }
  if (queryTokens.length > 0 && queryTokens.every((token) => candidateTokens.includes(token))) {
    return { mode: 'ALL_TOKEN_MATCH', level: 6, terms: queryTokens };
  }
  const complete = queryTokens.slice(0, -1);
  const prefix = queryTokens.at(-1);
  if (
    prefix
    && complete.every((token) => candidateTokens.includes(token))
    && candidateTokens.some((token) => token.startsWith(prefix) && token !== prefix)
  ) {
    return { mode: 'LAST_TOKEN_PREFIX_MATCH', level: 7, terms: [...complete, prefix] };
  }
  return null;
}

function compareResponses(
  left: { response: SearchResponse; candidate: SearchCandidate; coverage: number },
  right: { response: SearchResponse; candidate: SearchCandidate; coverage: number },
): number {
  return left.response.match_level - right.response.match_level
    || right.candidate.scope_specificity - left.candidate.scope_specificity
    || right.coverage - left.coverage
    || (right.candidate.approved_business_priority ?? 0) - (left.candidate.approved_business_priority ?? 0)
    || left.candidate.stable_domain_sort_key.localeCompare(right.candidate.stable_domain_sort_key)
    || left.candidate.entity_id.localeCompare(right.candidate.entity_id);
}

export function evaluateSearchCandidates(
  query: string,
  candidates: readonly SearchCandidate[],
  policy: SearchPolicy,
  adapter: SearchTextAdapter,
  aliases: SearchAliasResolver,
  authorization: SearchAuthorizationResolver,
): SearchEvaluationResult {
  const queryResult = deriveSearchRepresentations(query, policy, adapter, aliases, authorization);
  if (queryResult.status === 'BLOCKED') {
    return { status: 'BLOCKED', results: [], blocking_detail: queryResult.blocking_detail };
  }

  const ranked: Array<{ response: SearchResponse; candidate: SearchCandidate; coverage: number }> = [];
  for (const candidate of candidates) {
    if (!nonEmpty(candidate.entity_id) || !nonEmpty(candidate.display_value)) continue;
    if (candidate.scope_ref !== policy.scope_ref) continue;
    const candidateResult = deriveSearchRepresentations(
      candidate.source_value,
      policy,
      adapter,
      aliases,
      authorization,
      candidate.structured_components,
    );
    if (candidateResult.status === 'BLOCKED') continue;
    const match = selectMatch(
      queryResult.derivations,
      candidateResult.derivations,
      candidate.entity_id,
    );
    if (!match) continue;
    const queryTokenCount = searchableTokens(queryResult.derivations.tokens).length;
    const coverage = queryTokenCount === 0 ? 0 : match.terms.length / queryTokenCount;
    ranked.push({
      candidate,
      coverage,
      response: {
        entity_id: candidate.entity_id,
        entity_type: candidate.entity_type,
        display_value: candidate.display_value,
        matched_field: candidate.matched_field,
        match_mode: match.mode,
        match_level: match.level,
        matched_terms_or_components: match.terms,
        search_profile: policy.profile,
        language_profile: policy.language_profile,
        algorithm_version: policy.algorithm_version,
        scope_summary: candidate.scope_ref,
        source_value_version_or_hash: candidate.source_value_version_or_hash,
        is_historical_or_inactive: candidate.is_historical_or_inactive,
        explanation: `${match.mode} under ${policy.policy_id}`,
      },
    });
  }

  ranked.sort(compareResponses);
  if (ranked.length === 0) return { status: 'NO_RESULTS', results: [], blocking_detail: null };
  return { status: 'RESULTS', results: ranked.map(({ response }) => response), blocking_detail: null };
}
