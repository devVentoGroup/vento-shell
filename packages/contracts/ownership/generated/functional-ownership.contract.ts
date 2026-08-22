// GENERATED FILE. DO NOT EDIT.
// Contract task: SHELL-CON-016
// Process authority: PROC-CAT-005 / PROC-APPLICATION-OWNERSHIP-REGISTRY-001
// Capability source authority: CAP-MAP-008
// Competing ownership evidence: CAP-MAP-013
// Source contract SHA256: 2c25fe22efaae43ace4f90d029d320bc60265760b6217378fa71b48f72e965b3

import type {
  AppCode,
} from "../../authorization/generated/versions/1.0.0/catalog.types.js";
import type {
  ProcessId,
} from "../../processes/generated/process-id.contract.js";

export const FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION =
  "sha256:2c25fe22efaae43ace4f90d029d320bc60265760b6217378fa71b48f72e965b3" as const;

export const FUNCTIONAL_OWNERSHIP_SOURCE_STATUSES = [
  "OBJETIVO_FUERTE",
  "OBJETIVO_CON_FRONTERA",
  "OBJETIVO_DIVIDIDO",
  "OBJETIVO_DIFERIDO",
  "SIN_FUENTE_ADECUADA",
] as const;

export type FunctionalOwnershipSourceStatus =
  (typeof FUNCTIONAL_OWNERSHIP_SOURCE_STATUSES)[number];

export const FUNCTIONAL_OWNERSHIP_REPRESENTATION_CLASSES = [
  "REFERENCE",
  "PROJECTION",
  "CONTROLLED_CACHE",
  "DERIVED_RESULT",
  "EVIDENCE_COPY",
] as const;

export type FunctionalOwnershipRepresentationClass =
  (typeof FUNCTIONAL_OWNERSHIP_REPRESENTATION_CLASSES)[number];

export const FUNCTIONAL_OWNERSHIP_CONCEPTUAL_DIMENSIONS = [
  "subject_kind",
  "subject_ref",
  "owner_app_code",
  "authority_ref",
  "ownership_scope",
  "source_status",
  "boundary_ref",
  "effective_version",
  "supersedes_ref",
] as const;

export type FunctionalOwnershipConceptualDimension =
  (typeof FUNCTIONAL_OWNERSHIP_CONCEPTUAL_DIMENSIONS)[number];

export interface ProcessOwnershipProjection {
  readonly process_id: ProcessId;
  readonly owner_app_code: AppCode;
  readonly authority_ref: "PROC-CAT-005";
  readonly ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO";
  readonly effective_version: typeof FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION;
  readonly compatibility_status: "RECONCILED";
}

