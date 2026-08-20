// GENERATED FILE. DO NOT EDIT.
// Source: authorization/catalog/scopes/versions/1.0.0/scopes.json

import type {
  AllowedScopeSet,
  MaximumScope,
  NonTerritorialScope,
  OperationalContextScope,
  OwnershipScope,
  PermissionScopeByCode,
  PermissionScopeCode,
  PermissionScopeDefinition,
  TerritorialScope,
} from "./permission-scope.types.js";

export const PERMISSION_SCOPE_CODES = [
  "NT",
  "ORG",
  "G",
  "AS",
  "SS",
  "AST",
  "TST",
  "AA",
  "SA",
  "AAT",
  "ATW",
  "CTX",
  "OWN",
] as const satisfies readonly PermissionScopeCode[];

export const PERMISSION_SCOPE_DEFINITIONS = [
  {
    "scope_code": "NT",
    "scope_category": "NON_TERRITORIAL",
    "canonical_order": 1,
    "semantics": "El permiso no admite dimensión territorial variable. La ausencia de sede o área no crea territorio implícito."
  },
  {
    "scope_code": "ORG",
    "scope_category": "NON_TERRITORIAL",
    "canonical_order": 2,
    "semantics": "El recurso queda limitado a la organización, unidad, catálogo, canal o dominio exacto definido por su contrato, sin fabricar una sede."
  },
  {
    "scope_code": "G",
    "scope_category": "TERRITORIAL",
    "canonical_order": 3,
    "semantics": "Autoriza el permiso exacto en el ámbito ordinario de la organización. No es universal, no cruza aplicaciones ni incorpora recursos aislados."
  },
  {
    "scope_code": "AS",
    "scope_category": "TERRITORIAL",
    "canonical_order": 4,
    "semantics": "Conjunto de sedes activas asignadas al actor mediante la relación laboral autorizada."
  },
  {
    "scope_code": "SS",
    "scope_category": "TERRITORIAL",
    "canonical_order": 5,
    "semantics": "Una sede concreta autorizada para el permiso y recurso evaluados."
  },
  {
    "scope_code": "AST",
    "scope_category": "TERRITORIAL",
    "canonical_order": 6,
    "semantics": "Subconjunto de sedes asignadas al actor que además coincide con un tipo de sede exacto."
  },
  {
    "scope_code": "TST",
    "scope_category": "TERRITORIAL",
    "canonical_order": 7,
    "semantics": "Conjunto transversal de sedes ordinarias de un tipo exacto, únicamente mediante concesión explícita; nunca se infiere desde AST."
  },
  {
    "scope_code": "AA",
    "scope_category": "TERRITORIAL",
    "canonical_order": 8,
    "semantics": "Conjunto de áreas activas asignadas al actor dentro de sedes autorizadas."
  },
  {
    "scope_code": "SA",
    "scope_category": "TERRITORIAL",
    "canonical_order": 9,
    "semantics": "Un área concreta dentro de una sede autorizada."
  },
  {
    "scope_code": "AAT",
    "scope_category": "TERRITORIAL",
    "canonical_order": 10,
    "semantics": "Subconjunto de áreas asignadas al actor que coincide con un tipo de área exacto."
  },
  {
    "scope_code": "ATW",
    "scope_category": "TERRITORIAL",
    "canonical_order": 11,
    "semantics": "Conjunto transversal de áreas de un tipo exacto, siempre acotado por una sede o conjunto superior de sedes autorizado."
  },
  {
    "scope_code": "CTX",
    "scope_category": "OPERATIONAL_CONTEXT",
    "canonical_order": 12,
    "semantics": "Territorio efectivo resuelto por el carril operativo. No aporta por sí mismo turno, check-in ni área activa."
  },
  {
    "scope_code": "OWN",
    "scope_category": "OWNERSHIP",
    "canonical_order": 13,
    "semantics": "Restricción o variante sobre recurso propio, creado o atribuido según el contrato del recurso. Puede combinarse con territorio, pero nunca ampliarlo."
  }
] as const satisfies readonly PermissionScopeDefinition[];

export const PERMISSION_SCOPE_BY_CODE = {
  "NT": PERMISSION_SCOPE_DEFINITIONS[0],
  "ORG": PERMISSION_SCOPE_DEFINITIONS[1],
  "G": PERMISSION_SCOPE_DEFINITIONS[2],
  "AS": PERMISSION_SCOPE_DEFINITIONS[3],
  "SS": PERMISSION_SCOPE_DEFINITIONS[4],
  "AST": PERMISSION_SCOPE_DEFINITIONS[5],
  "TST": PERMISSION_SCOPE_DEFINITIONS[6],
  "AA": PERMISSION_SCOPE_DEFINITIONS[7],
  "SA": PERMISSION_SCOPE_DEFINITIONS[8],
  "AAT": PERMISSION_SCOPE_DEFINITIONS[9],
  "ATW": PERMISSION_SCOPE_DEFINITIONS[10],
  "CTX": PERMISSION_SCOPE_DEFINITIONS[11],
  "OWN": PERMISSION_SCOPE_DEFINITIONS[12],
} as const satisfies PermissionScopeByCode;

export const TERRITORIAL_SCOPE_CODES = [
  "G",
  "AS",
  "SS",
  "AST",
  "TST",
  "AA",
  "SA",
  "AAT",
  "ATW",
] as const satisfies readonly TerritorialScope[];

export const NON_TERRITORIAL_SCOPE_CODES = [
  "NT",
  "ORG",
] as const satisfies readonly NonTerritorialScope[];

export const OPERATIONAL_CONTEXT_SCOPE_CODES = [
  "CTX",
] as const satisfies readonly OperationalContextScope[];

export const OWNERSHIP_SCOPE_CODES = [
  "OWN",
] as const satisfies readonly OwnershipScope[];

const PERMISSION_SCOPE_CODE_SET = new Set<string>(PERMISSION_SCOPE_CODES);

export function isPermissionScopeCode(value: unknown): value is PermissionScopeCode {
  return typeof value === "string" && PERMISSION_SCOPE_CODE_SET.has(value);
}

export function isAllowedScopeSet(value: unknown): value is AllowedScopeSet {
  if (!Array.isArray(value)) return false;
  const seen = new Set<string>();
  for (const member of value) {
    if (!isPermissionScopeCode(member) || seen.has(member)) return false;
    seen.add(member);
  }
  return true;
}

export function isMaximumScope(value: unknown): value is MaximumScope {
  return isPermissionScopeCode(value);
}
