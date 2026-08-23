import type {
  NormalizableFieldDescriptor,
  NormalizationOperationKind,
  NormalizationTreatmentMode,
} from './normalization.types.js';

/**
 * Pure normalization rules for SHELL-NORM-003::GLOBAL.
 *
 * The module has no I/O, persistence, implicit locale, implicit catalog,
 * network, Supabase, identity, merge, or commit authority.
 */

export type SharedNormalizationRuleOperationKind =
  | 'UNICODE_CANONICALIZATION'
  | 'EDGE_WHITESPACE_TRIM'
  | 'INTERNAL_WHITESPACE_COMPACTION'
  | 'PROSE_PUNCTUATION_SPACING'
  | 'COMMERCIAL_CAPITALIZATION';

export type CommercialCapitalizationProfileId =
  'VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0';

export type CommercialCapitalizationLocale = 'es-CO';

export type CommercialCapitalizationTokenClass =
  | 'ORDINARY_LEXICAL_TOKEN'
  | 'CONNECTOR_TOKEN'
  | 'OFFICIAL_EXCEPTION_TOKEN'
  | 'CONTROLLED_ACRONYM_TOKEN'
  | 'MEASUREMENT_OR_UNIT_TOKEN'
  | 'NUMERIC_TOKEN'
  | 'ALPHANUMERIC_OR_MODEL_TOKEN'
  | 'PUNCTUATION_OR_SEPARATOR'
  | 'AMBIGUOUS_TOKEN';

export type CommercialCapitalizationTokenResult =
  | 'CAPITALIZED_ORDINARY'
  | 'LOWERCASED_CONNECTOR'
  | 'PRESERVED_OFFICIAL_EXCEPTION'
  | 'PRESERVED_NON_CASED'
  | 'PRESERVED_AMBIGUOUS'
  | 'BLOCKED_CONFLICT';

export type CommercialCapitalizationSegmentBoundary =
  | 'NAME_START'
  | 'DECLARED_SEGMENT_START'
  | 'NO_SEGMENT_RESET';

export interface NormalizationRulePolicy {
  readonly descriptor: NormalizableFieldDescriptor;
  readonly operation_kind: SharedNormalizationRuleOperationKind;
  readonly treatment_mode: NormalizationTreatmentMode;
  readonly allowed_operations: readonly NormalizationOperationKind[];
  readonly policy_version_ref: string;
}

export interface NormalizationStageResult {
  readonly operation_kind: SharedNormalizationRuleOperationKind;
  readonly input: string;
  readonly value: string;
  readonly changed: boolean;
  readonly blocked: boolean;
  readonly review_required: boolean;
  readonly policy_version_ref: string;
  readonly version_refs: readonly string[];
  readonly blocking_detail: string | null;
}

export interface UnicodeCanonicalizationAdapter {
  readonly unicode_version_ref: string;
  readonly normalize_nfc: (value: string) => string;
}

export interface EdgeWhitespacePolicy {
  readonly whitespace_version_ref: string;
  readonly removable_edge_separators: readonly string[];
  readonly allow_empty_result: boolean;
}

export interface InternalWhitespaceCompactionPolicy {
  readonly whitespace_version_ref: string;
  readonly accidental_internal_separators: readonly string[];
  readonly canonical_separator: string;
}

export interface ProsePunctuationSpacingRule {
  readonly punctuation: string;
  readonly spacing_token: string;
  readonly spaces_before: number;
  readonly spaces_after: number;
}

export interface ProsePunctuationSpacingPolicy {
  readonly prose_spacing_version_ref: string;
  readonly rules: readonly ProsePunctuationSpacingRule[];
}

export interface CommercialCapitalizationSegment {
  readonly text: string;
  readonly is_separator: boolean;
}

export interface CommercialCapitalizationTextAdapter {
  readonly segmentation_version_ref: string;
  readonly case_mapping_version_ref: string;
  readonly segment: (value: string) => readonly CommercialCapitalizationSegment[];
  readonly graphemes: (value: string) => readonly string[];
  readonly to_upper: (grapheme: string, locale: CommercialCapitalizationLocale) => string;
  readonly to_lower: (grapheme: string, locale: CommercialCapitalizationLocale) => string;
}

