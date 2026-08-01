### ✅ SUPA-TRANS-003 — Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos

**Estado:** APROBADA
**Tarea anterior:** `SUPA-TRANS-002 — Clasificar cada objeto como conservar, mover, fusionar, dividir, renombrar o retirar` — APROBADA
**Siguiente tarea reservada:** `SUPA-TRANS-004 — Definir orden de migración por dominio`
**Tipo de tarea:** inventario documental y técnico read-only; sin DDL o DML persistente, migraciones, backfills, cambios de RLS, despliegues, renombres, retiros ni cambios de configuración

#### 1. Resultado concreto

Esta tarea fija el registro de dependencias que deberá acompañar las 970 identidades de `TRANSITION-MAP-001@1.0.0` y `DISPOSITION-MAP-002@1.0.2`.

El resultado canónico es:

```text
DEPENDENCY-MAP-003@1.0.0
```

Una dependencia es cualquier relación demostrable o candidata que pueda romperse, ampliar autoridad, duplicar efectos, perder historia o dejar un consumidor incompatible durante la transición. La ausencia de una clave foránea o de una coincidencia literal en código no demuestra ausencia de dependencia.

#### 2. Fuentes y corte de evidencia

| Fuente                               | Uso en esta tarea                                                        |
| ------------------------------------ | ------------------------------------------------------------------------ |
| `TRANSITION-MAP-001@1.0.0`           | conserva las 970 identidades y sus claves estables                       |
| `DISPOSITION-MAP-002@1.0.2`          | conserva disposición, grupo, gates y autoridad de convergencia           |
| catálogo read-only de `vento-os-dev` | FK, vistas, funciones, triggers, RLS, publicaciones y relaciones         |
| `SUPA-AUD-022` y `SUPA-AUD-023`      | owner, consumidores, procesos, datos, RPC, eventos y aplicaciones        |
| `SUPA-ARC-001` a `SUPA-ARC-025`      | fronteras, autoridad, contratos, seguridad y política de transición      |
| repositorios `vento-*` del workspace | referencias literales de cliente a tablas, RPC, Storage y Edge Functions |
| stack local de `vento-shell`         | comprobación de paridad disponible; `cron.job` ausente en el corte local |

La evidencia remota fue leída el 2026-07-31 sin ejecutar cambios persistentes.

#### 3. Contrato de cada dependencia

Cada arista del registro deberá conservar:

```text
source_transition_key
dependent_key
dependency_class
dependency_direction
access_or_effect
application_or_role
evidence_mode
evidence_reference
confidence
resolution_state
blocking_reason
owning_followup_task
```

Catálogo cerrado de `dependency_class`:

```text
FOREIGN_KEY
VIEW_SOURCE
FUNCTION_RELATION
FUNCTION_FUNCTION
RPC_CLIENT
RLS_POLICY
RLS_HELPER
TRIGGER_RELATION
TRIGGER_FUNCTION
REALTIME_PUBLICATION
STORAGE_CLIENT
EDGE_CLIENT
CRON_TARGET
APPLICATION_RELATION
DATA_HISTORY_OR_BACKFILL
EXTERNAL_OR_DYNAMIC_CONSUMER
```

Catálogo de evidencia:

```text
CONFIRMED_CATALOG
CONFIRMED_CODE_LITERAL
CONFIRMED_CANONICAL_AUDIT
LEXICAL_BODY_CANDIDATE
DYNAMIC_OR_EXTERNAL_REVIEW
NEGATIVE_SEARCH_ONLY
```

`NEGATIVE_SEARCH_ONLY` nunca podrá cerrar un objeto como `SIN_CONSUMIDORES`.

#### 4. Línea base materializada de base de datos

| Familia                                |                  Aristas u objetos | Cobertura confirmada                                                     |
| -------------------------------------- | ---------------------------------: | ------------------------------------------------------------------------ |
| relaciones gobernadas                  |                            **379** | nueve schemas del mapa `001`                                             |
| claves foráneas                        |                    **795 aristas** | 276 relaciones hijas y 106 relaciones padre                              |
| dependencias de vistas                 |                    **149 aristas** | las 62 vistas tienen al menos una fuente catalogada                      |
| triggers                               | **197 aristas relación → trigger** | 155 relaciones y 71 funciones ejecutoras                                 |
| políticas RLS                          |                            **790** | 300 relaciones protegidas                                                |
| dependencias policy → función          |                  **1.156 aristas** | 711 políticas con helper o función dependiente                           |
| dependencias policy → relación         |                    **972 aristas** | las 790 políticas conservan relación protegida y referencias catalogadas |
| referencias léxicas función → relación |                 **868 candidatas** | 280 funciones; requieren confirmación por parser o prueba                |
| referencias léxicas función → función  |                 **265 candidatas** | 148 funciones; requieren confirmación por firma                          |
| publicación `supabase_realtime`        |                   **6 relaciones** | inventario nominal cerrado para este corte                               |

