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
const contractPath = path.join(
  generatedDirectory,
  'integration-principal.contract.ts',
);
const indexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 =
  'c4ca8bdc55f98113d235107f99355ef6a69dbb59a7f0853a6e087c8fcad14839';

const expectedExternalSystemIds = Object.freeze(
  Array.from(
    { length: 21 },
    (_, index) => `EXT-SYS-${String(index + 1).padStart(3, '0')}`,
  ),
);

const expectedSeparatedIdentities = Object.freeze([
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

const expectedConceptualDimensions = Object.freeze([
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

function validateShellContract(shellSource) {
  const requiredReconciliationMarkers = [
    '<!-- EXECUTION-GATE-RECONCILIATION:B001-200:SHELL-CON-017-024 -->',
    '`GLOBAL_ENABLE_ONCE`',
    '`PRE_E5_FOUNDATION`',
    '`<task_id>::GLOBAL`',
  ];

  for (const marker of requiredReconciliationMarkers) {
    if (!shellSource.includes(marker)) {
      fail(`SHELL-CON reconciliation is missing marker: ${marker}`);
    }
  }

  const task = extractTaskSection(shellSource, 'SHELL-CON-017');
  const actualSourceHash = sha256(task);

  if (actualSourceHash !== sourceContractSha256) {
    fail(
      `SHELL-CON-017 source contract SHA256 mismatch: `
      + `expected ${sourceContractSha256}, received ${actualSourceHash}.`,
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

function renderStringArray(name, values) {
  const rows = values
    .map((value) => `  ${JSON.stringify(value)},`)
    .join('\n');

  return `export const ${name} = [\n${rows}\n] as const;`;
}

function renderContract() {
  return `// GENERATED FILE. DO NOT EDIT.
// Semantic owner: INT-EXT-002
// Contract task: SHELL-CON-017
// Foundation task: SHELL-CON-001
// Source contract SHA256: ${sourceContractSha256}

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
    expectedSeparatedIdentities,
  )}

export type IntegrationPrincipalSeparatedIdentity =
  (typeof INTEGRATION_PRINCIPAL_SEPARATED_IDENTITIES)[number];

${renderStringArray(
    'INTEGRATION_PRINCIPAL_CONCEPTUAL_DIMENSIONS',
    expectedConceptualDimensions,
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

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.
// Contract task: SHELL-CON-017
// Source contract SHA256: ${sourceContractSha256}

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
    'SHELL-CON-017 source file',
  );
  const integrationSource = readText(
    integrationSourcePath,
    'INT-EXT-002 source file',
  );

  validateShellContract(shellSource);
  const coverage = parseIntExtDecisionCoverage(integrationSource);

  const contractResult = writeOrCheck(
    contractPath,
    renderContract(),
    checkOnly,
    'integration principal contract',
  );
  const indexResult = writeOrCheck(
    indexPath,
    renderIndex(),
    checkOnly,
    'integration principal generated index',
  );

  return {
    ...coverage,
    materializedPrincipalIds: 0,
    contractResult,
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
      `[VENTO CONTRACTS] INTEGRATION_PRINCIPAL `
      + `${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
    console.log(`[VENTO CONTRACTS] DECISIONS ${result.decisions}`);
    console.log(
      `[VENTO CONTRACTS] DOCUMENTARY_SPECIFIED `
      + `${result.documentarySpecified}`,
    );
    console.log(
      `[VENTO CONTRACTS] PENDING_PHYSICAL ${result.pendingPhysical}`,
    );
    console.log(
      `[VENTO CONTRACTS] NOT_APPLICABLE ${result.notApplicable}`,
    );
    console.log(
      `[VENTO CONTRACTS] MATERIALIZED_PRINCIPAL_IDS `
      + `${result.materializedPrincipalIds}`,
    );
    console.log(`[VENTO CONTRACTS] CONTRACT ${result.contractResult}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.indexResult}`);
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log(
      `OPERACION: ${checkOnly
        ? 'INTEGRATION_PRINCIPAL_CHECK'
        : 'INTEGRATION_PRINCIPAL_GENERATE'}`,
    );
    console.log(`DECISIONS: ${result.decisions}`);
    console.log(
      `DOCUMENTARY_SPECIFIED: ${result.documentarySpecified}`,
    );
    console.log(`PENDING_PHYSICAL: ${result.pendingPhysical}`);
    console.log(`NOT_APPLICABLE: ${result.notApplicable}`);
    console.log(
      `MATERIALIZED_PRINCIPAL_IDS: ${result.materializedPrincipalIds}`,
    );
    console.log(`CONTRACT: ${result.contractResult}`);
    console.log(`INDEX: ${result.indexResult}`);
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] INTEGRATION_PRINCIPAL FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: INTEGRATION_PRINCIPAL');
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