export interface CommercialCapitalizationPhraseCandidate {
  readonly token_count: number;
  readonly outputs: readonly string[];
}

export interface CommercialCapitalizationTokenCandidate {
  readonly output: string;
  readonly token_class: CommercialCapitalizationTokenClass;
}

export interface CommercialCapitalizationCatalogResolver {
  readonly connector_catalog_version_ref: string;
  readonly exception_catalog_version_ref: string;
  readonly official_phrase_candidates: (
    tokens: readonly string[],
    start_index: number,
  ) => readonly CommercialCapitalizationPhraseCandidate[];
  readonly official_token_candidates: (
    token: string,
  ) => readonly CommercialCapitalizationTokenCandidate[];
  readonly protected_token_candidates: (
    token: string,
  ) => readonly CommercialCapitalizationTokenCandidate[];
  readonly connector_candidates: (
    token: string,
    boundary: CommercialCapitalizationSegmentBoundary,
  ) => readonly CommercialCapitalizationTokenCandidate[];
}

export interface CommercialCapitalizationPolicy {
  readonly profile_ref: CommercialCapitalizationProfileId;
  readonly locale: CommercialCapitalizationLocale;
  readonly capitalization_version_ref: string;
  readonly enable_declared_segment_starts: boolean;
}

export interface CommercialCapitalizationTokenEvaluation {
  readonly input: string;
  readonly output: string;
  readonly token_class: CommercialCapitalizationTokenClass;
  readonly token_result: CommercialCapitalizationTokenResult;
  readonly boundary: CommercialCapitalizationSegmentBoundary;
}

export interface CommercialCapitalizationResult extends NormalizationStageResult {
  readonly profile_ref: CommercialCapitalizationProfileId;
  readonly locale: CommercialCapitalizationLocale;
  readonly token_evaluations: readonly CommercialCapitalizationTokenEvaluation[];
}

const DIRECT_OR_DERIVED_COMBINATIONS = new Set([
  'PRIMARY_VALUE::AUTHORITATIVE_SOURCE',
  'DISPLAY_OVERRIDE::APPROVED_OVERRIDE',
  'OUTPUT_PROJECTION::OUTPUT_ONLY',
]);

const PROTECTED_CAPITALIZATION_CLASSES = new Set<CommercialCapitalizationTokenClass>([
  'CONTROLLED_ACRONYM_TOKEN',
  'MEASUREMENT_OR_UNIT_TOKEN',
  'ALPHANUMERIC_OR_MODEL_TOKEN',
]);

function nonEmpty(value: string): boolean {
  return value.trim().length > 0;
}

function uniqueRefs(values: readonly string[]): readonly string[] {
  return [...new Set(values.filter(nonEmpty))];
}

function commonBlockingDetail(
  policy: NormalizationRulePolicy,
  expectedOperation: SharedNormalizationRuleOperationKind,
): string | null {
  if (policy.operation_kind !== expectedOperation) {
    return 'operation_kind does not match the requested normalization stage';
  }
  if (!nonEmpty(policy.policy_version_ref)) {
    return 'policy_version_ref is required';
  }
  if (policy.descriptor.policy_version_ref !== policy.policy_version_ref) {
    return 'descriptor policy version and effective policy version differ';
  }
  if (!policy.allowed_operations.includes(expectedOperation)) {
    return 'effective field policy does not authorize this operation';
  }
  if (!['DETERMINISTIC_MUTATION_ALLOWED', 'DERIVATION_ONLY'].includes(policy.treatment_mode)) {
    return 'effective treatment mode does not permit this deterministic stage';
  }
  if (policy.descriptor.semantic_class === 'SECRET_OR_SIGNATURE_MATERIAL') {
    return 'secret or signature material must preserve exact representation';
  }
  const combination = `${policy.descriptor.representation_role}::${policy.descriptor.source_role}`;
  if (!DIRECT_OR_DERIVED_COMBINATIONS.has(combination)) {
    return 'representation and source do not permit direct or derived normalization';
  }
  return null;
}

