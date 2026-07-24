**PROPUESTA PARA APROBACIÓN**

### 🟡 CODE-AUD-016 — Ejecutar build, lint, tipos y pruebas disponibles por repositorio

**Estado:** PROPUESTA PARA APROBACIÓN  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de salud de build, análisis estático, tipos y pruebas declaradas  
**Dependencia anterior:** `CODE-AUD-015`  
**Continuidad reservada:** `CODE-AUD-017`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no realizados. Se instalaron dependencias locales ya declaradas para poder ejecutar la validación de NUMERA y Vento Group Web; no se modificaron manifiestos, lógica ni Supabase.

---

#### 1. Resultado de esta tarea

Se ejecutaron las validaciones declaradas y las equivalencias locales disponibles en los doce repositorios VENTO reconocidos. La evidencia separa:

- éxito de build o smoke build;
- éxito de typecheck;
- resultado de lint, incluidos avisos no bloqueantes;
- pruebas automatizadas declaradas;
- validación no disponible por ausencia de script;
- bloqueo de herramienta, dependencia o código.

La cadena de control resultante es:

```text
repositorio
→ scripts y dependencias declaradas
→ build / export o smoke build disponible
→ typecheck
→ lint
→ pruebas automatizadas disponibles
→ hallazgo trazable
→ backlog y puerta de regresión
```

No se interpreta una compilación exitosa como evidencia de flujo operativo, autorización, datos remotos o dispositivo físico. Es una evidencia local del corte indicado.

---

#### 2. Método y alcance ejecutado

1. Se inventariaron los scripts de cada `package.json`.
2. En aplicaciones Next se ejecutaron `npm run build`, `npm run lint` y `npx tsc --noEmit` cuando las dependencias estaban presentes.
3. En aplicaciones Expo se ejecutaron `npx expo export --platform android --output-dir <temporal> --clear` y `npx tsc --noEmit` cuando aplicaba. La exportación es un smoke build local, no un build firmado ni QA en dispositivo.
4. En VITAL se ejecutó `npm run ci:contracts`.
5. NUMERA y Vento Group Web recibieron `npm install` porque faltaban dependencias locales necesarias para completar la auditoría; la segunda ya declaraba `lenis` en su manifiesto.
6. No se ejecutaron builds EAS, despliegues, migraciones, pruebas contra Supabase remoto ni flujos manuales.

---

#### 3. Matriz de resultados por repositorio

| Repositorio | Build o smoke build | Typecheck | Lint | Pruebas disponibles | Resultado de corte |
| --- | --- | --- | --- | --- | --- |
| `vento-anima` | ✅ export Android | ✅ | No declara script | No declara script | validación local disponible aprobada |
| `vento-fogo` | ✅ | ✅ | ✅ 8 warnings, 0 errores | No declara script | build y tipos aprobados; deuda no bloqueante |
| `vento-group-web` | ✅ después de instalar dependencias | ✅ después de instalar dependencias | ❌ `next lint` no es compatible con Next 16 | No declara script | build y tipos aprobados; herramienta de lint bloqueada |
| `vento-nexo` | ❌ | ❌ | ❌ 54 errores, 128 warnings | No declara script | bloqueo de tipos/build y deuda de lint |
| `vento-numera` | ✅ después de instalar dependencias | ✅ | ✅ | No declara script | validación local disponible aprobada |
| `vento-origo` | ✅ | ✅ | ❌ 4 errores, 5 warnings | No declara script | deuda de lint bloqueante |
| `vento-pass` | ✅ export Android | ✅ | No declara script | No declara script | validación local disponible aprobada |
| `vento-pulso` | ✅ | ✅ | ❌ 20 errores | No declara script | deuda de lint bloqueante |
| `vento-shell` | ✅ | ✅ | ❌ 10 errores, 7 warnings | No declara script | deuda de lint bloqueante |
| `vento-talento` | ✅ export Android | ✅ | No declara script | No declara script | validación local disponible aprobada |
| `vento-viso` | ✅ | ✅ | ❌ 17 errores, 35 warnings | No declara script | deuda de lint bloqueante |
| `vento-vital` | No declara build raíz ejecutable | No declara typecheck raíz ejecutable | No declara script | ✅ 13 de 13 contratos API | pruebas contractuales aprobadas |

`vento-vital` conserva estructura monorepo con scripts de build móvil remotos; no se ejecutaron porque son EAS/producción y no constituyen una prueba local disponible equivalente.

---

#### 4. Hallazgos confirmados

