### ✅ SUPA-TRANS-004 — Definir orden de migración por dominio

**Estado:** APROBADA  
**Tarea anterior:** `SUPA-TRANS-003 — Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos` — APROBADA  
**Siguiente tarea reservada:** `SUPA-TRANS-005 — Diseñar estrategia de reconciliación y backfill`  
**Tipo de tarea:** diseño documental del orden de transición; sin DDL, DML, backfills, despliegues, cambios de RLS, escrituras remotas ni movimiento físico de objetos

#### 1. Resultado concreto

Esta tarea fija el orden topológico por dominios para las 26 responsabilidades objetivo `VSCHEMA-001` a `VSCHEMA-026`, preservando las 970 identidades de `TRANSITION-MAP-001@1.0.0`, sus disposiciones en `DISPOSITION-MAP-002@1.0.2` y las dependencias de `DEPENDENCY-MAP-003@1.0.0`.

El resultado canónico es:

```text
MIGRATION-ORDER-004@1.0.0
```

El orden define cuándo puede entrar cada dominio a preparación, materialización, paridad, cambio de consumidores y certificación. No autoriza ejecución física y no transforma una dependencia candidata en dependencia resuelta.

#### 2. Fuentes canónicas aplicadas

| Fuente | Uso en esta tarea |
| --- | --- |
| `TRANSITION-MAP-001@1.0.0` | universo cerrado de 970 identidades y claves estables |
| `DISPOSITION-MAP-002@1.0.2` | disposición, destino, autoridad y gates por identidad |
| `DEPENDENCY-MAP-003@1.0.0` | aristas confirmadas, candidatas, dinámicas, externas y bloqueadas |
| `SUPA-ARC-001` a `SUPA-ARC-025` | fronteras de autoridad, responsabilidades `VSCHEMA-*`, contratos, seguridad y retiro |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` | controles vigentes aplicables al orden, identidad, compatibilidad y gates |

#### 3. Unidad de avance

La unidad mínima de avance es un `migration_unit`, no un schema completo. Cada unidad conserva:

```text
migration_unit_id
transition_keys
owner_schema
wave_id
intra_wave_order
predecessor_units
dependency_state
compatibility_contract
consumer_cohort
data_reconciliation_gate
security_gate
rollback_unit
entry_evidence
exit_evidence
status
```

Un schema puede tener unidades en momentos distintos cuando contiene maestros, hechos, proyecciones o compatibilidad con dependencias diferentes. La pertenencia a una misma oleada no implica paralelismo: prevalecen `predecessor_units` y las aristas de `DEPENDENCY-MAP-003@1.0.0`.

#### 4. Secuencia obligatoria dentro de cada unidad

Cada unidad sigue este orden cerrado:

1. congelar nuevas fuentes de autoridad en `public` y en schemas legados;
2. confirmar identidad, disposición, owner y consumidores conocidos;
3. resolver o aislar dependencias bloqueantes;
4. materializar el destino canónico sin retirar el origen;
5. publicar contrato de compatibilidad, RLS, grants y observabilidad;
6. demostrar paridad de estructura, datos, efectos, seguridad y rollback;
7. mover consumidores por cohortes controladas;
8. demostrar ausencia de consumidores ocultos dentro del alcance declarado;
9. certificar la nueva autoridad;
10. habilitar el retiro posterior de aliases, wrappers y fuentes antiguas.

Ninguna unidad puede saltar pasos porque otra unidad de su oleada haya finalizado.

#### 5. Carriles transversales

Los siguientes carriles acompañan todas las oleadas y no se posponen como limpieza final:

| Carril | Regla de orden |
| --- | --- |
| identidad y autorización | `identity_access` publica contratos y referencias estables antes del cambio de cualquier consumidor; los datos laborales, de cliente o dispositivo permanecen en sus dominios propietarios |
| evidencia y trazabilidad | `business_records` admite referencias estables desde cada oleada, sin apropiarse del estado empresarial |
| eventos e integraciones | todo evento conserva owner, versión, idempotencia, consumidor, replay y compatibilidad antes del cambio de escritor |
| RLS, grants y código privilegiado | se certifican por unidad antes de exponer el destino o redirigir tráfico |
| datos y rollback | reconciliación, backfill, doble escritura y reversa deben estar definidos antes de mover consumidores |
| tipos y contratos | firmas, aliases y tipos generados se versionan por cohorte, nunca mediante un cambio global no trazado |
| observabilidad | cada unidad conserva señales de paridad, divergencia, errores, latencia y decisión de reversa |

#### 6. Orden canónico por oleadas

| Oleada | Orden interno obligatorio | Responsabilidad | Razón topológica principal |
| --- | --- | --- | --- |
| `W0_CONTROL_FOUNDATION` | `001` | `VSCHEMA-001 org_governance` | publica organización, sedes, tenant, unidades y referencias comunes |
|  | `002` | `VSCHEMA-023 identity_access` | estabiliza sujeto, cuenta, sesión, rol y decisión de acceso sin asumir datos de otros dominios |
|  | `003` | `VSCHEMA-022 technology_operations` | establece configuración, secretos, webhooks, jobs y controles técnicos necesarios para operar oleadas |
| `W1_PEOPLE_OPERATIONS` | `001` | `VSCHEMA-002 recruiting` | prepara candidatos y entrega explícita hacia workforce |
|  | `002` | `VSCHEMA-003 workforce` | publica trabajador y relación laboral para los consumidores posteriores |
|  | `003` | `VSCHEMA-004 work_scheduling` | depende de workforce y publica el plan operativo |
|  | `004` | `VSCHEMA-005 attendance` | consume trabajador y planificación; produce asistencia real |
|  | `005` | `VSCHEMA-006 payroll` | consume hechos laborales y de asistencia ya estabilizados |
|  | `006` | `VSCHEMA-007 operational_compliance` | consolida cumplimiento sobre referencias laborales y operativas estables |
| `W2_PRODUCT_AND_OFFER` | `001` | `VSCHEMA-008 product_catalog` | publica producto, presentación, unidad y taxonomía compartida |
|  | `002` | `VSCHEMA-009 recipes` | consume catálogo y publica composición y rendimiento |
|  | `003` | `VSCHEMA-010 commercial_offer` | consume catálogo y publica disponibilidad, precio y oferta comercial |
| `W3_SUPPLY_AND_PRODUCTION` | `001` | `VSCHEMA-011 procurement` | inicia abastecimiento sobre catálogo y referencias organizacionales estables |
|  | `002` | `VSCHEMA-012 inventory` | recibe movimientos de abastecimiento y se vuelve autoridad de existencias |
|  | `003` | `VSCHEMA-013 assets` | estabiliza activos y mantenimientos vinculados a sedes y operación |
|  | `004` | `VSCHEMA-020 facilities` | coordina sede, activos, compras y cumplimiento sin absorber sus autoridades |
|  | `005` | `VSCHEMA-014 production` | consume catálogo, recetas e inventario y publica resultados productivos |
| `W4_COMMERCIAL_FULFILLMENT` | `001` | `VSCHEMA-017 customer_engagement` | estabiliza perfil, consentimiento y relación con cliente antes del ciclo de pedido |
|  | `002` | `VSCHEMA-015 sales_orders` | consume cliente, catálogo y oferta; publica la orden comercial |
|  | `003` | `VSCHEMA-016 payments` | registra hechos de pago contra órdenes y sujetos estables |
|  | `004` | `VSCHEMA-018 logistics` | acepta la entrega de órdenes y coordina cumplimiento con inventario y sedes |
| `W5_RECORD_AND_ECONOMIC_CLOSURE` | `001` | `VSCHEMA-019 finance` | consume hechos económicos estabilizados de compras, inventario, órdenes, pagos y producción |
|  | `002` | `VSCHEMA-024 business_records` | consolida vínculos documentales sobre identidades empresariales ya estables; sus adaptadores acompañaron cada oleada |
|  | `003` | `VSCHEMA-021 marketing` | activa canales sobre oferta, consentimiento y cliente sin asumir sus autoridades |
| `W6_DERIVED_AND_CONTINUITY` | `001` | `VSCHEMA-025 business_insights` | consume fuentes certificadas y no escribe de vuelta sobre dominios operativos |
|  | `002` | `VSCHEMA-026 operational_continuity` | registra contratos, degradación y recuperación después de estabilizar dependencias de servicio |

Las 26 responsabilidades aparecen una sola vez. `business_records` mantiene adaptadores tempranos, pero su autoridad consolidada entra en `W5`; `identity_access` puede publicar referencias en `W0`, pero no adelanta la migración de perfiles laborales o de clientes.

#### 7. Dependencias entre oleadas

```text
W0_CONTROL_FOUNDATION
 ├─> W1_PEOPLE_OPERATIONS
 └─> W2_PRODUCT_AND_OFFER

