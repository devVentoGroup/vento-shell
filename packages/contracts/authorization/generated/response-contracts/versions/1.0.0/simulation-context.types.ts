// GENERATED FILE. DO NOT EDIT.
// Canonical source: AUTH-CTX-002 + corrected AUTH-CTX-003 + AUTH-CTX-004 + SHELL-CON-007
// Source contract SHA256: 63450829623c0d1fcc490b7417d70f71b61a2c160b029437412bc01b82de40f8
// Contract family: vento.authorization.response-contracts@1.0.0
// Release hash: sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd

import type { ContractMetadata } from "./contract-metadata.types.js";

export type AccessContextReference = {
  context_id: string;
  context_contract_version: string;
  resolved_at: string;
  actor_type: string;
  actor_id: string | null;
  principal_type: string;
  principal_id: string | null;
  context_fingerprint: string;
};

export type SimulationStatus =
  | "DRAFT"
  | "ACTIVE"
  | "COMPLETED"
  | "EXPIRED"
  | "REVOKED"
  | "INVALID";

export type SimulationPurpose =
  | "NAVIGATION_PREVIEW"
  | "AUTHORIZATION_EXPLANATION"
  | "ROLE_MATRIX_REVIEW"
  | "TERRITORIAL_SCENARIO"
  | "OPERATIONAL_CONTEXT_SCENARIO"
  | "DEVICE_SCENARIO"
  | "CHANGE_IMPACT_REVIEW"
  | "SUPPORT_DIAGNOSTIC";

export type RealSimulationActor = {
  actor_type: "EMPLOYEE" | "SYSTEM";
  actor_id: string;
  principal_id: string;
  employee_id: string | null;
  authenticated: boolean;
  active: boolean;
  simulation_permission_key: string;
  authorization_decision_id: string;
};

export type SimulatedSubjectType =
  | "EXISTING_EMPLOYEE_REFERENCE"
  | "BASE_ROLE_TEMPLATE"
  | "OPERATIONAL_ROLE_TEMPLATE"
  | "HYPOTHETICAL_EMPLOYEE"
  | "COMPOSITE_SCENARIO";

export type SimulationAuthorization = {
  decision_id: string;
  outcome: "ALLOW" | "DENY";
  permitted_purposes: SimulationPurpose[];
  permitted_subject_types: SimulatedSubjectType[];
  permitted_app_codes: string[];
  may_reference_real_subjects: boolean;
  may_reference_real_resources: boolean;
  may_view_sensitive_explanations: boolean;
  expires_at: string;
};

export type SimulatedSubject = {
  subject_type: SimulatedSubjectType;
  simulated_subject_id: string;
  real_employee_id: string | null;
  display_reference: string | null;
  base_role_code: string | null;
  operational_role_code: string | null;
  source:
    | "MASKED_REAL_REFERENCE"
    | "CANONICAL_ROLE_TEMPLATE"
    | "SYNTHETIC"
    | "PROPOSED_CHANGESET";
  contains_real_personal_data: boolean;
};

export type HypotheticalValue<T = unknown> = {
  value: T;
  provenance:
    | "CANONICAL_REAL_SNAPSHOT"
    | "MASKED_REAL_SNAPSHOT"
    | "SYNTHETIC"
    | "ROLE_TEMPLATE"
    | "PROPOSED_OVERRIDE"
    | "PROPOSED_ASSIGNMENT"
    | "PROPOSED_DENIAL"
    | "USER_SELECTED_SCENARIO";
  source_id: string | null;
  verified: boolean;
};

export type SimulationIssue = {
  issue_code: string;
  severity:
    | "BLOCKING_SIMULATION"
    | "BLOCKING_EVALUATION"
    | "INDETERMINATE"
    | "WARNING"
    | "INFO";
  source: string;
  safe_message: string;
};

export type HypotheticalAccessContext = {
  hypothetical_context_id: string;
  access_context_contract_version: string;

  domain_identity: HypotheticalValue | null;
  employee: HypotheticalValue | null;

  base_role: HypotheticalValue | null;
  assigned_sites: HypotheticalValue[];
  assigned_areas: HypotheticalValue[];
  administrative_coverage: HypotheticalValue;

  active_shift: HypotheticalValue | null;
  active_checkin_session: HypotheticalValue | null;
  operational_role: HypotheticalValue | null;
  operational_site: HypotheticalValue | null;
  operational_area: HypotheticalValue | null;

  device_context: HypotheticalValue | null;
  structural_issues: SimulationIssue[];
};

