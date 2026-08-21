// GENERATED FILE. DO NOT EDIT.
// Semantic owner: UX-BASE-002
// Contract task: SHELL-CON-015
// Foundation task: SHELL-CON-001
// Source contract SHA256: 79b15488e1366e8848fafbdda0fe9e267fef3db0542a490ba3a07eb6c68812c4

import type {
  AppCode,
} from "../../authorization/generated/versions/1.0.0/catalog.types.js";
import type {
  ProcessId,
} from "../../processes/generated/process-id.contract.js";
import type {
  ProcessStateId,
} from "../../processes/generated/states/process-state.contract.js";
import type {
  FunctionalActionId,
} from "../../actions/generated/functional-action.contract.js";
import type {
  BusinessEventId,
} from "../../events/generated/business-event.contract.js";
import type {
  ApplicationHandoffRelation,
} from "../../handoffs/generated/application-handoff-relation.contract.js";

export const WORK_ITEM_FIELD_NAMES = [
  "work_item_id",
  "process_id",
  "process_instance_id",
  "process_step",
  "owner_app_code",
  "source_ref",
  "work_item_type",
  "work_lane",
  "status",
  "readiness_status",
  "assignment_mode",
  "assigned_actor_ref",
  "eligible_actor_set_ref",
  "queue_ref",
  "required_context_ref",
  "required_permission_ref",
  "resource_ref",
  "location_ref",
  "available_at",
  "due_at",
  "priority_class",
  "priority_policy_version",
  "blocking_refs",
  "next_action_code",
  "work_item_version",
  "claim_or_lease_ref",
  "idempotency_scope",
  "created_at",
  "updated_at",
] as const;

export type WorkItemFieldName =
  (typeof WORK_ITEM_FIELD_NAMES)[number];

export const WORK_ITEM_TYPES = [
  "EXECUTE_STEP",
  "VERIFY_STEP",
  "HANDOFF_ACCEPTANCE",
  "PERSONAL_OBLIGATION",
  "SUPERVISORY_RESPONSE",
  "SAFETY_RESPONSE",
  "FOLLOW_UP",
  "RECOVERY",
] as const;

export type WorkItemType =
  (typeof WORK_ITEM_TYPES)[number];

export const WORK_ITEM_STATUSES = [
  "NOT_READY",
  "AVAILABLE",
  "OFFERED",
  "ASSIGNED",
  "CLAIMED",
  "IN_PROGRESS",
  "WAITING",
  "BLOCKED",
  "PAUSED",
  "COMPLETION_PENDING_SYNC",
  "COMPLETED",
  "CANCELLED",
  "SUPERSEDED",
  "EXPIRED",
  "CONFLICT",
  "RECONCILIATION_REQUIRED",
] as const;

export type WorkItemStatus =
  (typeof WORK_ITEM_STATUSES)[number];

export const WORK_ITEM_READINESS_STATUSES = [
  "EXECUTABLE_NOW",
  "VISIBLE_NOT_EXECUTABLE",
  "WAITING_EXTERNAL",
  "BLOCKED_RECOVERABLE",
  "BLOCKED_REQUIRES_OTHER_ACTOR",
  "STALE_REQUIRES_REFRESH",
  "NOT_ELIGIBLE",
] as const;

export type WorkItemReadinessStatus =
  (typeof WORK_ITEM_READINESS_STATUSES)[number];

export const WORK_ITEM_PRIORITY_LEVELS = [
  {
    level: 0,
    canonical_label: "Seguridad, emergencia o custodia crítica.",
  },
  {
    level: 1,
    canonical_label: "Trabajo ya en ejecución que debe continuar.",
  },
  {
    level: 2,
    canonical_label: "Compromiso inmediato con cliente, producción, entrega o cadena.",
  },
  {
    level: 3,
    canonical_label: "Tarea asignada con vencimiento o bloqueo de terceros.",
  },
  {
    level: 4,
    canonical_label: "Tarea disponible priorizada por política.",
  },
  {
    level: 5,
    canonical_label: "Mantenimiento, seguimiento o trabajo sin urgencia.",
  },
] as const;

export type WorkItemPriorityLevel =
  (typeof WORK_ITEM_PRIORITY_LEVELS)[number]["level"];

export const WORK_ITEM_IDENTITY_SEPARATIONS = [
  "ProcessId",
  "process_instance_id",
  "ProcessStateId",
  "FunctionalActionId",
  "BusinessEventId",
  "PermissionId",
  "ScreenId",
  "navigation_id",
  "claim_or_lease_ref",
  "handoff_relation",
  "alert_or_notification_id",
] as const;

export type WorkItemSeparatedIdentity =
  (typeof WORK_ITEM_IDENTITY_SEPARATIONS)[number];

export const WORK_ITEM_IDENTITY_POLICY = {
  identity_name: "work_item_id",
  semantics: "OPAQUE_RUNTIME_REFERENCE",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  infer_authority_from_value: false,
} as const;

export const WORK_ITEM_AUTHORITY_BINDINGS = {
  owner_app_code: "AppCode",
  process_id: "ProcessId",
  process_step_when_state_identity_applies: "ProcessStateId",
  next_action_code_when_catalogued: "FunctionalActionId",
  correlated_business_event_when_applicable: "BusinessEventId",
  cross_app_handoff_when_applicable: "ApplicationHandoffRelation",
} as const;

export type WorkItemOwnerAppCode = AppCode;
export type WorkItemProcessId = ProcessId;
export type WorkItemProcessStateReference = ProcessStateId;
export type WorkItemNextActionReference = FunctionalActionId;
export type WorkItemBusinessEventReference = BusinessEventId;
export type WorkItemHandoffRelationReference =
  ApplicationHandoffRelation;

export const WORK_ITEM_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/work-items",
  field_count: 29,
  type_count: 8,
  status_count: 16,
  readiness_status_count: 7,
  priority_level_count: 6,
  identity_serialization_defined: false,
  runtime_instance_registry: false,
  semantic_owner_task_id: "UX-BASE-002",
  contract_task_id: "SHELL-CON-015",
  handoff_authority_task_id: "SHELL-CON-014",
  action_authority_task_id: "SHELL-CON-012",
  event_authority_task_id: "SHELL-CON-013",
} as const;

export type WorkItemContractMetadata =
  typeof WORK_ITEM_CONTRACT_METADATA;

const WORK_ITEM_FIELD_NAME_SET =
  new Set<string>(WORK_ITEM_FIELD_NAMES);
const WORK_ITEM_TYPE_SET =
  new Set<string>(WORK_ITEM_TYPES);
const WORK_ITEM_STATUS_SET =
  new Set<string>(WORK_ITEM_STATUSES);
const WORK_ITEM_READINESS_STATUS_SET =
  new Set<string>(WORK_ITEM_READINESS_STATUSES);

export function isWorkItemFieldName(
  value: unknown,
): value is WorkItemFieldName {
  return (
    typeof value === "string"
    && WORK_ITEM_FIELD_NAME_SET.has(value)
  );
}

export function isWorkItemType(
  value: unknown,
): value is WorkItemType {
  return (
    typeof value === "string"
    && WORK_ITEM_TYPE_SET.has(value)
  );
}

export function isWorkItemStatus(
  value: unknown,
): value is WorkItemStatus {
  return (
    typeof value === "string"
    && WORK_ITEM_STATUS_SET.has(value)
  );
}

export function isWorkItemReadinessStatus(
  value: unknown,
): value is WorkItemReadinessStatus {
  return (
    typeof value === "string"
    && WORK_ITEM_READINESS_STATUS_SET.has(value)
  );
}
