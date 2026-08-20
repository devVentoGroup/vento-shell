// GENERATED FILE. DO NOT EDIT.
// Source: authorization/catalog/versions/1.0.0/applications.json

import type {
  AppCode,
  ApplicationByCode,
  ApplicationDefinition,
} from "./catalog.types.js";

export const APPLICATION_CODES = [
  "shell",
  "anima",
  "viso",
  "nexo",
  "fogo",
  "origo",
  "pulso",
  "numera",
  "aura",
  "pass",
] as const satisfies readonly AppCode[];

export const APPLICATIONS = [
  {
    app_code: "shell",
    display_name: "Vento OS",
    app_kind: "hub",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-shell",
    permission_namespace: "shell",
    is_authorization_catalog_member: true
  },
  {
    app_code: "anima",
    display_name: "ANIMA",
    app_kind: "hybrid",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-anima",
    permission_namespace: "anima",
    is_authorization_catalog_member: true
  },
  {
    app_code: "viso",
    display_name: "VISO",
    app_kind: "administrative",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-viso",
    permission_namespace: "viso",
    is_authorization_catalog_member: true
  },
  {
    app_code: "nexo",
    display_name: "NEXO",
    app_kind: "hybrid",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-nexo",
    permission_namespace: "nexo",
    is_authorization_catalog_member: true
  },
  {
    app_code: "fogo",
    display_name: "FOGO",
    app_kind: "operational",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-fogo",
    permission_namespace: "fogo",
    is_authorization_catalog_member: true
  },
  {
    app_code: "origo",
    display_name: "ORIGO",
    app_kind: "hybrid",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-origo",
    permission_namespace: "origo",
    is_authorization_catalog_member: true
  },
  {
    app_code: "pulso",
    display_name: "PULSO",
    app_kind: "operational",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-pulso",
    permission_namespace: "pulso",
    is_authorization_catalog_member: true
  },
  {
    app_code: "numera",
    display_name: "NUMERA",
    app_kind: "hybrid",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-numera",
    permission_namespace: "numera",
    is_authorization_catalog_member: true
  },
  {
    app_code: "aura",
    display_name: "AURA",
    app_kind: "administrative",
    domain: "laboral",
    roadmap_scope: "deferred",
    lifecycle_status: "active",
    permission_namespace: "aura",
    is_authorization_catalog_member: true
  },
  {
    app_code: "pass",
    display_name: "Vento Pass",
    app_kind: "customer",
    domain: "cliente",
    roadmap_scope: "adjacent",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-pass",
    permission_namespace: "pass",
    is_authorization_catalog_member: true
  }
] as const satisfies readonly ApplicationDefinition[];

export const APPLICATION_BY_CODE = {
  shell: APPLICATIONS[0],
  anima: APPLICATIONS[1],
  viso: APPLICATIONS[2],
  nexo: APPLICATIONS[3],
  fogo: APPLICATIONS[4],
  origo: APPLICATIONS[5],
  pulso: APPLICATIONS[6],
  numera: APPLICATIONS[7],
  aura: APPLICATIONS[8],
  pass: APPLICATIONS[9],
} as const satisfies ApplicationByCode;

const APPLICATION_CODE_SET = new Set<string>(APPLICATION_CODES);

export function isAppCode(value: unknown): value is AppCode {
  return typeof value === "string" && APPLICATION_CODE_SET.has(value);
}
