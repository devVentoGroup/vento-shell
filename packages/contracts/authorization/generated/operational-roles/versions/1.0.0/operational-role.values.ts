// GENERATED FILE. DO NOT EDIT.
// Source: authorization/catalog/operational-roles/versions/1.0.0/operational-roles.json

import type { OperationalRoleCode } from "./operational-role.types.js";

export const OPERATIONAL_ROLE_CODES = [
  "cajero_satelite",
  "barista_satelite",
  "cocinero_satelite",
  "servicio_salon",
  "mostrador_satelite",
  "operador_integral_satelite",
  "produccion_cocina",
  "produccion_panaderia",
  "produccion_reposteria",
  "bodeguero",
  "conductor_logistica",
  "gerencia_operativa",
] as const satisfies readonly OperationalRoleCode[];

const OPERATIONAL_ROLE_CODE_SET = new Set<string>(OPERATIONAL_ROLE_CODES);

export function isOperationalRoleCode(value: unknown): value is OperationalRoleCode {
  return typeof value === "string" && OPERATIONAL_ROLE_CODE_SET.has(value);
}
