import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(authorizationRoot, '../../..');

const contextSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E_CONTEXTO_Y_DECISION',
  '01_CONTRATOS_BASE.md',
);

const shellSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'H_FUNDACION_COMPARTIDA',
  '03_CONTRATOS_COMPARTIDOS.md',
);

const generatedDirectory = path.join(
  authorizationRoot,
  'generated',
  'response-contracts',
  'versions',
  '1.0.0',
);

const metadataPath = path.join(generatedDirectory, 'contract-metadata.types.ts');
const accessContextPath = path.join(generatedDirectory, 'access-context.types.ts');
const simulationContextPath = path.join(generatedDirectory, 'simulation-context.types.ts');
const indexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 = '63450829623c0d1fcc490b7417d70f71b61a2c160b029437412bc01b82de40f8';
const reasonCodeSourceContractSha256 = 'ef042d037827ce14470e1cffa7ba3c76bf88318a21a65644cd465efdc65b5122';
const contractFamily = 'vento.authorization.response-contracts';
const contractFamilyVersion = '1.0.0';
const releaseHash = 'sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd';

function fail(message) {
  throw new Error(message);
}

function readCanonical(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing canonical source ${label}: ${path.relative(process.cwd(), filePath)}`);
  }
  return fs.readFileSync(filePath, 'utf8').replaceAll('\r\n', '\n');
}

function assertIncludes(source, expected, label) {
  if (!source.includes(expected)) {
    fail(`${label} is missing required canonical marker: ${expected}`);
  }
}

function validateCanonicalSources() {
  const contextSource = readCanonical(contextSourcePath, 'AUTH-CTX');
  const shellSource = readCanonical(shellSourcePath, 'SHELL-CON');

  const contextMarkers = [
    '### ✅ AUTH-CTX-001 — Diseñar AccessContext canónico',
    '### ✅ AUTH-CTX-003 — Diseñar SimulationContext separado',
    '### ✅ AUTH-CTX-004 — Versionar los contratos de respuesta',
    'vento.authorization.response-contracts@1.0.0',
    releaseHash,
    'type SimulatedLaneResult =',
    'required: false;',
    'required: true;',
    'type SimulationMatch =',
    'effect: "ALLOW";',
    'effect: "DENY";',
    'lane: "BASE" | "OPERATIONAL" | "ALL";',
    'type SimulationContext = {',
    'type AccessContext = {',
  ];

  for (const marker of contextMarkers) {
    assertIncludes(contextSource, marker, 'AUTH-CTX canonical source');
  }

  const shellMarkers = [
    '### ✅ SHELL-CON-007 — Centralizar tipos de contexto',
    '### ✅ SHELL-CON-008 — Centralizar códigos de error',
    'modalidad física | `GLOBAL_ENABLE_ONCE`',
    'gate temporal | `PRE_E5_FOUNDATION`',
    'vento.authorization.response-contracts@1.0.0',
    releaseHash,
    '`BaseRoleContext.role_code`',
    '`OperationalRoleContext.role_code`',
    '`DeviceContext.allowed_application_codes[]`',
    '`EffectiveContext` físico actual no es fuente de verdad canónica.',
    '`ContextSimulationInput` físico actual no es `SimulationContextV1`.',
    'type StructuralIssueCode =',
    'type LaneAvailabilityReasonCode =',
    'type LaneReasonCode =',
    'type StructuralIssueSeverity =',
    'type StructuralIssueSubjectType =',
    'type StructuralIssueSource =',
  ];

  for (const marker of shellMarkers) {
    assertIncludes(shellSource, marker, 'SHELL-CON canonical source');
  }
}

function renderHeader(sourceLabel) {
  return `// GENERATED FILE. DO NOT EDIT.
// Canonical source: ${sourceLabel}
// Source contract SHA256: ${sourceContractSha256}
// Contract family: ${contractFamily}@${contractFamilyVersion}
// Release hash: ${releaseHash}

`;
}

function renderMetadata() {
  return `${renderHeader('AUTH-CTX-004 / SHELL-CON-007')}export type ResponseContractName =
  | "AccessContext"
  | "AuthorizationDecision"
  | "SimulationContext"
  | "SimulatedAuthorizationDecision";

export type ContractMetadata = {
  contract_family: "vento.authorization.response-contracts";
  contract_family_version: "1.0.0";
  contract_name: ResponseContractName;
  contract_version: string;
  schema_version: string;
};
`;
}

function renderAccessContext() {
  return `${renderHeader('AUTH-CTX-001 + AUTH-MOD-021 + SHELL-CON-007 + SHELL-CON-008')}// Reason code source contract SHA256: ${reasonCodeSourceContractSha256}

import type { AppCode } from "../../../versions/1.0.0/catalog.types.js";
import type { BaseRoleCode } from "../../../base-roles/versions/1.1.0/base-role.types.js";
import type { OperationalRoleCode } from "../../../operational-roles/versions/1.0.0/operational-role.types.js";
import type {
  LaneReasonCode,
  StructuralIssueCode,
  StructuralIssueSeverity,
  StructuralIssueSource,
  StructuralIssueSubjectType,
} from "../../../reason-codes/versions/1.0.0/reason-code.types.js";
import type { ContractMetadata } from "./contract-metadata.types.js";

export type PrincipalContext = {
  principal_type:
    | "HUMAN_USER"
    | "SHARED_DEVICE"
    | "SYSTEM_SERVICE"
    | "ANONYMOUS";
  auth_user_id: string | null;
  session_id: string | null;
  authenticated: boolean;
  authentication_method: string | null;
  authenticated_at: string | null;
  session_expires_at: string | null;
  principal_status: "VALID" | "INVALID" | "ANONYMOUS";
};

export type EffectiveActorContext = {
  actor_type:
    | "EMPLOYEE"
    | "CUSTOMER"
    | "SYSTEM"
    | "UNRESOLVED";
  actor_id: string | null;
  attribution_source:
    | "PERSONAL_SESSION"
    | "DEVICE_ACTOR_SESSION"
    | "SYSTEM_PROCESS"
    | "DOMAIN_IDENTITY"
    | "NONE";
  delegation_id: string | null;
  resolved: boolean;
};

export type DomainIdentityContext = {
  identity_type: "EMPLOYEE" | "CUSTOMER" | "DEVICE" | "SYSTEM";
  identity_id: string;
  status: "ACTIVE" | "INACTIVE" | "INVALID";
  source: string;
};

export type EmployeeContext = {
  employee_id: string;
  auth_user_id: string | null;
  is_active: boolean;
  employment_status: string;
  base_role_code: BaseRoleCode | null;
};

export type BaseRoleContext = {
  role_code: BaseRoleCode;
  role_status: "ACTIVE" | "INACTIVE" | "INVALID";
  assignment_source: string;
};

export type AssignedSiteContext = {
  site_id: string;
  site_code: string;
  is_primary: boolean;
  assignment_active: boolean;
  site_active: boolean;
  assignable: boolean;
};

export type AssignedAreaContext = {
  area_id: string;
  site_id: string;
  area_kind: string;
  is_primary_for_site: boolean;
  assignment_active: boolean;
  area_active: boolean;
};

export type AdministrativeCoverageContext = {
  mode:
    | "NONE"
    | "ASSIGNED_SITES"
    | "SPECIFIC_SITE"
    | "ASSIGNED_AREAS"
    | "SPECIFIC_AREA"
    | "ORGANIZATION";
  site_ids: string[];
  area_ids: string[];
  source: string;
  valid: boolean;
};

export type ActiveShiftContext = {
  shift_id: string;
  employee_id: string;
  site_id: string;
  area_id: string | null;
  operational_role_code: OperationalRoleCode;
  starts_at: string;
  ends_at: string;
  shift_status: string;
  published: boolean;
  currently_valid: boolean;
};

export type ActiveCheckinContext = {
  checkin_session_id: string;
  employee_id: string;
  shift_id: string;
  site_id: string;
  area_id: string | null;
  checked_in_at: string;
  expires_at: string | null;
  checked_out_at: string | null;
  status: "ACTIVE" | "EXPIRED" | "CLOSED" | "INVALID";
};

export type OperationalRoleContext = {
  role_code: OperationalRoleCode;
  shift_id: string;
  site_id: string;
  area_id: string | null;
  valid_for_site: boolean;
  valid_for_area: boolean;
};

export type OperationalSiteContext = {
  site_id: string;
  source_shift_id: string;
  site_active: boolean;
  assignment_valid: boolean;
};

export type OperationalAreaContext = {
  area_id: string;
  site_id: string;
  area_kind: string;
  source: "SHIFT" | "CHECKIN_CONFIRMED_SHIFT";
  area_active: boolean;
  compatible_with_role: boolean;
};

export type DeviceContext = {
  device_id: string;
  device_code: string;
  device_type: string;
  device_status: "ACTIVE" | "INACTIVE" | "INVALID";
  authenticated_as_device: boolean;
  actor_session_id: string | null;
  actor_session_expires_at: string | null;
  allowed_application_codes: AppCode[];
  capability_package_code: string | null;
};

export type LaneReadiness = {
  status: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
  reason_codes: LaneReasonCode[];
};

export type StructuralIssue = {
  issue_code: StructuralIssueCode;
  severity: StructuralIssueSeverity;
  subject_type: StructuralIssueSubjectType;
  subject_id: string | null;
  source: StructuralIssueSource;
  safe_message: string;
};

export type ResolutionMetadata = {
  resolver: string;
  resolver_version: string;
  authorization_contract_version: string;
  catalog_version: string;
  source_versions: Record<string, string>;
  source_fingerprints: Record<string, string>;
  cache_status: "MISS" | "HIT" | "BYPASS" | "NOT_IMPLEMENTED";
};

export type AccessContextV1 = ContractMetadata & {
  contract_name: "AccessContext";
  contract_version: "1.0.0";
  schema_version: "1.0.0";

  context_id: string;
  resolved_at: string;

  principal: PrincipalContext;
  actor_effective: EffectiveActorContext;
  domain_identity: DomainIdentityContext | null;
  employee: EmployeeContext | null;

  base_role: BaseRoleContext | null;
  assigned_sites: AssignedSiteContext[];
  assigned_areas: AssignedAreaContext[];
  administrative_coverage: AdministrativeCoverageContext;

  active_shift: ActiveShiftContext | null;
  active_checkin_session: ActiveCheckinContext | null;
  operational_role: OperationalRoleContext | null;
  operational_site: OperationalSiteContext | null;
  operational_area: OperationalAreaContext | null;

  device_context: DeviceContext | null;

  lane_readiness: {
    base: LaneReadiness;
    operational: LaneReadiness;
  };

  structural_issues: StructuralIssue[];
  resolution_metadata: ResolutionMetadata;
};
`;
}

function renderSimulationContext() {
  return `${renderHeader('AUTH-CTX-002 + corrected AUTH-CTX-003 + AUTH-CTX-004 + SHELL-CON-007')}import type { ContractMetadata } from "./contract-metadata.types.js";

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
`;
}

function renderIndex() {
  return `${renderHeader('SHELL-CON-007 generated response-contract surface')}export type {
  ResponseContractName,
  ContractMetadata,
} from "./contract-metadata.types.js";

export type {
  PrincipalContext,
  EffectiveActorContext,
  DomainIdentityContext,
  EmployeeContext,
  BaseRoleContext,
  AssignedSiteContext,
  AssignedAreaContext,
  AdministrativeCoverageContext,
  ActiveShiftContext,
  ActiveCheckinContext,
  OperationalRoleContext,
  OperationalSiteContext,
  OperationalAreaContext,
  DeviceContext,
  LaneReadiness,
  StructuralIssue,
  ResolutionMetadata,
  AccessContextV1,
} from "./access-context.types.js";

export type {
  AccessContextReference,
  SimulationStatus,
  SimulationPurpose,
  RealSimulationActor,
  SimulationAuthorization,
  SimulatedSubjectType,
  SimulatedSubject,
  HypotheticalValue,
  SimulationIssue,
  HypotheticalAccessContext,
  SimulationResourceScenario,
  SimulatedLaneResult,
  SimulationMatch,
  SimulatedAuthorizationDecisionV1,
  SimulationResultReference,
  SimulationAuditContext,
  SimulationContextV1,
} from "./simulation-context.types.js";
`;
}

function assertOrWrite(filePath, expected, checkOnly) {
  const current = fs.existsSync(filePath) ? fs.readFileSync(filePath, 'utf8') : null;

  if (checkOnly) {
    if (current !== expected) {
      fail(`Generated artifact is stale: ${path.relative(process.cwd(), filePath)}`);
    }
    return 'FRESH';
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  if (current !== expected) fs.writeFileSync(filePath, expected, 'utf8');
  return current === expected ? 'FRESH' : 'UPDATED';
}

export function generateResponseContracts({ checkOnly = false } = {}) {
  validateCanonicalSources();

  return {
    metadata: assertOrWrite(metadataPath, renderMetadata(), checkOnly),
    access_context: assertOrWrite(accessContextPath, renderAccessContext(), checkOnly),
    simulation_context: assertOrWrite(simulationContextPath, renderSimulationContext(), checkOnly),
    index: assertOrWrite(indexPath, renderIndex(), checkOnly),
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);

    const checkOnly = process.argv.includes('--check');
    const result = generateResponseContracts({ checkOnly });

    console.log(`[VENTO CONTRACTS] RESPONSE_CONTRACTS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`);
    console.log(`[VENTO CONTRACTS] CONTRACT_FAMILY ${contractFamily}@${contractFamilyVersion}`);
    console.log(`[VENTO CONTRACTS] RELEASE_HASH ${releaseHash}`);
    console.log(`[VENTO CONTRACTS] METADATA ${result.metadata}`);
    console.log(`[VENTO CONTRACTS] ACCESS_CONTEXT ${result.access_context}`);
    console.log(`[VENTO CONTRACTS] SIMULATION_CONTEXT ${result.simulation_context}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.index}`);
  } catch (error) {
    console.error('[VENTO CONTRACTS] RESPONSE_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}