### MINI-BLOQUE — COMPONENTES NATIVOS COMPARTIDOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **componentes nativos compartidos** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-NATIVE-001` a `SHELL-NATIVE-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `SHELL-NATIVE-001`: Crear tokens compatibles con ANIMA
- `SHELL-NATIVE-002`: Compartir contratos y validadores
- `SHELL-NATIVE-003`: Mantener UI React Native separada
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-NATIVE-001 — Crear tokens compatibles con ANIMA

**Estado:** APROBADA
**Tarea anterior:** SHELL-MIG-008 — Definir gate de retiro legacy y certificación por paquete
**Tarea siguiente:** SHELL-NATIVE-002 — Compartir contratos y validadores
**Tipo de tarea:** documental — definición global única de un contrato verificable de tokens compartidos compatible con ANIMA, con futura materialización física `SHELL-NATIVE-001::<implementation_unit_id>` una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/08_COMPONENTES_NATIVOS_COMPARTIDOS.md`
**Estado físico resultante:** `CONTRATO_GLOBAL_DE_TOKENS_ESPECIFICADO`; 1 contrato global; 1 snapshot ANIMA; 17 tokens canónicos iniciales; 22 claves de compatibilidad ANIMA reconciliadas; 3 constantes de layout excluidas del core compartido; 0 unidades materializadas; 0 paquetes físicos creados
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 4 creados (`TREQ-SHELL-045` a `TREQ-SHELL-048`)
**Modalidad:** `PER_IMPLEMENTATION_UNIT`

---

#### 1. Propósito

`SHELL-NATIVE-001` define una sola vez el contrato con el que VENTO podrá materializar tokens de diseño compartidos sin acoplar la fuente canónica a React, React Native, Expo, DOM o CSS y sin trasladar el AppShell completo a una capa nativa.

La definición protege tres objetivos simultáneos:

1. conservar compatibilidad observable con la paleta centralizada actual de ANIMA;
2. producir un artefacto serializable, reproducible y verificable que pueda alimentar adaptadores de plataforma;
3. garantizar que cada `implementation_unit_id` tenga una sola implementación física aunque varios `package_id` la consuman.

El marcador global no crea todavía un package, no modifica ANIMA y no materializa código de producción.

---

#### 2. Modalidad canónica y ciclo

La topología aplicable es `PER_IMPLEMENTATION_UNIT`.

```text
MARCADOR GLOBAL SHELL-NATIVE-001
→ define contrato, snapshot, semántica, gates, pruebas y lineage
→ se cierra una sola vez
→ no crea package físico

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id y package_id propietario

E5-GATE-008::<package_id> = PASS
→ autoriza materialización del alcance aprobado

