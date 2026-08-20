import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const catalogVersion = '1.0.0';

const scopeSourcePath = path.join(
  authorizationRoot,
  'catalog',
  'scopes',
  'versions',
  catalogVersion,
  'scopes.json',
);

const generatedDirectory = path.join(
  authorizationRoot,
  'generated',
  'scopes',
  'versions',
  catalogVersion,
);

const generatedTypesPath = path.join(generatedDirectory, 'permission-scope.types.ts');
const generatedValuesPath = path.join(generatedDirectory, 'permission-scope.values.ts');
const generatedIndexPath = path.join(generatedDirectory, 'index.ts');

const expectedSourceSha256 = '70987732aae8d2d6e6bad40e6abba16e98823224cd1c19b28f0bfd1088dcd85d';

const expectedDefinitions = [
  {
    scope_code: 'NT',
    scope_category: 'NON_TERRITORIAL',
    canonical_order: 1,
    semantics: 'El permiso no admite dimensión territorial variable. La ausencia de sede o área no crea territorio implícito.',
  },
  {
    scope_code: 'ORG',
    scope_category: 'NON_TERRITORIAL',
    canonical_order: 2,
    semantics: 'El recurso queda limitado a la organización, unidad, catálogo, canal o dominio exacto definido por su contrato, sin fabricar una sede.',
  },
  {
    scope_code: 'G',
    scope_category: 'TERRITORIAL',
    canonical_order: 3,
    semantics: 'Autoriza el permiso exacto en el ámbito ordinario de la organización. No es universal, no cruza aplicaciones ni incorpora recursos aislados.',
  },
  {
    scope_code: 'AS',
    scope_category: 'TERRITORIAL',
    canonical_order: 4,
    semantics: 'Conjunto de sedes activas asignadas al actor mediante la relación laboral autorizada.',
  },
  {
    scope_code: 'SS',
    scope_category: 'TERRITORIAL',
    canonical_order: 5,
    semantics: 'Una sede concreta autorizada para el permiso y recurso evaluados.',
  },
  {
    scope_code: 'AST',
    scope_category: 'TERRITORIAL',
    canonical_order: 6,
    semantics: 'Subconjunto de sedes asignadas al actor que además coincide con un tipo de sede exacto.',
  },
  {
    scope_code: 'TST',
    scope_category: 'TERRITORIAL',
    canonical_order: 7,
    semantics: 'Conjunto transversal de sedes ordinarias de un tipo exacto, únicamente mediante concesión explícita; nunca se infiere desde AST.',
  },
  {
    scope_code: 'AA',
    scope_category: 'TERRITORIAL',
    canonical_order: 8,
    semantics: 'Conjunto de áreas activas asignadas al actor dentro de sedes autorizadas.',
  },
  {
    scope_code: 'SA',
    scope_category: 'TERRITORIAL',
    canonical_order: 9,
    semantics: 'Un área concreta dentro de una sede autorizada.',
  },
  {
    scope_code: 'AAT',
    scope_category: 'TERRITORIAL',
    canonical_order: 10,
    semantics: 'Subconjunto de áreas asignadas al actor que coincide con un tipo de área exacto.',
  },
  {
    scope_code: 'ATW',
    scope_category: 'TERRITORIAL',
    canonical_order: 11,
    semantics: 'Conjunto transversal de áreas de un tipo exacto, siempre acotado por una sede o conjunto superior de sedes autorizado.',
  },
  {
    scope_code: 'CTX',
    scope_category: 'OPERATIONAL_CONTEXT',
    canonical_order: 12,
    semantics: 'Territorio efectivo resuelto por el carril operativo. No aporta por sí mismo turno, check-in ni área activa.',
  },
  {
    scope_code: 'OWN',
    scope_category: 'OWNERSHIP',
    canonical_order: 13,
    semantics: 'Restricción o variante sobre recurso propio, creado o atribuido según el contrato del recurso. Puede combinarse con territorio, pero nunca ampliarlo.',
  },
];

function fail(message) {
  throw new Error(message);
}

function sha256(value) {
  return crypto.createHash('sha256').update(value).digest('hex');
}

function assertExactJson(actual, expected, label) {
  if (JSON.stringify(actual) !== JSON.stringify(expected)) {
    fail(`${label} does not match the canonical SHELL-CON-006 contract.`);
  }
}

