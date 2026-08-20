// GENERATED FILE. DO NOT EDIT.
// Source: authorization/catalog/scopes/versions/1.0.0/scopes.json

export type PermissionScopeCode =
  | "NT"
  | "ORG"
  | "G"
  | "AS"
  | "SS"
  | "AST"
  | "TST"
  | "AA"
  | "SA"
  | "AAT"
  | "ATW"
  | "CTX"
  | "OWN";

export type PermissionScopeCategory =
  | "NON_TERRITORIAL"
  | "TERRITORIAL"
  | "OPERATIONAL_CONTEXT"
  | "OWNERSHIP";

export type AllowedScopeSet = readonly PermissionScopeCode[];

export type MaximumScope = PermissionScopeCode;

export type TerritorialScope =
  | "G"
  | "AS"
  | "SS"
  | "AST"
  | "TST"
  | "AA"
  | "SA"
  | "AAT"
  | "ATW";

export type NonTerritorialScope =
  | "NT"
  | "ORG";

export type OperationalContextScope =
  | "CTX";

export type OwnershipScope =
  | "OWN";

export interface PermissionScopeDefinition {
  readonly scope_code: PermissionScopeCode;
  readonly scope_category: PermissionScopeCategory;
  readonly canonical_order: number;
  readonly semantics: string;
}

export type PermissionScopeByCode = Readonly<Record<PermissionScopeCode, PermissionScopeDefinition>>;
