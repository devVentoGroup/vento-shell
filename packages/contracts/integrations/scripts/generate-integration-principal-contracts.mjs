import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const integrationsRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(integrationsRoot, '../../..');

const shellContractSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'H_FUNDACION_COMPARTIDA',
  '01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md',
);

const integrationSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'X_INTEGRACIONES',
  '02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md',
);

const generatedDirectory = path.join(integrationsRoot, 'generated');
const principalContractPath = path.join(
  generatedDirectory,
  'integration-principal.contract.ts',
);
const credentialContractPath = path.join(
  generatedDirectory,
  'external-credential-ref.contract.ts',
);
const indexPath = path.join(generatedDirectory, 'index.ts');

const shellCon017SourceContractSha256 =
  'c4ca8bdc55f98113d235107f99355ef6a69dbb59a7f0853a6e087c8fcad14839';
const shellCon018SourceContractSha256 =
  'b22094113048ee52d8ea8abe961af7fcb8be2b1924eabe69d0eb048d928bbb69';

const expectedExternalSystemIds = Object.freeze(
  Array.from(
    { length: 21 },
    (_, index) => `EXT-SYS-${String(index + 1).padStart(3, '0')}`,
  ),
);

const expectedPrincipalSeparatedIdentities = Object.freeze([
  'PrincipalContext.session_id',
  'PrincipalContext.auth_user_id',
  'PermissionKey',
  'provider_account_ref',
  'external_credential_id',
  'secret value',
  'endpoint_ref',
  'device_id',
  'external_system_id',
  'AppCode',
  'actor humano',
]);

const expectedPrincipalConceptualDimensions = Object.freeze([
  'integration_principal_id',
  'external_system_id',
  'external_instance_id',
  'business_owner_ref',
  'technical_owner_ref',
  'finalidad técnica',
  'ambiente',
  'vigencia',
  'correlación',
]);

const expectedCredentialConceptualDimensions = Object.freeze([
  'external_credential_id',
  'external_system_id',
  'external_instance_id',
  'integration_principal_id',
  'provider_account_ref',
  'credential_surface',
  'provenance',
  'mechanism',
  'minimum_scope',
  'scope_ceiling',
  'environment',
  'material_class',
  'functional_owner_ref',
  'technical_custodian_ref',
  'lifecycle_state',
  'predecessor_successor_refs',
  'known_dates',
  'authorized_consumers',
]);

function fail(message) {
  throw new Error(message);
}

function sha256(source) {
  return crypto.createHash('sha256').update(source).digest('hex');
}

function normalizeEol(value) {
  return String(value)
    .replace(/^\uFEFF/u, '')
    .replace(/\r\n?/gu, '\n');
}

function readText(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  }

  return normalizeEol(fs.readFileSync(filePath, 'utf8'));
}

function isFence(line) {
  return /^\s*```/u.test(line);
}

function extractTaskSection(source, taskId) {
  const normalized = normalizeEol(source);
  const lines = normalized.split('\n');
  const taskHeading = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b(?:\s+[—-]\s+(?<title>[^\n]+))?$/u;
  const starts = [];
  let fenced = false;

  lines.forEach((line, index) => {
    if (isFence(line)) {
      fenced = !fenced;
      return;
    }
    if (fenced) return;

    const match = line.match(taskHeading);
    if (match) {
      starts.push({
        index,
        id: match.groups.id,
      });
    }
  });

  const taskIndex = starts.findIndex((entry) => entry.id === taskId);
  if (taskIndex < 0) {
    fail(`Canonical task ${taskId} not found.`);
  }

  const start = starts[taskIndex].index;
  const end = starts[taskIndex + 1]?.index ?? lines.length;
  return lines.slice(start, end).join('\n');
}

function extractNumberedSubsection(task, subsectionNumber) {
  const startPattern = new RegExp(
    `^#### ${subsectionNumber}\\. [^\\n]+$`,
    'mu',
  );
  const startMatch = task.match(startPattern);

  if (!startMatch || startMatch.index === undefined) {
    fail(`Subsection ${subsectionNumber} not found.`);
  }

  const start = startMatch.index;
  const tailStart = start + startMatch[0].length;
  const tail = task.slice(tailStart);
  const nextMatch = tail.match(/^#### [0-9]+\. [^\n]+$/mu);

  if (!nextMatch || nextMatch.index === undefined) {
    return task.slice(start);
  }

  return task.slice(start, tailStart + nextMatch.index);
}

