## BLOQUE E

**Contexto y decisión de autorización unificados**

CONTRATOS

### [ ] AUTH-CTX-001 — Diseñar AccessContext canónico
### [ ] AUTH-CTX-002 — Diseñar AuthorizationDecision canónica
### [ ] AUTH-CTX-003 — Diseñar SimulationContext separado
### [ ] AUTH-CTX-004 — Versionar los contratos de respuesta

ACCESS CONTEXT

### [ ] AUTH-CTX-005 — Incluir principal autenticado
### [ ] AUTH-CTX-006 — Incluir actor efectivo
### [ ] AUTH-CTX-007 — Incluir identidad laboral o de dominio
### [ ] AUTH-CTX-008 — Incluir rol base vigente
### [ ] AUTH-CTX-009 — Incluir cobertura administrativa por sede y área
### [ ] AUTH-CTX-010 — Incluir turno publicado y vigente
### [ ] AUTH-CTX-011 — Incluir sesión de check-in activa
### [ ] AUTH-CTX-012 — Incluir rol operativo efectivo
### [ ] AUTH-CTX-013 — Incluir sede y área operativas
### [ ] AUTH-CTX-014 — Incluir contexto de dispositivo compartido
### [ ] AUTH-CTX-015 — Incluir razones estructuradas de invalidez

AUTHORIZATION DECISION

### [ ] AUTH-CTX-016 — Incluir aplicación y permiso solicitado
### [ ] AUTH-CTX-017 — Incluir authorization_requirement
### [ ] AUTH-CTX-018 — Incluir recurso y territorio resueltos
### [ ] AUTH-CTX-019 — Incluir decisión del carril base
### [ ] AUTH-CTX-020 — Incluir decisión del carril operativo
### [ ] AUTH-CTX-021 — Incluir allows coincidentes
### [ ] AUTH-CTX-022 — Incluir denegaciones coincidentes
### [ ] AUTH-CTX-023 — Incluir decisión final y razones
### [ ] AUTH-CTX-024 — Incluir datos de auditoría

DISEÑO DE IMPLEMENTACIÓN CANÓNICA

### [ ] AUTH-CTX-025 — Diseñar contrato SQL de get_access_context
### [ ] AUTH-CTX-026 — Diseñar contrato canónico de evaluate_authorization
### [ ] AUTH-CTX-027 — Definir consumo centralizado del contexto por las aplicaciones
### [ ] AUTH-CTX-028 — Definir compatibilidad temporal con get_operational_context
### [ ] AUTH-CTX-029 — Definir estrategia de invalidación y caché
### [ ] AUTH-CTX-030 — Definir plan de pruebas contractuales del contexto y la decisión

Regla de implementación

AUTH-CTX-025 a AUTH-CTX-030 permanecen documentales dentro del BLOQUE E.

Durante este bloque no se crearán:

- funciones SQL;
- RPC;
- migraciones;
- políticas RLS;
- grants;
- triggers;
- cambios físicos en Supabase.

Su implementación deberá ejecutarse en el BLOQUE R después de aprobar:

- la arquitectura de esquemas;
- la capa expuesta de RPC;
- la capa privada de helpers;
- la política de SECURITY DEFINER;
- la política de grants y RLS;
- el plan de transición;
- el mecanismo de compatibilidad con consumidores existentes.

Resultado esperado

AccessContext
{
  principal,
  actor_effective,
  domain_identity,
  employee,
  base_role,
  assigned_sites,
  assigned_areas,
  active_shift,
  active_checkin_session,
  operational_role,
  operational_site,
  operational_area,
  device_context,
  structural_issues
}

AuthorizationDecision
{
  app_code,
  permission_code,
  authorization_requirement,
  resource,
  base_decision,
  operational_decision,
  matched_allows,
  structural_denies,
  actor_wide_denies,
  lane_denies,
  blocked_reasons,
  final_decision
}

SimulationContext
{
  real_actor,
  simulated_subject,
  hypothetical_context,
  expires_at,
  would_allow,
  would_deny,
  indeterminate
}