function stageResult(
  policy: NormalizationRulePolicy,
  input: string,
  value: string,
  versionRefs: readonly string[],
  blockingDetail: string | null,
  reviewRequired = false,
): NormalizationStageResult {
  const blocked = blockingDetail !== null || reviewRequired;
  const finalValue = blocked ? input : value;
  return {
    operation_kind: policy.operation_kind,
    input,
    value: finalValue,
    changed: !blocked && finalValue !== input,
    blocked,
    review_required: reviewRequired,
    policy_version_ref: policy.policy_version_ref,
    version_refs: uniqueRefs([policy.policy_version_ref, ...versionRefs]),
    blocking_detail: blockingDetail,
  };
}

function validateSeparatorTokens(tokens: readonly string[]): readonly string[] | null {
  if (tokens.length === 0 || tokens.some((token) => token.length === 0)) return null;
  if (new Set(tokens).size !== tokens.length) return null;
  return [...tokens].sort((left, right) => right.length - left.length);
}

function matchTokenAt(value: string, offset: number, tokens: readonly string[]): string | null {
  for (const token of tokens) {
    if (value.startsWith(token, offset)) return token;
  }
  return null;
}

function trimExplicitEdges(value: string, tokens: readonly string[]): string {
  let start = 0;
  let end = value.length;

  while (start < end) {
    const token = matchTokenAt(value, start, tokens);
    if (!token || start + token.length > end) break;
    start += token.length;
  }

  while (end > start) {
    const token = tokens.find((candidate) => (
      candidate.length <= end - start
      && value.slice(end - candidate.length, end) === candidate
    ));
    if (!token) break;
    end -= token.length;
  }

  return value.slice(start, end);
}

function compactExplicitInternalSeparators(
  value: string,
  tokens: readonly string[],
  canonicalSeparator: string,
): string {
  let offset = 0;
  let output = '';

  while (offset < value.length) {
    const first = matchTokenAt(value, offset, tokens);
    if (!first) {
      output += value[offset];
      offset += 1;
      continue;
    }

    const runStart = offset;
    let runEnd = offset;
    while (runEnd < value.length) {
      const token = matchTokenAt(value, runEnd, tokens);
      if (!token) break;
      runEnd += token.length;
    }

    const run = value.slice(runStart, runEnd);
    const isInternal = runStart > 0 && runEnd < value.length;
    output += isInternal ? canonicalSeparator : run;
    offset = runEnd;
  }

  return output;
}

function escapeRegExp(value: string): string {
  return value.replace(/[.*+?^${}()|[\]\\]/gu, '\\$&');
}

function validateSpacingRule(rule: ProsePunctuationSpacingRule): boolean {
  return rule.punctuation.length > 0
    && rule.spacing_token.length > 0
    && !rule.punctuation.includes(rule.spacing_token)
    && Number.isInteger(rule.spaces_before)
    && Number.isInteger(rule.spaces_after)
    && rule.spaces_before >= 0
    && rule.spaces_after >= 0;
}

function applySpacingRule(
  input: string,
  rule: ProsePunctuationSpacingRule,
): { readonly value: string; readonly valid: boolean } {
  const spacing = escapeRegExp(rule.spacing_token);
  const punctuation = escapeRegExp(rule.punctuation);
  const matcher = new RegExp(`${spacing}*${punctuation}${spacing}*`, 'gu');
  let invalidBoundary = false;

  const value = input.replace(matcher, (match, offset: number) => {
    const punctuationOffset = match.indexOf(rule.punctuation);
    const absolutePunctuationOffset = offset + punctuationOffset;
    const punctuationEnd = absolutePunctuationOffset + rule.punctuation.length;

    if (absolutePunctuationOffset === 0 && rule.spaces_before > 0) {
      invalidBoundary = true;
      return match;
    }
    if (punctuationEnd === input.length && rule.spaces_after > 0) {
      invalidBoundary = true;
      return match;
    }

    return rule.spacing_token.repeat(rule.spaces_before)
      + rule.punctuation
      + rule.spacing_token.repeat(rule.spaces_after);
  });

  return { value, valid: !invalidBoundary };
}