function cleanCell(value) {
  return String(value)
    .trim()
    .replace(/<br\s*\/?>/giu, '\n')
    .replace(/\\\|/gu, '|')
    .replace(/&#124;/gu, '|')
    .replace(/`([^`]*)`/gu, '$1')
    .replace(/\*\*([^*]+)\*\*/gu, '$1')
    .trim();
}

function splitMarkdownRow(line) {
  const trimmed = line.trim();

  if (!trimmed.startsWith('|') || !trimmed.endsWith('|')) {
    return [];
  }

  const body = trimmed.slice(1, -1);
  const cells = [];
  let current = '';
  let escaped = false;
  let inCode = false;

  for (const character of body) {
    if (escaped) {
      current += character;
      escaped = false;
      continue;
    }

    if (character === '\\') {
      escaped = true;
      current += character;
      continue;
    }

    if (character === '`') {
      inCode = !inCode;
      current += character;
      continue;
    }

    if (character === '|' && !inCode) {
      cells.push(cleanCell(current));
      current = '';
      continue;
    }

    current += character;
  }

  cells.push(cleanCell(current));
  return cells;
}

function validateReconciliation(shellSource) {
  const requiredMarkers = [
    '<!-- EXECUTION-GATE-RECONCILIATION:B001-200:SHELL-CON-017-024 -->',
    '`GLOBAL_ENABLE_ONCE`',
    '`PRE_E5_FOUNDATION`',
    '`<task_id>::GLOBAL`',
  ];

  for (const marker of requiredMarkers) {
    if (!shellSource.includes(marker)) {
      fail(`SHELL-CON reconciliation is missing marker: ${marker}`);
    }
  }
}

function validateShellCon017(shellSource) {
  const task = extractTaskSection(shellSource, 'SHELL-CON-017');
  const actualSourceHash = sha256(task);

  if (actualSourceHash !== shellCon017SourceContractSha256) {
    fail(
      `SHELL-CON-017 source contract SHA256 mismatch: `
      + `expected ${shellCon017SourceContractSha256}, received ${actualSourceHash}.`,
    );
  }

  const requiredTaskMarkers = [
    '@vento/contracts/integrations',
    'IntegrationPrincipalId',
    'IntegrationPrincipal',
    'IntegrationPrincipalRef',
    '21 de 21',
    'PENDIENTE_DE_EVIDENCIA',
    'NO_APLICA',
    '0 valores físicos',
    'NO GENERA REQUISITOS DE PRUEBA',
    'SHELL-CON-018',
    'INT-DB-001',
  ];

  for (const marker of requiredTaskMarkers) {
    if (!task.includes(marker)) {
      fail(`SHELL-CON-017 is missing required content: ${marker}`);
    }
  }

  return task;
}

function validateApprovedSourceTasks(integrationSource) {
  const sourceTaskIds = [
    'INT-EXT-003',
    'INT-EXT-004',
    'INT-EXT-005',
    'INT-EXT-006',
    'INT-EXT-007',
    'INT-EXT-008',
  ];

  for (const taskId of sourceTaskIds) {
    const task = extractTaskSection(integrationSource, taskId);
    if (!/^\*\*Estado:\*\*\s*APROBADA\b/mu.test(task)) {
      fail(`${taskId} must remain APROBADA.`);
    }
  }
}

function validateShellCon018(shellSource) {
  const task = extractTaskSection(shellSource, 'SHELL-CON-018');
  const actualSourceHash = sha256(task);

  if (actualSourceHash !== shellCon018SourceContractSha256) {
    fail(
      `SHELL-CON-018 source contract SHA256 mismatch: `
      + `expected ${shellCon018SourceContractSha256}, received ${actualSourceHash}.`,
    );
  }

  const requiredTaskMarkers = [
    '@vento/contracts/integrations',
    'ExternalCredentialId',
    'ExternalCredentialRef',
    'CREDENTIAL_REFERENCE',
    'DEVELOPMENT',
    'STAGING',
    'PRODUCTION',
    'INT-EXT-003',
    'INT-EXT-008',
    'INT-DB-002',
    'SHELL-CON-019',
    'NO GENERA REQUISITOS DE PRUEBA',
    '0 ExternalCredentialId',
  ];

  for (const marker of requiredTaskMarkers) {
    if (!task.includes(marker)) {
      fail(`SHELL-CON-018 is missing required content: ${marker}`);
    }
  }

  return task;
}

