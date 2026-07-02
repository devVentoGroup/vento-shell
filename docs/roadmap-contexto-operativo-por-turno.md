# Roadmap: contexto operativo por turno

Este documento es la lista viva para conectar VISO, ANIMA, NEXO, PULSO y FOGO al modelo correcto:

**El turno activo manda.** El rol fijo de `employees.role` queda para administracion/base; el rol operativo del turno (`employee_shifts.operational_role`) decide que puede hacer una persona durante la operacion.

## Estado

- Responsable tecnico: Codex
- Repo rector de Supabase: `vento-shell`
- Fecha de inicio: 2026-07-01
- Estado general: en desarrollo

## Principios

- No duplicar lo que ya existe en VISO.
- No hardcodear reglas por sede o por nombre de empleado.
- Mantener `role_permissions` para permisos administrativos/base.
- Usar `operational_roles`, `site_operational_roles`, `employee_site_operational_profiles` y `employee_shifts.operational_role` como base operativa.
- Migrar por etapas: primero NEXO remisiones, luego PULSO/FOGO.
- Cada cambio realizado debe marcarse aqui como hecho.

## Auditoria inicial 2026-07-01

- [x] Se confirmo que ya existen roles operativos configurables en `public.operational_roles`.
- [x] Se confirmo que ya existe matriz sede/rol en `public.site_operational_roles`.
- [x] Se confirmo que ya existen perfiles por trabajador y sede en `public.employee_site_operational_profiles`.
- [x] Se confirmo que VISO ya aplica perfiles operativos al turno con `public.apply_operational_profile_to_shift`.
- [x] Se confirmo que ANIMA/asistencia ya puede resolver turno con `public.resolve_attendance_shift_id`.
- [x] Se confirmo que NEXO ya consulta `public.get_operational_context` para bloquear operacion sin contexto valido.
- [x] Se confirmo que falta una matriz configurable de permisos por rol operativo.
- [x] Se confirmo que `public.get_operational_context` aun no devuelve `active_operational_role`, `active_area_id` ni `active_area_kind`.
- [x] Se confirmo que NEXO todavia valida permisos con permisos base/administrativos y no con el rol operativo del turno.

### Piezas existentes que no se deben duplicar

- `public.operational_roles`: catalogo humano de roles operativos.
- `public.site_operational_roles`: roles habilitados por sede/area.
- `public.employee_site_operational_profiles`: perfil default del trabajador segun sede.
- `public.apply_operational_profile_to_shift(uuid)`: aplica perfil operativo a un turno.
- `public.resolve_attendance_shift_id(...)`: resuelve el turno desde marcaciones.
- `public.get_operational_context(uuid, uuid, text)`: valida si el usuario puede operar una app en la sede activa.

### Huecos confirmados

- Falta `public.operational_role_permissions`.
- Falta una funcion central para responder: "este turno activo permite este permiso operativo".
- Falta exponer en el contexto operativo el rol/area efectiva del turno.
- Falta conectar NEXO remisiones a permisos operativos, no solo a permisos del rol administrativo/base.
- Falta que la navegacion y los mensajes de bloqueo se basen en el mismo contexto operativo.

## Fase 0: definicion y auditoria segura

- [x] Crear este documento en `vento-shell`.
- [x] Inventariar tablas, funciones y pantallas ya existentes.
- [x] Confirmar estado remoto de tablas operativas.
- [x] Documentar huecos reales antes de crear nuevas piezas.
- [x] Separar permisos administrativos de permisos operativos.

## Fase 1: matriz de permisos por rol operativo

- [x] Crear tabla `public.operational_role_permissions`.
- [x] Crear indices y constraints.
- [x] Habilitar RLS y grants adecuados.
- [x] Sembrar permisos iniciales por rol operativo.
- [x] Validar que no rompe `role_permissions`.

### Permisos iniciales propuestos

- `operador_integral_satelite`
  - `nexo.access`
  - `nexo.inventory.remissions`
  - `nexo.inventory.remissions.request`
  - `nexo.inventory.remissions.receive`
  - `pulso.access`
  - `pulso.pos.main`
