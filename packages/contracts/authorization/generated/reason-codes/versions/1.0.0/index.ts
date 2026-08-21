// GENERATED FILE. DO NOT EDIT.
// Canonical sources: AUTH-ERR-020 + AUTH-CTX-015 + SHELL-CON-008
// Source contract SHA256: ef042d037827ce14470e1cffa7ba3c76bf88318a21a65644cd465efdc65b5122
// Response contract family: vento.authorization.response-contracts@1.0.0
// Response release hash: sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd
// Message catalog: vento.authorization.messages@1.0.0
// Message schema version: 1.0.0
// Source locale: es-CO

export type {
  AuthorizationReasonCode,
  StructuralIssueCode,
  LaneAvailabilityReasonCode,
  LaneReasonCode,
  StructuralIssueSeverity,
  StructuralIssueSubjectType,
  StructuralIssueSource,
  StructuralIssueDefinition,
  StructuralIssueByCode,
} from "./reason-code.types.js";

export {
  AUTHORIZATION_REASON_CODES,
  STRUCTURAL_ISSUE_CODES,
  LANE_AVAILABILITY_REASON_CODES,
  LANE_REASON_CODES,
  STRUCTURAL_ISSUE_SEVERITIES,
  STRUCTURAL_ISSUE_SUBJECT_TYPES,
  STRUCTURAL_ISSUE_SOURCES,
  STRUCTURAL_ISSUE_CATALOG,
  STRUCTURAL_ISSUE_BY_CODE,
  isAuthorizationReasonCode,
  isStructuralIssueCode,
  isLaneAvailabilityReasonCode,
  isLaneReasonCode,
} from "./reason-code.values.js";