function parseIntExtDecisionCoverage(integrationSource) {
  const task = extractTaskSection(integrationSource, 'INT-EXT-002');
  const matrix = extractNumberedSubsection(task, 9);
  const rows = [];

  for (const line of matrix.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length >= 9
      && /^EXT-SYS-\d{3}$/u.test(cells[0] ?? '')
    ) {
      rows.push({
        externalSystemId: cells[0],
        documentaryStatus: cells[6],
        physicalStatus: cells[7],
      });
    }
  }

  const ids = rows.map((entry) => entry.externalSystemId);
  const uniqueIds = [...new Set(ids)];

  if (rows.length !== 21 || uniqueIds.length !== 21) {
    fail(
      `INT-EXT-002 matrix must contain 21 unique decisions; `
      + `received rows=${rows.length}, unique=${uniqueIds.length}.`,
    );
  }

  for (let index = 0; index < expectedExternalSystemIds.length; index += 1) {
    if (uniqueIds[index] !== expectedExternalSystemIds[index]) {
      fail(
        `INT-EXT-002 decision order differs at ${index + 1}: `
        + `expected ${expectedExternalSystemIds[index]}, `
        + `received ${uniqueIds[index] ?? 'MISSING'}.`,
      );
    }
  }

  const documentarySpecified = rows.filter(
    (entry) => entry.documentaryStatus === 'ESPECIFICADO',
  ).length;
  const pendingPhysical = rows.filter(
    (entry) => entry.physicalStatus === 'PENDIENTE_DE_EVIDENCIA',
  ).length;
  const notApplicable = rows.filter(
    (entry) => entry.physicalStatus === 'NO_APLICA',
  ).length;

  if (documentarySpecified !== 21) {
    fail(
      `INT-EXT-002 must preserve 21 ESPECIFICADO decisions; `
      + `received ${documentarySpecified}.`,
    );
  }
  if (pendingPhysical !== 11) {
    fail(
      `INT-EXT-002 must preserve 11 PENDIENTE_DE_EVIDENCIA decisions; `
      + `received ${pendingPhysical}.`,
    );
  }
  if (notApplicable !== 10) {
    fail(
      `INT-EXT-002 must preserve 10 NO_APLICA decisions; `
      + `received ${notApplicable}.`,
    );
  }

  return {
    decisions: rows.length,
    documentarySpecified,
    pendingPhysical,
    notApplicable,
  };
}

function parseCredentialApplicability(shellCon018Task) {
  const matrix = extractNumberedSubsection(shellCon018Task, 21);
  const rows = [];

  for (const line of matrix.split('\n')) {
    const cells = splitMarkdownRow(line);
    if (
      cells.length >= 5
      && /^EXT-SYS-\d{3}$/u.test(cells[0] ?? '')
    ) {
      rows.push({
        externalSystemId: cells[0],
        system: cells[1],
        applicabilityStatus: cells[3],
      });
    }
  }

  const ids = rows.map((entry) => entry.externalSystemId);
  const uniqueIds = [...new Set(ids)];

  if (rows.length !== 21 || uniqueIds.length !== 21) {
    fail(
      `SHELL-CON-018 matrix must contain 21 unique decisions; `
      + `received rows=${rows.length}, unique=${uniqueIds.length}.`,
    );
  }

  for (let index = 0; index < expectedExternalSystemIds.length; index += 1) {
    if (uniqueIds[index] !== expectedExternalSystemIds[index]) {
      fail(
        `SHELL-CON-018 decision order differs at ${index + 1}: `
        + `expected ${expectedExternalSystemIds[index]}, `
        + `received ${uniqueIds[index] ?? 'MISSING'}.`,
      );
    }
  }

  const allowedStatuses = new Set([
    'PENDIENTE_DE_EVIDENCIA',
    'NO_APLICA',
    'NO_APLICA_ACTUAL',
  ]);
  const invalidStatuses = rows.filter(
    (entry) => !allowedStatuses.has(entry.applicabilityStatus),
  );
  if (invalidStatuses.length > 0) {
    fail(
      `SHELL-CON-018 has invalid applicability status: `
      + invalidStatuses
        .map((entry) => `${entry.externalSystemId}=${entry.applicabilityStatus}`)
        .join(', '),
    );
  }

  const pendingEvidence = rows.filter(
    (entry) => entry.applicabilityStatus === 'PENDIENTE_DE_EVIDENCIA',
  ).length;
  const notApplicable = rows.filter(
    (entry) => entry.applicabilityStatus === 'NO_APLICA',
  ).length;
  const notApplicableCurrent = rows.filter(
    (entry) => entry.applicabilityStatus === 'NO_APLICA_ACTUAL',
  ).length;

  if (pendingEvidence !== 9 || notApplicable !== 2 || notApplicableCurrent !== 10) {
    fail(
      `SHELL-CON-018 coverage mismatch: expected 9/2/10, received `
      + `${pendingEvidence}/${notApplicable}/${notApplicableCurrent}.`,
    );
  }

  return {
    rows,
    decisions: rows.length,
    pendingEvidence,
    notApplicable,
    notApplicableCurrent,
  };
}

