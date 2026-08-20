// GENERATED FILE. DO NOT EDIT.
// Source: authorization/catalog/base-roles/versions/1.1.0/base-roles.json

import type { BaseRoleCode } from "./base-role.types.js";

export const BASE_ROLE_CODES = [
  "propietario",
  "gerente_general",
  "gerente",
  "supervisor",
  "auxiliar_administrativa",
  "contador",
  "marketing",
  "trabajador_operativo",
] as const satisfies readonly BaseRoleCode[];

const BASE_ROLE_CODE_SET = new Set<string>(BASE_ROLE_CODES);

export function isBaseRoleCode(value: unknown): value is BaseRoleCode {
  return typeof value === "string" && BASE_ROLE_CODE_SET.has(value);
}