| ID | Hallazgo | Evidencia reproducida | Impacto | Destino obligatorio |
| --- | --- | --- | --- | --- |
| `H-CODE-016-001` | Vento Group Web declara `lint=next lint`, pero Next 16 interpreta `lint` como directorio y no ejecuta análisis. | `npm run lint` termina con código 1: `Invalid project directory ... vento-group-web\\lint`. Build y tipos pasan tras sincronizar dependencias. | La calidad estática de este repositorio no tiene puerta ejecutable. | `CODE-AUD-020` y `QA-REG-001` |
| `H-CODE-016-002` | NEXO no puede completar typecheck ni build por una API de hoja de cálculo no presente en el tipo instalado. | `src/app/api/inventory/catalog/export-suppliers/route.ts:423`: `Property 'dataValidations' does not exist on type 'Worksheet'`. | La aplicación no tiene build de producción verificable. | `CODE-AUD-020` y `QA-REG-001` |
| `H-CODE-016-003` | Cinco repositorios tienen errores de lint bloqueantes. | NEXO: 54; ORIGO: 4; PULSO: 20; SHELL: 10; VISO: 17. | La puerta estática no es verde aunque varios builds y tipos pasen. | `CODE-AUD-020` y `QA-REG-001` |
| `H-CODE-016-004` | FOGO pasa lint con deuda no bloqueante. | 8 warnings y 0 errores. | La puerta actual permite el build, pero la deuda debe priorizarse antes de endurecer CI. | `CODE-AUD-020` |
| `H-CODE-016-005` | NUMERA no tenía dependencias instaladas al inicio del corte; después de `npm install` pasa build, tipos y lint. La instalación reporta 8 vulnerabilidades y scripts de `sharp` y `unrs-resolver` pendientes de aprobación. Vento Group Web también reporta 4 vulnerabilidades y script de `sharp` pendiente. | `npm install` completado en ambos repositorios; no cambió el manifiesto. | La reproducibilidad local depende de instalar y revisar dependencias; los avisos no se deben resolver automáticamente mediante `npm audit fix`. | `CODE-AUD-020` |
| `H-CODE-016-006` | La mayor parte de los repositorios no declara pruebas automatizadas y los clientes Expo no declaran lint o build local en scripts. | Solo VITAL declara y ejecuta pruebas: 13/13 contratos API. ANIMA, PASS y TALENTO solo aportan export Android y tipos; FOGO, Group Web, NEXO, NUMERA, ORIGO, PULSO, SHELL y VISO no declaran `test`. | La evidencia de build no protege regresiones de proceso, autorización o integración. | `QA-REG-001` después de `CODE-AUD-020` |

---

#### 5. Clasificación de resultados

```text
APROBADO LOCALMENTE
ANIMA, FOGO, NUMERA, PASS, TALENTO y VITAL

APROBADO CON BLOQUEO DE HERRAMIENTA
Vento Group Web: build y tipos verdes; lint no ejecutable por script obsoleto

BLOQUEADO POR CÓDIGO
NEXO: typecheck y build fallan en exportación de catálogo

BLOQUEADO POR LINT
NEXO, ORIGO, PULSO, SHELL y VISO

EVIDENCIA DE PRUEBAS DISPONIBLE
VITAL: 13 contratos API aprobados
```

FOGO queda en estado de observación: sus ocho warnings no bloquean la configuración actual, pero no equivalen a calidad limpia.

---

#### 6. Decisiones propuestas

1. La matriz de esta tarea será la baseline local de calidad del corte 2026-07-24.
2. Un build o export exitoso no cerrará deuda de lint ni sustituirá pruebas de flujo.
3. NEXO no podrá declararse apto para build de producción hasta resolver `H-CODE-016-002`.
4. Vento Group Web deberá reemplazar o actualizar su comando de lint antes de exigir una puerta verde.
5. Los errores de lint se deberán descomponer por repositorio y propietario en `CODE-AUD-020`; no se corregirán silenciosamente durante esta auditoría.
6. Los warnings de FOGO y los avisos de vulnerabilidades o scripts de instalación se registrarán como deuda, sin ejecutar `npm audit fix` ni aprobar scripts automáticamente.
7. `QA-REG-001` deberá definir la matriz mínima de CI y pruebas de regresión después de `CODE-AUD-020`.
8. No se modificará código, CI, despliegues ni Supabase como consecuencia de esta tarea documental.
9. `CODE-AUD-017` permanecerá como continuidad reservada.

---

#### 7. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea registra evidencia de validaciones ya existentes y sus brechas; no introduce ni modifica una regla de negocio, autorización, cálculo, transición, contrato de integración o comportamiento ejecutable. La definición de la matriz y de las puertas de regresión corresponde a `QA-REG-001` después de `CODE-AUD-020`.

---

#### 8. Límites de certeza

Esta tarea no confirma:

- que los builds aprobados se conecten correctamente a Supabase remoto;
- que las variables locales representen staging o producción;
- que los flujos operativos, permisos, RLS o RPC estén correctos;
- que las exportaciones Expo funcionen en dispositivos físicos;
- que los builds EAS remotos funcionen;
- que la ausencia de script `test` implique ausencia total de pruebas fuera del repositorio;
- que los avisos de `npm audit` sean explotables en el contexto de cada aplicación;
- que aprobar scripts nativos pendientes sea seguro sin revisión de dependencias;
- que las reglas de lint identificadas sean todas defectos funcionales.

La autorización y la exposición de datos continúan reservadas para `CODE-AUD-017`; la operación offline para `CODE-AUD-018`; la asignación de implementación verificable para `CODE-AUD-019`; y el backlog propietario para `CODE-AUD-020`.

---

#### 9. Criterios de aceptación

`CODE-AUD-016` podrá aprobarse cuando:

- los doce repositorios reconocidos tengan resultado explícito de build, smoke build, tipos, lint y pruebas disponibles o ausencia declarada;
- los resultados distingan éxito, warning, bloqueo de herramienta, bloqueo de código y validación no disponible;
- NEXO tenga evidencia exacta de su bloqueo de build y tipos;
- Vento Group Web tenga evidencia exacta de su bloqueo de lint;
- la deuda de lint por repositorio tenga conteo y destino;
- las instalaciones necesarias estén diferenciadas de cambios de código;
- las limitaciones de Expo, EAS, CI y Supabase remoto estén declaradas;
- cada hallazgo tenga destino documental exacto;
- se declare expresamente que no genera requisitos de prueba nuevos;
- no se modifique código, CI, despliegues ni Supabase;
- `CODE-AUD-017` permanezca como continuidad reservada.

---

#### 10. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
estado local de calidad
→ hallazgo reproducible
→ repositorio propietario
→ backlog técnico
→ matriz de regresión y CI
→ corrección controlada
→ nueva validación
```

La continuidad reservada será:

```text
CODE-AUD-017
— Auditar autorización, validación de servidor y exposición de datos
```