function readScopeDefinitions() {
  if (!fs.existsSync(scopeSourcePath)) {
    fail(`Missing scopes.json source: ${path.relative(process.cwd(), scopeSourcePath)}`);
  }

  const raw = fs.readFileSync(scopeSourcePath, 'utf8');
  if (!raw.endsWith('\n') || raw.endsWith('\n\n') || raw.includes('\r')) {
    fail('scopes.json must use LF, exactly one final LF and no CR characters.');
  }

  const digest = sha256(raw);
  if (digest !== expectedSourceSha256) {
    fail(`scopes.json SHA256 mismatch: ${digest}.`);
  }

  const definitions = JSON.parse(raw);
  if (!Array.isArray(definitions)) fail('scopes.json must contain an array.');
  assertExactJson(definitions, expectedDefinitions, 'scopes.json');

  const codes = definitions.map((definition) => definition.scope_code);
  if (new Set(codes).size !== definitions.length) {
    fail('scopes.json contains duplicate scope_code values.');
  }

  return { definitions, digest };
}

function valuesForCategory(definitions, category) {
  return definitions
    .filter((definition) => definition.scope_category === category)
    .map((definition) => definition.scope_code);
}

function renderTypeAlias(name, values) {
  const union = values.map((value) => `  | ${JSON.stringify(value)}`).join('\n');
  return `export type ${name} =\n${union};`;
}

function renderTypes(definitions) {
  const allCodes = definitions.map((definition) => definition.scope_code);
  const categories = [...new Set(definitions.map((definition) => definition.scope_category))];
  const territorialCodes = valuesForCategory(definitions, 'TERRITORIAL');
  const nonTerritorialCodes = valuesForCategory(definitions, 'NON_TERRITORIAL');
  const operationalContextCodes = valuesForCategory(definitions, 'OPERATIONAL_CONTEXT');
  const ownershipCodes = valuesForCategory(definitions, 'OWNERSHIP');

  return `// GENERATED FILE. DO NOT EDIT.\n// Source: authorization/catalog/scopes/versions/${catalogVersion}/scopes.json\n\n${renderTypeAlias('PermissionScopeCode', allCodes)}\n\n${renderTypeAlias('PermissionScopeCategory', categories)}\n\nexport type AllowedScopeSet = readonly PermissionScopeCode[];\n\nexport type MaximumScope = PermissionScopeCode;\n\n${renderTypeAlias('TerritorialScope', territorialCodes)}\n\n${renderTypeAlias('NonTerritorialScope', nonTerritorialCodes)}\n\n${renderTypeAlias('OperationalContextScope', operationalContextCodes)}\n\n${renderTypeAlias('OwnershipScope', ownershipCodes)}\n\nexport interface PermissionScopeDefinition {\n  readonly scope_code: PermissionScopeCode;\n  readonly scope_category: PermissionScopeCategory;\n  readonly canonical_order: number;\n  readonly semantics: string;\n}\n\nexport type PermissionScopeByCode = Readonly<Record<PermissionScopeCode, PermissionScopeDefinition>>;\n`;
}

function renderCodeArray(name, values, typeName) {
  const rows = values.map((value) => `  ${JSON.stringify(value)},`).join('\n');
  return `export const ${name} = [\n${rows}\n] as const satisfies readonly ${typeName}[];`;
}

