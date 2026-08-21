// GENERATED FILE. DO NOT EDIT.
// Canonical state registries: PROC-PROCESS-INITIAL-STATE-REGISTRY-001, PROC-PROCESS-INTERMEDIATE-STATE-REGISTRY-001, PROC-PROCESS-FINAL-STATE-REGISTRY-001
// Transition reconciliation: PROC-PROCESS-TRANSITION-REGISTRY-001
// Contract task: SHELL-CON-010
// Source contract SHA256: 0c20de58e5ffdbfcaf80f469e906816f8cab4f870f1a2e067fb46cb811b6d9d4

export {
  PROCESS_STATE_ID_PATTERN_SOURCE,
  PROCESS_STATE_ID_PATTERN,
  PROCESS_STATE_KINDS,
  PROCESS_INTERMEDIATE_PHASES,
  PROCESS_FINAL_TYPES,
  PROCESS_STATE_IDS,
  PROCESS_STATE_DEFINITIONS,
  PROCESS_STATE_REGISTRY_METADATA,
  isProcessStateIdFormat,
  isProcessStateId,
  isProcessStateForProcess,
  getProcessStateDefinition,
  getProcessIdForState,
  getProcessStateCode,
} from "./process-state.contract.js";

export type {
  ProcessStateKind,
  ProcessIntermediatePhase,
  ProcessFinalType,
  ProcessStateId,
  InitialProcessStateDefinition,
  IntermediateProcessStateDefinition,
  FinalNormalProcessStateDefinition,
  ProcessStateDefinition,
  ProcessStateRegistryMetadata,
} from "./process-state.contract.js";