- `cajero_satelite`
  - `nexo.access`
  - `nexo.inventory.remissions`
  - `nexo.inventory.remissions.request`
  - `pulso.access`
  - `pulso.pos.main`
- `barista_satelite`
  - `nexo.access`
  - `nexo.inventory.remissions`
  - `nexo.inventory.remissions.request`
- `cocinero_satelite`
  - `nexo.access`
  - `nexo.inventory.remissions`
  - `nexo.inventory.remissions.request`
- `bodeguero`
  - `nexo.access`
  - `nexo.inventory.stock`
  - `nexo.inventory.remissions`
  - `nexo.inventory.remissions.prepare`
  - `nexo.inventory.movements`
- `conductor_logistica`
  - `nexo.access`
  - `nexo.inventory.remissions`
  - `nexo.inventory.remissions.transit`
- `gerencia_operativa`
  - permisos operativos amplios, sin reemplazar permisos administrativos globales.

## Fase 2: contexto operativo completo

- [x] Extender `public.get_operational_context` para retornar `active_operational_role`.
- [x] Retornar `active_area_id`.
- [x] Retornar `active_area_kind`.
- [x] Validar que el rol operativo del turno existe en `site_operational_roles`.
- [x] Bloquear con `invalid_operational_role` si el turno trae un rol no permitido por la sede/area.
- [x] Mantener bypass de `propietario` y `gerente_general`.
- [x] Verificar ANIMA/check-in y turno publicado.

## Fase 3: funcion central de permisos operativos

- [x] Crear `public.has_operational_permission(p_permission_code text, p_site_id uuid default null, p_area_id uuid default null, p_app_code text default null)`.
- [x] Resolver contexto con `get_operational_context`.
- [x] Evaluar `operational_role_permissions`.
- [x] Aplicar scopes por sede, area y tipo de area.
- [x] Permitir bypass administrativo solo donde corresponda.
- [x] Probar casos reales.

## Fase 4: helpers de app

- [x] Crear helper `getOperationalContext` extendido en NEXO.
- [x] Crear helper `checkOperationalPermission`.
- [x] Crear helper `requireOperationalPermission`.
- [x] Mantener `requireAppAccess` para pantallas administrativas/configuracion.

## Fase 5: NEXO remisiones

- [x] Cambiar solicitud de remision a `requireOperationalPermission("nexo.inventory.remissions.request")`.
- [x] Cambiar preparacion a `requireOperationalPermission("nexo.inventory.remissions.prepare")`.
- [x] Cambiar recepcion a `requireOperationalPermission("nexo.inventory.remissions.receive")`.
- [x] Cambiar transito a `requireOperationalPermission("nexo.inventory.remissions.transit")`.
- [x] Validar navegacion lateral con permisos operativos.
- [x] Validar mensajes claros sin turno/check-in.

## Fase 6: VISO configuracion

- [x] Mejorar `/operations/site-roles`.
- [x] Mejorar `/operations/employee-profiles`.
- [x] Mejorar `/operations/preview` para simular trabajador + sede + rol operativo.
- [x] Confirmar que horarios aplican `employee_site_operational_profiles`.
- [x] Confirmar que sedes con un solo rol default no obligan seleccion manual.
- [x] Confirmar que sedes con multiples roles exigen seleccion clara.

## Fase 7: configuracion inicial VENTO

- [x] Molka: configurar `operador_integral_satelite`.
- [x] Saudo: confirmar area unica solicitante y rol integral o rol asignado.
- [x] Vento Cafe: configurar roles separados por area.
- [x] Centro: configurar `bodeguero`, produccion y conductor si aplica.
- [x] Vento Group: confirmar si requiere roles administrativos operativos o solo VISO.

## Fase 8: pruebas obligatorias

- [ ] Cajero Saudo con turno activo puede solicitar y no ve preparar.
- [x] Cajero Saudo sin turno no puede operar.
- [ ] Bodeguero Centro con turno ve y ejecuta preparar.
- [ ] Barista Vento Cafe solo ve/usa lo de barista.
- [ ] Operador integral Molka puede operar funciones integrales.
- [ ] Gerente/propietario puede auditar/configurar con bypass.
- [ ] Trabajador rotado cambia permisos segun turno.

