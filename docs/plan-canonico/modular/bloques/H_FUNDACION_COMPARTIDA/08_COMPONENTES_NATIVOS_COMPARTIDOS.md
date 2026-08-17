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


### ✅ SHELL-NATIVE-002 — Compartir contratos y validadores

**Estado:** APROBADA
**Tarea anterior:** SHELL-NATIVE-001 — Crear tokens compatibles con ANIMA
**Tarea siguiente:** SHELL-NATIVE-003 — Mantener UI React Native separada
**Tipo de tarea:** documental — definición global única de una API reutilizable y portable de contratos y validadores, con futura materialización física `SHELL-NATIVE-002::<implementation_unit_id>` una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/08_COMPONENTES_NATIVOS_COMPARTIDOS.md`
**Estado físico resultante:** `CONTRATO_GLOBAL_DE_API_DE_CONTRATOS_Y_VALIDADORES_ESPECIFICADO`; 1 contrato global; 1 snapshot de cobertura; 8 namespaces contractuales existentes; 30 superficies reconciliadas; 4 políticas de validación; 6 diagnósticos contractuales; 0 unidades materializadas; 0 packages físicos creados
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 6 creados (`TREQ-SHELL-049` a `TREQ-SHELL-054`)
**Modalidad:** `PER_IMPLEMENTATION_UNIT`

---

#### 1. Propósito

`SHELL-NATIVE-002` define una sola vez la API reutilizable mediante la cual consumidores web, Expo/React Native y otros runtimes compatibles podrán consumir los contratos estáticos de Vento OS y validar entradas no confiables sin copiar catálogos, inventar uniones locales, usar casts como validación ni trasladar dependencias de Supabase o de interfaz a la capa contractual.

La tarea fija simultáneamente:

1. el propietario técnico de los contratos y validadores compartidos;
2. la frontera entre `@vento/contracts` y `@vento/os-context`;
3. las superficies contractuales incluidas en el corte vigente;
4. cuatro políticas de validación según la naturaleza de cada superficie;
5. una semántica uniforme `parse` / `is`;
6. un resultado de validación serializable y seguro;
7. seis códigos de diagnóstico contractuales separados de autorización y contexto;
8. reglas de pureza, determinismo y portabilidad multiplataforma;
9. paridad obligatoria entre consumidores para los mismos fixtures y versiones;
10. la futura materialización única por `implementation_unit_id` con lineage multi-package.

La regla central es:

```text
FUENTE CANÓNICA APROBADA
→ artefacto derivado en @vento/contracts
→ validador puro derivado de la misma fuente
→ entrada unknown
→ parse / is
→ valor canónico o rechazo determinista
→ consumidor web o nativo

CONSUMIDOR
-x-> catálogo paralelo
-x-> cast como validación
-x-> heurística
-x-> fallback permisivo
-x-> dependencia de Supabase o UI dentro del validador
```

El marcador global no crea código de producción, no modifica consumidores y no publica una versión física.

---

#### 2. Modalidad canónica y ciclo

La topología aplicable es `PER_IMPLEMENTATION_UNIT`.

```text
MARCADOR GLOBAL SHELL-NATIVE-002
→ define contrato, cobertura, API, políticas, diagnósticos, gates, pruebas y lineage
→ se cierra una sola vez
→ no crea implementación física

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id y package_id propietario

E5-GATE-008::<package_id> = PASS
→ autoriza materialización del alcance aprobado