PostgreSQL no registra de forma completa en `pg_depend` las referencias internas de cuerpos PL/pgSQL. Por ello, las 868 y 265 aristas léxicas son candidatas trazables, no dependencias estructurales confirmadas ni autorización para retirar código.

#### 5. Dependencias de datos

Las 795 claves foráneas son dependencias mínimas, no el universo completo. Cada relación deberá declarar adicionalmente:

- escritoras directas y funciones que cambian estado;
- vistas y proyecciones que leen sus columnas;
- triggers `BEFORE`, `AFTER` o `INSTEAD OF`, evento y orden;
- políticas, helpers y roles efectivos;
- historial, ledger, auditoría, archivos y eventos relacionados;
- imports, hojas, POS, webhooks, jobs o integraciones sin FK;
- volumen, nulabilidad, defaults y calidad que condicionen `SUPA-TRANS-005`;
- claves naturales, aliases y equivalencias que no puedan inferirse por texto.

Las fusiones `ATTENDANCE_LOGS` y `SITE_OPERATIONAL_ROLES` permanecen bloqueadas hasta reconciliar relaciones entrantes, salientes, automatismos, consumidores y datos divergentes. Las divisiones documentales permanecen bloqueadas hasta separar owner, sensibilidad, retención, metadata, binario y referencias.

#### 6. Dependencias RLS y exposición

Estado observado:

| Control                                    | Resultado |
| ------------------------------------------ | --------: |
| relaciones con RLS activo                  |   **305** |
| políticas sobre relaciones gobernadas      |   **790** |
| relaciones con RLS activo y cero políticas |     **5** |
| relaciones persistidas con RLS desactivado |    **12** |

RLS activo sin políticas:

```text
pass.site_business_hours
pass.site_delivery_slots
pass.site_schedule_exception_resolutions
pass.site_schedule_exceptions
public.client_push_tokens
```

Relaciones persistidas con RLS desactivado:

```text
app_private.delivery_pin_secrets
viso.demand_forecasts
viso.demand_history_hourly
viso.employee_availability
viso.employee_planning_limits
viso.employee_shift_preferences
viso.shift_generation_candidate_items
viso.shift_generation_candidates
viso.shift_generation_runs
viso.site_operational_roles
viso.site_planning_rules
viso.site_staffing_requirements
```

`app_private.delivery_pin_secrets` no se trata como tabla pública por tener RLS desactivado: su ACL y frontera server-only se revisan por separado. Las once relaciones `viso.*` no adquieren autorización de cliente por estar fuera del schema `public`. `SUPA-TRANS-010` resolverá seguridad y rendimiento; esta tarea únicamente conserva dependencia, exposición y gate.

#### 7. Dependencias Realtime

La publicación `supabase_realtime` contiene:

```text
public.order_conversations
public.order_delivery_sessions
public.order_messages
public.order_status_events
public.orders
public.users
```

Cada una queda bloqueada frente a movimiento, división, renombre o retiro hasta identificar canales, filtros, eventos, replica identity, volumen, autorización y consumidores efectivos. Una publicación de tabla no demuestra que exista consumidor activo; una búsqueda de `.channel(...)` sin literal tampoco demuestra ausencia.

#### 8. Dependencias de aplicaciones

El barrido estático de archivos TypeScript y JavaScript del workspace encontró el siguiente límite inferior de identificadores literales:

| Repositorio       | tablas/vistas |  RPC | buckets | Edge Functions |
| ----------------- | ------------: | ---: | ------: | -------------: |
| `vento-anima`     |            24 |   10 |       1 |              8 |
| `vento-fogo`      |            25 |    8 |       0 |              0 |
| `vento-group-web` |             2 |    0 |       0 |              0 |
| `vento-nexo`      |            90 |   40 |       0 |              0 |
| `vento-numera`    |            18 |    5 |       0 |              0 |
| `vento-origo`     |            29 |    9 |       0 |              0 |
| `vento-pass`      |            27 |   12 |       0 |              5 |
| `vento-pulso`     |            30 |   15 |       0 |              1 |
| `vento-shell`     |            31 |   14 |       0 |              0 |
| `vento-talento`   |            12 |    4 |       0 |              0 |
| `vento-viso`      |            97 |   14 |       0 |              1 |
| `vento-vital`     |             0 |    0 |       0 |              0 |

