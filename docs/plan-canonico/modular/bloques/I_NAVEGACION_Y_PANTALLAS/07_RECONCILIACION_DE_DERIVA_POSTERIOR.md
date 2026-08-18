### MINI-BLOQUE — RECONCILIACIÓN DE DERIVA POSTERIOR

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `AUTH-UI-061` — 1 tarea.
<!-- PLAN-SECTION-META:END -->

### [ ] AUTH-UI-061 — Reconciliar rutas y superficies VISO posteriores al inventario aprobado

**Estado:** NO INICIADA  
**Delta:** `DELTA-VISO-SCHEDULE-20260731-001`  
**Snapshot base:** `AUTH-UI-005`  
**Dependencias:** `CODE-AUD-021`, commit estable, `VISO-SCH-008`  
**Salida:** `VISO-ROUTE-DELTA-001`

#### Ruta esperada

| ID | Patrón | Archivo | Tipo | Familia | Acceso | Menú |
| --- | --- | --- | --- | --- | --- | --- |
| `VISO-ROUTE-061` | `/staff/schedule/month` | `src/app/staff/schedule/month/page.tsx` | `ESTATICA` | `PERSONAL_PROGRAMACION` | `requireStaffScheduleAccess` | no; selector/deep link |

#### Conteos esperados

| Métrica | Antes | Esperado |
| --- | ---: | ---: |
| páginas | 60 | 61 |
| estáticas | 47 | 48 |
| dinámicas | 13 | 13 |
| protegidas | 58 | 59 |
| guard especializado | 2 | 3 |
| públicas | 2 | 2 |
| handlers | 10 | 10 |
| patrones | 70 | 71 |

Recalcular cifras y huellas sobre commit final.

#### Destinos

- proceso/paso `AUTH-UI-011/012`;
- propiedad/consumo `013/014`;
- clasificación `015–025`;
- depuración `026–029`;
- permisos `030–045`;
- experiencia `046–060`;
- package E5.

#### TREQ existentes

Modificar `TREQ-VISO-004`, `005`, `006`, `012`, `013`, `015`, `016` y `023`; reemplazar `04A` completo.

#### Aceptación

- [ ] Commit/huellas.
- [ ] ID 061 único.
- [ ] No renumerar anteriores.
- [ ] Guard confirmado.
- [ ] Separar ruta/layout/componentes/acciones.
- [ ] `04A` completo.
- [ ] No inferir menú.
