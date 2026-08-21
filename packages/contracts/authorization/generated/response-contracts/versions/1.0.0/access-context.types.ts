// GENERATED FILE. DO NOT EDIT.
// Canonical source: AUTH-CTX-001 + AUTH-MOD-021 + SHELL-CON-007
// Source contract SHA256: 63450829623c0d1fcc490b7417d70f71b61a2c160b029437412bc01b82de40f8
// Contract family: vento.authorization.response-contracts@1.0.0
// Release hash: sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd

import type { AppCode } from "../../../versions/1.0.0/catalog.types.js";
import type { BaseRoleCode } from "../../../base-roles/versions/1.1.0/base-role.types.js";
import type { OperationalRoleCode } from "../../../operational-roles/versions/1.0.0/operational-role.types.js";
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
  reason_codes: string[];
};

export type StructuralIssue = {
  issue_code: string;
  severity:
    | "BLOCKING_ALL"
    | "BLOCKING_BASE"
    | "BLOCKING_OPERATIONAL"
    | "WARNING"
    | "INFO";
  subject_type: string;
  subject_id: string | null;
  source: string;
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