El conjunto combinado contiene al menos **217 identificadores literales de relación**, **102 nombres de RPC**, **13 Edge Functions** y **1 bucket**. Los conteos por repositorio se solapan y no deben sumarse como objetos únicos.

El barrido literal no cubre identificadores construidos, wrappers, SQL dinámico, secretos de integración, clientes externos, ramas no presentes, dashboards, hojas ni consumidores manuales. Esos casos quedan `DYNAMIC_OR_EXTERNAL_REVIEW`; nunca `SIN_CONSUMIDORES`.

#### 9. Edge Functions y Storage

Las trece Edge Functions con invocación literal localizada son:

```text
account-deletion
announcement-notify
employee-delete
order-message-notify
pass-address-search
pass-delivery-quote
pass-register-push-token
payments-create-intent
register-push-token
shift-publish-notify
staff-invitations-cancel
staff-invitations-create
staff-invitations-resend
```

Las otras once Edge Functions desplegadas no se declaran huérfanas: pueden ser webhooks, callbacks, jobs o endpoints externos. El bucket `documents` tiene referencia literal localizada; los demás buckets requieren correlación con URL, policy, contrato o consumidor externo antes de cualquier decisión de salida.

#### 10. Triggers, funciones y RPC

Cada uno de los 197 triggers conserva obligatoriamente:

- relación padre;
- función ejecutora por firma;
- momento, evento, nivel y condición;
- privilegio y `security_definer` de la función;
- tablas o funciones afectadas por el cuerpo;
- relación con otros triggers del mismo evento;
- consumidor funcional y efecto empresarial.

Las 348 funciones se identifican por firma PostgreSQL, no solo por nombre. Una coincidencia de `.rpc('nombre')` sin resolución de overload permanece bloqueada. Las funciones de trigger no son RPC por su presencia en `public`, y una función `SECURITY DEFINER` no adquiere autorización empresarial por ejecutarse correctamente.

La guardia mensual de VISO queda ligada a `public.employee_shifts`, su trigger, callers administrativos, owner, grants, `search_path`, regla provisional de 186 horas y pruebas posteriores. Su concurrencia pertenece a `SUPA-TRANS-008`; seguridad y coste a `SUPA-TRANS-010`.

#### 11. Dependencias cron y paridad local

Los siete cron jobs permanecen vinculados a scheduler, comando o endpoint, secreto, dominio propietario, observabilidad y resultado empresarial. El stack local activo de `vento-shell` no contiene `cron.job`; por eso `SUPA-TRANS-001_TRANSITION_MAP.sql` no puede reproducir localmente el bloque cron completo en este corte.

Esta diferencia se clasifica:

```text
LOCAL_PLATFORM_PARITY_GAP
```

No autoriza crear jobs, extensiones ni datos locales dentro de esta tarea. La paridad corresponde a `SUPA-TRANS-013` y el gate ejecutable a `SUPA-TRANS-015`.

#### 12. Estados de resolución

Cada identidad y arista usará exactamente uno:

| Estado                            | Significado                                                                       |
| --------------------------------- | --------------------------------------------------------------------------------- |
| `RESOLVED_CONFIRMED`              | dependencia demostrada por catálogo, código o auditoría canónica                  |
| `RESOLVED_NEGATIVE_WITH_SCOPE`    | búsqueda negativa con alcance explícito; no equivale a cero consumidores globales |
| `CANDIDATE_REQUIRES_CONFIRMATION` | referencia léxica, dinámica o ambigua                                             |
| `BLOCKED_EXTERNAL_CONSUMER`       | consumidor fuera del workspace o sin evidencia accesible                          |
| `BLOCKED_SIGNATURE_OR_OVERLOAD`   | RPC sin firma única resoluble                                                     |
| `BLOCKED_SECURITY_BOUNDARY`       | RLS, grants, definer, secreto o exposición sin resolución                         |
| `BLOCKED_DATA_RELATIONSHIP`       | datos, historia o relación no representada completamente por FK                   |
| `BLOCKED_LOCAL_PARITY`            | objeto remoto sin representación local equivalente                                |