function hasDistinctCandidates<T>(
  candidates: readonly T[],
  key: (candidate: T) => string,
): boolean {
  return new Set(candidates.map(key)).size > 1;
}

function selectTokenCandidate(
  candidates: readonly CommercialCapitalizationTokenCandidate[],
  allowedClasses: ReadonlySet<CommercialCapitalizationTokenClass>,
): CommercialCapitalizationTokenCandidate | null | 'CONFLICT' {
  const valid = candidates.filter((candidate) => (
    nonEmpty(candidate.output) && allowedClasses.has(candidate.token_class)
  ));
  if (valid.length === 0) return null;
  if (hasDistinctCandidates(valid, (candidate) => `${candidate.token_class}::${candidate.output}`)) {
    return 'CONFLICT';
  }
  return valid[0];
}

function selectPhraseCandidate(
  candidates: readonly CommercialCapitalizationPhraseCandidate[],
  remainingTokens: number,
): CommercialCapitalizationPhraseCandidate | null | 'CONFLICT' {
  const valid = candidates.filter((candidate) => (
    Number.isInteger(candidate.token_count)
    && candidate.token_count > 0
    && candidate.token_count <= remainingTokens
    && candidate.outputs.length === candidate.token_count
    && candidate.outputs.every(nonEmpty)
  ));
  if (valid.length === 0) return null;

  const longest = Math.max(...valid.map((candidate) => candidate.token_count));
  const top = valid.filter((candidate) => candidate.token_count === longest);
  if (hasDistinctCandidates(top, (candidate) => JSON.stringify(candidate.outputs))) {
    return 'CONFLICT';
  }
  return top[0];
}

function capitalizationBoundary(
  tokenPosition: number,
  tokenSegmentIndexes: readonly number[],
  segments: readonly CommercialCapitalizationSegment[],
  enabled: boolean,
): CommercialCapitalizationSegmentBoundary {
  if (tokenPosition === 0) return 'NAME_START';
  if (!enabled) return 'NO_SEGMENT_RESET';

  const previousSegment = tokenSegmentIndexes[tokenPosition - 1];
  const currentSegment = tokenSegmentIndexes[tokenPosition];
  const separator = segments
    .slice(previousSegment + 1, currentSegment)
    .map((segment) => segment.text)
    .join('');

  if (separator.includes(' : ') || separator.includes(' — ') || separator.includes(' – ')) {
    return 'DECLARED_SEGMENT_START';
  }
  return 'NO_SEGMENT_RESET';
}

function capitalizeOrdinaryToken(
  token: string,
  adapter: CommercialCapitalizationTextAdapter,
): { readonly output: string; readonly valid: boolean; readonly cased: boolean } {
  const graphemes = adapter.graphemes(token);
  if (graphemes.length === 0 || graphemes.join('') !== token) {
    return { output: token, valid: false, cased: false };
  }

  let firstCasedSeen = false;
  let cased = false;
  let output = '';

  for (const grapheme of graphemes) {
    const upper = adapter.to_upper(grapheme, 'es-CO');
    const lower = adapter.to_lower(grapheme, 'es-CO');
    if (typeof upper !== 'string' || typeof lower !== 'string' || upper.length === 0 || lower.length === 0) {
      return { output: token, valid: false, cased: false };
    }

    const hasCase = upper !== lower;
    if (!hasCase) {
      output += grapheme;
      continue;
    }

    cased = true;
    output += firstCasedSeen ? lower : upper;
    firstCasedSeen = true;
  }

  return { output, valid: true, cased };
}