function renderValues(definitions) {
  const allCodes = definitions.map((definition) => definition.scope_code);
  const territorialCodes = valuesForCategory(definitions, 'TERRITORIAL');
  const nonTerritorialCodes = valuesForCategory(definitions, 'NON_TERRITORIAL');
  const operationalContextCodes = valuesForCategory(definitions, 'OPERATIONAL_CONTEXT');
  const ownershipCodes = valuesForCategory(definitions, 'OWNERSHIP');
  const definitionSource = JSON.stringify(definitions, null, 2);
  const mapRows = definitions
    .map((definition, index) => `  ${JSON.stringify(definition.scope_code)}: PERMISSION_SCOPE_DEFINITIONS[${index}],`)
    .join('\n');

  return `// GENERATED FILE. DO NOT EDIT.\n// Source: authorization/catalog/scopes/versions/${catalogVersion}/scopes.json\n\nimport type {\n  AllowedScopeSet,\n  MaximumScope,\n  NonTerritorialScope,\n  OperationalContextScope,\n  OwnershipScope,\n  PermissionScopeByCode,\n  PermissionScopeCode,\n  PermissionScopeDefinition,\n  TerritorialScope,\n} from "./permission-scope.types.js";\n\n${renderCodeArray('PERMISSION_SCOPE_CODES', allCodes, 'PermissionScopeCode')}\n\nexport const PERMISSION_SCOPE_DEFINITIONS = ${definitionSource} as const satisfies readonly PermissionScopeDefinition[];\n\nexport const PERMISSION_SCOPE_BY_CODE = {\n${mapRows}\n} as const satisfies PermissionScopeByCode;\n\n${renderCodeArray('TERRITORIAL_SCOPE_CODES', territorialCodes, 'TerritorialScope')}\n\n${renderCodeArray('NON_TERRITORIAL_SCOPE_CODES', nonTerritorialCodes, 'NonTerritorialScope')}\n\n${renderCodeArray('OPERATIONAL_CONTEXT_SCOPE_CODES', operationalContextCodes, 'OperationalContextScope')}\n\n${renderCodeArray('OWNERSHIP_SCOPE_CODES', ownershipCodes, 'OwnershipScope')}\n\nconst PERMISSION_SCOPE_CODE_SET = new Set<string>(PERMISSION_SCOPE_CODES);\n\nexport function isPermissionScopeCode(value: unknown): value is PermissionScopeCode {\n  return typeof value === "string" && PERMISSION_SCOPE_CODE_SET.has(value);\n}\n\nexport function isAllowedScopeSet(value: unknown): value is AllowedScopeSet {\n  if (!Array.isArray(value)) return false;\n  const seen = new Set<string>();\n  for (const member of value) {\n    if (!isPermissionScopeCode(member) || seen.has(member)) return false;\n    seen.add(member);\n  }\n  return true;\n}\n\nexport function isMaximumScope(value: unknown): value is MaximumScope {\n  return isPermissionScopeCode(value);\n}\n`;
}

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.\n// Source: authorization/catalog/scopes/versions/${catalogVersion}/scopes.json\n\nexport type {\n  PermissionScopeCode,\n  PermissionScopeCategory,\n  AllowedScopeSet,\n  MaximumScope,\n  TerritorialScope,\n  NonTerritorialScope,\n  OperationalContextScope,\n  OwnershipScope,\n  PermissionScopeDefinition,\n  PermissionScopeByCode,\n} from "./permission-scope.types.js";\n\nexport {\n  PERMISSION_SCOPE_CODES,\n  PERMISSION_SCOPE_DEFINITIONS,\n  PERMISSION_SCOPE_BY_CODE,\n  TERRITORIAL_SCOPE_CODES,\n  NON_TERRITORIAL_SCOPE_CODES,\n  OPERATIONAL_CONTEXT_SCOPE_CODES,\n  OWNERSHIP_SCOPE_CODES,\n  isPermissionScopeCode,\n  isAllowedScopeSet,\n  isMaximumScope,\n} from "./permission-scope.values.js";\n`;
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

export function generatePermissionScopeContracts({ checkOnly = false } = {}) {
  const { definitions, digest } = readScopeDefinitions();
  const results = {
    types: assertOrWrite(generatedTypesPath, renderTypes(definitions), checkOnly),
    values: assertOrWrite(generatedValuesPath, renderValues(definitions), checkOnly),
    index: assertOrWrite(generatedIndexPath, renderIndex(), checkOnly),
  };

  return {
    scope_codes: definitions.length,
    non_territorial: valuesForCategory(definitions, 'NON_TERRITORIAL').length,
    territorial: valuesForCategory(definitions, 'TERRITORIAL').length,
    operational_context: valuesForCategory(definitions, 'OPERATIONAL_CONTEXT').length,
    ownership: valuesForCategory(definitions, 'OWNERSHIP').length,
    source_hash: digest,
    results,
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);
    const checkOnly = process.argv.includes('--check');
    const result = generatePermissionScopeContracts({ checkOnly });
    console.log(`[VENTO CONTRACTS] PERMISSION_SCOPE_CONTRACTS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`);
    console.log(`[VENTO CONTRACTS] PERMISSION_SCOPE_CODES ${result.scope_codes}`);
    console.log(`[VENTO CONTRACTS] NON_TERRITORIAL ${result.non_territorial}`);
    console.log(`[VENTO CONTRACTS] TERRITORIAL ${result.territorial}`);
    console.log(`[VENTO CONTRACTS] OPERATIONAL_CONTEXT ${result.operational_context}`);
    console.log(`[VENTO CONTRACTS] OWNERSHIP ${result.ownership}`);
    console.log(`[VENTO CONTRACTS] SOURCE_SHA256 ${result.source_hash}`);
    console.log(`[VENTO CONTRACTS] TYPES ${result.results.types}`);
    console.log(`[VENTO CONTRACTS] VALUES ${result.results.values}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.results.index}`);
  } catch (error) {
    console.error('[VENTO CONTRACTS] PERMISSION_SCOPE_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}