Ningún estado bloqueado impide documentar `SUPA-TRANS-004`; sí impide ejecutar la migración física del objeto afectado.

#### 13. Entrega a tareas siguientes

| Trabajo derivado                                          | Tarea propietaria |
| --------------------------------------------------------- | ----------------- |
| orden topológico y oleadas por dominio                    | `SUPA-TRANS-004`  |
| reconciliación, calidad y backfill                        | `SUPA-TRANS-005`  |
| vistas, wrappers y aliases temporales                     | `SUPA-TRANS-006`  |
| adaptación exacta de repositorios y consumidores externos | `SUPA-TRANS-007`  |
| writers, concurrencia, doble escritura e idempotencia     | `SUPA-TRANS-008`  |
| pruebas de dependencias y regresión                       | `SUPA-TRANS-009`  |
| RLS, grants, definer, exposición y rendimiento            | `SUPA-TRANS-010`  |
| rollback por componente conectado                         | `SUPA-TRANS-011`  |
| cero consumidores y retiro progresivo                     | `SUPA-TRANS-012`  |
| paridad local, staging y producción                       | `SUPA-TRANS-013`  |
| tipos, firmas, contratos y documentación                  | `SUPA-TRANS-014`  |
| materialización de gates en roadmap                       | `SUPA-TRANS-015`  |

No queda un hallazgo accionable sin tarea propietaria.

#### 14. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.** Esta tarea no crea, modifica ni elimina identificadores `TREQ-*`; aplica requisitos existentes, especialmente:

```text
TREQ-SUPABASE-255
TREQ-SUPABASE-265 a TREQ-SUPABASE-266
TREQ-SUPABASE-274
TREQ-SUPABASE-287
TREQ-SUPABASE-294 a TREQ-SUPABASE-295
TREQ-SUPABASE-302
TREQ-SUPABASE-425 a TREQ-SUPABASE-427
TREQ-SUPABASE-445 a TREQ-SUPABASE-452
TREQ-SUPABASE-510 a TREQ-SUPABASE-513
TREQ-SUPABASE-518
TREQ-SUPABASE-522
TREQ-SUPABASE-549
TREQ-SUPABASE-619
TREQ-SUPABASE-636 a TREQ-SUPABASE-647
TREQ-SUPABASE-682 a TREQ-SUPABASE-684
TREQ-SUPABASE-1696 a TREQ-SUPABASE-1735
TREQ-DATA-173
TREQ-DATA-183
TREQ-DATA-196
TREQ-DATA-207
TREQ-DATA-213
TREQ-DATA-217
TREQ-DATA-223
TREQ-DATA-227
TREQ-DATA-229
TREQ-DATA-237
```

Como no cambia filas del registro `04A`, no requiere reemplazar ese archivo en esta propuesta.

#### 15. Criterios de aceptación

- [x] conserva las 970 identidades y sus claves de transición;
- [x] separa dependencias confirmadas, candidatas, negativas y externas;
- [x] registra FK, vistas, funciones, triggers, RLS, Realtime, aplicaciones, Storage, Edge y cron;
- [x] identifica 795 FK, 149 aristas de vistas y 197 triggers;
- [x] registra las 790 políticas y sus dependencias catalogadas;
- [x] no convierte referencias léxicas en autoridad ni certeza estructural;
- [x] preserva las cinco relaciones RLS sin policy y las doce persistidas sin RLS;
- [x] conserva las seis relaciones Realtime;
- [x] inventaría el límite inferior de consumidores en los repositorios disponibles;
- [x] no declara huérfano un objeto por ausencia de coincidencia literal;
- [x] clasifica la ausencia local de `cron.job` sin crear objetos de prueba;
- [x] enruta cada resolución pendiente a `SUPA-TRANS-004` a `SUPA-TRANS-015`;
- [x] no ejecuta cambios remotos ni físicos.

#### 16. Continuidad preservada

```text
SUPA-TRANS-003 — APROBADA
        ↓
SUPA-TRANS-004 — ÚLTIMA APROBADA
        ↓
SUPA-TRANS-005 — TAREA ACTUAL; NO INICIADA
```

La aprobación de esta tarea quedó incorporada sin iniciar trabajo de `SUPA-TRANS-005`.