function renderStringArray(name, values) {
  const rows = values
    .map((value) => `  ${JSON.stringify(value)},`)
    .join('\n');

  return `export const ${name} = [\n${rows}\n] as const;`;
}

function renderPrincipalContract() {
  return `// GENERATED FILE. DO NOT EDIT.
// Semantic owner: INT-EXT-002
// Contract task: SHELL-CON-017
// Foundation task: SHELL-CON-001
// Source contract SHA256: ${shellCon017SourceContractSha256}

declare const integrationPrincipalIdBrand: unique symbol;

export type IntegrationPrincipalId =
  string & {
    readonly [integrationPrincipalIdBrand]: "IntegrationPrincipalId";
  };

export interface IntegrationPrincipal {
  readonly integration_principal_id: IntegrationPrincipalId;
}

export type IntegrationPrincipalRef =
  Pick<IntegrationPrincipal, "integration_principal_id">;

export const INTEGRATION_PRINCIPAL_CONTEXT_POLICY = {
  system_service_may_represent_execution: true,
  not_every_system_service_is_external_integration: true,
  principal_context_identity_equivalence: false,
  service_role_is_principal: false,
  business_authority_implied: false,
} as const;

export const INTEGRATION_PRINCIPAL_CARDINALITY_POLICY = {
  basis: "MATERIAL_INTEGRATION_BOUNDARY",
  binding_requires_explicit_principal_before_operation: true,
  generic_reuse_across_independent_integrations: false,
  provider_name_implies_single_principal: false,
  credential_rotation_creates_new_principal: false,
  boundary_or_purpose_change_requires_reevaluation: true,
} as const;

export const INTEGRATION_PRINCIPAL_FAILURE_POLICY = {
  unresolved_principal: "FAIL_CLOSED",
  ambiguous_principal: "FAIL_CLOSED",
  wrong_boundary_principal: "FAIL_CLOSED",
  heuristic_assignment_allowed: false,
} as const;

export const INTEGRATION_PRINCIPAL_IDENTITY_POLICY = {
  identity_name: "IntegrationPrincipalId",
  semantics: "STABLE_OPAQUE_NON_SECRET_TECHNICAL_IDENTITY",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  materialized_id_count: 0,
  derive_from_external_system_id: false,
  derive_from_credential: false,
  derive_from_human_identity: false,
  reuse_after_retirement: false,
} as const;

${renderStringArray(
    'INTEGRATION_PRINCIPAL_SEPARATED_IDENTITIES',
    expectedPrincipalSeparatedIdentities,
  )}

export type IntegrationPrincipalSeparatedIdentity =
  (typeof INTEGRATION_PRINCIPAL_SEPARATED_IDENTITIES)[number];

${renderStringArray(
    'INTEGRATION_PRINCIPAL_CONCEPTUAL_DIMENSIONS',
    expectedPrincipalConceptualDimensions,
  )}

export type IntegrationPrincipalConceptualDimension =
  (typeof INTEGRATION_PRINCIPAL_CONCEPTUAL_DIMENSIONS)[number];

export const INTEGRATION_PRINCIPAL_REFERENCE_ADOPTION = {
  source_inventory_task_id: "INT-EXT-001",
  semantic_owner_task_id: "INT-EXT-002",
  external_system_decision_count: 21,
  documentary_status: "ESPECIFICADO",
  documentary_decision_count: 21,
  pending_physical_materialization_count: 11,
  not_applicable_without_binding_count: 10,
  materialized_principal_id_count: 0,
  adoption_mode: "REFERENCE_NOT_DUPLICATED",
} as const;

export const INTEGRATION_PRINCIPAL_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-017",
  semantic_owner_task_id: "INT-EXT-002",
  credential_reference_task_id: "SHELL-CON-018",
  physical_registry_owner_task_id: "INT-DB-001",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  runtime_registry_materialized: false,
  credential_materialized: false,
  secret_materialized: false,
  supabase_changed: false,
} as const;

export type IntegrationPrincipalContextPolicy =
  typeof INTEGRATION_PRINCIPAL_CONTEXT_POLICY;

export type IntegrationPrincipalCardinalityPolicy =
  typeof INTEGRATION_PRINCIPAL_CARDINALITY_POLICY;

export type IntegrationPrincipalFailurePolicy =
  typeof INTEGRATION_PRINCIPAL_FAILURE_POLICY;

export type IntegrationPrincipalIdentityPolicy =
  typeof INTEGRATION_PRINCIPAL_IDENTITY_POLICY;

export type IntegrationPrincipalReferenceAdoption =
  typeof INTEGRATION_PRINCIPAL_REFERENCE_ADOPTION;

export type IntegrationPrincipalContractMetadata =
  typeof INTEGRATION_PRINCIPAL_CONTRACT_METADATA;
`;
}

