// GENERATED FILE. DO NOT EDIT.
// Canonical relation source: PROC-CAT-006
// Contract task: SHELL-CON-014
// Integration sources: INT-APP-003, INT-APP-004, INT-APP-010
// Source contract SHA256: 5cb5fba2d7a08733387c335cc23fcd245d96befbb2852b1809d358047846f62d

import type {
  AppCode,
} from "../../authorization/generated/versions/1.0.0/catalog.types.js";
import type {
  ProcessId,
} from "../../processes/generated/process-id.contract.js";

export const HANDOFF_PARTICIPATION_CLASSES = [
  "DIRECTA",
  "CONDICIONAL",
] as const;

export type HandoffParticipationClass =
  (typeof HANDOFF_PARTICIPATION_CLASSES)[number];

export const HANDOFF_CONSUMER_MODE =
  "SOLICITUD_HANDOFF_Y_EVENTO" as const;

export const HANDOFF_INTEGRATION_PROFILE =
  "HANDOFF_PROJECTION" as const;

export const HANDOFF_EXCHANGE_FAMILY =
  "HANDOFF_REQUEST" as const;

export interface ApplicationHandoffRelation {
  readonly process_id: ProcessId;
  readonly owner_application: AppCode;
  readonly participant_application: AppCode;
  readonly participation_class: HandoffParticipationClass;
  readonly consumer_mode: typeof HANDOFF_CONSUMER_MODE;
  readonly integration_profile: typeof HANDOFF_INTEGRATION_PROFILE;
  readonly exchange_family: typeof HANDOFF_EXCHANGE_FAMILY;
}

export const APPLICATION_HANDOFF_PROCESS_IDS = [
  "VPROC-0005",
  "VPROC-0006",
  "VPROC-0007",
  "VPROC-0009",
  "VPROC-0011",
  "VPROC-0059",
  "VPROC-0065",
  "VPROC-0066",
] as const satisfies readonly ProcessId[];

export type ApplicationHandoffProcessId =
  (typeof APPLICATION_HANDOFF_PROCESS_IDS)[number];

export const APPLICATION_HANDOFF_PARTICIPANT_CODES = [
  "shell",
  "anima",
  "nexo",
  "fogo",
  "origo",
  "pulso",
  "numera",
  "aura",
  "pass",
] as const satisfies readonly AppCode[];

export type ApplicationHandoffParticipantCode =
  (typeof APPLICATION_HANDOFF_PARTICIPANT_CODES)[number];