export function applyUnicodeCanonicalization(
  input: string,
  policy: NormalizationRulePolicy,
  adapter: UnicodeCanonicalizationAdapter,
): NormalizationStageResult {
  const common = commonBlockingDetail(policy, 'UNICODE_CANONICALIZATION');
  if (common) return stageResult(policy, input, input, [], common);
  if (!nonEmpty(adapter.unicode_version_ref)) {
    return stageResult(policy, input, input, [], 'unicode_version_ref is required');
  }

  let first: string;
  let second: string;
  try {
    first = adapter.normalize_nfc(input);
    second = adapter.normalize_nfc(first);
  } catch {
    return stageResult(
      policy,
      input,
      input,
      [adapter.unicode_version_ref],
      'NFC adapter could not evaluate the input under the declared Unicode version',
    );
  }

  if (typeof first !== 'string' || typeof second !== 'string' || first !== second) {
    return stageResult(
      policy,
      input,
      input,
      [adapter.unicode_version_ref],
      'NFC adapter is not idempotent for the declared Unicode version',
    );
  }

  return stageResult(policy, input, first, [adapter.unicode_version_ref], null);
}

export function applyEdgeWhitespaceTrim(
  input: string,
  policy: NormalizationRulePolicy,
  whitespacePolicy: EdgeWhitespacePolicy,
): NormalizationStageResult {
  const common = commonBlockingDetail(policy, 'EDGE_WHITESPACE_TRIM');
  if (common) return stageResult(policy, input, input, [], common);
  if (!nonEmpty(whitespacePolicy.whitespace_version_ref)) {
    return stageResult(policy, input, input, [], 'whitespace_version_ref is required');
  }

  const tokens = validateSeparatorTokens(whitespacePolicy.removable_edge_separators);
  if (!tokens) {
    return stageResult(
      policy,
      input,
      input,
      [whitespacePolicy.whitespace_version_ref],
      'edge whitespace policy must declare unique non-empty removable separators',
    );
  }

  const value = trimExplicitEdges(input, tokens);
  if (value.length === 0 && input.length > 0 && !whitespacePolicy.allow_empty_result) {
    return stageResult(
      policy,
      input,
      input,
      [whitespacePolicy.whitespace_version_ref],
      'edge trim would cross the declared empty-content boundary',
    );
  }

  return stageResult(policy, input, value, [whitespacePolicy.whitespace_version_ref], null);
}

export function applyInternalWhitespaceCompaction(
  input: string,
  policy: NormalizationRulePolicy,
  whitespacePolicy: InternalWhitespaceCompactionPolicy,
): NormalizationStageResult {
  const common = commonBlockingDetail(policy, 'INTERNAL_WHITESPACE_COMPACTION');
  if (common) return stageResult(policy, input, input, [], common);
  if (!nonEmpty(whitespacePolicy.whitespace_version_ref)) {
    return stageResult(policy, input, input, [], 'whitespace_version_ref is required');
  }
  if (whitespacePolicy.canonical_separator.length === 0) {
    return stageResult(
      policy,
      input,
      input,
      [whitespacePolicy.whitespace_version_ref],
      'internal compaction cannot delete the separator between tokens',
    );
  }

  const tokens = validateSeparatorTokens(whitespacePolicy.accidental_internal_separators);
  if (!tokens) {
    return stageResult(
      policy,
      input,
      input,
      [whitespacePolicy.whitespace_version_ref],
      'internal whitespace policy must declare unique non-empty accidental separators',
    );
  }

  const value = compactExplicitInternalSeparators(
    input,
    tokens,
    whitespacePolicy.canonical_separator,
  );

  return stageResult(policy, input, value, [whitespacePolicy.whitespace_version_ref], null);
}