function renderCredentialApplicabilityRows(rows) {
  return rows.map((entry) => [
    '  {',
    `    external_system_id: ${JSON.stringify(entry.externalSystemId)},`,
    `    system: ${JSON.stringify(entry.system)},`,
    `    status: ${JSON.stringify(entry.applicabilityStatus)},`,
    '  },',
  ].join('\n')).join('\n');
}

function renderCredentialContract(coverage) {
  return `// GENERATED FILE. DO NOT EDIT.
// Semantic owners: INT-EXT-003..008
// Contract task: SHELL-CON-018
// Foundation task: SHELL-CON-001
// Principal contract task: SHELL-CON-017
// Source contract SHA256: ${shellCon018SourceContractSha256}

import type { IntegrationPrincipalId } from "./integration-principal.contract.js";

declare const externalCredentialIdBrand: unique symbol;

export type ExternalCredentialId =
  string & {
    readonly [externalCredentialIdBrand]: "ExternalCredentialId";
  };

export const VENTO_CREDENTIAL_ENVIRONMENTS = [
  "DEVELOPMENT",
  "STAGING",
  "PRODUCTION",
] as const;

export type VentoCredentialEnvironment =
  (typeof VENTO_CREDENTIAL_ENVIRONMENTS)[number];

export interface ExternalCredentialRef {
  readonly external_credential_id: ExternalCredentialId;
  readonly external_system_id: string;
  readonly integration_principal_id: IntegrationPrincipalId;
  readonly credential_surface: string;
  readonly environment: VentoCredentialEnvironment;
  readonly external_instance_id?: string;
  readonly provider_account_ref?: string;
  readonly provenance?: string;
  readonly mechanism?: string;
  readonly minimum_scope?: readonly string[];
  readonly scope_ceiling?: readonly string[];
  readonly material_class?: string;
  readonly functional_owner_ref?: string;
  readonly technical_custodian_ref?: string;
  readonly lifecycle_state?: string;
  readonly predecessor_external_credential_id?: ExternalCredentialId;
  readonly successor_external_credential_id?: ExternalCredentialId;
  readonly known_dates?: readonly string[];
  readonly authorized_consumers?: readonly string[];
}

${renderStringArray(
    'EXTERNAL_CREDENTIAL_CONCEPTUAL_DIMENSIONS',
    expectedCredentialConceptualDimensions,
  )}

export type ExternalCredentialConceptualDimension =
  (typeof EXTERNAL_CREDENTIAL_CONCEPTUAL_DIMENSIONS)[number];

export const EXTERNAL_CREDENTIAL_IDENTITY_POLICY = {
  identity_name: "ExternalCredentialId",
  semantics: "STABLE_OPAQUE_NON_SECRET_CREDENTIAL_IDENTITY",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  materialized_id_count: 0,
  derive_from_secret_value: false,
  derive_from_integration_principal_id: false,
  derive_from_external_system_id: false,
  derive_from_provider_account_ref: false,
  derive_from_endpoint: false,
  derive_from_environment_variable_name: false,
  authentication_mechanism: false,
  knowledge_grants_secret_resolution: false,
  reuse_for_independent_successor: false,
  reuse_after_retirement: false,
} as const;

export const EXTERNAL_CREDENTIAL_REFERENCE_POLICY = {
  material_class: "CREDENTIAL_REFERENCE",
  contains_authentication_material: false,
  contains_secret_store_path: false,
  contains_runtime_secret_locator: false,
  runtime_secret_resolution_api: false,
  business_authority_implied: false,
  permission_key_implied: false,
  credential_value_publication: false,
  fallback_to_global_credential: false,
  fallback_to_legacy_credential: false,
  fallback_to_other_environment: false,
  environment_cardinality: "EXACTLY_ONE",
  cardinality_basis: "CREDENTIAL_SURFACE_AND_ENVIRONMENT",
  multiple_refs_per_external_system_allowed: true,
} as const;

export const EXTERNAL_CREDENTIAL_ROTATION_POLICY = {
  independent_successor_requires_new_external_credential_id: true,
  ordinary_rotation_changes_integration_principal_id: false,
  predecessor_successor_history_preserved: true,
  revoked_expired_retired_history_preserved: true,
  derived_ephemeral_artifact_gets_identity_automatically: false,
  cross_environment_successor_allowed: false,
} as const;

export const EXTERNAL_CREDENTIAL_FAILURE_POLICY = {
  missing_required_credential_id: "FAIL_CLOSED",
  wrong_external_system: "FAIL_CLOSED",
  wrong_integration_principal: "FAIL_CLOSED",
  wrong_surface: "FAIL_CLOSED",
  wrong_environment: "FAIL_CLOSED",
  ambiguous_environment: "FAIL_CLOSED",
  incompatible_mechanism: "FAIL_CLOSED",
  requested_scope_above_ceiling: "FAIL_CLOSED",
  unusable_lifecycle_state: "FAIL_CLOSED",
  unresolved_required_material: "FAIL_CLOSED",
  inference_required_to_complete_reference: "FAIL_CLOSED",
} as const;

export const EXTERNAL_CREDENTIAL_REFERENCE_FORBIDDEN_MATERIAL = [
  "operational_api_key",
  "secret_key",
  "service_role_key",
  "complete_jwt",
  "access_token",
  "refresh_token",
  "webhook_secret",
  "password",
  "client_secret",
  "private_key",
  "private_certificate_material",
  "recoverable_service_account_private_material",
  "reusable_session_cookie",
  "complete_authentication_header",
  "reusable_signature_credential",
  "recoverable_cryptographic_material",
  "secret_reconstruction_fragment",
  "operational_secret_store_locator",
  "runtime_secret_recovery_instruction",
] as const;

export type ExternalCredentialForbiddenMaterial =
  (typeof EXTERNAL_CREDENTIAL_REFERENCE_FORBIDDEN_MATERIAL)[number];

export const EXTERNAL_CREDENTIAL_APPLICABILITY_STATUSES = [
  "PENDIENTE_DE_EVIDENCIA",
  "NO_APLICA",
  "NO_APLICA_ACTUAL",
] as const;

export type ExternalCredentialApplicabilityStatus =
  (typeof EXTERNAL_CREDENTIAL_APPLICABILITY_STATUSES)[number];

export const EXTERNAL_CREDENTIAL_REFERENCE_APPLICABILITY = [
${renderCredentialApplicabilityRows(coverage.rows)}
] as const satisfies readonly {
  readonly external_system_id: string;
  readonly system: string;
  readonly status: ExternalCredentialApplicabilityStatus;
}[];

export const EXTERNAL_CREDENTIAL_REFERENCE_COVERAGE = {
  external_system_decision_count: 21,
  pending_evidence_count: 9,
  not_applicable_count: 2,
  not_applicable_current_count: 10,
  materialized_external_credential_id_count: 0,
  persisted_external_credential_ref_count: 0,
  created_or_moved_secret_count: 0,
} as const;

export const EXTERNAL_CREDENTIAL_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-018",
  principal_contract_task_id: "SHELL-CON-017",
  semantic_owner_task_ids: [
    "INT-EXT-003",
    "INT-EXT-004",
    "INT-EXT-005",
    "INT-EXT-006",
    "INT-EXT-007",
    "INT-EXT-008",
  ],
  physical_reference_registry_owner_task_id: "INT-DB-002",
  next_contract_task_id: "SHELL-CON-019",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  runtime_secret_resolution_materialized: false,
  external_credential_values_materialized: false,
  secret_materialized: false,
  supabase_changed: false,
} as const;

export type ExternalCredentialIdentityPolicy =
  typeof EXTERNAL_CREDENTIAL_IDENTITY_POLICY;

export type ExternalCredentialReferencePolicy =
  typeof EXTERNAL_CREDENTIAL_REFERENCE_POLICY;

export type ExternalCredentialRotationPolicy =
  typeof EXTERNAL_CREDENTIAL_ROTATION_POLICY;

export type ExternalCredentialFailurePolicy =
  typeof EXTERNAL_CREDENTIAL_FAILURE_POLICY;

export type ExternalCredentialReferenceCoverage =
  typeof EXTERNAL_CREDENTIAL_REFERENCE_COVERAGE;

export type ExternalCredentialContractMetadata =
  typeof EXTERNAL_CREDENTIAL_CONTRACT_METADATA;
`;
}

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.
// Contract tasks: SHELL-CON-017, SHELL-CON-018
// SHELL-CON-017 source SHA256: ${shellCon017SourceContractSha256}
// SHELL-CON-018 source SHA256: ${shellCon018SourceContractSha256}