SHELL-NATIVE-001::<implementation_unit_id>
→ materializa una sola implementación física para la unidad
→ uno o más package_id la consumen mediante lineage
→ no duplica core, serializador ni pruebas propietarias por package_id
```

**Dependencia de desarrollo:** `SHELL-MIG-008`.

**Dependencias de ejecución de una instancia:**

- `DELIV-PKG-025::<package_id>` con `implementation_unit_id` asignado;
- `E5-GATE-008::<package_id>` en `PASS` para el paquete propietario;
- repositorio y package físico exactos definidos por el paquete aprobado;
- consumidores declarados y baseline verificable.

El nombre del package físico, su ruta y su versión inicial no se fijan en este marcador porque pertenecen a la unidad y al paquete todavía no asignados.

---

#### 3. Estado actual verificable de ANIMA y VENTO-SHELL

El baseline que motiva el contrato es:

| Fuente                                              | Estado observado                                                           | Uso en esta tarea                                     |
| --------------------------------------------------- | -------------------------------------------------------------------------- | ----------------------------------------------------- |
| `devVentoGroup/vento-anima/package.json`            | Expo `~54.0.35`, React Native `0.81.5`, React `19.1.0`                     | confirma consumidor nativo real                       |
| `devVentoGroup/vento-anima/src/constants/colors.ts` | 22 claves `COLORS`; blob `947d02268a274d18e95de3a5a994bc70e7179f88`        | fuente del snapshot de compatibilidad inicial         |
| `devVentoGroup/vento-anima/src/constants/layout.ts` | 3 constantes de layout; blob `3f05a4f7591545ee4bbc64b89bc2106e0e71c831`    | evaluadas y excluidas del core inicial                |
| `devVentoGroup/vento-shell/package.json`            | workspace `packages/*`; paquete compartido observado `packages/os-context` | no existe hoy un package físico de tokens compartidos |

La ausencia actual de un package de tokens no se presenta como defecto físico corregido por esta tarea: confirma que la fase presente es contractual.

---

#### 4. Resultado material del marcador global

| Unidad                                | Cantidad | Resultado                                   |
| ------------------------------------- | -------: | ------------------------------------------- |
| contrato global                       |        1 | `VENTO-DESIGN-TOKENS-CONTRACT-001` definido |
| snapshot compatible con ANIMA         |        1 | `SHELL-NATIVE-TOKENS-ANIMA-001` definido    |
| tokens canónicos iniciales de color   |   **17** | definidos                                   |
| claves `COLORS` ANIMA reconciliadas   |   **22** | 22/22                                       |
| claves ANIMA omitidas                 |    **0** | ninguna                                     |
| constantes de layout evaluadas        |    **3** | 3/3 excluidas del core compartido inicial   |
| tipos físicos de UI compartida        |    **0** | no corresponden a esta tarea                |
| unidades de implementación ejecutadas |    **0** | no existe asignación ejecutable todavía     |
| packages físicos creados              |    **0** | no autorizado en el marcador global         |
| cambios Supabase                      |    **0** | no aplica                                   |

---

#### 5. Identidades contractuales

| Identidad                                    | Función                                                                    |
| -------------------------------------------- | -------------------------------------------------------------------------- |
| `VENTO-DESIGN-TOKENS-CONTRACT-001`           | contrato global reusable                                                   |
| `SHELL-NATIVE-TOKENS-ANIMA-001`              | snapshot documental inicial compatible con la paleta centralizada de ANIMA |
| `SHELL-NATIVE-001::<implementation_unit_id>` | futura materialización física única de la unidad                           |
| `package_id`                                 | paquete propietario o consumidor autorizado por el ciclo E5                |
| `implementation_unit_id`                     | identidad que determina unicidad física de la implementación               |

Un `package_id` adicional puede consumir una unidad ya materializada, pero no genera una segunda implementación de `SHELL-NATIVE-001` para el mismo `implementation_unit_id`.

---

#### 6. Snapshot canónico inicial de color

El core inicial contiene exactamente 17 tokens de color:

| Token canónico                    | Valor     |
| --------------------------------- | --------- |
| `color.border.default`            | `#E6E1EA` |
| `color.border.soft`               | `#EFEAF2` |
| `color.brand.accent`              | `#E2006A` |
| `color.brand.accent-soft`         | `#FCE7F3` |
| `color.brand.rose-gold`           | `#B76E79` |
| `color.brand.rose-gold-bright`    | `#F2C6C0` |
| `color.shadow.default`            | `#1B1A1F` |
| `color.state.danger`              | `#DC2626` |
| `color.state.disabled-background` | `#F2EEF2` |
| `color.state.info`                | `#2563EB` |
| `color.state.success`             | `#16A34A` |
| `color.state.warning`             | `#D97706` |
| `color.surface.base`              | `#FFFFFF` |
| `color.surface.canvas`            | `#F7F5F8` |
| `color.surface.subtle`            | `#F2EEF2` |
| `color.text.muted`                | `#9E9AA6` |
| `color.text.primary`              | `#1B1A1F` |

Los valores se derivan únicamente del snapshot centralizado actual de ANIMA; esta tarea no inventa una nueva paleta.

---

#### 7. Adaptador de compatibilidad ANIMA `ANIMA_COLORS_V1`

El adaptador deberá preservar exactamente las 22 claves actuales de `COLORS` mientras esta línea de compatibilidad permanezca soportada:

| Clave ANIMA      | Token canónico                    | Valor resuelto |
| ---------------- | --------------------------------- | -------------- |
| `accent`         | `color.brand.accent`              | `#E2006A`      |
| `accentSoft`     | `color.brand.accent-soft`         | `#FCE7F3`      |
| `accentViolet`   | `color.brand.rose-gold-bright`    | `#F2C6C0`      |
| `border`         | `color.border.default`            | `#E6E1EA`      |
| `borderSoft`     | `color.border.soft`               | `#EFEAF2`      |
| `danger`         | `color.state.danger`              | `#DC2626`      |
| `disabledBg`     | `color.state.disabled-background` | `#F2EEF2`      |
| `disabledText`   | `color.text.muted`                | `#9E9AA6`      |
| `info`           | `color.state.info`                | `#2563EB`      |
| `neutral`        | `color.text.muted`                | `#9E9AA6`      |
| `porcelain`      | `color.surface.canvas`            | `#F7F5F8`      |
| `porcelainAlt`   | `color.surface.subtle`            | `#F2EEF2`      |
| `roseGoldGlow`   | `color.brand.rose-gold-bright`    | `#F2C6C0`      |
| `rosegold`       | `color.brand.rose-gold`           | `#B76E79`      |
| `rosegoldBright` | `color.brand.rose-gold-bright`    | `#F2C6C0`      |
| `shadow`         | `color.shadow.default`            | `#1B1A1F`      |
| `success`        | `color.state.success`             | `#16A34A`      |
| `surface`        | `color.surface.base`              | `#FFFFFF`      |
| `text`           | `color.text.primary`              | `#1B1A1F`      |
| `textMuted`      | `color.text.muted`                | `#9E9AA6`      |
| `warning`        | `color.state.warning`             | `#D97706`      |
| `white`          | `color.surface.base`              | `#FFFFFF`      |

**Conciliación:** 22 claves esperadas, 22 materializadas en el contrato, 0 faltantes, 0 duplicadas.

`accentViolet` se conserva únicamente como alias de compatibilidad hacia `color.brand.rose-gold-bright`; su nombre no autoriza reinterpretar el valor como violeta.

---

#### 8. Exclusiones explícitas del core inicial

Las tres constantes observadas en `src/constants/layout.ts` quedan fuera del snapshot compartido inicial:

| Constante ANIMA              | Valor | Decisión                                                                     |
| ---------------------------- | ----: | ---------------------------------------------------------------------------- |
| `CONTENT_MAX_WIDTH`          |   760 | local a ANIMA hasta demostrar semántica transversal                          |
| `CONTENT_HORIZONTAL_PADDING` |    20 | candidata futura; no promovida sin inventario de consumidores y equivalencia |
| `MODAL_MAX_WIDTH`            |   680 | local a ANIMA hasta demostrar semántica transversal                          |

La exclusión evita convertir decisiones de layout específicas de una aplicación en obligaciones para todos los consumidores.

También quedan fuera de `SHELL-NATIVE-001`:

- páginas y formularios completos;
- componentes React Native;
- componentes React web;
- navegación y AppShell;
- procesos empresariales;
- consultas propias de aplicaciones;
- estilos locales sin semántica compartida demostrada.

---

#### 9. Contrato lógico del artefacto

La futura fuente física deberá poder representarse como JSON puro con esta forma lógica mínima:

| Campo                    | Regla                                                   |
| ------------------------ | ------------------------------------------------------- |
| `schema`                 | identidad versionada del contrato                       |
| `implementation_unit_id` | unidad propietaria exacta                               |
| `artifact_version`       | versión inmutable de la materialización                 |
| `source_refs`            | fuentes y commits/blobs usados para derivar los valores |
| `core_tokens`            | mapa no vacío de `token_id → valor tipado`              |
| `adapters`               | mapas derivados por consumidor o plataforma             |
| `compatibility`          | consumidores y versiones declaradas                     |
| `digest`                 | SHA-256 del payload canónico serializado                |

No se admite que el valor canónico dependa de ejecutar JavaScript, leer el DOM, consultar una API, resolver variables de ambiente o importar una biblioteca de UI.

---

#### 10. Reglas de identidad y valor

Cada token físico deberá satisfacer simultáneamente:

1. `token_id` único dentro de la versión;
2. identidad estable entre serializaciones equivalentes;
3. tipo declarado y valor válido para ese tipo;
4. valor literal o referencia, nunca ambos;
5. toda referencia resuelve dentro del artefacto permitido;
6. el grafo de referencias es acíclico;
7. un alias no cambia el valor resuelto;
8. un adaptador no redefine silenciosamente el core;
9. un token retirado o renombrado sigue la política de compatibilidad y deprecación aplicable;
10. valores no finitos o no serializables quedan rechazados.

El snapshot inicial usa únicamente tokens `color` con hexadecimal `#RRGGBB` en mayúsculas.

---

#### 11. Serialización determinista y huella

La representación normativa de `SHELL-NATIVE-TOKENS-ANIMA-001` usa:

- UTF-8;
- JSON sin comentarios;
- claves de objetos ordenadas lexicográficamente;
- separadores JSON `,` y `:` sin espacios para la entrada de huella;
- arrays en orden contractual;
- SHA-256 sobre los bytes UTF-8 resultantes.

Huella documental del snapshot definido por esta tarea:

`sha256:1574d64548d53fc41e3755cc0c3d31db67b7fe38b1a34d9b7b9fd3563ee1e449`

Payload normativo:

```json
{
  "adapters": {
    "ANIMA_COLORS_V1": {
      "accent": "color.brand.accent",
      "accentSoft": "color.brand.accent-soft",
      "accentViolet": "color.brand.rose-gold-bright",
      "border": "color.border.default",
      "borderSoft": "color.border.soft",
      "danger": "color.state.danger",
      "disabledBg": "color.state.disabled-background",
      "disabledText": "color.text.muted",
      "info": "color.state.info",
      "neutral": "color.text.muted",
      "porcelain": "color.surface.canvas",
      "porcelainAlt": "color.surface.subtle",
      "roseGoldGlow": "color.brand.rose-gold-bright",
      "rosegold": "color.brand.rose-gold",
      "rosegoldBright": "color.brand.rose-gold-bright",
      "shadow": "color.shadow.default",
      "success": "color.state.success",
      "surface": "color.surface.base",
      "text": "color.text.primary",
      "textMuted": "color.text.muted",
      "warning": "color.state.warning",
      "white": "color.surface.base"
    }
  },
  "core_tokens": {
    "color.border.default": "#E6E1EA",
    "color.border.soft": "#EFEAF2",
    "color.brand.accent": "#E2006A",
    "color.brand.accent-soft": "#FCE7F3",
    "color.brand.rose-gold": "#B76E79",
    "color.brand.rose-gold-bright": "#F2C6C0",
    "color.shadow.default": "#1B1A1F",
    "color.state.danger": "#DC2626",
    "color.state.disabled-background": "#F2EEF2",
    "color.state.info": "#2563EB",
    "color.state.success": "#16A34A",
    "color.state.warning": "#D97706",
    "color.surface.base": "#FFFFFF",
    "color.surface.canvas": "#F7F5F8",
    "color.surface.subtle": "#F2EEF2",
    "color.text.muted": "#9E9AA6",
    "color.text.primary": "#1B1A1F"
  },
  "schema": "vento.design-tokens@1",
  "snapshot_id": "SHELL-NATIVE-TOKENS-ANIMA-001",
  "source_refs": [
    {
      "blob_sha": "947d02268a274d18e95de3a5a994bc70e7179f88",
      "path": "src/constants/colors.ts",
      "repository": "devVentoGroup/vento-anima"
    }
  ],
  "token_type": "color"
}
```

La futura implementación física deberá reproducir esta huella para este snapshot o declarar una versión posterior con diff y lineage explícitos; no podrá reutilizar la identidad del snapshot con bytes distintos.

---

#### 12. Compatibilidad con ANIMA

Una futura instancia solo podrá declarar compatibilidad ANIMA cuando, sobre el mismo commit y versión de artefacto:

1. el adaptador exponga las 22 claves de `ANIMA_COLORS_V1`;
2. cada clave resuelva al valor documentado en la sección 7;
3. los aliases históricos continúen resolviendo al mismo valor mientras sigan soportados;
4. el consumo no requiera DOM ni CSS;
5. el core no importe `react`, `react-native`, `expo` ni módulos propios de ANIMA;
6. ANIMA pueda consumir el adaptador con su toolchain declarada;
7. typecheck/build y pruebas aplicables del consumidor estén en `PASS`;
8. el diff de adopción no traslade UI, navegación ni lógica de dominio al package de tokens.

La compatibilidad contractual no equivale a que ANIMA ya haya migrado: esa evidencia pertenece a la futura instancia.

---

#### 13. Regla multiplataforma

La fuente canónica es independiente de plataforma. Web, React Native u otros consumidores obtienen representaciones derivadas mediante adaptadores.

Reglas:

- el adaptador puede cambiar formato de consumo, no significado;
- una plataforma no puede introducir un valor alterno bajo el mismo token sin una variante contractual explícita;
- diferencias de unidad, API o sintaxis se resuelven en el adaptador;
- un consumidor no puede convertirse en fuente de verdad paralela;
- una prueba de un adaptador no sustituye las pruebas de los demás consumidores declarados.

---

#### 14. Contrato de entrada de cada instancia

Toda `SHELL-NATIVE-001::<implementation_unit_id>` deberá materializar como mínimo:

| Campo                    | Obligación                                                        |
| ------------------------ | ----------------------------------------------------------------- |
| `implementation_unit_id` | unidad exacta asignada por `DELIV-PKG-025`                        |
| `owner_package_id`       | paquete propietario con `E5-GATE-008::<package_id> = PASS`        |
| `consumer_package_ids`   | lista cerrada de paquetes que consumen la unidad                  |
| repositorio              | repositorio físico propietario                                    |
| package físico           | nombre/ruta exactos aprobados por el paquete                      |
| baseline                 | commit anterior a la materialización                              |
| result commit            | commit exacto que contiene la implementación                      |
| artifact version         | versión exacta                                                    |
| source refs              | fuentes de valores y contratos                                    |
| token inventory          | inventario completo de tokens y aliases                           |
| adapters                 | adaptadores incluidos                                             |
| consumer matrix          | consumidor, versión, plataforma y estado                          |
| digest                   | huella del payload canónico                                       |
| tests                    | resultados unitarios, contractuales, serialización y consumidores |
| rollback                 | snapshot y procedimiento reproducible                             |
| blockers                 | lista cerrada con propietario y condición de salida               |

Un campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 15. Unicidad por `implementation_unit_id`

La identidad física se agrega por unidad, no por paquete.

```text
1 implementation_unit_id
→ máximo 1 SHELL-NATIVE-001::<implementation_unit_id>
→ máximo 1 core físico propietario
→ máximo 1 serializador propietario
→ máximo 1 conjunto propietario de pruebas del core
→ N package_id consumidores mediante lineage
```

Si dos paquetes reciben el mismo `implementation_unit_id`, el segundo referencia la implementación existente. Si reciben unidades distintas, cada unidad se evalúa independientemente.

---

#### 16. Versionado y cambios compatibles

Toda versión física deberá distinguir:

- adición compatible de token o adaptador;
- cambio de valor de un token existente;
- cambio de tipo;
- renombrado;
- retiro;
- cambio de semántica;
- cambio de serialización;
- cambio de digest sin cambio lógico aparente.

Renombrar, retirar, cambiar tipo o cambiar significado se considera ruptura contractual hasta demostrar una transición compatible. Un cambio de valor visible exige matriz de consumidores y evidencia de aceptación; no puede ocultarse como refactor interno.

---

#### 17. Adopción por consumidores

Un consumidor adopta una versión únicamente cuando:

1. referencia el artefacto/version exactos;
2. su package_id y implementation_unit_id quedan vinculados;
3. las claves consumidas existen;
4. no mantiene una copia manual divergente del mismo core;
5. supera su matriz de compatibilidad;
6. conserva rollback a una combinación soportada;
7. la evidencia pertenece al commit adoptado.

La coexistencia temporal con constantes locales es admisible durante migración si su equivalencia está demostrada y el retiro queda asignado a la tarea propietaria correspondiente.

---

#### 18. Doce gates de una futura materialización

| Gate               | PASS                                              | Bloqueo                            |
| ------------------ | ------------------------------------------------- | ---------------------------------- |
| 1. identidad       | unidad, package, versión y commits inequívocos    | identidad ambigua                  |
| 2. procedencia     | fuentes y valores atribuibles                     | valor sin origen                   |
| 3. inventario      | todos los tokens y aliases enumerados             | faltantes o duplicados             |
| 4. schema          | campos, tipos e IDs válidos                       | payload inválido                   |
| 5. referencias     | referencias resolubles y acíclicas                | referencia rota o ciclo            |
| 6. serialización   | salida determinista y digest reproducible         | huella distinta                    |
| 7. ANIMA           | matriz ANIMA y 22 claves compatibles              | clave/valor divergente             |
| 8. multiplataforma | adaptadores declarados conservan semántica        | drift de plataforma                |
| 9. aislamiento     | core sin imports UI/plataforma                    | acoplamiento React/RN/Expo/DOM/CSS |
| 10. consumidores   | pruebas de cada consumidor declarado en PASS      | consumidor sin validar             |
| 11. unicidad       | una implementación por unidad y lineage completo  | copia física duplicada             |
| 12. rollback       | restauración reproducible a combinación soportada | rollback no probado                |

La instancia queda `PASS` solo con todos los gates obligatorios en `PASS`; cualquier evidencia de otra versión, commit o unidad es `STALE`.

---

#### 19. Perfil de pruebas aplicable

La futura materialización deberá ejecutar como mínimo:

| Perfil               | Cobertura mínima                                                                  |
| -------------------- | --------------------------------------------------------------------------------- |
| unitarias            | IDs, tipos, valores, aliases, referencias, ciclos y errores                       |
| contractuales        | schema, 17 tokens/22 claves del snapshot inicial o diff versionado posterior      |
| serialización        | determinismo, orden, bytes y SHA-256 repetible                                    |
| compatibilidad ANIMA | resolución exacta de `ANIMA_COLORS_V1` y consumo con toolchain vigente            |
| multiplataforma      | cada adaptador declarado contra el mismo core                                     |
| regresión            | ausencia de cambios visuales/contractuales no declarados en consumidores migrados |
| lineage              | correspondencia unidad–package–versión–commit–digest                              |
| rollback             | retorno a versión soportada y repetición de pruebas esenciales                    |

No se declara ninguna de estas pruebas como ejecutada físicamente durante el marcador global.

---

#### 20. Evidencia requerida por instancia

| Clase                 | Contenido mínimo                                                   |
| --------------------- | ------------------------------------------------------------------ |
| `LINEAGE`             | unidad, package_id, repositorio, baseline, result commit y versión |
| `SOURCE_PROVENANCE`   | fuentes y hashes/blobs de los valores                              |
| `TOKEN_INVENTORY`     | tokens, aliases, tipos y valores resueltos                         |
| `SERIALIZATION`       | payload canónico, digest y repetición                              |
| `ANIMA_COMPATIBILITY` | 22 claves, toolchain y resultados de consumidor                    |
| `MULTIPLATFORM`       | adaptadores y resultados por plataforma declarada                  |
| `BUILD_REGRESSION`    | typecheck, build/export y pruebas aplicables                       |
| `ROLLBACK`            | snapshot, procedimiento, ensayo y resultado                        |
| `CERTIFICATION`       | doce gates y estado agregado                                       |

---

#### 21. Rollback

El rollback de una instancia deberá poder restaurar de forma coordinada:

1. versión anterior del artefacto;
2. adapter anterior;
3. referencias del consumidor;
4. manifest y lockfile cuando hayan cambiado;
5. fixtures/snapshots contractuales aplicables.

El rollback no podrá depender de editar `node_modules`, mutar una versión publicada ni reintroducir una copia manual no gobernada.

---

#### 22. Condiciones de suspensión

Una instancia queda `BLOCKED` si ocurre cualquiera de estas condiciones:

- `implementation_unit_id` ausente o ambiguo;
- package propietario sin `E5-GATE-008` en `PASS`;
- valor de token sin fuente verificable;
- clave ANIMA faltante o con valor distinto durante la línea de compatibilidad;
- token duplicado;
- referencia no resoluble o cíclica;
- payload no determinista;
- digest no reproducible;
- core dependiente de React, React Native, Expo, DOM o CSS;
- consumidor declarado sin prueba;
- copia física paralela para la misma unidad;
- evidencia de otro commit, versión o unidad;
- rollback no reproducible;
- inclusión de UI o lógica empresarial fuera del alcance.

---

#### 23. Requisitos de prueba derivados

**Resultado:** GENERA 4 REQUISITOS DE PRUEBA.

**Creados:**

- `TREQ-SHELL-045` — integridad exacta del snapshot inicial 17 tokens / 22 claves ANIMA;
- `TREQ-SHELL-046` — serialización determinista, referencias válidas y huella reproducible;
- `TREQ-SHELL-047` — compatibilidad ANIMA y multiplataforma sin acoplamiento del core;
- `TREQ-SHELL-048` — unicidad física por `implementation_unit_id` y lineage multi-package.

No se modifica ni obsoleta ningún requisito histórico.

---

#### 24. Puerta de cierre del marcador global

El marcador global queda documentalmente cerrado cuando:

1. existe una sola identidad contractual global;
2. se fija la topología `PER_IMPLEMENTATION_UNIT`;
3. se reconcilia el baseline centralizado actual de ANIMA;
4. se materializan documentalmente 17 tokens canónicos de color;
5. se concilian 22/22 claves `COLORS` mediante adapter;
6. se decide expresamente el tratamiento de las 3 constantes de layout observadas;
7. se define payload serializable y digest;
8. se define compatibilidad ANIMA y multiplataforma;
9. se define contrato de entrada de la futura instancia;
10. se definen doce gates;
11. se define perfil de pruebas y evidencia;
12. se define rollback;
13. se registran `TREQ-SHELL-045` a `TREQ-SHELL-048`;
14. no se afirma que una unidad física ya fue materializada.

---

#### 25. Puerta de cierre de cada futura instancia

`SHELL-NATIVE-001::<implementation_unit_id>` solo podrá quedar `PASS` cuando:

- exista package propietario autorizado;
- el artefacto físico coincida con el contrato y su versión;
- la procedencia de cada valor esté registrada;
- serialización y digest sean reproducibles;
- ANIMA esté validado cuando sea consumidor declarado;
- cada plataforma y consumidor declarado tenga evidencia vigente;
- no exista una segunda implementación física para la misma unidad;
- la matriz de consumidores esté completa;
- el rollback haya sido ensayado;
- los requisitos `TREQ-SHELL-045` a `TREQ-SHELL-048` aplicables estén satisfechos con evidencia atribuible.

---

#### 26. Criterios de aceptación

- [x] se conserva `SHELL-MIG-008` como precedencia de ruta;
- [x] se conserva `SHELL-NATIVE-002` únicamente como siguiente tarea reservada;
- [x] se define un contrato global único;
- [x] se define materialización por `implementation_unit_id`;
- [x] se prohíbe repetir implementación por package_id;
- [x] se comprueba el consumidor ANIMA real sobre Expo/React Native;
- [x] se reconcilian exactamente 22 claves de color centralizadas de ANIMA;
- [x] se materializan exactamente 17 tokens canónicos iniciales;
- [x] se preservan aliases legacy sin reinterpretarlos;
- [x] se excluyen expresamente las 3 constantes de layout del core inicial;
- [x] se define JSON determinista y SHA-256;
- [x] se separa core de adaptadores de plataforma;
- [x] se prohíbe dependencia del core sobre React, React Native, Expo, DOM o CSS;
- [x] se definen doce gates de futura materialización;
- [x] se define perfil unitario, contractual, serialización, compatibilidad, multiplataforma, regresión, lineage y rollback;
- [x] se crean exactamente 4 requisitos de prueba;
- [x] se declaran 0 unidades físicas materializadas;
- [x] se declaran 0 cambios Supabase;
- [x] no se desarrolla `SHELL-NATIVE-002` ni `SHELL-NATIVE-003`.

---

#### 27. Límites

Esta tarea no:

- crea el package físico de tokens;
- decide nombre, ruta o versión del package antes de la asignación E5;
- modifica `vento-anima`;
- migra imports de `COLORS`;
- elimina aliases legacy;
- convierte constantes de layout locales en tokens compartidos;
- comparte componentes React Native o React web;
- traslada AppShell, navegación o lógica de dominio;
- implementa validadores de `SHELL-NATIVE-002`;
- ejecuta una instancia `SHELL-NATIVE-001::<implementation_unit_id>`;
- modifica Supabase, SQL, RLS, RPC, Storage, Realtime, Edge Functions, datos o secretos;
- avanza ni desarrolla la tarea siguiente.

---

#### 28. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-MIG-008 — Definir gate de retiro legacy y certificación por paquete`

**TAREA ACTUAL APROBADA**
`SHELL-NATIVE-001 — Crear tokens compatibles con ANIMA`

**SIGUIENTE TAREA RESERVADA**
`SHELL-NATIVE-002 — Compartir contratos y validadores`


### [ ] SHELL-NATIVE-002 — Compartir contratos y validadores
### [ ] SHELL-NATIVE-003 — Mantener UI React Native separada

No se debe empezar trasladando el AppShell completo. Primero deben compartirse contratos, códigos, tipos, eventos y helpers puros.

No deberán compartirse inicialmente:

páginas completas;
formularios específicos de dominio;
procesos empresariales completos;
consultas propias de una aplicación;
componentes que obliguen a todas las aplicaciones a tener la misma interfaz.
