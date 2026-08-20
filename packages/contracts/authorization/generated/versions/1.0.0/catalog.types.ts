// GENERATED FILE. DO NOT EDIT.
// Source: authorization/catalog/versions/1.0.0/applications.json

export type AppCode = "shell" | "anima" | "viso" | "nexo" | "fogo" | "origo" | "pulso" | "numera" | "aura" | "pass";

export type AppDomain = "laboral" | "cliente";

export type AppKind = "hub" | "hybrid" | "administrative" | "operational" | "customer";

export type RoadmapScope = "core" | "deferred" | "adjacent";

export type ApplicationLifecycleStatus =
  | "active"
  | "deprecated"
  | "retired"
  | "reserved";

export interface ApplicationDefinition {
  readonly app_code: AppCode;
  readonly display_name: string;
  readonly app_kind: AppKind;
  readonly domain: AppDomain;
  readonly roadmap_scope: RoadmapScope;
  readonly lifecycle_status: ApplicationLifecycleStatus;
  readonly repository_owner?: string;
  readonly permission_namespace: AppCode;
  readonly is_authorization_catalog_member: boolean;
}

export type ApplicationByCode = Readonly<Record<AppCode, ApplicationDefinition>>;