export function applyProsePunctuationSpacing(
  input: string,
  policy: NormalizationRulePolicy,
  spacingPolicy: ProsePunctuationSpacingPolicy,
): NormalizationStageResult {
  const common = commonBlockingDetail(policy, 'PROSE_PUNCTUATION_SPACING');
  if (common) return stageResult(policy, input, input, [], common);
  if (!nonEmpty(spacingPolicy.prose_spacing_version_ref)) {
    return stageResult(policy, input, input, [], 'prose_spacing_version_ref is required');
  }
  if (spacingPolicy.rules.length === 0 || spacingPolicy.rules.some((rule) => !validateSpacingRule(rule))) {
    return stageResult(
      policy,
      input,
      input,
      [spacingPolicy.prose_spacing_version_ref],
      'prose punctuation spacing requires explicit valid field-policy rules',
    );
  }
  if (new Set(spacingPolicy.rules.map((rule) => rule.punctuation)).size !== spacingPolicy.rules.length) {
    return stageResult(
      policy,
      input,
      input,
      [spacingPolicy.prose_spacing_version_ref],
      'prose punctuation spacing contains conflicting punctuation rules',
    );
  }

  let value = input;
  for (const rule of spacingPolicy.rules) {
    const applied = applySpacingRule(value, rule);
    if (!applied.valid) {
      return stageResult(
        policy,
        input,
        input,
        [spacingPolicy.prose_spacing_version_ref],
        'prose punctuation spacing would create unsupported edge spacing',
      );
    }
    value = applied.value;
  }

  return stageResult(policy, input, value, [spacingPolicy.prose_spacing_version_ref], null);
}