W2_PRODUCT_AND_OFFER ─> W3_SUPPLY_AND_PRODUCTION
W1_PEOPLE_OPERATIONS ─> W3_SUPPLY_AND_PRODUCTION

W2_PRODUCT_AND_OFFER ─> W4_COMMERCIAL_FULFILLMENT
W3_SUPPLY_AND_PRODUCTION ─> W4_COMMERCIAL_FULFILLMENT

W3_SUPPLY_AND_PRODUCTION ─> W5_RECORD_AND_ECONOMIC_CLOSURE
W4_COMMERCIAL_FULFILLMENT ─> W5_RECORD_AND_ECONOMIC_CLOSURE

W1..W5 CERTIFICADAS ─> W6_DERIVED_AND_CONTINUITY
```

Una unidad puede iniciar preparación documental antes de que termine su predecesora, pero no puede asumir autoridad, cambiar writers ni retirar compatibilidad hasta que todas sus aristas bloqueantes estén cerradas.

#### 8. Compuertas de entrada por unidad

Una unidad entra a materialización únicamente si:

- su `transition_key` existe en los tres artefactos `001`, `002` y `003`;
- owner, destino, disposición y claves de identidad son inequívocos;
- toda FK, vista, trigger, RLS, función, RPC, Realtime, Storage, Edge, cron y consumidor conocido tiene tratamiento;
- las candidatas léxicas y consumidores dinámicos tienen resolución o aislamiento explícito;
- las relaciones con RLS sin policy y las relaciones sin RLS no adquieren exposición accidental;
- cada función está identificada por firma y cada trigger por relación, evento y ejecutora;
- existe estrategia de reconciliación, backfill, compatibilidad, observabilidad y rollback;
- la paridad del entorno requerido está demostrada o declarada como gate bloqueante.

Los RPC defectuosos identificados por `TREQ-SUPABASE-080`, `TREQ-SUPABASE-081` y `TREQ-SUPABASE-082` no pueden ser invocados como compuertas confiables hasta que su precondición estructural esté resuelta y probada.

#### 9. Compuertas de salida por unidad y oleada

Una unidad sale de su oleada únicamente con evidencia de:

- paridad de conteos, claves, nulabilidad, semántica, historia y efectos laterales;
- autorización equivalente o más restrictiva por actor, tenant, sede y propósito;
- idempotencia y orden de eventos, triggers, jobs y webhooks;
- consumidores migrados por cohorte y métricas dentro de umbral;
- doble escritura reconciliada cuando aplique;
- rollback ejecutable dentro de la ventana definida;
- cero consumidores ocultos dentro del alcance medido, sin inferirlo solo por búsqueda literal.

La oleada se certifica cuando todas sus unidades están certificadas o cuando las excepciones restantes están aisladas y no son predecesoras de la siguiente oleada. Una excepción nunca se hereda silenciosamente.

#### 10. Reglas para identidad compartida

- se preservan UUID y claves externas durante toda la coexistencia;
- cuenta, trabajador, cliente y dispositivo siguen siendo identidades separables;
- no se provisiona Auth automáticamente por existencia de perfil empresarial;
- cuentas compartidas trabajador/dispositivo se separan antes del cambio de autoridad;
- cuentas de dispositivo no adquieren perfil de cliente;
- duplicados por email o teléfono requieren resolución explícita, sin fusión automática;
- deshabilitar una identidad aplica al contexto correcto y conserva historia y relaciones;
- sesiones y refresh tokens incompatibles se revocan antes del cambio de cohorte;
- perfiles sin Auth permanecen válidos cuando el contrato de negocio lo permita.

Estas reglas bloquean unidades concretas; no fuerzan detener toda una oleada si la dependencia puede aislarse sin degradar integridad o autorización.

#### 11. Objetos derivados y plataforma

Vistas, funciones auxiliares, triggers, políticas, grants, publicaciones, índices, tipos y objetos técnicos heredan la oleada de su objeto padre salvo que `DEPENDENCY-MAP-003@1.0.0` demuestre una dependencia anterior. No forman una oleada autónoma ni pueden adelantarse por conveniencia de despliegue.

La experiencia pública `VITAL` no constituye un dominio migrable. Solo entra como cohorte de compatibilidad y paridad sobre contratos autorizados; no crea tablas, RPC ni fuente de autoridad propia.

#### 12. Estados del orden

Cada unidad usa exactamente uno:

| Estado | Significado |
| --- | --- |
| `ORDERED_NOT_READY` | posición asignada, con gates todavía abiertos |
| `READY_FOR_MATERIALIZATION` | entrada completa; puede preparar destino sin cambiar autoridad |
| `READY_FOR_CONSUMER_COHORT` | paridad y compatibilidad certificadas; puede mover una cohorte |
| `COHORT_IN_PROGRESS` | una cohorte controlada está activa |
| `DOMAIN_AUTHORITY_CERTIFIED` | autoridad canónica demostrada con rollback vigente |
| `RETIREMENT_ELIGIBLE` | cero consumidores demostrado; el retiro corresponde a su tarea propietaria |
| `BLOCKED` | existe una dependencia que impide el siguiente estado |

El avance es monotónico salvo rollback declarado. `BLOCKED` conserva la última evidencia válida y el propietario de resolución.

#### 13. Entrega a tareas siguientes

| Trabajo derivado | Tarea propietaria |
| --- | --- |
| estrategia de reconciliación y backfill por unidad | `SUPA-TRANS-005` |
| vistas, aliases y wrappers temporales | `SUPA-TRANS-006` |
| adaptación de aplicaciones y consumidores | `SUPA-TRANS-007` |
| writers, doble escritura, concurrencia e idempotencia | `SUPA-TRANS-008` |
| pruebas de paridad y regresión por oleada | `SUPA-TRANS-009` |
| RLS, grants, exposición y rendimiento | `SUPA-TRANS-010` |
| rollback ejecutable por unidad | `SUPA-TRANS-011` |
| demostración de cero consumidores y retiro | `SUPA-TRANS-012` |
| promoción local, staging y producción | `SUPA-TRANS-013` |
| tipos, contratos y documentación derivados | `SUPA-TRANS-014` |
| materialización de gates y owners en roadmap | `SUPA-TRANS-015` |

#### 14. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.** Esta tarea no crea, modifica ni elimina identificadores `TREQ-*`. Aplica los requisitos vigentes del registro 04A relacionados con orden de transición, identidad compartida, compatibilidad por consumidor, objetos derivados, RLS, RPC y gates de corte.

#### 15. Criterios de aceptación

- [x] ordena las 26 responsabilidades `VSCHEMA-*` exactamente una vez;
- [x] preserva las 970 identidades y las decisiones de `SUPA-TRANS-001` a `SUPA-TRANS-003`;
- [x] distingue oleada de unidad física y prohíbe asumir paralelismo implícito;
- [x] fija predecesores e intraorden para personas, producto, suministro, comercio, finanzas y derivados;
- [x] aplica identidad, evidencia, eventos, seguridad, datos, contratos y observabilidad como carriles transversales;
- [x] define compuertas de entrada y salida sin declarar resueltos los bloqueos existentes;
- [x] preserva separación entre cuenta, trabajador, cliente y dispositivo;
- [x] mantiene `VITAL` fuera de la autoridad de datos;
- [x] hereda los objetos derivados desde su padre canónico;
- [x] asigna toda ejecución posterior a su tarea propietaria;
- [x] no ejecuta cambios físicos, remotos ni productivos;
- [x] reserva únicamente `SUPA-TRANS-005` como siguiente tarea.

#### 16. Continuidad preservada

```text
SUPA-TRANS-003 — ÚLTIMA APROBADA
        ↓
SUPA-TRANS-004 — ARTEFACTO PREPARADO; PENDIENTE DE APROBADO EXPLÍCITO
        ↓
SUPA-TRANS-005 — SIGUIENTE RESERVADA; NO INICIADA
```

Este archivo no actualiza la cabecera, `active-sequence.json`, el progreso del bloque ni el marcador siguiente antes de la aprobación explícita del usuario.