export {
  INTEGRATION_PRINCIPAL_CARDINALITY_POLICY,
  INTEGRATION_PRINCIPAL_CONCEPTUAL_DIMENSIONS,
  INTEGRATION_PRINCIPAL_CONTEXT_POLICY,
  INTEGRATION_PRINCIPAL_CONTRACT_METADATA,
  INTEGRATION_PRINCIPAL_FAILURE_POLICY,
  INTEGRATION_PRINCIPAL_IDENTITY_POLICY,
  INTEGRATION_PRINCIPAL_REFERENCE_ADOPTION,
  INTEGRATION_PRINCIPAL_SEPARATED_IDENTITIES,
} from "./integration-principal.contract.js";

export type {
  IntegrationPrincipal,
  IntegrationPrincipalCardinalityPolicy,
  IntegrationPrincipalConceptualDimension,
  IntegrationPrincipalContextPolicy,
  IntegrationPrincipalContractMetadata,
  IntegrationPrincipalFailurePolicy,
  IntegrationPrincipalId,
  IntegrationPrincipalIdentityPolicy,
  IntegrationPrincipalRef,
  IntegrationPrincipalReferenceAdoption,
  IntegrationPrincipalSeparatedIdentity,
} from "./integration-principal.contract.js";

export {
  EXTERNAL_CREDENTIAL_APPLICABILITY_STATUSES,
  EXTERNAL_CREDENTIAL_CONCEPTUAL_DIMENSIONS,
  EXTERNAL_CREDENTIAL_CONTRACT_METADATA,
  EXTERNAL_CREDENTIAL_FAILURE_POLICY,
  EXTERNAL_CREDENTIAL_IDENTITY_POLICY,
  EXTERNAL_CREDENTIAL_REFERENCE_APPLICABILITY,
  EXTERNAL_CREDENTIAL_REFERENCE_COVERAGE,
  EXTERNAL_CREDENTIAL_REFERENCE_FORBIDDEN_MATERIAL,
  EXTERNAL_CREDENTIAL_REFERENCE_POLICY,
  EXTERNAL_CREDENTIAL_ROTATION_POLICY,
  VENTO_CREDENTIAL_ENVIRONMENTS,
} from "./external-credential-ref.contract.js";