export type SimulationResourceScenario = {
  mode:
    | "SYNTHETIC_RESOURCE"
    | "MASKED_REAL_RESOURCE"
    | "AUTHORIZED_REAL_REFERENCE"
    | "RESOURCE_DRAFT"
    | "UNRESOLVED";
  resource_type: string;
  resource_reference_id: string | null;
  synthetic_resource_id: string | null;
  territory: HypotheticalValue;
  state: HypotheticalValue;
  ownership: HypotheticalValue;
  required_sides: HypotheticalValue[];
  sensitive_fields_present: boolean;
};

export type SimulatedLaneResult =
  | {
      required: false;
      result: null;
    }
  | {
      required: true;
      result: "WOULD_ALLOW" | "WOULD_DENY" | "INDETERMINATE";
    };

export type SimulationMatch =
  | {
      effect: "ALLOW";
      lane: "BASE" | "OPERATIONAL";
      provenance: "VIGENTE" | "PROPUESTA" | "SINTÉTICA";
      source_id: string | null;
    }
  | {
      effect: "DENY";
      lane: "BASE" | "OPERATIONAL" | "ALL";
      provenance: "VIGENTE" | "PROPUESTA" | "SINTÉTICA";
      source_id: string | null;
    };

export type SimulatedAuthorizationDecisionV1 = ContractMetadata & {
  contract_name: "SimulatedAuthorizationDecision";
  contract_version: "1.0.0";
  schema_version: "1.0.0";

  simulated_decision_id: string;
  evaluated_at: string;

  simulation_id: string;
  hypothetical_context_id: string;

  app_code: string;
  permission_key: string;
  resource_scenario_id: string | null;

  authorization_requirement: string | null;

  base_result: SimulatedLaneResult;
  operational_result: SimulatedLaneResult;

  matched_hypothetical_allows: SimulationMatch[];
  matched_hypothetical_denies: SimulationMatch[];

  blocked_reasons: SimulationIssue[];

  final_result: "WOULD_ALLOW" | "WOULD_DENY" | "INDETERMINATE";

  confidence:
    | "CONTRACT_COMPLETE"
    | "PARTIAL_INPUT"
    | "MASKED_INPUT"
    | "VERSION_MISMATCH";
};

export type SimulationResultReference = {
  simulated_decision_id: string;
  app_code: string;
  permission_key: string;
  resource_scenario_id: string | null;
  primary_reason_code: string;
};

export type SimulationAuditContext = {
  simulation_id: string;

  real_actor_id: string;
  real_principal_id: string;
  real_employee_id: string | null;

  purpose: SimulationPurpose;
  reason: string;

  simulated_subject_type: SimulatedSubjectType;
  simulated_subject_reference: string;

  app_codes: string[];
  permission_keys: string[];

  created_at: string;
  expires_at: string;
  completed_at: string | null;

  evaluation_count: number;
  would_allow_count: number;
  would_deny_count: number;
  indeterminate_count: number;

  access_context_fingerprint: string;
  catalog_version: string;
  dataset_versions: Record<string, string>;
  simulator_version: string;
};

export type SimulationContextV1 = ContractMetadata & {
  contract_name: "SimulationContext";
  contract_version: "1.0.0";
  schema_version: "1.0.0";

  simulation_id: string;
  status: SimulationStatus;
  purpose: SimulationPurpose;

  created_at: string;
  activated_at: string | null;
  expires_at: string;
  completed_at: string | null;
  revoked_at: string | null;

  real_actor: RealSimulationActor;
  real_access_context_ref: AccessContextReference;
  simulation_authorization: SimulationAuthorization;

  simulated_subject: SimulatedSubject;
  hypothetical_context: HypotheticalAccessContext;
  resource_scenario: SimulationResourceScenario | null;

  evaluations: SimulatedAuthorizationDecisionV1[];
  would_allow: SimulationResultReference[];
  would_deny: SimulationResultReference[];
  indeterminate: SimulationResultReference[];

  structural_issues: SimulationIssue[];
  audit: SimulationAuditContext;
};