### Pruebas remotas 2026-07-01

- [x] Vento Cafe, turno activo `cajero_satelite` con check-in abierto: `can_operate = true`, `nexo.inventory.remissions.request = true`, `nexo.inventory.remissions.prepare = false`.
- [x] Saudo, cajero sin turno/check-in activo al momento de la prueba: `can_operate = false`, `blocked_reasons = {out_of_shift, checkin_required}`, `nexo.inventory.remissions.request = false`.
- [ ] Centro/bodeguero: no habia turno publicado activo hoy para probar `nexo.inventory.remissions.prepare`.
- [ ] Conductor/transito: no habia turno publicado activo hoy para probar `nexo.inventory.remissions.transit`.
- [x] Contexto operativo: 3 turnos activos sin rol operativo quedaron bloqueados con `invalid_operational_role`; 1 gerente general con rol base de bypass quedo permitido.

## Log de cambios

- 2026-07-01: Documento creado.
- 2026-07-01: Auditoria inicial documentada con piezas existentes y huecos confirmados.
- 2026-07-01: Creada y aplicada migracion `20260701135020_operational_role_permissions_v1.sql`.
- 2026-07-01: Verificada tabla remota `public.operational_role_permissions`: RLS activo, grants a `authenticated` y 32 permisos iniciales en 7 roles.
- 2026-07-01: Creada y aplicada migracion `20260701135846_extend_operational_context_shift_role_area.sql`.
- 2026-07-01: Verificado `public.get_operational_context`: ya retorna `active_shift_area_id`, `active_operational_role`, `active_area_id` y `active_area_kind`.
- 2026-07-01: Creada y aplicada migracion `20260701140432_has_operational_permission_v1.sql`.
- 2026-07-01: Verificado `public.has_operational_permission`: anonimo niega, `authenticated` tiene execute y la funcion evalua contexto + matriz operativa.
- 2026-07-01: Actualizado NEXO `src/lib/auth/operational-context.ts` con campos extendidos y helper `checkOperationalPermission`.
- 2026-07-01: Conectada la creacion de solicitudes de remision en NEXO al permiso operativo `nexo.inventory.remissions.request`.
- 2026-07-01: Validado NEXO con `npx tsc --noEmit` despues de conectar solicitud de remisiones al permiso operativo.
- 2026-07-01: Conectada la cola de preparacion de remisiones en NEXO al permiso operativo `nexo.inventory.remissions.prepare`.
- 2026-07-01: Validado NEXO con `npx tsc --noEmit` despues de conectar preparacion de remisiones al permiso operativo.
- 2026-07-01: Conectado el detalle de remisiones en NEXO a permisos operativos para preparar, recibir y transitar, conservando modo simulacion.
- 2026-07-01: Conectada la cola de transito de remisiones en NEXO al permiso operativo `nexo.inventory.remissions.transit`.
- 2026-07-01: Validado NEXO con `npx tsc --noEmit` despues de conectar detalle y transito a permisos operativos.
- 2026-07-01: Conectada la navegacion lateral de NEXO a permisos operativos para acciones de remisiones.
- 2026-07-01: Validado NEXO con `npx tsc --noEmit` despues de conectar navegacion lateral.
- 2026-07-01: Mejorados mensajes de preparacion de remisiones para diferenciar falta de turno/check-in de falta de permiso operativo.
- 2026-07-01: Validado NEXO con `npx tsc --noEmit` despues de mejorar mensajes operativos.
- 2026-07-01: Verificado `supabase status` local con Docker activo; `supabase migration list --local` aun no conecta a Postgres local en `127.0.0.1:54322`.
- 2026-07-01: Creado helper `requireOperationalPermission` en NEXO para centralizar contexto, permiso operativo y mensaje.
- 2026-07-01: Conectado el hub principal de NEXO a permisos operativos para tarjetas de solicitar, preparar y recibir remisiones.
- 2026-07-01: Validado NEXO con `npx tsc --noEmit` despues de conectar el hub a permisos operativos.
- 2026-07-01: Ejecutadas pruebas remotas de permisos operativos con usuarios reales de Vento Cafe y Saudo, sin modificar datos.
- 2026-07-01: Mejorado VISO `/operations/preview` con simulador de sede, area y rol operativo basado en `operational_role_permissions`.
- 2026-07-01: Validado VISO con `npx tsc --noEmit` despues de mejorar el simulador operativo.
- 2026-07-01: Confirmado en VISO horarios que `employee_site_operational_profiles` se usa para completar puntos de entrada/salida al crear turnos.
- 2026-07-01: Ajustado VISO horarios para usar rol default/unico por area solo cuando hay trabajador seleccionado; multiples roles quedan en seleccion manual.
- 2026-07-01: Validado VISO con `npx tsc --noEmit` despues de ajustar default de rol operativo.
- 2026-07-01: Mejorado VISO `/operations/employee-profiles` para mostrar etiquetas legibles de sede y rol operativo en vez de codigos tecnicos.
- 2026-07-01: Validado VISO con `npx tsc --noEmit` despues de mejorar perfiles operativos.
- 2026-07-01: Mejorado VISO `/operations/site-roles`: se oculto codigo tecnico en tabla principal y se aclaro el uso de rol por defecto.
- 2026-07-01: Validado VISO con `npx tsc --noEmit` despues de mejorar roles por sede.
- 2026-07-01: Simplificada solicitud de remisiones en NEXO: el selector solo muestra productos con categoria de remision configurada y el solicitante solo ve producto y cantidad.
- 2026-07-01: Validado NEXO con `npx tsc --noEmit` despues de simplificar productos de solicitud.
- 2026-07-01: Creada y aplicada migracion `20260701194950_validate_operational_context_role_matrix.sql` para bloquear contexto operativo si el turno no tiene rol valido en `site_operational_roles`.
- 2026-07-01: Verificado remoto: 12 turnos activos, 8 con rol operativo valido, 4 sin rol; los 3 no-bypass sin rol quedaron con `invalid_operational_role` y gerencia mantuvo bypass.
- 2026-07-01: Auditada configuracion inicial: Molka tiene `operador_integral_satelite`, Vento Cafe roles por area, Centro roles de bodega/produccion/logistica.
- 2026-07-01: Creada y aplicada migracion `20260701195446_seed_vento_group_operational_role.sql`; Vento Group quedo con `gerencia_operativa` default activo.
- 2026-07-01: Ajustado ANIMA para bloquear check-in y cola offline si no existe turno publicado para la sede o si el turno no tiene rol operativo.
- 2026-07-01: Validado ANIMA con `npx tsc --noEmit` despues de exigir turno publicado con rol operativo en check-in.
- 2026-07-01: Creada y aplicada migracion `20260701200302_configure_saudo_single_remission_area.sql`; Saudo quedo con una sola area solicitante de remisiones (`general`) y 113 productos configurados.
- 2026-07-01: Verificado Vento Cafe mostrador: el area esta activa para remisiones, pero `product_site_area_remission_categories` aun no tiene productos categorizados en `mostrador`; por eso no aparecen con el filtro estricto.
- 2026-07-01: Ajustado NEXO solicitud de remisiones para mostrar la unidad junto a `Cantidad` sin volver a duplicarla en el nombre del producto.
- 2026-07-01: Validado NEXO con `npx tsc --noEmit` despues de mostrar unidad en cantidad.
- 2026-07-01: Ajustado VISO horarios para que al seleccionar trabajador se autollenen area y rol operativo desde `employee_site_operational_profiles` o desde el rol base del trabajador cuando hay una unica area para ese rol.
- 2026-07-01: Validado VISO con `npx tsc --noEmit` despues de restaurar autollenado de area y rol operativo.
- 2026-07-01: Ajustado VISO horarios para ocultar puntos de entrada/salida detras de `Cambiar puntos de entrada y salida` y permitir eliminar un turno borrador individual desde edicion.
- 2026-07-01: Validado VISO con `npx tsc --noEmit` despues de ocultar puntos externos y reforzar borrado individual solo para borradores.