SHELL-NATIVE-002::<implementation_unit_id>
→ materializa una sola API física de contratos/validadores para la unidad
→ uno o más package_id la consumen mediante lineage
→ no duplica catálogos, parsers, predicados ni fixtures propietarios por package_id
```

**Dependencia de desarrollo:** `SHELL-NATIVE-001`.

**Dependencias de ejecución de una instancia:**

- `DELIV-PKG-025::<package_id>` con `implementation_unit_id` asignado;
- `E5-GATE-008::<package_id> = PASS` para el paquete propietario;
- package físico exacto y repositorio de materialización autorizados por el expediente E5;
- fuentes contractuales vigentes y versionadas;
- consumidores declarados;
- baseline y commit de resultado verificables.

La identidad física concreta, versión npm y rutas internas no se fijan en el marcador global cuando dependan de la unidad todavía no asignada.

---

#### 3. Fuentes contractuales preservadas

`SHELL-NATIVE-002` no crea una segunda semántica. Consume y preserva las decisiones ya aprobadas en:

| Fuente             | Responsabilidad preservada                                                                       |
| ------------------ | ------------------------------------------------------------------------------------------------ |
| `SHELL-CON-001`    | raíz única `@vento/contracts`, pureza, publicación y separación frente a runtime, Supabase y UI  |
| `SHELL-CON-002`    | `AppCode` y catálogo de diez aplicaciones                                                        |
| `SHELL-CON-003`    | `PermissionKey` y separación de activos, aliases, legacy y retirados                             |
| `SHELL-CON-004`    | `BaseRoleCode` de ocho miembros                                                                  |
| `SHELL-CON-005`    | `OperationalRoleCode` de doce miembros                                                           |
| `SHELL-CON-006`    | `PermissionScopeCode` de trece miembros                                                          |
| `SHELL-CON-007`    | familia `vento.authorization.response-contracts@1.0.0` y separación contexto/simulación/decisión |
| `SHELL-CON-008`    | namespaces de razones, problemas estructurales, readiness y metadata cerrada                     |
| `SHELL-CON-009`    | `ProcessId` y `@vento/contracts/processes`                                                       |
| `SHELL-CON-010`    | `ProcessStateId` y sus 592 identidades vigentes                                                  |
| `SHELL-CON-011`    | `ScreenId` y `@vento/contracts/screens`                                                          |
| `SHELL-CON-012`    | `FunctionalActionId` y `@vento/contracts/actions`                                                |
| `SHELL-CON-013`    | `BusinessEventId`, 395 definiciones normales y ocho familias condicionales                       |
| `SHELL-CON-014`    | 49 relaciones de handoff y `@vento/contracts/handoffs`                                           |
| `SHELL-CON-015`    | contrato de work items, referencia opaca `work_item_id` y vocabularios cerrados                  |
| `SHELL-CON-016`    | propiedad funcional y `@vento/contracts/ownership`                                               |
| `SHELL-NATIVE-001` | precedencia inmediata, pureza multiplataforma y regla de materialización por unidad              |

Las tareas propietarias siguen gobernando significado, identidad y evolución. Esta tarea gobierna únicamente la forma común de exponer y validar esas decisiones.

No se anticipa ni incorpora una superficie reservada para una tarea contractual posterior que todavía no forme parte del conjunto materializado por `SHELL-CON-002..016`.

---

#### 4. Línea base técnica verificable

El estado físico previo al marcador global es:

| Elemento                                              | Estado observado                                                                     | Disposición                                       |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------- |
| workspace raíz de `vento-shell`                       | admite `packages/*`                                                                  | base para materialización futura                  |
| `packages/contracts`                                  | no materializado                                                                     | no se crea durante este marcador                  |
| `@vento/contracts`                                    | definido documentalmente, sin release física confirmada                              | propietario lógico de contratos y validadores     |
| `packages/os-context`                                 | existe como package privado `@vento/os-context@0.1.0`                                | consumidor/adaptador runtime posterior            |
| `@vento/os-context`                                   | declara peer dependency de `@supabase/supabase-js`                                   | no puede convertirse en core contractual portable |
| `EffectiveContext` físico actual                      | contiene strings abiertos, `blocked_reasons: string[]`, booleans y metadata genérica | compatibilidad legacy; no contrato canónico       |
| cliente actual de `os-context`                        | ejecuta RPC Supabase                                                                 | queda fuera de la API pura definida aquí          |
| validadores contractuales compartidos para web+nativo | no materializados como API física común                                              | objeto de futura instancia                        |
| cambios físicos en este marcador                      | 0                                                                                    | fase exclusivamente documental                    |

La presencia de tipos parciales en `@vento/os-context` no los convierte en autoridad de catálogo ni justifica duplicar los contratos ya aprobados en `@vento/contracts`.

---

#### 5. Propiedad y fronteras

La propiedad queda definida en tres niveles distintos:

```text
FUENTE SEMÁNTICA
→ tarea/registro propietario de cada contrato

PROPIETARIO TÉCNICO COMPARTIDO
→ @vento/contracts
→ proyecciones, tipos, catálogos y validadores puros

CONSUMIDORES RUNTIME
→ @vento/os-context
→ aplicaciones web
→ ANIMA / Expo / React Native
→ otros consumidores declarados
```

Reglas vinculantes:

1. `@vento/contracts` es la autoridad técnica compartida para los contratos estáticos y sus validadores puros.
2. `@vento/os-context` consume contratos y validadores; no redefine catálogos ya centralizados.
3. Supabase produce o persiste hechos según sus contratos propietarios; no define el significado local de los tipos compartidos.
4. una aplicación consumidora no mantiene una unión, enum, array o lista paralela como autoridad cuando exista una fuente compartida publicada;
5. los helpers de validación no ejecutan autorización, contexto, persistencia, navegación ni lógica empresarial;
6. un validator no adquiere propiedad semántica sobre el contrato que valida;
7. la futura unidad física conserva un solo propietario por `implementation_unit_id`, independientemente de cuántos paquetes la consuman.

---

#### 6. Namespaces reutilizados en el corte vigente

La API se distribuye sobre ocho superficies lógicas ya aprobadas; esta tarea no crea un noveno namespace público solo para validación:

```text
@vento/contracts/authorization
@vento/contracts/processes
@vento/contracts/screens
@vento/contracts/actions
@vento/contracts/events
@vento/contracts/handoffs
@vento/contracts/work-items
@vento/contracts/ownership
```

Cada namespace podrá exponer los validadores correspondientes desde una única implementación compartida y reutilizar las primitivas comunes de resultado y diagnóstico.

La ubicación física interna de esas primitivas comunes no se convierte en API pública por existir dentro del package.

---

#### 7. Cuatro políticas de validación

Cada superficie debe declarar exactamente una política primaria:

| Política             | Uso                                                                     | Regla de aceptación                                                                                                |
| -------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `CLOSED_MEMBERSHIP`  | códigos e identidades con conjunto finito aprobado                      | tipo/forma válida **y** pertenencia al conjunto publicado                                                          |
| `STRUCTURED_SCHEMA`  | objetos contractuales con forma y versión aprobadas                     | estructura, discriminantes, cardinalidad y versiones compatibles                                                   |
| `COMPOSITE_RELATION` | relaciones cuya identidad depende de una tupla o mapping aprobado       | componentes válidos **y** relación existente en la fuente propietaria                                              |
| `OPAQUE_REFERENCE`   | referencias runtime cuya forma no fue fijada como identidad contractual | no se inventa patrón, secuencia o membresía global; se valida únicamente dentro del contrato propietario aplicable |

Estas políticas impiden aplicar una misma heurística a conceptos que poseen naturalezas distintas.

---

#### 8. Snapshot de cobertura `SHELL-NATIVE-CONTRACTS-VALIDATORS-001`

El corte vigente reconcilia exactamente 30 superficies:

|    # | Superficie                         | Namespace     | Política                     |                             Cobertura vigente | Fuente          |
| ---: | ---------------------------------- | ------------- | ---------------------------- | --------------------------------------------: | --------------- |
|    1 | `AppCode`                          | authorization | `CLOSED_MEMBERSHIP`          |                                            10 | `SHELL-CON-002` |
|    2 | `PermissionKey`                    | authorization | `CLOSED_MEMBERSHIP`          |                                           140 | `SHELL-CON-003` |
|    3 | `BaseRoleCode`                     | authorization | `CLOSED_MEMBERSHIP`          |                                             8 | `SHELL-CON-004` |
|    4 | `OperationalRoleCode`              | authorization | `CLOSED_MEMBERSHIP`          |                                            12 | `SHELL-CON-005` |
|    5 | `PermissionScopeCode`              | authorization | `CLOSED_MEMBERSHIP`          |                                            13 | `SHELL-CON-006` |
|    6 | `AccessContextV1`                  | authorization | `STRUCTURED_SCHEMA`          |                                    1 contrato | `SHELL-CON-007` |
|    7 | `SimulationContextV1`              | authorization | `STRUCTURED_SCHEMA`          |                                    1 contrato | `SHELL-CON-007` |
|    8 | `AuthorizationDecisionV1`          | authorization | `STRUCTURED_SCHEMA`          |                                    1 contrato | `SHELL-CON-007` |
|    9 | `SimulatedAuthorizationDecisionV1` | authorization | `STRUCTURED_SCHEMA`          |                                    1 contrato | `SHELL-CON-007` |
|   10 | `AuthorizationReasonCode`          | authorization | `CLOSED_MEMBERSHIP`          |                                            20 | `SHELL-CON-008` |
|   11 | `StructuralIssueCode`              | authorization | `CLOSED_MEMBERSHIP`          |                                           100 | `SHELL-CON-008` |
|   12 | `LaneAvailabilityReasonCode`       | authorization | `CLOSED_MEMBERSHIP`          |                                            10 | `SHELL-CON-008` |
|   13 | `LaneReasonCode`                   | authorization | `CLOSED_MEMBERSHIP` derivada |                                           110 | `SHELL-CON-008` |
|   14 | `StructuralIssueSeverity`          | authorization | `CLOSED_MEMBERSHIP`          |                                             5 | `SHELL-CON-008` |
|   15 | `StructuralIssueSubjectType`       | authorization | `CLOSED_MEMBERSHIP`          |                                            17 | `SHELL-CON-008` |
|   16 | `StructuralIssueSource`            | authorization | `CLOSED_MEMBERSHIP`          |                                            15 | `SHELL-CON-008` |
|   17 | `ProcessId`                        | processes     | `CLOSED_MEMBERSHIP`          |                                            69 | `SHELL-CON-009` |
|   18 | `ProcessStateId`                   | processes     | `CLOSED_MEMBERSHIP`          |                                           592 | `SHELL-CON-010` |
|   19 | `ScreenId`                         | screens       | `CLOSED_MEMBERSHIP`          |                                           177 | `SHELL-CON-011` |
|   20 | `FunctionalActionId`               | actions       | `CLOSED_MEMBERSHIP`          |                                           885 | `SHELL-CON-012` |
|   21 | `BusinessEventId`                  | events        | `CLOSED_MEMBERSHIP`          |                                           395 | `SHELL-CON-013` |
|   22 | familia condicional de evento      | events        | `CLOSED_MEMBERSHIP`          |                                             8 | `SHELL-CON-013` |
|   23 | `ApplicationHandoffRelation`       | handoffs      | `COMPOSITE_RELATION`         |                                            49 | `SHELL-CON-014` |
|   24 | `work_item_id`                     | work-items    | `OPAQUE_REFERENCE`           | dinámica; sin parser de formato independiente | `SHELL-CON-015` |
|   25 | clase de work item                 | work-items    | `CLOSED_MEMBERSHIP`          |                                             8 | `SHELL-CON-015` |
|   26 | estado de work item                | work-items    | `CLOSED_MEMBERSHIP`          |                                            16 | `SHELL-CON-015` |
|   27 | readiness de work item             | work-items    | `CLOSED_MEMBERSHIP`          |                                             7 | `SHELL-CON-015` |
|   28 | propiedad de proceso               | ownership     | `COMPOSITE_RELATION`         |                                   69 mappings | `SHELL-CON-016` |
|   29 | fuente objetivo por subcapacidad   | ownership     | `COMPOSITE_RELATION`         |                                217 decisiones | `SHELL-CON-016` |
|   30 | estado de fuente objetivo          | ownership     | `CLOSED_MEMBERSHIP`          |                                             5 | `SHELL-CON-016` |

**Conciliación:** 30 superficies esperadas, 30 cubiertas, 0 omitidas dentro del corte `SHELL-CON-002..016`, 0 superficies añadidas desde tareas futuras.

`LaneReasonCode` se registra como unión derivada de 100 `StructuralIssueCode` + 10 `LaneAvailabilityReasonCode`; sus 110 valores no constituyen una tercera fuente editable.

Las 49 relaciones de handoff, las 69 asignaciones de propiedad de proceso y las 217 decisiones de fuente objetivo se validan desde sus fuentes propietarias; esta tarea no crea copias manuales de esas matrices.

---

#### 9. Regla especial de referencias opacas

`work_item_id` permanece una referencia runtime opaca porque `SHELL-CON-015` no aprobó una gramática serial universal para esa identidad.

Por tanto:

```text
NO EXISTE en este corte:
→ regex canónica de work_item_id
→ secuencia global canónica de work_item_id
→ catálogo global de work_item_id
→ parseWorkItemId basado en sintaxis inventada
```

Un consumidor puede transportar y validar la presencia/tipo que exija el contrato físico propietario cuando este exista, pero no inferirá proceso, aplicación, actor, permiso, prioridad, territorio o estado a partir de la forma del identificador.

La ausencia de un validador de formato sintético es una decisión de seguridad contractual, no una brecha de cobertura.

---

#### 10. API uniforme `parse` / `is`

Para toda superficie `CLOSED_MEMBERSHIP`, `STRUCTURED_SCHEMA` o `COMPOSITE_RELATION`, la futura API física deberá ofrecer dos operaciones semánticas equivalentes:

```text
parseX(input: unknown) -> ContractValidationResult<X>
isX(input: unknown) -> boolean / type predicate
```

Reglas:

1. `parseX` es la operación normativa para frontera externa;
2. `isX` devuelve `true` exactamente cuando `parseX(input)` produce `ok = true`;
3. `isX` no aplica normalización adicional;
4. `parseX` no convierte ni corrige silenciosamente el input;
5. ambas operaciones consumen la misma fuente derivada y la misma versión;
6. ninguna mantiene una lista manual paralela;
7. una implementación puede generar los nombres concretos de exports desde el tipo aprobado, pero no puede cambiar esta semántica.

No se exige una operación `assertX` pública en el contrato mínimo. La entrada inválida ordinaria se modela mediante resultado explícito y no mediante excepciones como flujo normal de control.

---

#### 11. Resultado común de validación

La forma conceptual común queda:

```text
type ContractValidationIssueCode =
  | "INVALID_TYPE"
  | "INVALID_FORMAT"
  | "UNKNOWN_MEMBER"
  | "INVALID_STRUCTURE"
  | "UNSUPPORTED_CONTRACT_VERSION"
  | "UNSUPPORTED_SCHEMA_VERSION";

type ContractValidationIssue = {
  code: ContractValidationIssueCode;
  contract_id: string;
  path: string | null;
  expected_version: string | null;
  received_version: string | null;
};

type ContractValidationResult<T> =
  | { ok: true; value: T }
  | { ok: false; issue: ContractValidationIssue };
```

Esta forma es una interfaz contractual conceptual; no fija archivo, librería de schema ni implementación física antes de la instancia E5.

`ContractValidationIssue` no incluye por defecto el valor bruto rechazado, secretos, tokens de sesión, credenciales, datos personales ni stack traces.

---

#### 12. Semántica exacta de los seis diagnósticos

| Código                         | Uso exacto                                                                                              |
| ------------------------------ | ------------------------------------------------------------------------------------------------------- |
| `INVALID_TYPE`                 | el tipo primitivo o contenedor requerido no coincide                                                    |
| `INVALID_FORMAT`               | el valor tiene tipo admisible, pero viola la gramática aprobada de una identidad que sí posee gramática |
| `UNKNOWN_MEMBER`               | forma válida, pero el valor, tupla o mapping no pertenece al conjunto publicado                         |
| `INVALID_STRUCTURE`            | un contrato estructurado incumple campos, nulabilidad, cardinalidad o discriminantes obligatorios       |
| `UNSUPPORTED_CONTRACT_VERSION` | la versión contractual recibida no está soportada por el validator activo                               |
| `UNSUPPORTED_SCHEMA_VERSION`   | la versión de schema recibida no está soportada por el validator activo                                 |

Separaciones obligatorias:

- estos códigos no son `AuthorizationReasonCode`;
- no son `StructuralIssueCode`;
- no son HTTP status;
- no son SQLSTATE;
- no son nombres de excepción;
- no son copy de UI;
- no conceden ni deniegan autorización por sí solos.

Un diagnóstico contractual describe por qué un valor no puede convertirse en el tipo compartido solicitado.

---

#### 13. Reglas fail-closed y prohibición de coerción

La frontera de validación obedece:

```text
unknown
→ comprobar tipo
→ comprobar formato cuando exista
→ comprobar versión/schema cuando aplique
→ comprobar estructura o pertenencia
→ producir tipo canónico

cualquier fallo
→ resultado ok=false
→ no tipo canónico
```

Queda prohibido como sustituto de validación:

- `value as AppCode`;
- `value as PermissionKey`;
- cast doble;
- `as unknown as X`;
- `trim`, case-folding o corrección ortográfica implícitos;
- concatenación para fabricar una identidad;
- aproximación por prefijo;
- aceptación de un valor porque “parece” válido;
- fallback a un miembro parecido;
- aceptar una versión desconocida como la última conocida;
- convertir aliases o legacy en miembros activos sin el resolver de compatibilidad propietario.

Una transformación solo puede ocurrir cuando la fuente contractual propietaria la define expresamente y la API de compatibilidad está separada del parser canónico.

---

#### 14. Casos contractuales de referencia

Los siguientes resultados quedan fijados como oracles mínimos de la futura implementación:

| Entrada                                                    | Parser conceptual            | Resultado                                                           |
| ---------------------------------------------------------- | ---------------------------- | ------------------------------------------------------------------- |
| `shell`                                                    | `AppCode`                    | `ok=true`                                                           |
| `hub`                                                      | `AppCode`                    | `UNKNOWN_MEMBER`                                                    |
| `default`                                                  | `AppCode`                    | `UNKNOWN_MEMBER`                                                    |
| `VPROC-0001`                                               | `ProcessId`                  | `ok=true`                                                           |
| `VPROC-0070`                                               | `ProcessId`                  | `UNKNOWN_MEMBER`                                                    |
| `vproc-0001`                                               | `ProcessId`                  | `INVALID_FORMAT`                                                    |
| `VSCREEN-0001`                                             | `ScreenId`                   | `ok=true`                                                           |
| `VSCREEN-0178`                                             | `ScreenId`                   | `UNKNOWN_MEMBER`                                                    |
| `VSCREEN-0001::SECONDARY:04`                               | `FunctionalActionId`         | `ok=true`                                                           |
| `VSCREEN-0001::SECONDARY:05`                               | `FunctionalActionId`         | `UNKNOWN_MEMBER`                                                    |
| valor activo de `PermissionKey`                            | `PermissionKey`              | `ok=true`                                                           |
| alias o permiso legacy fuera del conjunto activo           | `PermissionKey`              | `UNKNOWN_MEMBER`                                                    |
| `NO_ACTIVE_CHECKIN`                                        | `LaneAvailabilityReasonCode` | `ok=true`                                                           |
| razón pública insertada como lane reason                   | `LaneReasonCode`             | `UNKNOWN_MEMBER`                                                    |
| tupla handoff aprobada                                     | `ApplicationHandoffRelation` | `ok=true`                                                           |
| tupla con `ProcessId` y `AppCode` válidos pero no aprobada | `ApplicationHandoffRelation` | `UNKNOWN_MEMBER`                                                    |
| mapping proceso→owner aprobado                             | propiedad de proceso         | `ok=true`                                                           |
| mapping con propietario distinto del registro              | propiedad de proceso         | `UNKNOWN_MEMBER`                                                    |
| `work_item_id` con forma arbitraria                        | referencia opaca             | no se infiere validez por sintaxis; se remite al contrato productor |

Los fixtures físicos deberán utilizar valores exactos de las fuentes publicadas; esta tabla fija únicamente la semántica esperada.

---

#### 15. Contratos estructurados de autorización

Los parsers de `AccessContextV1`, `SimulationContextV1`, `AuthorizationDecisionV1` y `SimulatedAuthorizationDecisionV1` deberán:

1. exigir discriminantes contractuales compatibles;
2. validar `contract_family`, `contract_name`, `contract_version` y `schema_version` cuando sean obligatorios;
3. conservar la separación entre contexto real, simulación y decisión;
4. validar nested codes mediante los mismos parsers compartidos, no mediante casts;
5. rechazar campos obligatorios ausentes;
6. rechazar una versión crítica desconocida;
7. no promover `EffectiveContext`, `administrative_bypass`, `bypass_applied`, `can_operate` ni metadata genérica a fuente canónica;
8. no convertir `READY` en `ALLOW`;
9. no aceptar strings legacy libres en campos que ya poseen unión cerrada;
10. producir un valor canónico sin introducir autoridad adicional.

El hash aprobado de `vento.authorization.response-contracts@1.0.0` permanece gobernado por `SHELL-CON-007`; esta tarea no crea una versión alternativa.

---

#### 16. Relaciones compuestas

##### 16.1. Handoffs

Una relación de handoff válida exige simultáneamente:

```text
ProcessId válido
+ owner_application AppCode válida
+ participant_application AppCode válida
+ tupla exacta presente entre las 49 relaciones aprobadas
```

La coincidencia de los tres componentes por separado no basta.

##### 16.2. Propiedad de proceso

Una relación de propiedad válida exige:

```text
ProcessId válido
+ owner_app_code AppCode válido
+ mapping exacto presente en PROC-APPLICATION-OWNERSHIP-REGISTRY-001
```

##### 16.3. Fuente objetivo de subcapacidad

La proyección válida conserva las 217 decisiones de `CAP-MAP-008`, incluidos los casos `OBJETIVO_DIVIDIDO`, `OBJETIVO_DIFERIDO` y `SIN_FUENTE_ADECUADA`, sin inferir una propietaria donde la fuente no la define.

Ninguna de las tres relaciones se valida concatenando strings ni duplicando manualmente la matriz propietaria.

---

#### 17. Pureza del runtime contractual

La implementación pública de contratos y validadores deberá ser portable y libre de efectos.

En el runtime público de la unidad quedan prohibidos imports o dependencias requeridas para validar que pertenezcan a:

- `react`;
- `react-native`;
- Expo;
- DOM o CSS;
- Next.js;
- `@supabase/supabase-js`;
- clientes HTTP;
- SDK de almacenamiento;
- variables de ambiente como fuente de significado contractual;
- cookies o sesión;
- acceso a filesystem;
- built-ins exclusivos de Node.js necesarios en runtime;
- hora actual, aleatoriedad o estado global mutable para decidir validez.

Las herramientas de build/generación podrán usar infraestructura de desarrollo si el artefacto runtime publicado permanece portable, determinista y sin esas dependencias.

---

#### 18. Portabilidad multiplataforma

La misma versión lógica del validator deberá producir la misma decisión contractual en todos los targets declarados.

Para un fixture idéntico:

```text
MISMO INPUT
+ MISMA VERSIÓN DE CONTRATO
+ MISMA VERSIÓN DE VALIDATOR
=
MISMO ok
+ MISMO VALOR CANÓNICO CUANDO ok=true
+ MISMO issue.code CUANDO ok=false
```

Una diferencia entre web y Expo/React Native bajo esas condiciones constituye drift y bloquea la certificación de la unidad.

Los adaptadores de consumo pueden cambiar sintaxis de import o empaquetado, pero no membresía, semántica, diagnósticos ni reglas de aceptación.

---

#### 19. Serialización y determinismo

La API deberá conservar resultados y manifests compatibles con JSON puro.

Reglas:

1. el contrato común de resultado no depende de clases con prototipo, funciones o símbolos;
2. los fixtures normativos se serializan en UTF-8;
3. un mismo resultado lógico canonizado produce bytes equivalentes para evidencia;
4. el orden de catálogos derivados se conserva conforme a su fuente propietaria;
5. ningún build reordena semánticamente un conjunto para cambiar su digest;
6. timestamps, rutas temporales, hostname o variables de ambiente no forman parte del payload normativo;
7. un digest pertenece a una versión, commit, snapshot y conjunto de fuentes exactos;
8. bytes distintos bajo la misma identidad contractual requieren investigación y no se aceptan como equivalentes por conveniencia.

---

#### 20. Payload normativo del snapshot de cobertura

La representación normativa de `SHELL-NATIVE-CONTRACTS-VALIDATORS-001` usa JSON UTF-8, claves de objetos ordenadas lexicográficamente para la entrada de huella y arrays en el orden contractual definido por esta tarea.

Huella documental del snapshot:

`sha256:0a273797febd78a33bf05073d3dec509829c15c6629fb99f59b933fc47b5b102`

El snapshot contiene:

```text
schema = vento.contract-validation-api@1
snapshot_id = SHELL-NATIVE-CONTRACTS-VALIDATORS-001
api_owner = @vento/contracts
surface_count = 30
validation_policy_count = 4
diagnostic_code_count = 6
coercion = false
fail_closed = true
```

La futura implementación deberá reproducir ese snapshot lógico o publicar una revisión contractual posterior con diff y lineage. No puede conservar la misma identidad con otra cobertura silenciosa.

---

#### 21. Regla de alias, legacy y compatibilidad

La API canónica no fusiona compatibilidad con identidad activa.

En particular:

- `parsePermissionKey` acepta únicamente las 140 claves activas del corte correspondiente;
- aliases de permiso se resuelven únicamente mediante la frontera de compatibilidad propietaria;
- permisos legacy bloqueados no se convierten automáticamente en activos;
- permisos retirados no se reactivan;
- `hub` no se convierte en `shell` dentro de `parseAppCode`;
- `default` no se convierte en una aplicación;
- un código desconocido no recibe sustitución por semejanza;
- una relación inexistente no se fabrica combinando miembros válidos.

La compatibilidad explícita puede producir un valor canónico, pero debe conservar trazabilidad de la referencia original y no alterar la semántica del parser canónico.

---

#### 22. Contrato de entrada de cada futura instancia

Toda `SHELL-NATIVE-002::<implementation_unit_id>` deberá registrar como mínimo:

| Campo                    | Obligación                                                                           |
| ------------------------ | ------------------------------------------------------------------------------------ |
| `implementation_unit_id` | unidad exacta asignada por `DELIV-PKG-025`                                           |
| `owner_package_id`       | paquete propietario con `E5-GATE-008::<package_id> = PASS`                           |
| `consumer_package_ids`   | lista cerrada de paquetes consumidores                                               |
| repositorio              | repositorio físico propietario                                                       |
| package físico           | identidad exacta autorizada por el expediente E5                                     |
| baseline                 | commit anterior a la materialización                                                 |
| result commit            | commit exacto de implementación                                                      |
| API snapshot             | `SHELL-NATIVE-CONTRACTS-VALIDATORS-001` o revisión aprobada                          |
| contract sources         | fuente, versión/hash cuando exista y procedencia de cada superficie                  |
| public API inventory     | exports públicos exactos y política asociada                                         |
| generated inventory      | catálogos, tipos y validadores generados                                             |
| diagnostic contract      | seis códigos o revisión contractual aprobada                                         |
| fixture inventory        | positivos, negativos, límites y versiones incompatibles                              |
| target matrix            | runtimes/plataformas declarados                                                      |
| consumer matrix          | repositorio, versión, plataforma y resultado por consumidor                          |
| digest                   | huella del manifest/payload canónico aplicable                                       |
| tests                    | resultados unitarios, contractuales, serialización, compatibilidad y multiplataforma |
| rollback                 | versión previa y procedimiento reproducible                                          |
| blockers                 | lista cerrada con propietario y condición de salida                                  |

Un campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 23. Unicidad por `implementation_unit_id`

La materialización se agrega por unidad, no por paquete:

```text
1 implementation_unit_id
→ máximo 1 SHELL-NATIVE-002::<implementation_unit_id>
→ máximo 1 fuente física propietaria de validadores
→ máximo 1 conjunto propietario de catálogos derivados
→ máximo 1 contrato común de diagnóstico para la unidad
→ máximo 1 suite propietaria del core
→ N package_id consumidores mediante lineage
```

Si varios paquetes consumen la misma unidad, todos referencian la misma versión física y sus pruebas de consumidor se agregan a la matriz; no se copian los parsers dentro de cada repositorio.

Una unidad distinta se evalúa independientemente y no puede reutilizar evidencia de otra unidad como si fuera propia.

---

#### 24. Once gates de una futura materialización

| Gate                        | PASS                                                                      | Bloqueo                                           |
| --------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------- |
| 1. identidad                | unidad, owner package, versión y commits inequívocos                      | identidad ambigua                                 |
| 2. fuentes                  | 30 superficies resueltas contra fuentes aprobadas o revisión explícita    | fuente ausente o drift silencioso                 |
| 3. cobertura                | inventario de exports y políticas completo                                | superficie omitida o duplicada                    |
| 4. membresía/schema         | positivos y negativos respetan la fuente                                  | aceptación o rechazo incorrectos                  |
| 5. fail-closed              | coerción, casts, aliases implícitos y versiones desconocidas rechazados   | fallback permisivo                                |
| 6. diagnósticos             | seis códigos y resultado común exactos                                    | excepción/código ambiguo o fuga de input sensible |
| 7. serialización            | fixtures y manifest deterministas; digest reproducible                    | bytes o huella divergentes                        |
| 8. pureza                   | runtime sin UI, Supabase, red, env ni dependencia exclusiva de plataforma | acoplamiento no portable                          |
| 9. multiplataforma          | misma decisión para mismos fixtures/versiones en targets declarados       | drift web/nativo                                  |
| 10. consumidores y unicidad | matriz completa y una sola implementación por unidad                      | consumidor sin validar o copia paralela           |
| 11. rollback                | retorno ensayable a combinación soportada sin mutar releases              | rollback no reproducible                          |

La instancia queda `PASS` únicamente con todos los gates aplicables en `PASS`; evidencia de otra versión, commit o unidad es `STALE`.

---

#### 25. Perfil de pruebas aplicable

La futura materialización deberá ejecutar como mínimo:

| Perfil          | Cobertura mínima                                                          |
| --------------- | ------------------------------------------------------------------------- |
| unitarias       | cada parser/predicate, valores válidos, inválidos, límites y relaciones   |
| contractuales   | counts, membresía, schemas, versiones, discriminantes y diagnósticos      |
| compatibilidad  | versiones soportadas, aliases explícitos y rechazo de legacy/no soportado |
| serialización   | resultado común, manifest, determinismo y digest repetible                |
| multiplataforma | mismos fixtures en targets web y nativos declarados                       |
| consumer-driven | typecheck/build/pruebas de cada consumidor declarado                      |
| regresión       | ausencia de nuevas listas locales, casts permisivos o drift de semántica  |
| lineage         | unidad–package–versión–commit–snapshot–digest                             |
| rollback        | retorno a una versión soportada y repetición de fixtures esenciales       |

No se declara ninguna de estas pruebas como ejecutada físicamente durante el marcador global.

---

#### 26. Evidencia requerida por instancia

| Clase                  | Contenido mínimo                                                   |
| ---------------------- | ------------------------------------------------------------------ |
| `LINEAGE`              | unidad, package_id, repositorio, baseline, result commit y versión |
| `CONTRACT_SOURCES`     | 30 superficies, fuentes, versiones y hashes disponibles            |
| `API_INVENTORY`        | exports, política y owner exactos                                  |
| `COVERAGE`             | counts y pertenencia frente a fuentes propietarias                 |
| `FAIL_CLOSED`          | fixtures de tipo, formato, miembro, schema y versión inválidos     |
| `DIAGNOSTICS`          | seis códigos, paths y ausencia de input sensible                   |
| `SERIALIZATION`        | payload, digest y repetición                                       |
| `PLATFORM_PURITY`      | grafo de dependencias runtime y ausencia de imports prohibidos     |
| `MULTIPLATFORM_PARITY` | mismo fixture y resultado por target                               |
| `CONSUMERS`            | matriz de builds/typechecks/pruebas de consumidores                |
| `ROLLBACK`             | snapshot, procedimiento, ensayo y resultado                        |
| `CERTIFICATION`        | once gates y estado agregado                                       |

---

#### 27. Rollback y versionado

Toda versión física deberá poder retroceder sin mutar un artefacto ya publicado.

El rollback restaura coordinadamente:

1. versión anterior del package contractual;
2. catálogos y tipos derivados de esa versión;
3. parsers/predicados de esa versión;
4. manifest y checksums;
5. referencias y lockfiles de consumidores cuando hayan cambiado;
6. fixtures y snapshots contractuales compatibles.

Cambiar miembros, schema, semántica de diagnóstico, política de coerción o significado de una superficie exige versionado conforme a la fuente propietaria y a la política SemVer aprobada.

Una versión antigua no aprende silenciosamente miembros futuros. Una versión nueva no puede presentarse como compatible si cambia resultados para fixtures existentes sin clasificación y evidencia.

---

#### 28. Hallazgos y destino exacto

| Hallazgo                                                          | Estado                      | Destino                                                                                                          |
| ----------------------------------------------------------------- | --------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `packages/contracts` no existe físicamente                        | esperado en fase documental | futura instancia habilitada por `DELIV-PKG-025` + `E5-GATE-008`; materialización compartida conforme al ciclo E5 |
| `@vento/os-context@0.1.0` mezcla runtime Supabase con tipos laxos | `LEGACY/TRANSITORIO`        | `SHELL-AUTH-001`; `SHELL-CTX-001`; migración de consumidores en tareas propietarias                              |
| `EffectiveContext` acepta strings abiertos y metadata genérica    | `NO_CANÓNICO`               | convergencia ya asignada por `SHELL-CON-007`, `SHELL-CTX-*` y `SHELL-AUTH-*`                                     |
| no existe API física uniforme `parse/is`                          | `DEFINIDO_NO_MATERIALIZADO` | futura `SHELL-NATIVE-002::<implementation_unit_id>`                                                              |
| `work_item_id` no tiene gramática serial universal aprobada       | `OPAQUE_REFERENCE`          | conservar opacidad; no inventar parser de formato                                                                |
| 30 superficies tienen fuente contractual previa                   | `CONCILIADO`                | snapshot `SHELL-NATIVE-CONTRACTS-VALIDATORS-001`                                                                 |
| UI React Native compartida permanece fuera                        | `RESERVADO_POR_SECUENCIA`   | `SHELL-NATIVE-003`                                                                                               |

No se crea una tarea nueva: todos los destinos tienen propietario canónico existente.

---

#### 29. Requisitos de prueba derivados

**Resultado:** GENERA 6 REQUISITOS DE PRUEBA.

**Creados:**

- `TREQ-SHELL-049` — propiedad única de la API y cobertura exacta de las 30 superficies sin catálogos paralelos;
- `TREQ-SHELL-050` — políticas de validación, semántica `parse/is`, fail-closed y prohibición de coerción o formatos inventados;
- `TREQ-SHELL-051` — resultado común, seis diagnósticos contractuales, serialización segura y determinista;
- `TREQ-SHELL-052` — pureza del runtime contractual sin UI, Supabase, red, env ni dependencia exclusiva de plataforma;
- `TREQ-SHELL-053` — paridad multiplataforma y matriz de compatibilidad de consumidores;
- `TREQ-SHELL-054` — unicidad física por `implementation_unit_id`, lineage, evidencia vigente y rollback.

No se modifica, difiere, descarta ni obsoleta ningún requisito histórico.

---

#### 30. Puerta de cierre del marcador global

El marcador global queda documentalmente cerrado cuando:

1. `@vento/contracts` queda fijado como propietario técnico compartido;
2. se conserva la separación frente a `@vento/os-context`, Supabase y UI;
3. se fija topología `PER_IMPLEMENTATION_UNIT`;
4. se reconcilian exactamente ocho namespaces vigentes;
5. se reconcilian 30 superficies con fuente y política explícitas;
6. se definen las cuatro políticas de validación;
7. se preserva `work_item_id` como referencia opaca sin formato inventado;
8. se define la semántica común `parse/is`;
9. se define `ContractValidationResult<T>`;
10. se definen exactamente seis diagnósticos contractuales;
11. se prohíben coerción, casts, heurísticas y fallback silencioso;
12. se define pureza del runtime contractual;
13. se define paridad multiplataforma;
14. se fija snapshot y huella documental;
15. se define contrato de entrada de instancia;
16. se definen once gates;
17. se define evidencia, rollback y versionado;
18. se registran `TREQ-SHELL-049` a `TREQ-SHELL-054`;
19. se mantienen 0 unidades físicas materializadas y 0 cambios Supabase.

---

#### 31. Puerta de cierre de cada futura instancia

`SHELL-NATIVE-002::<implementation_unit_id>` solo podrá quedar `PASS` cuando:

- exista `implementation_unit_id` inequívoco;
- exista package propietario autorizado por E5;
- la API física provenga de una única fuente propietaria;
- el inventario de superficies coincida con el snapshot o revisión aprobada;
- cada parser/predicate use la política correcta;
- valores desconocidos, relaciones inexistentes y versiones incompatibles fallen cerrados;
- los seis diagnósticos se serialicen sin filtrar input sensible;
- el runtime sea portable y sin imports prohibidos;
- web y nativo produzcan paridad para los mismos fixtures aplicables;
- cada consumidor declarado tenga evidencia vigente;
- no exista una segunda implementación para la misma unidad;
- lineage, snapshot, commit, versión y digest coincidan;
- el rollback haya sido ensayado;
- `TREQ-SHELL-049` a `TREQ-SHELL-054` estén satisfechos con evidencia atribuible a la instancia.

---

#### 32. Criterios de aceptación

- [x] se conserva `SHELL-NATIVE-001` como precedencia inmediata;
- [x] se conserva `SHELL-NATIVE-003` únicamente como siguiente tarea reservada;
- [x] se define un contrato global único de API compartida;
- [x] se fija `@vento/contracts` como propietario técnico y `@vento/os-context` como consumidor/adaptador runtime;
- [x] se preservan exactamente ocho namespaces previamente aprobados;
- [x] se reconcilian 30/30 superficies del corte `SHELL-CON-002..016`;
- [x] se definen cuatro políticas de validación;
- [x] se evita inventar formato para `work_item_id`;
- [x] se define semántica uniforme `parse/is`;
- [x] se definen seis diagnósticos contractuales separados de autorización/contexto;
- [x] se prohíben casts, coerción, heurísticas y fallbacks permisivos;
- [x] se conservan counts y relaciones de las fuentes sin crear catálogos paralelos;
- [x] se define un runtime contractual puro y portable;
- [x] se define paridad web/nativo;
- [x] se define snapshot determinista y huella;
- [x] se define materialización única por `implementation_unit_id`;
- [x] se definen once gates, evidencia y rollback;
- [x] se crean exactamente seis requisitos de prueba;
- [x] se declaran 0 packages físicos, 0 migraciones y 0 cambios Supabase;
- [x] no se desarrolla `SHELL-NATIVE-003`.

---

#### 33. Límites

Esta tarea no:

- crea físicamente `packages/contracts`;
- publica `@vento/contracts`;
- decide una versión npm física antes de la habilitación E5;
- modifica `@vento/os-context`;
- migra consumers;
- corrige `EffectiveContext` físicamente;
- crea RPC, SQL, RLS, migraciones o datos;
- ejecuta Supabase;
- crea UI React Native o web;
- mueve AppShell, navegación, páginas o formularios;
- define rutas de aplicación;
- inventa formatos para referencias opacas;
- reabre identidades, counts o decisiones de `SHELL-CON-002..016`;
- incorpora una tarea contractual posterior todavía no materializada;
- ejecuta `SHELL-NATIVE-002::<implementation_unit_id>`;
- avanza ni desarrolla `SHELL-NATIVE-003`.

---

#### 34. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-NATIVE-001 — Crear tokens compatibles con ANIMA`

**TAREA ACTUAL APROBADA**
`SHELL-NATIVE-002 — Compartir contratos y validadores`

**SIGUIENTE TAREA RESERVADA**
`SHELL-NATIVE-003 — Mantener UI React Native separada`


### ✅ SHELL-NATIVE-003 — Mantener UI React Native separada

**Estado:** APROBADA
**Tarea anterior:** SHELL-NATIVE-002 — Compartir contratos y validadores
**Tarea siguiente:** SHELL-AUTH-001 — Consolidar @vento/os-context como SDK canónico de contexto y autorización
**Tipo de tarea:** documental — definición global única de la frontera entre renderer React Native/Expo, renderer web y capas neutrales compartidas, con futura materialización física `SHELL-NATIVE-003::<implementation_unit_id>` una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/08_COMPONENTES_NATIVOS_COMPARTIDOS.md`
**Estado físico resultante:** `CONTRATO_GLOBAL_DE_SEPARACION_DE_UI_NATIVA_ESPECIFICADO`; 1 contrato global; 1 snapshot de frontera; 4 clases de propiedad; 2 familias de renderer separadas; 8 clases inicialmente no compartidas; 0 unidades materializadas; 0 packages físicos creados
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 6 creados (`TREQ-SHELL-055` a `TREQ-SHELL-060`)
**Modalidad:** `PER_IMPLEMENTATION_UNIT`

---

#### 1. Propósito

`SHELL-NATIVE-003` cierra el mini-bloque de componentes nativos compartidos definiendo una frontera verificable que permite reutilizar semántica sin obligar a React Native/Expo y a la UI web a compartir componentes, navegación, layout o árbol de renderizado.

La regla central es:

```text
CONTRATOS + TOKENS + LÓGICA PURA GOBERNADA
→ pueden compartirse entre plataformas

RENDERER REACT NATIVE / EXPO
→ conserva UI nativa y composición propias

RENDERER WEB REACT DOM / CSS
→ conserva @vento/ui-web y composición web propias

MISMA SEMÁNTICA
≠ MISMO COMPONENTE
≠ MISMO LAYOUT
≠ MISMO ÁRBOL DE UI
```

La tarea no crea un package nativo, no mueve componentes de ANIMA y no convierte `@vento/ui-web` en una biblioteca universal.

---

#### 2. Modalidad canónica y ciclo

La topología aplicable es `PER_IMPLEMENTATION_UNIT`.

```text
MARCADOR GLOBAL SHELL-NATIVE-003
→ define frontera, clasificación, dependencias permitidas, gates, pruebas y evidencia
→ se cierra una sola vez
→ no materializa código

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id y package propietario

E5-GATE-008::<package_id> = PASS
→ autoriza la materialización física exacta

SHELL-NATIVE-003::<implementation_unit_id>
→ materializa una sola vez la frontera o superficie nativa aprobada para esa unidad
→ N package_id pueden consumirla mediante lineage
→ no duplica implementación para la misma unidad
```

**Dependencia de desarrollo:** `SHELL-NATIVE-002`.

**Dependencias de ejecución de una instancia:**

- `DELIV-PKG-025::<package_id>` con `implementation_unit_id` asignado;
- `E5-GATE-008::<package_id> = PASS` para el paquete propietario;
- repositorio, package y consumidores exactos definidos por el expediente aprobado;
- baseline de dependencias y renderer verificable;
- versiones de contratos, tokens y toolchains declaradas.

No se fija en este marcador el nombre, directorio ni versión de un eventual package nativo compartido.

---

#### 3. Fuentes y precedencia

La tarea conserva, sin reabrirlas, las decisiones de:

| Fuente                                       | Uso vinculante                                                                             |
| -------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `01_PROTOCOLO.md`                            | continuidad, fase documental, TREQ, evidencia y topología por unidad                       |
| `delivery-contract.json`                     | estructura del artefacto documental y coordinación 04A                                     |
| `active-sequence.json`                       | `SHELL-NATIVE-003` como primera tarea pendiente del segmento H                             |
| `task-work-topology.json`                    | modalidad `PER_IMPLEMENTATION_UNIT`                                                        |
| `SHELL-NATIVE-001`                           | tokens neutrales, adapters de plataforma y exclusión del layout local de ANIMA             |
| `SHELL-NATIVE-002`                           | contratos, validadores y helpers puros sin dependencias de renderer                        |
| `SHELL-CON-001`                              | separación de `@vento/contracts`, `@vento/os-context`, `@vento/supabase` y `@vento/ui-web` |
| estado actual de `devVentoGroup/vento-anima` | baseline físico del renderer React Native/Expo                                             |
| Registro Canónico de Requisitos de Prueba    | cobertura vigente y secuencia TREQ                                                         |

Precedencia:

```text
FUENTE SEMÁNTICA
→ contrato neutral compartido cuando corresponda
→ adapter o renderer propietario
→ aplicación consumidora
```

Una implementación visual existente no se convierte en contrato transversal por similitud de apariencia.

---

#### 4. Línea base verificable

El corte técnico actual demuestra una UI nativa real y diferenciada:

| Evidencia                                | Estado observado                                                                                            | Clasificación               |
| ---------------------------------------- | ----------------------------------------------------------------------------------------------------------- | --------------------------- |
| `devVentoGroup/vento-anima/package.json` | ANIMA `1.3.4`; Expo `~54.0.35`; React Native `0.81.5`; React `19.1.0`; `expo-router`; módulos Expo y RN     | `NATIVE_REACT_NATIVE_EXPO`  |
| `app/_layout.tsx`                        | `Stack`, `StatusBar`, notificaciones, `GestureHandlerRootView`, safe-area y componentes RN                  | `NATIVE_COMPOSITION`        |
| `app/(app)/_layout.tsx`                  | `Tabs`, `useRouter`, `Platform`, safe-area, notificaciones e iconos nativos                                 | `NATIVE_NAVIGATION`         |
| grupo `app/(app)`                        | 9 módulos de pantalla observados más su layout                                                              | `APP_LOCAL_NATIVE_SCREENS`  |
| raíz `src/components`                    | 3 componentes directos y 10 familias de componentes observadas                                              | `NATIVE_UI_TREE`            |
| `AppUpdateGate.tsx`                      | `Modal`, `ActivityIndicator`, `StyleSheet`, `TouchableOpacity` y `View` de RN                               | `NATIVE_VISUAL_COMPONENT`   |
| `LoginForm.tsx`                          | inputs, pressables, `Platform`, `StyleSheet` y Reanimated                                                   | `NATIVE_DOMAIN_FORM`        |
| workspace físico de `vento-shell`        | solo `packages/os-context` observado; no hay package físico `@vento/ui-web` ni package nativo materializado | `DEFINIDO_NO_MATERIALIZADO` |

Los conteos anteriores describen el baseline observado y no congelan el número futuro de pantallas o componentes de ANIMA.

---

#### 5. Identidades contractuales

| Identidad                                    | Función                                        |
| -------------------------------------------- | ---------------------------------------------- |
| `VENTO-NATIVE-UI-SEPARATION-CONTRACT-001`    | contrato global de separación de renderers     |
| `SHELL-NATIVE-UI-BOUNDARY-001`               | snapshot documental de la frontera vigente     |
| `SHELL-NATIVE-003::<implementation_unit_id>` | futura materialización física única por unidad |

No se crea una identidad como `@vento/ui-native` durante este marcador. Si una unidad futura requiere un package nativo compartido, su identidad física deberá provenir del expediente E5 correspondiente.

---

#### 6. Cuatro clases de propiedad

Toda superficie evaluada por esta frontera pertenece a una de cuatro clases:

| Clase                      | Definición                                                         | Ejemplos                                                        |
| -------------------------- | ------------------------------------------------------------------ | --------------------------------------------------------------- |
| `PLATFORM_NEUTRAL`         | semántica consumible sin React, RN, Expo, DOM o CSS                | contratos, validadores, tokens y helpers puros gobernados       |
| `NATIVE_REACT_NATIVE_EXPO` | implementación visual o de interacción propia del renderer RN/Expo | `View`, `TextInput`, `Tabs`, safe-area, gestos, notificaciones  |
| `WEB_REACT_DOM_CSS`        | implementación visual web bajo la frontera de `@vento/ui-web`      | AppShell web, DOM, CSS y navegación web                         |
| `APP_LOCAL`                | composición o comportamiento específico de una aplicación          | pantallas, formularios de dominio, consultas y procesos propios |

La clasificación se determina por responsabilidad y dependencias efectivas, no por el nombre del archivo.

---

#### 7. Grafo permitido de dependencias

La dirección permitida queda:

```text
NATIVE_REACT_NATIVE_EXPO
→ PLATFORM_NEUTRAL

WEB_REACT_DOM_CSS
→ PLATFORM_NEUTRAL

APP_LOCAL NATIVE
→ NATIVE_REACT_NATIVE_EXPO
→ PLATFORM_NEUTRAL

APP_LOCAL WEB
→ WEB_REACT_DOM_CSS
→ PLATFORM_NEUTRAL
```

Queda prohibido:

```text
NATIVE_REACT_NATIVE_EXPO
-x-> @vento/ui-web

@vento/ui-web
-x-> react-native / Expo / módulos nativos

PLATFORM_NEUTRAL
-x-> React / React Native / Expo / DOM / CSS / Next.js
```

Una dependencia indirecta a través de un re-export también cuenta como cruce de frontera.

---

#### 8. Matriz materializada de decisiones por clase de superficie

|    # | Superficie                                       | Decisión                          | Condición                                                                          |
| ---: | ------------------------------------------------ | --------------------------------- | ---------------------------------------------------------------------------------- |
|    1 | tokens de diseño y aliases compatibles           | `COMPARTIR_CORE_NEUTRAL`          | conforme a `SHELL-NATIVE-001` y adapters explícitos                                |
|    2 | contratos, códigos, tipos, eventos y validadores | `COMPARTIR_NEUTRAL`               | conforme a `SHELL-NATIVE-002`                                                      |
|    3 | helpers puros                                    | `CANDIDATO_CONDICIONADO`          | propietario semántico, reuse declarado y cero dependencia de renderer              |
|    4 | layouts y composición de pantallas               | `MANTENER_SEPARADO`               | pertenecen al renderer/aplicación                                                  |
|    5 | AppShell y navegación                            | `MANTENER_POR_RENDERER`           | web y nativo resuelven navegación con su stack propio                              |
|    6 | componentes visuales, cards, modals e inputs     | `MANTENER_POR_RENDERER`           | pueden consumir tokens/contratos, no compartir implementación por defecto          |
|    7 | formularios de dominio                           | `MANTENER_APP_LOCAL`              | contienen interacción y reglas propias del dominio                                 |
|    8 | composición de procesos empresariales            | `MANTENER_APP_LOCAL`              | no pertenece a la biblioteca visual compartida                                     |
|    9 | consultas y acceso a datos de una aplicación     | `FUERA_DE_UI_COMPARTIDA`          | permanecen en su capa propietaria                                                  |
|   10 | capacidades de plataforma                        | `MANTENER_NATIVE`                 | permisos OS, notificaciones, ubicación, gestos, safe-area, haptics y similares     |
|   11 | layout específico de ANIMA                       | `MANTENER_ANIMA_LOCAL`            | conserva la decisión de `SHELL-NATIVE-001` sobre sus 3 constantes actuales         |
|   12 | marca y accesibilidad                            | `COMPARTIR_SEMANTICA_NO_RENDERER` | requisitos/tokens pueden ser comunes; implementación visual permanece por renderer |

**Conciliación:** 12 clases evaluadas, 12 decisiones explícitas, 0 clases sin disposición.

---

#### 9. Disposición del baseline de ANIMA

Las superficies observadas de ANIMA se clasifican así:

| Superficie observada                                                                                                | Decisión del corte                                                                               |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `app/_layout.tsx`                                                                                                   | `MANTENER_NATIVE_APP_LOCAL`                                                                      |
| `app/(app)/_layout.tsx`                                                                                             | `MANTENER_NATIVE_APP_LOCAL`                                                                      |
| pantallas del grupo `app/(app)`                                                                                     | `MANTENER_NATIVE_APP_LOCAL`                                                                      |
| `src/components/AppUpdateGate.tsx`                                                                                  | `MANTENER_NATIVE_APP_LOCAL`                                                                      |
| `src/components/SplashScreen.tsx`                                                                                   | `MANTENER_NATIVE_APP_LOCAL`                                                                      |
| `src/components/anima-logo.tsx`                                                                                     | `MANTENER_RENDERER_NATIVE`; puede consumir semántica de marca, no se convierte en componente web |
| familias `announcements`, `auth`, `carnet`, `documents`, `history`, `home`, `settings`, `shifts`, `support`, `team` | `MANTENER_NATIVE_APP_LOCAL` en este corte                                                        |
| `src/constants/colors.ts`                                                                                           | compatibilidad transitoria con el core de tokens de `SHELL-NATIVE-001`                           |
| `src/constants/layout.ts`                                                                                           | `MANTENER_ANIMA_LOCAL`                                                                           |

Esta disposición no prohíbe una futura extracción nativa controlada. Prohíbe asumir que la extracción ya está justificada o que debe hacerse hacia `@vento/ui-web`.

---

#### 10. Frontera de `@vento/ui-web`

`@vento/ui-web` conserva la responsabilidad aprobada de componentes web, AppShell web, navegación, marca, accesibilidad y contrato CSS.

Consecuencias:

1. no se convierte en dependencia de ANIMA por existir un target web de Expo;
2. no exporta `View`, `Text`, `StyleSheet`, `Platform`, módulos Expo ni tipos RN como API pública;
3. no exige que un componente nativo replique su DOM o sus clases CSS;
4. una decisión visual web no se aplica automáticamente a nativo sin una semántica compartida previa;
5. un token o contrato consumido por ambos renderers no convierte sus componentes en la misma implementación.

---

#### 11. Regla de Expo Web

ANIMA declara `react-dom` y un script web porque Expo puede producir un target web. Para esta frontera:

```text
EXPO WEB
→ sigue perteneciendo a NATIVE_REACT_NATIVE_EXPO
→ usa el renderer y abstracciones de RN/Expo
→ no adquiere identidad WEB_REACT_DOM_CSS por ejecutarse en navegador
```

Por tanto, compatibilidad con navegador no autoriza:

- importar `@vento/ui-web` desde el renderer nativo;
- exigir el mismo árbol de componentes;
- sustituir `StyleSheet` por contrato CSS compartido;
- convertir Expo Router en la navegación web canónica de Vento OS;
- tratar una compilación web de Expo como evidencia suficiente de compatibilidad de la UI web estándar.

---

#### 12. Tipos que no pueden cruzar la frontera neutral

Una API `PLATFORM_NEUTRAL` no podrá exponer como parte de su contrato público tipos u objetos cuya identidad dependa del renderer, incluyendo equivalentes de:

- elementos JSX o nodos React como datos contractuales;
- `StyleProp`, `ViewStyle`, `TextStyle` u otros estilos RN;
- eventos sintéticos RN o referencias a componentes RN;
- nodos DOM, `HTMLElement`, eventos DOM o `CSSProperties`;
- objetos de router, navegación o history propios de un framework;
- handles de notificaciones, ubicación, gestos o permisos del sistema operativo;
- objetos Expo específicos.

Los adapters de cada renderer traducen desde contratos neutrales hacia sus tipos locales.

---

#### 13. Regla de promoción a una superficie compartida

Un archivo o helper no se comparte por ser pequeño, reutilizable en apariencia o estar escrito en TypeScript.

La promoción requiere simultáneamente:

1. propietario semántico identificable;
2. semántica estable y no dependiente de una pantalla concreta;
3. reuse declarado por más de un consumidor o decisión canónica explícita de superficie compartida;
4. clasificación de renderer explícita;
5. ausencia de dependencias prohibidas para la clase elegida;
6. contrato de entrada/salida verificable;
7. package y `implementation_unit_id` autorizados por E5 cuando implique materialización;
8. pruebas del propio artefacto y de cada consumidor declarado;
9. rollback de adopción.

Ser una función pura es condición útil, pero no suficiente para crear otra fuente compartida.

---

#### 14. Compartición nativa sin universalización

La frontera permite que una futura unidad sea `NATIVE_REACT_NATIVE_EXPO` y sea reutilizada por varios consumidores nativos si el expediente E5 lo autoriza.

Eso no la convierte en `PLATFORM_NEUTRAL` ni en `@vento/ui-web`.

```text
N CONSUMIDORES NATIVOS
→ pueden usar 1 implementación nativa compartida
→ si pertenecen al mismo implementation_unit_id

CONSUMIDOR WEB ESTÁNDAR
→ no queda obligado a consumir esa implementación
```

El objetivo es evitar duplicación nativa real sin fabricar una biblioteca universal que degrade las capacidades de cada plataforma.

---

#### 15. Capacidades propias de plataforma

Permanecen en el renderer nativo o en adapters nativos propietarios, cuando apliquen:

- safe-area;
- status bar;
- teclado y foco nativo;
- back navigation del sistema;
- gestos;
- haptics;
- notificaciones del dispositivo;
- ubicación y permisos del sistema;
- selección y manejo local de archivos;
- linking nativo;
- stores y actualizaciones de aplicación;
- diferencias iOS/Android;
- primitives visuales de React Native.

La existencia de un contrato neutral para un resultado no obliga a compartir el mecanismo físico que lo produce.

---

#### 16. AppShell y navegación

La semántica de navegación puede referenciar identidades compartidas, pero cada renderer conserva su implementación.

En ANIMA, el baseline actual usa Expo Router, `Stack`, `Tabs`, `useRouter`, notificaciones y `Platform`. Ese conjunto se clasifica como composición nativa.

En web, `@vento/ui-web` conserva su AppShell y navegación conforme a su contrato propio.

Queda prohibido utilizar el AppShell completo de un renderer como dependencia del otro para obtener únicamente contratos, códigos o tokens.

---

#### 17. Formularios, pantallas y procesos

Permanecen inicialmente fuera de la compartición transversal:

- páginas o pantallas completas;
- formularios específicos de dominio;
- flujos de login específicos de aplicación;
- composición de procesos empresariales;
- UI de documentos, turnos, soporte, equipo u otras funciones propias de ANIMA;
- estado visual ligado a una pantalla concreta;
- reglas de presentación que obliguen a todas las aplicaciones a usar la misma interfaz.

Cuando exista semántica común, se comparte primero el contrato o helper neutral; el renderer conserva la experiencia adecuada a su plataforma.

---

#### 18. Consultas y acceso a datos

Una consulta de Supabase, RPC, API, storage o servicio propio de una aplicación no se vuelve UI compartida por ser utilizada por un componente.

La separación queda:

```text
CONTRATO / IDENTIDAD
→ capa neutral compartida cuando corresponda

ACCESO A DATOS / CONTEXTO / AUTORIZACIÓN
→ capa propietaria de runtime

RENDERIZADO
→ renderer nativo o web

COMPOSICIÓN DE DOMINIO
→ aplicación propietaria
```

Esta tarea no mueve consultas, clientes, providers, hooks de datos ni lógica empresarial.

---

#### 19. Marca y accesibilidad

Pueden compartirse semánticas como:

- identidad de marca;
- tokens de color;
- estados y significado de acciones;
- requisitos de contraste;
- labels y roles conceptuales cuando sean contractuales;
- criterios de accesibilidad verificables.

No se comparte automáticamente:

- implementación de iconos;
- componentes visuales concretos;
- CSS;
- estilos RN;
- estructura DOM;
- jerarquía de views;
- gestos o affordances específicos de plataforma.

Paridad significa conservar intención y requisitos, no igualdad pixel a pixel entre renderers.

---

#### 20. Snapshot normativo de frontera

La representación normativa de `SHELL-NATIVE-UI-BOUNDARY-001` usa JSON UTF-8, claves de objetos ordenadas lexicográficamente para la entrada de huella y arrays en el orden contractual definido.

Huella documental:

`sha256:e568f86dae2c155471106d4f9f6d309623aea55ab6bc10154abde17549bc50c7`

Payload normativo:

```json
{
  "cross_renderer_component_imports": false,
  "expo_web_renderer_class": "NATIVE_REACT_NATIVE_EXPO",
  "future_instance_pattern": "SHELL-NATIVE-003::<implementation_unit_id>",
  "identical_component_tree_required": false,
  "initial_nonshared_classes": [
    "routes_and_layouts",
    "app_shell_and_navigation",
    "visual_components",
    "domain_forms",
    "domain_process_composition",
    "application_queries",
    "platform_capabilities",
    "application_specific_layout"
  ],
  "promotion_requires": [
    "semantic_owner",
    "declared_reuse_or_canonical_shared_decision",
    "renderer_scope_explicit",
    "no_forbidden_cross_renderer_dependency",
    "e5_authorization",
    "consumer_tests"
  ],
  "renderer_classes": [
    "PLATFORM_NEUTRAL",
    "NATIVE_REACT_NATIVE_EXPO",
    "WEB_REACT_DOM_CSS",
    "APP_LOCAL"
  ],
  "schema": "vento.ui-renderer-boundary@1",
  "shared_neutral_sources": [
    "VENTO-DESIGN-TOKENS-CONTRACT-001",
    "VENTO-SHARED-CONTRACT-VALIDATION-API-001"
  ],
  "snapshot_id": "SHELL-NATIVE-UI-BOUNDARY-001",
  "web_native_component_imports": false
}
```

La identidad del snapshot no podrá reutilizarse con otra política de importación o clasificación silenciosa.

---

#### 21. Contrato de entrada de cada futura instancia

Toda `SHELL-NATIVE-003::<implementation_unit_id>` deberá registrar como mínimo:

| Campo                    | Obligación                                                                                          |
| ------------------------ | --------------------------------------------------------------------------------------------------- |
| `implementation_unit_id` | unidad exacta asignada por `DELIV-PKG-025`                                                          |
| `owner_package_id`       | paquete propietario con `E5-GATE-008 = PASS`                                                        |
| `consumer_package_ids`   | consumidores exactos                                                                                |
| repositorio              | propietario físico                                                                                  |
| package físico           | identidad exacta aprobada por E5, si existe                                                         |
| renderer_class           | `PLATFORM_NEUTRAL`, `NATIVE_REACT_NATIVE_EXPO`, `WEB_REACT_DOM_CSS` o `APP_LOCAL` según corresponda |
| baseline                 | commit anterior a la materialización                                                                |
| result commit            | commit exacto del resultado                                                                         |
| boundary snapshot        | `SHELL-NATIVE-UI-BOUNDARY-001` o revisión aprobada                                                  |
| dependency graph         | imports directos, re-exports y dependencias runtime                                                 |
| shared inputs            | versiones exactas de tokens, contratos y validators consumidos                                      |
| native surface inventory | superficies nativas afectadas por la unidad                                                         |
| consumer matrix          | repositorio, target, toolchain y resultado                                                          |
| tests                    | unitarias, contractuales, import graph, serialización y consumo                                     |
| digest                   | huella del manifest de frontera aplicable                                                           |
| rollback                 | combinación anterior y procedimiento reproducible                                                   |
| blockers                 | lista cerrada con propietario y condición de salida                                                 |

Un campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 22. Unicidad por `implementation_unit_id`

```text
1 implementation_unit_id
→ máximo 1 SHELL-NATIVE-003::<implementation_unit_id>
→ máximo 1 definición física propietaria de esa frontera o renderer compartido
→ máximo 1 conjunto propietario de gates de importación
→ N package_id consumidores mediante lineage
```

No se crean copias de una misma superficie nativa compartida para satisfacer paquetes distintos pertenecientes a la misma unidad.

Una UI app-local no se considera duplicación prohibida por tener una intención visual semejante; la prohibición aplica cuando ambos artefactos pretenden ser la misma implementación compartida de la misma unidad.

---

#### 23. Once gates de una futura materialización

| Gate                   | PASS                                                                        | Bloqueo                               |
| ---------------------- | --------------------------------------------------------------------------- | ------------------------------------- |
| 1. identidad           | unidad, package, renderer, versión y commits inequívocos                    | identidad ambigua                     |
| 2. clasificación       | cada superficie afectada tiene clase de propiedad                           | superficie sin owner o clase          |
| 3. dependencias        | grafo cumple las direcciones permitidas                                     | import o re-export cruzando renderers |
| 4. neutralidad         | superficies neutrales no filtran tipos de renderer                          | API compartida acoplada a UI          |
| 5. localidad           | pantallas, formularios, procesos y queries no se promueven sin autorización | extracción prematura                  |
| 6. Expo Web            | se conserva dentro de la familia RN/Expo                                    | fusión accidental con `@vento/ui-web` |
| 7. contratos/tokens    | inputs compartidos usan versiones aprobadas                                 | copia o semántica paralela            |
| 8. serialización       | manifest de frontera determinista y digest reproducible                     | evidencia no reproducible             |
| 9. consumidores        | cada target y consumidor declarado supera sus pruebas                       | consumidor o target sin validar       |
| 10. unicidad y lineage | una implementación por unidad y lineage completo                            | copia propietaria paralela            |
| 11. rollback           | retorno reproducible a una combinación soportada                            | rollback no ensayable                 |

La instancia queda `PASS` solo cuando todos los gates aplicables estén en `PASS`.

---

#### 24. Perfil de pruebas aplicable

La futura materialización deberá cubrir como mínimo:

| Perfil          | Cobertura mínima                                                                             |
| --------------- | -------------------------------------------------------------------------------------------- |
| unitarias       | helpers/adapters extraídos y clasificación de casos límite cuando existan                    |
| contractuales   | snapshot de frontera, clases, dependencias permitidas y prohibidas                           |
| estáticas       | grafo de imports/re-exports y ausencia de tipos de renderer en APIs neutrales                |
| compatibilidad  | versiones de React, RN, Expo, web stack y contratos compartidos declarados                   |
| serialización   | manifest, orden, bytes y SHA-256 repetible                                                   |
| consumer-driven | typecheck, build/export y pruebas aplicables por consumidor                                  |
| multiplataforma | targets nativos declarados y Expo Web cuando aplique; web estándar por su stack propio       |
| regresión       | ausencia de nuevos cruces `native ↔ @vento/ui-web` y de promoción accidental de UI app-local |
| lineage         | unidad, package, commit, renderer, snapshot y digest                                         |
| rollback        | retorno a combinación soportada y repetición de gates esenciales                             |

No se exige pixel parity entre renderers. Las pruebas visuales, cuando existan, se ejecutan contra el contrato de cada renderer.

---

#### 25. Evidencia requerida por instancia

| Clase                     | Contenido mínimo                                                      |
| ------------------------- | --------------------------------------------------------------------- |
| `LINEAGE`                 | unidad, package_id, repositorio, baseline, result commit y versión    |
| `RENDERER_CLASSIFICATION` | inventario afectado y clase de cada superficie                        |
| `DEPENDENCY_GRAPH`        | imports, re-exports y dependencias runtime                            |
| `NEUTRAL_API`             | ausencia de tipos UI/plataforma en superficies neutrales              |
| `NATIVE_SURFACES`         | componentes/pantallas nativos afectados y disposición                 |
| `SHARED_INPUTS`           | contratos, validators, tokens y versiones exactas                     |
| `EXPO_WEB_BOUNDARY`       | evidencia de que el target web de Expo no cruza hacia `@vento/ui-web` |
| `SERIALIZATION`           | manifest, digest y repetición                                         |
| `CONSUMERS`               | resultados por target y consumidor                                    |
| `ROLLBACK`                | snapshot, procedimiento, ensayo y resultado                           |
| `CERTIFICATION`           | once gates y estado agregado                                          |

---

#### 26. Rollback y evolución

El rollback de una instancia deberá restaurar coordinadamente:

1. imports y exports anteriores;
2. versión anterior de cualquier package afectado;
3. adapters y contratos de props neutrales aplicables;
4. referencias de consumidores y lockfiles cuando hayan cambiado;
5. configuración de bundler/toolchain afectada;
6. fixtures y manifest de frontera compatibles.

Una superficie publicada como nativa no cambia a neutral o web únicamente por refactor. El cambio de clase exige revisión explícita de dependencias, consumidores, SemVer cuando aplique y evidencia de compatibilidad.

---

#### 27. Condiciones de suspensión

Una instancia queda `BLOCKED` si ocurre cualquiera de estas condiciones:

- `implementation_unit_id` ausente o ambiguo;
- owner package sin gate E5 aprobado;
- import directo o indirecto desde RN/Expo hacia `@vento/ui-web`;
- import desde UI web compartida hacia RN, Expo o módulo nativo;
- superficie neutral que exponga tipos de renderer;
- extracción de página, formulario, proceso o consulta sin decisión propietaria;
- fusión de Expo Web con la identidad de renderer web estándar;
- componente compartido que obligue a aplicaciones con necesidades distintas a una misma interfaz sin contrato aprobado;
- consumidor declarado sin prueba aplicable;
- evidencia de otra versión, commit o unidad;
- implementación duplicada para la misma unidad;
- digest no reproducible;
- rollback no reproducible.

---

#### 28. Requisitos de prueba derivados

**Resultado:** GENERA 6 REQUISITOS DE PRUEBA.

**Requisitos creados:** **6**
**Requisitos modificados:** **0**

Se crean:

- `TREQ-SHELL-055` — separación estricta entre renderer RN/Expo y `@vento/ui-web`, con capas neutrales como única frontera compartible transversal;
- `TREQ-SHELL-056` — prohibición de tipos/objetos específicos de renderer dentro de APIs `PLATFORM_NEUTRAL`;
- `TREQ-SHELL-057` — conservación app-local/nativa de pantallas, layouts, formularios, queries y capacidades de plataforma hasta cumplir el gate de promoción;
- `TREQ-SHELL-058` — clasificación de Expo Web dentro de la familia RN/Expo sin colapsar la frontera con la UI web estándar;
- `TREQ-SHELL-059` — matriz de compatibilidad y pruebas por renderer/target sin exigir árbol visual idéntico;
- `TREQ-SHELL-060` — unicidad física por `implementation_unit_id`, lineage, evidencia vigente y rollback.

No se modifica, difiere, descarta ni obsoleta ningún requisito histórico.

---

#### 29. Puerta de cierre del marcador global

El marcador global queda documentalmente cerrado cuando:

1. se define una sola frontera global de renderers;
2. se fija la topología `PER_IMPLEMENTATION_UNIT`;
3. se reconcilia el baseline RN/Expo actual de ANIMA;
4. se definen cuatro clases de propiedad;
5. se materializan 12 decisiones por clase de superficie;
6. se establece el grafo permitido de dependencias;
7. se preservan `SHELL-NATIVE-001` y `SHELL-NATIVE-002` como capas compartidas neutrales;
8. se fija `@vento/ui-web` como renderer web y no como dependencia nativa;
9. se fija Expo Web dentro de la familia RN/Expo;
10. se prohíbe filtrar tipos de renderer a contratos neutrales;
11. se define el gate de promoción de artefactos;
12. se permite sharing nativo solo dentro de una unidad explícita, sin universalizarlo;
13. se define snapshot determinista y huella;
14. se definen once gates, pruebas, evidencia y rollback;
15. se registran `TREQ-SHELL-055` a `TREQ-SHELL-060`;
16. se mantienen 0 unidades físicas materializadas y 0 cambios Supabase.

---

#### 30. Puerta de cierre de cada futura instancia

`SHELL-NATIVE-003::<implementation_unit_id>` solo podrá quedar `PASS` cuando:

- exista unidad y package propietario inequívocos;
- la clasificación de renderer esté documentada;
- el grafo de dependencias cumpla la frontera;
- las superficies neutrales no dependan de tipos UI;
- cualquier sharing nativo tenga consumidores y owner explícitos;
- ANIMA conserve compatibilidad cuando sea consumidor declarado;
- Expo Web respete la frontera definida cuando aplique;
- web estándar conserve su renderer propietario;
- contratos/tokens compartidos sean versiones aprobadas;
- todos los targets declarados tengan evidencia vigente;
- no exista una segunda implementación para la misma unidad;
- snapshot, commit, versión y digest coincidan;
- rollback haya sido ensayado;
- `TREQ-SHELL-055` a `TREQ-SHELL-060` aplicables estén satisfechos con evidencia atribuible.

---

#### 31. Criterios de aceptación

- [x] `SHELL-NATIVE-002` permanece como precedencia inmediata;
- [x] se define la continuidad hacia `SHELL-AUTH-001` sin desarrollarla;
- [x] se define un contrato global único de separación de UI;
- [x] se reconcilia la realidad RN/Expo de ANIMA;
- [x] se distinguen cuatro clases de propiedad;
- [x] se materializan 12 decisiones por clase de superficie;
- [x] contratos y tokens permanecen compartibles sin trasladar renderer;
- [x] `@vento/ui-web` permanece exclusivamente del renderer web;
- [x] React Native/Expo no depende de `@vento/ui-web`;
- [x] web compartida no depende de RN/Expo;
- [x] Expo Web permanece dentro de la familia RN/Expo;
- [x] páginas, pantallas, formularios, procesos y consultas propias permanecen inicialmente fuera de la compartición visual;
- [x] se define un gate explícito para promoción futura;
- [x] se permite sharing nativo por unidad sin obligar a web a consumirlo;
- [x] se prohíben tipos de renderer dentro de APIs neutrales;
- [x] se define snapshot y huella reproducible;
- [x] se definen once gates y perfil de pruebas;
- [x] se crean exactamente 6 requisitos de prueba;
- [x] se declaran 0 packages físicos, 0 migraciones y 0 cambios Supabase;
- [x] no se desarrolla `SHELL-AUTH-001`.

---

#### 32. Límites

Esta tarea no:

- crea un package nativo compartido;
- crea o publica `@vento/ui-web`;
- inventa la identidad `@vento/ui-native`;
- modifica `vento-anima`;
- mueve componentes, pantallas o layouts;
- migra imports;
- cambia Expo Router;
- cambia navegación o providers de ANIMA;
- convierte formularios de dominio en componentes transversales;
- mueve consultas o acceso a datos;
- crea SQL, RLS, RPC, migraciones, Storage, Edge Functions o datos;
- ejecuta Supabase;
- ejecuta una instancia `SHELL-NATIVE-003::<implementation_unit_id>`;
- desarrolla `SHELL-AUTH-001`.

No se debe empezar trasladando el AppShell completo. Primero deben compartirse contratos, códigos, tipos, eventos y helpers puros.

No deberán compartirse inicialmente:

páginas completas;
formularios específicos de dominio;
procesos empresariales completos;
consultas propias de una aplicación;
componentes que obliguen a todas las aplicaciones a tener la misma interfaz.

---

#### 33. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-NATIVE-002 — Compartir contratos y validadores`

**TAREA ACTUAL APROBADA**
`SHELL-NATIVE-003 — Mantener UI React Native separada`

**SIGUIENTE TAREA RESERVADA**
`SHELL-AUTH-001 — Consolidar @vento/os-context como SDK canónico de contexto y autorización`