export function applyCommercialCapitalization(
  input: string,
  policy: NormalizationRulePolicy,
  capitalizationPolicy: CommercialCapitalizationPolicy,
  adapter: CommercialCapitalizationTextAdapter,
  catalogs: CommercialCapitalizationCatalogResolver,
): CommercialCapitalizationResult {
  const versionRefs = [
    capitalizationPolicy.capitalization_version_ref,
    adapter.segmentation_version_ref,
    adapter.case_mapping_version_ref,
    catalogs.connector_catalog_version_ref,
    catalogs.exception_catalog_version_ref,
  ];

  const base = commonBlockingDetail(policy, 'COMMERCIAL_CAPITALIZATION');
  const block = (detail: string, reviewRequired = false): CommercialCapitalizationResult => ({
    ...stageResult(policy, input, input, versionRefs, detail, reviewRequired),
    profile_ref: capitalizationPolicy.profile_ref,
    locale: capitalizationPolicy.locale,
    token_evaluations: [],
  });

  if (base) return block(base);
  if (policy.descriptor.semantic_class !== 'COMMERCIAL_NAME') {
    return block('COMMERCIAL_CAPITALIZATION is restricted to COMMERCIAL_NAME');
  }
  if (capitalizationPolicy.profile_ref !== 'VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0') {
    return block('unsupported commercial capitalization profile');
  }
  if (capitalizationPolicy.locale !== 'es-CO') {
    return block('commercial capitalization requires explicit es-CO locale');
  }
  if (versionRefs.some((value) => !nonEmpty(value))) {
    return block('capitalization, segmentation, case, connector and exception versions are required');
  }

  let segments: readonly CommercialCapitalizationSegment[];
  try {
    segments = adapter.segment(input);
  } catch {
    return block('segmentation adapter failed for the declared version');
  }

  if (
    segments.length === 0
    || segments.some((segment) => segment.text.length === 0)
    || segments.map((segment) => segment.text).join('') !== input
  ) {
    return block('segmentation must preserve the complete input and all separators');
  }

  const tokenSegmentIndexes = segments
    .map((segment, index) => ({ segment, index }))
    .filter(({ segment }) => !segment.is_separator)
    .map(({ index }) => index);
  const tokenTexts = tokenSegmentIndexes.map((index) => segments[index].text);

  if (tokenTexts.length === 0) {
    return {
      ...stageResult(policy, input, input, versionRefs, null),
      profile_ref: capitalizationPolicy.profile_ref,
      locale: capitalizationPolicy.locale,
      token_evaluations: segments.map((segment) => ({
        input: segment.text,
        output: segment.text,
        token_class: 'PUNCTUATION_OR_SEPARATOR',
        token_result: 'PRESERVED_NON_CASED',
        boundary: 'NO_SEGMENT_RESET',
      })),
    };
  }

  const outputSegments = segments.map((segment) => segment.text);
  const evaluations: CommercialCapitalizationTokenEvaluation[] = [];
  const tokenEvaluationBySegment = new Map<number, CommercialCapitalizationTokenEvaluation>();
  let conflict = false;
  let reviewRequired = false;

  for (let tokenPosition = 0; tokenPosition < tokenTexts.length;) {
    const segmentIndex = tokenSegmentIndexes[tokenPosition];
    const token = tokenTexts[tokenPosition];
    const boundary = capitalizationBoundary(
      tokenPosition,
      tokenSegmentIndexes,
      segments,
      capitalizationPolicy.enable_declared_segment_starts,
    );

    const phrase = selectPhraseCandidate(
      catalogs.official_phrase_candidates(tokenTexts, tokenPosition),
      tokenTexts.length - tokenPosition,
    );

    if (phrase === 'CONFLICT') {
      conflict = true;
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: token,
        token_class: 'OFFICIAL_EXCEPTION_TOKEN',
        token_result: 'BLOCKED_CONFLICT',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }

    if (phrase) {
      for (let offset = 0; offset < phrase.token_count; offset += 1) {
        const phraseTokenPosition = tokenPosition + offset;
        const phraseSegmentIndex = tokenSegmentIndexes[phraseTokenPosition];
        const phraseInput = tokenTexts[phraseTokenPosition];
        const phraseOutput = phrase.outputs[offset];
        const phraseBoundary = capitalizationBoundary(
          phraseTokenPosition,
          tokenSegmentIndexes,
          segments,
          capitalizationPolicy.enable_declared_segment_starts,
        );
        outputSegments[phraseSegmentIndex] = phraseOutput;
        tokenEvaluationBySegment.set(phraseSegmentIndex, {
          input: phraseInput,
          output: phraseOutput,
          token_class: 'OFFICIAL_EXCEPTION_TOKEN',
          token_result: 'PRESERVED_OFFICIAL_EXCEPTION',
          boundary: phraseBoundary,
        });
      }
      tokenPosition += phrase.token_count;
      continue;
    }

    const official = selectTokenCandidate(
      catalogs.official_token_candidates(token),
      new Set<CommercialCapitalizationTokenClass>(['OFFICIAL_EXCEPTION_TOKEN']),
    );
    if (official === 'CONFLICT') {
      conflict = true;
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: token,
        token_class: 'OFFICIAL_EXCEPTION_TOKEN',
        token_result: 'BLOCKED_CONFLICT',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }
    if (official) {
      outputSegments[segmentIndex] = official.output;
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: official.output,
        token_class: official.token_class,
        token_result: 'PRESERVED_OFFICIAL_EXCEPTION',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }

    const protectedToken = selectTokenCandidate(
      catalogs.protected_token_candidates(token),
      PROTECTED_CAPITALIZATION_CLASSES,
    );
    if (protectedToken === 'CONFLICT') {
      conflict = true;
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: token,
        token_class: 'ALPHANUMERIC_OR_MODEL_TOKEN',
        token_result: 'BLOCKED_CONFLICT',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }
    if (protectedToken) {
      outputSegments[segmentIndex] = protectedToken.output;
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: protectedToken.output,
        token_class: protectedToken.token_class,
        token_result: 'PRESERVED_NON_CASED',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }

    const connector = selectTokenCandidate(
      catalogs.connector_candidates(token, boundary),
      new Set<CommercialCapitalizationTokenClass>(['CONNECTOR_TOKEN']),
    );
    if (connector === 'CONFLICT') {
      conflict = true;
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: token,
        token_class: 'CONNECTOR_TOKEN',
        token_result: 'BLOCKED_CONFLICT',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }
    if (connector) {
      outputSegments[segmentIndex] = connector.output;
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: connector.output,
        token_class: connector.token_class,
        token_result: boundary === 'NO_SEGMENT_RESET'
          ? 'LOWERCASED_CONNECTOR'
          : 'CAPITALIZED_ORDINARY',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }

    if (/^[\p{N}]+(?:[.,/+\-][\p{N}]+)*$/u.test(token)) {
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: token,
        token_class: 'NUMERIC_TOKEN',
        token_result: 'PRESERVED_NON_CASED',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }

    if (/^[\p{L}\p{M}]+$/u.test(token)) {
      const ordinary = capitalizeOrdinaryToken(token, adapter);
      if (!ordinary.valid) {
        conflict = true;
        tokenEvaluationBySegment.set(segmentIndex, {
          input: token,
          output: token,
          token_class: 'ORDINARY_LEXICAL_TOKEN',
          token_result: 'BLOCKED_CONFLICT',
          boundary,
        });
      } else {
        outputSegments[segmentIndex] = ordinary.output;
        tokenEvaluationBySegment.set(segmentIndex, {
          input: token,
          output: ordinary.output,
          token_class: 'ORDINARY_LEXICAL_TOKEN',
          token_result: ordinary.cased ? 'CAPITALIZED_ORDINARY' : 'PRESERVED_NON_CASED',
          boundary,
        });
      }
      tokenPosition += 1;
      continue;
    }

    const hasLetter = /[\p{L}\p{M}]/u.test(token);
    const hasNumber = /\p{N}/u.test(token);
    const hasInternalTechnicalPunctuation = /[.'-]/u.test(token);
    if (hasLetter && (hasNumber || hasInternalTechnicalPunctuation)) {
      reviewRequired = true;
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: token,
        token_class: 'ALPHANUMERIC_OR_MODEL_TOKEN',
        token_result: 'PRESERVED_AMBIGUOUS',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }

    if (/^[\p{P}\p{S}]+$/u.test(token)) {
      tokenEvaluationBySegment.set(segmentIndex, {
        input: token,
        output: token,
        token_class: 'PUNCTUATION_OR_SEPARATOR',
        token_result: 'PRESERVED_NON_CASED',
        boundary,
      });
      tokenPosition += 1;
      continue;
    }

    reviewRequired = true;
    tokenEvaluationBySegment.set(segmentIndex, {
      input: token,
      output: token,
      token_class: 'AMBIGUOUS_TOKEN',
      token_result: 'PRESERVED_AMBIGUOUS',
      boundary,
    });
    tokenPosition += 1;
  }

  for (let segmentIndex = 0; segmentIndex < segments.length; segmentIndex += 1) {
    const segment = segments[segmentIndex];
    if (segment.is_separator) {
      evaluations.push({
        input: segment.text,
        output: segment.text,
        token_class: 'PUNCTUATION_OR_SEPARATOR',
        token_result: 'PRESERVED_NON_CASED',
        boundary: 'NO_SEGMENT_RESET',
      });
      continue;
    }
    const evaluation = tokenEvaluationBySegment.get(segmentIndex);
    if (!evaluation) return block('capitalization classification did not cover every token');
    evaluations.push(evaluation);
  }

  if (conflict) {
    return {
      ...stageResult(policy, input, input, versionRefs, 'capitalization catalog or runtime conflict'),
      profile_ref: capitalizationPolicy.profile_ref,
      locale: capitalizationPolicy.locale,
      token_evaluations: evaluations,
    };
  }

  if (reviewRequired) {
    return {
      ...stageResult(
        policy,
        input,
        input,
        versionRefs,
        'capitalization requires unresolved human review',
        true,
      ),
      profile_ref: capitalizationPolicy.profile_ref,
      locale: capitalizationPolicy.locale,
      token_evaluations: evaluations,
    };
  }

  const value = outputSegments.join('');
  return {
    ...stageResult(policy, input, value, versionRefs, null),
    profile_ref: capitalizationPolicy.profile_ref,
    locale: capitalizationPolicy.locale,
    token_evaluations: evaluations,
  };
}
