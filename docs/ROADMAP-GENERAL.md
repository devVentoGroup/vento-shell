# Vento OS Roadmap General

## Vision general

Vento OS es una suite de aplicaciones especializadas (logistica, fidelizacion, asistencia, produccion, etc.) que funcionan juntas con una sola base de datos (Supabase) y un sistema unificado de usuarios/roles. Se accede por subdominios o rutas: nexo..., pass..., anima..., etc. (o dentro del shell).

Vento Shell es el hub/desktop donde vive lo transversal:
- SSO/Auth (sesion unica)
- RBAC (roles/permisos)
- App switcher (NEXO / Pass / Anima / Fogo)
- Design system y navegacion global
- Servicios compartidos (Supabase client, sites/tenant, logging, utilidades)
- Deep links y entradas a pantallas especificas

Resumen: Vento Shell no es otra app de negocio; es la plataforma UI + seguridad + navegacion + shared services.

## Apps en el ecosistema

### NEXO (Logistica e Inventario operativo)
- Recepciones, stock, movimientos, entregas internas, transferencias, conteos
- Usuarios: bodega, recepcion, despacho, satelites, administracion

### Vento Pass (Fidelizacion / Puntos / Redencion)
- Identificacion cliente, acumulacion, redencion, rewards, reglas y auditoria
- Usuarios: cajeros/mostrador, managers

### ANIMA (Asistencia / Operacion de personal)
- Asistencia, geofence, turnos, permisos, auditoria laboral
- Usuarios: empleados y managers

### FOGO (Produccion / Recetas / FIFO)
- Recetas, ordenes de produccion, consumo de insumos, lotes, merma, trazabilidad
- Usuarios: jefes de cocina/produccion, inventario

Importante: todas las apps dependen de los mismos maestros: products/SKUs, sites, users/roles.

---

## Roadmap general (suite completa)

**Leyenda**
- ⬜ Pendiente  - 🟡 En progreso  - 🟢 Listo

### Fase 0 — Producto y gobernanza (base para no rehacer)
- ⬜ Definir system of record por dominio (Inventario: NEXO, Fidelizacion: Pass, Asistencia: Anima, Produccion: Fogo)
- 🟡 Definir roles corporativos estandar (propietario, gerente_general, gerente, bodeguero, conductor, cajero, mesero, barista, cocinero, panadero, repostero, pastelero, contador, marketing)
- ⬜ Definir alcance MVP por app (30 dias vs 90 dias)
- ⬜ Glosario + SOPs minimos (operacion real)
- 🟢 Data dictionary Supabase (schema review + riesgos)
- 🟢 Baseline de schema Supabase en vento-shell/supabase/migrations

**Salida:** documento de decisiones + responsables

### Fase 1 — Plataforma base (Vento OS Core)

**Core minimo (para habilitar NEXO sin rehacer)**
- ⬜ Auth unificado (Supabase) + sesion persistente
- 🟡 Modelo de roles/permisos y RLS base (roles canonicos + scopes site_type/area_kind)
- ⬜ Tablas comunes minimas: profiles, employees, sites, employee_sites, roles, app_access
- ⬜ Paquetes compartidos: @vento/db (cliente supabase + helpers) y @vento/auth (session/guards)
- ⬜ Shell basico: layout simple, selector de site y guard de rutas por rol/site

**Definicion de listo:** NEXO puede autenticar, seleccionar site, respetar RLS y navegar con layout base sin hacks.

**1.1 Infra y despliegue**
- ⬜ Monorepo ordenado (apps/ + packages/)
- ⬜ Convencion de dominios/subdominios por app (nexo.ventogroup.co, fogo.ventogroup.co, etc.)
- ⬜ Ambientes: dev / staging / prod
- ⬜ Variables de entorno y checklist de despliegue
- ⬜ CI/CD minimo (lint, build, migrations si aplica)

**1.2 Seguridad y datos compartidos**
- ⬜ Supabase Auth unificado
- ⬜ Tablas base comunes: profiles, employees, sites, employee_sites, roles
- ⬜ RLS consistente y testeable (staff vs cliente donde aplique)
- ⬜ Auditoria transversal (created_at/created_by, logs de acciones)
- 🟡 SSO: login unico en vento-shell y redireccion a apps por subdominio
- 🟡 Modelo permisos en BD (roles/apps/permissions + scopes site_type/area_kind)