export const APPLICATION_HANDOFF_RELATIONS = [
  {
    process_id: "VPROC-0005",
    owner_application: "viso",
    participant_application: "anima",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0005",
    owner_application: "viso",
    participant_application: "numera",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0006",
    owner_application: "viso",
    participant_application: "anima",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0006",
    owner_application: "viso",
    participant_application: "shell",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0006",
    owner_application: "viso",
    participant_application: "nexo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0006",
    owner_application: "viso",
    participant_application: "fogo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0006",
    owner_application: "viso",
    participant_application: "origo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0006",
    owner_application: "viso",
    participant_application: "pulso",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0006",
    owner_application: "viso",
    participant_application: "numera",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0006",
    owner_application: "viso",
    participant_application: "aura",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0007",
    owner_application: "viso",
    participant_application: "anima",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0007",
    owner_application: "viso",
    participant_application: "shell",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0007",
    owner_application: "viso",
    participant_application: "nexo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0007",
    owner_application: "viso",
    participant_application: "fogo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0007",
    owner_application: "viso",
    participant_application: "origo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0007",
    owner_application: "viso",
    participant_application: "pulso",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0007",
    owner_application: "viso",
    participant_application: "numera",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0009",
    owner_application: "viso",
    participant_application: "anima",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0009",
    owner_application: "viso",
    participant_application: "shell",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0009",
    owner_application: "viso",
    participant_application: "nexo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0009",
    owner_application: "viso",
    participant_application: "fogo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0009",
    owner_application: "viso",
    participant_application: "origo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0009",
    owner_application: "viso",
    participant_application: "pulso",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0009",
    owner_application: "viso",
    participant_application: "numera",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0011",
    owner_application: "viso",
    participant_application: "shell",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0011",
    owner_application: "viso",
    participant_application: "anima",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0011",
    owner_application: "viso",
    participant_application: "nexo",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0011",
    owner_application: "viso",
    participant_application: "fogo",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0011",
    owner_application: "viso",
    participant_application: "origo",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0011",
    owner_application: "viso",
    participant_application: "pulso",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0011",
    owner_application: "viso",
    participant_application: "numera",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0011",
    owner_application: "viso",
    participant_application: "aura",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0059",
    owner_application: "viso",
    participant_application: "shell",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0059",
    owner_application: "viso",
    participant_application: "anima",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0059",
    owner_application: "viso",
    participant_application: "nexo",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0059",
    owner_application: "viso",
    participant_application: "fogo",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0059",
    owner_application: "viso",
    participant_application: "origo",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0059",
    owner_application: "viso",
    participant_application: "pulso",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0059",
    owner_application: "viso",
    participant_application: "numera",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0059",
    owner_application: "viso",
    participant_application: "aura",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0059",
    owner_application: "viso",
    participant_application: "pass",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0065",
    owner_application: "viso",
    participant_application: "anima",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0065",
    owner_application: "viso",
    participant_application: "numera",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0066",
    owner_application: "viso",
    participant_application: "anima",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0066",
    owner_application: "viso",
    participant_application: "nexo",
    participation_class: "DIRECTA",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0066",
    owner_application: "viso",
    participant_application: "fogo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0066",
    owner_application: "viso",
    participant_application: "origo",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0066",
    owner_application: "viso",
    participant_application: "pulso",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
  {
    process_id: "VPROC-0066",
    owner_application: "viso",
    participant_application: "shell",
    participation_class: "CONDICIONAL",
    consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",
    integration_profile: "HANDOFF_PROJECTION",
    exchange_family: "HANDOFF_REQUEST",
  },
] as const satisfies readonly ApplicationHandoffRelation[];

export type ApplicationHandoffRelationDefinition =
  (typeof APPLICATION_HANDOFF_RELATIONS)[number];

export const APPLICATION_HANDOFF_REGISTRY_METADATA = {
  relation_identity:
    "ProcessId + owner_application + participant_application",
  relation_count: 49,
  direct_count: 27,
  conditional_count: 22,
  process_count: 8,
  owner_application_count: 1,
  participant_application_count: 9,
  owner_application: "viso",
  consumer_mode: HANDOFF_CONSUMER_MODE,
  integration_profile: HANDOFF_INTEGRATION_PROFILE,
  exchange_family: HANDOFF_EXCHANGE_FAMILY,
  source_task_id: "PROC-CAT-006",
  contract_task_id: "SHELL-CON-014",
} as const;

export type ApplicationHandoffRegistryMetadata =
  typeof APPLICATION_HANDOFF_REGISTRY_METADATA;

function handoffRelationKey(
  processId: ProcessId,
  ownerApplication: AppCode,
  participantApplication: AppCode,
): string {
  return JSON.stringify([
    processId,
    ownerApplication,
    participantApplication,
  ]);
}

const APPLICATION_HANDOFF_RELATION_BY_KEY = new Map(
  APPLICATION_HANDOFF_RELATIONS.map((relation) => [
    handoffRelationKey(
      relation.process_id,
      relation.owner_application,
      relation.participant_application,
    ),
    relation,
  ]),
);

export function isApplicationHandoffRelation(
  processId: ProcessId,
  ownerApplication: AppCode,
  participantApplication: AppCode,
): boolean {
  return APPLICATION_HANDOFF_RELATION_BY_KEY.has(
    handoffRelationKey(
      processId,
      ownerApplication,
      participantApplication,
    ),
  );
}

export function getApplicationHandoffRelation(
  processId: ProcessId,
  ownerApplication: AppCode,
  participantApplication: AppCode,
): ApplicationHandoffRelationDefinition | undefined {
  return APPLICATION_HANDOFF_RELATION_BY_KEY.get(
    handoffRelationKey(
      processId,
      ownerApplication,
      participantApplication,
    ),
  );
}

export function getApplicationHandoffRelationsForProcess(
  processId: ProcessId,
): readonly ApplicationHandoffRelationDefinition[] {
  return APPLICATION_HANDOFF_RELATIONS.filter(
    (relation) => relation.process_id === processId,
  );
}