export const PROCESS_OWNERSHIP_PROJECTIONS = [
  {
    process_id: "VPROC-0001",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0002",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0003",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0004",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0005",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0006",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0007",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0008",
    owner_app_code: "anima",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0009",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0010",
    owner_app_code: "numera",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0011",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0012",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0013",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0014",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0015",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0016",
    owner_app_code: "fogo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0017",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0018",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0019",
    owner_app_code: "origo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0020",
    owner_app_code: "origo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0021",
    owner_app_code: "origo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0022",
    owner_app_code: "origo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0023",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0024",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0025",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0026",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0027",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0028",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0029",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0030",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0031",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0032",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0033",
    owner_app_code: "fogo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0034",
    owner_app_code: "fogo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0035",
    owner_app_code: "fogo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0036",
    owner_app_code: "fogo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0037",
    owner_app_code: "fogo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0038",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0039",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0040",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0041",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0042",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0043",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0044",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0045",
    owner_app_code: "pass",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0046",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0047",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0048",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0049",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0050",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0051",
    owner_app_code: "numera",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0052",
    owner_app_code: "numera",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0053",
    owner_app_code: "numera",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0054",
    owner_app_code: "numera",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0055",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0056",
    owner_app_code: "aura",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0057",
    owner_app_code: "aura",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0058",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0059",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0060",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0061",
    owner_app_code: "numera",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0062",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0063",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0064",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0065",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0066",
    owner_app_code: "viso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0067",
    owner_app_code: "nexo",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0068",
    owner_app_code: "pulso",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
  {
    process_id: "VPROC-0069",
    owner_app_code: "numera",
    authority_ref: "PROC-CAT-005",
    ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
    compatibility_status: "RECONCILED",
  },
] as const satisfies readonly ProcessOwnershipProjection[];

export type ProcessOwnershipProjectionDefinition =
  (typeof PROCESS_OWNERSHIP_PROJECTIONS)[number];

export const PROCESS_OWNER_DISTRIBUTION = {
  shell: 0,
  anima: 1,
  viso: 20,
  nexo: 16,
  fogo: 6,
  origo: 4,
  pulso: 12,
  numera: 7,
  aura: 2,
  pass: 1,
} as const satisfies Readonly<Record<AppCode, number>>;

export interface CapabilitySourceFamilyProjection {
  readonly family_ref: string;
  readonly source_target: string;
  readonly source_status: FunctionalOwnershipSourceStatus;
  readonly boundary_ref: string;
  readonly authority_ref: "CAP-MAP-008";
  readonly projection_granularity: "FAMILY_BASE";
  readonly effective_version: typeof FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION;
}

export const CAPABILITY_SOURCE_FAMILY_PROJECTIONS = [
  {
    family_ref: "CAP-01",
    source_target: "VISO para estructura, políticas, riesgos, decisiones y seguimiento administrativo",
    source_status: "OBJETIVO_CON_FRONTERA",
    boundary_ref: "la decisión continúa siendo humana y los documentos legales conservan su validez propia",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-02",
    source_target: "VISO para administración laboral; ANIMA para registros personales y asistencia",
    source_status: "OBJETIVO_DIVIDIDO",
    boundary_ref: "nómina, banco y documentos externos no se convierten automáticamente en datos propios de NUMERA",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-03",
    source_target: "VISO",
    source_status: "OBJETIVO_CON_FRONTERA",
    boundary_ref: "autoridades, aseguradoras y proveedores conservan sus documentos oficiales",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-04",
    source_target: "NEXO para catálogo; FOGO para recetas; PULSO para oferta vendible",
    source_status: "OBJETIVO_DIVIDIDO",
    boundary_ref: "cada aplicación gobierna un resultado distinto y comparte referencias, no copias maestras",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-05",
    source_target: "ORIGO",
    source_status: "OBJETIVO_FUERTE",
    boundary_ref: "NEXO recibe únicamente el efecto de inventario de la recepción aceptada",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-06",
    source_target: "NEXO",
    source_status: "OBJETIVO_FUERTE",
    boundary_ref: "compras, producción y ventas originan hechos; NEXO gobierna su efecto en existencias",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-07",
    source_target: "NEXO",
    source_status: "OBJETIVO_CON_FRONTERA",
    boundary_ref: "la ejecución técnica externa se relaciona con el activo sin reemplazar su registro",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-08",
    source_target: "FOGO",
    source_status: "OBJETIVO_FUERTE",
    boundary_ref: "NEXO conserva movimientos de insumo y producto aceptados, no la orden productiva",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-09",
    source_target: "PULSO",
    source_status: "OBJETIVO_FUERTE",
    boundary_ref: "Makos y plataformas externas serán orígenes externos mientras sigan vigentes",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-10",
    source_target: "PULSO para relación operativa; PASS para identidad y acciones directas del cliente",
    source_status: "OBJETIVO_DIVIDIDO",
    boundary_ref: "no se copiará información personal innecesaria entre ambas aplicaciones",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-11",
    source_target: "NEXO para traslado interno; PULSO para entrega asociada a un pedido",
    source_status: "OBJETIVO_DIVIDIDO",
    boundary_ref: "la mensajería externa aporta eventos sin gobernar el pedido interno",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-12",
    source_target: "PULSO para caja y pago de venta; NUMERA para hechos económicos, costos y análisis",
    source_status: "OBJETIVO_DIVIDIDO",
    boundary_ref: "bancos, sistema contable y autoridades conservan los registros externos que les correspondan",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-13",
    source_target: "NEXO para espacio, activo, novedad y estado",
    source_status: "OBJETIVO_CON_FRONTERA",
    boundary_ref: "el proveedor técnico puede ejecutar el trabajo, pero no gobernar el estado interno",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-14",
    source_target: "AURA para comunicación y campaña; PULSO para promociones aplicadas a ventas",
    source_status: "OBJETIVO_DIFERIDO",
    boundary_ref: "AURA es solo una idea y no se implementa por esta definición",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-15",
    source_target: "VISO para identidad y acceso; NEXO para activo; cada aplicación para su configuración",
    source_status: "OBJETIVO_DIVIDIDO",
    boundary_ref: "el soporte transversal continúa SIN_FUENTE_ADECUADA hasta definir su propietaria",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-16",
    source_target: "aplicación propietaria del hecho respaldado",
    source_status: "OBJETIVO_DIVIDIDO",
    boundary_ref: "el archivo documental conserva versiones y evidencia sin apropiarse del hecho",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-17",
    source_target: "aplicación de origen para hechos; NUMERA para indicadores, comparaciones y análisis derivados",
    source_status: "OBJETIVO_CON_FRONTERA",
    boundary_ref: "NUMERA no permitirá corregir hechos gobernados por otra aplicación",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
  {
    family_ref: "CAP-18",
    source_target: "aplicación afectada para el incidente local; registro transversal todavía sin fuente adecuada",
    source_status: "OBJETIVO_DIVIDIDO",
    boundary_ref: "SHELL coordina acceso y navegación, no se vuelve propietaria de todos los incidentes",
    authority_ref: "CAP-MAP-008",
    projection_granularity: "FAMILY_BASE",
    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  },
] as const satisfies readonly CapabilitySourceFamilyProjection[];

export type CapabilitySourceFamilyProjectionDefinition =
  (typeof CAPABILITY_SOURCE_FAMILY_PROJECTIONS)[number];

export const COMPETING_FUNCTIONAL_OWNERSHIP_CASES = [
  {
    subject_ref: "public.employee_shifts",
    current_competing_app_codes: ["viso", "anima"],
    target_owner_app_code: "viso",
    target_consumer_app_code: "anima",
    authority_ref: "CAP-MAP-013",
    materialization_status: "PREEXISTING_DEBT_NOT_REMEDIATED",
  },
] as const satisfies readonly Readonly<{
  subject_ref: string;
  current_competing_app_codes: readonly AppCode[];
  target_owner_app_code: AppCode;
  target_consumer_app_code: AppCode;
  authority_ref: "CAP-MAP-013";
  materialization_status: "PREEXISTING_DEBT_NOT_REMEDIATED";
}>[];

export type CompetingFunctionalOwnershipCase =
  (typeof COMPETING_FUNCTIONAL_OWNERSHIP_CASES)[number];

export const FUNCTIONAL_OWNERSHIP_REGISTRY_METADATA = {
  logical_namespace: "@vento/contracts/ownership",
  process_assignment_count: 69,
  app_code_universe_count: 10,
  assigned_process_owner_app_code_count: 9,
  subcapacity_decision_count: 217,
  capability_family_projection_count: 18,
  source_status_count: 5,
  representation_class_count: 5,
  competing_ownership_case_count: 1,
  capability_projection_model: "FAMILY_PLUS_EXCEPTION",
  flat_subcapacity_registry_materialized: false,
  ownership_id_defined: false,
  semantic_process_authority: "PROC-CAT-005",
  semantic_capability_authority: "CAP-MAP-008",
  competing_ownership_authority: "CAP-MAP-013",
  contract_task_id: "SHELL-CON-016",
} as const;

export type FunctionalOwnershipRegistryMetadata =
  typeof FUNCTIONAL_OWNERSHIP_REGISTRY_METADATA;

const PROCESS_OWNERSHIP_BY_ID =
  new Map<ProcessId, ProcessOwnershipProjectionDefinition>(
    PROCESS_OWNERSHIP_PROJECTIONS.map((projection) => [
      projection.process_id,
      projection,
    ] as const),
  );

const CAPABILITY_SOURCE_FAMILY_BY_ID =
  new Map<string, CapabilitySourceFamilyProjectionDefinition>(
    CAPABILITY_SOURCE_FAMILY_PROJECTIONS.map((projection) => [
      projection.family_ref,
      projection,
    ] as const),
  );

export function resolveProcessOwner(
  processId: ProcessId,
): ProcessOwnershipProjectionDefinition | undefined {
  return PROCESS_OWNERSHIP_BY_ID.get(processId);
}

export type CapabilitySourceResolution =
  | Readonly<{
      resolution_status: "FAMILY_BASE";
      projection: CapabilitySourceFamilyProjectionDefinition;
    }>
  | Readonly<{
      resolution_status: "CANONICAL_DETAIL_REQUIRED";
      family_ref: string;
      authority_ref: "CAP-MAP-008";
    }>
  | Readonly<{
      resolution_status: "UNRESOLVED";
      authority_ref: "CAP-MAP-008";
    }>;

export function resolveCapabilitySource(
  capabilityRef: string,
): CapabilitySourceResolution {
  const normalized = String(capabilityRef ?? "").trim();
  const familyMatch = /^(CAP-[0-9]{2})(?:\.|$)/.exec(normalized);

  if (!familyMatch) {
    return {
      resolution_status: "UNRESOLVED",
      authority_ref: "CAP-MAP-008",
    };
  }

  const familyRef = familyMatch[1];
  const projection = CAPABILITY_SOURCE_FAMILY_BY_ID.get(familyRef);

  if (!projection) {
    return {
      resolution_status: "UNRESOLVED",
      authority_ref: "CAP-MAP-008",
    };
  }

  if (normalized === familyRef) {
    return {
      resolution_status: "FAMILY_BASE",
      projection,
    };
  }

  return {
    resolution_status: "CANONICAL_DETAIL_REQUIRED",
    family_ref: familyRef,
    authority_ref: "CAP-MAP-008",
  };
}

export function isCanonicalOwner(
  appCode: AppCode,
  subjectRef: string,
): boolean | null {
  const normalized = String(subjectRef ?? "").trim();
  const processProjection = PROCESS_OWNERSHIP_BY_ID.get(
    normalized as ProcessId,
  );

  if (processProjection) {
    return processProjection.owner_app_code === appCode;
  }

  return null;
}

export function assertOwnershipProjectionFresh(
  subjectRef: string,
  effectiveVersion: string,
): true {
  const normalizedSubjectRef = String(subjectRef ?? "").trim();

  if (!normalizedSubjectRef) {
    throw new Error("Ownership subject_ref is required.");
  }

  if (effectiveVersion !== FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION) {
    throw new Error("Ownership projection is stale.");
  }

  return true;
}