**Salida:** un core estable donde cualquier app puede construir encima

### Fase 2 — vento-shell (experiencia unificada)
- ⬜ Layout global + navegacion estandar (header, app switcher, breadcrumbs)
- ⬜ Decisiones UI shell: header neutral (blanco), app switcher a la derecha con grid de iconos, selector de site dentro del switcher, menu de perfil a la derecha, sidebar por app cuando aplique, identidad Vento en fondos/figuras sutiles
- ⬜ Flujo SSO/Hub: login en shell; con returnTo redirige directo a app; sin returnTo va al Hub; sin permisos muestra "No tienes permisos" y boton Volver al Hub
- ⬜ Guard de rutas por rol y por site
- ⬜ Selector de site/entidad (si aplica) y persistencia
- ⬜ Libreria compartida @vento/auth + @vento/db (cliente supabase, helpers)
- ⬜ Error boundaries + observabilidad (logs, digest, trazas)
- ⬜ UI Kit v1 (botones, inputs, tables, empty states, modals, toasts)

**Salida:** entrar al OS se siente consistente y profesional

### Fase 3 — Apps MVP por prioridad operativa (orden recomendado)

**3.1 NEXO (primero, por urgencia operativa)**
- ⬜ Inventario Core: Stock + Movimientos + Ajustes + Conteo inicial
- �YY� Remisiones internas end-to-end (crear -> preparar -> en viaje -> recibir -> faltantes)
- ⬜ Recepciones proveedor (documento) -> movimientos
- ⬜ Ingreso a bodega por produccion manual (lote + caducidad)
- ⬜ Etiquetas Zebra (nombre, fecha produccion, fecha expiracion)
- ⬜ Entregas internas CP -> cocina/panaderia -> movimientos
- ⬜ Transferencias CP -> satelites -> recepcion/disputa
- ⬜ Luego: LPN/LOC + Zebra + tareas (put-away/picking)

**Criterio de listo:** control real y auditable del inventario sin Excel/terceros

**3.2 Pass (segundo, porque afecta caja y experiencia cliente)**
- ⬜ Identificacion cliente + acumulacion (regla puntos)
- ⬜ Redencion + emision de codigo
- ⬜ Auditoria / reportes basicos
- ⬜ Manejo multi-sede y reglas

**3.3 Anima (tercero, si es prioridad de control operativo/personal)**
- ⬜ Registro asistencia + geofence + secuencia
- ⬜ Panel manager: incidencias, atrasos, reportes
- ⬜ Permisos y bitacora

**3.4 Fogo (cuarto, porque depende de inventario para consumir)**
- ⬜ Recetas (rendimientos, mermas)
- ⬜ Produccion: orden -> consumo -> lote terminado
- ⬜ FIFO/FEFO y etiquetas de lote

### Fase 4 — Integracion entre apps (cuando ya hay MVPs)
- ⬜ NEXO -> FOGO: consumo automatico de insumos y entradas de producto terminado
- ⬜ NEXO -> Pass/POS: venta/consumo (si llega a integrarse)
- ⬜ Anima -> Operacion: turnos/roles/centro de costo (si aplica)
- ⬜ Bus de eventos o outbox simple (opcional) para sincronizacion controlada

### Fase 5 — Hardening y escalamiento (operacion empresa)
- ⬜ Performance (indices, paginacion, caches)
- ⬜ Backups, migraciones controladas, rollback plan
- ⬜ Observabilidad seria (Sentry/Logs/Alertas)
- ⬜ Seguridad: revision RLS, pruebas de permisos, auditorias
- ⬜ UX polish: UI kit v2, flujos guiados, accesibilidad
- ⬜ Capacitacion: SOPs finales + checklists de operacion diaria

---

## Regla de oro (para no desordenar)
- Vento Shell define estandares (auth, roles, UI, navegacion, patrones)
- Cada app define procesos (documentos y movimientos)
- Supabase define verdad y auditoria (RLS + ledger + constraints)
