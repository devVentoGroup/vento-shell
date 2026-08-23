/**
 * Shared normalization type contracts for SHELL-NORM-002::GLOBAL.
 *
 * This module is type-only. It does not normalize values, infer policy,
 * authorize mutations, persist data, or define runtime validators.
 */

export type NormalizableFieldSemanticClass =
  | 'COMMERCIAL_NAME'
  | 'STRUCTURED_PRESENTATION_NAME'
  | 'HUMAN_LABEL'
  | 'OFFICIAL_LEGAL_NAME'
  | 'OFFICIAL_BRAND_FORM'
  | 'PERSON_OR_ACTOR_NAME'
  | 'ADDRESS_OR_LOCATION_TEXT'
  | 'FREE_TEXT'
  | 'CONTROLLED_VOCABULARY_CODE'
  | 'MEASUREMENT_OR_UNIT_CODE'
  | 'TECHNICAL_IDENTIFIER'
  | 'CONTACT_IDENTIFIER'
  | 'SECRET_OR_SIGNATURE_MATERIAL'
  | 'UNCLASSIFIED_PRESERVE';

export type NormalizationRepresentationRole =
  | 'PRIMARY_VALUE'
  | 'DISPLAY_OVERRIDE'
  | 'SEARCH_DERIVATION'
  | 'EXTERNAL_ORIGINAL'
  | 'HISTORICAL_SNAPSHOT'
  | 'OUTPUT_PROJECTION'
  | 'AUDIT_EVIDENCE';

export type NormalizationSourceRole =
  | 'AUTHORITATIVE_SOURCE'
  | 'APPROVED_OVERRIDE'
  | 'SYNCHRONIZED_COPY'
  | 'IMMUTABLE_SNAPSHOT'
  | 'EXTERNAL_EVIDENCE'
  | 'OUTPUT_ONLY';

export type NormalizationTreatmentMode =
  | 'DETERMINISTIC_MUTATION_ALLOWED'
  | 'DICTIONARY_MUTATION_ALLOWED'
  | 'DERIVATION_ONLY'
  | 'VALIDATION_ONLY'
  | 'HUMAN_REVIEW_REQUIRED'
  | 'PRESERVE_EXACT'
  | 'STRUCTURAL_RESOLUTION_REQUIRED'
  | 'PROHIBITED';

export type NormalizationOperationKind =
  | 'UNICODE_CANONICALIZATION'
  | 'EDGE_WHITESPACE_TRIM'
  | 'INTERNAL_WHITESPACE_COMPACTION'
  | 'PROSE_PUNCTUATION_SPACING'
  | 'COMMERCIAL_CAPITALIZATION'
  | 'CONNECTOR_CASE_POLICY'
  | 'APPROVED_DICTIONARY_CORRECTION'
  | 'OFFICIAL_EXCEPTION_APPLICATION'
  | 'TECHNICAL_CANONICALIZATION'
  | 'SEARCH_KEY_DERIVATION'
  | 'STRUCTURED_PARSE_OR_RENDER'
  | 'SOURCE_PROPAGATION_OR_RESYNC'
  | 'IDENTITY_OR_RECORD_ACTION';

export interface NormalizableFieldCoordinate {
  readonly owner_domain_ref: string;
  readonly owner_entity_ref: string;
  readonly semantic_field_ref: string;
}

export interface NormalizableFieldDescriptor {
  readonly coordinate: NormalizableFieldCoordinate;
  readonly semantic_class: NormalizableFieldSemanticClass;
  readonly representation_role: NormalizationRepresentationRole;
  readonly source_role: NormalizationSourceRole;
  readonly policy_version_ref: string;
  readonly implementation_binding_ref?: readonly string[];
  readonly auxiliary_context?: unknown;
}

export interface NormalizableStructuredComponentDescriptor {
  readonly parent_field: NormalizableFieldCoordinate;
  readonly component_path_ref: string;
  readonly descriptor: NormalizableFieldDescriptor;
  readonly order_semantics_ref?: string;
  readonly duplicate_semantics_ref?: string;
}

export interface NormalizablePolymorphicVariantDescriptor {
  readonly parent_field: NormalizableFieldCoordinate;
  readonly discriminator_ref: string;
  readonly discriminator_version_ref: string;
  readonly variant_ref: string;
  readonly descriptor: NormalizableFieldDescriptor;
}