export type {
  ExternalCredentialApplicabilityStatus,
  ExternalCredentialConceptualDimension,
  ExternalCredentialContractMetadata,
  ExternalCredentialFailurePolicy,
  ExternalCredentialForbiddenMaterial,
  ExternalCredentialId,
  ExternalCredentialIdentityPolicy,
  ExternalCredentialRef,
  ExternalCredentialReferenceCoverage,
  ExternalCredentialReferencePolicy,
  ExternalCredentialRotationPolicy,
  VentoCredentialEnvironment,
} from "./external-credential-ref.contract.js";
`;
}

function writeOrCheck(filePath, content, checkOnly, label) {
  const expected = normalizeEol(content);
  const exists = fs.existsSync(filePath);
  const current = exists
    ? normalizeEol(fs.readFileSync(filePath, 'utf8'))
    : null;

  if (checkOnly) {
    if (!exists) {
      fail(`${label} is missing.`);
    }

    if (current !== expected) {
      fail(`${label} is stale.`);
    }

    return 'FRESH';
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });

  if (current === expected) {
    return 'FRESH';
  }

  fs.writeFileSync(filePath, expected, 'utf8');
  return exists ? 'UPDATED' : 'CREATED';
}

export function generateIntegrationPrincipalContracts({
  checkOnly = false,
} = {}) {
  const shellSource = readText(
    shellContractSourcePath,
    'SHELL-CON source file',
  );
  const integrationSource = readText(
    integrationSourcePath,
    'INT-EXT source file',
  );

  validateReconciliation(shellSource);
  validateShellCon017(shellSource);
  validateApprovedSourceTasks(integrationSource);
  const principalCoverage = parseIntExtDecisionCoverage(integrationSource);
  const shellCon018Task = validateShellCon018(shellSource);
  const credentialCoverage = parseCredentialApplicability(shellCon018Task);

  const principalContractResult = writeOrCheck(
    principalContractPath,
    renderPrincipalContract(),
    checkOnly,
    'integration principal contract',
  );
  const credentialContractResult = writeOrCheck(
    credentialContractPath,
    renderCredentialContract(credentialCoverage),
    checkOnly,
    'external credential reference contract',
  );
  const indexResult = writeOrCheck(
    indexPath,
    renderIndex(),
    checkOnly,
    'integrations generated index',
  );

  return {
    principalDecisions: principalCoverage.decisions,
    principalDocumentarySpecified: principalCoverage.documentarySpecified,
    principalPendingPhysical: principalCoverage.pendingPhysical,
    principalNotApplicable: principalCoverage.notApplicable,
    materializedPrincipalIds: 0,
    credentialDecisions: credentialCoverage.decisions,
    credentialPendingEvidence: credentialCoverage.pendingEvidence,
    credentialNotApplicable: credentialCoverage.notApplicable,
    credentialNotApplicableCurrent: credentialCoverage.notApplicableCurrent,
    materializedCredentialIds: 0,
    principalContractResult,
    credentialContractResult,
    indexResult,
  };
}

function runCli() {
  const checkOnly = process.argv.includes('--check');
  const unknown = process.argv
    .slice(2)
    .filter((value) => value !== '--check');

  try {
    if (unknown.length > 0) {
      fail(`Unknown arguments: ${unknown.join(', ')}`);
    }

    const result = generateIntegrationPrincipalContracts({ checkOnly });

    console.log(
      `[VENTO CONTRACTS] INTEGRATIONS `
      + `${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
    console.log(`[VENTO CONTRACTS] PRINCIPAL_DECISIONS ${result.principalDecisions}`);
    console.log(`[VENTO CONTRACTS] CREDENTIAL_DECISIONS ${result.credentialDecisions}`);
    console.log(
      `[VENTO CONTRACTS] CREDENTIAL_PENDING_EVIDENCE `
      + `${result.credentialPendingEvidence}`,
    );
    console.log(
      `[VENTO CONTRACTS] CREDENTIAL_NOT_APPLICABLE `
      + `${result.credentialNotApplicable}`,
    );
    console.log(
      `[VENTO CONTRACTS] CREDENTIAL_NOT_APPLICABLE_CURRENT `
      + `${result.credentialNotApplicableCurrent}`,
    );
    console.log(
      `[VENTO CONTRACTS] MATERIALIZED_CREDENTIAL_IDS `
      + `${result.materializedCredentialIds}`,
    );
    console.log(`[VENTO CONTRACTS] PRINCIPAL_CONTRACT ${result.principalContractResult}`);
    console.log(`[VENTO CONTRACTS] CREDENTIAL_CONTRACT ${result.credentialContractResult}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.indexResult}`);
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log(
      `OPERACION: ${checkOnly
        ? 'INTEGRATION_CONTRACTS_CHECK'
        : 'INTEGRATION_CONTRACTS_GENERATE'}`,
    );
    console.log(`PRINCIPAL_DECISIONS: ${result.principalDecisions}`);
    console.log(`CREDENTIAL_DECISIONS: ${result.credentialDecisions}`);
    console.log(`CREDENTIAL_PENDING_EVIDENCE: ${result.credentialPendingEvidence}`);
    console.log(`CREDENTIAL_NOT_APPLICABLE: ${result.credentialNotApplicable}`);
    console.log(
      `CREDENTIAL_NOT_APPLICABLE_CURRENT: `
      + `${result.credentialNotApplicableCurrent}`,
    );
    console.log(`MATERIALIZED_CREDENTIAL_IDS: ${result.materializedCredentialIds}`);
    console.log(`PRINCIPAL_CONTRACT: ${result.principalContractResult}`);
    console.log(`CREDENTIAL_CONTRACT: ${result.credentialContractResult}`);
    console.log(`INDEX: ${result.indexResult}`);
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] INTEGRATIONS FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: INTEGRATION_CONTRACTS');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}

if (
  process.argv[1]
  && path.resolve(process.argv[1]) === currentFile
) {
  runCli();
}