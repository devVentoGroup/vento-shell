### MINI-BLOQUE — COMPONENTES WEB COMPARTIDOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **componentes web compartidos** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-UI-001` a `SHELL-UI-020` — 20 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Crear @vento/ui-web” y concluye con “Compartir patrón de traspaso entre aplicaciones”.
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-UI-001 — Crear @vento/ui-web

**Estado:** APROBADA
**Tarea anterior:** SHELL-DB-005 — Separar cliente server, browser y native
**Tarea siguiente:** SHELL-UI-002 — Compartir Alert
**Tipo de tarea:** Documental; definición canónica de identidad, responsabilidad, fronteras, dependencias, superficie pública, reglas de runtime web, composición, estilos, accesibilidad, adopción y gobierno del futuro `@vento/ui-web`, sin materializar package físico, exports npm, componentes compartidos, CSS distribuible, migraciones de consumidores, releases, despliegues ni modificaciones remotas
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_COMPONENTES_WEB_COMPARTIDOS.md`
**Estado físico resultante:** ESPECIFICADO; PACKAGE, EXPORTS Y COMPONENTES COMPARTIDOS NO MATERIALIZADOS
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, configuración npm, registry, CI, componentes runtime, estilos distribuidos, rutas, navegación, despliegues, SQL, migraciones, RLS, RPC, triggers, datos, secretos o configuración remota:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-UI-001` define `@vento/ui-web` como la frontera visual web compartida de Vento OS.

La tarea fija qué responsabilidad pertenece al package, qué permanece en las aplicaciones, qué dependencias puede consumir, cómo deberá convivir con React y Next.js y cómo se incorporarán posteriormente componentes y patrones sin convertir copias históricas en una API compartida por simple existencia.

La regla raíz queda:

```text
CONTRATOS ESTÁTICOS
  ↓
@vento/contracts

CONTEXTO Y AUTORIZACIÓN RUNTIME
  ↓
@vento/os-context

ACCESO COMPARTIDO A DATOS
  ↓
@vento/supabase

IMPLEMENTACIÓN VISUAL WEB COMPARTIDA
  ↓
@vento/ui-web

COMPOSICIÓN DE PROCESO Y LÓGICA EMPRESARIAL
  ↓
permanece en cada aplicación
```

Nunca:

```text
@vento/ui-web → fuente autoritativa de permisos
@vento/ui-web → consultas directas a Supabase
@vento/ui-web → lógica de negocio de NEXO, VISO, FOGO, ORIGO, PULSO, NUMERA o SHELL
@vento/ui-web → rutas hardcodeadas de una aplicación como estándar transversal
@vento/ui-web → copia automática de templates históricos
@vento/ui-web → UI React Native
existencia de un componente local → export compartido aprobado
visibilidad o disabled en UI → autorización de servidor
```

---

#### 2. Resultado material

Queda definida documentalmente la identidad canónica del futuro package:

| Propiedad                                         | Decisión                                                        |
| ------------------------------------------------- | --------------------------------------------------------------- |
| nombre lógico                                     | `@vento/ui-web`                                                 |
| naturaleza                                        | package npm privado de implementación visual web compartida     |
| repositorio propietario                           | `devVentoGroup/vento-shell`                                     |
| canal de distribución                             | registry privado compatible con npm, según `SHELL-PKG-001..008` |
| versionado                                        | SemVer independiente                                            |
| consumidores web previstos                        | 7 repositorios                                                  |
| adopción automática                               | prohibida                                                       |
| dependencia runtime de Supabase                   | prohibida                                                       |
| dependencia de lógica empresarial de aplicaciones | prohibida                                                       |
| UI nativa                                         | fuera de alcance                                                |
| API pública concreta en este corte                | ninguna todavía aprobada                                        |
| estado físico                                     | no materializado                                                |

La tarea deja cerrados:

- propósito y propiedad del package;
- responsabilidades admitidas y excluidas;
- relación con `@vento/contracts`, `@vento/os-context` y `@vento/supabase`;
- frontera entre presentación y autorización;
- frontera entre visualización y efectos empresariales;
- reglas de compatibilidad React/Next.js;
- separación entre componentes server-safe e interactivos;
- reglas para estilos, marca y contrato CSS;
- obligación de accesibilidad de la implementación compartida;
- política de exports y prohibición de imports internos no publicados;
- clasificación del código UI existente como insumo, no como API canónica;
- tratamiento del template AppShell histórico;
- relación con `SHELL-UI-002..020`;
- relación con migración, publicación, compatibilidad y rollback posteriores;
- cobertura futura de pruebas.

No se materializa todavía ningún componente compartido.

---

#### 3. Fuentes normativas y decisiones heredadas

| Fuente                  | Decisión preservada                                                                                                                                      |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-PKG-001..008`    | los paquetes compartidos se distribuyen como npm privados, con SemVer independiente, releases inmutables, compatibilidad, rollback y adopción controlada |
| `SHELL-CON-001`         | contratos estáticos pertenecen a `@vento/contracts`; los componentes visuales pertenecen a `@vento/ui-web`                                               |
| `SHELL-CON-002..016`    | códigos, catálogos, tipos y contratos compartidos no deben duplicarse dentro de la UI                                                                    |
| `SHELL-NORM-001..009`   | las decisiones de normalización compartida preceden la materialización de componentes web                                                                |
| `SHELL-AUD-001..011`    | las copias, componentes, templates y consumidores existentes requieren disposición explícita y paridad antes de adopción o retiro                        |
| `SHELL-DB-001..005`     | acceso a datos, tipos Supabase, wrappers, errores y clientes runtime pertenecen a `@vento/supabase`, no a la UI                                          |
| `SHELL-MIG-001..008`    | la adopción de consumidores será progresiva, reversible y basada en evidencia                                                                            |
| `SHELL-NATIVE-001..003` | la UI React Native permanece separada; compartir contratos no autoriza compartir componentes web                                                         |
| `TREQ-SHELL-002`        | responsabilidades compartidas deben provenir de implementación compartida, generada o local explícitamente clasificada                                   |
| `TREQ-SHELL-006`        | una versión compartida debe superar pruebas propias y matriz de compatibilidad contra consumidores                                                       |
| `TREQ-SHELL-007`        | rollback independiente es obligatorio antes de release                                                                                                   |
| `TREQ-SHELL-029..032`   | template AppShell y componentes actuales no se convierten en superficies compartidas por existencia                                                      |
| `TREQ-SHELL-035`        | texto, etiquetas y estados compartidos deben conservar codificación y significado válidos                                                                |
| `TREQ-SHELL-036..039`   | identidad de release, deprecación y retiro de superficies públicas están gobernados                                                                      |

Precedencia:

```text
CONTRATOS Y NORMALIZACIÓN APROBADOS
→ IDENTIDAD @vento/ui-web
→ COMPONENTE O PATRÓN PROPIETARIO SHELL-UI-002..020
→ API PÚBLICA VERSIONADA
→ PRUEBAS DEL PACKAGE
→ MATRIZ DE COMPATIBILIDAD
→ PUBLICACIÓN AUTORIZADA
→ MIGRACIÓN CONTROLADA DEL CONSUMIDOR
→ PARIDAD
→ RETIRO LEGACY
```

Una copia local existente no salta esta secuencia.

---

#### 4. Estado físico verificable de partida

El corte actual observado en `vento-shell` conserva:

| Elemento                                                               | Estado                               |
| ---------------------------------------------------------------------- | ------------------------------------ |
| workspace raíz npm `packages/*`                                        | existente                            |
| `packages/os-context`                                                  | existente                            |
| package físico `@vento/ui-web`                                         | no materializado                     |
| release canónica `@vento/ui-web`                                       | no confirmada                        |
| consumidor instalando `@vento/ui-web`                                  | no confirmado                        |
| `src/components/ui/Button.tsx`                                         | componente local existente           |
| `src/components/ui/Card.tsx`                                           | componente local existente           |
| `src/components/ui/Chip.tsx`                                           | componente local existente           |
| `src/components/ui/Input.tsx`                                          | componente local existente           |
| `src/components/ui/Modal.tsx`                                          | componente local existente           |
| `src/components/ui/index.ts`                                           | barrel local existente               |
| `templates/app-shell-standard`                                         | plantilla fuente histórica existente |
| módulos `templates/app-shell-standard/src/components/vento/standard/*` | fuente histórica; no API de package  |

Conciliación del directorio UI local observado:

```text
5 componentes locales
+
1 barrel local
=
6 archivos bajo src/components/ui
```

Los cinco componentes locales son candidatos de análisis, no exports aprobados de `@vento/ui-web`.

La existencia de la plantilla tampoco demuestra adopción de package.

---

#### 5. Identidad del package

La identidad contractual es exactamente:

```text
@vento/ui-web
```

No se crean alias como:

```text
@vento/ui
@vento/design-system
@vento/app-shell
@vento/web-components
@vento/components
```

La identidad del package es independiente de:

- la aplicación que primero lo consuma;
- la ubicación actual de un componente local;
- el nombre de la plantilla histórica;
- la versión del repositorio raíz;
- el proveedor concreto del registry;
- una implementación temporal en un consumidor.

El package será una unidad versionable propia dentro de la fundación compartida.

---

#### 6. Responsabilidad canónica

`@vento/ui-web` será propietario únicamente de implementación visual web que deba conservar el mismo contrato entre aplicaciones.

Responsabilidades admitidas:

1. componentes visuales compartidos aprobados;
2. composición visual transversal aprobada;
3. patrones web reutilizables aprobados;
4. navegación visual compartida cuando su tarea propietaria la apruebe;
5. marca visual transversal;
6. contrato CSS compartido;
7. comportamiento accesible del componente compartido;
8. adaptación visual de contratos estáticos provenientes de `@vento/contracts`;
9. presentación de contexto ya resuelto proveniente de `@vento/os-context`;
10. estados visuales de carga, vacío, bloqueo, error y recuperación aprobados por sus tareas propietarias.

No son responsabilidades del package:

- autenticación;
- evaluación de permisos;
- resolución autoritativa de contexto;
- lectura de cookies de sesión;
- clientes Supabase;
- RPC;
- RLS;
- queries de dominio;
- mutaciones empresariales;
- persistencia;
- reglas de negocio;
- rutas específicas de una aplicación;
- formularios completos de dominio;
- páginas completas de aplicaciones;
- configuración ambiental sensible;
- secretos;
- UI React Native.

---

#### 7. Frontera con `@vento/contracts`

`@vento/contracts` mantiene autoridad sobre identidad y forma de los contratos estáticos.

`@vento/ui-web` puede consumirlos para renderizar una experiencia web, pero no redefinirlos.

Ejemplo de precedencia:

```text
AlertSpec / ActionSpec / ConfirmActionSpec
→ @vento/contracts
→ props o adapters de UI
→ @vento/ui-web
→ render visual
```

Queda prohibido:

```text
@vento/ui-web
→ crear un segundo AppCode
→ crear un segundo PermissionScopeCode
→ crear un segundo catálogo de estados
→ crear un segundo schema de acción
```

Si una UI requiere ampliar un contrato, primero se resuelve en la tarea propietaria del contrato.

---

#### 8. Frontera con `@vento/os-context`

`@vento/os-context` resuelve contexto, autorización runtime, guards y semántica compartida de sesión/contexto según su contrato.

`@vento/ui-web` puede recibir o consumir una representación ya resuelta únicamente para presentación.

La dirección permitida es:

```text
@vento/os-context
→ contexto/decisión ya resueltos
→ @vento/ui-web
→ indicador, selector, aviso o estado visual
```

Nunca:

```text
@vento/ui-web
→ inferir permiso desde roleCode
→ reconstruir EffectiveContext
→ conceder una sede por selección cliente
→ convertir disabled=false en autorización
```

La UI puede ocultar, mostrar, deshabilitar o explicar una acción según información autorizada, pero el servidor conserva la decisión final.

---

#### 9. Frontera con `@vento/supabase`

`@vento/ui-web` no depende directamente de `@vento/supabase`.

Quedan prohibidos dentro del package:

- creación de clientes Supabase;
- imports de factories browser/server/native/privileged;
- llamadas `.from(...)`, `.rpc(...)`, `.storage`, `.auth` o `.channel(...)`;
- selección de credenciales;
- lectura de variables Supabase;
- manejo de cookies de sesión;
- normalización directa del diagnóstico del proveedor.

La composición correcta es:

```text
APLICACIÓN / CONTROLADOR
→ obtiene datos o ejecuta acción
→ normaliza resultado
→ entrega props/estado/callback
→ @vento/ui-web renderiza
```

Esta separación evita que un componente visual se convierta en un backend implícito.

---

#### 10. Frontera con lógica empresarial de aplicaciones

Cada aplicación conserva:

- composición de sus procesos;
- consultas propias;
- mutaciones propias;
- navegación de dominio;
- formularios empresariales completos;
- reglas de elegibilidad de negocio;
- copy estrictamente específico de proceso;
- side effects operativos;
- integración con servicios propios.

`@vento/ui-web` no puede importar módulos internos de una aplicación ni depender de su árbol de rutas.

La reutilización se expresa mediante props, contratos, children, callbacks o adapters explícitos, no mediante conocimiento del dominio consumidor.

---

#### 11. Consumidores web previstos

La fundación compartida conserva siete repositorios web consumidores previstos:

```text
SHELL
VISO
NEXO
FOGO
ORIGO
PULSO
NUMERA
```

Para `@vento/ui-web` esto produce siete relaciones potenciales package–consumidor.

Estado en `SHELL-UI-001`:

| Relación                             | Estado |
| ------------------------------------ | ------ |
| package lógico definido              | 1      |
| consumidores previstos               | 7      |
| consumidores certificados            | 0      |
| migraciones de consumidor ejecutadas | 0      |
| retiros legacy ejecutados            | 0      |

La tarea no obliga a que los siete consumidores adopten simultáneamente la primera release.

---

#### 12. Runtime objetivo

`@vento/ui-web` es exclusivamente web.

Runtimes admitidos conceptualmente:

- React web;
- Next.js en la línea soportada por la matriz de compatibilidad;
- render de servidor para superficies que no requieran APIs cliente;
- navegador para componentes interactivos.

Fuera de alcance:

- React Native;
- Expo;
- componentes nativos;
- procesos de dispositivo no web;
- UI embebida que requiera APIs no soportadas sin adapter.

La compatibilidad exacta de versiones no se inventa en esta tarea; debe provenir de la política `SHELL-PKG-004` y de la materialización física correspondiente.

---

#### 13. Frontera server-safe e interactiva

La futura implementación deberá preservar dos clases de componentes:

```text
SERVER-SAFE
→ sin hooks de navegador
→ sin APIs DOM
→ sin estado cliente obligatorio
→ puede renderizarse donde React/Next lo permitan

INTERACTIVO
→ usa estado, efectos, eventos o APIs de navegador cuando corresponda
→ declara su frontera cliente de forma explícita
```

Reglas:

1. un componente interactivo no convierte automáticamente todo el package en client-only;
2. un barrel o export raíz no debe introducir dependencias cliente innecesarias a un consumidor server-safe;
3. los límites concretos se validarán cuando cada componente sea materializado;
4. la clasificación server-safe no convierte un componente en autoridad de servidor.

No se aprueban todavía subpaths ni nombres físicos de exports.

---

#### 14. Dependencias internas VENTO permitidas

La dirección de dependencias queda:

| Dependencia              | Política                                                                        |
| ------------------------ | ------------------------------------------------------------------------------- |
| `@vento/contracts`       | permitida para contratos y tipos estáticos aprobados                            |
| `@vento/os-context`      | permitida cuando un componente necesite contexto runtime compartido ya resuelto |
| `@vento/supabase`        | prohibida como dependencia directa de UI                                        |
| código de una aplicación | prohibido                                                                       |
| package UI nativo        | no existe relación runtime obligatoria                                          |

Regla de acoplamiento:

```text
contracts
    ↓
os-context ───→ ui-web

supabase ─────→ aplicación/controlador ─────→ ui-web
```

No se autoriza un ciclo entre los packages de la fundación.

---

#### 15. Dependencias de framework

React, Next.js y otras librerías de frontend que deban ser compartidas con el consumidor se tratarán como peer dependencies cuando la política de package lo exija.

`SHELL-UI-001` no congela versiones concretas.

Las bandas soportadas deberán:

- corresponder a las versiones realmente soportadas por los consumidores;
- evitar duplicar React dentro del artefacto publicado;
- comprobar compatibilidad antes de release;
- impedir una release estable que requiera una combinación no probada.

Una versión instalada actualmente en `vento-shell` no se convierte por sí sola en banda contractual del package.

---

#### 16. Superficie pública

`SHELL-UI-001` aprueba la identidad del package, no símbolos de componentes concretos.

Por tanto, en este corte:

```text
PACKAGE LÓGICO = DEFINIDO
API PÚBLICA CONCRETA = 0 SÍMBOLOS NUEVOS APROBADOS POR ESTA TAREA
SUBPATHS PÚBLICOS = 0 DEFINIDOS POR ESTA TAREA
CSS ENTRYPOINTS = 0 DEFINIDOS POR ESTA TAREA
```

Los exports se incorporarán únicamente cuando su tarea propietaria defina:

- nombre público;
- props o contrato;
- comportamiento;
- estados;
- accesibilidad;
- estilos;
- dependencias;
- compatibilidad;
- pruebas;
- política de deprecación.

Queda prohibido consumir rutas internas del futuro package como contrato estable.

---

#### 17. Regla de exports

Cuando exista materialización física:

1. el package publicará únicamente superficies declaradas por su mapa de exports;
2. una carpeta interna no constituye API pública;
3. una exportación nueva requiere tarea propietaria y clasificación SemVer;
4. una exportación retirada requiere deprecación y gate de retiro;
5. el package no publicará rutas de aplicación, archivos de entorno, secretos ni artefactos de dominio;
6. una exportación no podrá depender de una ruta relativa fuera del tarball;
7. el root no deberá reexportar accidentalmente una superficie incompatible con el runtime del consumidor.

La forma física exacta del mapa `exports` pertenece a la fase de materialización y no se crea aquí.

---

#### 18. Contrato de estilos

`@vento/ui-web` será la frontera de distribución del contrato CSS necesario para sus componentes compartidos.

El contrato deberá preservar:

- tokens normalizados ya aprobados;
- tipografía compartida aprobada;
- espaciado y densidad aplicables;
- estados visuales coherentes;
- foco visible;
- motion reducido cuando corresponda;
- responsividad compatible con los breakpoints aprobados;
- aislamiento suficiente para no reescribir silenciosamente estilos de dominio.

No se aprueba en esta tarea:

- un nombre de archivo CSS;
- un subpath de estilos;
- una librería de CSS adicional;
- una nueva paleta;
- una nueva escala tipográfica;
- un nuevo sistema de breakpoints.

Esas decisiones deben conservar lo ya resuelto por `SHELL-NORM-*` y por cada tarea UI propietaria.

---

#### 19. Marca y neutralidad de aplicación

Los elementos de marca transversal pueden pertenecer a `@vento/ui-web` cuando hayan sido aprobados como Vento OS comunes.

Quedan prohibidos como defaults transversales:

- nombres de módulos propios de una aplicación;
- rutas de NEXO u otra aplicación;
- permisos hardcodeados de una aplicación;
- dashboards de dominio;
- menú específico de un proceso;
- textos que presenten como global una capacidad local.

Un componente compartido puede recibir identidad de aplicación mediante contratos canónicos, pero no mantener listas paralelas locales de aplicaciones.

---

#### 20. Accesibilidad como responsabilidad de implementación

Todo componente que se incorpore al package deberá conservar accesibilidad equivalente o superior a su contrato aprobado.

La implementación compartida deberá cubrir, cuando aplique:

- semántica HTML adecuada;
- nombre accesible;
- foco visible;
- operación por teclado;
- orden de foco coherente;
- relación entre label, control y mensaje;
- estado disabled real cuando corresponda;
- estado loading perceptible;
- mensajes de error identificables;
- modales y diálogos con gestión de foco;
- reducción de movimiento según la normalización vigente.

`SHELL-UI-001` no certifica todavía ningún componente concreto porque el package no está materializado.

---

#### 21. Presentación no equivale a autorización

Una decisión visual nunca concede capacidad empresarial.

```text
visible = true
≠ autorizado = true

disabled = false
≠ autorizado = true

link presente
≠ acceso concedido

selector permite elegir
≠ contexto aceptado por servidor
```

Los componentes pueden representar una decisión previamente resuelta, pero las acciones sensibles deberán validarse nuevamente en la frontera autoritativa correspondiente.

Esta regla se aplica especialmente a:

- navegación;
- selectores de sede o área;
- simulación;
- acciones sensibles;
- AppSwitcher;
- AppShell;
- botones de operación.

---

#### 22. Modelo de efectos

La UI compartida no ejecuta por sí misma efectos empresariales remotos.

Patrón permitido:

```text
usuario interactúa
→ componente emite evento/callback tipado
→ aplicación/controlador valida contexto y autorización
→ aplicación ejecuta operación
→ aplicación recibe resultado
→ componente representa estado final
```

Un callback no garantiza éxito ni autorización.

La UI debe soportar explícitamente estados intermedios como loading, pending, success, warning o error cuando la tarea del componente los defina.

---

#### 23. Tratamiento de errores

`@vento/ui-web` no interpreta errores crudos de Supabase ni mensajes técnicos como semántica empresarial.

La secuencia correcta es:

```text
proveedor / backend
→ normalización técnica
→ resultado contractual / razón pública
→ contrato visual
→ @vento/ui-web
```

El package puede mapear un contrato visual aprobado a apariencia, iconografía, jerarquía y affordances, pero no convertir texto libre en una decisión de autorización o de negocio.

---

#### 24. Reconciliación de componentes locales actuales

La existencia actual bajo `src/components/ui` queda decidida para esta tarea así:

| Componente local | Estado cerrado en `SHELL-UI-001`                                             | Propiedad mientras no exista otra tarea aprobada                                       |
| ---------------- | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `Button.tsx`     | `LOCAL_CANDIDATO_A_COMPARTIR`; no export compartido todavía                  | `SHELL-UI-003` decide su posible superficie compartida; hasta entonces permanece local |
| `Card.tsx`       | `LOCAL_CANDIDATO_A_COMPARTIR`; no export compartido todavía                  | `SHELL-UI-004` decide su posible superficie compartida; hasta entonces permanece local |
| `Chip.tsx`       | `MANTENER_LOCAL`; fuera de la superficie inicial aprobada de `@vento/ui-web` | SHELL local; no existe pendiente de compartición en este mini-bloque                   |
| `Input.tsx`      | `MANTENER_LOCAL`; fuera de la superficie inicial aprobada de `@vento/ui-web` | SHELL local; no existe pendiente de compartición en este mini-bloque                   |
| `Modal.tsx`      | `MANTENER_LOCAL`; fuera de la superficie inicial aprobada de `@vento/ui-web` | SHELL local; no existe pendiente de compartición en este mini-bloque                   |
| `index.ts`       | `MANTENER_LOCAL`; barrel local y no mapa de exports del futuro package       | SHELL local hasta materialización autorizada del package                               |

Esta decisión cierra el tratamiento de los seis archivos para `SHELL-UI-001`: no quedan pendientes narrativos sobre `Chip`, `Input`, `Modal` o el barrel. Cualquier cambio futuro desde `MANTENER_LOCAL` requerirá una tarea canónica que lo autorice.

El template histórico contiene además implementaciones propias de `Button`, `Card`, `Input`, `Select` y `Badge`; esas copias no desplazan la decisión anterior ni se convierten en package API. `Button` y `Card` deberán reconciliar sus variantes al ejecutarse `SHELL-UI-003` y `SHELL-UI-004`; `Input`, `Select` y `Badge` permanecen fuera de la superficie inicial compartida aprobada por este mini-bloque mientras no exista una tarea propietaria que decida lo contrario.

La decisión `MANTENER_LOCAL` no declara un componente legacy ni autoriza su retiro.

No se copia ninguno de estos archivos al package en esta tarea.

---

#### 25. Reconciliación del template AppShell histórico

`templates/app-shell-standard` permanece clasificado como plantilla fuente histórica.

Sus módulos pueden servir como evidencia e insumo de comparación, pero no son la implementación canónica del futuro package.

Reglas:

1. no se copia el template completo a `@vento/ui-web`;
2. no se conserva código NEXO-específico como default transversal;
3. AppSwitcher, ProfileMenu, Chrome, shell, tablas y helpers se evalúan por responsabilidad;
4. una similitud visual no demuestra paridad funcional;
5. cualquier componente que se comparta necesita tarea propietaria, contrato y pruebas;
6. el retiro de la plantilla ocurre únicamente después de migración y evidencia de cero consumo legacy.

El template no se modifica en `SHELL-UI-001`.

---

#### 26. AppShell: ownership potencial sin aprobación anticipada

Las decisiones de distribución asignan `AppShell` al dominio visual de `@vento/ui-web`, pero `SHELL-UI-010` conserva la decisión de si el AppShell compuesto debe compartirse y con qué frontera.

Por tanto:

```text
@vento/ui-web
→ package propietario potencial de una implementación AppShell compartida

SHELL-UI-010
→ decide si el AppShell compuesto se comparte y cuál es su contrato
```

`SHELL-UI-001` no exporta ni aprueba un `AppShell` concreto.

Esta separación evita convertir la enumeración de responsabilidades de `SHELL-PKG-001` en una implementación prematura.

---

#### 27. Navegación

La navegación visual compartida puede vivir en `@vento/ui-web` únicamente cuando:

- consume el catálogo canónico de aplicaciones;
- recibe decisiones de disponibilidad o permiso desde la fuente apropiada;
- no hardcodea rutas de una aplicación como estándar global;
- no sustituye autorización del destino;
- conserva destinos seguros y versionados;
- permite extensiones locales declaradas sin bifurcar la fuente común.

`SHELL-UI-011` permanece propietario del patrón de navegación orientada a tareas.

No se crea navegación compartida en esta tarea.

---

#### 28. Selectores y contexto

Los componentes de contexto quedan repartidos en tareas posteriores:

| Capacidad visual        | Tarea          |
| ----------------------- | -------------- |
| indicador de contexto   | `SHELL-UI-006` |
| selector de sede        | `SHELL-UI-007` |
| selector de área        | `SHELL-UI-008` |
| aviso de rol simulado   | `SHELL-UI-009` |
| diagnóstico de contexto | `SHELL-UI-015` |

`SHELL-UI-001` solo fija su frontera:

```text
UI representa contexto
≠
UI crea autoridad de contexto
```

Ninguno de estos componentes podrá convertir una selección cliente en permiso efectivo.

---

#### 29. Componentes y patrones reservados

La secuencia del mini-bloque conserva las siguientes responsabilidades sin adelantarlas:

| Tarea          | Resultado reservado                             |
| -------------- | ----------------------------------------------- |
| `SHELL-UI-002` | compartir `Alert`                               |
| `SHELL-UI-003` | compartir `Button`                              |
| `SHELL-UI-004` | compartir `Card`                                |
| `SHELL-UI-005` | compartir `EmptyState`                          |
| `SHELL-UI-006` | compartir indicador de contexto                 |
| `SHELL-UI-007` | compartir selector de sede                      |
| `SHELL-UI-008` | compartir selector de área                      |
| `SHELL-UI-009` | compartir aviso de rol simulado                 |
| `SHELL-UI-010` | evaluar AppShell compartido                     |
| `SHELL-UI-011` | compartir navegación orientada a tareas         |
| `SHELL-UI-012` | compartir línea de estados de proceso           |
| `SHELL-UI-013` | compartir panel de acción principal             |
| `SHELL-UI-014` | compartir confirmaciones de acciones sensibles  |
| `SHELL-UI-015` | compartir diagnóstico de contexto               |
| `SHELL-UI-016` | compartir estados de error recuperable          |
| `SHELL-UI-017` | compartir patrón para tablet                    |
| `SHELL-UI-018` | compartir patrón para kiosco                    |
| `SHELL-UI-019` | compartir patrón de proceso interrumpido        |
| `SHELL-UI-020` | compartir patrón de traspaso entre aplicaciones |

`SHELL-UI-001` no define las props finales, exports, estilos o comportamiento específico de ninguno de esos resultados.

---

#### 30. Extensiones locales permitidas

Una aplicación puede conservar UI local cuando represente una responsabilidad realmente propia.

Son extensiones locales válidas, por ejemplo:

- composición específica de una pantalla;
- formulario de dominio;
- tabla de un proceso particular;
- panel con datos propios;
- navegación interna exclusiva del módulo;
- copy o ayuda de negocio;
- integración de un componente compartido con un flujo local.

Una extensión local no puede:

- copiar y modificar una primitiva compartida para evitar actualizar el package;
- redefinir contratos canónicos;
- alterar semántica de autorización;
- crear una segunda variante global sin tarea propietaria;
- presentarse como implementación compartida.

---

#### 31. Política de composición

El package favorece composición sobre configuración monolítica.

Principios:

1. props tipadas para datos y estado;
2. callbacks tipados para intención del usuario;
3. children o slots cuando una aplicación deba insertar contenido propio;
4. adapters explícitos para navegación o contexto cuando aplique;
5. defaults únicamente cuando sean realmente transversales;
6. ninguna prop genérica de metadata debe convertirse en canal para lógica arbitraria o autorización.

No se define en esta tarea un framework interno adicional de formularios, routing o state management.

---

#### 32. Versionado y compatibilidad

`@vento/ui-web` hereda la política de package compartido:

- SemVer independiente;
- versiones publicadas inmutables;
- dependencias internas VENTO con versiones compatibles según gobierno aprobado;
- release identificable por package, versión, tag, commit y artefacto;
- matriz de compatibilidad contra consumidores;
- actualización por PR explícito;
- cero adopción automática no probada.

Un cambio visual puede ser breaking aunque TypeScript compile.

La clasificación deberá considerar también:

- cambio de props;
- cambio de DOM relevante;
- cambio de comportamiento de teclado o foco;
- cambio de clases/contrato CSS público;
- cambio de rutas o destinos;
- cambio de significado de estados;
- retiro de una exportación.

---

#### 33. Migración de consumidores

La adopción física pertenece a `SHELL-MIG-001..008`.

Secuencia mínima futura:

```text
COMPONENTE/PATRÓN APROBADO
→ package materializado y probado
→ versión publicada
→ consumidor seleccionado
→ sustitución controlada
→ paridad funcional y visual
→ accesibilidad
→ build/typecheck/pruebas
→ observabilidad
→ rollback ensayado
→ retiro legacy solo con gate
```

No se exige una migración simultánea de los siete consumidores.

Un consumidor puede permanecer temporalmente en su implementación anterior mientras conserve una combinación soportada y trazable.

---

#### 34. Rollback

Toda adopción de `@vento/ui-web` deberá permitir volver a una versión anterior soportada sin copiar manualmente fuente desde `vento-shell`.

El rollback de un consumidor comprende, como mínimo:

- manifest;
- lockfile;
- versión del package;
- adaptación local estrictamente necesaria;
- contrato CSS compatible;
- evidencia de la combinación anterior.

No se autoriza retirar la implementación legacy antes de demostrar que ese rollback existe y que la nueva combinación superó la matriz aplicable.

---

#### 35. Publicación y materialización física

`SHELL-UI-001` es documental.

No realiza:

- creación de directorio físico del package;
- `package.json` del package;
- build config;
- mapa `exports`;
- CSS distribuible;
- publicación npm;
- tag;
- release;
- workflow;
- cambios de consumidores;
- eliminación de template;
- eliminación de componentes locales.

La materialización deberá respetar el expediente/gate de package y los controles `SHELL-CI-*` aplicables.

La inexistencia física actual es coherente con este estado.

---

#### 36. Validación futura del package

Cuando exista materialización, la validación mínima deberá cubrir:

1. identidad del package;
2. integridad del artefacto publicable;
3. ausencia de imports de dominio;
4. ausencia de dependencia directa de `@vento/supabase`;
5. resolución de peer dependencies;
6. tipos públicos;
7. server-safe vs client-only cuando aplique;
8. render básico;
9. comportamiento interactivo;
10. accesibilidad aplicable;
11. contrato CSS;
12. compatibilidad con los consumidores afectados;
13. no inclusión de secretos o archivos ajenos;
14. SemVer y changelog;
15. rollback de consumidor;
16. paridad frente a la implementación sustituida.

`SHELL-UI-001` no declara ejecutadas estas pruebas.

---

#### 37. Matriz de prohibiciones

| Prohibición                                                 | Motivo                                         |
| ----------------------------------------------------------- | ---------------------------------------------- |
| copiar todo `templates/app-shell-standard` al package       | propaga acoplamientos y deuda histórica        |
| importar `@vento/supabase` desde UI                         | mezcla presentación y acceso a datos           |
| hardcodear permisos o roles para decidir autoridad          | crea una fuente paralela de autorización       |
| hardcodear rutas NEXO como estándar                         | acopla package a un consumidor                 |
| bundle propio de React                                      | riesgo de runtime duplicado e incompatibilidad |
| exports desde rutas internas no declaradas                  | crea API accidental                            |
| incluir UI React Native                                     | rompe frontera web/native                      |
| ejecutar lógica empresarial desde una primitiva             | package visual se convierte en dominio         |
| retirar componentes locales por semejanza                   | ausencia de evidencia de paridad               |
| tratar el template como runtime                             | contradice su clasificación canónica           |
| usar existencia de un componente como decisión de compartir | evade tareas `SHELL-UI-*`                      |

---

#### 38. Estado de materialización física

Al cierre documental de `SHELL-UI-001`:

```text
IDENTIDAD @vento/ui-web                         = ESPECIFICADA
RESPONSABILIDAD DEL PACKAGE                    = ESPECIFICADA
FRONTERAS CON CONTRACTS/CONTEXT/SUPABASE       = ESPECIFICADAS
DEPENDENCIAS INTERNAS PERMITIDAS               = ESPECIFICADAS
REGLAS WEB SERVER-SAFE / INTERACTIVAS           = ESPECIFICADAS
REGLAS DE ESTILOS Y ACCESIBILIDAD              = ESPECIFICADAS
POLÍTICA DE EXPORTS                            = ESPECIFICADA
CLASIFICACIÓN DEL CÓDIGO UI ACTUAL             = ESPECIFICADA
PACKAGE FÍSICO                                 = NO MATERIALIZADO
API PÚBLICA CONCRETA                           = NO MATERIALIZADA
COMPONENTES COMPARTIDOS                        = 0 MATERIALIZADOS POR ESTA TAREA
CONSUMIDORES MIGRADOS                          = 0
RELEASE PUBLICADA                              = NO CONFIRMADA
CAMBIOS TREQ                                   = 0
```

No existe contradicción entre “crear `@vento/ui-web`” y no materializar físicamente el package en este corte: la fase H actual fija primero su contrato documental y las tareas posteriores materializan componentes y habilitación técnica bajo los gates aprobados.

---

#### 39. Handoffs exactos

| Destino                 | Handoff                                                                                                  |
| ----------------------- | -------------------------------------------------------------------------------------------------------- |
| `SHELL-UI-002`          | definir y compartir `Alert` dentro de la frontera aprobada                                               |
| `SHELL-UI-003`          | reconciliar y compartir `Button`                                                                         |
| `SHELL-UI-004`          | reconciliar y compartir `Card`                                                                           |
| `SHELL-UI-005`          | definir y compartir `EmptyState`                                                                         |
| `SHELL-UI-006..009`     | componentes visuales de contexto sin autoridad propia                                                    |
| `SHELL-UI-010`          | decidir el alcance del AppShell compartido                                                               |
| `SHELL-UI-011..020`     | patrones compuestos posteriores                                                                          |
| `SHELL-MIG-001..008`    | adopción progresiva, paridad y retiro legacy                                                             |
| `SHELL-NATIVE-001..003` | contratos compartibles con UI nativa, manteniendo componentes nativos separados                          |
| `SHELL-CI-*` aplicables | materialización, build, publicación, compatibilidad y releases cuando el gate correspondiente lo permita |

No se desplaza ninguna responsabilidad a un pendiente narrativo sin tarea propietaria.

---

#### 40. Requisitos de prueba derivados

`SHELL-UI-001` crea **0** requisitos `TREQ-*` y modifica **0** requisitos existentes.

Justificación:

- `TREQ-SHELL-002` ya protege la obligación de una implementación compartida o clasificación local explícita;
- `TREQ-SHELL-006` ya exige pruebas del package y matriz de compatibilidad;
- `TREQ-SHELL-007` ya exige rollback independiente;
- `TREQ-SHELL-008` ya gobierna registro y evidencia de requisitos;
- `TREQ-SHELL-029` ya impide tratar el template como runtime compartido por existencia;
- `TREQ-SHELL-030` ya protege navegación/contexto frente a acoplamiento NEXO y falsa autorización;
- `TREQ-SHELL-031` ya protege simulación y selección de sede frente a autoridad cliente;
- `TREQ-SHELL-032` ya exige reconciliar primitivas y kits antes de adopción o retiro;
- `TREQ-SHELL-035` ya protege textos y estados de superficies compartidas;
- `TREQ-SHELL-036..039` ya gobiernan release, deprecación, compatibilidad y retiro del package.

Las reglas de esta tarea especializan la arquitectura de esas coberturas sin introducir una obligación transversal nueva que requiera otro identificador.

Por ello no se modifica ningún fragmento 04A.

---

#### 41. Decisiones vinculantes

1. El nombre canónico es `@vento/ui-web`.
2. `vento-shell` es el repositorio propietario.
3. El package es exclusivamente web.
4. React Native permanece fuera del package.
5. `@vento/ui-web` contiene implementación visual compartida, no contratos estáticos autoritativos.
6. `@vento/contracts` conserva la autoridad de contratos estáticos.
7. `@vento/os-context` conserva la resolución runtime de contexto y autorización.
8. `@vento/supabase` conserva acceso compartido a datos.
9. `@vento/ui-web` no depende directamente de `@vento/supabase`.
10. La UI nunca sustituye autorización del servidor.
11. El package no contiene lógica empresarial específica de una aplicación.
12. Los siete consumidores pueden migrar de manera independiente.
13. La existencia de un componente local no lo convierte en export compartido.
14. `Button.tsx` se entrega a `SHELL-UI-003` para decisión de compartición.
15. `Card.tsx` se entrega a `SHELL-UI-004` para decisión de compartición.
16. `Chip.tsx`, `Input.tsx` y `Modal.tsx` permanecen locales en este corte.
17. El barrel local `src/components/ui/index.ts` no define la API del futuro package.
18. `templates/app-shell-standard` permanece plantilla fuente histórica.
19. El template no se copia de forma masiva al package.
20. Rutas o permisos NEXO hardcodeados no son estándares transversales.
21. `SHELL-UI-010` conserva la decisión del AppShell compuesto.
22. `SHELL-UI-002..020` son propietarios de sus respectivas superficies y patrones.
23. `SHELL-UI-001` no aprueba símbolos públicos concretos.
24. El mapa físico de exports se materializa después, bajo el gate correspondiente.
25. React y Next.js se tratarán conforme a la matriz de compatibilidad; esta tarea no inventa bandas de versión.
26. El package debe permitir superficies server-safe e interactivas sin convertir todo el package en client-only.
27. Los estilos compartidos conservan decisiones de normalización previas; no se crea un segundo sistema de diseño por esta tarea.
28. La accesibilidad pertenece a la responsabilidad del componente compartido.
29. La publicación se realiza como package npm privado versionado e inmutable.
30. Una actualización de consumidor se realiza mediante cambio explícito y pruebas, no automáticamente.
31. El retiro legacy solo ocurre después de paridad, compatibilidad y rollback.
32. No se realiza implementación física en esta tarea.
33. Se crean 0 requisitos `TREQ-*` y se modifican 0.

---

#### 42. Criterios de aceptación documental

`SHELL-UI-001` queda documentalmente cerrada únicamente si se cumplen simultáneamente:

- [x] el package lógico `@vento/ui-web` tiene identidad única;
- [x] el repositorio propietario queda fijado;
- [x] la responsabilidad visual web queda separada de contratos, contexto y datos;
- [x] la UI nativa queda fuera de alcance;
- [x] la dependencia directa de `@vento/supabase` queda prohibida;
- [x] la autorización de servidor no se delega a UI;
- [x] la lógica empresarial permanece en las aplicaciones;
- [x] los siete consumidores previstos quedan reconciliados como adopción futura, no actual;
- [x] se distingue server-safe de interacción cliente;
- [x] no se inventan versiones concretas de peer dependencies;
- [x] no se aprueban subpaths físicos sin tarea propietaria;
- [x] el contrato CSS queda dentro de la responsabilidad del package sin inventar un entrypoint físico;
- [x] accesibilidad queda como obligación de cada superficie compartida;
- [x] los cinco componentes locales actuales reciben decisión explícita;
- [x] `Button` se entrega a `SHELL-UI-003`;
- [x] `Card` se entrega a `SHELL-UI-004`;
- [x] `Chip`, `Input` y `Modal` permanecen locales en este corte;
- [x] el template AppShell permanece fuente histórica;
- [x] AppShell compuesto no se aprueba antes de `SHELL-UI-010`;
- [x] se preservan tareas propietarias `SHELL-UI-002..020`;
- [x] publicación, migración y retiro quedan en sus gates y tareas propietarias;
- [x] no se ejecutan cambios físicos;
- [x] se declaran 0 cambios TREQ con justificación explícita;
- [x] la continuidad queda exactamente en `SHELL-UI-002`.

Resultado:

```text
IDENTIDAD DEL PACKAGE                 = CERRADA
FRONTERAS DE RESPONSABILIDAD          = CERRADAS
ESTADO DEL CÓDIGO UI EXISTENTE        = RECONCILIADO PARA UI001
API CONCRETA                          = RESERVADA A UI002..020
PACKAGE FÍSICO                        = NO MATERIALIZADO
CONSUMIDORES MIGRADOS                 = 0
CAMBIOS TREQ                          = 0
SIGUIENTE TAREA                       = SHELL-UI-002
```

---

#### 43. Límites

Esta tarea no autoriza:

- crear el package físico;
- elegir una ruta física no aprobada previamente;
- crear `package.json`;
- publicar una versión;
- configurar registry;
- crear workflows;
- mover archivos UI existentes;
- borrar componentes locales;
- modificar el template;
- crear exports públicos concretos;
- compartir `Alert`, `Button`, `Card` o `EmptyState` antes de su tarea propietaria;
- aprobar un AppShell compartido antes de `SHELL-UI-010`;
- cambiar contratos estáticos;
- cambiar autorización;
- introducir Supabase en componentes visuales;
- migrar consumidores;
- retirar copias legacy;
- cambiar UI nativa;
- modificar requisitos de prueba;
- ejecutar cambios remotos.

---

#### 44. Continuidad

**ÚLTIMA TAREA APROBADA**

```text
SHELL-DB-005 — Separar cliente server, browser y native
```

**TAREA ACTUAL APROBADA**

```text
SHELL-UI-001 — Crear @vento/ui-web
```

**SIGUIENTE TAREA RESERVADA**

```text
SHELL-UI-002 — Compartir Alert
```

No se inicia `SHELL-UI-002` sin aprobación de `SHELL-UI-001`.


### ✅ SHELL-UI-002 — Compartir Alert

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-001 — Crear @vento/ui-web
**Tarea siguiente:** SHELL-UI-003 — Compartir Button
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_COMPONENTES_WEB_COMPARTIDOS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-UI-002` define el contrato canónico del componente visual compartido `Alert` que deberá pertenecer a `@vento/ui-web` y ser reutilizable por las aplicaciones web de Vento OS sin duplicar estilos, semántica visual ni reglas básicas de accesibilidad.

La tarea transforma el patrón visual legacy `ui-alert` observado en distintos consumidores en una especificación única de componente compartido, pero no materializa todavía el package, no migra consumidores y no retira CSS existente.

La regla raíz queda:

```text
ESTADO O MENSAJE YA DETERMINADO POR EL PROPIETARIO FUNCIONAL
+
INTENCIÓN VISUAL EXPLÍCITA
+
CONTENIDO HUMANO
→
Alert DE @vento/ui-web
→
PRESENTACIÓN VISUAL CONSISTENTE Y ACCESIBLE
```

`Alert` presenta información. No determina el hecho empresarial, no calcula autorización, no clasifica por sí mismo un error técnico y no convierte un mensaje en fuente de verdad.

---

#### 2. Resultado canónico

Se aprueba `Alert` como componente visual compartido de `@vento/ui-web` con las siguientes propiedades vinculantes:

1. una única identidad funcional compartida: `Alert`;
2. cuatro variantes visuales: `neutral`, `success`, `warning` y `danger`;
3. variante por defecto: `neutral`;
4. contenido textual o estructurado aportado por el consumidor;
5. icono opcional;
6. atributos HTML y ARIA transferibles al contenedor;
7. ausencia de estado interno obligatorio;
8. ausencia de dependencia directa de Supabase;
9. ausencia de dependencia de sesión, navegación o autorización;
10. compatibilidad con renderizado de servidor y cliente;
11. separación estricta entre apariencia visual y semántica de anuncio accesible;
12. separación estricta entre `Alert` y los patrones de notificación temporal tipo toast;
13. migración posterior por consumidor, no retiro inmediato del patrón legacy;
14. uso del contrato visual de `@vento/ui-web` sin crear un sistema de tokens o tema paralelo; su materialización física queda dentro del handoff de package a `SHELL-CI-*` aplicables.

El estado resultante es documental:

```text
Alert
→ DEFINIDO

implementación dentro de @vento/ui-web
→ NO MATERIALIZADA

consumidores migrados
→ 0 CONFIRMADOS POR ESTA TAREA

CSS legacy retirado
→ 0
```

---

#### 3. Fuentes y precedencia

La especificación conserva las decisiones vigentes de las siguientes fuentes canónicas y técnicas:

| Fuente                                                              | Uso vinculante                                                                                                |
| ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                        | continuidad, trazabilidad, separación entre definición e implementación y tratamiento de requisitos de prueba |
| `docs/plan-canonico/modular/delivery-contract.json`                 | forma del artefacto documental                                                                                |
| `docs/plan-canonico/modular/active-sequence.json`                   | continuidad `SHELL-UI-001 → SHELL-UI-002 → SHELL-UI-003`                                                      |
| `07_COMPONENTES_WEB_COMPARTIDOS.md`                                 | propietario del mini-bloque y secuencia `SHELL-UI-*`                                                          |
| `SHELL-UI-001`                                                      | identidad, fronteras y estado no materializado de `@vento/ui-web`                                             |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`                        | origen de la normalización de superficies compartidas                                                         |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`                         | distribución, versionado independiente y compatibilidad de packages                                           |
| Registro Canónico de Requisitos de Prueba — dominio SHELL           | paridad, compatibilidad, seguridad visual, migración y gobierno de packages ya cubiertos                      |
| Registro Canónico de Requisitos de Prueba — dominio UX              | lenguaje humano, relevancia, accesibilidad, privacidad, deduplicación y migración de mensajes ya cubiertos    |
| `templates/app-shell-standard/src/app/globals.css`                  | evidencia del patrón visual legacy `ui-alert` y sus variantes                                                 |
| `templates/app-shell-standard/src/components/vento/standard/ui.tsx` | evidencia de que el template no materializa actualmente un componente React `Alert`                           |
| `src/components/ui/*` de `vento-shell`                              | evidencia de primitivas locales existentes que no incluyen `Alert`                                            |
| estilos y usos `ui-alert` observados en repositorios consumidores   | evidencia de duplicación del patrón visual actual                                                             |

Precedencia aplicable:

```text
contrato canónico aprobado
→ contrato de @vento/ui-web
→ contrato de Alert
→ implementación futura del package
→ migración controlada de consumidores
→ retiro del legado con evidencia
```

Una clase CSS existente, una copia de template o una implementación local no sustituye este contrato.

---

#### 4. Línea base verificable

La línea base actual presenta cuatro hechos distintos que deben reconciliarse sin confundirlos:

| Superficie                                                          | Estado actual                                          | Decisión de esta tarea                                            |
| ------------------------------------------------------------------- | ------------------------------------------------------ | ----------------------------------------------------------------- |
| `@vento/ui-web`                                                     | definido documentalmente, no materializado físicamente | conserva estado; `Alert` queda como superficie futura del package |
| `templates/app-shell-standard/src/app/globals.css`                  | contiene patrón `.ui-alert`                            | fuente de compatibilidad visual, no API pública definitiva        |
| `templates/app-shell-standard/src/components/vento/standard/ui.tsx` | no contiene componente React `Alert`                   | no se trata como implementación del componente compartido         |
| `src/components/ui` de `vento-shell`                                | contiene otras primitivas locales, no `Alert`          | no se altera                                                      |
| consumidores con `.ui-alert` y/o usos equivalentes                  | duplicación física legacy                              | se conserva hasta migración validada                              |

El patrón CSS observado establece actualmente una familia visual reconocible:

```text
.ui-alert
.ui-alert--neutral
.ui-alert--success
.ui-alert--warning
.ui-alert--danger
.ui-alert__icon
.ui-alert__text
```

La repetición de esa familia en consumidores confirma una oportunidad real de compartir la superficie, pero no convierte los nombres de clase legacy en contrato público perpetuo.

---

#### 5. Alcance exacto

Esta tarea define:

1. identidad del componente;
2. responsabilidad funcional;
3. variantes visuales;
4. variante por defecto;
5. composición mínima;
6. contrato lógico de propiedades;
7. reglas de contenido;
8. reglas de iconografía;
9. reglas de accesibilidad;
10. tratamiento de regiones vivas y anuncios;
11. frontera con autorización y lógica empresarial;
12. frontera con errores técnicos;
13. frontera con navegación y acciones;
14. frontera con toasts y notificaciones temporales;
15. frontera con tema y tokens;
16. comportamiento de renderizado;
17. compatibilidad y migración legacy;
18. pruebas mínimas futuras;
19. rollback conceptual por consumidor;
20. handoffs exactos para implementación y adopción posteriores.

Esta tarea no define ni implementa:

| Materia                                                 | Propietario                                                                                                              |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| implementación física de `@vento/ui-web`                | pipeline de package habilitado por su gate aplicable                                                                     |
| `Button`                                                | `SHELL-UI-003`                                                                                                           |
| `Card`                                                  | `SHELL-UI-004`                                                                                                           |
| `EmptyState`                                            | `SHELL-UI-005`                                                                                                           |
| indicador de contexto                                   | `SHELL-UI-006`                                                                                                           |
| selector de sede                                        | `SHELL-UI-007`                                                                                                           |
| selector de área                                        | `SHELL-UI-008`                                                                                                           |
| aviso de rol simulado                                   | `SHELL-UI-009`                                                                                                           |
| evaluación del AppShell compartido                      | `SHELL-UI-010`                                                                                                           |
| navegación orientada a tareas                           | `SHELL-UI-011`                                                                                                           |
| línea de estados de proceso                             | `SHELL-UI-012`                                                                                                           |
| panel de acción principal                               | `SHELL-UI-013`                                                                                                           |
| confirmaciones de acciones sensibles                    | `SHELL-UI-014`                                                                                                           |
| diagnóstico de contexto                                 | `SHELL-UI-015`                                                                                                           |
| estados de error recuperable como patrón compuesto      | `SHELL-UI-016`                                                                                                           |
| patrón para tablet                                      | `SHELL-UI-017`                                                                                                           |
| patrón para kiosco                                      | `SHELL-UI-018`                                                                                                           |
| patrón de proceso interrumpido                          | `SHELL-UI-019`                                                                                                           |
| patrón de traspaso entre aplicaciones                   | `SHELL-UI-020`                                                                                                           |
| migración física de consumidores                        | `SHELL-MIG-001..008`                                                                                                     |
| taxonomía funcional de errores, bloqueos o reason codes | tareas propietarias de cada dominio y contratos canónicos correspondientes                                               |
| determinación de permisos                               | fundación de autorización y servidor propietario                                                                         |
| notificación temporal tipo toast                        | fuera del contrato de `Alert` en esta tarea; el legado permanece inventariable y migrable sin fusionarse automáticamente |

---

#### 6. Identidad y responsabilidad del componente

La identidad canónica queda:

| Propiedad                  | Decisión                                                                                  |
| -------------------------- | ----------------------------------------------------------------------------------------- |
| nombre de componente       | `Alert`                                                                                   |
| package lógico propietario | `@vento/ui-web`                                                                           |
| tipo                       | componente visual web compartido                                                          |
| responsabilidad            | presentar un mensaje o estado aportado por el consumidor con jerarquía visual consistente |
| autoridad de datos         | ninguna                                                                                   |
| autoridad de autorización  | ninguna                                                                                   |
| efectos remotos            | ninguno por defecto                                                                       |
| estado interno obligatorio | ninguno                                                                                   |
| dependencia de Supabase    | prohibida                                                                                 |
| dependencia de router      | prohibida como requisito del componente base                                              |
| entorno                    | React web compatible con renderizado de servidor y cliente                                |

Regla vinculante:

```text
Alert(state)
NO RESUELVE state
NO AUTORIZA state
NO PERSISTE state
NO NAVEGA POR state
SOLO REPRESENTA state
```

---

#### 7. Variantes visuales canónicas

Se congelan cuatro variantes y su propósito visual mínimo:

| Variante  | Propósito visual                                                    | Uso permitido                                                   |
| --------- | ------------------------------------------------------------------- | --------------------------------------------------------------- |
| `neutral` | información contextual sin connotación de éxito, precaución o fallo | avisos informativos, contexto, instrucciones o estado ordinario |
| `success` | resultado positivo ya determinado por el propietario                | confirmación visual de un estado realmente confirmado           |
| `warning` | precaución, degradación o condición que requiere atención           | advertencia sin afirmar por sí sola fallo definitivo            |
| `danger`  | fallo, bloqueo o condición crítica ya determinada                   | representar visualmente una condición negativa conocida         |

`neutral` es la variante por defecto.

Las variantes son **intención de presentación**, no categorías de dominio.

Por tanto:

- `success` no prueba que una transacción haya sido confirmada por servidor;
- `warning` no decide si una acción puede continuar;
- `danger` no equivale automáticamente a denegación de autorización;
- `neutral` no implica baja prioridad empresarial;
- ninguna variante reemplaza códigos de estado, reason codes, receipts o datos autoritativos.

El consumidor debe mapear explícitamente su estado de dominio a una variante visual.

---

#### 8. Contrato lógico de propiedades

La API conceptual mínima queda definida así:

```text
Alert
  variant?   = neutral | success | warning | danger
  children   = contenido visible requerido
  icon?      = contenido visual opcional
  className? = extensión visual acotada
  ...props   = atributos compatibles del contenedor HTML
```

Semántica vinculante:

| Propiedad        | Regla                                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `variant`        | opcional; valor por defecto `neutral`; no acepta valores abiertos silenciosamente                                              |
| `children`       | requerido como contenido visible y comprensible; puede contener texto y estructura inline/semántica razonable                  |
| `icon`           | opcional; nunca sustituye el mensaje textual                                                                                   |
| `className`      | opcional; no puede utilizarse para romper invariantes de accesibilidad, ocultar el contenido o fabricar autoridad              |
| atributos HTML   | se transfieren al elemento raíz cuando sean compatibles                                                                        |
| atributos ARIA   | se transfieren sin imponer una región viva universal                                                                           |
| eventos estándar | pueden transferirse cuando sean semánticamente válidos, pero no convierten el componente en un control interactivo por defecto |

El contenedor base conceptual será un elemento de bloque no interactivo equivalente a `div`.

No se define en esta tarea un subpath público adicional para `Alert`; esa decisión debe permanecer coherente con el mapa de exports físico que adopte `@vento/ui-web` cuando sea materializado.

---

#### 9. Composición estructural

La estructura lógica mínima es:

```text
Alert
├─ icon?      → apoyo visual opcional
└─ content    → mensaje visible obligatorio
```

La implementación futura podrá introducir wrappers internos siempre que no cambie el contrato observable sin el tratamiento de compatibilidad correspondiente.

No se exige:

- título separado;
- botón de cierre;
- temporizador;
- portal;
- overlay;
- cola global;
- persistencia;
- almacenamiento;
- navegación;
- acción primaria propia.

Si un consumidor necesita acciones dentro del mensaje, estas deberán provenir del contenido compuesto o de un componente propietario de mayor nivel. `Alert` no se convierte por ello en dueño de la operación.

---

#### 10. Contrato visual

La familia visual futura deberá conservar la intención del patrón legacy sin fijar sus clases históricas como API perpetua.

Invariantes:

1. contenedor perceptible como unidad;
2. separación visual clara respecto al contenido adyacente;
3. variante distinguible mediante más de una señal cuando el significado sea relevante;
4. icono y texto alineados sin desplazar el orden de lectura;
5. texto legible en reflow y zoom;
6. sin ancho fijo que obligue scroll horizontal ordinario;
7. sin altura fija que recorte mensajes extensos;
8. sin depender de hover para revelar información esencial;
9. sin usar únicamente color para comunicar significado;
10. compatibilidad con el contrato visual de `@vento/ui-web`, sin fijar en esta tarea tokens físicos todavía no materializados.

Las clases `.ui-alert*` se consideran **compatibilidad legacy**, no contrato público definitivo del package.

---

#### 11. Contrato de contenido humano

`Alert` no genera copy de dominio. El consumidor aporta un mensaje previamente resuelto por la fuente propietaria.

El contenido presentado deberá respetar los contratos UX vigentes:

- explicar el estado en lenguaje humano;
- no exponer SQL, stack traces, tokens, payloads o detalles internos sensibles;
- no culpar al trabajador por fallos técnicos o de configuración;
- no afirmar éxito antes de confirmación autoritativa cuando esta sea necesaria;
- no afirmar ausencia de información cuando la causa real sea un fallo de carga;
- no revelar información a un actor que no deba conocerla;
- conservar una ruta de recuperación cuando el dominio la requiera;
- evitar alertas duplicadas que representen el mismo hecho sin necesidad.

Estas obligaciones pertenecen al mensaje y al dominio; `Alert` ofrece el contenedor visual para expresarlas de forma consistente.

---

#### 12. Accesibilidad y semántica de anuncio

La regla principal es:

```text
APARIENCIA DE ALERTA
≠
REGIÓN VIVA OBLIGATORIA
```

No toda instancia de `Alert` debe usar `role="alert"`.

Forzar ese rol en cada render generaría anuncios innecesarios, duplicados o disruptivos para tecnologías de asistencia, especialmente cuando el contenido ya está presente al cargar la página.

Por tanto:

1. el componente base no impone `role="alert"` universal;
2. el componente base no impone `aria-live` universal;
3. el consumidor puede aportar `role`, `aria-live`, `aria-atomic` y demás atributos ARIA cuando el comportamiento dinámico lo requiera;
4. un mensaje crítico insertado dinámicamente puede usar una semántica de anuncio urgente definida por su propietario;
5. un estado informativo dinámico puede usar una semántica menos intrusiva cuando corresponda;
6. contenido estático no debe transformarse artificialmente en anuncio repetitivo;
7. el texto significativo debe permanecer en el árbol accesible;
8. un icono meramente decorativo debe quedar fuera de la lectura accesible;
9. un icono con significado no expresado en el texto requiere nombre accesible o contenido equivalente;
10. el componente no debe capturar ni mover foco por defecto;
11. mover foco ante un bloqueo crítico corresponde al flujo propietario que conoce la interacción, no al componente visual genérico;
12. la variante no debe ser perceptible únicamente por color.

La tarea no sustituye las obligaciones transversales de accesibilidad ya registradas ni su validación mediante las tareas `UX-QA-*` aplicables y las pruebas del package y de sus consumidores.

---

#### 13. Iconografía

El slot `icon` es opcional.

Reglas:

1. no existe icono obligatorio para que un Alert sea válido;
2. un icono decorativo no debe duplicar verbalmente el mensaje para lector de pantalla;
3. el icono no define la variante;
4. la variante no se infiere de la identidad del icono;
5. el componente no incorpora una biblioteca de iconos como autoridad propia;
6. esta tarea no define ni selecciona un catálogo transversal de iconos;
7. un consumidor puede omitir icono sin perder significado funcional.

---

#### 14. Frontera con autorización

`Alert` nunca concede, niega ni deriva permisos.

Queda prohibido que el componente:

- consulte permisos;
- inspeccione roles;
- resuelva sede, área, turno o check-in;
- lea cookies de autorización;
- interprete una clase visual como autorización;
- oculte una acción como único mecanismo de seguridad;
- transforme una condición visual en decisión de servidor.

La secuencia correcta es:

```text
servidor / propietario autoritativo
→ decisión o estado
→ proyección segura para el actor
→ mensaje humano
→ variante visual
→ Alert
```

La secuencia prohibida es:

```text
Alert danger
→ asumir DENY
```

También queda prohibido:

```text
Alert success
→ asumir operación confirmada
```

---

#### 15. Frontera con errores técnicos

`Alert` no consume ni normaliza directamente objetos de error de Supabase, excepciones de framework o stack traces.

La capa propietaria debe convertir primero el resultado técnico al contrato público y humano aplicable.

Secuencia:

```text
error técnico
→ normalización propietaria
→ estado / razón pública segura
→ copy humano
→ variante visual
→ Alert
```

Esto conserva la separación entre `@vento/supabase`, contratos de errores y `@vento/ui-web`.

---

#### 16. Frontera con estados de negocio

El componente no define qué significa:

- completado;
- confirmado;
- pendiente;
- bloqueado;
- conflicto;
- rechazado;
- requiere intervención;
- offline;
- sincronizando;
- aprobado;
- denegado.

Esos estados pertenecen a sus contratos funcionales.

`Alert` únicamente representa el mensaje que una capa propietaria decidió mostrar.

La misma variante puede ser utilizada por dominios diferentes sin unificar sus estados empresariales.

---

#### 17. Frontera con Toast y notificaciones temporales

El patrón legacy `ui-toast` no se absorbe en `Alert`.

Diferencia vinculante:

| Superficie   | Naturaleza                                                   |
| ------------ | ------------------------------------------------------------ |
| `Alert`      | región de mensaje integrada en el flujo normal del documento |
| toast legacy | notificación temporal o superpuesta con ciclo de vida propio |

Esta tarea no crea una API `Toast`, no define duración, cola, portal, posición, cierre automático ni prioridad de notificaciones.

Los toasts existentes permanecen sin modificación y deberán ser inventariados y tratados por el proceso de migración correspondiente antes de cualquier retiro.

---

#### 18. Frontera con navegación y acciones

El componente base no depende de router ni resuelve destinos.

Puede contener enlaces o controles aportados por el consumidor siempre que:

1. el consumidor sea propietario de su destino y autorización;
2. la acción sea comprensible sin depender del color del Alert;
3. el control conserve semántica HTML correcta;
4. no se anide interacción inválida;
5. el Alert no transforme el destino en autorizado;
6. los deep links y handoffs sean revalidados por el destino cuando corresponda.

`Alert` tampoco decide cuándo mostrar una acción de reintento. Esa decisión pertenece al propietario que conoce idempotencia, estado remoto y posibilidad real de recuperación.

---

#### 19. Tema, tokens y CSS

`Alert` consumirá el contrato visual compartido de `@vento/ui-web` y no definirá un sistema de tema paralelo.

Reglas:

1. las variantes deberán poder expresarse mediante tokens compartidos;
2. el componente no dependerá de colores hardcodeados específicos de una aplicación como contrato público;
3. claro y oscuro deberán conservar significado, legibilidad y contraste;
4. esta tarea no renombra, crea ni sustituye el contrato general de tokens y CSS ya reservado por la arquitectura de `@vento/ui-web`;
5. el componente podrá tener estilos propios internos, pero no exigirá que cada consumidor copie manualmente bloques `.ui-alert`;
6. la migración deberá eliminar duplicación únicamente después de demostrar paridad.

Las variables actuales del template son evidencia de diseño, no el contrato final de tokens que esta tarea pueda renombrar por anticipado.

---

#### 20. Renderizado y frontera server/client

`Alert` no requiere por contrato estado React, efectos, acceso al navegador ni APIs cliente.

Por tanto:

- debe ser compatible con renderizado de servidor;
- debe ser compatible con composición desde componentes cliente;
- no debe requerir la directiva de cliente únicamente por existir;
- no debe leer `window`, `document`, localStorage o cookies;
- no debe crear suscripciones;
- no debe iniciar temporizadores;
- no debe registrar listeners globales;
- no debe mutar estado externo.

Si un consumidor necesita comportamiento interactivo alrededor del Alert, ese comportamiento debe vivir en una capa propietaria o composición explícita.

---

#### 21. Contrato de extensibilidad

La extensibilidad queda limitada para proteger consistencia sin bloquear composición legítima.

Permitido:

- contenido compuesto;
- icono opcional;
- atributos HTML compatibles;
- atributos ARIA;
- `className` adicional;
- identificadores para pruebas o asociación semántica;
- enlaces y controles semánticamente válidos como contenido del consumidor.

No permitido como extensión silenciosa:

- nuevas variantes no canónicas sin cambio contractual;
- convertir `variant` en un string abierto;
- esconder contenido obligatorio por CSS;
- añadir lógica de autorización dentro del componente;
- añadir llamadas de red;
- añadir dependencia directa de una aplicación;
- añadir timers o autodescartado al componente base;
- convertirlo en toast mediante props ad hoc;
- usar props visuales para transmitir permisos.

---

#### 22. Compatibilidad legacy

La migración debe preservar la intención de los usos actuales antes de retirar el patrón legacy.

Matriz de correspondencia mínima:

| Legacy                      | Contrato futuro                |
| --------------------------- | ------------------------------ |
| `.ui-alert` sin modificador | `Alert variant="neutral"`      |
| `.ui-alert--neutral`        | `Alert variant="neutral"`      |
| `.ui-alert--success`        | `Alert variant="success"`      |
| `.ui-alert--warning`        | `Alert variant="warning"`      |
| `.ui-alert--danger`         | `Alert variant="danger"`       |
| `.ui-alert__icon`           | `icon`                         |
| `.ui-alert__text`           | `children` / contenido visible |

Esta correspondencia sirve para migración, no obliga a conservar estructura DOM o clases internas idénticas después de certificar paridad.

Un consumidor con comportamiento adicional alrededor del CSS legacy deberá ser clasificado antes de migrar; no se descartará ese comportamiento por asumir que dos clases iguales representan el mismo contrato completo.

---

#### 23. Estrategia de migración futura

La adopción será progresiva y reversible.

Secuencia mínima:

```text
inventario de usos reales
→ clasificación por consumidor
→ identificación de variantes y comportamiento adicional
→ package físicamente habilitado
→ implementación de Alert
→ pruebas del package
→ lote de migración por consumidor
→ paridad funcional y visual
→ accesibilidad
→ observación
→ retiro del CSS legacy únicamente con evidencia
```

Handoffs de migración:

| Necesidad                                              | Tarea propietaria    |
| ------------------------------------------------------ | -------------------- |
| inventario ejecutable de consumidores                  | `SHELL-MIG-001`      |
| lotes reversibles por repositorio                      | `SHELL-MIG-002`      |
| compatibilidad y bloqueo de nuevos consumidores legacy | `SHELL-MIG-003`      |
| migración progresiva                                   | `SHELL-MIG-003..007` |
| pruebas de paridad por consumidor                      | `SHELL-MIG-007`      |
| retiro de copias legacy                                | `SHELL-MIG-008`      |

No se autoriza retirar CSS de un consumidor por el solo hecho de que exista el componente compartido.

---

#### 24. Rollback conceptual

Cada consumidor deberá poder revertir su adopción sin revertir a los demás.

Rollback permitido:

```text
versión / cambio del consumidor con Alert compartido
→ revert del manifiesto y lockfile cuando aplique
→ restauración del uso legacy previamente conocido
→ nueva validación
```

El rollback no debe:

- modificar datos;
- alterar permisos;
- borrar mensajes históricos;
- cambiar reason codes;
- reintroducir secretos;
- afectar otros consumidores;
- requerir sobrescribir una versión publicada del package.

La migración no retirará su fallback legacy hasta superar el gate de retiro aplicable.

---

#### 25. Seguridad y privacidad

`Alert` es una superficie de presentación y, por ello, puede convertirse en canal de fuga si recibe contenido indebido.

Reglas:

1. el componente no consulta datos sensibles;
2. el componente no redacciona automáticamente datos porque no conoce su semántica;
3. el propietario debe enviar únicamente contenido permitido para el actor;
4. mensajes no deben contener tokens, credenciales, cookies, SQL, stacks ni payloads internos;
5. el icono no debe cargar URLs sensibles ni transportar secretos;
6. IDs de soporte visibles deberán ser referencias seguras;
7. un Alert oculto por CSS no constituye protección de datos;
8. desmontar u ocultar una instancia no revoca autorización ni invalida el estado autoritativo;
9. el componente no persiste el mensaje;
10. el componente no registra telemetría propia del contenido por defecto.

---

#### 26. Internacionalización y longitud

`Alert` no fija idioma ni catálogo de traducciones.

Debe soportar contenido variable sin depender de una longitud corta.

Reglas:

- no truncar mensajes esenciales por defecto;
- permitir salto de línea y reflow;
- evitar layouts que fallen con textos más largos;
- no construir significado concatenando fragmentos inaccesibles;
- no asumir que una variante corresponde a una palabra fija;
- el copy y su localización permanecen bajo contratos de contenido y dominio.

---

#### 27. Comportamiento ante contenido ausente o inválido

El contrato exige contenido visible significativo.

La implementación futura deberá tratar como defecto de desarrollo una instancia que carezca de contenido útil.

No se autoriza que el componente invente mensajes de fallback como:

```text
Ocurrió un error
```

si el propietario no proporcionó contenido.

Un fallback genérico ocultaría la responsabilidad de producir un mensaje correcto y una ruta de recuperación.

---

#### 28. Relación con el Registro Canónico de Requisitos de Prueba

Esta tarea **no crea ni modifica requisitos de prueba**.

Justificación concreta:

1. el registro vigente ya exige lenguaje humano y recuperación para errores y bloqueos;
2. ya exige relevancia de alertas y notificaciones para el actor correcto;
3. ya prohíbe que información visual sustituya autorización;
4. ya exige que estados y bloqueos no dependan solo de color o icono;
5. ya exige anuncios accesibles de cambios materiales sin ruido constante;
6. ya exige privacidad y minimización en notificaciones;
7. ya exige deduplicación y ciclo de vida de mensajes;
8. ya exige inventariar y migrar mensajes, toasts, banners y superficies legacy antes de retirarlas;
9. las obligaciones nuevas de esta tarea son una especialización del componente que implementará esa cobertura existente, no una nueva regla de riesgo no registrada.

Resultado:

```text
REQUISITOS CREADOS: 0
REQUISITOS MODIFICADOS: 0
REQUISITOS DIFERIDOS: 0
REQUISITOS DESCARTADOS: 0
```

No se genera fragmento adicional del registro.

---

#### 29. Pruebas mínimas futuras del componente

Cuando la implementación física sea habilitada, la suite del package deberá cubrir como mínimo:

1. render de `neutral`;
2. render de `success`;
3. render de `warning`;
4. render de `danger`;
5. `neutral` como valor por defecto;
6. rechazo de variante inválida en el contrato tipado;
7. render de contenido textual;
8. render de contenido compuesto;
9. render sin icono;
10. render con icono;
11. icono decorativo fuera del nombre accesible cuando corresponda;
12. atributos HTML transferidos al root;
13. `className` adicional sin eliminar estilos base;
14. `role` transferible;
15. `aria-live` transferible;
16. `aria-atomic` transferible;
17. ausencia de `role="alert"` forzado por defecto;
18. ausencia de `aria-live` forzado por defecto;
19. ausencia de captura de foco por defecto;
20. mensaje visible sin depender del icono;
21. variante perceptible sin depender únicamente del color;
22. reflow con contenido largo;
23. zoom sin recorte esencial;
24. SSR sin acceso a APIs del navegador;
25. composición dentro de un componente cliente;
26. ausencia de import directo de Supabase;
27. ausencia de import de router como dependencia del componente base;
28. ausencia de llamadas de red;
29. ausencia de timers/autodescartado;
30. ausencia de estado global propio;
31. compatibilidad con tokens de tema;
32. tema claro;
33. tema oscuro;
34. paridad visual con `ui-alert--neutral` en consumidor de referencia;
35. paridad visual con `ui-alert--success`;
36. paridad visual con `ui-alert--warning`;
37. paridad visual con `ui-alert--danger`;
38. migración de icono legacy;
39. migración de texto legacy;
40. no absorción del patrón toast;
41. contenido con link semántico;
42. contenido con control permitido por el consumidor;
43. no interpretación de `danger` como autorización denegada;
44. no interpretación de `success` como confirmación remota;
45. snapshots o pruebas visuales bajo la estrategia futura del package;
46. pruebas de contraste y accesibilidad bajo la certificación transversal;
47. compatibilidad por consumidor antes del retiro del CSS legacy;
48. rollback de un consumidor sin alterar otro;
49. no exposición de detalles técnicos mediante fixtures de error normalizado;
50. conservación de contenido y semántica al cambiar únicamente la variante.

Estas pruebas son obligaciones de implementación futura; esta tarea no afirma su ejecución.

---

#### 30. Criterios de aceptación documental

`SHELL-UI-002` se considera documentalmente completa cuando se verifica que:

1. existe una única identidad `Alert`;
2. pertenece lógicamente a `@vento/ui-web`;
3. conserva las cuatro variantes legacy relevantes;
4. `neutral` queda como variante por defecto;
5. el componente no genera copy de dominio;
6. el componente no normaliza errores técnicos;
7. el componente no consulta Supabase;
8. el componente no evalúa autorización;
9. el componente no decide navegación;
10. el componente no exige estado cliente;
11. el componente no fuerza región viva universal;
12. ARIA puede transferirse explícitamente;
13. el icono es opcional;
14. el contenido visible es obligatorio;
15. no depende solo de color;
16. no absorbe Toast;
17. no cambia el sistema de tema;
18. no crea nuevos exports físicos;
19. no materializa package ni componente;
20. no migra consumidores;
21. no retira CSS legacy;
22. conserva rollback por consumidor;
23. asigna migración a tareas existentes;
24. conserva la tarea siguiente sin desarrollar;
25. genera cero cambios en requisitos de prueba con justificación concreta.

---

#### 31. Estado físico posterior a la tarea

| Elemento                                   | Estado              |
| ------------------------------------------ | ------------------- |
| contrato documental de `Alert`             | `ESPECIFICADO`      |
| package físico `@vento/ui-web`             | `NO_MATERIALIZADO`  |
| archivo físico del componente `Alert`      | `NO_MATERIALIZADO`  |
| export físico de `Alert`                   | `NO_MATERIALIZADO`  |
| estilos físicos nuevos del package         | `NO_MATERIALIZADOS` |
| consumidores migrados por esta tarea       | `0`                 |
| CSS legacy retirado por esta tarea         | `0`                 |
| cambios de Supabase                        | `0`                 |
| migraciones SQL                            | `0`                 |
| cambios de datos                           | `0`                 |
| cambios de configuración remota            | `0`                 |
| requisitos de prueba creados o modificados | `0`                 |

---

#### 32. Handoffs obligatorios

Los siguientes trabajos quedan asignados, sin ejecutarse en esta tarea:

| Handoff                                                          | Propietario                                                                      | Condición de salida                                                                          |
| ---------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| materialización física de `@vento/ui-web`, `Alert` y sus exports | `SHELL-CI-*` aplicables, cuando el gate correspondiente habilite materialización | package construido y componente implementado conforme a los contratos documentales aprobados |
| build, publicación, compatibilidad y release                     | `SHELL-CI-*` aplicables                                                          | artefacto versionado y verificable conforme al gobierno de packages                          |
| accesibilidad del componente en package y consumidores           | `UX-QA-*` aplicables y pruebas de package/consumidor                             | semántica, anuncio, color, reflow y tecnologías de asistencia validadas según el escenario   |
| inventario de consumidores legacy                                | `SHELL-MIG-001`                                                                  | todos los usos aplicables clasificados                                                       |
| lotes reversibles                                                | `SHELL-MIG-002`                                                                  | cada consumidor asignado a un lote con rollback                                              |
| compatibilidad y no nuevos legacy                                | `SHELL-MIG-003`                                                                  | guardrail y estrategia compatibles definidos                                                 |
| paridad por consumidor                                           | `SHELL-MIG-007`                                                                  | evidencia funcional, visual y de accesibilidad por lote                                      |
| retiro del legado                                                | `SHELL-MIG-008`                                                                  | ausencia de consumidores residuales y rollback disponible                                    |

Ningún handoff modifica la continuidad inmediata del plan.

---

#### 33. Decisiones vinculantes

1. El componente compartido se denomina `Alert`.
2. `Alert` pertenece a `@vento/ui-web`.
3. La tarea es documental y no materializa código.
4. El patrón legacy observado es evidencia de migración, no API pública perpetua.
5. Las variantes canónicas son `neutral`, `success`, `warning` y `danger`.
6. `neutral` es la variante por defecto.
7. `variant` expresa presentación, no autoridad ni estado empresarial canónico.
8. El consumidor aporta el contenido.
9. El contenido visible es obligatorio.
10. El icono es opcional.
11. El icono no sustituye el mensaje textual.
12. El componente admite atributos HTML compatibles.
13. El componente admite atributos ARIA explícitos.
14. No se fuerza `role="alert"` universal.
15. No se fuerza `aria-live` universal.
16. El componente no mueve foco por defecto.
17. El componente no depende de Supabase.
18. El componente no depende de sesión.
19. El componente no evalúa permisos.
20. El componente no resuelve contexto operativo.
21. El componente no normaliza errores técnicos.
22. El componente no genera reason codes.
23. El componente no genera copy de dominio.
24. El componente no decide reintentos.
25. El componente no decide navegación.
26. El componente no ejecuta efectos remotos.
27. El componente no persiste mensajes.
28. El componente no crea timers.
29. El componente no exige renderizado cliente.
30. El componente debe funcionar en SSR.
31. La variante no puede depender únicamente del color para comunicar significado.
32. El contenido debe soportar reflow y longitud variable.
33. El componente no crea un sistema de tema paralelo.
34. Esta tarea no crea ni renombra el contrato general de tokens de `@vento/ui-web`.
35. Esta tarea no define un catálogo transversal de iconos.
36. La accesibilidad sigue siendo obligación propia de `Alert` y se valida con la cobertura UX y las pruebas del package y consumidores aplicables.
37. Toast no se fusiona con Alert.
38. Los toasts legacy no se retiran en esta tarea.
39. Los consumidores actuales no se modifican.
40. El CSS legacy no se retira.
41. La migración será progresiva por consumidor.
42. Cada consumidor conserva rollback independiente.
43. El retiro exige evidencia de ausencia de uso residual.
44. El componente no convierte UI en control de seguridad.
45. Ocultar el Alert no modifica el estado autoritativo.
46. El package no expone secretos a través del componente.
47. No se crean cambios de Supabase.
48. No se crean cambios de datos.
49. No se crean ni modifican requisitos de prueba.
50. `SHELL-UI-003` permanece reservada y no se desarrolla aquí.

---

#### 34. Continuidad

**ÚLTIMA TAREA APROBADA:** `SHELL-UI-001 — Crear @vento/ui-web`

**TAREA ACTUAL APROBADA:** `SHELL-UI-002 — Compartir Alert`

**SIGUIENTE TAREA RESERVADA:** `SHELL-UI-003 — Compartir Button`


### ✅ SHELL-UI-003 — Compartir Button

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-002 — Compartir Alert
**Tarea siguiente:** SHELL-UI-004 — Compartir Card
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_COMPONENTES_WEB_COMPARTIDOS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-UI-003` define y reconcilia el contrato canónico del componente visual compartido `Button` que deberá pertenecer a `@vento/ui-web`.

La tarea parte de implementaciones actuales que comparten la misma intención general pero no el mismo contrato observable. La implementación local de SHELL y la familia histórica `vento/standard` coinciden en el elemento HTML base, los tamaños `sm | md | lg` y parte de las variantes, pero divergen en variantes, estado de carga, ancho, estilos y boundary de cliente.

La tarea no adopta una copia por precedencia accidental. Materializa documentalmente una única decisión común:

```text
INTENCIÓN DE ACCIÓN YA DETERMINADA POR EL PROPIETARIO FUNCIONAL
+
ESTADO DE INTERACCIÓN YA RESUELTO
+
JERARQUÍA VISUAL EXPLÍCITA
+
SEMÁNTICA NATIVA DE BUTTON
→
Button DE @vento/ui-web
→
INTERACCIÓN WEB CONSISTENTE, ACCESIBLE Y REUTILIZABLE
```

`Button` representa y dispara una interacción entregada por el consumidor. No decide qué acciones existen, quién puede ejecutarlas, qué operación empresarial corresponde ni si una mutación quedó confirmada.

---

#### 2. Resultado canónico

Se aprueba `Button` como componente compartido de `@vento/ui-web` con las siguientes propiedades vinculantes:

1. identidad pública funcional única: `Button`;
2. variantes canónicas `primary`, `secondary`, `outline`, `ghost` y `danger`;
3. variante por defecto `primary`;
4. tamaños canónicos `sm`, `md` y `lg`;
5. tamaño por defecto `md`;
6. elemento semántico nativo `button`;
7. `type="button"` como comportamiento por defecto cuando el consumidor no declara otro tipo;
8. soporte de atributos nativos compatibles de `HTMLButtonElement`;
9. soporte de estado `disabled` nativo;
10. soporte de estado visual e interactivo `loading` sin transformar la carga en resultado empresarial;
11. preservación del nombre accesible durante `loading`;
12. ausencia de una propiedad pública específica `fullWidth`;
13. ausencia de polimorfismo de enlace o navegación en esta tarea;
14. ausencia de autorización, contexto, datos, RPC o lógica empresarial dentro del componente;
15. compatibilidad conceptual con renderizado server-safe sin imponer un boundary cliente a todo el módulo;
16. adopción y retiro legacy posteriores, por consumidor y con rollback;
17. cero cambios físicos y cero consumidores migrados por esta tarea.

El estado resultante queda:

```text
Button compartido
→ DEFINIDO

API conceptual
→ DEFINIDA

implementación física en @vento/ui-web
→ NO MATERIALIZADA

consumidores migrados
→ 0

implementaciones legacy retiradas
→ 0
```

---

#### 3. Fuentes y precedencia

La especificación conserva las decisiones vigentes de las siguientes fuentes:

| Fuente                                                                             | Uso vinculante                                                                                          |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                                       | continuidad, trazabilidad, separación entre especificación e implementación y tratamiento de requisitos |
| `docs/plan-canonico/modular/delivery-contract.json`                                | forma del artefacto documental                                                                          |
| `docs/plan-canonico/modular/active-sequence.json`                                  | continuidad `SHELL-UI-002 → SHELL-UI-003 → SHELL-UI-004`                                                |
| `07_COMPONENTES_WEB_COMPARTIDOS.md`                                                | propietario del mini-bloque y secuencia `SHELL-UI-*`                                                    |
| `SHELL-UI-001`                                                                     | identidad, fronteras y estado no materializado de `@vento/ui-web`                                       |
| `SHELL-UI-002`                                                                     | patrón precedente para contratos de componentes compartidos y separación entre presentación y autoridad |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`                                       | clasificación de la familia de primitivas como duplicación mixta que exige reconciliación               |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`                                        | distribución, SemVer, compatibilidad, adopción y rollback de packages compartidos                       |
| `03_CONTRATOS_COMPARTIDOS.md`                                                      | frontera entre contratos, contexto, datos e implementación visual                                       |
| `src/components/ui/Button.tsx` de SHELL                                            | candidato local con variantes, tamaños, `loading`, `fullWidth` y semántica HTML actual                  |
| `templates/app-shell-standard/src/components/vento/standard/ui.tsx`                | fuente histórica con variante `brand`, tamaños y estilo de la familia estándar                          |
| copias actuales `src/components/vento/standard/ui.tsx` localizadas en consumidores | evidencia de duplicación runtime de la familia histórica                                                |
| Registro Canónico de Requisitos de Prueba — dominio SHELL                          | reconciliación, package, release, compatibilidad y retiro ya cubiertos                                  |
| Registro Canónico de Requisitos de Prueba — dominio UX                             | accesibilidad, controles bloqueados, acciones sensibles y semántica de interacción ya cubiertas         |

Precedencia:

```text
contratos canónicos aprobados
→ frontera de @vento/ui-web
→ contrato de Button
→ implementación física futura
→ adopción por consumidor
→ retiro de duplicados con evidencia
```

La existencia previa de una implementación no la convierte por sí sola en contrato compartido.

---

#### 4. Línea base verificable

La reconciliación parte de las siguientes instancias verificadas:

| Instancia                                                                       | Estado                                                                                             | Familia                  |
| ------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------ |
| `vento-shell/src/components/ui/Button.tsx`                                      | implementación local actual                                                                        | candidato SHELL          |
| `vento-shell/templates/app-shell-standard/src/components/vento/standard/ui.tsx` | fuente histórica del template                                                                      | estándar histórico       |
| `vento-nexo/src/components/vento/standard/ui.tsx`                               | copia runtime localizada                                                                           | estándar histórico       |
| `vento-fogo/src/components/vento/standard/ui.tsx`                               | copia runtime localizada                                                                           | estándar histórico       |
| `vento-origo/src/components/vento/standard/ui.tsx`                              | copia runtime localizada                                                                           | estándar histórico       |
| `vento-viso/src/components/vento/standard/ui.tsx`                               | copia runtime localizada                                                                           | estándar histórico       |
| `vento-pulso/src/components/vento/standard/ui.tsx`                              | copia runtime localizada                                                                           | estándar histórico       |
| `vento-numera`                                                                  | no se localizó una implementación `Button` equivalente mediante la búsqueda actual del repositorio | sin instancia confirmada |

Conteo verificable utilizado por esta tarea:

```text
implementaciones runtime/locales localizadas = 6
fuentes históricas de template localizadas    = 1
Button compartidos materializados             = 0
consumidores migrados                         = 0
```

La ausencia de una instancia localizada en NUMERA no se interpreta como prueba global de inexistencia futura o histórica; únicamente impide inventar una migración concreta para ese repositorio en esta tarea.

---

#### 5. Divergencias actuales que deben reconciliarse

Las dos familias principales no son equivalentes:

| Dimensión              | SHELL local                               | familia `vento/standard`             | Decisión canónica                                |
| ---------------------- | ----------------------------------------- | ------------------------------------ | ------------------------------------------------ |
| elemento               | `button`                                  | `button`                             | conservar `button` nativo                        |
| variante por defecto   | `primary`                                 | `primary`                            | `primary`                                        |
| variantes comunes      | `primary`, `secondary`, `ghost`           | `primary`, `secondary`, `ghost`      | conservar                                        |
| variantes solo SHELL   | `outline`, `danger`                       | —                                    | incorporar al contrato común                     |
| variante solo estándar | —                                         | `brand`                              | no incorporar como variante canónica             |
| tamaños                | `sm`, `md`, `lg`                          | `sm`, `md`, `lg`                     | conservar los tres                               |
| tamaño por defecto     | `md`                                      | `md`                                 | `md`                                             |
| `fullWidth`            | sí                                        | no                                   | no incorporar como prop pública específica       |
| `loading`              | sí                                        | no                                   | incorporar, corrigiendo semántica                |
| `aria-busy`            | sí durante carga                          | no aplica                            | conservar obligación durante carga               |
| etiqueta durante carga | sustituida por `Cargando...`              | no aplica                            | no sustituir automáticamente el nombre accesible |
| `type` por defecto     | `button`                                  | depende del HTML si no se declara    | fijar `button` por defecto                       |
| `className`            | heredado por atributos, sin uso principal | composición explícita                | admitir personalización acotada                  |
| `style`                | heredado y mezclado al final              | heredado por props                   | conservar atributos nativos compatibles          |
| boundary de cliente    | archivo marcado `use client`              | módulo completo marcado `use client` | no imponerlo por contrato al componente puro     |

Esta reconciliación es sustantiva: ningún lado se adopta íntegramente.

---

#### 6. Identidad pública

La superficie conceptual introducida por `SHELL-UI-003` queda compuesta por:

```text
Button
ButtonProps
ButtonVariant
ButtonSize
```

Estos nombres describen el contrato lógico de la superficie. La tarea no inventa una ruta física de archivo, subpath npm, barrel, mapa de `exports` ni layout interno del package.

La materialización física deberá preservar esta semántica sin convertir la estructura interna futura en parte pública accidental.

---

#### 7. Contrato conceptual mínimo

La API conceptual mínima queda:

```text
Button
  variant?   = primary | secondary | outline | ghost | danger
  size?      = sm | md | lg
  loading?   = boolean
  disabled?  = boolean nativo
  type?      = button | submit | reset
  children   = contenido de la acción
  className? = extensión visual acotada
  ...props   = atributos compatibles de HTMLButtonElement
```

Valores por defecto:

```text
variant = primary
size    = md
type    = button
loading = false
```

No se incorporan en esta tarea propiedades públicas específicas para:

- `fullWidth`;
- `brand`;
- `success`;
- `asChild`;
- `href`;
- `to`;
- navegación de router;
- confirmación sensible;
- autorización;
- permisos;
- reintento remoto;
- recibos empresariales;
- iconos izquierda/derecha;
- tooltips;
- analítica de dominio.

---

#### 8. Variantes canónicas

Se congelan cinco variantes:

| Variante    | Intención visual                                                            | Límite                                                                    |
| ----------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `primary`   | acción ordinaria de mayor énfasis dentro de una región o decisión local     | no implica autoridad ni prioridad global del proceso                      |
| `secondary` | acción ordinaria de apoyo o alternativa de énfasis medio                    | no equivale a acción opcional desde el dominio                            |
| `outline`   | alternativa de menor énfasis con límite visual explícito                    | no introduce semántica de permiso o estado                                |
| `ghost`     | acción terciaria o de chrome con énfasis mínimo                             | debe conservar affordance, foco y accesibilidad                           |
| `danger`    | intención visual de riesgo o efecto destructivo conocido por el propietario | no sustituye confirmación, step-up, autorización, receipt ni idempotencia |

`primary` es el valor por defecto del componente, no una regla que obligue a que toda pantalla tenga un botón `primary` ni que permita más de una acción dominante sin criterio de UX.

La selección de variante corresponde al consumidor o componente compuesto propietario, no a `Button` mediante inferencia de texto, endpoint, ruta o permiso.

---

#### 9. Decisión sobre `brand`

La variante histórica `brand` no se incorpora al contrato canónico.

Razones:

1. aparece en la familia histórica `vento/standard`, no en el candidato local de SHELL;
2. expresa principalmente una elección cromática de marca, no una jerarquía de interacción estable;
3. el contrato de marca pertenece a `@vento/ui-web` y no necesita convertirse en una intención funcional adicional del control;
4. la búsqueda actual no confirmó usos concretos `variant="brand"` que obliguen a perpetuar esa API por compatibilidad inmediata;
5. conservarla como variante pública crearía dos ejes mezclados: jerarquía de acción y selección cromática.

Durante la migración, cada uso real de `brand` deberá clasificarse por intención y mapearse a la variante canónica correspondiente. No se autoriza una sustitución global ciega.

---

#### 10. Decisión sobre `outline`

`outline` sí se incorpora al contrato común porque representa una jerarquía visual distinta ya materializada en el candidato local de SHELL y compatible con la responsabilidad del componente compartido.

No se define como sinónimo de `secondary`:

```text
secondary
→ superficie de apoyo con tratamiento visual propio

outline
→ superficie esencialmente transparente con borde explícito
```

La implementación física futura deberá preservar una diferencia perceptible y accesible entre ambas sin depender de un único valor cromático.

---

#### 11. Decisión sobre `danger`

`danger` se incorpora exclusivamente como intención visual.

Regla vinculante:

```text
variant="danger"
≠ permiso para ejecutar
≠ confirmación suficiente
≠ step-up
≠ validación de recurso
≠ idempotencia
≠ receipt
≠ auditoría
```

Una acción sensible, destructiva, financiera, de custodia, publicación, acceso o excepción conserva sus controles propietarios aunque utilice `Button variant="danger"`.

`SHELL-UI-014 — Compartir confirmaciones de acciones sensibles` conserva la propiedad del patrón compuesto de confirmación. `SHELL-UI-003` no lo anticipa ni lo sustituye.

---

#### 12. Tamaños canónicos

Los tamaños comunes quedan congelados como:

```text
sm
md
lg
```

`md` es el valor por defecto.

Los tres nombres se conservan porque aparecen en ambas familias principales y representan una dimensión legítima de densidad y contexto de uso.

La tarea no fija valores físicos de altura, padding, tipografía o breakpoints. Esos valores pertenecen a la materialización visual de `@vento/ui-web` y deberán cumplir el contrato de accesibilidad, densidad, reflow y dispositivos aplicable.

El tamaño no altera:

- semántica;
- permiso;
- prioridad empresarial;
- tipo HTML;
- confirmación requerida;
- área táctil mínima exigida por la superficie aplicable.

---

#### 13. Elemento HTML y tipo

`Button` renderiza conceptualmente un elemento HTML nativo:

```html
<button></button>
```

Reglas:

1. si el consumidor no declara `type`, el componente utiliza `type="button"`;
2. `type="submit"` se utiliza únicamente cuando el consumidor necesita semántica real de envío de formulario;
3. `type="reset"` permanece disponible por compatibilidad con el elemento nativo cuando sea semánticamente válido;
4. el componente no infiere `submit` por ubicación dentro de un formulario;
5. el componente no convierte automáticamente una acción en navegación.

La decisión explícita `type="button"` por defecto evita submits accidentales por la semántica implícita del HTML.

---

#### 14. Button no es Link

Esta tarea no crea un botón polimórfico para enlaces.

Cuando la intención primaria sea navegación, la superficie propietaria deberá utilizar la semántica de enlace o navegación que corresponda. Aplicar apariencia de botón a un enlace, si se requiere, deberá resolverse sin convertir `Button` en router, owner de hrefs o mecanismo de deep link.

Por tanto `Button` no incorpora:

- `href`;
- `to`;
- `replace`;
- `prefetch`;
- route names;
- deep-link contracts;
- navegación cross-app.

La separación evita mezclar activación de una acción con navegación y conserva las fronteras de `SHELL-UI-011` y `SHELL-UI-020`.

---

#### 15. Estado `disabled`

`disabled` conserva semántica nativa de `button`.

El componente:

- refleja el booleano resuelto por el consumidor;
- impide activación mediante el mecanismo nativo cuando está deshabilitado;
- presenta el estado de forma perceptible sin depender únicamente de opacidad o color;
- conserva una representación coherente con foco y tecnologías de asistencia según la semántica nativa aplicable.

El componente no decide por qué una acción está deshabilitada.

Si un control relevante requiere explicación perceptible, la superficie propietaria debe asociar o presentar esa explicación conforme a los requisitos UX. `Button` no inventa reason codes ni copy de bloqueo.

---

#### 16. Frontera entre `disabled` y autorización

Queda prohibida la equivalencia:

```text
disabled = false
→ autorizado
```

La capacidad de activar visualmente un `Button` no constituye autorización.

La autorización efectiva permanece en las capas propietarias y debe revalidarse donde corresponda. Del mismo modo:

```text
disabled = true
```

puede representar indisponibilidad contextual o de UX, pero no modifica el estado autoritativo del recurso.

Un consumidor no puede utilizar la presencia, ausencia o estado visual del componente como único control de acceso.

---

#### 17. Estado `loading`

Se conserva `loading?: boolean` como parte del contrato canónico porque representa un estado interactivo reutilizable ya existente en el candidato SHELL.

Durante `loading = true`:

1. el control debe impedir activaciones repetidas equivalentes;
2. el control debe exponer estado ocupado mediante semántica accesible equivalente a `aria-busy="true"`;
3. la acción debe conservar una identidad perceptible;
4. el nombre accesible de la acción no debe desaparecer o convertirse automáticamente en una palabra genérica;
5. el estado visual puede incorporar un indicador de progreso indeterminado si la implementación futura lo decide;
6. el control no declara éxito, fallo, confirmación de servidor ni resultado empresarial;
7. salir del estado de carga corresponde al estado que entregue el propietario funcional.

`loading` es estado de interacción, no receipt.

---

#### 18. Corrección del literal `Cargando...`

El candidato local de SHELL sustituye actualmente `children` por el literal `Cargando...` cuando `loading` está activo.

Ese comportamiento no se incorpora al contrato compartido como regla canónica.

Motivos:

- elimina el nombre visible específico de la acción;
- homogeneiza acciones diferentes bajo un texto genérico;
- dificulta localización y contenido contextual;
- puede alterar el nombre accesible sin necesidad;
- confunde presentación de progreso con definición del copy.

La implementación futura deberá preservar la identidad de la acción y permitir un indicador de carga sin imponer un texto global hardcodeado.

Esta tarea no define una propiedad `loadingLabel`, porque no existe evidencia canónica suficiente para abrir esa API adicional.

---

#### 19. Decisión sobre `fullWidth`

`fullWidth` no se incorpora como prop pública específica de `Button`.

La evidencia actual muestra `fullWidth` en el candidato local de SHELL, pero no en la familia estándar y no se confirmó un uso consumidor que obligue a mantenerlo como API específica.

La ocupación de ancho se clasifica como responsabilidad de layout o composición:

```text
ancho del control
→ contenedor / layout / className / estilo permitido

semántica del control
→ Button
```

No se elimina código legacy en esta tarea. La migración posterior deberá sustituir cualquier uso real de `fullWidth` por la composición de layout aprobada, verificando paridad antes de retirar la implementación anterior.

---

#### 20. Contenido e iconos

`children` representa el contenido del control y puede incluir texto e iconografía compuesta por el consumidor.

No se crean props específicas `iconLeft`, `iconRight`, `leadingIcon` o `trailingIcon` en esta tarea.

Reglas:

- un icono decorativo no sustituye el nombre de la acción;
- un botón de solo icono requiere nombre accesible explícito;
- el orden visual de icono y texto no puede alterar el orden semántico de forma engañosa;
- el contenido no debe introducir controles interactivos anidados;
- texto largo debe permitir reflow razonable sin truncar información crítica por contrato.

La futura política transversal de iconos no se define desde `Button`.

---

#### 21. Atributos nativos y eventos

`Button` admite atributos compatibles de `HTMLButtonElement`, incluyendo los de accesibilidad, formularios, datos y eventos que sean semánticamente válidos.

La transferencia de eventos no concede al componente responsabilidad sobre la operación ejecutada.

Ejemplos conceptuales:

```text
onClick
onFocus
onBlur
aria-*
data-*
name
value
form
```

El consumidor sigue siendo propietario de:

- efectos;
- comandos;
- navegación externa;
- mutaciones;
- validación de negocio;
- idempotencia;
- reintento;
- telemetría de dominio.

---

#### 22. `className`, `style` y personalización

Los atributos nativos de presentación pueden transferirse al elemento cuando el contrato físico futuro los admita.

La personalización es aditiva y no autoriza romper invariantes del componente.

Un consumidor no debe utilizar `className` o `style` para:

- eliminar un indicador de foco necesario;
- hacer imperceptible `disabled`;
- ocultar el nombre de una acción sin alternativa accesible;
- fabricar una variante de autorización;
- convertir una acción ordinaria en una confirmación sensible;
- invalidar contraste o tamaño táctil aplicable;
- ocultar controles para simular seguridad.

Las necesidades repetidas que no puedan expresarse sin romper el contrato deberán evaluarse como evolución versionada del package, no como forks visuales silenciosos.

---

#### 23. Accesibilidad mínima

La implementación futura de `Button` deberá conservar como mínimo:

1. semántica nativa de botón;
2. operación por teclado conforme al elemento nativo;
3. foco visible y distinguible;
4. nombre accesible;
5. estado `disabled` perceptible;
6. estado `loading` perceptible y ocupado sin perder identidad;
7. significado no dependiente únicamente del color;
8. contraste aplicable;
9. reflow sin pérdida del control;
10. objetivos táctiles compatibles con la superficie y dispositivo aplicables;
11. ausencia de gestos ocultos como único mecanismo;
12. atributos ARIA únicamente cuando complementen, y no contradigan, la semántica nativa.

No se reemplaza la semántica nativa por `div`, `span` o elementos con `role="button"` cuando un `button` real es aplicable.

---

#### 24. Teclado, puntero y tacto

La activación ordinaria debe conservar los mecanismos nativos del botón.

La tarea prohíbe que una función material dependa exclusivamente de:

- hover;
- doble toque;
- pulsación larga;
- swipe;
- arrastre;
- gesto oculto.

La implementación visual podrá reaccionar a hover o active como retroalimentación, pero esos estados no pueden contener la única explicación de la acción ni ser requisito para ejecutarla.

En tablet y kiosco, el tamaño seleccionado no exime a la superficie propietaria de cumplir el objetivo táctil aplicable.

---

#### 25. Foco

El componente compartido debe disponer de un tratamiento de foco visible consistente con el contrato visual de `@vento/ui-web`.

Ni la variante ni `className` deben eliminarlo como comportamiento ordinario.

`Button` no mueve foco automáticamente después de activarse. El movimiento de foco tras modales, errores, confirmaciones, cambios de pantalla o recuperación pertenece al patrón compuesto propietario.

El componente tampoco roba foco al entrar en `loading`.

---

#### 26. Frontera de cliente y servidor

La lógica conceptual de `Button` no requiere por sí misma:

- estado React interno;
- efectos;
- acceso a `window`;
- acceso a `document`;
- storage;
- timers;
- red;
- router;
- sesión.

Por ello el contrato no exige que toda la superficie del package sea `client-only`.

Una aplicación cliente puede entregar handlers interactivos cuando su composición lo requiera. Esa necesidad no autoriza marcar todo `@vento/ui-web` ni todos sus componentes como cliente de forma indiscriminada.

Los marcadores `"use client"` observados en las implementaciones actuales se consideran una propiedad de esos archivos concretos, no una obligación pública de `Button`.

---

#### 27. Frontera de autoridad

`Button` es presentación e interacción, no control de seguridad.

Queda fuera de su responsabilidad:

```text
resolver identidad
resolver rol
resolver sede o área
resolver turno o check-in
resolver permisos
consultar Supabase
invocar RPC por contrato interno
interpretar RLS
resolver navegación autorizada
validar recurso
confirmar custodia
confirmar operación empresarial
generar receipt
auditar por sí mismo
```

El componente recibe estados y handlers ya determinados por capas propietarias.

Ningún consumidor podrá argumentar que una acción es segura únicamente porque el botón esté oculto, deshabilitado, sea `danger` o se renderice bajo cierto contexto visual.

---

#### 28. Dependencias permitidas y prohibidas

La implementación física futura podrá depender de utilidades internas puramente visuales de `@vento/ui-web` cuando existan y sean compatibles con su arquitectura.

No se autoriza dependencia directa desde `Button` hacia:

- `@vento/supabase`;
- clientes Supabase;
- RPCs;
- repositorios de aplicación;
- hooks de autenticación;
- resolvers de permisos;
- cookies de sesión;
- router de una aplicación concreta;
- variables secretas;
- servicios de red;
- lógica de negocio.

Si una superficie necesita resolver cualquiera de esas capacidades, lo hace fuera de `Button` y entrega al componente únicamente el estado de presentación e interacción resultante.

---

#### 29. Relación con formularios

`Button` preserva la semántica HTML de formularios sin apropiarse de la validación de dominio.

Reglas:

1. `type="submit"` puede participar en un formulario real;
2. el componente no ejecuta `preventDefault` universalmente;
3. el componente no intercepta submit para convertirlo en RPC;
4. el componente no serializa formularios;
5. `loading` no demuestra que el formulario haya sido aceptado;
6. `disabled` no sustituye validación del lado servidor;
7. errores de formulario pertenecen al formulario o patrón de error propietario.

El consumidor conserva control sobre `form`, `name`, `value` y demás atributos nativos compatibles cuando sean necesarios.

---

#### 30. Relación con acciones sensibles

Las acciones sensibles requieren un patrón de mayor nivel cuando el riesgo lo exija.

`Button` puede ser la superficie final de activación, pero no define:

- copy de confirmación;
- recurso afectado;
- efecto esperado;
- step-up;
- doble validación;
- motivo obligatorio;
- receipt;
- protección idempotente;
- separación física respecto a CTA ordinarios.

La tarea propietaria del patrón compartido es:

```text
SHELL-UI-014 — Compartir confirmaciones de acciones sensibles
```

Esta asignación evita convertir `danger` en un atajo de seguridad.

---

#### 31. Relación con paneles y recuperación

`Button` podrá ser consumido posteriormente por componentes y patrones compuestos sin apropiarse de sus reglas.

Handoffs relevantes:

| Tarea          | Responsabilidad conservada                                                |
| -------------- | ------------------------------------------------------------------------- |
| `SHELL-UI-013` | panel de acción principal y jerarquía del CTA dentro del patrón compuesto |
| `SHELL-UI-014` | confirmaciones de acciones sensibles                                      |
| `SHELL-UI-016` | estados de error recuperable y acciones de recuperación                   |
| `SHELL-UI-017` | adaptación de patrones para tablet                                        |
| `SHELL-UI-018` | adaptación de patrones para kiosco                                        |
| `SHELL-UI-019` | proceso interrumpido y continuidad de acciones                            |
| `SHELL-UI-020` | traspaso entre aplicaciones                                               |

`SHELL-UI-003` define el control base; no adelanta contratos de esos patrones.

---

#### 32. Reconciliación del candidato local de SHELL

La implementación `src/components/ui/Button.tsx` de SHELL se clasifica como `CANDIDATO_RECONCILIADO`, no como implementación canónica adoptada íntegramente.

Decisión por rasgo:

| Rasgo actual                | Decisión                                   |
| --------------------------- | ------------------------------------------ |
| `button` nativo             | conservar                                  |
| `primary`                   | conservar                                  |
| `secondary`                 | conservar                                  |
| `outline`                   | conservar                                  |
| `ghost`                     | conservar                                  |
| `danger`                    | conservar                                  |
| `sm                         | md                                         | lg` | conservar |
| default `md`                | conservar                                  |
| default `type="button"`     | conservar                                  |
| `loading`                   | conservar con corrección semántica         |
| `aria-busy` en loading      | conservar obligación                       |
| reemplazo por `Cargando...` | no incorporar                              |
| `fullWidth`                 | no incorporar como prop pública específica |
| estilos inline concretos    | no convertir en API                        |
| `"use client"` de archivo   | no convertir en obligación del contrato    |

La copia local permanece intacta hasta su migración controlada. Esta tarea no la modifica ni la elimina.

---

#### 33. Reconciliación de la familia `vento/standard`

La implementación de `templates/app-shell-standard/src/components/vento/standard/ui.tsx` y las copias runtime localizadas se clasifican como `LEGACY_ESTANDAR_A_MIGRAR`.

Decisión por rasgo:

| Rasgo actual                     | Decisión                                                                  |
| -------------------------------- | ------------------------------------------------------------------------- |
| `button` nativo                  | conservar                                                                 |
| `primary`                        | conservar                                                                 |
| `secondary`                      | conservar                                                                 |
| `ghost`                          | conservar                                                                 |
| `brand`                          | no incorporar al contrato; requiere clasificación por intención al migrar |
| `sm                              | md                                                                        | lg` | conservar |
| default `md`                     | conservar                                                                 |
| clases/tokens concretos          | fuente de compatibilidad visual, no API perpetua                          |
| `"use client"` del módulo        | no heredar como obligación de `Button`                                    |
| ausencia de `loading`            | queda superada por el contrato común                                      |
| ausencia de `danger` y `outline` | queda superada por el contrato común                                      |

La tarea no modifica el template ni las copias runtime.

---

#### 34. Estrategia de migración

La migración física no ocurre en `SHELL-UI-003`.

Cuando el bloque de migración correspondiente la habilite, cada consumidor deberá:

1. inventariar usos reales de Button y botones equivalentes;
2. identificar variante, tamaño, tipo HTML, estado de carga y layout;
3. clasificar usos `brand` por intención antes de mapearlos;
4. identificar cualquier uso real de `fullWidth` y resolverlo mediante layout compatible;
5. verificar comportamiento de submit y formularios;
6. verificar estados disabled/loading;
7. verificar accesibilidad y foco;
8. mantener rollback al componente anterior;
9. retirar la copia legacy únicamente después de demostrar ausencia de consumidores residuales.

No se autoriza un reemplazo masivo basado únicamente en coincidencia de nombre `Button`.

---

#### 35. Compatibilidad y versionado

La materialización futura del contrato deberá respetar el gobierno SemVer del package.

Cambios que pueden afectar compatibilidad incluyen, entre otros:

- retirar o renombrar una variante;
- retirar o renombrar un tamaño;
- cambiar el tipo HTML por defecto;
- cambiar semántica de `loading`;
- cambiar forwarding de atributos o eventos;
- modificar requisitos de `children`;
- modificar comportamiento de `disabled`;
- cambiar condiciones de renderizado server/client;
- cambiar el contrato accesible observable.

No se modifica silenciosamente la API para acomodar un consumidor particular.

La compatibilidad visual no se mide únicamente por coincidencia de píxeles: también incluye jerarquía, interacción, accesibilidad, formularios y estados.

---

#### 36. Contrato de prueba futuro

La implementación física y su adopción deberán demostrar, como mínimo:

1. renderizado con defaults `primary`, `md` y `type="button"`;
2. renderizado de `primary`;
3. renderizado de `secondary`;
4. renderizado de `outline`;
5. renderizado de `ghost`;
6. renderizado de `danger`;
7. tamaños `sm`, `md` y `lg`;
8. `type="submit"` explícito dentro de formulario;
9. `type="reset"` cuando sea aplicable;
10. forwarding de atributos nativos compatibles;
11. forwarding de atributos `aria-*` y `data-*`;
12. forwarding de eventos compatibles;
13. estado `disabled` sin activación;
14. estado `loading` sin doble activación equivalente;
15. semántica busy durante loading;
16. conservación de identidad/nombre accesible durante loading;
17. teclado mediante semántica nativa;
18. foco visible;
19. botón de solo icono con nombre accesible aportado por consumidor;
20. reflow con contenido razonablemente largo;
21. contraste y señales no dependientes solo de color;
22. composición `className` sin romper invariantes;
23. renderizado server-safe de la superficie pura;
24. ausencia de dependencia directa de Supabase;
25. ausencia de autorización dentro del componente;
26. `danger` sin asumir confirmación o permiso;
27. paridad por consumidor antes de retirar su copia legacy;
28. rollback verificable durante migración.

Esta sección especifica evidencia futura; no declara ninguna de estas pruebas como ejecutada por `SHELL-UI-003`.

---

#### 37. Requisitos de prueba derivados

`SHELL-UI-003` crea **0** requisitos `TREQ-*` y modifica **0** requisitos existentes.

La cobertura existente ya protege las obligaciones materiales de esta tarea:

- `TREQ-SHELL-029` impide tratar el template como runtime compartido por su sola existencia;
- `TREQ-SHELL-032` exige reconciliar las primitivas locales y el kit histórico antes de adopción o retiro;
- `TREQ-SHELL-035` protege texto y significado consistente de superficies compartidas;
- `TREQ-SHELL-036..039` gobiernan release, identidad, compatibilidad, deprecación y retiro del package;
- los requisitos UX vigentes ya cubren controles deshabilitados perceptibles, foco y navegación accesible, mecanismos de interacción, acciones sensibles y protección frente a semántica puramente visual.

`SHELL-UI-003` especializa cómo esas obligaciones se aplican a `Button` sin introducir una obligación transversal nueva.

Por ello no se modifica ningún fragmento modular 04A.

---

#### 38. Estado de materialización física

Al cierre documental de `SHELL-UI-003`:

```text
IDENTIDAD Button                           = ESPECIFICADA
ButtonProps                                = ESPECIFICADO CONCEPTUALMENTE
ButtonVariant                              = 5 VALORES ESPECIFICADOS
ButtonSize                                 = 3 VALORES ESPECIFICADOS
SEMÁNTICA HTML                             = ESPECIFICADA
DISABLED                                   = ESPECIFICADO
LOADING                                    = ESPECIFICADO
ACCESIBILIDAD                              = ESPECIFICADA DOCUMENTALMENTE
FRONTERA DE AUTORIDAD                      = ESPECIFICADA
RECONCILIACIÓN SHELL                       = CERRADA DOCUMENTALMENTE
RECONCILIACIÓN VENTO/STANDARD              = CERRADA DOCUMENTALMENTE
PACKAGE FÍSICO                             = NO MATERIALIZADO
COMPONENTE FÍSICO COMPARTIDO               = NO MATERIALIZADO
CONSUMIDORES MIGRADOS                      = 0
IMPLEMENTACIONES LEGACY RETIRADAS          = 0
CAMBIOS TREQ                               = 0
```

La definición documental no implica publicación, instalación ni ejecución del package.

---

#### 39. Decisiones vinculantes

1. El componente compartido se denomina `Button`.
2. `Button` pertenece a `@vento/ui-web`.
3. La tarea es documental y no materializa código.
4. Los símbolos conceptuales son `Button`, `ButtonProps`, `ButtonVariant` y `ButtonSize`.
5. No se inventa un subpath físico ni mapa de exports.
6. Las variantes canónicas son `primary`, `secondary`, `outline`, `ghost` y `danger`.
7. `primary` es la variante por defecto.
8. `brand` no forma parte del contrato canónico.
9. No existe una variante `success` de Button.
10. Los tamaños canónicos son `sm`, `md` y `lg`.
11. `md` es el tamaño por defecto.
12. El elemento base es `button` nativo.
13. El tipo por defecto es `button`.
14. `submit` y `reset` requieren selección explícita del consumidor cuando correspondan.
15. Button no es un Link ni incorpora router.
16. `disabled` utiliza semántica nativa.
17. `disabled` no equivale a autorización.
18. `loading` forma parte del contrato compartido.
19. `loading` impide activaciones repetidas equivalentes.
20. `loading` expone estado busy accesible.
21. `loading` no sustituye automáticamente el nombre de la acción por `Cargando...`.
22. No se crea `loadingLabel` en esta tarea.
23. `fullWidth` no forma parte de la API pública específica.
24. El ancho pertenece al layout o composición compatible.
25. No se crean props específicas de iconos.
26. Un botón de solo icono requiere nombre accesible.
27. Los atributos nativos compatibles se conservan.
28. Los eventos nativos compatibles se transfieren sin mover lógica empresarial al componente.
29. `className` y `style` no autorizan romper invariantes de accesibilidad o seguridad.
30. El componente conserva foco visible.
31. La función material no puede depender de un gesto oculto.
32. El contrato no exige `use client` por sí mismo.
33. `Button` no depende directamente de Supabase.
34. `Button` no resuelve permisos, rol, sede, área, turno ni contexto.
35. `Button` no decide navegación autorizada.
36. `Button` no genera receipts ni auditoría empresarial.
37. `danger` es presentación, no confirmación ni step-up.
38. `SHELL-UI-014` conserva la propiedad del patrón de confirmación sensible.
39. La implementación local de SHELL queda reconciliada, no adoptada íntegramente.
40. La familia `vento/standard` queda reconciliada como legacy a migrar.
41. Las copias actuales no se eliminan en esta tarea.
42. NUMERA no recibe una migración inventada sin una instancia actual confirmada.
43. La migración se realiza por consumidor y con rollback.
44. El retiro legacy exige evidencia de ausencia de consumidores residuales.
45. Se crean 0 requisitos `TREQ-*` y se modifican 0.
46. `SHELL-UI-004` permanece reservada y no se desarrolla aquí.

---

#### 40. Criterios de aceptación documental

`SHELL-UI-003` queda documentalmente cerrada únicamente si se cumplen simultáneamente:

- [x] la continuidad real apunta de `SHELL-UI-002` a `SHELL-UI-003`;
- [x] se conserva `SHELL-UI-004` como siguiente tarea;
- [x] el componente tiene identidad única;
- [x] se reconcilian las dos familias principales sin adoptar una copia ciegamente;
- [x] se materializa una decisión para cada divergencia observable relevante;
- [x] se fijan cinco variantes canónicas;
- [x] se fija el tratamiento explícito de `brand`;
- [x] se fijan tres tamaños canónicos;
- [x] se fija `type="button"` por defecto;
- [x] se preserva semántica nativa;
- [x] se define `disabled` sin confundirlo con autorización;
- [x] se define `loading` sin confundirlo con confirmación empresarial;
- [x] se corrige documentalmente el problema del literal genérico de carga;
- [x] se decide no propagar `fullWidth` como prop específica;
- [x] se separa Button de Link y navegación;
- [x] se separa `danger` de confirmación sensible;
- [x] se preservan fronteras con contratos, contexto, datos y negocio;
- [x] se especifica accesibilidad mínima;
- [x] se especifica contrato futuro de prueba;
- [x] se asignan migración y retiro a sus tareas propietarias;
- [x] no se modifican consumidores ni implementaciones actuales;
- [x] no se ejecutan cambios físicos;
- [x] se declaran 0 cambios TREQ con justificación concreta;
- [x] no queda un pendiente material sin propietario documental.

Resultado:

```text
BUTTON COMPARTIDO                   = ESPECIFICADO
VARIANTES                           = 5 CERRADAS
TAMAÑOS                             = 3 CERRADOS
SEMÁNTICA HTML                      = CERRADA
LOADING                             = CERRADO DOCUMENTALMENTE
DISABLED                            = CERRADO DOCUMENTALMENTE
RECONCILIACIÓN DE DUPLICADOS        = CERRADA DOCUMENTALMENTE
IMPLEMENTACIÓN FÍSICA               = NO MATERIALIZADA
MIGRACIÓN                           = NO EJECUTADA
CAMBIOS TREQ                        = 0
SIGUIENTE TAREA                     = SHELL-UI-004
```

---

#### 41. Límites

Esta tarea no autoriza:

- crear o modificar el package físico `@vento/ui-web`;
- crear archivos TypeScript del package;
- cambiar `src/components/ui/Button.tsx`;
- cambiar copias `src/components/vento/standard/ui.tsx`;
- cambiar el template;
- borrar implementaciones legacy;
- publicar una versión;
- configurar registry;
- crear workflows;
- migrar consumidores;
- modificar rutas;
- modificar autenticación o autorización;
- introducir Supabase en UI;
- cambiar contratos empresariales;
- crear confirmaciones sensibles;
- modificar formularios de aplicación;
- ejecutar cambios de datos;
- crear migraciones SQL;
- modificar requisitos de prueba;
- iniciar `SHELL-UI-004`.

---

#### 42. Continuidad

**ÚLTIMA TAREA APROBADA:** `SHELL-UI-002 — Compartir Alert`

**TAREA ACTUAL APROBADA:** `SHELL-UI-003 — Compartir Button`

**SIGUIENTE TAREA RESERVADA:** `SHELL-UI-004 — Compartir Card`

No se inicia `SHELL-UI-004` sin aprobación de `SHELL-UI-003`.


### ✅ SHELL-UI-004 — Compartir Card

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-003 — Compartir Button
**Tarea siguiente:** SHELL-UI-005 — Compartir EmptyState
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_COMPONENTES_WEB_COMPARTIDOS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-UI-004` define y reconcilia el contrato canónico del componente visual compartido `Card` que deberá pertenecer a `@vento/ui-web`.

La tarea parte de dos familias actuales con la misma intención general de contenedor visual, pero con contratos diferentes:

- el candidato local de SHELL expone variantes `surface | soft | raised` y padding `sm | md | lg`;
- la familia histórica `vento/standard` expone una única apariencia fija con superficie, borde, sombra, padding y blur.

La tarea no adopta ninguna copia por precedencia accidental. Cierra una superficie compartida neutral y composable:

```text
CONTENIDO DEL CONSUMIDOR
+
JERARQUÍA VISUAL DE SUPERFICIE
+
DENSIDAD EXPLÍCITA
→
Card DE @vento/ui-web
→
CONTENEDOR WEB CONSISTENTE Y REUTILIZABLE
```

`Card` organiza y presenta contenido. No determina estado empresarial, no concede autoridad, no ejecuta operaciones, no navega por sí misma y no convierte cualquier componente cuyo nombre termine en `Card` en una primitiva compartida.

---

#### 2. Resultado canónico

Se aprueba `Card` como componente visual compartido de `@vento/ui-web` con las siguientes propiedades vinculantes:

1. identidad pública funcional única: `Card`;
2. variantes canónicas `surface`, `soft` y `raised`;
3. variante por defecto `surface`;
4. densidades de padding canónicas `sm`, `md` y `lg`;
5. padding por defecto `md`;
6. elemento raíz conceptual `div` no interactivo;
7. soporte de atributos compatibles de `HTMLDivElement`;
8. contenido compuesto aportado por el consumidor mediante `children`;
9. ausencia de subcomponentes obligatorios `CardHeader`, `CardTitle`, `CardContent` o `CardFooter` en este corte;
10. ausencia de estados visuales de negocio como `success`, `warning`, `danger`, `selected` o `disabled` dentro del contrato base;
11. ausencia de navegación, `href`, router o activación de tarjeta completa dentro del contrato base;
12. ausencia de estado interno obligatorio;
13. ausencia de dependencia directa de Supabase;
14. ausencia de dependencia de autorización, sesión o contexto operativo;
15. compatibilidad conceptual con renderizado de servidor;
16. `backdrop-blur`, valores físicos de padding, radios, sombras y nombres de tokens actuales tratados como detalles de implementación y compatibilidad, no como API pública;
17. reconciliación explícita del candidato local de SHELL y la familia histórica `vento/standard`;
18. migración posterior por consumidor, con paridad, accesibilidad y rollback;
19. cero cambios físicos y cero consumidores migrados por esta tarea.

Estado resultante:

```text
Card compartida
→ DEFINIDA

API conceptual
→ DEFINIDA

implementación física en @vento/ui-web
→ NO MATERIALIZADA

consumidores migrados
→ 0

implementaciones legacy retiradas
→ 0
```

---

#### 3. Fuentes y precedencia

La especificación conserva las decisiones vigentes de las siguientes fuentes:

| Fuente                                                                 | Uso vinculante                                                                                             |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                           | continuidad, trazabilidad, separación entre especificación e implementación y tratamiento de requisitos    |
| `docs/plan-canonico/modular/delivery-contract.json`                    | forma del artefacto documental                                                                             |
| `docs/plan-canonico/modular/active-sequence.json`                      | continuidad `SHELL-UI-003 → SHELL-UI-004 → SHELL-UI-005`                                                   |
| `07_COMPONENTES_WEB_COMPARTIDOS.md`                                    | propietario del mini-bloque y secuencia `SHELL-UI-*`                                                       |
| `SHELL-UI-001`                                                         | identidad, fronteras y estado no materializado de `@vento/ui-web`                                          |
| `SHELL-UI-002`                                                         | separación entre presentación, estados de dominio y anuncios visuales                                      |
| `SHELL-UI-003`                                                         | patrón precedente de reconciliación de una primitiva compartida y separación entre interacción y autoridad |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`                           | clasificación histórica de `src/components/vento/standard/ui.tsx` como duplicación mixta                   |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`                            | distribución npm privada, SemVer, compatibilidad, adopción y rollback                                      |
| `03_CONTRATOS_COMPARTIDOS.md`                                          | frontera entre contratos, contexto, datos e implementación visual                                          |
| `src/components/ui/Card.tsx` de SHELL                                  | candidato local con variantes, padding y atributos HTML actuales                                           |
| `src/components/ui/index.ts` de SHELL                                  | evidencia de export local actual de `Card` dentro del barrel local                                         |
| `templates/app-shell-standard/src/components/vento/standard/ui.tsx`    | fuente histórica con una Card fija de la familia estándar                                                  |
| copias actuales `src/components/vento/standard/ui.tsx` de consumidores | evidencia de duplicación runtime de la familia histórica                                                   |
| Registro Canónico de Requisitos de Prueba — dominios SHELL y UX        | reconciliación, compatibilidad, rollback, densidad y gobierno de superficies ya cubiertos                  |
| `07_01_MIGRACION_COORDINADA_DE_CONSUMIDORES_WEB.md`                    | inventario, lotes, adopción, accesibilidad, paridad y retiro legacy posteriores                            |
| `T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md`      | pruebas, build, release, changelog, compatibilidad y PR de consumidores posteriores                        |

Precedencia:

```text
contratos canónicos aprobados
→ frontera de @vento/ui-web
→ contrato de Card
→ implementación física futura
→ adopción por consumidor
→ paridad y accesibilidad
→ retiro de duplicados con evidencia
```

La existencia de una implementación local, una clase CSS, un nombre `Card` de dominio o una copia de template no constituye por sí sola una API compartida.

---

#### 4. Línea base verificable

El corte técnico actual presenta las siguientes instancias relevantes:

| Instancia                                                                       | Estado                        | Familia            |
| ------------------------------------------------------------------------------- | ----------------------------- | ------------------ |
| `vento-shell/src/components/ui/Card.tsx`                                        | implementación local actual   | candidato SHELL    |
| `vento-shell/templates/app-shell-standard/src/components/vento/standard/ui.tsx` | fuente histórica del template | estándar histórico |
| `vento-nexo/src/components/vento/standard/ui.tsx`                               | copia runtime localizada      | estándar histórico |
| `vento-fogo/src/components/vento/standard/ui.tsx`                               | copia runtime localizada      | estándar histórico |
| `vento-origo/src/components/vento/standard/ui.tsx`                              | copia runtime localizada      | estándar histórico |
| `vento-viso/src/components/vento/standard/ui.tsx`                               | copia runtime localizada      | estándar histórico |
| `vento-pulso/src/components/vento/standard/ui.tsx`                              | copia runtime localizada      | estándar histórico |
| `vento-numera/src/components/vento/standard/ui.tsx`                             | copia runtime localizada      | estándar histórico |

Conteo utilizado por esta tarea:

```text
implementaciones runtime/locales Card localizadas = 7
fuentes históricas de template localizadas         = 1
Card compartidas materializadas                    = 0
consumidores migrados                              = 0
```

Las siete implementaciones runtime/locales corresponden a:

```text
1 candidato local de SHELL
+
6 copias runtime de la familia vento/standard
=
7
```

La fuente histórica del template se contabiliza por separado porque no es una superficie runtime de SHELL.

La existencia de componentes de dominio como `*ProductCard`, `*DetailCard`, `*HeroCard` o equivalentes no los incorpora a esta matriz: compartir una primitiva de contenedor no convierte componentes empresariales especializados en duplicados de `Card`.

---

#### 5. Divergencias actuales que deben reconciliarse

Las dos familias principales no son equivalentes:

| Dimensión            | SHELL local                    | familia `vento/standard`             | Decisión canónica                                                                     |
| -------------------- | ------------------------------ | ------------------------------------ | ------------------------------------------------------------------------------------- |
| elemento raíz        | `div`                          | `div`                                | conservar `div` no interactivo                                                        |
| variante por defecto | `surface`                      | apariencia única fija                | `surface`                                                                             |
| variantes            | `surface`, `soft`, `raised`    | ninguna prop de variante             | conservar las tres del contrato común                                                 |
| padding              | `sm`, `md`, `lg`               | padding fijo                         | conservar los tres tamaños; no convertir el valor fijo histórico en una cuarta opción |
| padding por defecto  | `md`                           | fijo                                 | `md`                                                                                  |
| borde                | presente en las tres variantes | presente                             | conservar intención de separación visual sin congelar la clase actual                 |
| sombra               | solo `raised`                  | presente siempre                     | reservar elevación a `raised`                                                         |
| blur de fondo        | no                             | `backdrop-blur-xl`                   | no incorporar como requisito contractual                                              |
| radio                | token local concreto           | token histórico concreto             | no congelar nombre físico de token en esta tarea                                      |
| `className`          | heredado por atributos         | composición explícita                | admitir extensión acotada                                                             |
| `style`              | heredado y aplicado al final   | heredado por props                   | conservar atributos nativos compatibles sin convertir overrides en variantes públicas |
| estado interno       | ninguno                        | ninguno                              | ninguno                                                                               |
| boundary de cliente  | archivo marcado `use client`   | módulo completo marcado `use client` | no imponerlo por contrato a `Card`                                                    |

La reconciliación adopta la semántica común y descarta diferencias accidentales de implementación.

---

#### 6. Identidad pública

La superficie conceptual introducida por `SHELL-UI-004` queda compuesta por:

```text
Card
CardProps
CardVariant
CardPadding
```

Estos nombres describen el contrato lógico de la superficie.

La tarea no define:

- ruta física del archivo dentro del futuro package;
- subpath npm específico;
- barrel físico;
- mapa `exports`;
- nombre de hoja CSS;
- estructura interna de estilos;
- nombre de clase pública;
- dependencia de una librería CSS concreta.

La futura materialización deberá preservar la semántica sin convertir la organización interna del package en API accidental.

---

#### 7. Contrato conceptual mínimo

La API conceptual mínima queda:

```text
Card
  variant?   = surface | soft | raised
  padding?   = sm | md | lg
  children?  = contenido React del consumidor
  className? = extensión visual acotada
  ...props   = atributos compatibles de HTMLDivElement
```

Valores por defecto:

```text
variant = surface
padding = md
```

No se incorporan en esta tarea propiedades públicas específicas para:

- `interactive`;
- `clickable`;
- `selected`;
- `disabled`;
- `loading`;
- `success`;
- `warning`;
- `danger`;
- `brand`;
- `href`;
- `to`;
- `as`;
- `asChild`;
- `header`;
- `footer`;
- `title`;
- `actions`;
- `collapsible`;
- `elevation` numérica;
- `blur`;
- autorización;
- permisos;
- navegación;
- consultas de datos.

---

#### 8. Variantes canónicas

Se congelan tres variantes de intención visual:

| Variante  | Intención                                                                      | Límite                                                              |
| --------- | ------------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| `surface` | contenedor ordinario sobre la superficie base                                  | no implica selección, foco, disponibilidad ni prioridad empresarial |
| `soft`    | agrupación de contraste más suave o superficie secundaria                      | no equivale a disabled, draft, pending o menor autoridad            |
| `raised`  | contenedor con mayor separación/elevación visual respecto al plano circundante | no implica modal, interactividad, prioridad ni estado crítico       |

`surface` es la variante por defecto.

Las variantes describen tratamiento visual de una superficie, no estados de negocio.

Por tanto:

```text
variant="raised"
≠ elemento clicable
≠ prioridad empresarial alta

variant="soft"
≠ disabled
≠ pendiente

variant="surface"
≠ estado confirmado
```

El consumidor o patrón compuesto propietario elige la variante por necesidad de jerarquía visual, no por permiso, endpoint, estado de datos o código empresarial.

---

#### 9. Variante `surface`

`surface` representa la superficie ordinaria compartida.

Invariantes conceptuales:

1. separa visualmente el contenido del entorno inmediato;
2. utiliza el contrato visual común de `@vento/ui-web`;
3. no añade por sí sola una semántica interactiva;
4. no comunica un estado empresarial;
5. no exige sombra como señal principal;
6. no redefine tema ni tokens;
7. debe conservar legibilidad y contraste con su entorno.

El nombre `surface` expresa jerarquía visual, no una variable CSS concreta.

---

#### 10. Variante `soft`

`soft` representa una superficie secundaria o de contraste reducido respecto a `surface`.

Reglas:

1. su diferencia debe ser perceptible sin depender de un único matiz difícil de distinguir;
2. no puede utilizarse como sustituto visual de `disabled`;
3. no comunica menor autorización ni menor validez del contenido;
4. no implica estado de borrador, pendiente o informativo;
5. conserva la misma semántica estructural de `Card`;
6. debe mantener contraste suficiente para contenido y controles compuestos.

El significado de los datos dentro de la tarjeta permanece en el dominio consumidor.

---

#### 11. Variante `raised`

`raised` representa mayor separación visual del plano circundante.

La elevación puede materializarse mediante el contrato visual futuro, pero el contrato público no se define como una cantidad arbitraria de sombra.

Reglas:

1. la elevación no convierte el contenedor en diálogo ni overlay;
2. la elevación no convierte el contenedor en control;
3. la elevación no implica prioridad empresarial;
4. la elevación no exige `backdrop-filter`;
5. la implementación puede utilizar sombra o señales equivalentes aprobadas siempre que conserve contraste y jerarquía;
6. los consumidores no deben depender de una sombra física concreta como API estable.

La Card fija histórica de `vento/standard` se clasifica conceptualmente dentro de esta intención de superficie elevada para efectos de migración, sin afirmar equivalencia pixel a pixel.

---

#### 12. Padding canónico

La dimensión de densidad se conserva como:

```text
sm
md
lg
```

`md` es el valor por defecto.

Los nombres se conservan porque el candidato local ya los materializa como un eje explícito y reutilizable.

La tarea no congela:

- `12px`;
- `16px`;
- `20px`;
- `p-6`;
- otra unidad física concreta.

Los valores físicos deberán provenir del contrato visual normalizado de `@vento/ui-web` al materializarse.

El padding no altera:

- semántica del contenido;
- permisos;
- prioridad empresarial;
- tipo de superficie;
- requisitos de accesibilidad de controles internos;
- breakpoint;
- identidad de dispositivo.

La Card histórica con `p-6` no crea un cuarto valor de padding. Su correspondencia concreta se verificará durante migración por paridad visual.

---

#### 13. Elemento raíz y semántica estructural

`Card` renderiza conceptualmente un contenedor HTML neutro equivalente a:

```html
<div></div>
```

La decisión es vinculante para el componente base porque las implementaciones actuales coinciden en un `div` y no existe evidencia suficiente para abrir polimorfismo estructural.

Reglas:

1. `Card` no impone `role="group"`;
2. `Card` no impone `role="region"`;
3. `Card` no impone nombre accesible;
4. el consumidor puede aportar atributos ARIA compatibles cuando la composición concreta lo requiera;
5. una sección semántica, artículo, navegación o formulario debe conservar el elemento y estructura apropiados en la composición propietaria;
6. la apariencia de Card no sustituye encabezados, landmarks ni jerarquía de documento.

No se introduce `as` ni `asChild` en este corte.

---

#### 14. Card no es un control interactivo

La primitiva base es un contenedor visual, no un botón ni un enlace.

Queda fuera del contrato canónico utilizar `Card` como sustituto de un control completo basado únicamente en:

```text
<div onClick=...>
```

cuando la intención real sea activar una acción o navegar.

Para una tarjeta completamente activable:

- la superficie propietaria debe componer semántica nativa de enlace o botón;
- debe existir operación por teclado equivalente;
- debe existir foco visible cuando corresponda;
- el destino o acción permanece bajo responsabilidad del consumidor;
- la apariencia de Card puede envolver o acompañar la composición, pero no crea semántica interactiva por sí sola.

La transferencia de eventos nativos compatibles no convierte el patrón `div onClick` en la opción canónica para una acción primaria.

---

#### 15. Contenido y composición

`Card` recibe contenido del consumidor mediante `children` y no interpreta su significado.

Puede contener, cuando la composición sea semánticamente válida:

- texto;
- encabezados;
- listas;
- formularios;
- tablas;
- imágenes;
- `Alert`;
- `Button`;
- otros componentes visuales;
- composiciones específicas de dominio.

`Card` no decide:

- orden de campos de negocio;
- copy;
- título obligatorio;
- acción principal;
- permiso para mostrar una acción;
- consulta de datos;
- resultado de una operación;
- estado vacío;
- error recuperable;
- navegación.

Esas responsabilidades permanecen en sus patrones o dominios propietarios.

---

#### 16. No se crean subcomponentes estructurales obligatorios

La evidencia actual no justifica abrir en esta tarea una familia pública adicional como:

```text
CardHeader
CardTitle
CardDescription
CardContent
CardFooter
CardAction
```

Por tanto:

1. `SHELL-UI-004` no aprueba esos símbolos;
2. la composición interna permanece libre mediante HTML semántico y componentes existentes;
3. una necesidad repetida futura requerirá decisión canónica versionada antes de convertirse en API compartida;
4. no se inventa una API inspirada únicamente en librerías externas o convenciones comunes del ecosistema.

Esto mantiene el contrato mínimo respaldado por la evidencia VENTO actual.

---

#### 17. Atributos HTML y eventos

`Card` admite atributos compatibles de `HTMLDivElement` cuando sean semánticamente válidos.

Incluye conceptualmente:

```text
id
className
style
aria-*
data-*
onMouseEnter
onMouseLeave
onFocus
onBlur
```

La transferencia de un evento no convierte la primitiva en propietaria de una interacción empresarial.

Un consumidor sigue siendo responsable de:

- semántica interactiva;
- navegación;
- efectos;
- autorización;
- telemetría de dominio;
- mutaciones;
- lógica de selección;
- gestión de foco de patrones compuestos.

Un handler no cambia la naturaleza base de `Card` como contenedor no interactivo.

---

#### 18. `className`, `style` y personalización

La personalización permitida es aditiva y acotada.

`className` y atributos de estilo no constituyen una vía para crear en silencio nuevas variantes globales.

Un consumidor no debe utilizarlos para:

- fabricar una variante empresarial `success`, `warning` o `danger` que luego se trate como estándar;
- simular selección o autorización sin semántica propietaria;
- eliminar separación visual necesaria hasta hacer indistinguible la agrupación;
- introducir contraste insuficiente;
- recortar contenido esencial;
- convertir el contenedor en una interacción no accesible;
- acoplar la Card compartida a tokens privados de una sola aplicación como requisito global;
- depender de clases internas no publicadas del package.

Una personalización repetida entre consumidores debe tratarse como posible evolución versionada, no como fork silencioso del componente.

---

#### 19. Contrato visual

La futura implementación debe conservar los siguientes invariantes:

1. borde, contraste de superficie u otra señal aprobada permiten reconocer la agrupación cuando sea necesario;
2. el radio visual proviene del sistema compartido y no de un valor hardcodeado por consumidor;
3. `surface`, `soft` y `raised` son distinguibles sin alterar semántica del contenido;
4. `raised` presenta mayor separación visual que las variantes planas;
5. el contenido conserva legibilidad en tema claro y oscuro;
6. el componente admite contenido de longitud variable;
7. no existe altura fija contractual que recorte información;
8. no existe ancho fijo contractual que fuerce overflow ordinario;
9. la Card no depende de hover para revelar información esencial;
10. el componente no crea un fondo o blur que reduzca ilegiblemente el contraste del contenido.

Los detalles físicos permanecen sujetos al contrato CSS compartido y a las pruebas futuras del package.

---

#### 20. Sombra, borde y `backdrop-blur`

Las implementaciones actuales contienen decisiones físicas distintas que no deben confundirse con la API pública.

Clasificación:

| Rasgo                              | Decisión                                                |
| ---------------------------------- | ------------------------------------------------------- |
| separación por superficie          | conservar como intención visual                         |
| borde histórico/local              | evidencia de implementación; no nombre de clase público |
| sombra local en `raised`           | conservar como intención de elevación                   |
| sombra fija del estándar histórico | mapear a intención `raised` durante migración           |
| `backdrop-blur-xl` histórico       | no incorporar como obligación contractual               |
| radios concretos actuales          | no congelar como API                                    |
| nombres concretos de variables CSS | no congelar desde esta tarea                            |

La futura implementación puede modificar la técnica visual siempre que conserve el contrato observable, compatibilidad y accesibilidad aprobados.

---

#### 21. Accesibilidad mínima

`Card` no añade semántica accesible artificial por el solo hecho de verse como tarjeta.

La implementación futura deberá conservar:

1. contenido legible y disponible en el árbol accesible;
2. orden DOM coherente con el orden de lectura;
3. no depender únicamente de color, sombra o elevación para comunicar significado funcional;
4. no truncar contenido esencial por altura fija;
5. reflow sin scroll horizontal ordinario causado por el contenedor base;
6. zoom sin pérdida de contenido;
7. contraste suficiente entre contenido y superficie;
8. compatibilidad con controles internos que mantengan su propio foco visible;
9. ausencia de `role`, `tabIndex` o nombre accesible inventados por defecto;
10. ausencia de foco artificial en una Card meramente visual;
11. semántica interactiva nativa cuando un patrón superior haga la superficie activable;
12. densidad compatible con la tarea y dispositivo aplicables.

`Card` no corrige automáticamente markup semánticamente inválido que el consumidor inserte dentro de `children`.

---

#### 22. Foco y activación

Una `Card` base no participa en la secuencia de tabulación por defecto.

Por tanto:

- no recibe `tabIndex=0` automáticamente;
- no muestra tratamiento de foco interactivo por defecto;
- no responde a Enter o Space como si fuera un botón;
- no captura foco al renderizarse;
- no mueve foco al cambiar de variante;
- no crea selección interna.

Si una composición requiere activación completa de la tarjeta, la superficie propietaria deberá introducir el elemento interactivo adecuado y su tratamiento de foco.

La sombra de `raised` no se interpreta como affordance interactiva obligatoria.

---

#### 23. Frontera server/client

La lógica conceptual de `Card` no requiere:

- estado React interno;
- efectos;
- `window`;
- `document`;
- storage;
- timers;
- router;
- red;
- sesión;
- suscripciones.

Por tanto, el contrato no exige `"use client"`.

Los marcadores de cliente observados actualmente pertenecen a los archivos concretos donde vive la implementación local o la familia estándar; no se heredan como requisito público de la primitiva.

La futura `Card` debe poder participar en renderizado de servidor y también componerse dentro de componentes cliente.

---

#### 24. Frontera con autoridad, contexto y datos

`Card` no tiene autoridad propia.

Queda fuera de su responsabilidad:

```text
resolver usuario
resolver rol
resolver permisos
resolver sede o área
resolver turno o check-in
resolver contexto operativo
leer cookies de sesión
consultar Supabase
invocar RPC
consultar tablas
persistir datos
normalizar errores de proveedor
validar operaciones empresariales
```

La secuencia correcta es:

```text
aplicación / controlador / servidor propietario
→ resuelve datos, contexto y autorización
→ entrega contenido seguro
→ Card organiza visualmente ese contenido
```

La presencia, variante, sombra o ausencia de una Card nunca constituye un control de seguridad.

---

#### 25. Frontera con estados, Alert y EmptyState

`Card` no incorpora variantes de estado empresarial.

Por tanto no se crean:

```text
Card success
Card warning
Card danger
Card error
Card empty
Card loading
```

cuando lo que se necesita es representar un estado con contrato propio.

Relaciones:

| Superficie                   | Propiedad                                                |
| ---------------------------- | -------------------------------------------------------- |
| `Alert`                      | `SHELL-UI-002`; comunica mensaje o estado ya determinado |
| `Card`                       | `SHELL-UI-004`; agrupa contenido visualmente             |
| `EmptyState`                 | `SHELL-UI-005`; permanece reservado y no se define aquí  |
| estados de error recuperable | `SHELL-UI-016`; patrón compuesto posterior               |

Una Card puede contener esas superficies cuando estén aprobadas, pero no absorbe sus contratos.

---

#### 26. Responsividad, reflow y densidad

La Card base debe ser neutral respecto al layout del consumidor.

Reglas:

1. no impone un ancho fijo global;
2. no impone un número de columnas;
3. no define breakpoints propios de aplicación;
4. no presupone escritorio, tablet o kiosco;
5. el contenido puede envolver y crecer verticalmente;
6. la densidad se expresa mediante `padding`, no mediante una identidad de dispositivo;
7. una superficie tablet o kiosco puede exigir una densidad concreta desde su patrón propietario, pero `Card` no detecta el dispositivo;
8. controles internos conservan sus propios objetivos táctiles y reglas de interacción;
9. grids y stacks pertenecen al layout consumidor o a patrones de composición aprobados.

Los patrones específicos para tablet y kiosco permanecen en `SHELL-UI-017` y `SHELL-UI-018`.

---

#### 27. Tema, tokens y CSS

`Card` consume el contrato visual de `@vento/ui-web`.

No crea un sistema paralelo de:

- colores;
- superficies;
- radios;
- sombras;
- spacing;
- blur;
- breakpoints;
- tema claro/oscuro.

Reglas:

1. variantes y padding se materializan mediante decisiones normalizadas del package;
2. los nombres actuales `--color-surface-*`, `--ui-surface`, `--radius-lg`, `--ui-radius-card`, `--shadow-1` y `--ui-shadow-1` son evidencia técnica del legado actual, no nombres públicos congelados por esta tarea;
3. un consumidor no debe copiar manualmente estilos internos para usar el componente compartido;
4. claro y oscuro deben preservar legibilidad y jerarquía;
5. un cambio del contrato CSS público futuro deberá seguir compatibilidad y SemVer.

Esta tarea no crea un CSS entrypoint físico.

---

#### 28. Componentes de dominio cuyo nombre contiene `Card`

El nombre `Card` aparece también como parte de componentes empresariales o compuestos en repositorios consumidores.

La coincidencia nominal no implica equivalencia contractual.

Regla vinculante:

```text
componente *Card de dominio
≠
primitiva Card compartida
```

Un componente de dominio permanece local cuando incorpora, por ejemplo:

- consultas;
- decisiones de negocio;
- formularios;
- estados específicos;
- navegación de proceso;
- mutaciones;
- permisos;
- copy especializado;
- layouts propios;
- acciones de un recurso concreto.

Durante migración, un componente especializado puede adoptar `Card` internamente como primitiva visual sin dejar de pertenecer a su dominio.

No se crea una obligación de renombrar componentes de dominio por esta tarea.

---

#### 29. Reconciliación del candidato local de SHELL

La implementación `src/components/ui/Card.tsx` de SHELL se clasifica como `CANDIDATO_RECONCILIADO`, no como implementación canónica adoptada íntegramente.

Decisión por rasgo:

| Rasgo actual                          | Decisión                                                                    |
| ------------------------------------- | --------------------------------------------------------------------------- |
| `div` nativo                          | conservar                                                                   |
| `surface`                             | conservar                                                                   |
| `soft`                                | conservar                                                                   |
| `raised`                              | conservar                                                                   |
| default `surface`                     | conservar                                                                   |
| `sm`                                  | conservar                                                                   |
| `md`                                  | conservar                                                                   |
| `lg`                                  | conservar                                                                   |
| default `md`                          | conservar                                                                   |
| atributos `HTMLDivElement`            | conservar conceptualmente                                                   |
| `style` transferible                  | conservar como atributo nativo, sin convertir overrides en API de variantes |
| valores físicos `12/16/20`            | no convertir en contrato público                                            |
| token `--radius-lg`                   | no convertir en contrato público                                            |
| tokens concretos de superficie/sombra | no convertir en API pública                                                 |
| `"use client"` del archivo            | no convertir en obligación de Card                                          |

El archivo local permanece intacto hasta una migración controlada. Esta tarea no lo modifica ni lo elimina.

El barrel local `src/components/ui/index.ts` continúa siendo una superficie local de SHELL y no se transforma por esta tarea en el mapa de exports de `@vento/ui-web`.

---

#### 30. Reconciliación de la familia `vento/standard`

La implementación de `templates/app-shell-standard/src/components/vento/standard/ui.tsx` y sus copias runtime se clasifica como `LEGACY_ESTANDAR_A_MIGRAR` para la primitiva Card.

Decisión por rasgo:

| Rasgo actual                 | Decisión                                                          |
| ---------------------------- | ----------------------------------------------------------------- |
| `div` nativo                 | conservar                                                         |
| superficie con borde         | conservar como evidencia de jerarquía visual                      |
| sombra permanente            | mapear conceptualmente a `raised`, no imponerla a todas las Cards |
| padding fijo `p-6`           | no crear una cuarta densidad; resolver por paridad en migración   |
| `backdrop-blur-xl`           | no incorporar como obligación contractual                         |
| token `--ui-radius-card`     | no congelar como API                                              |
| token `--ui-surface`         | no congelar como API                                              |
| token `--ui-shadow-1`        | no congelar como API                                              |
| `className` compuesto        | conservar capacidad de extensión acotada                          |
| ausencia de variantes        | queda superada por el contrato común                              |
| ausencia de `padding` tipado | queda superada por el contrato común                              |
| `"use client"` del módulo    | no heredar como obligación de Card                                |

La tarea no modifica el template ni las copias runtime.

---

#### 31. Inventario de instancias actuales y estado de consumo

La tarea distingue **existencia de implementación** de **uso confirmado**.

Inventario físico localizado:

```text
SHELL local                         1
NEXO vento/standard                 1
FOGO vento/standard                 1
ORIGO vento/standard                1
VISO vento/standard                 1
PULSO vento/standard                1
NUMERA vento/standard               1
-------------------------------------
runtime/local                       7

template histórico SHELL           1
```

La existencia física de estas implementaciones no demuestra por sí sola su consumo actual. Esta tarea no convierte resultados de búsqueda, snippets ni presencia de archivo en prueba de uso o de ausencia de uso.

El inventario ejecutable de imports, aliases, usos dinámicos, composición y consumidores pertenece a `SHELL-MIG-001`; cualquier retiro exige además el gate de `SHELL-MIG-008`.

La migración deberá separar:

- archivo presente y consumido;
- archivo presente pero sin uso confirmado;
- componente de dominio distinto;
- template histórico;
- implementación local de SHELL.

---

#### 32. Estrategia de migración futura

La migración física no ocurre en `SHELL-UI-004`.

Secuencia futura:

```text
inventario ejecutable de consumidores
→ lotes reversibles
→ compatibilidad y bloqueo de nuevo legacy
→ scaffold sin copias desfasadas
→ adopción de Card compartida por aplicación
→ accesibilidad, tema y densidad
→ paridad por consumidor
→ retiro de copias legacy con evidencia
```

Propietarios exactos:

| Trabajo                                                | Tarea           |
| ------------------------------------------------------ | --------------- |
| inventario ejecutable de usos y consumidores           | `SHELL-MIG-001` |
| lotes reversibles por repositorio                      | `SHELL-MIG-002` |
| compatibilidad y bloqueo de nuevos consumidores legacy | `SHELL-MIG-003` |
| eliminación de copia futura desde scaffold histórico   | `SHELL-MIG-004` |
| adopción de componentes y estilos por aplicación       | `SHELL-MIG-005` |
| accesibilidad, tema, movimiento y densidad             | `SHELL-MIG-006` |
| pruebas de paridad por consumidor                      | `SHELL-MIG-007` |
| retiro de copias legacy y certificación                | `SHELL-MIG-008` |

No se autoriza reemplazo masivo basado únicamente en que dos funciones se llamen `Card`.

---

#### 33. Compatibilidad y versionado

La futura superficie de `Card` queda bajo el gobierno SemVer de `@vento/ui-web`.

Cambios con potencial impacto de compatibilidad incluyen:

- retirar o renombrar una variante;
- retirar o renombrar un padding;
- cambiar valores por defecto;
- transformar el elemento raíz observable;
- introducir semántica interactiva;
- dejar de transferir atributos nativos admitidos;
- cambiar comportamiento de `className` o `style` de forma incompatible;
- modificar el DOM de forma que rompa accesibilidad o CSS público aprobado;
- cambiar el contrato server-safe;
- convertir un detalle interno de tokens o clases en requisito del consumidor;
- retirar la exportación pública futura.

La futura cadena de package queda asignada a:

| Necesidad                                 | Tarea          |
| ----------------------------------------- | -------------- |
| pruebas propias del package               | `SHELL-CI-001` |
| build independiente                       | `SHELL-CI-002` |
| release versionado                        | `SHELL-CI-003` |
| changelog                                 | `SHELL-CI-004` |
| matriz de compatibilidad                  | `SHELL-CI-005` |
| actualización de consumidores mediante PR | `SHELL-CI-006` |

La compatibilidad visual no se reduce a coincidencia de píxeles: también incluye composición, semántica, reflow, densidad, tema y accesibilidad.

---

#### 34. Cobertura TREQ vigente consumida sin modificación

La tarea se apoya en cobertura ya existente del Registro Canónico de Requisitos de Prueba:

- `TREQ-SHELL-002` protege la procedencia de responsabilidades compartidas y la clasificación explícita de copias locales;
- `TREQ-SHELL-006` exige pruebas propias y matriz de compatibilidad de cada package compartido antes de publicación o adopción;
- `TREQ-SHELL-007` exige rollback independiente antes de release;
- `TREQ-SHELL-029` mantiene el template como fuente histórica hasta adopción/versionado/validación explícitos;
- `TREQ-SHELL-032` exige reconciliar las primitivas locales y kits del template antes de adopción o retiro;
- `TREQ-SHELL-035` protege texto, etiquetas y significado consistente de superficies compartidas;
- `TREQ-SHELL-036` a `TREQ-SHELL-039` gobiernan identidad de release, cortes coordinados, deprecación y retiro;
- `TREQ-UX-001` protege jerarquía y acción principal de las superficies;
- `TREQ-UX-003` protege densidad adecuada a actor y tarea;
- `TREQ-UX-004` protege objetivos táctiles y validación en dispositivos cuando existan controles interactivos aplicables;
- `TREQ-UX-007` exige validación controlada con actores, dispositivos y escenarios reales antes de ampliar despliegue.

`SHELL-UI-004` especializa esas obligaciones para una primitiva visual y no altera sus filas, estados, propietarios, paquetes o evidencias.

---

#### 35. Contrato de prueba futuro

Cuando exista implementación física y una adopción autorizada, la evidencia deberá cubrir como mínimo:

1. render con defaults `surface` y `md`;
2. render de `surface`;
3. render de `soft`;
4. render de `raised`;
5. padding `sm`;
6. padding `md`;
7. padding `lg`;
8. rechazo tipado de variantes no canónicas;
9. rechazo tipado de paddings no canónicos;
10. contenido textual;
11. contenido compuesto;
12. Card sin contenido sin introducir markup o fallback inventado;
13. forwarding de `id`;
14. forwarding de `data-*`;
15. forwarding de atributos ARIA compatibles;
16. composición de `className`;
17. transferencia de `style` sin convertir overrides en variante pública;
18. root no interactivo por defecto;
19. ausencia de `role` forzado;
20. ausencia de `tabIndex` forzado;
21. ausencia de foco automático;
22. ausencia de keyboard handlers inventados;
23. ausencia de navegación propia;
24. ausencia de router;
25. ausencia de llamadas de red;
26. ausencia de dependencia directa de `@vento/supabase`;
27. ausencia de lectura de sesión o permisos;
28. render server-safe de la superficie pura;
29. composición dentro de componente cliente;
30. reflow con contenido largo;
31. zoom sin recorte esencial;
32. tema claro;
33. tema oscuro;
34. contraste de contenido y superficie;
35. diferencia perceptible entre variantes;
36. `raised` sin convertirse en affordance interactiva por defecto;
37. `soft` sin utilizarse como estado disabled implícito;
38. Card con `Alert` compuesto sin fusionar responsabilidades;
39. Card con `Button` compuesto preservando semántica del botón;
40. composición con heading semántico definido por el consumidor;
41. composición de tarjeta activable mediante control nativo propietario, no `div` interactivo como contrato base;
42. paridad visual del candidato SHELL antes de retiro;
43. paridad de la apariencia histórica estándar antes de retiro;
44. clasificación del padding fijo histórico durante migración;
45. ausencia de dependencia contractual de `backdrop-blur`;
46. ausencia de subcomponentes públicos no aprobados;
47. compatibilidad por consumidor afectado;
48. rollback de un consumidor sin alterar los demás;
49. no absorción automática de componentes `*Card` de dominio;
50. retiro legacy únicamente después de evidencia de uso residual cero o migración certificada.

Esta sección define evidencia futura; no declara su ejecución en `SHELL-UI-004`.

---

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos descartados:** 0

Justificación:

- la reconciliación de primitivas y template ya está protegida por requisitos vigentes;
- las pruebas propias, compatibilidad y rollback de packages compartidos ya están protegidos transversalmente;
- release, deprecación y retiro legacy ya tienen gates registrados;
- densidad, jerarquía, accesibilidad y validación por dispositivo ya tienen cobertura UX vigente;
- la tarea no introduce un nuevo riesgo transversal ni una operación ejecutable independiente que requiera un identificador adicional;
- la tarea no modifica el significado, estado, propietario, paquete, evidencia ni relación de ningún requisito existente.

No se modifica ningún fragmento modular del registro.

---

#### 37. Estado de materialización física

Al cierre documental de `SHELL-UI-004`:

```text
IDENTIDAD Card                           = ESPECIFICADA
CardProps                                = ESPECIFICADO CONCEPTUALMENTE
CardVariant                              = 3 VALORES ESPECIFICADOS
CardPadding                              = 3 VALORES ESPECIFICADOS
ELEMENTO RAÍZ                            = DIV NO INTERACTIVO ESPECIFICADO
COMPOSICIÓN                              = ESPECIFICADA
ACCESIBILIDAD                            = ESPECIFICADA DOCUMENTALMENTE
SERVER-SAFE                              = ESPECIFICADO
FRONTERA DE AUTORIDAD                    = ESPECIFICADA
RECONCILIACIÓN SHELL                     = CERRADA DOCUMENTALMENTE
RECONCILIACIÓN VENTO/STANDARD            = CERRADA DOCUMENTALMENTE
INSTANCIAS RUNTIME/LOCALES LOCALIZADAS   = 7
FUENTES HISTÓRICAS DE TEMPLATE           = 1
PACKAGE FÍSICO                           = NO MATERIALIZADO
COMPONENTE FÍSICO COMPARTIDO             = NO MATERIALIZADO
CONSUMIDORES MIGRADOS                    = 0
IMPLEMENTACIONES LEGACY RETIRADAS        = 0
CAMBIOS TREQ                             = 0
```

La definición documental no implica publicación, instalación ni ejecución del package.

---

#### 38. Handoffs obligatorios

Los trabajos posteriores quedan asignados sin ejecutarse:

| Handoff                                | Propietario     | Condición de salida                                                             |
| -------------------------------------- | --------------- | ------------------------------------------------------------------------------- |
| pruebas del package para Card          | `SHELL-CI-001`  | suite de la primitiva ejecutable y trazable                                     |
| build independiente de `@vento/ui-web` | `SHELL-CI-002`  | artefacto construible sin dependencia accidental de consumidores                |
| release versionado                     | `SHELL-CI-003`  | versión inmutable y trazable                                                    |
| changelog de evolución pública         | `SHELL-CI-004`  | cambios públicos clasificados                                                   |
| matriz de compatibilidad               | `SHELL-CI-005`  | combinaciones soportadas demostradas                                            |
| actualización de consumidores          | `SHELL-CI-006`  | PR explícito por consumidor afectado                                            |
| inventario ejecutable de usos          | `SHELL-MIG-001` | cada uso real clasificado                                                       |
| lotes reversibles                      | `SHELL-MIG-002` | cada consumidor con cambio y rollback                                           |
| compatibilidad legacy                  | `SHELL-MIG-003` | no aparecen nuevos consumidores de copias no gobernadas                         |
| sustitución del scaffold histórico     | `SHELL-MIG-004` | la plantilla deja de propagar la copia legacy cuando el package esté habilitado |
| adopción de Card por aplicación        | `SHELL-MIG-005` | uso compartido con extensiones locales declaradas                               |
| accesibilidad, tema y densidad         | `SHELL-MIG-006` | paridad visual y accesible por aplicación                                       |
| paridad de consumidor                  | `SHELL-MIG-007` | evidencia antes/después y rollback ensayado                                     |
| retiro de copias legacy                | `SHELL-MIG-008` | ausencia de consumo residual o migración certificada                            |
| contrato de EmptyState                 | `SHELL-UI-005`  | definición independiente de estado vacío; no se ejecuta en esta tarea           |

No queda un pendiente material sin propietario documental.

---

#### 39. Decisiones vinculantes

1. El componente compartido se denomina `Card`.
2. `Card` pertenece a `@vento/ui-web`.
3. La tarea es documental y no materializa código.
4. Los símbolos conceptuales son `Card`, `CardProps`, `CardVariant` y `CardPadding`.
5. No se inventa un subpath físico ni mapa de exports.
6. Las variantes canónicas son `surface`, `soft` y `raised`.
7. `surface` es la variante por defecto.
8. Los paddings canónicos son `sm`, `md` y `lg`.
9. `md` es el padding por defecto.
10. Los valores físicos actuales de padding no forman parte de la API contractual.
11. El elemento raíz base es `div`.
12. Card es un contenedor no interactivo por defecto.
13. Card no impone `role`, `tabIndex` ni nombre accesible.
14. Card no es Button.
15. Card no es Link.
16. Card no incorpora router.
17. Card no crea `interactive` ni `clickable` como variantes.
18. Una tarjeta activable requiere semántica interactiva nativa en la composición propietaria.
19. Card no incorpora `selected` como estado base.
20. Card no incorpora `disabled` como estado base.
21. Card no incorpora `loading` como estado base.
22. Card no incorpora variantes empresariales `success`, `warning` o `danger`.
23. Card puede contener otras superficies sin absorber sus contratos.
24. `EmptyState` permanece propiedad de `SHELL-UI-005`.
25. No se crean `CardHeader`, `CardTitle`, `CardContent` ni `CardFooter` en este corte.
26. Los atributos compatibles de `HTMLDivElement` se conservan conceptualmente.
27. `className` y `style` no crean variantes globales silenciosas.
28. El contrato no exige `use client`.
29. Card debe poder renderizarse en una superficie server-safe.
30. Card no depende directamente de Supabase.
31. Card no resuelve sesión, permisos, contexto ni autorización.
32. Card no ejecuta efectos empresariales.
33. `raised` expresa elevación visual, no interactividad ni prioridad empresarial.
34. `soft` expresa superficie secundaria, no disabled ni pendiente.
35. La sombra fija de la familia estándar no se extiende a todas las Cards.
36. `backdrop-blur-xl` histórico no forma parte del contrato canónico.
37. Los nombres actuales de tokens y variables CSS no se congelan como API desde esta tarea.
38. La implementación local de SHELL queda reconciliada, no adoptada íntegramente.
39. La familia `vento/standard` queda reconciliada como legacy a migrar.
40. Se localizan siete implementaciones runtime/locales y una fuente histórica de template para la reconciliación actual.
41. La presencia de una función Card no demuestra consumo de esa función.
42. Los componentes `*Card` de dominio no se absorben por coincidencia nominal.
43. Las implementaciones actuales no se eliminan en esta tarea.
44. La migración será progresiva y reversible por consumidor.
45. La accesibilidad y paridad se prueban antes de retirar una copia.
46. El retiro legacy exige evidencia de ausencia de uso residual o migración certificada.
47. No se realizan cambios de Supabase, SQL, datos o configuración remota.
48. Se crean 0 requisitos `TREQ-*` y se modifican 0.
49. `SHELL-UI-005` permanece reservada y no se desarrolla aquí.

---

#### 40. Criterios de aceptación documental

`SHELL-UI-004` queda documentalmente cerrada únicamente si se cumplen simultáneamente:

- [x] la continuidad real apunta de `SHELL-UI-003` a `SHELL-UI-004`;
- [x] `SHELL-UI-005` permanece como única siguiente tarea;
- [x] `Card` tiene identidad funcional única;
- [x] se reconcilian el candidato local de SHELL y la familia histórica sin adoptar una copia ciegamente;
- [x] se localizan y contabilizan siete implementaciones runtime/locales actuales más una fuente histórica de template;
- [x] se distinguen existencia física y uso confirmado;
- [x] se fijan tres variantes canónicas;
- [x] se fija `surface` como variante por defecto;
- [x] se fijan tres paddings canónicos;
- [x] se fija `md` como padding por defecto;
- [x] no se perpetúan valores físicos de padding como contrato público;
- [x] se fija `div` como elemento raíz base;
- [x] se preserva Card como contenedor no interactivo;
- [x] no se crea polimorfismo de elemento sin evidencia;
- [x] no se crean subcomponentes estructurales sin evidencia;
- [x] `backdrop-blur` histórico queda fuera del contrato público;
- [x] la sombra permanente histórica se reconcilia bajo la intención `raised`;
- [x] los tokens actuales se tratan como evidencia, no como API congelada;
- [x] se preserva frontera server-safe;
- [x] se preserva frontera con contratos, contexto, datos y lógica empresarial;
- [x] se separa Card de Alert y EmptyState;
- [x] se separa la primitiva de componentes `*Card` de dominio;
- [x] se especifica accesibilidad mínima;
- [x] se especifica contrato futuro de prueba;
- [x] migración, accesibilidad, paridad y retiro tienen propietarios exactos;
- [x] no se modifican consumidores ni implementaciones actuales;
- [x] no se ejecutan cambios físicos;
- [x] se declaran 0 cambios TREQ con justificación concreta;
- [x] no queda un pendiente material sin propietario documental.

Resultado:

```text
CARD COMPARTIDA                      = ESPECIFICADA
VARIANTES                            = 3 CERRADAS
PADDINGS                             = 3 CERRADOS
SEMÁNTICA ESTRUCTURAL                = CERRADA
INTERACTIVIDAD BASE                  = NO APLICA
RECONCILIACIÓN DE DUPLICADOS         = CERRADA DOCUMENTALMENTE
IMPLEMENTACIÓN FÍSICA                = NO MATERIALIZADA
MIGRACIÓN                            = NO EJECUTADA
CAMBIOS TREQ                         = 0
SIGUIENTE TAREA                      = SHELL-UI-005
```

---

#### 41. Límites

Esta tarea no autoriza:

- crear o modificar el package físico `@vento/ui-web`;
- crear archivos TypeScript del package;
- cambiar `src/components/ui/Card.tsx`;
- cambiar `src/components/ui/index.ts`;
- cambiar copias `src/components/vento/standard/ui.tsx`;
- cambiar el template;
- borrar implementaciones legacy;
- migrar consumidores;
- publicar una versión;
- configurar registry;
- crear workflows;
- crear una API polimórfica para Card;
- convertir Card en Link o Button;
- crear `CardHeader`, `CardTitle`, `CardContent` o `CardFooter`;
- definir `EmptyState` antes de su tarea propietaria;
- absorber componentes de dominio cuyo nombre contenga `Card`;
- modificar rutas;
- modificar autenticación o autorización;
- introducir Supabase en Card;
- cambiar contratos empresariales;
- cambiar datos;
- crear migraciones SQL;
- modificar requisitos de prueba;
- iniciar `SHELL-UI-005`.

---

#### 42. Continuidad

**ÚLTIMA TAREA APROBADA**

```text
SHELL-UI-003 — Compartir Button
```

**TAREA ACTUAL APROBADA**

```text
SHELL-UI-004 — Compartir Card
```

**SIGUIENTE TAREA RESERVADA**

```text
SHELL-UI-005 — Compartir EmptyState
```

No se inicia `SHELL-UI-005` en esta tarea.


### ✅ SHELL-UI-005 — Compartir EmptyState

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-004 — Compartir Card
**Tarea siguiente:** SHELL-UI-006 — Compartir indicador de contexto
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_COMPONENTES_WEB_COMPARTIDOS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-UI-005` define y reconcilia el contrato canónico del componente visual compartido `EmptyState` que deberá pertenecer a `@vento/ui-web`.

La tarea parte de patrones actuales distribuidos entre aplicaciones web que comunican ausencia de contenido mediante clases como `.ui-empty` y `.ui-empty-state`, además de una implementación local `EmptyState` localizada en NEXO. La evidencia demuestra reutilización visual real, pero también mezcla semántica: algunos usos representan ausencia real de contenido, otros filtros sin coincidencias, otros ausencia de trabajo inmediato y otros casos que en realidad corresponden a falta de permiso o contexto requerido.

La tarea no perpetúa esa mezcla. Cierra una única primitiva visual para representar **ausencia confirmada dentro de un alcance ya resuelto**, sin convertir el componente en fuente de verdad sobre por qué no hay contenido.

Regla raíz:

```text
ALCANCE AUTORIZADO Y RESUELTO
+
CONSULTA / INICIALIZACIÓN EXITOSA Y SUFICIENTE
+
PERFIL VACÍO DETERMINADO POR EL PROPIETARIO
+
MENSAJE HUMANO COHERENTE CON ESE PERFIL
→
EmptyState DE @vento/ui-web
→
PRESENTACIÓN VISUAL CONSISTENTE DEL VACÍO
```

Nunca:

```text
error de carga
→ EmptyState

denegación de permiso
→ EmptyState

contexto operativo obligatorio irresuelto
→ EmptyState

consulta parcial u obsoleta
→ afirmar que no existen registros

0 elementos visibles por masking
→ revelar que existen elementos ocultos
```

`EmptyState` presenta un vacío ya resuelto. No determina autorización, no ejecuta consultas, no infiere filtros, no decide que una cola está despejada y no genera trabajo nuevo.

---

#### 2. Resultado canónico

Se aprueba `EmptyState` como componente visual compartido de `@vento/ui-web` con las siguientes propiedades vinculantes:

1. identidad pública funcional única: `EmptyState`;
2. mensaje principal visible obligatorio mediante `title`;
3. descripción visible opcional mediante `description`;
4. icono o ilustración ligera opcional mediante `icon`;
5. acción opcional compuesta por el consumidor mediante `action`;
6. ausencia de propiedades públicas propias `cta`, `href`, `to` o integración con router;
7. ausencia de `variant`, `kind`, `status` o taxonomía paralela de causas de vacío;
8. elemento raíz conceptual no interactivo equivalente a `div`;
9. atributos HTML y ARIA compatibles transferibles al elemento raíz;
10. ausencia de `role`, `aria-live`, captura de foco o anuncio universal por defecto;
11. ausencia de estado interno obligatorio;
12. ausencia de consultas, red, temporizadores, persistencia o suscripciones;
13. ausencia de dependencia directa de Supabase;
14. ausencia de dependencia de sesión, permisos, contexto o router;
15. compatibilidad conceptual con renderizado de servidor;
16. compatibilidad con composición dentro de superficies cliente cuando el consumidor aporte controles interactivos;
17. independencia respecto de `Card`, `Alert`, tablas, paneles y layouts concretos;
18. tratamiento de `.ui-empty` y `.ui-empty-state` como evidencia legacy a clasificar, no como API pública perpetua;
19. migración posterior por consumidor, con paridad semántica, visual, accesible y rollback;
20. cero cambios físicos y cero consumidores migrados por esta tarea.

Estado resultante:

```text
EmptyState compartido
→ DEFINIDO

API conceptual
→ DEFINIDA

perfil semántico de vacío
→ PROVIENE DEL CONTRATO PROPIETARIO, NO DEL COMPONENTE

implementación física en @vento/ui-web
→ NO MATERIALIZADA

consumidores migrados
→ 0

legacy retirado
→ 0
```

---

#### 3. Fuentes y precedencia

La especificación conserva las decisiones vigentes de las siguientes fuentes:

| Fuente                                                            | Uso vinculante                                                                                                    |
| ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                      | continuidad, trazabilidad, separación entre definición e implementación y tratamiento de requisitos               |
| `docs/plan-canonico/modular/delivery-contract.json`               | forma del artefacto documental                                                                                    |
| `docs/plan-canonico/modular/active-sequence.json`                 | proyección remota de continuidad; actualmente retrasada respecto de la aprobación local de `SHELL-UI-004`         |
| `docs/plan-canonico/modular/continuity-route.json`                | orden normal del bloque H y secuencia `SHELL-UI-*`                                                                |
| `07_COMPONENTES_WEB_COMPARTIDOS.md`                               | propietario del mini-bloque y reserva explícita de `SHELL-UI-005` para `EmptyState`                               |
| `SHELL-UI-001`                                                    | identidad, fronteras y estado no materializado de `@vento/ui-web`                                                 |
| `SHELL-UI-002`                                                    | frontera entre presentación informativa, errores y autoridad                                                      |
| `SHELL-UI-003`                                                    | contrato de `Button` como primitiva de acción sin autoridad propia                                                |
| `SHELL-UI-004`                                                    | `Card` como contenedor independiente y handoff explícito de `EmptyState`                                          |
| Registro Canónico de Requisitos de Prueba — dominio UX            | taxonomía de vacío, privacidad, accesibilidad, filtros, cola despejada y fronteras con error/bloqueo ya cubiertas |
| Registro Canónico de Requisitos de Prueba — dominio SHELL         | reconciliación, packages, compatibilidad, rollback y retiro legacy ya cubiertos                                   |
| `vento-nexo/src/app/page.tsx`                                     | implementación local `EmptyState` y evidencia de usos semánticamente heterogéneos                                 |
| `vento-nexo/src/app/globals.css`                                  | contrato CSS legacy `.ui-empty` / `.ui-empty-state`                                                               |
| `vento-fogo/src/features/recipes/recipe-steps-editor.tsx`         | uso simple de `.ui-empty-state` para una colección local vacía                                                    |
| `vento-fogo/src/app/globals.css`                                  | copia runtime del patrón CSS de vacío                                                                             |
| `vento-origo/src/app/purchase-orders/page.tsx`                    | vacío de colección con acción de creación y filtros activos posibles                                              |
| `vento-origo/src/app/suppliers/page.tsx`                          | diferenciación actual entre ausencia base y filtros sin resultados                                                |
| `vento-origo/src/app/globals.css`                                 | copia runtime del patrón CSS de vacío                                                                             |
| superficies VISO que usan `.ui-empty`                             | evidencia de variante textual ligera del patrón legacy                                                            |
| `07_01_MIGRACION_COORDINADA_DE_CONSUMIDORES_WEB.md`               | inventario, lotes, adopción, accesibilidad, paridad y retiro posteriores                                          |
| `T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md` | pruebas, build, release, compatibilidad y actualización de consumidores posteriores                               |

Precedencia:

```text
contrato de pantalla / dominio
→ autorización y contexto resueltos
→ resultado de consulta o inicialización
→ perfil semántico de vacío
→ copy y acción permitida
→ EmptyState
→ implementación física futura
→ migración controlada
```

Una clase CSS, un `rows.length === 0`, una función local o un texto `Sin ...` no constituyen por sí solos prueba suficiente de que el estado sea semánticamente vacío.

---

#### 4. Reconciliación de continuidad

El estado remoto consultado conserva todavía:

```text
previous_task_id = SHELL-UI-003
pending SHELL-UI = 004..020
```

Ese estado remoto no incorpora aún la aprobación expresa del usuario sobre `SHELL-UI-004`.

La base inmediata válida para esta tarea es el último artefacto local expresamente aprobado:

```text
SHELL-UI-004 — Compartir Card
→ APROBADA POR EL USUARIO
→ siguiente reservada: SHELL-UI-005 — Compartir EmptyState
```

La ruta normal y el archivo propietario coinciden en que `SHELL-UI-005` sigue a `SHELL-UI-004`.

Por tanto:

```text
DRIFT REMOTO = 1 TAREA
CONTRADICCIÓN SUSTANTIVA = NO
BLOQUEO PARA DESARROLLAR UI005 = NO
EDICIÓN MANUAL DE active-sequence.json = PROHIBIDA
```

La tarea no modifica la proyección derivada ni realiza escrituras remotas.

---

#### 5. Línea base física y documental

El estado actual relevante queda clasificado así:

| Superficie                        | Estado observado                                         | Decisión de UI005                                      |
| --------------------------------- | -------------------------------------------------------- | ------------------------------------------------------ |
| `@vento/ui-web`                   | definido documentalmente; no materializado               | conserva estado no materializado                       |
| `vento-shell/src/components/ui`   | primitivas locales conocidas sin `EmptyState` compartido | no se modifica                                         |
| `vento-nexo/src/app/page.tsx`     | función local `EmptyState`                               | candidato de reconciliación; no se adopta íntegramente |
| `.ui-empty-state` en consumidores | patrón CSS runtime repetido                              | compatibilidad legacy, no API perpetua                 |
| `.ui-empty` en consumidores       | patrón textual ligero repetido                           | requiere clasificación semántica antes de migrar       |
| ORIGO proveedores                 | distingue `Sin proveedores` y `Sin resultados`           | evidencia positiva de dos causas diferentes            |
| ORIGO órdenes de compra           | usa un único mensaje de vacío aunque existan filtros     | requiere clasificación durante migración               |
| FOGO pasos de receta              | muestra `Sin pasos definidos.`                           | vacío local simple compatible con el contrato          |
| NEXO página principal             | mezcla vacío, permiso y contexto en una función          | la mezcla no se incorpora al contrato compartido       |

No se declara un conteo exhaustivo de instancias de vacío en todos los repositorios porque ese inventario ejecutable pertenece a `SHELL-MIG-001` y debe resolver usos estáticos, dinámicos y variantes locales antes de retiro.

La evidencia actual sí es suficiente para demostrar:

1. existe repetición real del patrón;
2. existen al menos dos formas visuales legacy (`.ui-empty` y `.ui-empty-state`);
3. existen vacíos simples, vacíos con descripción, vacíos con acción y vacíos filtrados;
4. existen usos incorrectamente mezclados con permiso y contexto;
5. una API compartida necesita conservar composición sin incorporar semántica falsa.

---

#### 6. Identidad pública

La superficie conceptual introducida por esta tarea queda compuesta por:

```text
EmptyState
EmptyStateProps
```

No se crean símbolos públicos adicionales como:

```text
EmptyStateVariant
EmptyStateKind
EmptyStateStatus
EmptyStateAction
EmptyStateIcon
EmptyStateProvider
EmptyStateContext
```

La taxonomía de causas de vacío ya pertenece a contratos de pantalla y dominio. Duplicarla dentro de la primitiva generaría una segunda fuente de verdad.

La tarea no inventa:

- ruta física de archivo;
- subpath npm;
- barrel;
- mapa de `exports`;
- archivo CSS público;
- nombre de token;
- provider global.

---

#### 7. Contrato conceptual mínimo

La API conceptual queda:

```text
EmptyState
  title        = contenido visible principal requerido
  description? = contenido explicativo visible opcional
  icon?        = apoyo visual opcional
  action?      = acción o navegación compuesta por el consumidor
  className?   = extensión visual acotada
  ...props     = atributos compatibles de HTMLDivElement
```

Semántica:

| Propiedad      | Regla                                                                                           |
| -------------- | ----------------------------------------------------------------------------------------------- |
| `title`        | requerida; debe producir un mensaje visible comprensible y específico para el alcance mostrado  |
| `description`  | opcional; explica causa comprobada, alcance o siguiente paso sin inventar hechos                |
| `icon`         | opcional; apoyo visual, nunca fuente única de significado                                       |
| `action`       | opcional; nodo compuesto por el consumidor únicamente cuando existe una acción permitida y útil |
| `className`    | opcional; no puede romper invariantes de accesibilidad, privacidad o significado                |
| atributos HTML | transferibles cuando sean compatibles con el contenedor raíz                                    |
| atributos ARIA | transferibles explícitamente; no se impone región viva universal                                |

`title` y `description` pueden componerse con contenido React compatible, pero el resultado debe conservar texto visible significativo.

El componente no genera copy por defecto.

---

#### 8. Decisión sobre `cta` y `href`

La implementación local localizada en NEXO expone:

```text
cta?: string
href?: string
```

Ese acoplamiento no se incorpora al contrato canónico.

Razones:

1. acopla el componente base a navegación;
2. presupone que toda acción es un enlace;
3. no cubre acciones locales como limpiar filtros;
4. no cubre botones que abran composición propietaria;
5. obliga a `EmptyState` a conocer semántica de destino que no le pertenece;
6. mezcla presentación con router;
7. impide reutilizar la primitiva en contextos sin Next.js;
8. la semántica de `Button` y Link ya tiene propietarios distintos.

La sustitución canónica es:

```text
action?: ReactNode
```

El consumidor decide si ese nodo es:

- un `Button`;
- un enlace;
- una acción local para limpiar filtros;
- otro control semánticamente válido;
- o nada.

`EmptyState` no ejecuta la acción y no determina su autorización.

---

#### 9. Decisión sobre icono

La implementación local de NEXO fija un icono `sparkles`, mientras otras superficies actuales muestran estados vacíos sin icono.

Por tanto:

```text
icon = OPCIONAL
icon por defecto global = NINGUNO
```

Reglas:

1. no existe un icono obligatorio para que el estado sea comprensible;
2. `sparkles` no se convierte en icono canónico del vacío;
3. el componente no crea ni gobierna un catálogo transversal de iconos;
4. un icono decorativo queda fuera del nombre accesible;
5. un icono con información no expresada en texto necesita equivalente accesible;
6. el icono no determina si el vacío es base, filtrado, cola despejada o ausencia de selección;
7. no se comunica permiso, error o severidad solo mediante iconografía.

---

#### 10. Ausencia deliberada de `variant` o `kind`

`EmptyState` no introduce una propiedad pública que replique la taxonomía de pantalla.

No se aprueba:

```text
variant="empty"
variant="filtered"
variant="unauthorized"
variant="error"
kind="no-work"
kind="no-selection"
kind="first-use"
```

Motivo:

```text
causa semántica
→ contrato de pantalla / dominio

representación visual del vacío ya resuelto
→ EmptyState
```

El componente no debe convertir una enumeración visual en una segunda máquina de estados.

Las diferencias entre vacío base, filtrado, ausencia de selección o cola despejada se expresan mediante el estado propietario, el mensaje, el contexto visible y la acción compuesta, no mediante una taxonomía paralela inventada en UI.

---

#### 11. Condición de entrada obligatoria

`EmptyState` solo puede utilizarse como representación de ausencia cuando la capa propietaria ya haya demostrado suficiente certeza.

Condición mínima:

```text
AUTORIZACIÓN APLICABLE RESUELTA
AND
CONTEXTO REQUERIDO RESUELTO O PERFIL EXPLÍCITO DE NO-SELECCIÓN VÁLIDO
AND
CONSULTA / INICIALIZACIÓN EXITOSA
AND
ALCANCE CONOCIDO
AND
RESULTADO COMPLETO PARA ESE ALCANCE
AND
AUSENCIA CONFIRMADA SEGÚN EL PERFIL PROPIETARIO
```

Si cualquiera de esas condiciones no está demostrada, el consumidor debe representar el estado correspondiente y no afirmar un vacío material inexistente.

---

#### 12. Vacío base o primer registro

El vacío base representa que una colección o región autorizada existe, fue resuelta correctamente y contiene cero elementos para el alcance mostrado.

Ejemplos conceptuales válidos:

```text
Sin proveedores
Sin órdenes todavía
Sin pasos definidos
```

Reglas:

1. solo se afirma ausencia dentro del alcance realmente consultado;
2. una acción de creación puede aparecer únicamente si el actor puede ejecutarla;
3. la acción no se muestra como bypass de una condición previa;
4. el copy no promete que el sistema esté vacío globalmente si la consulta está acotada;
5. el componente no sabe si es el primer registro; recibe el mensaje ya determinado.

---

#### 13. Vacío filtrado

Un conjunto autorizado puede contener elementos y aun así producir cero coincidencias después de aplicar filtros o búsqueda.

En ese caso:

```text
resultado filtrado = 0
≠
colección global = 0
```

El consumidor deberá conservar o hacer comprensible:

- filtros activos;
- búsqueda activa;
- periodo;
- territorio o población aplicable;
- alcance autorizado relevante.

El mensaje debe describir el resultado filtrado, por ejemplo una intención equivalente a:

```text
Sin resultados para estos filtros
```

No debe afirmar:

```text
No existen proveedores
```

si existen proveedores fuera del filtro.

Una acción para limpiar o ajustar filtros puede componerse mediante `action`, pero la lógica del filtro permanece fuera de `EmptyState`.

---

#### 14. Ausencia de selección válida

La ausencia de selección puede utilizar `EmptyState` cuando represente una región cuyo contenido depende legítimamente de que la persona elija un elemento dentro de una pantalla ya autorizada y correctamente inicializada.

Ejemplo conceptual:

```text
Selecciona un registro para ver el detalle
```

Eso es distinto de contexto operativo obligatorio irresuelto.

Nunca debe utilizarse `EmptyState` para presentar como mera selección pendiente:

- sede efectiva requerida para operar;
- área efectiva requerida;
- turno requerido;
- check-in requerido;
- actor no resuelto;
- permiso faltante;
- recurso fuera de alcance.

Esos estados conservan sus propietarios de contexto, bloqueo, autorización o recuperación.

---

#### 15. Cola despejada

Una cola puede mostrarse vacía o despejada únicamente cuando su propietario haya demostrado que la consulta relevante está:

- autorizada;
- completa;
- suficientemente fresca;
- no parcial;
- no degradada a una caché que impida afirmar ausencia;
- y contiene cero pendientes reales para el alcance mostrado.

`EmptyState` no determina frescura ni consulta la cola.

La capa propietaria decide cuándo puede presentar un mensaje como:

```text
No hay tareas pendientes
```

El componente solo lo representa.

---

#### 16. Ausencia de trabajo para el actor

Un actor puede tener cero trabajo elegible o asignado sin que el sistema carezca de trabajo global.

Regla:

```text
trabajo visible/elegible para actor = 0
≠
trabajo global = 0
```

El mensaje deberá reflejar el alcance real.

`EmptyState` no puede ofrecer automáticamente:

- autoasignarse trabajo;
- crear órdenes;
- ampliar sede;
- ampliar área;
- cambiar turno;
- alterar ruta;
- elevar permisos;
- tomar trabajo fuera de custodia.

Una acción solo se compone cuando el contrato propietario ya la autoriza.

---

#### 17. Error de carga no es vacío

Una consulta que falla no demuestra ausencia.

Secuencia prohibida:

```text
error
→ rows = []
→ EmptyState "No hay registros"
```

Secuencia correcta:

```text
error
→ estado de error propietario
→ explicación / recuperación aplicable
```

`SHELL-UI-016 — Compartir estados de error recuperable` conserva la propiedad del patrón compuesto de recuperación.

`Alert` puede utilizarse cuando corresponda a un mensaje informativo o de error ya resuelto, pero `EmptyState` no absorbe ese contrato.

---

#### 18. Loading, parcialidad y resultado desconocido

`EmptyState` no representa:

- carga inicial;
- skeleton;
- consulta en progreso;
- página parcial;
- streaming incompleto;
- sincronización pendiente;
- resultado desconocido;
- timeout sin conciliación;
- operación offline sin certeza suficiente;
- caché stale que no permita afirmar ausencia.

Mientras la existencia real del contenido sea desconocida, el componente no debe comunicar ausencia confirmada.

---

#### 19. Denegación y falta de visibilidad

Una colección o recurso no autorizado no se convierte en vacío para simplificar la UI.

Regla:

```text
no autorizado
≠
0 resultados
```

También:

```text
0 elementos después de aplicar masking
≠
permiso para revelar que existen elementos ocultos
```

El mensaje vacío no puede revelar:

- existencia de objetos ocultos;
- cantidades restringidas;
- identidad de registros;
- nombres sensibles;
- estados internos de elementos fuera del alcance;
- pistas que permitan enumeración indirecta.

La capa propietaria envía únicamente el contenido que el actor puede conocer.

---

#### 20. Recurso inexistente, eliminado o fuera de alcance

`EmptyState` es principalmente una primitiva de ausencia de contenido dentro de una región o colección resuelta; no reemplaza el tratamiento de detalle inválido.

Un identificador de recurso que resulte:

- inexistente;
- eliminado;
- fuera de alcance;
- no autorizado;
- stale;
- superseded;
- o desconocido por fallo de consulta

requiere el tratamiento de error, recuperación, seguridad o navegación propietario.

No se autoriza convertir una pantalla de detalle no resoluble en una tarjeta genérica de `No hay datos`.

---

#### 21. Contenido y copy

`EmptyState` no genera textos de dominio.

El propietario funcional debe entregar un mensaje que:

1. describa lo que realmente se sabe;
2. sea específico para el alcance mostrado;
3. no confunda ausencia local con global;
4. no culpe a la persona;
5. no exponga códigos técnicos como mensaje principal;
6. no oculte un fallo bajo lenguaje de vacío;
7. no prometa una acción que el actor no puede completar;
8. no presente configuración como relleno cuando no hay trabajo;
9. sea localizable;
10. soporte longitud variable y reflow.

El componente no inventa fallback como:

```text
No hay datos
```

cuando el consumidor omite `title`.

La ausencia de mensaje principal significativo es un defecto de desarrollo.

---

#### 22. Acción opcional

`action` es opcional y pertenece al consumidor.

Una acción es válida cuando:

- existe una siguiente acción real;
- el actor puede intentarla legítimamente;
- no fabrica autoridad;
- no salta una condición de entrada;
- no transforma un error en creación;
- no crea registros duplicados por asumir ausencia global;
- utiliza semántica de `Button` o enlace según su intención real.

Ejemplos conceptuales:

| Perfil resuelto           | Acción potencial                                                                        |
| ------------------------- | --------------------------------------------------------------------------------------- |
| primer registro           | crear, solo si está autorizado                                                          |
| filtros sin coincidencias | limpiar o ajustar filtros                                                               |
| cola despejada            | ninguna, refrescar o navegar solo si aporta valor real                                  |
| ausencia de selección     | seleccionar mediante la superficie propietaria, no necesariamente dentro del EmptyState |
| sin trabajo asignado      | normalmente ninguna acción de creación o autoasignación salvo contrato explícito        |

`EmptyState` no añade automáticamente un CTA.

---

#### 23. Semántica de acción y Button

Cuando `action` contenga una acción ejecutable, la composición deberá conservar el contrato de `SHELL-UI-003`.

Por tanto:

```text
EmptyState
→ puede contener Button
→ no se convierte en Button
```

La presencia de un botón visible no concede autorización.

Cuando la intención sea navegación:

```text
EmptyState
→ puede contener enlace apropiado
→ no se convierte en router
```

No se añaden propiedades `href`, `to`, `replace`, `prefetch` o destinos cross-app al componente base.

---

#### 24. Relación con Card

`EmptyState` y `Card` son superficies independientes.

```text
Card
→ contenedor visual genérico

EmptyState
→ representación de ausencia confirmada
```

`EmptyState` puede aparecer:

- dentro de una Card;
- dentro de un panel;
- dentro de una celda de tabla que abarque la región vacía;
- dentro de una región de contenido;
- sin Card externa.

No se incorpora `Card` internamente como dependencia obligatoria.

Esto evita doble borde, doble padding, composición rígida y acoplamiento accidental del componente a un layout único.

---

#### 25. Relación con Alert

`Alert` y `EmptyState` no son sustitutos.

| Superficie   | Responsabilidad                                                                                   |
| ------------ | ------------------------------------------------------------------------------------------------- |
| `Alert`      | comunicar un mensaje o estado ya determinado dentro del flujo                                     |
| `EmptyState` | presentar que una región o colección resuelta carece de contenido para el alcance correspondiente |

Un error de consulta puede producir un Alert o patrón de recuperación, pero no un EmptyState de ausencia falsa.

Un EmptyState puede coexistir con información adicional cuando la semántica lo justifique, pero no utiliza Alert para fabricar la causa del vacío.

---

#### 26. Relación con contexto

Los patrones de contexto conservan propiedad separada:

| Necesidad               | Tarea propietaria |
| ----------------------- | ----------------- |
| indicador de contexto   | `SHELL-UI-006`    |
| selector de sede        | `SHELL-UI-007`    |
| selector de área        | `SHELL-UI-008`    |
| aviso de rol simulado   | `SHELL-UI-009`    |
| diagnóstico de contexto | `SHELL-UI-015`    |

Por tanto, un caso como:

```text
No hay sede activa
```

no se transforma automáticamente en EmptyState.

Cuando la sede o área es condición material de operación, el propietario de contexto debe resolverla o explicar el bloqueo conforme a su contrato.

---

#### 27. Accesibilidad

La implementación futura deberá cumplir como mínimo:

1. `title` visible y presente en el árbol accesible;
2. `description`, cuando exista, asociada de forma comprensible al mensaje principal;
3. icono decorativo fuera del nombre accesible;
4. significado no dependiente de icono, color, ilustración o posición;
5. acción con semántica nativa correcta;
6. foco visible en controles contenidos;
7. ausencia de foco añadido al contenedor por defecto;
8. ausencia de movimiento de foco automático por aparecer;
9. ausencia de `role="alert"` universal;
10. ausencia de `aria-live` universal;
11. atributos ARIA explícitos transferibles cuando el cambio dinámico deba anunciarse;
12. reflow con zoom y texto largo;
13. lectura comprensible sin CSS;
14. orden DOM coherente: mensaje, explicación y acción;
15. no ocultar información esencial detrás de hover o tooltip.

Si un estado vacío aparece como resultado inmediato de una búsqueda dinámica y debe anunciarse, la semántica de anuncio corresponde al propietario que conoce la interacción. El componente base no impone una región viva a todas las instancias.

---

#### 28. Estructura lógica

La estructura conceptual mínima es:

```text
EmptyState
├─ icon?        apoyo visual opcional
├─ title        mensaje principal obligatorio
├─ description? explicación opcional
└─ action?      control compuesto opcional
```

La implementación física podrá introducir wrappers internos siempre que no convierta su estructura interna en API accidental ni altere el orden semántico observable sin tratamiento de compatibilidad.

No se crean slots adicionales para:

- eyebrow;
- badge;
- footer;
- secondaryAction;
- tertiaryAction;
- dismiss;
- help link;
- telemetry metadata;
- diagnostics;
- filters;
- pagination.

Si un patrón compuesto necesita esas regiones, su tarea propietaria debe definirlas.

---

#### 29. Contrato visual

La evidencia legacy comparte una intención visual centrada y de baja jerarquía:

- columna vertical;
- alineación centrada;
- separación entre piezas;
- padding interno;
- texto secundario atenuado;
- icono pequeño opcional en algunas superficies.

La implementación futura deberá conservar:

1. reconocimiento claro de la región vacía;
2. jerarquía inferior a una alerta crítica;
3. legibilidad y contraste;
4. espacio suficiente sin desperdiciar pantalla operativa;
5. reflow sin anchuras rígidas;
6. soporte de texto largo;
7. acción claramente diferenciada del mensaje;
8. ausencia de ilustración obligatoria;
9. ausencia de animación obligatoria;
10. compatibilidad con el contrato visual de `@vento/ui-web`.

No se congelan como API:

- `padding: 24px`;
- `gap: 8px`;
- icono de `28px`;
- color de marca actual;
- clases `.ui-empty*`;
- tokens concretos de consumidores.

---

#### 30. Densidad y superficies compactas

Un EmptyState puede vivir en una tabla administrativa, una región operativa enfocada o un panel amplio.

La tarea no introduce un prop `size` o `density` porque no existe evidencia suficiente para convertir esa diferencia de composición en API propia.

El layout propietario conserva responsabilidad sobre:

- espacio disponible;
- densidad de la pantalla;
- ancho de la región;
- padding externo;
- colocación dentro de tabla o grid;
- responsive.

El componente debe adaptarse sin fijar una altura mínima excesiva que convierta una tabla compacta en una pantalla vacía de gran tamaño.

---

#### 31. Frontera server/client

El contrato base de `EmptyState` no requiere:

- estado React interno;
- hooks;
- efectos;
- `window`;
- `document`;
- storage;
- timers;
- listeners;
- red;
- router;
- sesión.

Por tanto:

```text
EmptyState puro
→ SERVER-SAFE conceptualmente
```

Un consumidor puede pasar dentro de `action` un control interactivo compatible con su propia frontera de cliente.

Esa composición no convierte automáticamente todo `@vento/ui-web` en client-only.

---

#### 32. Frontera con datos y Supabase

`EmptyState` no consulta datos.

Quedan prohibidos dentro del componente base:

- `.from(...)`;
- `.rpc(...)`;
- `.auth`;
- clientes Supabase;
- hooks de fetch;
- lectura de caché de dominio;
- interpretación de errores del proveedor;
- conteos remotos;
- detección de filtros mediante URL;
- lectura de cookies;
- resolución de RLS.

La secuencia correcta es:

```text
propietario de datos
→ consulta y valida alcance
→ clasifica resultado
→ determina perfil vacío
→ produce copy seguro
→ compone acción autorizada
→ EmptyState
```

---

#### 33. Frontera de autorización

`EmptyState` no decide:

- quién puede ver una colección;
- quién puede crear;
- quién puede limpiar una restricción;
- quién puede autoasignarse trabajo;
- qué sede puede consultar;
- qué área aplica;
- qué recurso existe;
- si una denegación debe revelar existencia.

El componente recibe únicamente la proyección que la capa propietaria ya decidió mostrar.

Ocultar una acción dentro de EmptyState tampoco constituye protección de servidor.

---

#### 34. Seguridad y privacidad

El estado vacío puede convertirse en canal lateral si revela hechos sobre información no visible.

Reglas:

1. no mostrar conteos de elementos ocultos;
2. no decir `No tienes acceso a 4 registros` salvo contrato explícito que autorice revelar el conteo;
3. no distinguir `existe pero no puedes verlo` cuando esa existencia sea sensible;
4. no incluir IDs internos, SQL, payloads o errores técnicos;
5. no inferir ausencia global desde una proyección minimizada;
6. no usar diferencias visuales para revelar que existe contenido detrás del masking;
7. no registrar automáticamente el contenido visible en telemetría desde el componente base;
8. no transportar secretos en acciones o iconos;
9. no usar CSS oculto como mecanismo de privacidad;
10. no convertir un `0` derivado de permisos en hecho empresarial global.

---

#### 35. Reconciliación del EmptyState local de NEXO

La función local localizada en `vento-nexo/src/app/page.tsx` se clasifica como `CANDIDATO_LOCAL_A_MIGRAR`, no como API compartida adoptada íntegramente.

Decisión por rasgo:

| Rasgo actual                                       | Decisión canónica                                                                            |
| -------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `title` requerido                                  | conservar                                                                                    |
| `description` requerida localmente                 | convertir en opcional                                                                        |
| icono `sparkles` fijo                              | no conservar como default; convertir en `icon?`                                              |
| `cta?: string`                                     | no incorporar                                                                                |
| `href?: string`                                    | no incorporar                                                                                |
| Link interno                                       | no incorporar al componente base                                                             |
| `action?` genérico                                 | incorporar como composición                                                                  |
| `.ui-empty-state`                                  | compatibilidad legacy, no API pública                                                        |
| uso para ausencia real                             | elegible para migración                                                                      |
| uso para `Sin permiso de abastecimiento`           | no migrar como vacío sin reclasificar                                                        |
| uso para `Selecciona una sede` operativa requerida | no migrar como vacío sin reclasificar                                                        |
| uso para `Sin movimientos recientes`               | elegible si consulta y alcance están confirmados                                             |
| uso para `No hay acciones inmediatas`              | elegible únicamente si el propietario demuestra cero acciones reales para ese actor/contexto |

La tarea no modifica NEXO.

---

#### 36. Reconciliación de `.ui-empty-state`

La clase legacy `.ui-empty-state` aparece como patrón visual distribuido.

Su estructura CSS actual no se convierte en contrato estable.

Correspondencia conceptual de migración:

| Legacy                                   | Contrato futuro                                             |
| ---------------------------------------- | ----------------------------------------------------------- |
| bloque `.ui-empty-state` con texto único | `EmptyState title={...}` si la semántica es realmente vacío |
| heading + texto secundario               | `title` + `description`                                     |
| SVG decorativo                           | `icon` opcional                                             |
| enlace/botón adyacente                   | `action` compuesto                                          |
| clase de padding/gap/color               | implementación visual interna futura                        |

No se autoriza reemplazo masivo por coincidencia de clase. Cada uso debe clasificarse primero por causa semántica.

---

#### 37. Reconciliación de `.ui-empty`

La clase `.ui-empty` representa una variante legacy más ligera, normalmente texto centrado sin la composición completa.

No se crea un segundo componente `EmptyText`.

Decisión:

```text
.ui-empty
→ CANDIDATO A EmptyState title-only
→ solo después de clasificar semántica y contexto
```

Algunos usos pueden permanecer como texto local si su región no amerita una superficie compartida completa. La migración no debe inflar visualmente todos los mensajes mínimos por obligación.

La decisión final por uso pertenece al inventario y lotes de `SHELL-MIG-*`.

---

#### 38. Reconciliación ORIGO

La evidencia actual aporta dos casos relevantes.

##### 38.1. Proveedores

La superficie distingue:

```text
allRows.length === 0
→ "Sin proveedores"

allRows.length > 0 AND filtered.length === 0
→ "Sin resultados"
```

Esta distinción es coherente con el contrato canónico de causa de vacío.

La acción `Nuevo proveedor` solo aparece cuando la colección base está vacía y el actor tiene capacidad de gestión, lo cual constituye evidencia positiva para la regla de acción opcional ya autorizada.

##### 38.2. Órdenes de compra

La superficie aplica filtros antes de obtener `orders`, pero cuando `orders.length === 0` utiliza un único mensaje equivalente a ausencia base y ofrece crear una orden.

Ese uso no se adopta como contrato compartido porque un filtro puede producir cero resultados sin demostrar que la colección global esté vacía.

Durante migración deberá clasificarse:

```text
sin filtros + colección realmente vacía
→ vacío base

filtros activos + cero resultados
→ vacío filtrado
```

UI005 documenta la diferencia; no modifica ORIGO.

---

#### 39. Reconciliación FOGO

El editor de pasos de receta utiliza actualmente:

```text
.ui-empty-state
→ "Sin pasos definidos."
```

Ese caso representa una colección local resuelta y puede mapearse conceptualmente a:

```text
EmptyState
  title="Sin pasos definidos."
```

No demuestra necesidad de:

- icono obligatorio;
- descripción obligatoria;
- acción obligatoria;
- variante específica;
- router.

Por ello refuerza la decisión de mantener mínima la API.

La tarea no modifica FOGO.

---

#### 40. Reconciliación VISO

VISO contiene múltiples usos del patrón ligero `.ui-empty` para regiones administrativas y conserva estilos legacy de la familia compartida.

Un ejemplo actual de colección vacía utiliza un mensaje equivalente a:

```text
No hay negocios configurados.
```

mientras los errores de consulta se muestran mediante una superficie de error separada.

Esto confirma que:

1. un EmptyState puede ser title-only;
2. error y vacío deben permanecer separados;
3. no toda ausencia necesita icono, descripción o acción;
4. el patrón compartido debe poder integrarse en superficies administrativas densas sin imponer composición excesiva.

La tarea no modifica VISO.

---

#### 41. Migración futura

La adopción física pertenece a `SHELL-MIG-001..008`.

Secuencia mínima:

```text
inventariar usos .ui-empty y .ui-empty-state
→ localizar componentes locales equivalentes
→ clasificar causa semántica de cada uso
→ separar error, bloqueo, permiso y contexto
→ confirmar perfil vacío propietario
→ materializar EmptyState en @vento/ui-web
→ probar package
→ migrar por consumidor
→ validar copy, privacidad, filtros y accesibilidad
→ demostrar paridad
→ retirar legacy únicamente con evidencia
```

Cada uso deberá registrar al menos:

- repositorio;
- superficie;
- estado actual;
- causa real;
- alcance;
- si existe filtro;
- si existe acción;
- si esa acción está autorizada;
- si el vacío puede revelarse al actor;
- componente/clase actual;
- destino de migración;
- prueba de paridad;
- rollback.

---

#### 42. Handoffs exactos de migración

| Necesidad                                                   | Propietario     |
| ----------------------------------------------------------- | --------------- |
| inventario ejecutable de usos y componentes                 | `SHELL-MIG-001` |
| lotes reversibles por repositorio                           | `SHELL-MIG-002` |
| compatibilidad temporal y bloqueo de nuevos legacy          | `SHELL-MIG-003` |
| evitar que el scaffold siga propagando clases/código legacy | `SHELL-MIG-004` |
| adopción del componente compartido                          | `SHELL-MIG-005` |
| accesibilidad, tema y comportamiento responsive             | `SHELL-MIG-006` |
| paridad por consumidor                                      | `SHELL-MIG-007` |
| retiro de clases, funciones y copias legacy                 | `SHELL-MIG-008` |

No se elimina ninguna clase, función ni uso actual en esta tarea.

---

#### 43. Compatibilidad y versionado

La materialización futura de `EmptyState` deberá respetar SemVer y la matriz de compatibilidad de `@vento/ui-web`.

Cambios potencialmente incompatibles incluyen:

- hacer obligatoria una propiedad antes opcional;
- retirar `title` o cambiar su semántica;
- cambiar el tipo aceptado por `action`;
- imponer router o runtime cliente;
- introducir un rol ARIA universal;
- cambiar el orden semántico de contenido de forma material;
- cambiar el tratamiento de atributos HTML;
- convertir icono opcional en obligatorio;
- introducir una taxonomía paralela que cambie qué estados se consideran válidos;
- cambiar CSS público si en el futuro se expone como contrato versionado.

La paridad semántica tiene precedencia sobre copiar píxeles de las clases legacy.

---

#### 44. Contrato futuro de prueba

Cuando exista implementación física, las pruebas del package y consumidores deberán demostrar como mínimo:

1. render con `title` solamente;
2. render con `title` y `description`;
3. render sin icono;
4. render con icono;
5. render sin acción;
6. render con acción compuesta;
7. acción Button conservando semántica propia;
8. acción Link conservando semántica de navegación;
9. atributos HTML compatibles transferidos;
10. atributos ARIA compatibles transferidos;
11. `className` aditivo;
12. ausencia de fallback textual inventado;
13. ausencia de `role="alert"` por defecto;
14. ausencia de `aria-live` por defecto;
15. ausencia de foco en el contenedor por defecto;
16. ausencia de movimiento de foco automático;
17. icono decorativo fuera del nombre accesible;
18. significado comprensible sin icono;
19. reflow con texto largo;
20. zoom sin recorte esencial;
21. SSR sin APIs de navegador;
22. composición dentro de cliente sin convertir la primitiva base en estado global;
23. ausencia de dependencia directa de Supabase;
24. ausencia de router dentro del componente base;
25. ausencia de llamadas de red;
26. ausencia de timers;
27. ausencia de persistencia;
28. ausencia de inferencia de permisos;
29. ausencia de inferencia de filtros;
30. vacío base únicamente después de resultado exitoso;
31. vacío filtrado sin afirmar ausencia global;
32. filtros visibles o comprensibles en la superficie propietaria;
33. error de consulta no convertido en EmptyState;
34. loading no convertido en EmptyState;
35. resultado parcial no convertido en EmptyState;
36. falta de permiso no convertida en colección vacía engañosa;
37. masking sin fuga de existencia o conteo;
38. ausencia de selección válida distinguida de contexto operativo obligatorio;
39. cola despejada únicamente con consulta completa y suficientemente fresca;
40. sin trabajo asignado sin creación o autoasignación no autorizada;
41. acción de primer registro solo para actor elegible;
42. migración de un uso `.ui-empty-state` verdadero;
43. migración de un uso `.ui-empty` title-only;
44. reclasificación de un uso legacy que en realidad sea error;
45. reclasificación de un uso legacy que en realidad sea permiso/contexto;
46. ORIGO proveedores conserva diferencia entre vacío base y filtrado;
47. ORIGO órdenes de compra no afirma ausencia global cuando hay filtros activos;
48. FOGO pasos conserva el estado simple sin icono obligatorio;
49. paridad de consumidor antes de retiro legacy;
50. rollback independiente de un consumidor sin afectar a los demás.

Esta sección define obligaciones futuras. No declara ejecución de esas pruebas dentro de `SHELL-UI-005`.

---

#### 45. Cobertura TREQ vigente consumida sin modificación

La tarea encuentra cobertura directa y suficiente en el Registro Canónico de Requisitos de Prueba vigente.

Coberturas materiales ya existentes incluyen:

- `TREQ-UX-037`: distingue sin tareas, bloqueos, permiso insuficiente, contexto y otros estados sin foco;
- `TREQ-UX-069`: prohíbe que estados vacíos revelen existencia, volumen o identidad de elementos ocultos;
- `TREQ-UX-072`: obliga a distinguir ausencia real, ausencia de trabajo para el actor, contexto faltante, falta de visibilidad, error de carga y proyección obsoleta;
- `TREQ-UX-074`: protege foco, árbol accesible y señales no dependientes de color/icono;
- `TREQ-UX-117`: exige inventariar y migrar estados vacíos y demás superficies legacy con rollback;
- `TREQ-UX-209`: exige reflow y conservación de contenido en superficies táctiles;
- `TREQ-UX-231`: exige estados de carga y vacío explícitos en tablas/grids;
- `TREQ-UX-379`: obliga a distinguir ausencia real, restricción de permiso, filtro activo y error de consulta en búsqueda;
- `TREQ-UX-961`: diferencia una colección autorizada sin resultados de una denegación o recurso fuera de alcance;
- `TREQ-UX-1007`: exige perfil vacío base por pantalla;
- `TREQ-UX-1008`: permite vacío solo tras consulta o inicialización autorizada y exitosa;
- `TREQ-UX-1009`: distingue vacío base, filtros sin coincidencias, ausencia de selección y cola despejada;
- `TREQ-UX-1010`: exige que el vacío filtrado conserve alcance/filtros y no afirme inexistencia global;
- `TREQ-UX-1011`: restringe el mensaje de cola despejada a una consulta completa, fresca y realmente sin pendientes;
- `TREQ-UX-1012`: impide usar ausencia de trabajo para autoasignación o ampliación de alcance;
- `TREQ-UX-1013`: restringe acciones de primer registro/configuración a acciones ya aprobadas;
- `TREQ-UX-1014`: separa ausencia de selección de recurso inexistente, eliminado o no autorizado;
- `TREQ-SHELL-002`: protege responsabilidades compartidas frente a copias manuales divergentes;
- `TREQ-SHELL-006`: exige pruebas del package y compatibilidad por consumidor;
- `TREQ-SHELL-007`: exige rollback independiente;
- `TREQ-SHELL-032`: exige reconciliar primitivas y kits antes de adopción o retiro;
- `TREQ-SHELL-035`: protege textos, etiquetas y significado consistente;
- `TREQ-SHELL-036` a `TREQ-SHELL-039`: gobiernan release, deprecación, compatibilidad y retiro de superficies públicas.

`SHELL-UI-005` especializa la implementación visual futura de obligaciones ya registradas. No detecta una obligación verificable nueva sin cobertura.

---

#### 46. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos descartados:** 0

**Justificación:** el registro vigente ya cubre de forma explícita la activación válida de un estado vacío, sus diferencias frente a error, bloqueo, falta de visibilidad, filtros, ausencia de selección, cola despejada, ausencia de trabajo, acciones de primer registro, privacidad, accesibilidad, migración, compatibilidad y rollback. Esta tarea define la primitiva visual que deberá materializar esas obligaciones sin crear una regla de riesgo transversal adicional.

No corresponde modificar el registro modular en este corte.

---

#### 47. Estado de materialización física

Al cierre documental de `SHELL-UI-005`:

```text
IDENTIDAD EmptyState                         = ESPECIFICADA
EmptyStateProps                              = ESPECIFICADO CONCEPTUALMENTE
title                                        = REQUERIDO
description                                  = OPCIONAL
icon                                         = OPCIONAL
action                                       = OPCIONAL Y COMPUESTO POR CONSUMIDOR
variant / kind                               = NO CREADOS
cta / href propios                           = NO CREADOS
SEMÁNTICA DE VACÍO                           = PROPIEDAD DEL CONTRATO DE PANTALLA/DOMINIO
ERROR / BLOQUEO / PERMISO                    = FUERA DEL CONTRATO BASE
CONTEXTO OPERATIVO REQUERIDO                 = FUERA DEL CONTRATO BASE
ACCESIBILIDAD                                = ESPECIFICADA DOCUMENTALMENTE
FRONTERA SERVER/CLIENT                       = ESPECIFICADA
RECONCILIACIÓN LEGACY                        = CERRADA DOCUMENTALMENTE
PACKAGE FÍSICO                               = NO MATERIALIZADO
COMPONENTE FÍSICO COMPARTIDO                 = NO MATERIALIZADO
CONSUMIDORES MIGRADOS                        = 0
LEGACY RETIRADO                              = 0
CAMBIOS SUPABASE / SQL / DATOS               = 0
CAMBIOS TREQ                                 = 0
```

La definición documental no implica publicación, instalación ni adopción runtime.

---

#### 48. Handoffs obligatorios

| Handoff                             | Propietario                                          | Condición de salida                                                    |
| ----------------------------------- | ---------------------------------------------------- | ---------------------------------------------------------------------- |
| implementación física de EmptyState | `SHELL-CI-*` aplicables bajo el gate correspondiente | componente materializado conforme al contrato aprobado                 |
| pruebas del package                 | `SHELL-CI-001`                                       | suite ejecutable de la primitiva                                       |
| build independiente                 | `SHELL-CI-002`                                       | artefacto construible sin acoplamiento accidental                      |
| release versionado                  | `SHELL-CI-003`                                       | versión inmutable y trazable                                           |
| matriz de compatibilidad            | `SHELL-CI-005`                                       | consumidores afectados demostrados                                     |
| actualización por PR                | `SHELL-CI-006`                                       | adopción explícita por repositorio                                     |
| inventario de usos legacy           | `SHELL-MIG-001`                                      | `.ui-empty`, `.ui-empty-state` y componentes equivalentes clasificados |
| lotes reversibles                   | `SHELL-MIG-002`                                      | rollback por consumidor                                                |
| compatibilidad legacy               | `SHELL-MIG-003`                                      | nuevos usos no gobernados bloqueados                                   |
| scaffold sin copia legacy           | `SHELL-MIG-004`                                      | plantilla deja de propagar implementación duplicada                    |
| migración por aplicación            | `SHELL-MIG-005`                                      | EmptyState compartido adoptado donde corresponda                       |
| accesibilidad y tema                | `SHELL-MIG-006`                                      | experiencia validada por aplicación                                    |
| paridad                             | `SHELL-MIG-007`                                      | semántica, visual, filtros, acciones y accesibilidad demostradas       |
| retiro legacy                       | `SHELL-MIG-008`                                      | cero usos residuales aprobados para retiro y rollback disponible       |
| indicador de contexto               | `SHELL-UI-006`                                       | mantiene contexto visible sin convertirlo en EmptyState                |
| selector de sede                    | `SHELL-UI-007`                                       | selección contextual mantiene autoridad fuera de EmptyState            |
| selector de área                    | `SHELL-UI-008`                                       | selección contextual mantiene autoridad fuera de EmptyState            |
| diagnóstico de contexto             | `SHELL-UI-015`                                       | contexto faltante o inválido tiene tratamiento propietario             |
| error recuperable                   | `SHELL-UI-016`                                       | fallos de carga y recuperación permanecen separados del vacío          |

No queda un pendiente material sin propietario documental.

---

#### 49. Decisiones vinculantes

1. El componente compartido se denomina `EmptyState`.
2. `EmptyState` pertenece a `@vento/ui-web`.
3. La tarea es documental y no materializa código.
4. Los símbolos conceptuales son `EmptyState` y `EmptyStateProps`.
5. No se inventa subpath físico ni mapa de exports.
6. `title` es requerido.
7. `description` es opcional.
8. `icon` es opcional.
9. No existe icono global obligatorio.
10. `sparkles` no se convierte en default canónico.
11. `action` es opcional y se compone por el consumidor.
12. No se incorporan `cta` ni `href` como props propias.
13. EmptyState no incorpora router.
14. EmptyState no incorpora `variant`, `kind` ni `status`.
15. La causa semántica de vacío pertenece al contrato propietario.
16. EmptyState no deduce la causa desde `length === 0`.
17. Un vacío base requiere ausencia confirmada dentro del alcance resuelto.
18. Un vacío filtrado no afirma inexistencia global.
19. Los filtros y alcance permanecen comprensibles en la superficie propietaria.
20. Ausencia de selección puede ser vacío solo cuando sea una selección legítima de contenido dentro de una pantalla ya resuelta.
21. Sede, área, turno, check-in, actor o permiso faltantes no se convierten automáticamente en EmptyState.
22. Una cola solo se declara despejada con consulta completa y suficientemente fresca.
23. Ausencia de trabajo del actor no significa ausencia global.
24. EmptyState no crea ni autoasigna trabajo.
25. Error de carga no es EmptyState.
26. Loading no es EmptyState.
27. Resultado parcial no es EmptyState.
28. Resultado desconocido no es EmptyState.
29. Denegación de permiso no es colección vacía.
30. Recurso fuera de alcance no se presenta como vacío engañoso.
31. El componente no revela existencia o conteo de elementos ocultos.
32. El componente no genera copy de dominio.
33. No se inventa texto fallback cuando falta `title`.
34. El root es no interactivo por defecto.
35. No se fuerza `role="alert"`.
36. No se fuerza `aria-live`.
37. No se mueve foco por defecto.
38. Atributos HTML y ARIA compatibles pueden transferirse.
39. El contrato no exige `use client`.
40. EmptyState debe poder renderizarse server-safe.
41. El componente no depende directamente de Supabase.
42. El componente no consulta datos ni permisos.
43. El componente no persiste estado ni crea timers.
44. EmptyState puede componerse dentro de Card sin depender de Card.
45. EmptyState puede contener Button sin absorber su contrato.
46. EmptyState y Alert mantienen responsabilidades distintas.
47. `.ui-empty-state` es legacy a clasificar y migrar, no API pública perpetua.
48. `.ui-empty` es candidato ligero y no crea un segundo componente compartido.
49. La implementación local de NEXO queda reconciliada, no adoptada íntegramente.
50. Los usos NEXO de permiso y sede requieren reclasificación antes de migrar.
51. ORIGO proveedores aporta una distinción válida entre vacío base y filtrado.
52. ORIGO órdenes requiere distinguir filtros antes de afirmar ausencia base durante migración.
53. FOGO demuestra que title-only es un caso válido.
54. VISO demuestra que superficies administrativas pueden necesitar una representación compacta.
55. No se eliminan clases ni componentes legacy en esta tarea.
56. La migración será progresiva y reversible.
57. La paridad exigirá semántica correcta, no solo similitud visual.
58. No se realizan cambios de Supabase, SQL, datos, configuración o repositorios consumidores.
59. Se crean 0 requisitos de prueba y se modifican 0.
60. `SHELL-UI-006` permanece reservada y no se desarrolla aquí.

---

#### 50. Criterios de aceptación documental

`SHELL-UI-005` queda documentalmente cerrada únicamente si se cumplen simultáneamente:

- [x] la aprobación local de `SHELL-UI-004` se reconoce como base inmediata frente al drift remoto de una tarea;
- [x] la ruta normal confirma que `SHELL-UI-005` sigue a `SHELL-UI-004`;
- [x] `SHELL-UI-006` permanece como única siguiente tarea;
- [x] `EmptyState` tiene identidad única;
- [x] se define una API conceptual mínima sin acoplamiento a router;
- [x] `title` queda requerido;
- [x] `description`, `icon` y `action` quedan opcionales;
- [x] se eliminan del contrato compartido `cta` y `href` específicos del candidato NEXO;
- [x] no se inventa un enum paralelo de causas de vacío;
- [x] se establece una condición de entrada que exige resolución exitosa suficiente;
- [x] se distingue vacío base de vacío filtrado;
- [x] se distingue ausencia de selección válida de contexto operativo requerido;
- [x] se distingue cola despejada de resultado parcial, stale o desconocido;
- [x] se distingue ausencia de trabajo del actor de ausencia global;
- [x] error, loading, bloqueo y denegación quedan fuera del contrato base;
- [x] se evita revelar existencia de información oculta mediante el estado vacío;
- [x] se conserva una acción opcional solo cuando sea real y autorizada;
- [x] se separan EmptyState, Card, Alert, Button y patrones de contexto/error;
- [x] se reconcilian el componente NEXO, `.ui-empty-state` y `.ui-empty`;
- [x] se materializa la decisión sobre los usos NEXO semánticamente mezclados;
- [x] se materializa la diferencia ORIGO entre vacío base y filtrado;
- [x] se preserva un caso simple title-only como FOGO/VISO;
- [x] se especifica accesibilidad mínima;
- [x] se especifica contrato futuro de prueba;
- [x] migración, paridad, compatibilidad y retiro tienen propietarios exactos;
- [x] no se modifican aplicaciones ni estilos actuales;
- [x] no se ejecutan cambios físicos;
- [x] el registro vigente ya cubre de forma explícita los riesgos de EmptyState;
- [x] se declaran 0 cambios de requisitos con justificación concreta;
- [x] no queda un pendiente material sin propietario documental.

Resultado:

```text
EMPTYSTATE COMPARTIDO                  = ESPECIFICADO
API CONCEPTUAL                         = CERRADA
TITLE                                  = REQUERIDO
DESCRIPTION / ICON / ACTION            = OPCIONALES
ROUTER PROPIO                          = NO
TAXONOMÍA PARALELA DE VACÍO            = NO
FRONTERA VACÍO VS ERROR/BLOQUEO        = CERRADA
FRONTERA VACÍO VS CONTEXTO/PERMISO     = CERRADA
PRIVACIDAD DEL ESTADO VACÍO            = CERRADA
RECONCILIACIÓN LEGACY                  = CERRADA DOCUMENTALMENTE
IMPLEMENTACIÓN FÍSICA                  = NO MATERIALIZADA
MIGRACIÓN                              = NO EJECUTADA
CAMBIOS TREQ                           = 0
SIGUIENTE TAREA                        = SHELL-UI-006
```

---

#### 51. Límites

Esta tarea no autoriza:

- crear o modificar el package físico `@vento/ui-web`;
- crear archivos TypeScript del package;
- crear un componente runtime en SHELL;
- modificar NEXO, FOGO, ORIGO, VISO, PULSO o NUMERA;
- cambiar `globals.css` de consumidores;
- retirar `.ui-empty` o `.ui-empty-state`;
- retirar la función local `EmptyState` de NEXO;
- cambiar mensajes de dominio en consumidores;
- cambiar filtros o queries;
- modificar permisos;
- modificar autenticación;
- resolver contexto de sede o área;
- implementar el indicador de contexto;
- implementar selectores de sede o área;
- implementar diagnóstico de contexto;
- implementar estados de error recuperable;
- crear un router dentro de EmptyState;
- crear taxonomía paralela de perfiles vacíos;
- crear un sistema de iconos;
- publicar una versión;
- configurar registry;
- crear workflows;
- ejecutar cambios de Supabase;
- ejecutar SQL o migraciones;
- modificar datos;
- modificar requisitos de prueba;
- iniciar `SHELL-UI-006`.

---

#### 52. Continuidad

**ÚLTIMA TAREA APROBADA**

```text
SHELL-UI-004 — Compartir Card
```

**TAREA ACTUAL APROBADA**

```text
SHELL-UI-005 — Compartir EmptyState
```

**SIGUIENTE TAREA RESERVADA**

```text
SHELL-UI-006 — Compartir indicador de contexto
```

No se inicia `SHELL-UI-006` en esta tarea.


### ✅ SHELL-UI-006 — Compartir indicador de contexto

**Estado:** APROBADA

**Tarea anterior:** `SHELL-UI-005 — Compartir EmptyState`

**Tarea siguiente:** `SHELL-UI-007 — Compartir selector de sede`

**Tipo de tarea:** Documental

**Bloque:** H — Fundación compartida

**Paquete propietario:** `@vento/ui-web`

**Naturaleza:** definición documental de un componente compartido de presentación para representar contexto ya resuelto. No materializa código, no resuelve autoridad, no cambia contexto y no migra consumidores.

---

#### 1. Propósito

Definir el contrato canónico de un indicador de contexto compartido para que las superficies web de Vento OS puedan mostrar de forma consistente, compacta, perceptible y accesible el contexto efectivo que una capa propietaria ya resolvió.

El componente deberá permitir que una persona pueda reconocer, cuando aplique a su superficie:

- actor efectivo;
- carril o alcance de trabajo;
- aplicación;
- sede activa o cobertura administrativa;
- área activa;
- turno o jornada;
- check-in;
- rol efectivo;
- dispositivo o estación cuando afecten la interpretación;
- estado de simulación cuando corresponda a la composición superior;
- frescura o validez de la proyección;
- territorio del recurso cuando deba compararse con el contexto activo.

La regla central es:

```text
CONTEXTO AUTORITATIVO YA RESUELTO
        ↓
PROYECCIÓN HUMANA Y MINIMIZADA
        ↓
ContextIndicator
        ↓
REPRESENTACIÓN VISUAL
```

Y queda prohibida la dirección inversa:

```text
ContextIndicator
        ✕
RESOLVER CONTEXTO
        ✕
CREAR AUTORIDAD
        ✕
MODIFICAR SEDE, ÁREA, TURNO O ROL
```

---

#### 2. Posición dentro de la secuencia compartida

`SHELL-UI-006` define exclusivamente la representación compartida del contexto ya resuelto.

Las responsabilidades vecinas permanecen separadas:

| Tarea          | Responsabilidad conservada                                                   |
| -------------- | ---------------------------------------------------------------------------- |
| `SHELL-UI-007` | selección compartida de sede                                                 |
| `SHELL-UI-008` | selección compartida de área                                                 |
| `SHELL-UI-009` | aviso compartido de rol simulado                                             |
| `SHELL-UI-010` | evaluación del AppShell compartido y ubicación sistémica de piezas de chrome |
| `SHELL-UI-015` | diagnóstico compartido de contexto                                           |
| `SHELL-UI-017` | patrón compartido para tablet                                                |
| `SHELL-UI-018` | patrón compartido para kiosco                                                |
| `SHELL-UI-020` | traspaso entre aplicaciones                                                  |

La existencia de `ContextIndicator` no adelanta ni sustituye ninguna de esas tareas.

---

#### 3. Dependencias documentales consumidas

La definición consume, sin reemplazar:

- `SHELL-UI-001 — Crear @vento/ui-web`;
- `SHELL-UI-002 — Compartir Alert`;
- `SHELL-UI-003 — Compartir Button`;
- `SHELL-UI-004 — Compartir Card`;
- `SHELL-UI-005 — Compartir EmptyState`;
- `UX-BASE-005 — Mantener visible sede, área, turno y rol activos`;
- la arquitectura compartida de autorización y contexto;
- los contratos compartidos de autorización vigentes;
- la frontera vigente de `@vento/os-context`;
- las reglas de accesibilidad, privacidad, reflow, contexto, simulación y dispositivos compartidos ya aprobadas;
- el gobierno de paquetes compartidos, compatibilidad, deprecación y retiro;
- la estrategia posterior de migración coordinada de consumidores web.

Estas fuentes aportan la semántica del contexto. `SHELL-UI-006` aporta únicamente su representación visual reutilizable.

---

#### 4. Naturaleza de la tarea

La tarea es documental.

Al cierre se define:

1. identidad del componente;
2. responsabilidad y límites;
3. superficie pública conceptual;
4. estados visuales de contexto;
5. forma de recibir contenido humano ya resuelto;
6. relación con contexto operativo y alcance administrativo;
7. frontera con selectores y cambios autoritativos;
8. frontera con simulación y diagnóstico;
9. semántica HTML y accesibilidad;
10. comportamiento responsive;
11. compatibilidad server/client;
12. dependencias permitidas y prohibidas;
13. reconciliación de evidencia runtime y template;
14. estrategia posterior de adopción;
15. contrato futuro de pruebas;
16. cobertura de requisitos existente.

No se crea el componente físico en esta tarea.

---

#### 5. Resultado documental

Se aprueba el componente conceptual:

```text
ContextIndicator
```

como parte de:

```text
@vento/ui-web
```

Su función es representar un resumen compacto, humano y accesible de contexto efectivo o alcance aplicable ya calculado por capas propietarias.

No es:

- resolver de contexto;
- selector de sede;
- selector de área;
- selector de rol;
- selector de turno;
- switcher de aplicación;
- guard de autorización;
- evaluador de permiso;
- diagnóstico técnico;
- alerta completa de contexto inválido;
- mecanismo de simulación;
- AppShell;
- menú de perfil.

---

#### 6. Identidad pública conceptual

La superficie conceptual queda formada por:

```text
ContextIndicator
ContextIndicatorProps
ContextIndicatorState
ContextIndicatorItem
```

Esta tarea no fija:

- subpath físico de exportación;
- estructura de carpetas del package;
- mapa de exports;
- herramienta de estilos;
- nombre de archivo TypeScript;
- framework de documentación visual;
- implementación interna.

Esas decisiones pertenecen a la materialización física y gobierno del package.

---

#### 7. Frontera de presentación

`ContextIndicator` recibe exclusivamente una proyección de presentación ya resuelta.

Puede representar información que el consumidor haya determinado como segura y relevante, pero no puede averiguar por sí mismo:

- quién es el actor;
- cuál es la sede activa;
- cuál es el área activa;
- cuál es el turno efectivo;
- si existe check-in;
- cuál rol tiene autoridad;
- si una simulación es válida;
- si el dispositivo permite una operación;
- si un permiso aplica;
- si el contexto está dentro del territorio del recurso;
- si una mutación debe habilitarse;
- si un contexto puede cambiar.

El componente presenta decisiones. No produce decisiones.

---

#### 8. Superficie conceptual de props

La API conceptual mínima se congela como:

```text
state: ContextIndicatorState
stateLabel: string
items: readonly ContextIndicatorItem[]
```

Además podrá conservar atributos HTML compatibles del contenedor raíz, con las restricciones de accesibilidad y semántica definidas en esta tarea.

No se abre una prop genérica `context`.

No se abre una prop `effectiveContext`.

No se abre una prop `accessContext` que convierta al componente visual en consumidor directo del contrato autoritativo.

No se abre una colección de booleanos de autorización.

---

#### 9. `ContextIndicatorState`

Los estados conceptuales quedan cerrados como:

```text
resolving
active
changing
stale
invalid
unavailable
```

Correspondencia semántica:

| Estado UI     | Estado conceptual de contexto | Intención de presentación                                                                                              |
| ------------- | ----------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `resolving`   | `RESOLVING`                   | la proyección todavía se está resolviendo y no puede afirmarse como activa                                             |
| `active`      | `ACTIVE`                      | la capa propietaria confirmó una proyección vigente para mostrar                                                       |
| `changing`    | `CHANGING`                    | existe una transición de contexto en curso y el nuevo contexto aún no debe presentarse como confirmado                 |
| `stale`       | `STALE`                       | la proyección conocida perdió frescura suficiente para requerir advertencia o limitación definida fuera del componente |
| `invalid`     | `INVALID`                     | la proyección contiene una incompatibilidad o dimensión obligatoria inválida                                           |
| `unavailable` | `UNAVAILABLE`                 | no puede obtenerse una proyección suficiente para la superficie                                                        |

Los nombres son estados de presentación. No son permisos, receipts ni resultados empresariales.

---

#### 10. Estados que no pertenecen a `ContextIndicatorState`

No se incorporan como estados del componente:

```text
success
warning
danger
error
blocked
denied
offline
online
simulated
delegated
admin
operational
shared_device
loading
```

Razones:

- `blocked` y `denied` corresponden a la semántica de impedimentos, no a la frescura del contexto;
- conectividad es una dimensión independiente y no se reduce a la validez contextual;
- simulación y delegación son condiciones del contexto, no estados de frescura;
- carril administrativo u operativo describe intención y alcance, no salud del contexto;
- `loading` es demasiado genérico frente a `resolving`;
- `error` colapsaría `invalid` y `unavailable` en una única causa ambigua.

---

#### 11. `stateLabel`

`stateLabel` es texto humano obligatorio aportado por el consumidor o capa de integración.

Su función es impedir que el estado dependa solo de:

- color;
- icono;
- borde;
- animación;
- opacidad;
- posición.

Ejemplos conceptuales admisibles, sin congelar copy literal global:

```text
active       → contexto vigente
resolving    → contexto en resolución
changing     → cambio en curso
stale        → contexto pendiente de actualización
invalid      → contexto inconsistente
unavailable  → contexto no disponible
```

La implementación futura no deberá hardcodear una única frase no localizable como contrato universal.

---

#### 12. `ContextIndicatorItem`

Cada elemento del resumen se define conceptualmente como:

```text
label: string
value: string
```

`label` expresa la semántica humana de la dimensión.

`value` expresa el valor ya resuelto y minimizado que puede mostrarse.

Ejemplos válidos de intención:

```text
Sede activa        → Centro de Producción
Área activa        → Repostería
Rol operativo      → Bodeguero
Turno              → Jornada vigente
Check-in           → Iniciado
Cobertura          → Región Centro
Periodo            → Agosto 2026
Aplicación         → NEXO
```

Los ejemplos ilustran forma, no obligan a que todas las superficies muestren todas las dimensiones.

---

#### 13. Decisión de no crear un enum de dimensiones

No se crea una taxonomía pública paralela como:

```text
site
area
role
shift
checkin
actor
device
scope
```

como requisito estructural dentro de `ContextIndicatorItem`.

Motivo:

1. la semántica autoritativa de cada dimensión ya pertenece a contratos de contexto y UX;
2. un enum visual duplicado podría divergir de esos contratos;
3. aplicaciones administrativas y operativas requieren combinaciones distintas;
4. `NUMERA`, por ejemplo, necesita entidad, periodo y alcance financiero sin fabricar un contexto operativo;
5. el componente debe ser presentación, no nuevo esquema transversal de autoridad.

La capa propietaria conserva la responsabilidad de seleccionar las dimensiones correctas y etiquetarlas inequívocamente.

---

#### 14. Orden de los elementos

`ContextIndicator` conserva el orden entregado por el consumidor.

No reordena dimensiones por nombres, valores, tipos o heurísticas.

La composición deberá aplicar la jerarquía aprobada para su superficie. Como regla general, cuando aplique a operación material, la prioridad conceptual es:

1. inconsistencia o cambio de contexto;
2. sede y área efectivas;
3. rol efectivo;
4. turno y check-in;
5. actor, dispositivo o estación cuando sean necesarios;
6. información secundaria de alcance o frescura.

El componente no infiere esa prioridad a partir del contenido textual.

---

#### 15. Contenido seguro y humano

Los valores ordinarios del indicador no utilizarán como contenido principal:

- UUID;
- identificadores internos de empleado;
- códigos de permiso;
- nombres de tablas;
- nombres de schemas;
- nombres de RPC;
- nombres de columnas;
- claves de cookie;
- nombres de variables de entorno;
- códigos técnicos de sesión;
- identificadores de check-in sin traducción humana;
- `navigation_role`;
- `effective_role` como literal técnico;
- `site_id` o `area_id` como sustituto del nombre humano cuando exista una etiqueta autorizada.

Un identificador técnico necesario para soporte pertenece al diagnóstico restringido, no al resumen ordinario.

---

#### 16. Contexto operativo

En una superficie operativa, el consumidor puede construir el resumen con las dimensiones que el proceso exija, por ejemplo:

```text
sede activa
área activa
rol operativo
turno
check-in
estación
actor
territorio del recurso
```

Reglas:

1. una sede asignada no se presenta como activa por el solo hecho de estar asignada;
2. una sede primaria no se presenta como activa por defecto;
3. un área elegible no se presenta como activa si no fue resuelta como tal;
4. un turno programado no equivale a turno vigente;
5. un horario publicado no equivale a check-in;
6. un rol base no se transforma en rol operativo por presentación;
7. un dispositivo no se presenta como actor humano;
8. el indicador no habilita una acción por mostrar un contexto aparentemente válido.

---

#### 17. Alcance administrativo

En una superficie administrativa, el indicador no fabricará contexto operativo.

Puede representar, cuando corresponda:

```text
empresa o entidad
cobertura administrativa
periodo
población
rol base
estado de la proyección
```

Un filtro administrativo debe identificarse como filtro o alcance de consulta cuando sea necesario para evitar confusión.

Queda prohibido presentar:

```text
Filtro: Sede Norte
```

como si significara:

```text
Sede activa: Sede Norte
```

si la persona no está operando materialmente bajo esa sede.

---

#### 18. Sede y área

`ContextIndicator` no posee props específicas `siteId`, `site`, `areaId` o `area`.

La decisión evita que el componente:

- resuelva nombres;
- consulte maestros;
- aplique fallbacks;
- interprete una selección como autoridad;
- convierta un filtro en contexto activo.

La capa propietaria transforma el contexto autoritativo en pares humanos `label/value` antes de renderizar.

La selección y cambio de sede permanecen en `SHELL-UI-007`.

La selección y cambio de área permanecen en `SHELL-UI-008`.

---

#### 19. Rol

El componente no recibe un único `role` ambiguo como contrato privilegiado.

La capa propietaria decide qué rol es relevante y lo etiqueta humanamente como corresponda, diferenciando cuando aplique:

- rol base;
- rol operativo;
- rol simulado;
- delegación;
- rol utilizado únicamente para navegación.

El componente no decide cuál concede autoridad.

No existe una prop `isAdmin`.

No existe una prop `canOperate`.

No existe una prop `bypassApplied`.

---

#### 20. Turno y check-in

Turno y check-in permanecen dimensiones diferentes.

El indicador no deriva una de la otra.

No se incorporan props como:

```text
isOnShift
isCheckedIn
hasActiveWork
```

porque reducirían estados autoritativos distintos a booleanos visuales ambiguos.

Si el turno o check-in son relevantes para la superficie, la capa propietaria aporta sus representaciones humanas como elementos independientes.

---

#### 21. Actor, dispositivo y estación

La presentación debe distinguir actor humano, dispositivo técnico y estación cuando la superficie los necesite.

Reglas:

- el nombre técnico del dispositivo no sustituye al actor;
- una estación compartida no hereda la identidad del actor anterior;
- el actor no se muestra mediante correo, teléfono o documento como identificador ordinario;
- el componente no conserva identidad entre renderizados por almacenamiento propio;
- la limpieza de sesión y actor corresponde a las capas de identidad y dispositivo;
- el indicador representa la proyección vigente que recibe.

---

#### 22. Simulación y delegación

`ContextIndicator` no crea props booleanas `isSimulated` o `isDelegated` como sustituto del contrato autoritativo.

Si una simulación o delegación modifica cómo debe interpretarse el contexto, la composición superior deberá mantenerla perceptible.

La advertencia compartida especializada de rol simulado pertenece a:

```text
SHELL-UI-009 — Compartir aviso de rol simulado
```

`ContextIndicator` puede coexistir con ese aviso, pero no lo absorbe ni lo reemplaza.

---

#### 23. Frescura

La frescura se representa mediante `state` y `stateLabel`, complementada por un elemento humano de última verificación únicamente cuando la capa propietaria determine que aporta información necesaria.

El componente no:

- inicia timers;
- calcula expiración;
- compara relojes;
- consulta conectividad;
- renueva sesión;
- extiende turnos;
- prolonga permisos;
- convierte caché en autoridad.

`stale` significa que la capa propietaria entregó una proyección marcada como obsoleta. No concede ni retira por sí mismo capacidad de acción.

---

#### 24. `resolving`

Durante `state="resolving"`:

- el estado textual permanece perceptible;
- los elementos ya conocidos pueden conservarse si siguen siendo seguros para mostrar;
- la ausencia de elementos no se interpreta como ausencia de contexto real;
- no se inventan valores provisionales;
- no se usa la última sede o rol como fallback visual autoritativo;
- el componente no dispara una resolución de datos.

La capa propietaria decide qué acciones quedan disponibles mientras resuelve.

---

#### 25. `active`

`state="active"` solo representa que la capa propietaria declaró vigente la proyección suministrada.

No implica:

```text
autorizado = true
permiso = concedido
recurso = editable
mutación = permitida
turno = abierto por inferencia
check-in = válido por inferencia
```

Una acción material conserva su evaluación autoritativa en el servidor o capa propietaria correspondiente.

---

#### 26. `changing`

`state="changing"` representa una transición autoritativa en curso.

Regla vinculante:

```text
selección solicitada
≠
contexto nuevo confirmado
```

Mientras el cambio no tenga resultado autoritativo:

- el componente no presenta el destino solicitado como nuevo contexto activo;
- puede conservar el contexto anterior identificado como tal cuando la capa propietaria lo decida;
- el estado de transición debe ser perceptible;
- no se autoriza una actualización optimista que fabrique autoridad.

---

#### 27. `stale`

`state="stale"` indica que la proyección conocida ya no cumple la frescura esperada.

El componente:

- la distingue visual y textualmente de `active`;
- no la elimina automáticamente;
- no la convierte en `unavailable` sin decisión externa;
- no decide qué operaciones pueden continuar;
- no renueva el contexto por sí mismo.

La política de acción frente a contexto obsoleto pertenece a las capas propietarias de autorización, resiliencia y proceso.

---

#### 28. `invalid`

`state="invalid"` representa una incompatibilidad o dimensión obligatoria inválida ya detectada externamente.

El componente no calcula cuál dimensión falló.

La superficie propietaria deberá acompañar el indicador con la explicación o diagnóstico aplicable cuando la persona necesite conocer:

- qué dimensión es incompatible;
- qué permanece válido;
- qué acción queda bloqueada;
- cómo corregir o escalar.

La lógica detallada pertenece a las tareas de diagnóstico y recuperación, no a `ContextIndicator`.

---

#### 29. `unavailable`

`state="unavailable"` representa imposibilidad de obtener una proyección suficiente.

No equivale a:

- “sin datos”;
- “sin tareas”;
- “sin permisos”;
- “sin registros”;
- “sin sede asignada”;
- “usuario no autorizado”.

El indicador no sustituye una causa desconocida por un mensaje de vacío.

`EmptyState` permanece separado de esta semántica.

---

#### 30. Ausencia de fallbacks autoritativos

Quedan fuera del componente todos los fallbacks que puedan convertir conveniencia visual en autoridad.

No deberá inferir contexto desde:

- query parameters;
- URL;
- nombre de aplicación;
- último valor usado;
- storage del navegador;
- estado local no validado;
- una cookie no resuelta por la capa autoritativa;
- sede primaria;
- primera sede de una lista;
- área del dispositivo;
- rol por texto;
- presencia de un botón;
- permisos visibles en frontend.

El consumidor debe entregar valores ya resueltos.

---

#### 31. Decisión sobre `EffectiveContext`

La implementación runtime actual de la fundación contiene un tipo `EffectiveContext` utilizado por la capa de contexto existente.

`SHELL-UI-006` no lo adopta como prop pública de `ContextIndicator`.

Razones:

1. el componente visual no debe depender de la forma interna de un resolver;
2. esa forma contiene campos que no deben transformarse en autoridad visual por sí solos;
3. una presentación segura requiere minimización previa;
4. el contexto autoritativo y su proyección humana tienen ciclos de evolución distintos;
5. la fuente compartida de autorización vigente ya separa contratos canónicos, contexto runtime y decisión;
6. una API visual basada directamente en `EffectiveContext` acoplaría `@vento/ui-web` a una estructura que no debe convertirse en fuente canónica de autoridad.

Por tanto:

```text
EffectiveContext
        ↓ adaptación propietaria
ContextIndicatorItem[] + ContextIndicatorState
        ↓
ContextIndicator
```

No:

```text
ContextIndicator → interpretar EffectiveContext
```

---

#### 32. Relación con `AccessContext` y contratos compartidos

`ContextIndicator` tampoco reimplementa `AccessContext` ni `SimulationContext`.

Si una aplicación consume contratos canónicos de autorización o contexto, deberá resolverlos fuera del componente y entregar al indicador únicamente la proyección humana necesaria.

La API visual no crea una segunda fuente de verdad para:

- roles;
- scopes;
- decisiones de autorización;
- códigos de razón;
- simulación;
- dispositivo;
- permisos;
- territorialidad.

---

#### 33. Dependencia con `@vento/os-context`

El contrato de `ContextIndicator` no exige una dependencia runtime directa hacia `@vento/os-context`.

La integración esperada es:

```text
@vento/contracts/authorization
        +
@vento/os-context
        +
capa propietaria de aplicación
        ↓
proyección humana segura
        ↓
@vento/ui-web / ContextIndicator
```

Esto preserva la dirección de dependencias y permite que el componente permanezca puramente presentacional.

Una materialización futura podrá reutilizar tipos compartidos solo si existe una identidad canónica aprobada y compatible, sin duplicar autoridad ni introducir acoplamiento circular.

---

#### 34. Dependencias prohibidas

`ContextIndicator` no dependerá directamente de:

- `@vento/supabase`;
- cliente Supabase;
- RPC;
- tablas;
- schemas;
- cookies de autenticación;
- resolvers de permisos;
- APIs de negocio;
- repositorios de aplicación;
- router de una aplicación concreta;
- variables secretas;
- servicios de red;
- observabilidad como fuente de render;
- lógica de dominio.

Tampoco ejecutará mutaciones.

---

#### 35. Semántica HTML

El componente utiliza conceptualmente un contenedor no interactivo.

La estructura recomendada es equivalente a:

```text
contenedor
  estado humano
  lista descriptiva
    término
    valor
```

Una implementación física podrá usar semántica equivalente a `div` y `dl/dt/dd` para relacionar etiquetas y valores cuando resulte apropiado.

No se impone un landmark global por defecto.

No se impone `role="status"` universalmente.

No se impone `aria-live` universalmente.

---

#### 36. Razón para no imponer una live region universal

Los cambios de contexto pueden ser materiales, pero no toda re-renderización del resumen debe producir un anuncio repetitivo.

La tarea conserva dos obligaciones simultáneas:

1. los cambios materiales deben poder anunciarse de forma accesible;
2. la interfaz no debe generar ruido constante que impida continuar.

Por ello `ContextIndicator` mantiene estructura y texto accesibles, mientras la composición propietaria decide cuándo un cambio necesita anuncio y con qué prioridad.

Los bloqueos críticos y movimientos de foco pertenecen al patrón de diagnóstico o recuperación correspondiente.

---

#### 37. Foco y teclado

`ContextIndicator` no es interactivo por defecto.

Por tanto:

- no entra automáticamente en el orden de tabulación;
- no recibe `tabIndex=0` por contrato;
- no roba foco cuando cambia el estado;
- no mueve foco al renderizar;
- no implementa atajos de teclado;
- no convierte todo el resumen en botón;
- no abre selectores al pulsarlo.

Si una superficie necesita una acción para ampliar detalles o cambiar contexto, esa acción se compone mediante el control propietario correspondiente y conserva semántica de Button o Link.

---

#### 38. Accesibilidad mínima

La implementación futura deberá conservar como mínimo:

1. relación perceptible entre cada etiqueta y su valor;
2. estado textual, no dependiente solo de color o icono;
3. orden de lectura lógico;
4. reflow sin pérdida de dimensiones relevantes;
5. contraste suficiente;
6. contenido legible con zoom;
7. ausencia de foco artificial en contenido estático;
8. compatibilidad con atributos `aria-*` válidos del contenedor cuando el consumidor necesite etiquetar la región;
9. ausencia de información crítica únicamente en tooltip o hover;
10. compatibilidad con lector de pantalla mediante estructura semántica ordinaria;
11. posibilidad de que la composición superior anuncie cambios materiales;
12. ausencia de datos técnicos o privados como sustituto del lenguaje humano.

---

#### 39. `className`, `style` y atributos nativos

La superficie podrá conservar atributos compatibles de un `HTMLDivElement` cuando la implementación física los admita.

`className` y `style` no autorizan:

- ocultar el estado;
- ocultar una dimensión obligatoria de la superficie;
- convertir `stale` en apariencia equivalente a `active`;
- hacer que `invalid` dependa únicamente del color;
- fabricar un selector;
- convertir el resumen entero en control interactivo;
- ocultar una simulación obligatoria en la composición;
- romper contraste, reflow o lectura accesible.

Las extensiones repetidas que alteren el contrato deberán evaluarse como evolución del package.

---

#### 40. Decisión sobre `children`

`children` no se utiliza como extensión libre del cuerpo de `ContextIndicator` en esta definición.

El contenido principal se expresa mediante:

```text
state
stateLabel
items
```

La decisión evita que cada consumidor inserte estructuras incompatibles, selectores, botones o bloques de negocio dentro del componente y vuelva a fragmentar el patrón compartido.

Controles o avisos adicionales se componen como hermanos o dentro del patrón superior correspondiente.

---

#### 41. Decisión sobre iconos

No se crea una prop pública obligatoria de icono por dimensión ni por estado.

La implementación física puede usar iconografía decorativa internamente si mejora percepción, pero:

- el texto conserva significado completo;
- el icono no sustituye `stateLabel`;
- un icono de sede no demuestra que la sede esté activa;
- un icono de advertencia no sustituye diagnóstico;
- los consumidores no deberán acoplar lógica al icono renderizado.

---

#### 42. Decisión sobre variantes visuales

No se crea una prop `variant` o `tone` independiente.

La presentación de salud contextual deriva de `state`.

No se admiten combinaciones como:

```text
state="active" + variant="danger"
state="invalid" + variant="success"
```

que permitirían contradicciones semánticas.

La marca, densidad y tokens pertenecen al sistema visual del package, no a una segunda taxonomía funcional.

---

#### 43. Responsive y persistencia

El componente debe poder participar en una representación persistente de contexto sin asumir por sí mismo la posición final dentro del AppShell.

Reglas de materialización:

- en escritorio puede compactarse horizontalmente;
- en tablet puede reorganizarse sin perder sede, área, rol o estado relevantes;
- en móvil puede pasar a varias líneas o resumen compacto accesible;
- en kiosco debe permitir una presentación permanente y legible del contexto exigido;
- no debe exigir scroll horizontal ordinario para leer el contexto mínimo;
- no debe depender de hover para revelar el valor principal;
- no debe ocultarse exclusivamente dentro del menú de perfil.

La decisión exacta de integración en chrome o AppShell permanece en `SHELL-UI-010`, y los patrones físicos de tablet/kiosco permanecen en `SHELL-UI-017` y `SHELL-UI-018`.

---

#### 44. Compatibilidad server/client

La lógica conceptual de `ContextIndicator` no requiere:

- estado React interno;
- efectos;
- `window`;
- `document`;
- storage;
- timers;
- router;
- red;
- sesión;
- listeners globales.

Por tanto el componente es conceptualmente server-safe.

Una aplicación puede actualizar sus props cuando resuelva o cambie contexto. Esa actualización no convierte al componente en propietario de la resolución.

No se exige `"use client"` como parte del contrato público.

---

#### 45. Relación con `Alert`

`Alert` y `ContextIndicator` tienen responsabilidades distintas.

```text
ContextIndicator
→ resumen persistente del contexto y su estado

Alert
→ mensaje contextual puntual o persistente de naturaleza informativa, éxito, advertencia o peligro
```

Una superficie puede componer ambos.

`ContextIndicator state="invalid"` no sustituye una explicación completa de bloqueo si la persona necesita saber qué corregir.

`Alert` tampoco debe reconstruir por sí mismo el contexto autoritativo.

---

#### 46. Relación con `EmptyState`

`ContextIndicator` no debe convertirse en `EmptyState` cuando falta contexto.

Separación:

```text
sin registros confirmados
→ EmptyState cuando el contrato de pantalla lo determine

contexto no resuelto / inválido / no disponible
→ ContextIndicator + patrón de explicación o diagnóstico aplicable
```

Una falla contextual no demuestra que no existan datos o trabajo.

---

#### 47. Relación con selectores de sede y área

El indicador no contiene selectores.

La composición futura podrá presentar, según autoridad y diseño aprobados:

```text
ContextIndicator
+
SiteSelector
+
AreaSelector
```

pero la selección no cambia el valor mostrado como activo antes de la confirmación autoritativa.

`SHELL-UI-007` y `SHELL-UI-008` deberán conservar esta frontera.

---

#### 48. Relación con aviso de rol simulado

Una simulación material no debe desaparecer por compactación del contexto.

Sin embargo, el aviso especializado pertenece a `SHELL-UI-009`.

La composición prevista es:

```text
ContextIndicator
+
SimulatedRoleNotice
```

cuando la superficie deba comunicar ambos.

No se incorpora una variante `simulated` al indicador.

---

#### 49. Relación con diagnóstico de contexto

`ContextIndicator` muestra el estado resumido.

`SHELL-UI-015` conserva la propiedad del diagnóstico compartido de contexto.

El indicador no expone:

- reason codes técnicos completos;
- causa interna;
- árbol de resolución;
- principal técnico;
- SQL;
- payload;
- stack;
- detalles de RLS;
- reglas de antifraude;
- permisos de terceros;
- secretos.

Cuando el contexto sea `invalid` o `unavailable`, el patrón superior decide si debe abrirse o mostrarse diagnóstico seguro.

---

#### 50. Relación con territorio del recurso

Algunas operaciones legítimas requieren comparar el contexto activo con el territorio del recurso.

`ContextIndicator` puede mostrar ambos valores si la capa propietaria ya determinó que son relevantes y seguros.

No los concilia ni corrige.

Ejemplo conceptual:

```text
Sede activa        → Satélite Norte
Destino del recurso → Centro de Producción
```

La existencia de dos territorios visibles no implica conflicto por sí sola; la interpretación pertenece al proceso propietario.

---

#### 51. Privacidad y minimización

El componente deberá recibir únicamente información necesaria para la finalidad de la superficie.

No deberá utilizar como identidad ordinaria:

- documento personal;
- correo electrónico;
- teléfono;
- token;
- identificador de sesión;
- identificador secreto del dispositivo;
- datos del actor anterior;
- información sensible no requerida para comprender la tarea.

La minimización ocurre antes de renderizar.

`ContextIndicator` no se convierte en un componente de masking de datos arbitrarios; no debe recibir datos que la persona no esté autorizada a conocer.

---

#### 52. Estado técnico actual de SHELL

El inventario directo del directorio local de primitivas de SHELL confirma cinco primitivas actuales:

```text
Button
Card
Chip
Input
Modal
```

No existe allí un candidato local dedicado denominado `ContextIndicator`.

`Chip` no se adopta como sustituto automático del indicador, porque:

- un chip es una primitiva visual genérica;
- el indicador requiere composición de múltiples dimensiones;
- el indicador tiene estados de frescura propios;
- el indicador exige fronteras explícitas con autoridad y contexto;
- una colección libre de chips no garantiza semántica, orden ni accesibilidad del resumen.

---

#### 53. Evidencia del template histórico

El template AppShell histórico contiene presentación de sede y perfil dentro de piezas de chrome y menú.

También mezcla responsabilidades que no deben trasladarse al componente compartido, entre ellas selección, navegación y lógica de contexto de aplicación.

Clasificación:

```text
FUENTE HISTÓRICA DE EVIDENCIA
≠
IMPLEMENTACIÓN CANÓNICA DE ContextIndicator
```

La presencia del template no demuestra adopción runtime por sí misma.

---

#### 54. Evidencia runtime en consumidores web

Se verificaron implementaciones actuales de `VentoChrome` en seis repositorios consumidores web existentes:

```text
NEXO
FOGO
ORIGO
VISO
PULSO
NUMERA
```

Las firmas locales ya muestran deriva de nombres para conceptos semejantes:

| Consumidor | Props observadas relacionadas con contexto                 |
| ---------- | ---------------------------------------------------------- |
| NEXO       | `activeWorkContextLabel`, `activeWorkContextDescription`   |
| FOGO       | `activeContextLabel`, `activeContextDetail`                |
| ORIGO      | `activeWorkContextLabel`, `activeWorkContextDescription`   |
| VISO       | `activeContextLabel`, `activeContextDescription`           |
| PULSO      | `operationalContextLabel`, `operationalContextDescription` |
| NUMERA     | `activeWorkContextLabel`, `activeWorkContextDescription`   |

Esta deriva confirma la necesidad de una superficie compartida estable, pero no autoriza adoptar ciegamente ninguna firma local.

---

#### 55. Reconciliación de patrones runtime

La familia observada se clasifica como evidencia legacy a migrar, no como API canónica.

| Rasgo observado                                 | Decisión                                              |
| ----------------------------------------------- | ----------------------------------------------------- |
| labels de contexto ya calculados                | conservar intención, normalizar mediante `items`      |
| descripciones ad hoc                            | no convertir en prop obligatoria del indicador        |
| sede activa dentro de chrome                    | conservar necesidad visual; autoridad permanece fuera |
| selectores dentro del chrome/menu               | separar hacia UI007/UI008                             |
| rol mostrado en perfil/chrome                   | conservar semántica humana; distinguir tipo de rol    |
| simulación local                                | separar aviso especializado hacia UI009               |
| `operatingGate` local                           | no incorporar al indicador                            |
| permisos y navegación dentro del chrome         | fuera del indicador                                   |
| query parameters usados en algunos consumidores | no aceptar como fuente autoritativa del indicador     |
| estilos `ui-chip` o equivalentes                | evidencia visual, no API pública                      |

---

#### 56. Por qué no se comparte `VentoChrome` desde esta tarea

`SHELL-UI-006` no comparte el chrome completo.

`VentoChrome` contiene responsabilidades superiores como:

- identidad de aplicación;
- navegación;
- app switcher;
- menú de perfil;
- selección de sede;
- layout global;
- permisos de navegación;
- gating de operación;
- responsive shell.

La evaluación de AppShell pertenece a `SHELL-UI-010`.

`ContextIndicator` debe poder existir dentro o fuera de una implementación futura de AppShell sin quedar acoplado a ella.

---

#### 57. Estrategia posterior de migración

La migración física no ocurre en `SHELL-UI-006`.

Los propietarios posteriores deberán:

1. consolidar el inventario real de consumidores y variantes;
2. asignar cada consumidor a un lote reversible;
3. bloquear nuevas dependencias sobre firmas legacy;
4. evitar que el scaffold histórico siga copiando implementaciones desfasadas;
5. migrar componente, chrome y estilos por aplicación;
6. verificar accesibilidad, tema, densidad y responsive;
7. comparar comportamiento antes y después;
8. retirar copias legacy solo después de demostrar ausencia de uso residual y rollback.

La adopción no será un reemplazo textual masivo de props con nombres similares.

---

#### 58. Handoff a migración coordinada

Responsabilidades de las tareas de migración:

| Tarea           | Handoff de `ContextIndicator`                                                           |
| --------------- | --------------------------------------------------------------------------------------- |
| `SHELL-MIG-001` | inventariar usos reales de contexto visible, chrome, headers, chips, menús y selectores |
| `SHELL-MIG-002` | crear lotes reversibles por repositorio                                                 |
| `SHELL-MIG-003` | compatibilidad temporal y bloqueo de nuevos consumidores legacy                         |
| `SHELL-MIG-004` | impedir que el scaffold replique el patrón histórico                                    |
| `SHELL-MIG-005` | adoptar `ContextIndicator` y composición compartida por aplicación                      |
| `SHELL-MIG-006` | verificar accesibilidad, tema, densidad, reflow y dispositivos                          |
| `SHELL-MIG-007` | demostrar paridad y comportamiento contractual                                          |
| `SHELL-MIG-008` | retirar únicamente copias sin consumidores residuales                                   |

No se adelanta ninguno de esos cambios.

---

#### 59. Compatibilidad y versionado

La futura superficie pública deberá gobernarse con SemVer.

Cambios potencialmente incompatibles incluyen:

- retirar un estado;
- renombrar un estado;
- cambiar significado de `active`, `stale`, `invalid` o `unavailable`;
- cambiar obligatoriedad de `stateLabel`;
- modificar la estructura de `ContextIndicatorItem`;
- permitir o retirar contenido interactivo dentro del indicador;
- cambiar la semántica HTML observable;
- introducir una dependencia runtime que afecte consumidores;
- cambiar el comportamiento accesible de los estados;
- convertir el componente en selector o resolver.

Una necesidad específica de un consumidor no se incorpora silenciosamente a la API común.

---

#### 60. Handoff a calidad y releases

La materialización futura conserva los propietarios ya definidos para paquetes compartidos:

| Tarea          | Responsabilidad                                      |
| -------------- | ---------------------------------------------------- |
| `SHELL-CI-001` | pruebas propias del package                          |
| `SHELL-CI-002` | build independiente                                  |
| `SHELL-CI-003` | releases versionados                                 |
| `SHELL-CI-004` | changelog                                            |
| `SHELL-CI-005` | matriz de compatibilidad                             |
| `SHELL-CI-006` | actualización controlada de consumidores mediante PR |

`SHELL-UI-006` define el contrato del componente; no publica una versión.

---

#### 61. Contrato futuro de prueba

La implementación física y su adopción deberán demostrar, como mínimo:

1. renderizado de `active`;
2. renderizado de `resolving`;
3. renderizado de `changing`;
4. renderizado de `stale`;
5. renderizado de `invalid`;
6. renderizado de `unavailable`;
7. `stateLabel` perceptible en todos los estados;
8. relación semántica entre cada label y value;
9. preservación del orden recibido;
10. renderizado con cero elementos cuando el estado lo permita sin inventar contexto;
11. renderizado con varias dimensiones;
12. conservación de valores conocidos durante resolución cuando el consumidor los aporte;
13. ausencia de fallback automático a sede primaria;
14. ausencia de inferencia desde URL o query parameters;
15. ausencia de inferencia desde storage;
16. ausencia de inferencia desde nombre de aplicación;
17. ausencia de dependencia directa de Supabase;
18. ausencia de consulta de red dentro del componente;
19. ausencia de autorización dentro del componente;
20. ausencia de selectores embebidos;
21. ausencia de `canOperate` como fuente de presentación autoritativa;
22. separación entre rol base y operativo cuando el consumidor los muestre;
23. separación entre sede activa y filtro administrativo;
24. separación entre turno y check-in;
25. separación entre actor humano y dispositivo;
26. `changing` sin presentar el destino solicitado como confirmado antes del resultado propietario;
27. `stale` distinguible de `active` sin depender solo de color;
28. `invalid` distinguible de `unavailable`;
29. ausencia de `role="status"` o live region universal no justificada;
30. ausencia de foco automático en cambios ordinarios;
31. reflow en ancho reducido;
32. lectura con zoom;
33. contraste aplicable;
34. server rendering de la superficie pura;
35. ausencia de estado React interno obligatorio;
36. composición junto a Alert sin mezclar responsabilidades;
37. composición junto a aviso de simulación sin absorberlo;
38. composición junto a selectores sin que el valor solicitado se vuelva activo prematuramente;
39. preservación de privacidad y minimización;
40. paridad por consumidor antes de retirar su patrón legacy.

Esta lista define evidencia futura. No declara implementación ni ejecución de pruebas en `SHELL-UI-006`.

---

#### 62. Cobertura de requisitos existente

La tarea no necesita introducir una obligación transversal nueva porque el registro vigente ya cubre de forma específica:

- persistencia de contexto efectivo y prohibición de derivarlo desde frontend: `TREQ-UX-077`;
- separación entre asignación, selección, filtro, territorio y contexto activo: `TREQ-UX-078`;
- contenido mínimo humano del resumen contextual: `TREQ-UX-079`;
- separación de roles base, operativo, simulación, delegación y navegación: `TREQ-UX-080`;
- separación entre turno, jornada y check-in: `TREQ-UX-081`;
- tratamiento fail-closed cuando falta una dimensión: `TREQ-UX-082`;
- transición autoritativa de cambio de contexto: `TREQ-UX-083`;
- invalidación ante cambios materiales: `TREQ-UX-084`;
- comparación con territorio del recurso: `TREQ-UX-085`;
- separación de cobertura administrativa y contexto operativo: `TREQ-UX-086`;
- singularidad del contexto activo: `TREQ-UX-087`;
- dispositivos compartidos y actor humano: `TREQ-UX-088`;
- reconstrucción y revalidación cross-app: `TREQ-UX-089`;
- perceptibilidad persistente en distintos dispositivos: `TREQ-UX-090`;
- accesibilidad del contexto: `TREQ-UX-091`;
- estados de frescura: `TREQ-UX-092`;
- minimización y privacidad: `TREQ-UX-093`;
- tratamiento de contexto ausente, en resolución o inválido: `TREQ-UX-094`;
- trazabilidad del cambio material: `TREQ-UX-095`;
- migración y retiro de patrones legacy: `TREQ-UX-096`;
- contexto visible en tablets y kioscos compartidos: `TREQ-UX-216`;
- lenguaje humano diferenciado para contexto y roles: `TREQ-UX-308`;
- permanencia visible de contexto, estado y frescura: `TREQ-UX-183`;
- clasificación y reconciliación de componentes compartidos: `TREQ-SHELL-002`, `TREQ-SHELL-029`, `TREQ-SHELL-030`, `TREQ-SHELL-031`, `TREQ-SHELL-032` y `TREQ-SHELL-035`;
- versionado, compatibilidad, deprecación y retiro: `TREQ-SHELL-036` a `TREQ-SHELL-039`;
- separación entre contratos canónicos, contexto runtime y presentación: `TREQ-SHELL-043`.

`SHELL-UI-006` especializa cómo estas obligaciones se aplican al componente de presentación sin crear una regla material nueva.

---

#### 63. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos descartados:** 0

La cobertura canónica vigente ya contempla la semántica, seguridad, accesibilidad, frescura, privacidad, migración y compatibilidad necesarias para el indicador de contexto. Esta tarea únicamente fija la API visual y sus fronteras dentro de esa cobertura existente.

---

#### 64. Estado de materialización física

Al cierre documental de `SHELL-UI-006`:

```text
IDENTIDAD ContextIndicator                 = ESPECIFICADA
ContextIndicatorProps                      = ESPECIFICADO CONCEPTUALMENTE
ContextIndicatorState                      = 6 ESTADOS ESPECIFICADOS
ContextIndicatorItem                       = ESPECIFICADO CONCEPTUALMENTE
FRONTERA PRESENTACIÓN / AUTORIDAD           = CERRADA
FRONTERA CONTEXTO OPERATIVO / ADMINISTRATIVO= CERRADA
FRONTERA INDICADOR / SELECTORES             = CERRADA
FRONTERA INDICADOR / SIMULACIÓN             = CERRADA
FRONTERA INDICADOR / DIAGNÓSTICO            = CERRADA
ACCESIBILIDAD                               = ESPECIFICADA DOCUMENTALMENTE
COMPATIBILIDAD SERVER/CLIENT                = ESPECIFICADA
RECONCILIACIÓN DE EVIDENCIA LEGACY          = CERRADA DOCUMENTALMENTE
PACKAGE FÍSICO                              = NO MATERIALIZADO
COMPONENTE FÍSICO                           = NO MATERIALIZADO
CONSUMIDORES MIGRADOS                       = 0
IMPLEMENTACIONES LEGACY RETIRADAS           = 0
CAMBIOS TREQ                                = 0
```

La definición documental no implica publicación, instalación ni adopción runtime.

---

#### 65. Decisiones vinculantes

1. El componente compartido se denomina `ContextIndicator`.
2. Pertenece a `@vento/ui-web`.
3. La tarea es documental y no materializa código.
4. La superficie conceptual incluye `ContextIndicator`, `ContextIndicatorProps`, `ContextIndicatorState` y `ContextIndicatorItem`.
5. No se fija un subpath físico ni mapa de exports.
6. `ContextIndicator` representa contexto ya resuelto; no lo resuelve.
7. `state` es obligatorio.
8. `stateLabel` es obligatorio y humano.
9. `items` contiene dimensiones ya resueltas y minimizadas.
10. Cada item contiene `label` y `value` textuales.
11. No se crea un enum visual paralelo de dimensiones de autoridad.
12. El orden de items lo determina y conserva el consumidor.
13. Los estados son `resolving`, `active`, `changing`, `stale`, `invalid` y `unavailable`.
14. No se crea un estado `blocked` dentro del indicador.
15. No se crea un estado `denied` dentro del indicador.
16. No se crea un estado `offline` dentro del indicador.
17. No se crea una variante `simulated` del indicador.
18. No se crea una variante administrativa u operativa.
19. No se crea una prop `variant` o `tone` independiente.
20. El estado no depende únicamente del color o icono.
21. El componente no recibe `siteId` o `areaId` como API específica.
22. El componente no recibe un `role` ambiguo como fuente de autoridad.
23. El componente no recibe `isOnShift`, `isCheckedIn` o `canOperate` como booleanos autoritativos.
24. El componente no recibe `bypassApplied`.
25. El componente no adopta `EffectiveContext` como prop pública.
26. El componente no reimplementa `AccessContext` ni `SimulationContext`.
27. El contrato no exige dependencia runtime directa de `@vento/os-context`.
28. La proyección humana se construye antes de entrar a `@vento/ui-web`.
29. El componente no depende directamente de `@vento/supabase`.
30. El componente no consulta red, tablas, RPC ni storage.
31. El componente no modifica sede, área, turno o rol.
32. El componente no contiene selector de sede.
33. El componente no contiene selector de área.
34. El componente no contiene selector de rol.
35. La selección solicitada no se presenta como contexto activo antes de confirmación propietaria.
36. El componente distingue contexto operativo de alcance administrativo mediante el contenido humano aportado.
37. Un filtro administrativo no se presenta como sede operativa activa.
38. Turno y check-in permanecen dimensiones distintas.
39. Actor, dispositivo y estación permanecen identidades distintas.
40. La simulación material se mantiene visible mediante la composición propietaria y UI009.
41. `stale` no prolonga permisos ni turnos.
42. `invalid` no diagnostica la causa por sí mismo.
43. `unavailable` no se convierte en EmptyState.
44. El componente no usa fallbacks desde URL, query, storage, último valor, sede primaria o primera opción.
45. La raíz es conceptualmente no interactiva.
46. No se impone un landmark universal.
47. No se impone `role="status"` universal.
48. No se impone `aria-live` universal.
49. El componente no entra al tab order por defecto.
50. El componente no mueve foco por sí mismo.
51. `children` no se usa como extensión libre del cuerpo.
52. No se crea API obligatoria de iconos.
53. El componente es conceptualmente server-safe.
54. El contrato no exige `"use client"`.
55. SHELL no posee actualmente un candidato dedicado `ContextIndicator` dentro de sus cinco primitivas locales inventariadas.
56. `Chip` no se adopta como sustituto del indicador.
57. El template es evidencia histórica, no implementación canónica.
58. Las seis implementaciones `VentoChrome` runtime revisadas contienen deriva de nombres de contexto.
59. Ninguna implementación local se adopta íntegramente como API común.
60. La migración se realiza posteriormente por lotes reversibles y por consumidor.
61. El retiro legacy exige evidencia de ausencia de uso residual.
62. La calidad y release quedan bajo las tareas `SHELL-CI-*` propietarias.
63. Se crean 0 requisitos de prueba y se modifican 0.
64. `SHELL-UI-007` permanece reservada y no se desarrolla en esta tarea.

---

#### 66. Criterios de aceptación documental

`SHELL-UI-006` queda documentalmente cerrada únicamente si se cumplen simultáneamente:

- [x] la continuidad real apunta de `SHELL-UI-005` a `SHELL-UI-006`;
- [x] `SHELL-UI-007` permanece reservada;
- [x] existe una identidad única para el componente;
- [x] se fija su pertenencia a `@vento/ui-web`;
- [x] se separa presentación de resolución de contexto;
- [x] se fija una API conceptual mínima;
- [x] se fijan seis estados de presentación;
- [x] se distingue frescura de bloqueo, denegación, conectividad y simulación;
- [x] se evita adoptar `EffectiveContext` como autoridad visual;
- [x] se evita duplicar `AccessContext` o `SimulationContext`;
- [x] se separa sede activa de sede asignada, primaria, seleccionada o filtrada;
- [x] se separa área activa de área elegible o filtrada;
- [x] se separan turno y check-in;
- [x] se separan rol base, rol operativo y simulación;
- [x] se separan actor, dispositivo y estación;
- [x] se prohíben fallbacks permisivos;
- [x] se separa contexto operativo de alcance administrativo;
- [x] se separa indicador de selectores;
- [x] se separa indicador de aviso de simulación;
- [x] se separa indicador de diagnóstico;
- [x] se preserva privacidad y minimización;
- [x] se especifica semántica HTML no interactiva;
- [x] se especifica accesibilidad mínima;
- [x] se evita una live region universal ruidosa;
- [x] se especifica reflow y compatibilidad con dispositivos;
- [x] se especifica server-safety;
- [x] se reconcilia el estado local de primitivas de SHELL;
- [x] se reconcilia la evidencia del template;
- [x] se reconcilian seis implementaciones runtime observadas de `VentoChrome`;
- [x] se asigna la migración a tareas propietarias posteriores;
- [x] se asignan pruebas, build, release y compatibilidad a tareas propietarias;
- [x] no se modifica código, Supabase, consumidores o configuración;
- [x] se declaran 0 cambios TREQ con cobertura existente concreta;
- [x] no queda una decisión material de esta tarea sin propietario.

Resultado documental:

```text
INDICADOR DE CONTEXTO COMPARTIDO     = ESPECIFICADO
ESTADOS DE PRESENTACIÓN              = 6 CERRADOS
API CONCEPTUAL                       = CERRADA
AUTORIDAD                            = FUERA DEL COMPONENTE
SELECTORES                           = FUERA DEL COMPONENTE
SIMULACIÓN                           = AVISO SEPARADO
DIAGNÓSTICO                          = PATRÓN SEPARADO
IMPLEMENTACIÓN FÍSICA                = NO MATERIALIZADA
MIGRACIÓN                            = NO EJECUTADA
CAMBIOS TREQ                         = 0
SIGUIENTE TAREA                      = SHELL-UI-007
```

---

#### 67. Límites

Esta tarea no autoriza:

- crear o modificar el package físico `@vento/ui-web`;
- crear archivos TypeScript del componente;
- modificar primitivas locales de SHELL;
- modificar `VentoChrome` en consumidores;
- modificar `ProfileMenu`;
- modificar el template histórico;
- retirar código legacy;
- publicar una versión;
- modificar `@vento/os-context`;
- modificar contratos de autorización;
- modificar resolución de contexto;
- modificar autenticación o permisos;
- modificar cookies;
- modificar navegación;
- modificar Supabase;
- crear migraciones SQL;
- modificar datos;
- cambiar RLS;
- crear selectores de sede o área;
- crear el aviso de rol simulado;
- crear diagnóstico de contexto;
- iniciar migración de consumidores;
- modificar requisitos de prueba;
- iniciar `SHELL-UI-007`.

---

#### 68. Continuidad

**ÚLTIMA TAREA APROBADA:** `SHELL-UI-005 — Compartir EmptyState`

**TAREA ACTUAL APROBADA:** `SHELL-UI-006 — Compartir indicador de contexto`

**SIGUIENTE TAREA RESERVADA:** `SHELL-UI-007 — Compartir selector de sede`

No se inicia `SHELL-UI-007` sin aprobación de `SHELL-UI-006`.


### ✅ SHELL-UI-007 — Compartir selector de sede

**Estado:** APROBADA

**Tarea anterior:** `SHELL-UI-006 — Compartir indicador de contexto`

**Tarea siguiente:** `SHELL-UI-008 — Compartir selector de área`

**Tipo de tarea:** Documental

**Bloque:** H — Fundación compartida

**Paquete propietario:** `@vento/ui-web`

**Naturaleza:** definición documental de un control compartido para solicitar un cambio de sede sin convertir la selección visual, una cookie, una preferencia o un valor del cliente en contexto operativo autoritativo. No materializa código, no ejecuta cambios de contexto, no modifica Supabase y no migra consumidores.

---

#### 1. Propósito

Definir el contrato canónico del selector de sede compartido para que las superficies web de Vento OS puedan ofrecer una forma consistente, accesible y segura de solicitar un cambio de sede cuando la capa propietaria determine que esa transición está disponible.

La regla central es:

```text
SEDE CONFIRMADA POR CONTEXTO AUTORITATIVO
        ↓
SiteSelector
        ↓
PERSONA SOLICITA OTRA SEDE
        ↓
INTENCIÓN DE CAMBIO
        ↓
CAPA PROPIETARIA VALIDA Y CONFIRMA
        ↓
NUEVO CONTEXTO RESUELTO EN SERVIDOR
        ↓
ContextIndicator PUBLICA LA NUEVA SEDE ACTIVA
```

Queda prohibida esta interpretación:

```text
persona selecciona opción
        ↓
frontend cambia activeSiteId
        ↓
cookie / query / preferencia
        ↓
SEDE ACTIVA AUTORITATIVA
```

`SiteSelector` solicita una transición. No produce autoridad.

---

#### 2. Posición dentro de la secuencia compartida

`SHELL-UI-007` define exclusivamente el control compartido de solicitud de sede.

Las responsabilidades vecinas permanecen separadas:

| Tarea          | Responsabilidad conservada                                                    |
| -------------- | ----------------------------------------------------------------------------- |
| `SHELL-UI-006` | representar el contexto ya confirmado                                         |
| `SHELL-UI-008` | compartir selector de área                                                    |
| `SHELL-UI-009` | compartir aviso de rol simulado                                               |
| `SHELL-UI-010` | evaluar AppShell compartido y composición sistémica del chrome                |
| `SHELL-UI-014` | compartir confirmaciones de acciones sensibles cuando el proceso las requiera |
| `SHELL-UI-015` | compartir diagnóstico de contexto                                             |
| `SHELL-UI-016` | compartir estados de error recuperable                                        |
| `SHELL-UI-017` | compartir patrón para tablet                                                  |
| `SHELL-UI-018` | compartir patrón para kiosco                                                  |
| `SHELL-UI-020` | compartir patrón de traspaso entre aplicaciones                               |

La existencia de `SiteSelector` no adelanta ni sustituye ninguna de esas tareas.

---

#### 3. Dependencias documentales consumidas

La definición consume, sin reemplazar:

- `SHELL-UI-001 — Crear @vento/ui-web`;
- `SHELL-UI-002 — Compartir Alert`;
- `SHELL-UI-003 — Compartir Button`;
- `SHELL-UI-006 — Compartir indicador de contexto`;
- `UX-BASE-005 — Mantener visible sede, área, turno y rol activos`;
- las reglas vigentes de contexto, autorización, territorialidad y dispositivos compartidos;
- las reglas vigentes de accesibilidad, privacidad, reflow, concurrencia y recuperación;
- el gobierno de paquetes compartidos, compatibilidad, deprecación y retiro;
- la estrategia posterior de migración coordinada de consumidores web.

`SHELL-UI-007` no redefine cómo se calcula una sede efectiva. Define cómo una persona solicita otra sede desde una superficie visual compartida sin romper la separación entre selección y autoridad.

---

#### 4. Naturaleza de la tarea

La tarea es documental.

Al cierre se define:

1. identidad del componente;
2. responsabilidad y límites;
3. superficie pública conceptual;
4. identidad de una opción de sede;
5. separación entre sede confirmada y sede solicitada;
6. estado de solicitud pendiente;
7. contrato del callback de cambio;
8. relación con validación autoritativa;
9. relación con `ContextIndicator`;
10. frontera con filtros administrativos;
11. frontera con selector de área;
12. semántica de ausencia de sede;
13. semántica HTML;
14. accesibilidad y teclado;
15. comportamiento responsive y táctil;
16. frontera client/server;
17. dependencias permitidas y prohibidas;
18. reconciliación del patrón legacy observado;
19. estrategia posterior de migración;
20. contrato futuro de pruebas;
21. cobertura de requisitos existente.

No se crea el componente físico en esta tarea.

---

#### 5. Resultado documental

Se aprueba el componente conceptual:

```text
SiteSelector
```

como parte de:

```text
@vento/ui-web
```

Su función es permitir que una persona elija una sede candidata y emita una solicitud de cambio hacia la capa propietaria.

No es:

- fuente de verdad de la sede activa;
- resolver de contexto;
- evaluador de elegibilidad;
- guard de autorización;
- selector administrativo genérico de filtros;
- selector de área;
- selector de rol;
- selector de turno;
- persistencia de preferencias;
- cliente Supabase;
- router;
- mecanismo de simulación;
- menú de perfil;
- AppShell.

---

#### 6. Identidad pública conceptual

La superficie conceptual queda formada por:

```text
SiteSelector
SiteSelectorProps
SiteSelectorOption
```

No se crea un `SiteSelectorState` público porque los estados necesarios pueden expresarse sin una taxonomía paralela mediante:

```text
confirmedSiteId
requestedSiteId
pending
disabled
```

Esta tarea no fija:

- subpath físico de exportación;
- estructura de carpetas del package;
- mapa de exports;
- nombre de archivo TypeScript;
- herramienta de estilos;
- framework de documentación visual;
- implementación interna.

---

#### 7. Superficie conceptual de props

La API conceptual mínima queda cerrada como:

```text
label: string
confirmedSiteId: string | null
requestedSiteId?: string
options: readonly SiteSelectorOption[]
onRequestChange: (siteId: string) => void
pending?: boolean
pendingLabel?: string
disabled?: boolean
placeholderLabel?: string
```

Además podrá conservar atributos nativos compatibles del control y su contenedor, con las restricciones definidas en esta tarea.

No se incorporan como props públicas:

```text
defaultSiteId
primarySiteId
lastSiteId
activeSiteId
canSwitchRole
canOperate
permissionCode
role
siteCookie
queryParam
supabaseClient
employeeId
```

La ausencia de esas props es intencional.

---

#### 8. `SiteSelectorOption`

Cada opción se define conceptualmente como:

```text
id: string
label: string
```

`id` es un identificador estable utilizado para emitir la intención de cambio.

`label` es el nombre humano que puede mostrarse a la persona.

El identificador:

- no se presenta como texto ordinario cuando existe etiqueta humana;
- no demuestra que la sede esté activa;
- no concede autorización;
- no sustituye revalidación de servidor;
- no debe derivarse del índice visual de la lista.

No se abre metadata genérica dentro de cada opción para evitar convertir el componente en un contenedor de reglas de negocio, roles, permisos o scopes.

---

#### 9. Significado de `options`

`options` contiene únicamente sedes que la capa propietaria decidió que pueden mostrarse como candidatas en esa superficie y momento.

Su presencia significa:

```text
VISIBLE COMO CANDIDATA DE CAMBIO
```

No significa:

```text
AUTORIZADA PARA TODA ACCIÓN
CAMBIO GARANTIZADO
SEDE OPERATIVA YA ACTIVA
PERMISO CONCEDIDO
```

La capa propietaria puede construir la colección utilizando asignaciones, contexto, dispositivo, proceso y reglas de divulgación aplicables.

El servidor o servicio autoritativo revalida la transición al ejecutarla porque elegibilidad, turnos, permisos, claims, custodia o configuración pueden haber cambiado después de renderizar la lista.

---

#### 10. Privacidad de las opciones

El selector no deberá recibir sedes que la persona no deba conocer.

La capa propietaria aplica antes del render:

- autorización de divulgación;
- minimización;
- territorialidad;
- restricciones de dispositivo;
- restricciones de proceso;
- masking cuando corresponda.

Ocultar una opción en la UI no reemplaza la autorización del servidor, y mostrar una opción tampoco concede autoridad.

No se utiliza una lista global de sedes seguida de deshabilitación visual como mecanismo de seguridad.

---

#### 11. `confirmedSiteId`

`confirmedSiteId` representa exclusivamente la sede que la capa propietaria entrega como confirmada para la semántica del selector.

Reglas:

1. no se infiere desde la URL;
2. no se infiere desde una cookie;
3. no se infiere desde `localStorage`;
4. no se infiere desde `employee_settings.selected_site_id`;
5. no se infiere desde la primera opción;
6. no se infiere desde la sede primaria;
7. no se infiere desde la última sede utilizada;
8. no se infiere desde el nombre de la aplicación;
9. no se infiere desde un rol privilegiado;
10. no se transforma en autorización por estar seleccionado visualmente.

Cuando sea `null`, significa únicamente que el consumidor no entregó una sede confirmada para el control. No autoriza a escoger silenciosamente una alternativa.

---

#### 12. `requestedSiteId`

`requestedSiteId` representa una sede elegida cuya transición todavía no debe tratarse como confirmada.

La separación obligatoria es:

```text
confirmedSiteId = contexto confirmado
requestedSiteId = destino solicitado todavía pendiente
```

Por tanto:

```text
requestedSiteId
≠
active site autoritativo
```

Durante una solicitud en curso, el control puede mostrar la opción candidata seleccionada siempre que su estado pendiente permanezca perceptible y `ContextIndicator` continúe reflejando la sede confirmada o el estado `changing` según la composición propietaria.

---

#### 13. Relación entre valor confirmado y valor solicitado

La representación controlada sigue esta regla conceptual:

```text
pending = false
→ el control representa confirmedSiteId

pending = true + requestedSiteId presente
→ el control puede representar requestedSiteId como solicitud en curso
→ la sede confirmada permanece siendo confirmedSiteId hasta receipt autoritativo
```

Cuando el cambio se confirma:

```text
confirmedSiteId = nueva sede confirmada
requestedSiteId = ausente
pending = false
```

Cuando el cambio se rechaza:

```text
confirmedSiteId = sede anterior o contexto resuelto vigente
requestedSiteId = ausente
pending = false
```

La capa propietaria es responsable de producir esos nuevos props.

---

#### 14. `onRequestChange`

`onRequestChange(siteId)` comunica una intención de cambio.

No significa:

```text
site changed
context changed
authorized
confirmed
saved
```

El callback no recibe ni devuelve autoridad.

El componente no exige que retorne `Promise`, receipt, decisión de autorización ni contexto completo. La capa propietaria coordina la transición y actualiza los props cuando exista resultado.

La elección del nombre `onRequestChange` es vinculante conceptualmente porque evita que `onChange` sea interpretado como confirmación de la sede activa.

---

#### 15. Secuencia autoritativa de cambio

La integración de `SiteSelector` debe respetar la secuencia canónica:

```text
SOLICITAR CAMBIO
→ VALIDAR ELEGIBILIDAD
→ REVISAR TRABAJO Y CUSTODIA PENDIENTES
→ CONFIRMAR EFECTO
→ RESOLVER NUEVO CONTEXTO EN SERVIDOR
→ INVALIDAR PROYECCIONES ANTERIORES
→ MOSTRAR NUEVO CONTEXTO
→ REANUDAR O REDIRIGIR
```

`SiteSelector` participa únicamente en:

```text
SOLICITAR CAMBIO
```

y en la presentación controlada de que esa solicitud está pendiente.

No implementa las etapas restantes.

---

#### 16. Prohibición de cambio optimista de autoridad

Queda prohibido que el componente convierta una selección local en sede confirmada antes del resultado autoritativo.

No se acepta este patrón:

```text
onRequestChange(next)
→ setActiveSiteId(next)
→ render "Sede activa: next"
→ luego intentar validar servidor
```

La forma válida es:

```text
onRequestChange(next)
→ marcar solicitud pendiente
→ conservar sede confirmada
→ resolver transición fuera del componente
→ publicar nueva sede solo después de confirmación
```

La interfaz puede mostrar el destino solicitado, pero no llamarlo activo antes del receipt.

---

#### 17. `pending`

`pending` expresa únicamente que existe una solicitud de cambio aún no resuelta.

No equivale a:

- contexto `ACTIVE`;
- autorización `ALLOW`;
- error;
- denegación;
- carga genérica de toda la pantalla;
- modo offline;
- simulación.

Cuando `pending=true`:

- debe existir una señal textual perceptible;
- `pendingLabel` deberá ser aportado cuando sea necesario para hacer comprensible el estado;
- no se emiten solicitudes equivalentes duplicadas desde el mismo control;
- el control no afirma que `requestedSiteId` sea la sede activa;
- la composición puede utilizar `ContextIndicator state="changing"`;
- las acciones incompatibles se gestionan fuera del componente.

---

#### 18. `pendingLabel`

`pendingLabel` expresa en lenguaje humano que existe una solicitud en curso.

No se congela un único copy global.

Ejemplos de intención, no de literal obligatorio:

```text
Cambio de sede en curso
Validando nueva sede
Esperando confirmación del contexto
```

El texto no debe afirmar éxito antes de que exista confirmación.

El componente no genera por sí mismo una causa técnica, razón de denegación ni mensaje de soporte.

---

#### 19. `disabled`

`disabled` representa indisponibilidad interactiva decidida por la capa propietaria o por el propio estado `pending` según la implementación física.

No significa:

```text
DENY
sin permisos
sin asignación
usuario inactivo
sede inválida
```

El componente no deduce la causa.

Cuando la causa necesite explicación, la composición usa el patrón de mensaje, bloqueo o diagnóstico correspondiente.

Un control deshabilitado nunca sustituye enforcement de servidor.

---

#### 20. Ausencia de una opción universal `Sin sede`

No se crea una opción canónica automática:

```text
Sin sede
```

como destino seleccionable.

Motivos:

1. una superficie operativa puede exigir sede obligatoria;
2. `null` puede significar contexto todavía no resuelto, no una elección válida;
3. un contexto administrativo sin sede operativa no es equivalente a limpiar una sede activa;
4. una opción de vaciado podría convertirse en bypass territorial;
5. el patrón legacy actual no demuestra que ese destino sea válido contractualmente.

`placeholderLabel` puede explicar que todavía no existe un valor confirmado, pero no genera una operación para limpiar el contexto.

---

#### 21. `placeholderLabel`

`placeholderLabel` sirve únicamente para representar de forma humana la ausencia de una selección confirmada disponible para mostrar en el control.

La implementación conceptual lo trata como placeholder no accionable, no como `SiteSelectorOption` ordinaria.

No se utiliza para:

- fabricar una sede;
- representar error;
- representar denegación;
- borrar contexto;
- seleccionar todas las sedes;
- crear un filtro administrativo global.

---

#### 22. Prohibición de `defaultSiteId`

No existe `defaultSiteId` en la API.

Tampoco se permite que el componente seleccione automáticamente:

- sede primaria;
- primera sede de `options`;
- última sede usada;
- sede del dispositivo;
- sede de la URL;
- sede recordada localmente.

Un default visual no puede crear contexto operativo.

Si una capa propietaria resuelve autoritativamente una sede inicial, debe entregarla como `confirmedSiteId`.

---

#### 23. Una sola opción

Cuando `options` contiene una sola sede:

- su unicidad no la convierte automáticamente en sede activa;
- la capa propietaria puede decidir que no se necesita mostrar el selector;
- si se muestra, el control conserva la misma semántica de solicitud;
- no se autoemite `onRequestChange` al montar;
- no se autoriza una transición sin interacción o decisión propietaria explícita.

La ausencia de elección no se resuelve simulando una selección automática.

---

#### 24. Cero opciones

Cuando `options` está vacío:

- el componente no inventa una opción;
- no usa `confirmedSiteId` como opción nueva si la capa propietaria no la incluyó;
- no interpreta el vacío como falta de permiso;
- no interpreta el vacío como falta de sedes en la empresa;
- no muestra información de sedes ocultas;
- no transforma el estado en `EmptyState` empresarial.

La capa propietaria decide si el selector se omite, se deshabilita o se acompaña con una explicación segura.

---

#### 25. Orden de las opciones

`SiteSelector` conserva el orden entregado por la capa propietaria.

No ordena por:

- ID;
- tipo de sede;
- supuesta prioridad;
- sede primaria;
- recencia;
- frecuencia de uso;
- nombre de aplicación.

El orden puede responder a criterios funcionales ya resueltos externamente.

El componente no los infiere.

---

#### 26. Frontera con `ContextIndicator`

`ContextIndicator` y `SiteSelector` se complementan sin compartir autoridad.

```text
ContextIndicator
→ qué sede está confirmada y cuál es el estado del contexto

SiteSelector
→ qué cambio de sede desea solicitar la persona
```

Durante una transición:

```text
ContextIndicator.state = changing
ContextIndicator muestra sede confirmada o contexto anterior según composición
SiteSelector.requestedSiteId = sede solicitada
SiteSelector.pending = true
```

La nueva sede se incorpora al contexto visible como activa únicamente después de confirmación.

---

#### 27. Frontera con selector de área

`SiteSelector` no contiene ni resuelve área.

La selección de área pertenece a:

```text
SHELL-UI-008 — Compartir selector de área
```

Un cambio de sede puede invalidar el área anterior, pero esa consecuencia se resuelve fuera de `SiteSelector` mediante el contrato de contexto y la transición propietaria.

No se incorpora una prop `areaId` para intentar mantener consistencia dentro del componente.

---

#### 28. Frontera con filtros administrativos

`SiteSelector` no es el filtro administrativo genérico de una tabla, reporte o dashboard.

La diferencia semántica es:

```text
SiteSelector
→ solicitar cambio de sede de contexto

filtro administrativo de sede
→ limitar el conjunto consultado sin cambiar contexto operativo
```

Una superficie administrativa que necesite filtrar por sede debe etiquetar el control como filtro o alcance de consulta y no reutilizar la semántica de sede activa.

Cambiar un filtro administrativo no debe:

- modificar turno;
- modificar check-in;
- modificar rol operativo;
- modificar actor;
- modificar permiso;
- cambiar `ContextIndicator` a otra sede activa.

---

#### 29. Frontera con simulación

El selector no contiene lógica de simulación.

No incorpora:

```text
roleOverride
simulationRole
isSimulated
startSimulation
stopSimulation
```

La advertencia de simulación pertenece a `SHELL-UI-009` y los contratos de simulación permanecen separados de la autoridad real.

Una sesión simulada no puede usar `SiteSelector` para fabricar autoridad territorial real.

---

#### 30. Frontera con autorización

`SiteSelector` no decide si un cambio está permitido.

No interpreta:

- roles;
- scopes;
- grants;
- denies;
- reason codes;
- claims;
- `canOperate`;
- `administrative_bypass`;
- metadata de permisos;
- nombre del cargo;
- allowlist de dispositivo como autoridad humana.

La visibilidad y las opciones se preparan fuera del componente y la transición se revalida autoritativamente.

---

#### 31. Frontera con diagnóstico y recuperación

Si el cambio no puede realizarse, `SiteSelector` no inventa una explicación.

La capa propietaria distingue, según corresponda:

- bloqueo;
- denegación;
- conflicto;
- validación requerida;
- error técnico;
- contexto inválido;
- contexto no disponible;
- solicitud obsoleta.

`SHELL-UI-015` conserva el diagnóstico compartido de contexto y `SHELL-UI-016` los estados de error recuperable.

El selector vuelve a representar el valor confirmado que entregue la capa propietaria.

---

#### 32. Confirmaciones y trabajo pendiente

Elegir una sede no equivale necesariamente a ejecutar el cambio inmediatamente.

Antes de confirmar pueden existir:

- tarea en ejecución;
- claim o lease;
- borrador;
- custodia;
- formulario sensible;
- operación offline pendiente;
- aprobación abierta;
- sesión simulada;
- transición de actor;
- restricción de dispositivo.

La revisión y confirmación de esas condiciones pertenece al proceso propietario.

`SiteSelector` puede iniciar la intención, pero no reemplaza la confirmación requerida ni la protección de acciones sensibles.

---

#### 33. Dispositivos compartidos

En un dispositivo compartido, la sede de estación, la sede del actor y la sede solicitada no se fusionan automáticamente.

Reglas:

1. una estación puede tener territorio fijo;
2. el actor humano conserva identidad separada;
3. la presencia de una sede en el dispositivo no concede autoridad al actor;
4. el selector solo recibe opciones seguras preparadas externamente;
5. la transición se revalida contra actor, dispositivo, turno, permiso y proceso;
6. un actor nuevo no hereda la selección pendiente del actor anterior;
7. la capa propietaria limpia cualquier estado personal incompatible al cambiar de actor.

El componente no persiste selecciones entre actores.

---

#### 34. Semántica HTML

La implementación conceptual utiliza un control de selección nativo cuando la cantidad y naturaleza de opciones no exijan una interacción especializada.

La estructura esperada es equivalente a:

```text
label
select
  option
  option
estado pendiente asociado cuando aplique
```

El control base no se implementa como un conjunto de `div` con comportamiento de select recreado manualmente.

El uso de semántica nativa reduce complejidad de teclado, foco y lector de pantalla.

---

#### 35. Razón para no congelar un combobox buscable

Esta tarea no incorpora búsqueda, autocomplete o combobox personalizado.

Razones:

1. no existe evidencia canónica de que el volumen de sedes exija búsqueda dentro del control compartido;
2. la implementación actual utiliza selectores simples;
3. un combobox incrementaría estados de foco, filtrado, navegación y anuncios accesibles;
4. filtrar opciones dentro del control puede confundirse con elegibilidad si no se diseña separadamente;
5. una necesidad futura puede evolucionar la API con evidencia real de volumen y uso.

La ausencia de búsqueda no impide que una versión futura la incorpore mediante evolución gobernada.

---

#### 36. Atributos nativos compatibles

La implementación física podrá conservar atributos compatibles de un `HTMLSelectElement` cuando no contradigan el contrato.

Podrán incluir, según integración:

- `id`;
- `name`;
- `form`;
- `aria-*`;
- `data-*`;
- `className`;
- atributos de identificación accesible.

El componente mantiene control propio sobre las capacidades que definen su semántica:

```text
value
defaultValue
onChange
disabled
multiple
children
```

No se permite usar atributos nativos para crear una segunda API de autoridad o bypass.

---

#### 37. Accesibilidad mínima

La implementación futura deberá conservar como mínimo:

1. etiqueta textual asociada al control;
2. nombre humano de cada sede visible;
3. estado pendiente perceptible cuando exista;
4. navegación completa por teclado mediante semántica nativa;
5. foco visible;
6. contraste suficiente;
7. no depender únicamente de color o icono;
8. ausencia de sedes técnicas mostradas solo como UUID;
9. orden de lectura lógico;
10. reflow sin pérdida de etiqueta, valor o estado;
11. zoom sin solapamiento crítico;
12. estado deshabilitado comprensible mediante composición cuando necesite explicación;
13. ausencia de mensajes críticos únicamente en tooltip o hover;
14. no mover foco por una confirmación ordinaria de servidor;
15. permitir que la composición anuncie cambios materiales con prioridad apropiada.

---

#### 38. Teclado y foco

El selector conserva el comportamiento de teclado del control nativo.

No introduce por contrato:

- atajos globales;
- captura de teclas fuera del control;
- apertura automática al montar;
- foco automático al resolver contexto;
- movimiento de foco al cambiar `confirmedSiteId`;
- cierre de menús globales como efecto oculto;
- listeners de documento.

Si una denegación o incompatibilidad material requiere foco hacia una explicación, esa decisión pertenece al patrón de recuperación, no al selector base.

---

#### 39. Táctil y responsive

El componente debe poder utilizarse en escritorio, tablet y superficies táctiles sin crear una variante funcional distinta.

La implementación futura deberá:

- mantener un objetivo táctil adecuado;
- evitar texto truncado que vuelva indistinguibles las sedes;
- admitir reflow;
- no exigir hover;
- evitar scroll horizontal ordinario para comprender el control;
- mantener visible el estado pendiente;
- conservar el label aun cuando la composición sea compacta.

Los valores físicos exactos pertenecen al sistema visual y a los patrones de tablet/kiosco posteriores.

---

#### 40. Frontera client/server

A diferencia de `ContextIndicator`, `SiteSelector` es conceptualmente interactivo.

La implementación física requiere una frontera cliente para capturar la selección y emitir `onRequestChange`.

Esto no autoriza al componente a:

- consultar red;
- resolver contexto;
- abrir cliente Supabase;
- persistir preferencias;
- navegar;
- mutar cookies.

La arquitectura recomendada es una hoja interactiva pequeña dentro de una composición que puede seguir resolviendo datos y contexto en capas server-side.

La existencia de una frontera cliente no convierte al cliente en fuente de autoridad.

---

#### 41. Dependencias prohibidas

`SiteSelector` no dependerá directamente de:

- `@vento/supabase`;
- cliente Supabase;
- tablas o schemas;
- RPC;
- Edge Functions;
- RLS;
- `employee_settings`;
- router de Next.js;
- `useSearchParams`;
- `usePathname`;
- cookies;
- `localStorage`;
- `sessionStorage`;
- variables secretas;
- repositorios de aplicación;
- APIs de negocio;
- resolvers de permisos;
- lógica de simulación.

Tampoco ejecutará mutaciones empresariales.

---

#### 42. Prohibición de persistencia local como autoridad

El componente no guarda la sede solicitada o confirmada en:

- cookie;
- storage;
- IndexedDB;
- query parameter;
- estado global persistente del navegador.

Una aplicación puede conservar preferencias no autoritativas cuando otro contrato lo permita, pero esa persistencia ocurre fuera de `SiteSelector` y nunca sustituye el contexto resuelto.

La API compartida no expone helpers para esa persistencia.

---

#### 43. Prohibición de navegación como confirmación

El componente no usa la navegación para afirmar que un cambio fue aceptado.

Queda fuera del contrato:

```text
router.push(?site_id=...)
router.replace(...)
location.href = ...
```

como mecanismo de cambio de contexto.

Una navegación posterior puede formar parte de la transición propietaria una vez resuelto el nuevo contexto, pero no es responsabilidad del selector.

Los deep links tampoco transportan autoridad territorial.

---

#### 44. Prohibición de escritura directa de `employee_settings`

La implementación compartida no escribe directamente:

```text
employee_settings.selected_site_id
```

La tabla o preferencia observada en el patrón legacy no se adopta como fuente canónica de sede activa.

Si una preferencia de experiencia continúa siendo válida en una fase posterior, deberá permanecer semánticamente separada del contexto operativo y ser gestionada por su propietario autorizado.

`SiteSelector` no conoce la tabla.

---

#### 45. Evidencia del template histórico

El template AppShell histórico contiene un selector de sede dentro de `ProfileMenu`.

Se observaron las siguientes características:

```text
sites
activeSiteId
SITE_OVERRIDE_COOKIE = app_site_override_id
query parameter site_id
employee_settings.selected_site_id
label "Sede activa"
option "Sin sede"
```

El flujo actual escribe una cookie, realiza un `upsert` cliente de preferencia y modifica la URL.

Clasificación:

```text
EVIDENCIA LEGACY DE INTERACCIÓN
≠
IMPLEMENTACIÓN CANÓNICA DE SiteSelector
```

La existencia del template no demuestra que sus efectos laterales sean válidos para el componente compartido.

---

#### 46. Evidencia runtime en consumidores web

Se verificaron seis copias runtime de `ProfileMenu` con selector de sede en consumidores web existentes:

```text
NEXO
FOGO
ORIGO
VISO
PULSO
NUMERA
```

Las seis comparten el mismo patrón general:

1. reciben `sites` y `activeSiteId`;
2. pueden tomar `site_id` desde query params;
3. escriben una cookie local por aplicación;
4. abren cliente Supabase en navegador;
5. realizan `upsert` de `selected_site_id`;
6. actualizan el query parameter `site_id`;
7. muestran el control como `Sede activa`;
8. incluyen `Sin sede` como opción;
9. mezclan el selector dentro del menú de perfil;
10. condicionan su visibilidad mediante lógica local de rol.

La repetición confirma la necesidad de un componente compartido, pero no valida su modelo de autoridad.

---

#### 47. Cookies legacy observadas

Se observaron las siguientes identidades de cookie dentro de la familia revisada:

| Fuente   | Cookie legacy             |
| -------- | ------------------------- |
| template | `app_site_override_id`    |
| NEXO     | `nexo_site_override_id`   |
| FOGO     | `fogo_site_override_id`   |
| ORIGO    | `origo_site_override_id`  |
| VISO     | `viso_site_override_id`   |
| PULSO    | `pulso_site_override_id`  |
| NUMERA   | `numera_site_override_id` |

Estas cookies son evidencia de persistencia local existente.

No se incorporan a `SiteSelectorProps` y no pueden ser fuente de autoridad para `confirmedSiteId`.

Su disposición física futura pertenece al inventario y migración coordinada.

---

#### 48. Reconciliación del patrón legacy

| Rasgo observado                                    | Decisión canónica de UI007                                                     |
| -------------------------------------------------- | ------------------------------------------------------------------------------ |
| `sites`                                            | conservar intención como `options` preparadas externamente                     |
| `activeSiteId` ambiguo                             | separar en `confirmedSiteId` y `requestedSiteId`                               |
| `onChange` con efectos laterales                   | sustituir conceptualmente por `onRequestChange`                                |
| cookie por aplicación                              | no pertenece al componente compartido                                          |
| `employee_settings.selected_site_id` desde cliente | no pertenece al componente compartido                                          |
| query param `site_id` como valor preferente        | no se acepta como fuente de sede confirmada                                    |
| label `Sede activa` sobre control mutable          | no se hardcodea; contexto activo pertenece a `ContextIndicator`                |
| opción universal `Sin sede`                        | no se incorpora como destino canónico                                          |
| gating por `canSwitchRole`                         | no se incorpora; visibilidad y disponibilidad se resuelven externamente        |
| selector embebido en `ProfileMenu`                 | no se congela como ubicación; AppShell se evalúa en UI010                      |
| role simulation y site selection en el mismo menú  | responsabilidades separadas; simulación permanece en UI009 y contratos propios |
| cierre del menú después de selección               | comportamiento de la composición, no del selector base                         |

---

#### 49. `canSwitchRole` no forma parte de la API

La familia legacy condiciona el selector mediante una lógica local de rol o privilegio.

UI007 no adopta:

```text
canSwitchRole
isOwner
isGeneralManager
isAdmin
```

como contrato del componente.

Razones:

1. la capacidad de solicitar cambio de sede no debe inferirse de un nombre de rol visual;
2. diferentes superficies pueden aplicar reglas distintas;
3. una lista visible no sustituye autorización;
4. la revalidación pertenece a la capa propietaria y servidor;
5. acoplar el componente a roles concretos rompería su reutilización y separación de responsabilidades.

La capa propietaria decide si el selector se muestra y qué opciones entrega.

---

#### 50. La etiqueta `Sede activa` no se hardcodea

El selector legacy se presenta con la etiqueta `Sede activa` aunque el mismo control modifica una selección local.

UI007 evita esa ambigüedad.

`label` es obligatorio y lo aporta la composición.

Ejemplos de intención admisible según el flujo:

```text
Cambiar sede
Seleccionar sede para continuar
Sede solicitada
```

El contexto confirmado se identifica en `ContextIndicator` o en la composición correspondiente.

El texto exacto se gobierna por terminología y localización, no por un literal interno fijo.

---

#### 51. Rechazo y recuperación

Si la solicitud es rechazada o no puede confirmarse:

- `SiteSelector` no conserva el destino como activo;
- la capa propietaria retira `requestedSiteId` cuando corresponda;
- `confirmedSiteId` refleja el contexto que continúe siendo válido;
- la causa se muestra mediante el patrón apropiado;
- no se reintenta automáticamente una mutación de cambio;
- no se usa la cookie o preferencia local como fallback;
- no se intenta otra sede automáticamente.

Un rechazo no convierte el componente en `EmptyState`.

---

#### 52. Concurrencia y contexto obsoleto

Entre el render de `options` y la solicitud pueden cambiar:

- asignaciones;
- rol;
- turno;
- check-in;
- permisos;
- habilitación territorial;
- dispositivo;
- custodia;
- claims;
- estado de la sede;
- simulación.

Por ello `options` es una proyección para interacción, no una garantía de aceptación.

Toda transición real debe revalidarse con estado fresco antes de publicar el nuevo contexto.

El componente no mantiene un cache autoritativo de elegibilidad.

---

#### 53. Conectividad y offline

`SiteSelector` no convierte una solicitud local offline en cambio confirmado.

Reglas:

- `pending` no significa sincronizado;
- una selección capturada localmente no prolonga permiso o turno;
- el componente no encola por sí mismo cambios de contexto;
- no reintenta automáticamente al recuperar red;
- no conserva autoridad desde caché;
- la política offline pertenece a la capa propietaria de contexto y resiliencia.

Si la transición exige confirmación online, la interfaz debe conservar la sede confirmada anterior o un estado contextual seguro hasta obtener resultado.

---

#### 54. Composición con `Alert`, `Button` y otros patrones

`SiteSelector` puede componerse con piezas compartidas sin absorber sus responsabilidades.

Ejemplos:

```text
ContextIndicator + SiteSelector
SiteSelector + Alert
SiteSelector + Button de confirmación cuando el proceso propietario lo exija
SiteSelector + diagnóstico seguro
```

El selector no crea internamente una confirmación universal.

Una acción sensible o con consecuencias materiales conserva su patrón de confirmación y autorización correspondiente.

---

#### 55. `className`, estilos y layout

La implementación podrá aceptar extensiones visuales compatibles sin permitir que cada consumidor cree una variante funcional paralela.

No se introducen props públicas:

```text
variant
tone
size
fullWidth
compact
kiosk
admin
operational
```

como taxonomía funcional del selector.

La anchura, densidad y posición pertenecen al layout y a los patrones de dispositivo.

Los estilos no pueden ocultar el estado pendiente ni convertir una selección solicitada en apariencia de contexto confirmado.

---

#### 56. Compatibilidad y versionado

La futura superficie pública deberá gobernarse con SemVer.

Cambios potencialmente incompatibles incluyen:

- cambiar significado de `confirmedSiteId`;
- cambiar significado de `requestedSiteId`;
- hacer que `onRequestChange` confirme autoridad;
- incorporar persistencia o red dentro del componente;
- retirar la separación entre valor confirmado y solicitado;
- convertir `null` en una opción seleccionable implícita;
- introducir autoelección de primera sede;
- cambiar la semántica HTML del control;
- alterar comportamiento de teclado o foco;
- introducir dependencia directa de Supabase o router;
- convertir `options` en catálogo global de sedes.

Una necesidad local no se incorpora silenciosamente a la API común.

---

#### 57. Estrategia posterior de migración

La migración física no ocurre en `SHELL-UI-007`.

Los propietarios posteriores deberán:

1. consolidar el inventario ejecutable de selectores, cookies, query params, preferencias y consumidores;
2. separar usos que realmente cambian contexto de los que solo filtran información;
3. definir lotes reversibles por repositorio;
4. bloquear nuevas copias del patrón legacy;
5. impedir que el scaffold histórico siga generando el flujo antiguo;
6. adoptar el componente compartido y adapters propietarios por aplicación;
7. validar accesibilidad, tema, responsive y semántica de transición;
8. demostrar paridad y ausencia de autoridad desde cliente;
9. retirar cookies, efectos laterales o copias únicamente cuando exista disposición aprobada y rollback.

No se adelanta ninguno de esos cambios.

---

#### 58. Handoff a migración coordinada

| Tarea           | Handoff de `SiteSelector`                                                                  |
| --------------- | ------------------------------------------------------------------------------------------ |
| `SHELL-MIG-001` | inventariar selectores reales, cookies, query params, escrituras y filtros                 |
| `SHELL-MIG-002` | formar lotes reversibles por consumidor                                                    |
| `SHELL-MIG-003` | definir compatibilidad temporal y bloquear nuevos consumidores legacy                      |
| `SHELL-MIG-004` | impedir que el scaffold replique el selector con autoridad cliente                         |
| `SHELL-MIG-005` | adoptar `SiteSelector` y la integración propietaria por aplicación                         |
| `SHELL-MIG-006` | verificar accesibilidad, tema, foco, teclado, reflow y dispositivos                        |
| `SHELL-MIG-007` | demostrar paridad, transición autoritativa y ausencia de efectos no gobernados             |
| `SHELL-MIG-008` | retirar únicamente artefactos legacy sin consumidores residuales y con rollback demostrado |

El inventario de UI007 es evidencia de diseño, no reemplaza el inventario ejecutable completo de `SHELL-MIG-001`.

---

#### 59. Handoff a calidad y releases

La materialización futura conserva los propietarios ya definidos para paquetes compartidos:

| Tarea          | Responsabilidad                                      |
| -------------- | ---------------------------------------------------- |
| `SHELL-CI-001` | pruebas propias del package                          |
| `SHELL-CI-002` | build independiente                                  |
| `SHELL-CI-003` | releases versionados                                 |
| `SHELL-CI-004` | changelog                                            |
| `SHELL-CI-005` | matriz de compatibilidad                             |
| `SHELL-CI-006` | actualización controlada de consumidores mediante PR |

`SHELL-UI-007` define el contrato del componente; no publica una versión.

---

#### 60. Contrato futuro de prueba

La implementación física y su adopción deberán demostrar, como mínimo:

1. renderizado con una sede confirmada;
2. renderizado sin sede confirmada y placeholder no accionable;
3. renderizado con varias opciones;
4. renderizado con una sola opción sin autoemisión;
5. renderizado con cero opciones sin inventar contexto;
6. preservación del orden recibido;
7. labels humanos de opciones;
8. ID interno no mostrado como sustituto del nombre;
9. `onRequestChange` emite la sede elegida;
10. `onRequestChange` no cambia autoridad por sí mismo;
11. ausencia de `defaultSiteId`;
12. ausencia de autoelección de primera opción;
13. ausencia de fallback a sede primaria;
14. ausencia de fallback a última sede;
15. separación entre `confirmedSiteId` y `requestedSiteId`;
16. solicitud pendiente sin presentar destino como activo;
17. confirmación propietaria que actualiza `confirmedSiteId`;
18. rechazo propietario que conserva o restaura contexto válido;
19. supresión de solicitudes equivalentes duplicadas mientras existe una transición pendiente;
20. estado pendiente perceptible por texto;
21. control deshabilitado sin convertirlo en autorización;
22. ausencia de opción universal seleccionable `Sin sede`;
23. ausencia de cookie dentro del componente;
24. ausencia de `localStorage` y `sessionStorage`;
25. ausencia de lectura de query param `site_id`;
26. ausencia de router dentro del componente;
27. ausencia de escritura de `employee_settings`;
28. ausencia de cliente Supabase;
29. ausencia de RPC o llamada de red;
30. ausencia de lógica de roles o permisos;
31. ausencia de `canSwitchRole` como fuente de capacidad;
32. ausencia de simulación dentro del componente;
33. separación frente a filtro administrativo;
34. separación frente a selector de área;
35. composición con `ContextIndicator state="changing"`;
36. revalidación server-side antes de publicar nuevo contexto;
37. invalidación del contexto anterior después del cambio según capa propietaria;
38. manejo de concurrencia sin cache de elegibilidad autoritativa;
39. teclado nativo;
40. foco visible;
41. label asociado;
42. contraste;
43. reflow;
44. zoom;
45. objetivo táctil adecuado;
46. ausencia de dependencia de hover;
47. client boundary aislada;
48. ausencia de listeners globales no necesarios;
49. paridad por consumidor antes de retirar el patrón legacy;
50. rollback por lote antes del retiro.

Esta lista define evidencia futura. No declara implementación ni ejecución de pruebas en `SHELL-UI-007`.

---

#### 61. Cobertura de requisitos existente

La tarea no necesita introducir una obligación transversal nueva porque el registro vigente ya cubre específicamente:

- separación entre sede asignada, primaria, seleccionada, filtrada, operativa y del recurso: `TREQ-UX-078`;
- transición autoritativa de cambio y prohibición de presentar el destino como activo antes del receipt: `TREQ-UX-083`;
- invalidación de acciones y controles ante cambios materiales: `TREQ-UX-084`;
- separación entre filtro administrativo y contexto operativo: `TREQ-UX-086`;
- singularidad del contexto activo frente a varias opciones elegibles: `TREQ-UX-087`;
- accesibilidad y perceptibilidad del contexto: `TREQ-UX-090`, `TREQ-UX-091`;
- estados de frescura y cambio: `TREQ-UX-092`;
- trazabilidad del cambio: `TREQ-UX-095`;
- inventario y migración de selectores, fallbacks, cookies y deep links: `TREQ-UX-096`;
- derivación autoritativa de sede y prohibición de que una selección reemplace contexto resuelto: `TREQ-UX-122`;
- prohibición de defaults que simulen autoridad, incluida última sede: `TREQ-UX-135`;
- resolución de un contexto nuevo al cambiar sede y prohibición de selectores visuales como fallback: `TREQ-UX-286`;
- separación entre selección de sede del template y autoridad real, incluida prohibición de cookies o escrituras cliente como autoridad: `TREQ-SHELL-031`;
- responsabilidades compartidas y reconciliación de copias: `TREQ-SHELL-002`, `TREQ-SHELL-032`;
- compatibilidad, versionado, deprecación y retiro: `TREQ-SHELL-036` a `TREQ-SHELL-039`;
- contexto territorial no resoluble sin convertir selección en autoridad: `TREQ-AUTH-163`;
- asignación de sede requerida para acciones territoriales: `TREQ-AUTH-169`;
- rol y sede reales no creados por sede seleccionada, sede primaria, cookie o cliente: `TREQ-AUTH-251`;
- eliminación de autoridad derivada de cookies, overrides y sede seleccionada en consumidores: `TREQ-AUTH-255`;
- invalidación de snapshots ante cambio de sede: `TREQ-AUTH-257`;
- frontera de propiedad donde `@vento/ui-web` renderiza sin decidir autorización: `TREQ-AUTH-321`.

`SHELL-UI-007` especializa esas obligaciones en una API visual compartida sin introducir una regla material nueva.

---

#### 62. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos descartados:** 0

La cobertura vigente ya exige separación entre selección y autoridad, transición autoritativa, revalidación, accesibilidad, privacidad, migración y eliminación de persistencias cliente como fuente de contexto. UI007 únicamente fija cómo esas reglas se expresan en el componente compartido.

---

#### 63. Estado de materialización física

Al cierre documental de `SHELL-UI-007`:

```text
IDENTIDAD SiteSelector                    = ESPECIFICADA
SiteSelectorProps                         = ESPECIFICADO CONCEPTUALMENTE
SiteSelectorOption                        = ESPECIFICADO CONCEPTUALMENTE
SEDE CONFIRMADA / SOLICITADA              = SEPARADAS
CALLBACK DE SOLICITUD                     = CERRADO
TRANSICIÓN AUTORITATIVA                   = FUERA DEL COMPONENTE Y CERRADA CONTRACTUALMENTE
FALLBACKS DE SEDE                         = PROHIBIDOS
PERSISTENCIA CLIENTE COMO AUTORIDAD       = PROHIBIDA
FRONTERA SELECTOR / FILTRO ADMINISTRATIVO = CERRADA
FRONTERA SELECTOR / INDICADOR             = CERRADA
FRONTERA SELECTOR / ÁREA                  = CERRADA
FRONTERA SELECTOR / SIMULACIÓN            = CERRADA
ACCESIBILIDAD                             = ESPECIFICADA DOCUMENTALMENTE
CLIENT BOUNDARY                           = ESPECIFICADA
RECONCILIACIÓN LEGACY                     = CERRADA DOCUMENTALMENTE
TEMPLATE REVISADO                         = 1
COPIAS RUNTIME REVISADAS                  = 6
PATRONES LEGACY REVISADOS                 = 7
PACKAGE @vento/ui-web FÍSICO              = NO MATERIALIZADO
COMPONENTE FÍSICO                         = NO MATERIALIZADO
CONSUMIDORES MIGRADOS                     = 0
IMPLEMENTACIONES LEGACY RETIRADAS         = 0
CAMBIOS TREQ                              = 0
```

La definición documental no implica publicación, instalación ni adopción runtime.

---

#### 64. Decisiones vinculantes

1. El componente compartido se denomina `SiteSelector`.
2. Pertenece conceptualmente a `@vento/ui-web`.
3. La tarea es documental y no materializa código.
4. La superficie conceptual incluye `SiteSelector`, `SiteSelectorProps` y `SiteSelectorOption`.
5. No se crea un `SiteSelectorState` público.
6. `label` es obligatorio.
7. `confirmedSiteId` representa la sede confirmada que entrega la capa propietaria.
8. `requestedSiteId` representa únicamente una sede solicitada todavía no confirmada.
9. `options` contiene candidatas visibles preparadas externamente.
10. Cada opción contiene `id` y `label`.
11. La presencia de una opción no concede permiso ni garantiza el cambio.
12. El servidor revalida toda transición real.
13. `onRequestChange` comunica intención; no confirma resultado.
14. El callback no retorna autoridad ni exige un `Promise` contractual.
15. `pending` expresa solicitud en curso, no contexto activo.
16. La sede solicitada no se presenta como activa antes del receipt.
17. `pendingLabel` permite expresar el estado humano de la solicitud.
18. `disabled` no equivale a denegación.
19. No existe opción canónica universal seleccionable `Sin sede`.
20. `placeholderLabel` no es una opción de borrado de contexto.
21. No existe `defaultSiteId`.
22. No existe `primarySiteId` como fallback.
23. No existe `lastSiteId` como fallback.
24. El componente no autoelige la primera opción.
25. Una única opción no se autoaplica.
26. Cero opciones no significa falta de permiso ni inexistencia de sedes.
27. El componente conserva el orden recibido.
28. `ContextIndicator` conserva la propiedad de mostrar la sede confirmada y estado del contexto.
29. UI008 conserva la propiedad del selector de área.
30. UI009 conserva la propiedad del aviso de simulación.
31. UI015 conserva la propiedad del diagnóstico de contexto.
32. UI016 conserva la propiedad de error recuperable.
33. El selector no es un filtro administrativo genérico.
34. Un filtro administrativo no cambia contexto operativo.
35. El componente no contiene lógica de roles, scopes, grants o reason codes.
36. No existe `canSwitchRole` como prop pública.
37. No existe `isAdmin` como prop pública.
38. No existe `canOperate` como prop pública.
39. Las opciones que no deban revelarse no se entregan al componente.
40. El componente no usa una lista global deshabilitada como mecanismo de seguridad.
41. La semántica base prioriza un `<select>` nativo.
42. No se congela un combobox buscable en esta tarea.
43. La implementación futura debe mantener label asociado, foco, teclado, contraste y reflow.
44. El componente es interactivo y requiere una frontera cliente aislada.
45. La frontera cliente no resuelve autoridad.
46. El componente no depende de `@vento/supabase`.
47. El componente no abre cliente Supabase.
48. El componente no conoce `employee_settings`.
49. El componente no escribe `selected_site_id`.
50. El componente no lee ni escribe cookies.
51. El componente no lee ni escribe storage.
52. El componente no consume `site_id` de query params.
53. El componente no usa router para confirmar un cambio.
54. El componente no hace llamadas de red.
55. El componente no ejecuta RPC ni mutaciones empresariales.
56. El template actual es evidencia histórica, no implementación canónica.
57. Las seis copias runtime revisadas son evidencia legacy a migrar.
58. Se observaron siete patrones de selector entre template y consumidores revisados.
59. Las siete identidades de cookie observadas no forman parte de la API compartida.
60. El label legacy `Sede activa` no se hardcodea en el selector compartido.
61. La migración física se realiza posteriormente por lotes reversibles.
62. El inventario ejecutable completo pertenece a `SHELL-MIG-001`.
63. El retiro de copias y persistencias legacy requiere evidencia y rollback.
64. Las pruebas, build, release y compatibilidad quedan bajo `SHELL-CI-*`.
65. Se crean 0 requisitos de prueba y se modifican 0.
66. `SHELL-UI-008` permanece reservada y no se desarrolla en esta tarea.

---

#### 65. Criterios de aceptación documental

`SHELL-UI-007` queda documentalmente cerrada únicamente si se cumplen simultáneamente:

- [x] la continuidad vigente apunta de `SHELL-UI-006` a `SHELL-UI-007`;
- [x] `SHELL-UI-008` permanece reservada;
- [x] existe una identidad única para el componente;
- [x] se fija su pertenencia conceptual a `@vento/ui-web`;
- [x] se separa sede confirmada de sede solicitada;
- [x] se fija una API conceptual mínima;
- [x] se define una identidad mínima de opción;
- [x] se define `onRequestChange` como intención y no confirmación;
- [x] se define el estado pendiente sin convertirlo en autoridad;
- [x] se prohíbe cambio optimista de sede activa;
- [x] se conserva la transición autoritativa fuera del componente;
- [x] se prohíbe `defaultSiteId` y fallbacks equivalentes;
- [x] se prohíbe autoelección de primera opción;
- [x] se rechaza una opción universal de vaciado `Sin sede`;
- [x] se separa placeholder de opción accionable;
- [x] se separa selector de sede de filtro administrativo;
- [x] se separa selector de sede de selector de área;
- [x] se separa selector de sede de simulación;
- [x] se separa selector de sede de diagnóstico y error;
- [x] se define privacidad de la lista de candidatas;
- [x] se evita que opciones visibles se conviertan en grants;
- [x] se especifica semántica HTML nativa;
- [x] se especifica accesibilidad mínima;
- [x] se especifica teclado y foco;
- [x] se especifica comportamiento táctil y responsive;
- [x] se especifica frontera cliente aislada;
- [x] se prohíbe red y Supabase dentro del componente;
- [x] se prohíben cookies y storage dentro del componente;
- [x] se prohíbe usar query params como autoridad;
- [x] se prohíbe escritura directa de `employee_settings`;
- [x] se reconcilia el template histórico;
- [x] se reconcilian seis copias runtime observadas;
- [x] se clasifican siete cookies legacy observadas como fuera de la API;
- [x] se separa el gating local de rol del contrato del componente;
- [x] se asigna la migración a tareas propietarias posteriores;
- [x] se asignan pruebas, build, release y compatibilidad a tareas propietarias;
- [x] no se modifica código, Supabase, consumidores o configuración;
- [x] se declaran 0 cambios TREQ con cobertura existente concreta;
- [x] no queda una decisión material de esta tarea sin propietario.

Resultado documental:

```text
SELECTOR DE SEDE COMPARTIDO                 = ESPECIFICADO
API CONCEPTUAL                              = CERRADA
SEDE CONFIRMADA / SOLICITADA                = SEPARADAS
TRANSICIÓN AUTORITATIVA                     = PRESERVADA
AUTORIDAD DESDE COOKIE / QUERY / CLIENTE    = PROHIBIDA
PERSISTENCIA CLIENTE DENTRO DEL COMPONENTE  = PROHIBIDA
FILTRO ADMINISTRATIVO                       = SEPARADO
SELECTOR DE ÁREA                            = RESERVADO A UI008
IMPLEMENTACIÓN FÍSICA                       = NO INICIADA
CAMBIOS TREQ                                = 0
```

---

#### 66. Límites de la tarea

`SHELL-UI-007` no autoriza:

- crear físicamente `SiteSelector`;
- crear físicamente `@vento/ui-web`;
- modificar los seis `ProfileMenu` runtime revisados;
- modificar el template AppShell;
- eliminar cookies legacy;
- modificar `employee_settings`;
- crear o cambiar tablas;
- crear migraciones;
- ejecutar SQL;
- cambiar RLS;
- cambiar RPC;
- modificar `@vento/os-context`;
- crear un nuevo resolver de contexto;
- crear un comando de cambio de sede no definido por su propietario;
- cambiar flujos de turno o check-in;
- cambiar simulación;
- migrar consumidores;
- publicar paquetes;
- retirar componentes legacy;
- iniciar `SHELL-UI-008`.

---

#### 67. Continuidad

**ÚLTIMA TAREA APROBADA**

```text
SHELL-UI-006 — Compartir indicador de contexto
```

**TAREA ACTUAL APROBADA**

```text
SHELL-UI-007 — Compartir selector de sede
```

**SIGUIENTE TAREA RESERVADA**

```text
SHELL-UI-008 — Compartir selector de área
```

`SHELL-UI-008` permanece reservada y no se desarrolla en esta tarea.

### ✅ SHELL-UI-008 — Compartir selector de área

**Estado:** APROBADA

**Tarea anterior:** `SHELL-UI-007 — Compartir selector de sede`

**Tarea siguiente:** `SHELL-UI-009 — Compartir aviso de rol simulado`

**Tipo de tarea:** Documental

**Bloque:** H — Fundación compartida

**Paquete propietario:** `@vento/ui-web`

**Naturaleza:** definición documental de un control compartido para solicitar cambios de área sin convertir la selección visual en contexto operativo autoritativo. No materializa código, no resuelve contexto, no modifica Supabase y no migra consumidores.

---

#### 1. Propósito

Definir el contrato canónico de un selector de área compartido para las superficies web de Vento OS que necesiten permitir a una persona solicitar un cambio de área dentro de un contexto elegible ya preparado por las capas propietarias.

El componente deberá resolver únicamente la interacción visual y accesible de selección. La autoridad del área permanecerá fuera de `@vento/ui-web`.

La regla central es:

```text
ÁREAS ELEGIBLES PARA PRESENTACIÓN
        +
ÁREA CONFIRMADA AUTORITATIVAMENTE
        ↓
AreaSelector
        ↓
SOLICITUD DE CAMBIO
        ↓
CAPA PROPIETARIA
        ↓
VALIDACIÓN + TRANSICIÓN + RECEIPT
        ↓
NUEVA ÁREA CONFIRMADA
```

Queda prohibida la dirección inversa:

```text
AreaSelector
        ✕
DEFINIR ÁREA ACTIVA
        ✕
CREAR ELEGIBILIDAD
        ✕
AMPLIAR TERRITORIO
        ✕
CONCEDER AUTORIZACIÓN
```

---

#### 2. Posición dentro de la secuencia compartida

`SHELL-UI-008` define exclusivamente la selección compartida de área.

Se apoya en la separación ya aprobada entre:

- contexto confirmado y presentación;
- sede confirmada y solicitud de cambio de sede;
- autoridad real y controles de interfaz;
- contexto operativo y filtros administrativos.

No absorbe:

- resolución de contexto;
- selección de sede;
- simulación;
- diagnóstico de contexto;
- AppShell;
- autorización;
- reglas de turno;
- reglas de check-in;
- reglas de dispositivo compartido;
- recuperación ante bloqueos.

---

#### 3. Dependencias documentales consumidas

La definición consume, sin reemplazar:

- `SHELL-UI-001 — Crear @vento/ui-web`;
- `SHELL-UI-006 — Compartir indicador de contexto`;
- `SHELL-UI-007 — Compartir selector de sede`;
- `UX-BASE-005 — Mantener visible sede, área, turno y rol activos`;
- las reglas de captura y reutilización de contexto;
- las reglas de superficies densas y estaciones multiárea;
- las reglas de reanudación e invalidación de contexto;
- los contratos vigentes de autorización territorial;
- la frontera vigente de `@vento/os-context`;
- el gobierno de paquetes compartidos, compatibilidad, deprecación y retiro;
- la estrategia posterior de migración coordinada de consumidores web.

Estas fuentes determinan qué puede considerarse área real, elegible o confirmada. `SHELL-UI-008` define únicamente la superficie visual reutilizable que expresa la intención de cambiarla.

---

#### 4. Naturaleza de la tarea

La tarea es documental.

Al cierre se define:

1. identidad del componente;
2. responsabilidad y límites;
3. superficie pública conceptual;
4. forma de representar opciones;
5. separación entre área confirmada y área solicitada;
6. comportamiento durante una transición pendiente;
7. relación con sede, contexto, filtros y territorio;
8. reglas para estaciones compartidas y multiárea;
9. semántica HTML y accesibilidad;
10. comportamiento responsive;
11. compatibilidad client/server;
12. dependencias permitidas y prohibidas;
13. evidencia técnica actual;
14. estrategia posterior de adopción;
15. contrato futuro de pruebas;
16. cobertura de requisitos existente.

No se crea el componente físico en esta tarea.

---

#### 5. Resultado documental

Se aprueba el componente conceptual:

```text
AreaSelector
```

como parte de:

```text
@vento/ui-web
```

Su función es presentar un conjunto de áreas ya habilitadas para ser ofrecidas por la capa propietaria y emitir una solicitud explícita de cambio.

No es:

- fuente de áreas autorizadas;
- resolver de contexto;
- guard de autorización;
- selector de sede;
- filtro administrativo;
- editor de asignaciones laborales;
- editor de turno;
- editor de check-in;
- selector de rol;
- switcher de aplicación;
- mutación directa de base de datos;
- mecanismo de persistencia;
- reconciliador de borradores, claims o custodia.

---

#### 6. Identidad pública conceptual

La superficie conceptual queda formada por:

```text
AreaSelector
AreaSelectorProps
AreaSelectorOption
```

Esta tarea no fija:

- subpath físico de exportación;
- estructura de carpetas del package;
- mapa de exports;
- herramienta de estilos;
- nombre de archivo TypeScript;
- framework de documentación visual;
- implementación interna.

Esas decisiones pertenecen a la materialización física y al gobierno del package.

---

#### 7. Superficie conceptual de props

La API conceptual mínima queda definida como:

```text
label: string
confirmedAreaId: string | null
requestedAreaId?: string | null
options: readonly AreaSelectorOption[]
onRequestChange: (areaId: string) => void
pending?: boolean
pendingLabel?: string
disabled?: boolean
placeholderLabel?: string
```

Además podrá conservar atributos HTML compatibles del control o contenedor según la implementación física, con las restricciones de semántica y accesibilidad definidas en esta tarea.

No se añade una prop genérica `context`.

No se añade una prop `effectiveContext`.

No se añade una prop `accessContext`.

No se añade una colección de permisos o booleanos de autorización.

---

#### 8. `AreaSelectorOption`

Cada opción se define conceptualmente como:

```text
id: string
label: string
```

`id` es la identidad estable que la capa propietaria utilizará para reconocer la intención seleccionada.

`label` es el nombre humano que puede presentarse a la persona.

El componente no necesita recibir, para cada opción:

- nombre de sede;
- `siteId`;
- `areaKind`;
- rol;
- turno;
- check-in;
- permisos;
- grants;
- scopes;
- reason codes;
- estado de RLS;
- metadata genérica.

La capa propietaria prepara las opciones antes de renderizar.

---

#### 9. Semántica de una opción disponible

Que un área aparezca en `options` significa únicamente:

```text
ESTA OPCIÓN PUEDE SER PRESENTADA EN ESTE CONTROL
```

No significa:

```text
EL ÁREA YA ESTÁ ACTIVA
EL ÁREA ESTÁ AUTORIZADA PARA TODA ACCIÓN
EL USUARIO PUEDE MUTAR CUALQUIER RECURSO DEL ÁREA
EL DISPOSITIVO CONCEDE AUTORIDAD SOBRE EL ÁREA
EL SERVIDOR GARANTIZA QUE EL CAMBIO SERÁ ACEPTADO
```

La autorización y elegibilidad final se revalidan en la transición propietaria.

---

#### 10. Contenido humano y privacidad

Las opciones deberán usar etiquetas humanas suficientes para distinguir áreas sin exponer información técnica innecesaria.

No se utilizarán como etiqueta principal:

- UUID;
- códigos internos de permiso;
- nombres de tabla;
- nombres de schema;
- nombres de RPC;
- claves de cookie;
- nombres de variables de entorno;
- identificadores de sesión;
- nombres técnicos de claims;
- payloads;
- SQL;
- metadata privada.

Si dos áreas requieren diferenciación adicional, la capa propietaria aportará un `label` humano inequívoco y minimizado.

---

#### 11. `confirmedAreaId`

`confirmedAreaId` representa exclusivamente el área que la capa propietaria reconoce como confirmada para la proyección actual.

Reglas:

1. puede ser `null` cuando la capa propietaria no tenga un área confirmada para mostrar;
2. no se deriva desde la primera opción;
3. no se deriva desde una sede;
4. no se deriva desde un dispositivo;
5. no se deriva desde un turno mostrado en cliente;
6. no se deriva desde `area_kind`;
7. no se deriva desde una URL;
8. no se deriva desde almacenamiento local;
9. no se deriva desde una selección anterior;
10. no se actualiza optimistamente al emitir una solicitud.

El componente no interpreta por qué el valor es `null`.

---

#### 12. `requestedAreaId`

`requestedAreaId` representa una intención visible de transición que todavía no debe confundirse con el área confirmada.

Su presencia permite que la interfaz distinga:

```text
ÁREA CONFIRMADA
≠
ÁREA SOLICITADA
```

Puede utilizarse para mantener perceptible el destino solicitado durante una transición controlada.

No constituye:

- receipt;
- autorización;
- confirmación de servidor;
- nuevo `AccessContext`;
- evidencia de que la transición terminó.

---

#### 13. Componente controlado

`AreaSelector` se define conceptualmente como un componente controlado por la capa propietaria.

El componente no conserva como fuente de verdad interna:

- área confirmada;
- área solicitada después de la respuesta propietaria;
- última área usada;
- historial de cambios;
- área del actor anterior;
- área previa del dispositivo.

La aplicación mantiene el estado de integración y vuelve a renderizar el control con la proyección vigente.

---

#### 14. `onRequestChange`

`onRequestChange` comunica una intención:

```text
persona solicita cambiar al área X
```

No comunica:

```text
el área X ya es activa
```

El callback no convierte su argumento en autoridad.

La implementación compartida no deberá exigir que el callback devuelva un resultado de autorización ni deberá interpretar un `Promise` resuelto como receipt autoritativo.

La capa propietaria conserva el ciclo completo de transición.

---

#### 15. Transición autoritativa de área

El cambio real de área conserva la secuencia transversal aprobada:

```text
SOLICITAR CAMBIO
        ↓
VALIDAR ELEGIBILIDAD
        ↓
REVISAR TRABAJO Y CUSTODIA PENDIENTES
        ↓
CONFIRMAR EFECTO CUANDO APLIQUE
        ↓
RESOLVER NUEVO CONTEXTO EN SERVIDOR
        ↓
INVALIDAR PROYECCIÓN ANTERIOR
        ↓
PUBLICAR NUEVO CONTEXTO
        ↓
REANUDAR O REDIRIGIR
```

`AreaSelector` participa únicamente en el primer paso visual y en la representación de que existe una solicitud pendiente.

---

#### 16. Prohibición de actualización optimista autoritativa

Al seleccionar otra opción:

```text
requestedAreaId = destino solicitado
confirmedAreaId = área todavía confirmada
```

hasta que la capa propietaria entregue el resultado autoritativo.

Queda prohibido que el componente:

- reemplace inmediatamente `confirmedAreaId`;
- marque visualmente la opción solicitada como nueva área activa;
- habilite acciones como consecuencia de la selección;
- infiera éxito porque no hubo excepción cliente;
- convierta navegación a otra URL en confirmación.

---

#### 17. `pending`

`pending` indica que la composición propietaria quiere presentar una transición en curso.

Cuando `pending=true`:

- la transición debe ser perceptible;
- el control no debe inducir a creer que el destino solicitado ya está activo;
- la implementación puede impedir solicitudes simultáneas para evitar ambigüedad;
- el área confirmada conserva su semántica hasta recibir nueva confirmación;
- el componente no inicia polling, retries ni consultas propias.

`pending` es estado de interacción, no estado de autorización.

---

#### 18. `pendingLabel`

`pendingLabel` permite aportar texto humano para comunicar la transición en curso cuando la composición lo necesite.

No se congela una frase universal porque el copy puede depender de localización y contexto de uso.

La presentación de `pending` no dependerá exclusivamente de:

- spinner;
- color;
- opacidad;
- icono;
- animación.

---

#### 19. `disabled`

`disabled` expresa que la capa propietaria no permite interacción con el selector en ese render.

No explica por sí mismo la causa.

El componente no deduce `disabled` desde:

- rol;
- permiso;
- cantidad de opciones;
- conectividad;
- turno;
- check-in;
- dispositivo;
- `canOperate`;
- simulación;
- estado del recurso.

Cuando la causa material de bloqueo deba explicarse, la composición utilizará el patrón propietario de explicación o diagnóstico.

---

#### 20. Ausencia de una opción universal `Sin área`

No se incorpora por contrato una opción interactiva universal equivalente a:

```text
Sin área
```

Un `confirmedAreaId=null` puede representar situaciones diferentes según la capa propietaria, por ejemplo:

- contexto aún no resuelto;
- área no aplicable para esa superficie;
- ausencia válida ya confirmada por otro contrato;
- contexto inválido o no disponible.

El componente no puede transformar automáticamente `null` en una acción que elimine el área operativa.

---

#### 21. `placeholderLabel`

`placeholderLabel` permite mostrar un texto inicial o informativo cuando no existe una opción confirmada que deba presentarse como seleccionada.

El placeholder:

- no es una opción de negocio;
- no tiene identidad autoritativa;
- no puede activar una mutación al aparecer;
- no sustituye una explicación de contexto inválido o no disponible;
- no se convierte en fallback.

---

#### 22. Prohibición de `defaultAreaId`

No se define `defaultAreaId`.

Tampoco se define:

```text
primaryAreaId
lastAreaId
preferredAreaId
deviceAreaId
firstEligibleAreaId
```

como mecanismos de inicialización autoritativa.

El área confirmada debe entrar mediante `confirmedAreaId` desde la capa propietaria.

---

#### 23. Caso de una sola opción

Si `options` contiene una sola área, el componente no la confirma automáticamente.

Una única opción visible puede simplificar la interacción, pero:

```text
UNA OPCIÓN
≠
ÁREA ACTIVA CONFIRMADA
```

La capa propietaria decide si el proceso puede resolverla automáticamente mediante un contrato autoritativo externo; `AreaSelector` no ejecuta esa decisión.

---

#### 24. Caso de cero opciones

`options=[]` no significa por sí mismo:

- actor sin permisos;
- actor sin asignaciones;
- empresa sin áreas;
- sede sin áreas;
- usuario bloqueado;
- error técnico;
- contexto inválido.

La capa propietaria conserva la causa y decide si el control debe mostrarse deshabilitado, acompañarse de explicación o no renderizarse.

El componente no inventa un EmptyState a partir de una lista vacía.

---

#### 25. Orden de opciones

`AreaSelector` conserva el orden entregado por el consumidor.

No reordena por:

- `id`;
- texto;
- frecuencia de uso;
- última selección;
- supuesta prioridad;
- tipo de área;
- heurísticas locales.

La capa propietaria decide el orden cuando exista una política válida de presentación.

---

#### 26. Relación con `ContextIndicator`

La composición conceptual es:

```text
ContextIndicator
→ muestra el área confirmada dentro del contexto efectivo

AreaSelector
→ permite solicitar otra área entre las opciones ofrecidas
```

Durante una transición:

```text
ContextIndicator = contexto confirmado o estado CHANGING
AreaSelector      = destino solicitado, si aplica
```

El selector no sustituye al indicador persistente de contexto.

---

#### 27. Relación con `SiteSelector`

`SiteSelector` y `AreaSelector` son controles distintos.

`AreaSelector` no cambia sede.

`SiteSelector` no confirma por sí mismo un área.

La capa propietaria debe coordinar ambas dimensiones para impedir un contexto imposible.

La composición puede presentar ambos controles cuando la superficie realmente permita ambas transiciones.

---

#### 28. Dependencia jerárquica sede–área

Las opciones de `AreaSelector` deberán prepararse contra el contexto territorial que la capa propietaria considere válido para la solicitud.

Reglas:

1. un área no se ofrece solo porque su nombre existe;
2. el componente no consulta a qué sede pertenece;
3. el componente no recibe un `siteId` para calcular elegibilidad;
4. la capa propietaria filtra y valida las opciones antes de presentarlas;
5. un cambio confirmado de sede puede invalidar el área anterior;
6. tras cambiar sede, el área anterior no se conserva como fallback;
7. tras cambiar sede, no se elige automáticamente la primera área nueva;
8. si sede y área deben cambiar de forma coordinada, la orquestación pertenece a la capa propietaria y debe producir una transición autoritativa coherente.

---

#### 29. Filtros administrativos de área

Un filtro administrativo por área no es `AreaSelector` cuando su efecto es únicamente restringir una consulta o vista.

Separación:

```text
filtro administrativo
→ cambia alcance de visualización

AreaSelector
→ solicita cambio de contexto de área cuando el proceso lo permite
```

Cambiar un filtro no puede alterar por inferencia:

- turno;
- check-in;
- rol operativo;
- actor;
- permisos;
- contexto operativo;
- territorio de una tarea.

---

#### 30. `area_kind`, nombres y semántica territorial

`area_kind` no se incorpora a la API pública del selector como fuente de autoridad.

El nombre humano tampoco sustituye la identidad estable.

Queda prohibido resolver equivalencia territorial por:

- coincidencia de texto;
- prefijo;
- traducción;
- tipo de área;
- posición en la lista;
- etiqueta abreviada.

La identidad y compatibilidad territorial se resuelven fuera del componente.

---

#### 31. Simulación

`AreaSelector` no inicia ni modifica simulación.

Una lista de áreas simuladas no puede mezclarse con opciones de contexto real sin que la composición propietaria mantenga separados ambos planos.

El componente no recibe:

```text
isSimulated
simulationId
simulatedAreaId
```

como mecanismos para decidir autoridad.

La visibilidad especializada de simulación permanece en su patrón propio.

---

#### 32. Autorización

`AreaSelector` no decide si una acción empresarial está autorizada.

La existencia de un área en el selector no permite usar esa área como scope para:

- lectura protegida;
- mutación;
- RPC;
- RLS;
- exportación;
- impresión;
- aprobación;
- movimiento de inventario;
- producción;
- venta;
- custodia.

Toda acción conserva su evaluación autoritativa con contexto y recurso vigentes.

---

#### 33. Bloqueos y recuperación

El selector no se convierte en mecanismo universal de recuperación frente a una denegación territorial.

Si una superficie de bloqueo establece que la persona no puede corregir localmente rol o área, la composición no debe presentar `AreaSelector` como bypass para convertir la denegación en autorización.

Las causas de:

- área faltante;
- área inválida;
- rol no habilitado para área;
- configuración contradictoria;
- grant faltante;
- indisponibilidad técnica;

permanecen separadas y son propiedad de los contratos de autorización y diagnóstico.

---

#### 34. Trabajo, borradores, claims y custodia

Antes de que un cambio material de área se confirme, la capa propietaria deberá aplicar las reglas vigentes sobre trabajo en curso.

El selector no decide qué hacer con:

- tarea activa;
- claim o lease;
- borrador;
- captura sensible;
- custodia;
- aprobación abierta;
- operación offline pendiente;
- resultado incierto;
- archivo local;
- transición empresarial en curso.

No incorpora callbacks específicos para resolver esos dominios.

La capa propietaria puede bloquear la interacción o conducir la confirmación necesaria antes de completar la transición.

---

#### 35. Dispositivos compartidos y estaciones multiárea

En una estación compartida, la lista de áreas presentable no se construye a partir de la configuración del dispositivo de forma aislada.

La capa propietaria deberá determinar las opciones aplicables considerando la intersección que corresponda entre:

```text
dispositivo
actor
turno
permiso
proceso
territorio
```

Las áreas permitidas del dispositivo son un límite; no son una concesión de autoridad.

Cada mutación conserva un único actor y un área activa autoritativa.

`AreaSelector` no calcula la intersección ni sabe por qué una opción fue incluida o excluida.

---

#### 36. Cambio de actor

Cuando cambia el actor en un dispositivo compartido, la composición propietaria debe descartar cualquier intención de área incompatible con el nuevo actor.

El componente no persiste:

- `requestedAreaId`;
- área anterior;
- historial del actor anterior;
- lista previa de opciones.

El nuevo render deberá reflejar únicamente la proyección preparada para el actor vigente.

---

#### 37. Semántica HTML

La implementación física utilizará preferentemente un control nativo de selección cuando el volumen y la experiencia no exijan otro patrón.

La estructura conceptual es equivalente a:

```text
label
select
  option
  option
  ...
estado de transición cuando aplique
```

La asociación entre etiqueta y control será explícita.

No se requiere un landmark global.

---

#### 38. Decisión sobre combobox y búsqueda

No se define un combobox buscable como requisito base.

No existe evidencia documental en esta tarea que obligue a introducir:

- búsqueda incremental;
- virtualización;
- agrupamiento jerárquico;
- carga remota al escribir;
- paginación de áreas.

Si un consumidor futuro demuestra una necesidad transversal real, deberá evolucionarse el contrato de forma compatible y accesible.

---

#### 39. Atributos nativos

La implementación podrá conservar atributos compatibles del control nativo cuando no contradigan el contrato.

`name`, `id`, `aria-*`, `className` y atributos equivalentes no podrán utilizarse para:

- transportar autoridad;
- introducir un segundo valor confirmado;
- cambiar el significado de `disabled`;
- ocultar el label obligatorio;
- crear opciones no presentes en `options`;
- convertir un filtro en contexto operativo.

---

#### 40. Accesibilidad mínima

La implementación futura deberá conservar como mínimo:

1. etiqueta perceptible asociada al control;
2. nombre accesible coherente con la etiqueta visible;
3. soporte de teclado nativo;
4. foco visible;
5. estado deshabilitado perceptible;
6. transición pendiente comunicable mediante texto cuando sea relevante;
7. distinción entre área confirmada y solicitada sin depender solo de color;
8. orden de opciones estable según la entrada;
9. reflow sin pérdida del control;
10. zoom sin truncar información esencial;
11. contraste suficiente;
12. ausencia de información crítica únicamente en hover;
13. compatibilidad con lector de pantalla;
14. ausencia de anuncios repetitivos por cada re-render ordinario.

---

#### 41. Teclado y foco

El control debe conservar la interacción de teclado esperable de su semántica nativa.

No deberá:

- robar foco al recibir nuevas props;
- mover foco por una transición ordinaria;
- implementar atajos globales;
- confirmar el cambio únicamente por foco;
- disparar dos solicitudes por una sola selección;
- hacer foco automático sobre la nueva opción después de un receipt sin decisión de composición.

Los bloqueos críticos y movimientos de foco asociados a recuperación pertenecen al patrón superior correspondiente.

---

#### 42. Tacto, responsive y dispositivos

El selector deberá poder usarse en escritorio, tablet, móvil y kiosco cuando la superficie lo permita.

La implementación futura deberá:

- conservar un target táctil suficiente;
- evitar depender de hover;
- permitir etiquetas legibles;
- reacomodarse sin scroll horizontal ordinario;
- no ocultar el área confirmada únicamente dentro de un menú de perfil;
- coexistir con el contexto persistente de la superficie.

La ubicación exacta dentro del AppShell permanece fuera de esta tarea.

---

#### 43. Frontera client/server

A diferencia de un indicador puramente presentacional, `AreaSelector` necesita una frontera cliente para la interacción de selección.

Esa frontera debe permanecer delgada.

El componente compartido puede emitir eventos de interacción, pero no debe incorporar:

- resolución de sesión;
- fetch de áreas;
- evaluación de permisos;
- transición de contexto;
- persistencia;
- navegación propietaria;
- consultas a Supabase;
- efectos de negocio.

La capa propietaria puede ser server-first y entregar al control cliente únicamente las props necesarias.

---

#### 44. Dependencias prohibidas

`AreaSelector` no dependerá directamente de:

- `@vento/supabase`;
- cliente Supabase;
- RPC;
- tablas;
- schemas;
- RLS;
- cookies;
- localStorage;
- sessionStorage;
- IndexedDB;
- router de una aplicación concreta;
- query parameters;
- servicios de red;
- resolvers de permisos;
- servicios de dominio;
- variables secretas;
- observabilidad como fuente de autoridad.

---

#### 45. Persistencia

El componente no persiste el área seleccionada ni solicitada.

No escribe en:

- cookies;
- storage del navegador;
- base de datos;
- settings del trabajador;
- cache de aplicación;
- URL.

Una preferencia de usuario, si existiera en otro contrato, no se transforma por ello en área operativa activa.

---

#### 46. Navegación y query parameters

`AreaSelector` no ejecuta navegación como mecanismo de confirmación.

Un `area_id` o equivalente presente en URL puede ser una referencia de navegación bajo un contrato específico, pero no es autoridad para el componente.

La aplicación destino deberá resolver y revalidar el contexto.

El selector no lee ni escribe query parameters por sí mismo.

---

#### 47. Ausencia de escritura directa de configuración

La definición compartida no incorpora ningún contrato para actualizar directamente preferencias, perfiles laborales, asignaciones o settings persistidos.

La tarea no inventa columnas, tablas ni RPC para almacenar una supuesta `selected_area_id`.

Si una capa propietaria necesita registrar preferencia o intención, deberá hacerlo mediante su contrato propio y sin convertir esa persistencia en autoridad operativa.

---

#### 48. Estado técnico actual de SHELL

El inventario directo de primitivas locales de SHELL contiene:

```text
Button
Card
Chip
Input
Modal
```

No existe allí un componente dedicado `AreaSelector`.

Ninguna de esas cinco primitivas se adopta como sustituto automático del nuevo contrato.

---

#### 49. Evidencia del template histórico

El `ProfileMenu` del template AppShell histórico expone selección de sede, pero no expone una superficie equivalente de área en su firma revisada.

Clasificación:

```text
TEMPLATE HISTÓRICO
=
EVIDENCIA DE DISEÑO PREVIO
≠
IMPLEMENTACIÓN CANÓNICA DE AreaSelector
```

La ausencia de props de área en esa pieza concreta no demuestra ausencia de conceptos de área en todo el ecosistema; únicamente evita tratar ese menú como una implementación existente del selector compartido de área.

---

#### 50. Evidencia runtime en consumidores revisados

Se revisaron las firmas actuales de `ProfileMenu` en:

```text
NEXO
FOGO
ORIGO
VISO
PULSO
NUMERA
```

Las seis copias runtime revisadas exponen props de sede equivalentes a `sites` y `activeSiteId`, pero no exponen en esa pieza props equivalentes a:

```text
areas
activeAreaId
selectedAreaId
```

Resultado del universo revisado en esta tarea:

```text
PROFILEMENU REVISADOS, INCLUYENDO TEMPLATE = 7
FIRMAS CON SELECCIÓN DE SEDE             = 7
FIRMAS CON SELECCIÓN DE ÁREA             = 0
```

La conclusión se limita a esas siete implementaciones de `ProfileMenu` revisadas.

---

#### 51. Reconciliación de evidencia actual

La evidencia se clasifica así:

| Evidencia observada                                                  | Decisión documental                                      |
| -------------------------------------------------------------------- | -------------------------------------------------------- |
| `area_id` forma parte del contexto runtime actual                    | no acoplar la UI directamente a `EffectiveContext`       |
| `area_kind` existe en contexto runtime                               | no utilizarlo como autoridad ni prop obligatoria         |
| las reglas UX exigen cambio autoritativo de área                     | reflejar intención separada de confirmación              |
| las reglas de estación multiárea exigen intersección de elegibilidad | calcularla fuera del componente                          |
| los ProfileMenu revisados no tienen selector de área                 | no declarar una copia legacy homogénea inexistente       |
| las cinco primitivas locales de SHELL no incluyen AreaSelector       | definir identidad compartida sin adoptar una copia local |
| el cambio de área invalida contexto incompatible                     | mantener transición y revalidación fuera del componente  |

---

#### 52. Decisión de no fabricar un inventario legacy simétrico

`SHELL-UI-008` no replica artificialmente el inventario de `SiteSelector`.

No se afirma que existan siete selectores de área legacy porque la evidencia revisada no lo demuestra.

Tampoco se afirma que no exista ningún control de área en todos los repositorios.

La conclusión documental exacta es:

```text
NO SE OBSERVÓ UN PATRÓN HOMOGÉNEO DE AreaSelector
EN LAS SIETE FIRMAS ProfileMenu REVISADAS
```

El inventario ejecutable completo de consumidores y extensiones permanece bajo la fase de migración propietaria.

---

#### 53. Concurrencia y solicitudes obsoletas

Una solicitud de cambio puede quedar obsoleta si, antes de confirmarse, cambia materialmente:

- actor;
- sede;
- turno;
- check-in;
- rol;
- dispositivo;
- simulación;
- pertenencia área–sede;
- permiso;
- recurso;
- contexto de trabajo.

`AreaSelector` no resuelve esas carreras.

La capa propietaria deberá invalidar o reconciliar la solicitud y entregar nuevas props.

El componente no aplica el resultado de una solicitud anterior sobre un contexto más nuevo por su cuenta.

---

#### 54. Conectividad y offline

El selector no crea una cola offline de cambios de área.

No deberá:

- almacenar una solicitud para ejecutarla automáticamente después;
- asumir que el área previa sigue autorizada por estar cacheada;
- prolongar contexto por falta de red;
- convertir una selección local en confirmación;
- reintentar una transición material sin revalidación.

Cuando una política propietaria permita un cambio de área sin conexión bajo contexto offline válido, esa política debe resolverse fuera del componente y conservar la separación entre intención y autoridad.

---

#### 55. Composición con patrones compartidos

La composición esperada puede incluir:

```text
ContextIndicator
SiteSelector
AreaSelector
Alert
Button
```

según la superficie.

Cada pieza conserva su responsabilidad:

- indicador: contexto confirmado y frescura;
- selector de sede: intención de cambio de sede;
- selector de área: intención de cambio de área;
- alerta: mensaje contextual;
- botón: acción explícita cuando corresponda.

La composición no autoriza a una pieza visual a asumir la responsabilidad de otra.

---

#### 56. `className`, estilos y layout

La implementación podrá admitir extensión visual compatible con el sistema de diseño.

`className`, `style` o atributos equivalentes no podrán:

- ocultar la etiqueta accesible;
- hacer indistinguible pending de confirmado;
- ocultar una restricción material que la superficie deba comunicar;
- convertir una opción en área activa solo por estilo;
- romper foco visible;
- romper contraste;
- romper reflow;
- fabricar variantes de autorización.

No se crea una prop funcional `variant`, `tone`, `role`, `kiosk`, `admin` u `operational` para alterar la semántica del selector.

---

#### 57. Compatibilidad y versionado

La futura superficie pública deberá gobernarse con SemVer.

Cambios potencialmente incompatibles incluyen:

- renombrar `confirmedAreaId`;
- cambiar el significado de `requestedAreaId`;
- cambiar el contrato de `onRequestChange`;
- convertir `options` en fuente autoritativa;
- introducir auto-selección;
- introducir persistencia propia;
- cambiar la semántica accesible del control;
- convertir el selector en resolver de contexto;
- introducir una dependencia runtime obligatoria sobre Supabase o una aplicación;
- retirar props sin ventana de compatibilidad.

Una necesidad local no se incorpora silenciosamente a la API común.

---

#### 58. Estrategia posterior de migración

La migración física no ocurre en `SHELL-UI-008`.

La fase propietaria posterior deberá:

1. inventariar controles reales de área en consumidores, procesos, estaciones y superficies;
2. distinguir selector operativo, filtro administrativo y selector de recurso;
3. identificar fuentes de opciones, persistencias y fallbacks;
4. clasificar cada implementación como activa, compartible, local válida, legacy o sin consumidor;
5. asignar lotes reversibles por repositorio;
6. materializar el componente compartido cuando corresponda;
7. adaptar cada consumidor sin convertir la migración visual en cambio de autoridad;
8. probar accesibilidad, paridad, contexto y transición;
9. retirar únicamente copias con ausencia de uso residual demostrada.

---

#### 59. Handoff a migración coordinada

Responsabilidades posteriores:

| Tarea           | Handoff de `AreaSelector`                                                         |
| --------------- | --------------------------------------------------------------------------------- |
| `SHELL-MIG-001` | inventariar selectores, filtros, controles de área, fuentes y consumidores reales |
| `SHELL-MIG-002` | separar lotes reversibles por repositorio                                         |
| `SHELL-MIG-003` | preparar compatibilidad temporal y bloquear nuevas copias legacy                  |
| `SHELL-MIG-004` | impedir que scaffolds históricos reintroduzcan controles divergentes              |
| `SHELL-MIG-005` | adoptar el componente compartido donde la clasificación lo determine              |
| `SHELL-MIG-006` | verificar accesibilidad, tema, densidad y responsive                              |
| `SHELL-MIG-007` | demostrar paridad contractual y operativa por consumidor                          |
| `SHELL-MIG-008` | retirar únicamente artefactos sin uso residual                                    |

No se adelanta ninguno de esos cambios.

---

#### 60. Handoff a calidad y releases

La materialización futura conserva los propietarios ya definidos para paquetes compartidos:

| Tarea          | Responsabilidad                                      |
| -------------- | ---------------------------------------------------- |
| `SHELL-CI-001` | pruebas propias del package                          |
| `SHELL-CI-002` | build independiente                                  |
| `SHELL-CI-003` | releases versionados                                 |
| `SHELL-CI-004` | changelog                                            |
| `SHELL-CI-005` | matriz de compatibilidad                             |
| `SHELL-CI-006` | actualización controlada de consumidores mediante PR |

`SHELL-UI-008` define el contrato; no publica una versión.

---

#### 61. Contrato futuro de prueba

La implementación física y su adopción deberán demostrar, como mínimo:

1. renderizado con área confirmada;
2. renderizado sin área confirmada;
3. renderizado con múltiples opciones;
4. renderizado con una sola opción sin auto-confirmarla;
5. renderizado con cero opciones sin inventar una causa;
6. conservación del orden recibido;
7. etiqueta humana asociada al control;
8. selección que emite exactamente una intención;
9. selección que no cambia por sí sola `confirmedAreaId`;
10. representación separada de `requestedAreaId`;
11. `pending` perceptible;
12. `pending` sin convertir el destino solicitado en activo;
13. `disabled` sin inferencia de permiso interna;
14. placeholder no interactivo como autoridad;
15. ausencia de `defaultAreaId`;
16. ausencia de auto-selección de primera opción;
17. ausencia de fallback al área anterior;
18. ausencia de fallback al área del dispositivo;
19. ausencia de inferencia desde `area_kind`;
20. ausencia de inferencia desde nombre de área;
21. ausencia de inferencia desde URL;
22. ausencia de lectura o escritura de storage;
23. ausencia de cookies;
24. ausencia de persistencia propia;
25. ausencia de consulta Supabase;
26. ausencia de RPC dentro del componente;
27. ausencia de evaluación de permisos dentro del componente;
28. ausencia de filtro administrativo mezclado con contexto operativo;
29. cambio de sede que no conserva automáticamente un área incompatible;
30. coexistencia con SiteSelector sin carreras visuales autoritativas;
31. coexistencia con ContextIndicator mostrando el contexto confirmado;
32. opciones preparadas externamente para estaciones compartidas;
33. allowed areas del dispositivo tratadas solo como límite externo;
34. cambio de actor que no conserva intención local anterior;
35. solicitud obsoleta que no se aplica por estado interno del componente;
36. ausencia de cola offline propia;
37. soporte de teclado;
38. foco visible;
39. label accesible;
40. reflow;
41. zoom;
42. contraste;
43. interacción táctil;
44. ausencia de dependencia exclusiva de color o icono;
45. compatibilidad con SSR de la composición propietaria y frontera cliente mínima;
46. ausencia de dependencia runtime directa de `@vento/os-context` como requisito de presentación;
47. ausencia de `EffectiveContext` como prop pública;
48. ausencia de bypass desde una superficie de bloqueo que prohíba corregir área localmente;
49. paridad por consumidor antes de retirar cualquier control existente;
50. rollback verificable por lote de migración.

Esta lista define evidencia futura. No declara implementación ni ejecución de pruebas en esta tarea.

---

#### 62. Cobertura de requisitos existente

La tarea no necesita introducir una obligación transversal nueva porque el registro vigente ya cubre de forma específica:

- contexto efectivo resuelto por fuente autoritativa y prohibición de derivarlo desde frontend: `TREQ-UX-077`;
- separación entre área asignada, seleccionada, filtrada, operativa y territorio del recurso: `TREQ-UX-078`;
- tratamiento fail-closed de dimensiones obligatorias: `TREQ-UX-082`;
- transición autoritativa de sede, área, turno o rol y prohibición de activar antes del receipt: `TREQ-UX-083`;
- invalidación de acciones, controles y borradores ante cambios materiales: `TREQ-UX-084`;
- comparación entre contexto activo y territorio del recurso: `TREQ-UX-085`;
- separación de filtros administrativos y contexto operativo: `TREQ-UX-086`;
- singularidad del contexto activo frente a múltiples áreas elegibles: `TREQ-UX-087`;
- contexto derivado y no recapturado manualmente: `TREQ-UX-122`;
- intersección externa de áreas en estaciones compartidas y revalidación al cambiar: `TREQ-UX-246`;
- cambio de área con nuevo AccessContext y sin fallback desde selectores: `TREQ-UX-286`;
- área real y compatibilidad territorial no derivadas de área seleccionada, primera área, nombre o `area_kind`: `TREQ-AUTH-261`;
- separación de causas de área inválida, configuración, grant e indisponibilidad: `TREQ-AUTH-262`;
- revalidación de compatibilidad exacta del área en autorización: `TREQ-AUTH-259` a `TREQ-AUTH-267`;
- responsabilidades compartidas clasificadas y reconciliadas antes de adopción o retiro: `TREQ-SHELL-002`, `TREQ-SHELL-032`;
- template histórico separado de runtime: `TREQ-SHELL-029`;
- autoridad real separada de controles cliente: `TREQ-SHELL-031`;
- versionado, deprecación y retiro seguro de paquetes compartidos: `TREQ-SHELL-036` a `TREQ-SHELL-039`;
- separación entre tipos canónicos, `EffectiveContext` runtime y autoridad: `TREQ-SHELL-043`.

`SHELL-UI-008` especializa estas obligaciones en el contrato de presentación e interacción de `AreaSelector` sin crear una regla material nueva.

---

#### 63. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos descartados:** 0

La cobertura vigente ya contempla autoridad territorial, transición, invalidación, estaciones multiárea, accesibilidad, migración y compatibilidad. Esta tarea únicamente fija la API visual compartida y sus fronteras dentro de esa cobertura existente.

---

#### 64. Estado de materialización física

Al cierre documental de `SHELL-UI-008`:

```text
IDENTIDAD AreaSelector                   = ESPECIFICADA
AreaSelectorProps                        = ESPECIFICADO CONCEPTUALMENTE
AreaSelectorOption                       = ESPECIFICADO CONCEPTUALMENTE
ÁREA CONFIRMADA / SOLICITADA             = SEPARADAS
TRANSICIÓN AUTORITATIVA                  = FUERA DEL COMPONENTE
ELEGIBILIDAD DE OPCIONES                 = PROPIETARIA Y EXTERNA
SEDE / ÁREA                              = FRONTERA CERRADA
FILTRO ADMIN / CONTEXTO OPERATIVO        = FRONTERA CERRADA
DISPOSITIVO / ÁREA                       = FRONTERA CERRADA
ACCESIBILIDAD                            = ESPECIFICADA DOCUMENTALMENTE
FRONTERA CLIENTE                         = ESPECIFICADA
PACKAGE FÍSICO                           = NO MATERIALIZADO
COMPONENTE FÍSICO                        = NO MATERIALIZADO
CONSUMIDORES MIGRADOS                    = 0
CONTROLES LEGACY RETIRADOS               = 0
CAMBIOS TREQ                             = 0
```

La definición documental no implica publicación, instalación, migración ni adopción runtime.

---

#### 65. Decisiones vinculantes

1. El componente compartido se denomina `AreaSelector`.
2. Pertenece a `@vento/ui-web`.
3. La tarea es documental y no materializa código.
4. La superficie conceptual incluye `AreaSelector`, `AreaSelectorProps` y `AreaSelectorOption`.
5. Cada opción contiene únicamente identidad estable y etiqueta humana como contrato mínimo.
6. `confirmedAreaId` representa el área confirmada por la capa propietaria.
7. `requestedAreaId` representa una intención todavía no confirmada.
8. `onRequestChange` emite intención y no receipt.
9. La selección visual no cambia automáticamente el área activa.
10. `pending` representa transición de interacción y no autorización.
11. No se crea `defaultAreaId`.
12. No se crea fallback a primera opción.
13. No se crea fallback a última área.
14. No se crea fallback al área del dispositivo.
15. Una sola opción no se auto-confirma.
16. Cero opciones no se interpreta como falta de permiso.
17. No existe una opción universal interactiva `Sin área`.
18. El placeholder no es autoridad ni opción de negocio.
19. El orden de opciones lo determina la capa propietaria.
20. Las opciones no conceden autoridad por aparecer en el selector.
21. El componente no recibe permisos, grants o scopes para decidir elegibilidad.
22. El componente no resuelve pertenencia área–sede.
23. El componente no cambia sede.
24. Un cambio confirmado de sede puede invalidar el área anterior sin auto-seleccionar otra.
25. La orquestación conjunta sede–área pertenece a la capa propietaria.
26. Un filtro administrativo de área no se convierte en contexto operativo.
27. `area_kind` no es fuente de autoridad visual.
28. El nombre de área no sustituye la identidad estable.
29. El componente no inicia simulación.
30. El componente no evalúa autorización empresarial.
31. El componente no funciona como bypass de una superficie de bloqueo.
32. Borradores, claims, custodia y operaciones pendientes se resuelven fuera del componente.
33. En dispositivos compartidos, allowed areas son límite y no concesión.
34. La intersección entre dispositivo, actor, turno, permiso y proceso se calcula fuera del componente.
35. Cada mutación conserva un único actor y área autoritativa.
36. Cambiar actor invalida cualquier intención local incompatible mediante la composición propietaria.
37. El control base preferido conserva semántica nativa de selección.
38. No se exige combobox buscable.
39. La etiqueta accesible es obligatoria.
40. La transición no depende solo de color o spinner.
41. El control conserva teclado y foco visible.
42. El componente no roba ni mueve foco por re-render ordinario.
43. La interacción requiere una frontera cliente mínima.
44. Resolución, autorización, persistencia y efectos permanecen fuera de esa frontera.
45. El componente no depende directamente de Supabase.
46. El componente no ejecuta RPC.
47. El componente no lee ni escribe cookies o storage.
48. El componente no lee ni escribe query parameters.
49. El componente no persiste preferencias o settings.
50. No se inventa una columna o contrato `selected_area_id`.
51. `EffectiveContext` no se adopta como prop pública.
52. `@vento/os-context` no es dependencia runtime obligatoria del componente visual.
53. SHELL no posee actualmente una primitiva local dedicada `AreaSelector` entre las cinco revisadas.
54. El template revisado no expone selección de área en su `ProfileMenu`.
55. Las seis firmas runtime de `ProfileMenu` revisadas tampoco exponen selección de área en esa pieza.
56. No se fabrica un inventario de copias legacy de área por simetría con sede.
57. La conclusión de evidencia se limita a los siete `ProfileMenu` revisados.
58. La migración completa permanece bajo sus tareas propietarias.
59. La calidad, releases, compatibilidad y retiro permanecen bajo sus tareas propietarias.
60. Se crean 0 requisitos de prueba y se modifican 0.

---

#### 66. Criterios de aceptación documental

`SHELL-UI-008` queda documentalmente cerrada únicamente si se cumplen simultáneamente:

- [x] la continuidad real apunta de la tarea anterior a `SHELL-UI-008`;
- [x] existe una identidad única para el componente;
- [x] se fija su pertenencia a `@vento/ui-web`;
- [x] se separa área confirmada de área solicitada;
- [x] se define una API conceptual mínima;
- [x] se define una opción mínima con `id` y `label`;
- [x] se evita convertir opciones visibles en autorización;
- [x] se evita actualización optimista autoritativa;
- [x] se define el estado pending sin convertirlo en receipt;
- [x] se prohíben defaults y fallbacks permisivos;
- [x] se trata correctamente una, cero y múltiples opciones;
- [x] se separa área operativa de filtro administrativo;
- [x] se separa selección de área de selección de sede;
- [x] se define la coordinación sede–área fuera del componente;
- [x] se excluye `area_kind` como fuente de autoridad;
- [x] se excluyen simulación y autorización del componente;
- [x] se preservan reglas de trabajo, borradores, claims y custodia fuera del control;
- [x] se define la frontera de estaciones compartidas y multiárea;
- [x] se evita convertir allowed areas del dispositivo en autoridad;
- [x] se especifica semántica HTML;
- [x] se especifica accesibilidad mínima;
- [x] se especifica interacción por teclado y tacto;
- [x] se especifica frontera cliente mínima;
- [x] se prohíben dependencias de Supabase, RPC, storage, cookies y router propietario;
- [x] se evita persistencia directa de preferencias o settings;
- [x] se reconcilian las cinco primitivas actuales de SHELL;
- [x] se reconcilia el template histórico;
- [x] se reconcilian seis firmas runtime de `ProfileMenu`;
- [x] no se infiere un patrón legacy de área que la evidencia no demuestra;
- [x] se asigna inventario, adopción y retiro a migración coordinada;
- [x] se asignan pruebas, build, release y compatibilidad a tareas propietarias;
- [x] no se modifica código, Supabase, consumidores o configuración;
- [x] se declaran 0 cambios TREQ con cobertura existente concreta;
- [x] no queda una decisión material de esta tarea sin propietario.

Resultado documental:

```text
SELECTOR DE ÁREA COMPARTIDO       = ESPECIFICADO
API CONCEPTUAL                    = CERRADA
ÁREA CONFIRMADA / SOLICITADA      = SEPARADAS
AUTORIDAD                         = FUERA DEL COMPONENTE
PERSISTENCIA                      = FUERA DEL COMPONENTE
ELEGIBILIDAD                      = EXTERNA
MATERIALIZACIÓN FÍSICA            = PENDIENTE DE FASE PROPIETARIA
```

---

#### 67. Límites de la tarea

Esta tarea no autoriza:

- crear archivos TypeScript del componente;
- modificar `@vento/ui-web` físicamente;
- modificar `@vento/os-context`;
- modificar contratos de autorización;
- crear o alterar tablas;
- crear o alterar columnas;
- crear RPC;
- modificar RLS;
- modificar datos;
- cambiar configuración de Supabase;
- editar consumidores;
- retirar controles existentes;
- cambiar filtros administrativos;
- cambiar turnos, check-ins o roles;
- ejecutar una migración;
- publicar un package;
- crear un release;
- cambiar continuidad canónica;
- iniciar la tarea siguiente.

---

#### 68. Continuidad

**ÚLTIMA TAREA APROBADA**

```text
SHELL-UI-007 — Compartir selector de sede
```

**TAREA ACTUAL APROBADA**

```text
SHELL-UI-008 — Compartir selector de área
```

**SIGUIENTE TAREA RESERVADA**

```text
SHELL-UI-009 — Compartir aviso de rol simulado
```

### ✅ SHELL-UI-009 — Compartir aviso de rol simulado

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-008 — Compartir selector de área
**Tarea siguiente:** SHELL-UI-010 — Evaluar AppShell compartido
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida
**Paquete propietario:** `@vento/ui-web`
**Naturaleza:** definición documental de un aviso visual compartido para mantener perceptible que una superficie representa un rol simulado, sin convertir la presentación en fuente de simulación, autoridad, permisos, contexto efectivo ni capacidad de ejecución. No materializa código, no modifica Supabase y no migra consumidores.

---

#### 1. Propósito

Definir el contrato canónico de un aviso de rol simulado compartido para las superficies web de Vento OS que presenten una vista previa hipotética ya resuelta por las capas propietarias de simulación y autorización.

El componente deberá resolver únicamente la representación visual, semántica y accesible de que la persona está observando una proyección simulada y no una autoridad empresarial real.

La regla central es:

```text
ESTADO DE SIMULACIÓN YA RESUELTO
        +
ROL SIMULADO YA IDENTIFICADO
        +
COPY SEGURO YA PREPARADO
        ↓
SimulatedRoleNotice
        ↓
AVISO PERSISTENTE Y PERCEPTIBLE
        ↓
PERSONA ENTIENDE QUE OBSERVA
UNA VISTA HIPOTÉTICA NO EJECUTABLE
```

Queda prohibida la dirección inversa:

```text
SimulatedRoleNotice
        ✕
INICIAR SIMULACIÓN
        ✕
CAMBIAR ROL REAL
        ✕
CONVERTIR WOULD_ALLOW EN ALLOW
        ✕
CONCEDER PERMISOS
        ✕
EJECUTAR ACCIONES EMPRESARIALES
```

---

#### 2. Posición dentro de la secuencia compartida

`SHELL-UI-009` define exclusivamente el aviso visual compartido de rol simulado.

Se apoya en la separación ya aprobada entre:

- contexto confirmado y presentación;
- autoridad real y evaluación hipotética;
- rol real y rol simulado;
- controles de interfaz y decisiones de autorización;
- contexto territorial real y escenarios simulados;
- componente visual y ciclo de vida de simulación.

No absorbe:

- elegibilidad para simular;
- catálogo de roles simulables;
- sede simulada;
- área simulada;
- turno simulado;
- mezcla o separación física de evaluadores;
- inicio o cierre de la simulación;
- auditoría de inicio o salida;
- bloqueo de acciones críticas;
- definición del modo solo lectura;
- resolución de contexto;
- AppShell;
- autorización;
- diagnóstico de contexto.

---

#### 3. Dependencias documentales consumidas

La definición consume, sin reemplazar:

- `SHELL-UI-001 — Crear @vento/ui-web`;
- `SHELL-UI-006 — Compartir indicador de contexto`;
- `SHELL-UI-007 — Compartir selector de sede`;
- `SHELL-UI-008 — Compartir selector de área`;
- `AUTH-SIM-001 — Definir quién puede simular`;
- `AUTH-SIM-002 — Definir roles simulables`;
- `AUTH-SIM-003 — Definir sede simulada`;
- `AUTH-SIM-004 — Definir área simulada`;
- `AUTH-SIM-005 — Definir turno simulado`;
- `AUTH-SIM-006 — No mezclar permisos reales y simulados`;
- `AUTH-SIM-007 — Mostrar aviso persistente`, como tarea propietaria posterior de la política completa de persistencia del aviso;
- `AUTH-SIM-008 — Registrar inicio de simulación`;
- `AUTH-SIM-009 — Registrar salida de simulación`;
- `AUTH-SIM-010 — Bloquear acciones críticas durante simulación`;
- `AUTH-SIM-011 — Definir modo solo lectura`;
- las reglas vigentes de experiencia, accesibilidad, privacidad y contexto;
- la frontera vigente de `@vento/os-context`;
- el gobierno de paquetes compartidos, compatibilidad, deprecación y retiro;
- la estrategia posterior de migración coordinada de consumidores web.

Estas fuentes determinan qué constituye una simulación válida, qué puede evaluarse y qué nunca puede convertirse en autoridad real. `SHELL-UI-009` define únicamente la superficie visual reutilizable que comunica esa condición.

---

#### 4. Naturaleza de la tarea

La tarea es documental.

Al cierre se define:

1. identidad del componente;
2. responsabilidad y límites;
3. superficie pública conceptual;
4. fuente externa de su estado;
5. representación del rol simulado;
6. copy suministrado por la capa propietaria;
7. persistencia visual mientras el componente está montado;
8. prohibición de cierre local del aviso;
9. separación respecto al ciclo de vida de simulación;
10. relación con autorización y resultados hipotéticos;
11. relación con `ContextIndicator`, `SiteSelector` y `AreaSelector`;
12. frontera respecto a AppShell;
13. semántica HTML y accesibilidad;
14. comportamiento responsive;
15. compatibilidad client/server;
16. dependencias permitidas y prohibidas;
17. evidencia técnica actual;
18. estrategia posterior de adopción;
19. contrato futuro de pruebas;
20. cobertura de requisitos existente.

No se crea el componente físico en esta tarea.

---

#### 5. Resultado documental

Se aprueba el componente conceptual:

```text
SimulatedRoleNotice
```

como parte de:

```text
@vento/ui-web
```

Su función es presentar de forma inequívoca que la superficie actual representa un rol simulado y que esa representación no equivale a autoridad ejecutable.

No es:

- iniciador de simulación;
- finalizador de simulación;
- selector de rol;
- selector de sede;
- selector de área;
- editor de turno;
- editor de check-in;
- resolver de contexto;
- guard de autorización;
- evaluador de permiso;
- transportador de tokens;
- controlador de sesión;
- mutación de base de datos;
- mecanismo de persistencia;
- mecanismo de auditoría;
- bloqueo técnico de acciones críticas;
- implementación del modo solo lectura;
- sustituto del `ContextIndicator`.

---

#### 6. Identidad pública conceptual

La superficie conceptual queda formada por:

```text
SimulatedRoleNotice
SimulatedRoleNoticeProps
```

Esta tarea no fija:

- subpath físico de exportación;
- estructura de carpetas del package;
- mapa de exports;
- herramienta de estilos;
- nombre de archivo TypeScript;
- framework de documentación visual;
- implementación interna;
- ubicación exacta dentro del chrome de cada aplicación.

Esas decisiones pertenecen a la materialización física, al gobierno del package y, para la composición sistémica del chrome, a la tarea propietaria correspondiente.

---

#### 7. Superficie conceptual de props

La API conceptual mínima queda definida como:

```text
title: string
simulatedRoleLabel: string
description: string
nonExecutableLabel: string
```

Además podrá conservar atributos HTML compatibles del contenedor según la implementación física, con las restricciones de semántica, privacidad y accesibilidad definidas en esta tarea.

No se añade una prop genérica `context`.

No se añade una prop `effectiveContext`.

No se añade una prop `accessContext`.

No se añade una prop `permissions`.

No se añade una prop `canOperate`.

No se añade una prop `wouldAllow`.

No se añade una prop `simulationId` como requisito visual obligatorio.

No se añade una prop de sesión, cookie, token, grant, scope, RLS o RPC.

---

#### 8. Fuente del estado presentado

`SimulatedRoleNotice` no determina si existe una simulación.

La composición propietaria deberá renderizarlo únicamente cuando disponga de una proyección de simulación que deba presentarse como activa según los contratos autoritativos aplicables.

Por tanto:

```text
CAPA PROPIETARIA
        ↓
RESUELVE ESTADO DE SIMULACIÓN
        ↓
PREPARA COPY SEGURO
        ↓
RENDERIZA SimulatedRoleNotice
```

El componente no ejecuta:

- consultas para descubrir una simulación;
- lectura de cookies para inferir un override;
- lectura de URL;
- inspección de `localStorage`;
- inspección de `sessionStorage`;
- reconstrucción desde historial cliente;
- inferencia desde el rol mostrado por otro componente.

---

#### 9. Semántica del rol simulado

`simulatedRoleLabel` representa una etiqueta humana ya preparada para indicar el rol hipotético que se está presentando.

Su presencia significa:

```text
ESTE ES EL ROL QUE LA VISTA PREVIA ESTÁ REPRESENTANDO
```

No significa:

```text
ESTE ES EL ROL REAL DE LA PERSONA
ESTE ROL FUE ASIGNADO AL TRABAJADOR
ESTE ROL ESTÁ ACTIVO EN SU TURNO REAL
ESTE ROL CONCEDE PERMISOS EJECUTABLES
ESTE ROL PUEDE SER USADO POR RLS
ESTE ROL PUEDE FIRMAR UNA MUTACIÓN
```

El componente nunca traduce la etiqueta en autoridad.

---

#### 10. Contenido humano y privacidad

El aviso deberá usar texto humano suficiente para distinguir una vista simulada de una sesión o contexto real.

No se utilizarán como contenido principal:

- UUID de simulación;
- UUID de sesión;
- tokens;
- JWT;
- claims;
- nombres de cookie;
- nombres de tabla;
- nombres de schema;
- nombres de RPC;
- claves de permisos;
- reason codes internos;
- fingerprints completos;
- secretos;
- payloads;
- SQL;
- variables de entorno;
- detalles de políticas RLS;
- mecanismos internos de seguridad.

La capa propietaria suministra textos minimizados y seguros.

---

#### 11. `title`

`title` es el encabezado humano del aviso.

Su función es permitir que la persona identifique inmediatamente la naturaleza de la superficie presentada.

Esta tarea no congela un copy empresarial universal porque la política completa de aviso persistente pertenece a `AUTH-SIM-007`.

Reglas:

1. debe ser explícito respecto al carácter simulado o hipotético;
2. no debe describir la vista como autoridad real;
3. no debe afirmar que la persona cambió realmente de rol;
4. no debe afirmar que la sesión real fue sustituida;
5. no debe ocultarse visualmente cuando el componente está renderizado.

---

#### 12. `simulatedRoleLabel`

`simulatedRoleLabel` es la etiqueta humana del rol hipotético.

La capa propietaria es responsable de suministrar una etiqueta:

- ya resuelta;
- legible;
- segura para la audiencia;
- coherente con la identidad tipada del rol simulable;
- no derivada por el componente desde un código bare.

El componente no necesita recibir:

- `role_kind`;
- catálogo completo de roles;
- matriz de permisos;
- grants;
- roles alternativos;
- jerarquía organizacional;
- roles elegibles para el simulador;
- alias legacy.

---

#### 13. `description`

`description` permite comunicar la explicación humana principal de la vista simulada.

La explicación debe poder expresar, sin exponer detalles internos, que la superficie representa un escenario hipotético.

El componente no redacta por sí mismo mensajes a partir de:

- permiso;
- recurso;
- scope;
- resultado de autorización;
- reason code;
- sede;
- área;
- turno;
- check-in;
- dispositivo;
- sesión;
- catálogo;
- error técnico.

La composición propietaria decide el copy seguro que corresponde al escenario.

---

#### 14. `nonExecutableLabel`

`nonExecutableLabel` comunica explícitamente la naturaleza no ejecutable de la proyección cuando la capa propietaria deba presentar esa advertencia.

Su semántica es informativa:

```text
LA VISTA NO CONSTITUYE AUTORIDAD PARA PRODUCIR EFECTOS REALES
```

El texto no ejecuta ni sustituye el control técnico que impide efectos reales.

La protección material continúa perteneciendo a:

- evaluadores autoritativos;
- servidor;
- RPC;
- RLS;
- Server Actions;
- Route Handlers;
- Edge Functions;
- procesos asíncronos;
- integraciones;
- tareas propietarias de simulación y autorización.

---

#### 15. Condición de renderizado

El componente se define como una pieza de presentación que existe cuando la composición propietaria decide que debe mostrar el aviso de simulación.

No se define una prop pública base `active` o `isSimulated` para que el propio componente determine si debe ocultarse o aparecer.

La regla de composición es:

```text
SIN AVISO REQUERIDO POR LA PROYECCIÓN
→ NO RENDERIZAR EL COMPONENTE

AVISO REQUERIDO POR LA PROYECCIÓN
→ RENDERIZAR EL COMPONENTE CON COPY RESUELTO
```

Esto evita convertir un booleano visual en fuente de verdad de simulación.

---

#### 16. Persistencia visual y carácter no descartable

Mientras `SimulatedRoleNotice` permanezca renderizado por la composición propietaria, el aviso debe permanecer perceptible.

La implementación base no ofrece cierre local.

Queda prohibido que el componente se comporte como:

- toast temporal;
- snackbar que desaparece por timeout;
- alerta autocerrable;
- banner que se oculta por scroll sin mantener otra representación equivalente;
- aviso que el usuario pueda descartar y olvidar mientras la misma simulación continúa.

La política autoritativa que determina cuánto dura una simulación y cuándo debe existir el aviso no pertenece a este componente.

---

#### 17. Prohibición de `onDismiss`

No se define:

```text
onDismiss
onClose
hideNotice
snooze
acknowledgeAndHide
```

El cierre visual independiente sería incompatible con la función de mantener perceptible una condición material de interpretación de la superficie.

Aceptar que la persona comprendió el aviso no convierte la simulación en contexto real ni autoriza a ocultar indefinidamente su condición mientras continúe.

---

#### 18. Prohibición de iniciar o terminar simulación

No se define:

```text
onStartSimulation
startSimulation
onStopSimulation
stopSimulation
exitSimulation
```

`SimulatedRoleNotice` no es propietario del ciclo de vida de simulación.

Una futura acción explícita para salir podrá componerse alrededor del aviso únicamente cuando el contrato propietario de salida esté definido y materializado.

El componente compartido no adelanta esa decisión.

---

#### 19. Prohibición de cambiar el rol simulado

No se define:

```text
onRoleChange
roleOptions
selectedRole
roleOverride
setRole
```

El aviso no es selector.

El hecho de mostrar un rol hipotético no le concede responsabilidad para:

- elegir otro rol;
- listar roles simulables;
- validar qué roles puede simular la persona;
- persistir una selección;
- escribir una cookie;
- modificar la sesión;
- reconstruir una matriz.

---

#### 20. Separación respecto a autoridad real

El componente conserva la regla transversal:

```text
ROL SIMULADO
≠
ROL REAL
≠
AUTORIDAD REAL
≠
PERMISO EJECUTABLE
```

El aviso no puede recibir ni producir un resultado que transforme la simulación en `ALLOW`.

Una superficie que utiliza `SimulatedRoleNotice` sigue obligada a resolver cualquier acción real desde autoridad real y mediante las fronteras autoritativas correspondientes.

---

#### 21. Separación de los cuatro planos

El componente pertenece al plano de presentación dentro de la separación ya aprobada entre:

```text
1. AUTORIDAD REAL
2. EVALUACIÓN SIMULADA
3. PRESENTACIÓN
4. AUDITORÍA
```

`SimulatedRoleNotice` opera exclusivamente en:

```text
3. PRESENTACIÓN
```

No lee directamente el plano de autoridad real.

No ejecuta el evaluador simulado.

No escribe auditoría.

No comparte caché autoritativa con ninguno de esos planos.

---

#### 22. Vocabulario de resultado hipotético

Los contratos vigentes reservan para la evaluación simulada resultados como:

```text
WOULD_ALLOW
WOULD_DENY
INDETERMINATE
```

con naturaleza no ejecutable.

`SimulatedRoleNotice` no necesita interpretar esos valores para cumplir su responsabilidad base.

Si una superficie debe explicar un resultado específico, la capa propietaria prepara el contenido correspondiente y conserva la separación entre resultado hipotético y decisión real.

---

#### 23. Prohibición de `canOperate`

No se define `canOperate` como prop del aviso.

Tampoco se acepta que el componente:

- habilite acciones porque `canOperate=true`;
- deshabilite acciones porque `canOperate=false`;
- trate un booleano ambiguo como resultado simulado;
- transforme el estado visual del aviso en guard.

La evidencia técnica actual que aún contiene `can_operate` dentro de tipos runtime no se adopta como contrato visual ni se legitima mediante esta tarea.

---

#### 24. Acciones, lecturas y efectos reales

El componente no ejecuta:

- mutaciones;
- lecturas protegidas para ampliar la vista;
- exports;
- impresiones;
- notificaciones;
- jobs;
- webhooks;
- operaciones offline;
- sincronizaciones;
- acciones de servidor;
- RPC;
- llamadas que produzcan efectos empresariales.

Una vista previa que contenga controles hipotéticos deberá mantener esos controles sin handlers de negocio ejecutables según los contratos de simulación aplicables.

---

#### 25. Sesión real

El aviso no modifica ni sustituye la sesión real.

No:

- cierra sesión;
- renueva sesión;
- cambia usuario;
- cambia empleado;
- cambia actor;
- cambia rol administrativo real;
- cambia rol operativo real;
- crea una sesión simulada ejecutable;
- emite un token de autoridad.

La persona permanece bajo la identidad real que las capas propietarias resuelven.

---

#### 26. Datos reales y RLS

El aviso no amplía la lectura de datos.

Que se presente un rol simulado nunca significa que RLS, RPC o una consulta puedan usar ese rol para devolver filas adicionales.

La superficie debe seguir aplicando:

```text
DATOS REALES VISIBLES
=
ALCANCE REAL AUTORIZADO
```

El componente no conoce ni altera políticas RLS.

---

#### 27. Relación con `ContextIndicator`

`ContextIndicator` y `SimulatedRoleNotice` resuelven responsabilidades diferentes.

```text
ContextIndicator
→ presenta contexto confirmado y su proyección

SimulatedRoleNotice
→ advierte que existe una interpretación hipotética de rol
```

Pueden coexistir.

`ContextIndicator` no absorbe la advertencia especializada de simulación.

`SimulatedRoleNotice` no reemplaza el contexto confirmado ni reescribe sus valores.

La composición superior deberá impedir que la presencia de una simulación haga desaparecer la referencia necesaria al contexto real o confirmado que corresponda mostrar.

---

#### 28. Relación con `SiteSelector` y `AreaSelector`

El aviso no se convierte en selector territorial.

`SiteSelector` y `AreaSelector` mantienen sus contratos propios de intención y transición de contexto real.

Durante una vista simulada:

- un selector real no puede fabricar territorio simulado;
- un selector simulado no puede fabricar territorio real;
- el aviso no mezcla ambos planos;
- la composición propietaria decide qué controles están disponibles según el contrato de simulación.

`SimulatedRoleNotice` no recibe listas de sedes o áreas.

---

#### 29. Relación con AppShell

`SHELL-UI-009` no decide la arquitectura completa del AppShell.

Por tanto, esta tarea no congela si el aviso estará físicamente en:

- header;
- barra superior;
- región bajo el header;
- sidebar;
- contenido principal;
- chrome persistente específico.

La evaluación sistémica de AppShell pertenece a su tarea propietaria.

La única obligación de esta pieza es que, donde sea compuesta para representar una simulación activa, no se comporte como mensaje efímero o descartable.

---

#### 30. Ciclo de vida de simulación

El ciclo completo de simulación permanece fuera de `SimulatedRoleNotice`.

Conceptualmente puede existir:

```text
SOLICITAR
→ VALIDAR
→ CREAR ESCENARIO
→ MOSTRAR PREVIEW
→ MANTENER AVISO
→ SALIR O EXPIRAR
→ INVALIDAR PROYECCIÓN
→ VOLVER A CONTEXTO REAL
```

El componente participa únicamente en:

```text
MOSTRAR PREVIEW
→ MANTENER AVISO MIENTRAS LA COMPOSICIÓN LO RENDERIZA
```

No resuelve las demás transiciones.

---

#### 31. Handoff a `AUTH-SIM-007`

`AUTH-SIM-007 — Mostrar aviso persistente` conserva la propiedad del contrato de simulación que determine de forma completa:

- cuándo el aviso debe considerarse obligatorio;
- persistencia durante el ciclo de simulación;
- copy empresarial definitivo cuando corresponda;
- información mínima que debe mantenerse visible;
- relación exacta con el estado autoritativo de la simulación;
- condiciones de invalidez o pérdida del indicador.

`SHELL-UI-009` no suplanta esa tarea.

Su responsabilidad es dejar disponible una primitiva visual compartida capaz de representar el resultado de ese contrato sin añadir autoridad.

---

#### 32. Handoff a `AUTH-SIM-008` y `AUTH-SIM-009`

El inicio y la salida de una simulación conservan propietarios separados:

| Tarea          | Responsabilidad conservada        |
| -------------- | --------------------------------- |
| `AUTH-SIM-008` | registrar el inicio de simulación |
| `AUTH-SIM-009` | registrar la salida de simulación |

`SimulatedRoleNotice` no escribe esos eventos.

Tampoco interpreta que montar o desmontar el componente equivalga a inicio o salida autoritativos.

Renderizar no es auditar.

Desmontar no es cerrar una simulación.

---

#### 33. Handoff a `AUTH-SIM-010`

`AUTH-SIM-010 — Bloquear acciones críticas durante simulación` mantiene la propiedad del bloqueo material correspondiente.

El aviso no puede ser usado como sustituto de enforcement.

Queda prohibido un diseño equivalente a:

```text
SI EL BANNER ES VISIBLE
→ DESHABILITAR LOCALMENTE
→ ASUMIR SEGURIDAD COMPLETA
```

La seguridad deberá existir aunque el componente visual falle, no cargue o sea omitido por un cliente defectuoso.

---

#### 34. Handoff a `AUTH-SIM-011`

`AUTH-SIM-011 — Definir modo solo lectura` conserva la propiedad de definir cuándo y cómo una simulación opera en modo de lectura o preview.

`nonExecutableLabel` puede comunicar visualmente una condición ya resuelta.

No implementa el modo solo lectura.

No transforma controles reales en seguros por sí mismo.

No decide qué datos o formularios pueden aparecer.

---

#### 35. Elegibilidad y autorización para simular

El componente no resuelve quién puede simular.

No evalúa:

- `viso.access`;
- `viso.authorization.context_simulations.view`;
- rol base real;
- grants individuales;
- alcance `OWN`;
- alcance `THIRD_PARTY_EXPLICIT`;
- reautenticación fuerte;
- denegaciones;
- sesión personal;
- actor humano;
- cobertura territorial;
- sensibilidad del objetivo.

La capa autoritativa entrega únicamente la proyección que deba presentarse.

---

#### 36. Bloqueos, errores y recuperación

`SimulatedRoleNotice` no es un componente de error ni de bloqueo general.

No debe absorber:

- ausencia de sesión;
- usuario inactivo;
- falta de acceso a aplicación;
- falta de permiso;
- falta de sede o área activa;
- falta de turno;
- falta de check-in;
- rol operativo faltante o inválido;
- dispositivo compartido no autorizado;
- configuración administrativa inconsistente;
- indisponibilidad técnica.

Cuando una de esas condiciones tenga componente propietario, la composición deberá utilizarlo sin degradarla a un mensaje genérico de simulación.

---

#### 37. Semántica HTML

El componente deberá usar una estructura semántica persistente y reconocible.

La implementación podrá utilizar una región o elemento equivalente que permita identificar:

- encabezado del aviso;
- rol simulado;
- descripción;
- naturaleza no ejecutable.

No se exige que sea un diálogo.

No se exige que tome el foco.

No se exige que interrumpa la interacción como modal.

No se modela como toast efímero.

---

#### 38. Regiones vivas y anuncios

El componente no utilizará por defecto una semántica assertiva equivalente a `role="alert"` para cada render ordinario.

La persistencia del aviso no justifica que cada navegación o re-render produzca una interrupción repetitiva del lector de pantalla.

La transición autoritativa de entrada a simulación podrá requerir un anuncio específico cuando su tarea propietaria lo defina.

`SHELL-UI-009` conserva estas reglas base:

- el contenido debe ser descubrible por lector de pantalla;
- el título debe aportar nombre comprensible;
- el rol simulado debe formar parte de la información accesible;
- no se fuerza anuncio assertivo continuo;
- no se roba foco para anunciar el aviso.

---

#### 39. Icono, color y redundancia perceptiva

La condición de simulación no dependerá exclusivamente de:

- color;
- icono;
- borde;
- fondo;
- animación;
- posición.

Debe existir texto explícito.

Un icono puede reforzar el significado, pero no sustituir:

- título;
- identificación del rol simulado;
- explicación de la condición;
- indicación de naturaleza no ejecutable cuando corresponda.

---

#### 40. Teclado y foco

El componente base es informativo y no introduce controles interactivos obligatorios.

Por tanto:

- no debe crear tab stops innecesarios;
- no roba foco al montarse;
- no mueve foco por re-render ordinario;
- no encierra el foco;
- no implementa escape para cerrarse;
- no depende de hover para revelar su mensaje esencial.

Si una composición futura añade acciones adyacentes, esas acciones deberán cumplir sus propios contratos de teclado y foco.

---

#### 41. Responsive, zoom y tacto

El aviso deberá conservar legibilidad en:

- escritorio;
- tablet;
- kiosco web cuando corresponda;
- viewport estrecho;
- zoom elevado;
- reflow.

No se fija una altura rígida universal.

El texto podrá envolver líneas sin ocultar la identidad de simulación.

La información esencial no dependerá de hover ni de un tooltip exclusivo.

---

#### 42. Densidad y jerarquía de información

La jerarquía visual mínima es:

```text
CONDICIÓN DE SIMULACIÓN
        ↓
ROL SIMULADO
        ↓
EXPLICACIÓN
        ↓
NATURALEZA NO EJECUTABLE
```

La implementación puede adaptar densidad visual sin borrar ninguno de los significados que la composición haya decidido presentar.

No deberá convertir el aviso en una etiqueta minúscula indistinguible del resto del chrome cuando la simulación sea material para interpretar la pantalla.

---

#### 43. Frontera client/server

La representación base no necesita poseer lógica de resolución en cliente.

Podrá implementarse como componente compatible con renderizado de servidor siempre que la composición le entregue props serializables y seguras.

No requiere una frontera cliente solo para mostrar texto.

Si la implementación física necesita detalles de interacción visual no esenciales, esa frontera deberá mantenerse mínima.

La resolución de simulación, autorización, sesión, persistencia, auditoría y efectos permanece fuera del componente.

---

#### 44. Dependencias prohibidas

`SimulatedRoleNotice` no depende directamente de:

- Supabase;
- `@supabase/supabase-js`;
- `@supabase/ssr`;
- RPC empresariales;
- RLS;
- Server Actions de negocio;
- servicios de aplicación;
- routers propietarios;
- cookies de override;
- `localStorage`;
- `sessionStorage`;
- IndexedDB;
- cache API;
- tablas de roles;
- catálogos físicos de permisos;
- una aplicación consumidora concreta.

Tampoco requiere que `@vento/os-context` sea dependencia runtime obligatoria del componente visual.

---

#### 45. Persistencia

El componente no persiste estado de simulación.

No escribe:

- cookies;
- storage;
- base de datos;
- settings del empleado;
- preferencias de interfaz;
- query parameters;
- estado compartido de sesión;
- registros de auditoría.

Su persistencia es visual mientras la composición lo mantiene montado, no persistencia de negocio.

---

#### 46. Navegación y parámetros de URL

El componente no lee ni escribe parámetros de URL para determinar:

- rol simulado;
- sesión simulada;
- sede simulada;
- área simulada;
- turno simulado;
- permiso simulado;
- resultado hipotético.

Tampoco ejecuta navegación como mecanismo de entrada o salida de simulación.

Si una capa propietaria utiliza navegación durante el ciclo de simulación, deberá preservar el aviso y revalidar su proyección mediante su contrato correspondiente.

---

#### 47. Minimización y datos sensibles

La API base evita exigir:

- identidad real completa del actor;
- correo;
- documento;
- employee ID;
- user ID;
- simulation ID;
- permisos;
- grants;
- scopes;
- recurso sensible;
- motivo interno de denegación;
- fingerprint;
- información de reautenticación.

La capa propietaria puede construir `title`, `description` y etiquetas seguras sin transferir al componente datos que este no necesita.

---

#### 48. Estado técnico actual de SHELL

La fundación compartida actual mantiene primitivas web locales y un template histórico, pero no existe dentro de las primitivas locales revisadas una pieza canónica dedicada que materialice `SimulatedRoleNotice` como contrato compartido.

La definición de `SHELL-UI-009` no convierte automáticamente:

- una alerta genérica;
- un bloque de perfil;
- una etiqueta de modo prueba;
- un selector de rol;
- un fragmento de chrome;

en la implementación canónica del nuevo componente.

La materialización física permanece pendiente de su fase propietaria.

---

#### 49. Evidencia del template histórico

El template `app-shell-standard` revisado contiene en `ProfileMenu` un bloque cliente denominado humanamente `Modo prueba`.

La evidencia observada incluye:

- lectura de una cookie de override de rol;
- escritura de esa cookie desde cliente;
- listado local de `ROLE_OPTIONS`;
- cambio visual de `Rol activo`;
- acción local `Usar rol real`;
- `router.refresh()` después del override;
- convivencia en la misma pieza con selección de sede;
- dependencia directa del cliente Supabase para otras acciones del perfil.

Esta evidencia es histórica y técnica.

No constituye el contrato objetivo de simulación.

---

#### 50. Evidencia de overrides runtime en consumidores

La búsqueda técnica vigente identifica implementaciones `role-override.ts` al menos en consumidores como:

```text
vento-nexo
vento-fogo
vento-pulso
```

La existencia de esos helpers demuestra que hay lógica local de override que deberá ser reconciliada durante la migración.

No demuestra que:

- todas las aplicaciones tengan la misma implementación;
- los overrides sean simulación canónica;
- una cookie sea fuente de autoridad válida;
- el nuevo componente deba leer esos helpers;
- exista hoy una API compartida de aviso;
- se pueda migrar por búsqueda y reemplazo sin revisar semántica.

---

#### 51. Reconciliación de evidencia actual

La evidencia se clasifica así:

| Evidencia observada                                                                         | Decisión documental                                             |
| ------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `@vento/os-context` runtime contiene fuente `simulation`, `simulation_id` e `is_simulation` | no adoptar el tipo runtime completo como prop pública del aviso |
| el mismo tipo runtime aún contiene `can_operate`                                            | no trasladar ese booleano ambiguo al componente visual          |
| el template histórico escribe una cookie de role override                                   | no convertir cookie cliente en contrato de simulación           |
| el template histórico ofrece selector de roles                                              | separar selector legacy del aviso compartido                    |
| existen helpers `role-override.ts` en varios consumidores                                   | asignar reconciliación posterior a migración coordinada         |
| `AUTH-SIM-006` separa autoridad real de simulada                                            | ubicar el componente solo en el plano de presentación           |
| `AUTH-SIM-007` conserva aviso persistente como responsabilidad propia                       | no adelantar su política completa desde UI009                   |
| TREQ vigentes exigen indicador persistente y cero efectos reales                            | reutilizar cobertura existente sin duplicar requisitos          |

---

#### 52. Decisión de no legitimar el patrón legacy

`SHELL-UI-009` no adopta como API canónica:

```text
ROLE_OVERRIDE_COOKIE
PRIVILEGED_ROLE_OVERRIDES
ROLE_OPTIONS
setCookieValue
handleRoleOverride
Usar rol real
```

Estos nombres y mecanismos observados son evidencia de implementación actual o histórica.

No se convierten por esta tarea en:

- contrato de simulación;
- contrato de autoridad;
- API de `@vento/ui-web`;
- mecanismo de persistencia del nuevo componente;
- mecanismo de salida del nuevo componente.

La migración deberá clasificar qué se conserva, adapta o retira bajo los contratos canónicos vigentes.

---

#### 53. Concurrencia y estado obsoleto

El componente no conserva una simulación anterior por estado interno.

Si la composición propietaria cambia de escenario, rol o deja de considerar válida la simulación, deberá volver a renderizar o desmontar el aviso con la proyección vigente.

`SimulatedRoleNotice` no:

- aplica respuestas tardías;
- mantiene una cola de simulaciones;
- resuelve carreras;
- escoge qué escenario gana;
- conserva un rol anterior después de recibir nuevas props;
- reintenta automáticamente.

La invalidación autoritativa pertenece a las capas propietarias.

---

#### 54. Conectividad y offline

El aviso no crea semántica offline propia.

No:

- inicia simulación offline;
- prolonga una simulación porque la red cayó;
- convierte la última simulación conocida en estado vigente;
- persiste snapshots para reutilizarlos como autoridad;
- encola acciones durante una simulación;
- reintenta efectos al recuperar conectividad.

Una aplicación puede mostrar una proyección ya preparada según su contrato de conectividad, pero el componente no decide si esa proyección sigue siendo válida.

---

#### 55. Composición con patrones compartidos

Una superficie puede componer:

```text
ContextIndicator
SimulatedRoleNotice
SiteSelector
AreaSelector
Alert
Button
```

según corresponda.

Cada pieza conserva su responsabilidad:

- `ContextIndicator`: contexto confirmado;
- `SimulatedRoleNotice`: condición especializada de rol simulado;
- `SiteSelector`: intención de cambio de sede real cuando el contrato lo permita;
- `AreaSelector`: intención de cambio de área real cuando el contrato lo permita;
- `Alert`: mensaje contextual no cubierto por una pieza especializada;
- `Button`: acción explícita con su propio contrato.

La composición no autoriza a una pieza visual a asumir la responsabilidad de otra.

---

#### 56. `className`, estilos y layout

La implementación podrá admitir extensión visual compatible con el sistema de diseño.

`className`, `style` o atributos equivalentes no podrán:

- ocultar el carácter simulado;
- ocultar el rol simulado;
- hacer depender el significado solo de color;
- convertir el aviso en toast autocerrable;
- eliminar contenido accesible esencial;
- romper contraste;
- romper reflow;
- romper zoom;
- introducir una acción de cierre no prevista;
- fabricar variantes de autoridad.

No se crea una prop funcional `authorized`, `executable`, `admin`, `operational` o `real` que cambie la naturaleza del componente.

---

#### 57. Compatibilidad y versionado

La futura superficie pública deberá gobernarse con SemVer.

Cambios potencialmente incompatibles incluyen:

- renombrar `simulatedRoleLabel`;
- cambiar la semántica de `nonExecutableLabel`;
- introducir cierre local;
- introducir inicio o salida de simulación;
- introducir selección de rol;
- convertir una prop visual en fuente de autoridad;
- adoptar `EffectiveContext` como prop obligatoria;
- introducir dependencia directa de Supabase;
- introducir persistencia propia;
- introducir `canOperate` como guard visual;
- cambiar la semántica accesible del aviso;
- convertir la región persistente en mensaje efímero;
- retirar props sin ventana de compatibilidad.

Una necesidad local no se incorpora silenciosamente a la API común.

---

#### 58. Estrategia posterior de migración

La migración física no ocurre en `SHELL-UI-009`.

La fase propietaria posterior deberá:

1. inventariar avisos, selectores de rol, cookies y helpers de override reales;
2. separar simulación canónica, modo de prueba legacy, impersonación técnica y simples filtros visuales;
3. identificar las fuentes actuales de rol y persistencia;
4. clasificar cada implementación como activa, compartible, local válida, legacy o sin consumidor;
5. asignar lotes reversibles por repositorio;
6. materializar el componente compartido cuando corresponda;
7. adaptar consumidores sin convertir el aviso en fuente de autoridad;
8. eliminar dependencia autoritativa de cookies u overrides locales cuando el paquete propietario lo ordene;
9. probar accesibilidad, persistencia visual, cero efectos y paridad;
10. retirar únicamente copias con ausencia de uso residual demostrada.

---

#### 59. Handoff a migración coordinada

Responsabilidades posteriores:

| Tarea           | Handoff de `SimulatedRoleNotice`                                                  |
| --------------- | --------------------------------------------------------------------------------- |
| `SHELL-MIG-001` | inventariar avisos, selectores, overrides, cookies, helpers y consumidores reales |
| `SHELL-MIG-002` | separar lotes reversibles por repositorio                                         |
| `SHELL-MIG-003` | preparar compatibilidad temporal y bloquear nuevas copias legacy                  |
| `SHELL-MIG-004` | impedir que scaffolds históricos reintroduzcan patrones divergentes               |
| `SHELL-MIG-005` | adoptar el componente compartido donde la clasificación lo determine              |
| `SHELL-MIG-006` | verificar accesibilidad, tema, densidad y responsive                              |
| `SHELL-MIG-007` | demostrar paridad contractual, no ejecución y comportamiento por consumidor       |
| `SHELL-MIG-008` | retirar únicamente artefactos sin uso residual                                    |

No se adelanta ninguno de esos cambios.

---

#### 60. Handoff a calidad y releases

La materialización futura conserva los propietarios ya definidos para paquetes compartidos:

| Tarea          | Responsabilidad                                      |
| -------------- | ---------------------------------------------------- |
| `SHELL-CI-001` | pruebas propias del package                          |
| `SHELL-CI-002` | build independiente                                  |
| `SHELL-CI-003` | releases versionados                                 |
| `SHELL-CI-004` | changelog                                            |
| `SHELL-CI-005` | matriz de compatibilidad                             |
| `SHELL-CI-006` | actualización controlada de consumidores mediante PR |

`SHELL-UI-009` define el contrato; no publica una versión.

---

#### 61. Contrato futuro de prueba

La implementación física y su adopción deberán demostrar, como mínimo:

1. renderizado del aviso con un rol simulado válido ya preparado;
2. título visible;
3. etiqueta de rol simulado visible;
4. descripción visible;
5. naturaleza no ejecutable visible cuando sea suministrada;
6. ausencia de `active` como fuente interna de verdad;
7. ausencia de `onDismiss`;
8. ausencia de cierre por timeout;
9. ausencia de toast autocerrable;
10. ausencia de `onStartSimulation`;
11. ausencia de `onStopSimulation`;
12. ausencia de `onRoleChange`;
13. ausencia de selector de roles dentro del aviso;
14. ausencia de persistencia propia;
15. ausencia de escritura de cookies;
16. ausencia de lectura de cookies de override;
17. ausencia de lectura o escritura de storage;
18. ausencia de query parameters como fuente de simulación;
19. ausencia de consulta Supabase;
20. ausencia de RPC dentro del componente;
21. ausencia de `canOperate` como prop o guard;
22. ausencia de permisos o grants en la API base;
23. ausencia de `EffectiveContext` como prop pública obligatoria;
24. ausencia de dependencia runtime directa de `@vento/os-context` para presentación;
25. ausencia de mutaciones empresariales;
26. ausencia de lecturas protegidas ampliadas por rol simulado;
27. coexistencia con `ContextIndicator` sin reemplazar contexto confirmado;
28. coexistencia con selectores reales sin convertirlos en territorio simulado;
29. re-render con nuevo rol sin conservar etiqueta anterior por estado interno;
30. desmontaje sin registrar por sí mismo una salida autoritativa;
31. montaje sin registrar por sí mismo un inicio autoritativo;
32. fallo visual que no desactive enforcement server-side;
33. texto explícito que no dependa solo de color;
34. icono opcional no usado como única señal;
35. contraste suficiente;
36. zoom;
37. reflow;
38. viewport estrecho;
39. lector de pantalla capaz de descubrir la condición;
40. ausencia de anuncio assertivo repetitivo por re-render ordinario;
41. ausencia de robo de foco;
42. ausencia de tab stop innecesario;
43. ausencia de hover obligatorio para información esencial;
44. SSR compatible cuando la composición entregue props seguras;
45. copy técnico sensible ausente;
46. reason codes internos ausentes del contenido base;
47. tokens, IDs de sesión y secretos ausentes del contenido base;
48. paridad entre consumidores antes de retirar avisos existentes;
49. rollback verificable por lote de migración;
50. demostración de que ninguna variante visual concede autoridad.

Esta lista define evidencia futura. No declara implementación ni ejecución de pruebas en esta tarea.

---

#### 62. Cobertura de requisitos existente

La tarea no necesita introducir una obligación transversal nueva porque el registro vigente ya cubre de forma específica:

- separación de simulación y autoridad real, aviso persistente, bloqueo aplicable y auditoría: `TREQ-AUTH-012`;
- separación en cuatro planos y exclusividad del `ALLOW` ejecutable para autoridad real: `TREQ-AUTH-119`;
- resultados simulados limitados a `WOULD_ALLOW`, `WOULD_DENY` e `INDETERMINATE` con `executable=false`: `TREQ-AUTH-120`;
- separación de tipos, APIs, caches y consumidores reales y simulados: `TREQ-AUTH-121`;
- lectura de datos reales y RLS exclusivamente desde autoridad real: `TREQ-AUTH-122`;
- rechazo de autoridad simulada para mutaciones y efectos: `TREQ-AUTH-123`;
- controles simulados únicamente en superficies de preview no ejecutables: `TREQ-AUTH-124`;
- prohibición de completar un plano desde el otro: `TREQ-AUTH-125`;
- separación de sesiones, tokens, cookies, claims, storage y cache entre propósitos: `TREQ-AUTH-126`;
- auditoría separada del actor real y el escenario hipotético: `TREQ-AUTH-127`;
- simulación, role override cookie y otros atajos incapaces de satisfacer un permiso base real: `TREQ-AUTH-165`;
- bloqueo explícito de intentos de ejecución con procedencia simulada: `TREQ-AUTH-279`;
- separación física de autoridad, evaluación, presentación y auditoría: `TREQ-AUTH-280`;
- clasificación de preview y controles inertes: `TREQ-AUTH-281`;
- rechazo multicanal de procedencia simulada antes de efectos: `TREQ-AUTH-282`;
- salida y nueva autorización real antes de ejecutar después de una simulación: `TREQ-AUTH-283`;
- consistencia de causas y canales: `TREQ-AUTH-284`, `TREQ-AUTH-285`;
- cobertura de las diez aplicaciones sin autoridad simulada: `TREQ-AUTH-286`;
- indicador persistente, copy no ejecutable, confirmación de cero cambios y minimización de datos internos: `TREQ-AUTH-287`;
- reconciliación física de APIs, tipos y patrones legacy que mezclan simulación y contexto efectivo: `TREQ-AUTH-288`;
- responsabilidades compartidas clasificadas y reconciliadas antes de adopción o retiro: `TREQ-SHELL-002`, `TREQ-SHELL-032`;
- template histórico separado de runtime: `TREQ-SHELL-029`;
- autoridad real separada de role overrides y controles cliente: `TREQ-SHELL-031`;
- versionado, deprecación y retiro seguro de paquetes compartidos: `TREQ-SHELL-036` a `TREQ-SHELL-039`.

`SHELL-UI-009` especializa estas obligaciones en el contrato de presentación de `SimulatedRoleNotice` sin crear una regla material nueva ni adelantar las decisiones pendientes de `AUTH-SIM-007` a `AUTH-SIM-011`.

---

#### 63. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos descartados:** 0

La cobertura vigente ya protege aviso persistente, separación entre autoridad real y simulada, preview no ejecutable, cero efectos, privacidad, multicanalidad, invalidación, auditoría y reconciliación de patrones legacy. Esta tarea únicamente fija la API visual compartida y sus fronteras dentro de esa cobertura existente.

---

#### 64. Estado de materialización física

Al cierre documental de `SHELL-UI-009`:

```text
IDENTIDAD SimulatedRoleNotice            = ESPECIFICADA
SimulatedRoleNoticeProps                 = ESPECIFICADO CONCEPTUALMENTE
ROL SIMULADO / ROL REAL                  = SEPARADOS
PRESENTACIÓN / AUTORIDAD                 = SEPARADAS
AVISO VISUAL                             = NO DESCARTABLE MIENTRAS ESTÁ MONTADO
INICIO / SALIDA DE SIMULACIÓN            = FUERA DEL COMPONENTE
BLOQUEO DE ACCIONES                      = FUERA DEL COMPONENTE
MODO SOLO LECTURA                        = FUERA DEL COMPONENTE
AUDITORÍA                                = FUERA DEL COMPONENTE
PERSISTENCIA DE NEGOCIO                  = FUERA DEL COMPONENTE
ACCESIBILIDAD                            = ESPECIFICADA DOCUMENTALMENTE
FRONTERA CLIENTE                         = MÍNIMA / NO OBLIGATORIA PARA TEXTO
MATERIALIZACIÓN FÍSICA                   = PENDIENTE DE FASE PROPIETARIA
```

No existe en esta tarea un archivo TypeScript nuevo ni una exportación física nueva.

---

#### 65. Decisiones vinculantes

Quedan fijadas las siguientes decisiones documentales:

1. El componente compartido conceptual se denomina `SimulatedRoleNotice`.
2. Pertenece conceptualmente a `@vento/ui-web`.
3. Su responsabilidad es exclusivamente visual, semántica y accesible.
4. El componente no determina si una simulación está activa.
5. La composición propietaria decide cuándo renderizarlo.
6. La API base no incluye `active` ni `isSimulated` como fuente de verdad interna.
7. La API conceptual mínima usa `title`, `simulatedRoleLabel`, `description` y `nonExecutableLabel`.
8. Los textos son suministrados por la capa propietaria.
9. La tarea no congela el copy empresarial completo antes de `AUTH-SIM-007`.
10. `simulatedRoleLabel` es etiqueta humana, no identidad autoritativa.
11. El componente no recibe catálogo de roles.
12. El componente no recibe permisos ni grants.
13. El componente no recibe `EffectiveContext` como prop pública obligatoria.
14. El componente no recibe `canOperate`.
15. El componente no interpreta `WOULD_ALLOW` como `ALLOW`.
16. El componente pertenece al plano de presentación, no al de autoridad, evaluación o auditoría.
17. Mientras esté montado, el aviso debe permanecer perceptible.
18. No existe `onDismiss` ni cierre local.
19. No existe autocierre por timeout.
20. No existe `onStartSimulation`.
21. No existe `onStopSimulation`.
22. No existe `onRoleChange`.
23. El aviso no contiene un selector de rol.
24. El aviso no escribe cookies.
25. El aviso no lee cookies de override.
26. El aviso no usa storage como fuente de simulación.
27. El aviso no usa URL como fuente de simulación.
28. El aviso no consulta Supabase.
29. El aviso no ejecuta RPC.
30. El aviso no ejecuta mutaciones empresariales.
31. El aviso no amplía lecturas protegidas.
32. RLS sigue usando autoridad real.
33. La sesión real no se modifica.
34. `ContextIndicator` puede coexistir con el aviso y no es sustituido.
35. `SiteSelector` y `AreaSelector` conservan sus responsabilidades propias.
36. El aviso no define el AppShell completo.
37. La ubicación sistémica dentro del chrome no se congela en esta tarea.
38. `AUTH-SIM-007` conserva la política completa de aviso persistente.
39. `AUTH-SIM-008` conserva el registro de inicio.
40. `AUTH-SIM-009` conserva el registro de salida.
41. `AUTH-SIM-010` conserva el bloqueo de acciones críticas.
42. `AUTH-SIM-011` conserva la definición del modo solo lectura.
43. Montar el componente no equivale a iniciar una simulación.
44. Desmontarlo no equivale a cerrar una simulación.
45. Un fallo del aviso no puede desactivar enforcement autoritativo.
46. La condición de simulación no depende solo de color o icono.
47. El contenido esencial permanece accesible por lector de pantalla.
48. No se usa anuncio assertivo repetitivo por defecto.
49. El componente no roba foco.
50. El componente no introduce tab stops obligatorios.
51. La API minimiza datos sensibles y técnicos.
52. El template histórico `Modo prueba` se trata como evidencia legacy, no como contrato objetivo.
53. La cookie de role override observada no se canoniza.
54. Los helpers locales de override no se vuelven dependencia del componente.
55. La reconciliación física queda para migración coordinada.
56. Las pruebas, build, release y compatibilidad quedan en sus tareas propietarias.
57. Se crean 0 requisitos de prueba y se modifican 0.
58. No se adelanta la tarea siguiente.

---

#### 66. Criterios de aceptación documental

`SHELL-UI-009` queda documentalmente cerrada únicamente si se cumplen simultáneamente:

- [x] la continuidad real apunta de la tarea anterior a `SHELL-UI-009`;
- [x] existe una identidad única para el componente;
- [x] se fija su pertenencia a `@vento/ui-web`;
- [x] se define su responsabilidad estrictamente presentacional;
- [x] se define una API conceptual mínima;
- [x] se evita adoptar `EffectiveContext` como prop pública obligatoria;
- [x] se evita adoptar `canOperate` como guard visual;
- [x] se separa rol simulado de rol real;
- [x] se separa presentación de autoridad;
- [x] se mantiene la separación de los cuatro planos;
- [x] se evita convertir resultados hipotéticos en `ALLOW`;
- [x] se evita toda mutación empresarial desde el componente;
- [x] se evita ampliar lecturas protegidas desde la simulación;
- [x] se conserva RLS bajo autoridad real;
- [x] se evita modificación de sesión real;
- [x] se define el aviso como perceptible mientras está montado;
- [x] se prohíbe cierre local;
- [x] se prohíbe autocierre por timeout;
- [x] se excluye inicio de simulación;
- [x] se excluye salida de simulación;
- [x] se excluye cambio de rol;
- [x] se excluye selector de roles dentro del aviso;
- [x] se asigna la política completa de aviso a `AUTH-SIM-007`;
- [x] se asignan inicio y salida a `AUTH-SIM-008` y `AUTH-SIM-009`;
- [x] se asigna bloqueo de acciones a `AUTH-SIM-010`;
- [x] se asigna modo solo lectura a `AUTH-SIM-011`;
- [x] se separa el aviso de `ContextIndicator`;
- [x] se separa el aviso de selectores territoriales;
- [x] no se congela arquitectura completa de AppShell;
- [x] se prohíben dependencias de Supabase, RPC, cookies, storage y router propietario;
- [x] se minimizan datos sensibles y técnicos;
- [x] se especifica semántica HTML persistente;
- [x] se evita un `role="alert"` assertivo repetitivo por defecto;
- [x] se evita dependencia exclusiva de color o icono;
- [x] se especifican foco, teclado, zoom, reflow y responsive;
- [x] se reconcilia el template histórico `Modo prueba` sin canonizarlo;
- [x] se reconocen helpers de override actuales sin convertirlos en autoridad;
- [x] se asigna inventario, adopción y retiro a migración coordinada;
- [x] se asignan pruebas, build, release y compatibilidad a tareas propietarias;
- [x] no se modifica código, Supabase, consumidores o configuración;
- [x] se declaran 0 cambios TREQ con cobertura existente concreta;
- [x] no queda una decisión material de esta tarea sin propietario.

Resultado documental:

```text
AVISO DE ROL SIMULADO COMPARTIDO   = ESPECIFICADO
API CONCEPTUAL                     = CERRADA
PRESENTACIÓN / AUTORIDAD           = SEPARADAS
ROL SIMULADO / ROL REAL            = SEPARADOS
CIERRE LOCAL                       = PROHIBIDO
CICLO DE VIDA DE SIMULACIÓN        = EXTERNO
EJECUCIÓN REAL                     = FUERA DEL COMPONENTE
COPY EMPRESARIAL COMPLETO          = BAJO TAREA PROPIETARIA
MATERIALIZACIÓN FÍSICA             = PENDIENTE DE FASE PROPIETARIA
```

---

#### 67. Límites de la tarea

Esta tarea no autoriza:

- crear archivos TypeScript del componente;
- modificar `@vento/ui-web` físicamente;
- modificar `@vento/os-context`;
- modificar contratos de simulación;
- modificar contratos de autorización;
- iniciar o terminar simulaciones;
- crear un selector de roles;
- definir el copy definitivo completo de `AUTH-SIM-007`;
- registrar inicio o salida de simulación;
- definir enforcement de acciones críticas;
- definir el modo solo lectura;
- crear o alterar tablas;
- crear o alterar columnas;
- crear RPC;
- modificar RLS;
- modificar datos;
- cambiar configuración de Supabase;
- editar consumidores;
- retirar overrides actuales;
- cambiar roles, sedes, áreas, turnos o check-ins;
- ejecutar una migración;
- publicar un package;
- crear un release;
- cambiar continuidad canónica;
- iniciar la tarea siguiente.

---

#### 68. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-UI-008 — Compartir selector de área`

**TAREA ACTUAL APROBADA**
`SHELL-UI-009 — Compartir aviso de rol simulado`

**SIGUIENTE TAREA RESERVADA**
`SHELL-UI-010 — Evaluar AppShell compartido`


### ✅ SHELL-UI-010 — Evaluar AppShell compartido

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-009 — Compartir aviso de rol simulado
**Tarea siguiente:** SHELL-UI-011 — Compartir navegación orientada a tareas
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida
**Paquete propietario:** `@vento/ui-web`
**Naturaleza:** evaluación y decisión canónica sobre la compartición del marco AppShell web, su contrato composicional, fronteras de responsabilidad, consumidores, adopción y handoffs posteriores, sin materializar package físico, migrar consumidoras, alterar autorización, modificar Supabase, publicar releases ni desplegar cambios.

---

#### 1. Propósito

Resolver de forma explícita si Vento OS debe compartir un AppShell web entre aplicaciones y, en caso afirmativo, definir qué parte de la familia histórica `VentoShell` / `VentoChrome` pertenece realmente a una superficie compartida.

La tarea evita dos extremos incompatibles:

1. mantener copias locales completas de shell que continúen derivando entre repositorios;
2. trasladar a `@vento/ui-web` autenticación, permisos, contexto, navegación empresarial o lógica de dominio que no pertenece a una capa presentacional.

El resultado debe permitir una futura adopción progresiva por consumidor sin imponer despliegue simultáneo ni convertir la UI en autoridad.

---

#### 2. Pregunta evaluada

La pregunta canónica es:

```text
¿DEBE EXISTIR UN APPSHELL WEB COMPARTIDO?
```

La respuesta aprobada es:

```text
SÍ
```

con una condición estructural obligatoria:

```text
APPSHELL COMPARTIDO
=
MARCO VISUAL + COMPOSICIÓN + LANDMARKS + RESPONSIVE + INTERACCIÓN LOCAL DE CHROME

APPSHELL COMPARTIDO
≠
AUTENTICACIÓN + AUTORIZACIÓN + CONTEXTO + DATOS + NAVEGACIÓN EMPRESARIAL + GATING
```

---

#### 3. Base documental consumida

La decisión conserva las fronteras ya aprobadas para `@vento/ui-web`:

- propiedad de UI presentacional web reutilizable;
- ausencia de dependencia directa de `@vento/supabase`;
- autorización de servidor fuera de la UI;
- lógica empresarial específica de cada aplicación fuera del package;
- adopción independiente de los siete consumidores previstos;
- distinción entre componentes server-safe e interactivos;
- compatibilidad, deprecación y rollback antes de retirar copias legacy.

También conserva las decisiones previas de los componentes de contexto, sede, área y simulación: el AppShell puede componerlos, pero no absorbe su autoridad ni redefine su contrato.

---

#### 4. Base técnica inspeccionada

La evaluación utiliza como evidencia técnica actual:

- el AppShell histórico de `vento-shell` bajo `templates/app-shell-standard`;
- el runtime actual de `vento-shell` como launcher propio;
- las implementaciones actuales de `VentoShell` y `VentoChrome` en NEXO;
- las implementaciones actuales de `VentoShell` y `VentoChrome` en FOGO;
- las implementaciones actuales de `VentoShell` y `VentoChrome` en ORIGO;
- las implementaciones actuales de `VentoShell` y `VentoChrome` en VISO;
- las implementaciones actuales de `VentoShell` y `VentoChrome` en PULSO;
- las implementaciones actuales de `VentoShell` y `VentoChrome` en NUMERA;
- la ausencia actual de un package físico `@vento/ui-web` dentro de `packages/`.

La evidencia confirma una familia visual repetida, pero también una mezcla sustantiva de responsabilidades de aplicación que impide adoptar cualquiera de las copias actuales como API compartida íntegra.

---

#### 5. Resultado documental

Se aprueba el componente conceptual:

```text
AppShell
```

como parte futura de:

```text
@vento/ui-web
```

Su responsabilidad es proporcionar el marco estructural y presentacional de una aplicación web Vento OS mediante composición de slots ya preparados por el consumidor.

No se aprueba como implementación canónica ninguna copia actual de `VentoShell` ni `VentoChrome`.

---

#### 6. Decisión principal

El AppShell compartido será un **componente de composición**, no un orquestador de aplicación.

La dirección aprobada es:

```text
CAPAS PROPIETARIAS DE LA APLICACIÓN
        ↓
RESUELVEN IDENTIDAD, AUTORIZACIÓN, CONTEXTO, DATOS Y NAVEGACIÓN
        ↓
PREPARAN PIEZAS PRESENTACIONALES
        ↓
AppShell
        ↓
COMPONE CHROME Y CONTENIDO
```

Queda prohibida la dirección inversa:

```text
AppShell
        ✕
RESOLVER AUTORIDAD
        ✕
CONSULTAR DATOS DE DOMINIO
        ✕
INFERIR CONTEXTO
        ✕
DECIDIR NAVEGACIÓN PERMITIDA
```

---

#### 7. Definición canónica de AppShell

`AppShell` es el marco visual superior que organiza, cuando existan:

- identidad de aplicación;
- navegación suministrada por el consumidor;
- contexto visible suministrado por el consumidor;
- avisos persistentes suministrados por el consumidor;
- acciones utilitarias de cabecera;
- contenido principal de la aplicación.

No es una pantalla empresarial, un guard, un middleware, un resolver de contexto ni un proveedor de datos.

---

#### 8. Lo que AppShell no representa

No se utilizará `AppShell` como sinónimo de:

- sesión autenticada;
- autorización efectiva;
- `AccessContext`;
- `EffectiveContext` legacy;
- menú de permisos;
- router empresarial;
- selector de sede;
- selector de área;
- simulador de roles;
- AppSwitcher;
- ProfileMenu;
- página de bloqueo;
- layout específico de kiosco;
- proceso empresarial.

Cualquiera de esas piezas podrá coexistir dentro o alrededor del AppShell cuando su propietario la haya resuelto y su contrato lo permita.

---

#### 9. Identidad pública conceptual

La superficie conceptual queda formada por:

```text
AppShell
AppShellProps
```

Esta tarea no fija:

- subpath físico de exportación;
- archivo fuente definitivo;
- nombre de entrypoint npm;
- versión SemVer inicial;
- clases CSS públicas concretas;
- implementación del package;
- migración automática de consumidoras.

---

#### 10. Superficie conceptual de props

La API conceptual mínima queda definida como:

```ts
type AppShellProps = {
  children: React.ReactNode;
  brand: React.ReactNode;
  navigation?: React.ReactNode;
  navigationLabel?: string;
  context?: React.ReactNode;
  notices?: React.ReactNode;
  headerActions?: React.ReactNode;
};
```

Regla semántica adicional:

```text
navigation presente
→ navigationLabel perceptible obligatorio
```

La materialización física podrá expresar esta relación mediante tipos más estrictos sin alterar su significado.

---

#### 11. Slot `brand`

`brand` identifica visualmente la aplicación actual.

Puede contener:

- marca Vento OS;
- nombre de la aplicación;
- icono o logotipo;
- descripción corta de la superficie.

No debe determinar por sí mismo:

- `AppCode` autoritativo;
- permiso de acceso;
- dominio productivo;
- contexto;
- disponibilidad operacional.

La identidad presentada deberá provenir de información ya gobernada por el consumidor.

---

#### 12. Slot `navigation`

`navigation` recibe una superficie de navegación ya preparada.

`AppShell` se limita a ubicarla y controlar su presentación responsive.

No recibe ni interpreta como contrato propio:

- `permissionCode`;
- `required`;
- `anyOf`;
- `navGroups`;
- matrices de rol;
- rutas permitidas;
- acciones empresariales.

La ausencia de `navigation` es válida para superficies cuyo modelo no requiera navegación lateral persistente.

---

#### 13. `navigationLabel`

Cuando exista navegación, `navigationLabel` proporciona el nombre humano y accesible de la región y de sus controles de apertura o cierre cuando corresponda.

No se fija una etiqueta española universal dentro del package.

Reglas:

- deberá ser texto humano;
- deberá ser localizable por el consumidor;
- no deberá contener códigos técnicos de permiso;
- no deberá derivarse del nombre de ruta;
- deberá conservar significado entre desktop y móvil.

---

#### 14. Slot `context`

`context` recibe exclusivamente una proyección visual ya preparada.

La composición esperada podrá incluir piezas como:

```text
ContextIndicator
SiteSelector
AreaSelector
```

cuando la superficie y la autoridad resuelta lo permitan.

`AppShell` no decide cuál sede, área, turno, rol, actor o dispositivo está activo y no convierte una selección en contexto confirmado.

---

#### 15. Slot `notices`

`notices` aloja avisos persistentes o contextuales que deban permanecer perceptibles dentro del chrome.

Puede incluir, según el caso:

```text
SimulatedRoleNotice
Alert
```

La presencia de un aviso no autoriza al AppShell a:

- resolver su causa;
- cerrarlo por decisión empresarial;
- iniciar o terminar una simulación;
- ejecutar recuperación;
- cambiar permisos.

---

#### 16. Slot `headerActions`

`headerActions` aloja acciones utilitarias preparadas por la aplicación, por ejemplo:

- cambio de aplicación ya gobernado;
- perfil;
- sesión;
- ayuda;
- controles auxiliares no empresariales.

El slot no presupone que `AppSwitcher` o `ProfileMenu` formen parte integral del AppShell.

La capa propietaria conserva:

- datos de perfil;
- cierre de sesión;
- catálogo de aplicaciones;
- disponibilidad;
- enlaces;
- autorización.

---

#### 17. Slot `children`

`children` contiene la superficie principal de proceso o aplicación.

`AppShell` no inspecciona sus acciones ni decide:

- proceso;
- etapa;
- recurso;
- permiso;
- estado empresarial;
- idempotencia;
- confirmación;
- persistencia.

Su función es proporcionar un contenedor principal consistente y accesible.

---

#### 18. Contrato estructural de layout

La estructura conceptual ordinaria es:

```text
AppShell
├─ brand
├─ navigation
├─ context
├─ notices
├─ headerActions
└─ main
   └─ children
```

El orden visual podrá adaptarse por breakpoint, pero no deberá romper el orden semántico ni ocultar información material necesaria para actuar con seguridad.

---

#### 19. Landmarks semánticos

La implementación compartida deberá conservar landmarks comprensibles:

- cabecera;
- navegación, cuando exista;
- contenido principal;
- regiones auxiliares únicamente cuando aporten semántica real.

Reglas:

1. debe existir un único contenido principal del AppShell;
2. el usuario debe poder saltar al contenido principal;
3. una navegación colapsada no debe permanecer interactiva de forma invisible;
4. los controles de apertura deberán comunicar estado expandido;
5. no se crearán landmarks redundantes por decoración.

---

#### 20. Responsividad

La responsabilidad compartida incluye el reflow del marco general entre anchos ordinarios de escritorio y móvil.

El AppShell deberá permitir:

- navegación lateral en ancho suficiente;
- navegación temporal o disclosure en ancho reducido;
- cabecera que refluya sin solapar controles;
- contexto y avisos visibles o inmediatamente perceptibles;
- contenido principal sin scroll horizontal estructural ordinario;
- zoom sin pérdida de contenido esencial.

La responsividad no autoriza a esconder contexto material únicamente dentro de un menú de perfil.

---

#### 21. Disclosure de navegación móvil

Cuando exista `navigation`, el AppShell puede ser propietario del estado local de presentación necesario para abrir y cerrar la navegación en móvil.

Ese estado es exclusivamente visual.

Puede controlar:

- abierto / cerrado;
- overlay;
- retorno de foco;
- cierre al activar la navegación cuando la composición lo solicite de manera presentacional.

No puede controlar:

- qué rutas existen;
- qué ruta está autorizada;
- qué acción debe ejecutarse;
- qué contexto debe activarse.

---

#### 22. Navegación en escritorio

En escritorio el AppShell puede proporcionar un contenedor lateral persistente y, si la implementación futura lo decide, una preferencia visual de expansión o compactación.

La compactación:

- no cambia permisos;
- no elimina elementos de la navegación propietaria;
- no cambia el contexto;
- no transforma un item oculto visualmente en item no autorizado;
- debe conservar nombres accesibles para controles visibles.

---

#### 23. Persistencia de preferencias visuales

La persistencia de un estado puramente visual como sidebar expandido o compacto **no forma parte del contrato obligatorio** de `AppShell`.

Si una implementación posterior conserva una preferencia local, deberá cumplir:

```text
PREFERENCIA VISUAL
≠
AUTORIDAD
≠
CONTEXTO
≠
PERMISO
```

Por tanto no se canoniza el uso actual de `localStorage` observado en copias runtime como requisito del componente.

---

#### 24. Cabecera compartida

El AppShell define la región de cabecera, pero no su contenido empresarial.

La cabecera puede componer:

- identidad de aplicación;
- contexto compacto cuando la jerarquía lo requiera;
- avisos que deban permanecer perceptibles;
- acciones utilitarias.

No debe convertirse en repositorio de todos los estados de aplicación ni sustituir superficies especializadas.

---

#### 25. Contenido principal

El área principal deberá:

- ocupar el espacio disponible sin imponer anchura empresarial única;
- permitir que cada aplicación gestione densidad y layout interno;
- conservar foco y lectura coherentes después de abrir o cerrar navegación;
- no interceptar acciones de dominio;
- no introducir padding irreversible que impida patrones de pantalla completa cuando el consumidor lo necesite.

La implementación física deberá permitir una estrategia de espaciado compatible con los consumidores sin convertir cada necesidad local en una variante global.

---

#### 26. Visibilidad de contexto material

El AppShell es responsable de **reservar una ubicación composicional estable** para el contexto material, no de producirlo.

Cuando la superficie requiera contexto visible:

- no se ocultará exclusivamente dentro de `headerActions`;
- la compactación de navegación no lo eliminará;
- el cambio de breakpoint no lo convertirá en información solo por hover;
- un aviso de inconsistencia no dependerá únicamente de color;
- el contenido principal no deberá desplazarlo de forma que la persona pierda referencia durante acciones materiales ordinarias.

---

#### 27. Relación con simulación visible

El AppShell no integra una variante propia `simulated`.

La composición correcta es:

```text
AppShell.notices
        ↓
SimulatedRoleNotice
```

La capa propietaria decide cuándo existe una simulación presentable y mantiene el aviso según su ciclo de vida autoritativo.

El AppShell únicamente asegura que la región de avisos pueda permanecer visible en su estructura.

---

#### 28. Relación con selectores de sede y área

Los selectores no se incorporan como props especializadas del AppShell.

La composición aprobada permite:

```text
AppShell.context
        ↓
ContextIndicator
+
SiteSelector
+
AreaSelector
```

La capa propietaria conserva solicitud, elegibilidad, confirmación, receipt, error y actualización del contexto.

El AppShell no lee query parameters, cookies o storage para decidir sede o área.

---

#### 29. Relación con AppSwitcher y ProfileMenu

Los patrones actuales `AppSwitcher` y `ProfileMenu` aparecen dentro de las copias de chrome, pero no se convierten por esa evidencia en componentes obligatorios del AppShell.

Decisión:

| Patrón                            | Decisión dentro de UI010                                                    |
| --------------------------------- | --------------------------------------------------------------------------- |
| AppSwitcher                       | contenido candidato de `headerActions`; contrato propio fuera de esta tarea |
| ProfileMenu                       | contenido candidato de `headerActions`; datos y sesión permanecen fuera     |
| selector de sede dentro de perfil | no pertenece al AppShell                                                    |
| role override dentro de perfil    | no pertenece al AppShell                                                    |

---

#### 30. Frontera de navegación empresarial

Esta tarea **no define el modelo de navegación orientada a tareas**.

El AppShell solo aprueba el slot y el contenedor visual necesarios para recibir una navegación ya preparada.

La tarea reservada indicada en la cabecera conserva la propiedad sobre:

- modelo de items;
- agrupación;
- estados;
- rutas;
- descubribilidad;
- vínculo con tareas y procesos;
- reglas de presentación de navegación.

El AppShell no adelanta esas decisiones.

---

#### 31. Frontera de autorización

`AppShell` no constituye una frontera de seguridad.

Queda prohibido utilizarlo para:

- conceder acceso porque un item se renderiza;
- denegar acceso porque un item se oculta;
- resolver permisos por nombre de rol;
- aceptar `canOperate` como autoridad;
- confiar en un booleano de interfaz para una mutación;
- omitir protección de servidor, RPC o RLS.

La visibilidad presentacional debe corresponder a decisiones ya resueltas, pero nunca las sustituye.

---

#### 32. Frontera de contexto

`AppShell` no recibe como requisito público un objeto canónico completo de contexto.

No se incorpora como prop:

```text
accessContext
simulationContext
effectiveContext
isSimulated
siteId
areaId
shiftId
role
```

La capa propietaria transforma el contexto autoritativo en componentes o textos presentacionales seguros antes de componer el AppShell.

---

#### 33. Frontera de datos y Supabase

Queda prohibido que el AppShell:

- cree un cliente Supabase;
- invoque RPC;
- consulte tablas;
- escriba preferencias empresariales;
- lea Auth;
- resuelva empleados;
- consulte sedes;
- consulte áreas;
- resuelva dispositivos compartidos.

El patrón histórico que realiza estas operaciones dentro de `VentoShell` o `VentoChrome` se clasifica como lógica a extraer de la futura superficie compartida.

---

#### 34. Frontera de gating empresarial

`OperatingGate` y sus equivalentes locales no forman parte del contrato de `AppShell`.

El AppShell puede renderizar el contenido que la aplicación propietaria decida mostrar, incluidos estados de bloqueo ya preparados, pero no determina:

- si una jornada es obligatoria;
- si existe turno;
- si existe check-in;
- si un dispositivo está autorizado;
- si un rol privilegiado puede entrar;
- si una acción está permitida.

Los gates continúan en sus contratos de autorización y experiencia propietarios.

---

#### 35. Frontera de rutas y router

La API pública del AppShell no depende de:

- `usePathname`;
- `useSearchParams`;
- query parameters;
- nombre de ruta;
- router global;
- rutas hardcodeadas de una aplicación.

Un componente de navegación compuesto puede utilizar integración de router conforme a su contrato, pero el AppShell no la necesita para decidir autoridad, contexto o estructura empresarial.

---

#### 36. Frontera de framework

`AppShell` pertenece al runtime web React previsto para `@vento/ui-web`.

La implementación compartida puede integrarse con aplicaciones Next.js, pero su contrato conceptual no exige:

- App Router;
- Pages Router;
- Server Actions;
- middleware;
- un proveedor Supabase;
- una ruta concreta.

Las bandas exactas de compatibilidad pertenecen al gobierno de packages y a la matriz de consumidores.

---

#### 37. Frontera server/client

A diferencia de primitivas puramente server-safe, el AppShell puede necesitar interacción cliente para:

- abrir o cerrar navegación móvil;
- mantener disclosure visual;
- gestionar foco asociado a ese disclosure;
- gestionar una compactación visual local.

Por tanto se clasifica conceptualmente como **superficie interactiva**.

Esta clasificación no convierte a `@vento/ui-web` completo en client-only y no autoriza introducir dentro del AppShell:

- red;
- Auth;
- permisos;
- Supabase;
- lógica empresarial.

Los slots pueden recibir contenido ya renderizado por capas propietarias compatibles con el modelo de composición React.

---

#### 38. Identidad de aplicación

El AppShell debe permitir que cada consumidor conserve su identidad visual sin bifurcar el componente.

La identidad se aporta mediante `brand`.

Quedan fuera del núcleo compartido:

- arrays locales de aplicaciones;
- `APP_CODE` inferido por nombre de repositorio;
- URLs de producción hardcodeadas;
- colores de negocio codificados dentro del componente;
- slogans fijos de una aplicación.

La superficie común compone identidad; no mantiene un segundo catálogo de aplicaciones.

---

#### 39. Tema y tokens

El AppShell utilizará el contrato visual compartido aprobado para UI web.

Deberá poder integrarse con:

- temas soportados;
- tokens de superficie, borde, texto, foco y elevación;
- densidades compatibles;
- componentes compartidos del mismo package.

No se copiarán dentro del componente estilos específicos de NEXO, FOGO, ORIGO, VISO, PULSO o NUMERA como estándar transversal.

---

#### 40. Accesibilidad

La responsabilidad compartida incluye:

- orden semántico;
- landmarks;
- nombre accesible de navegación;
- skip link o mecanismo equivalente hacia contenido principal;
- foco visible;
- apertura y cierre accesibles de navegación móvil;
- retorno de foco cuando corresponda;
- ausencia de contenido interactivo oculto en tab order;
- reflow y zoom;
- contraste conforme al contrato visual aplicable;
- señales que no dependan solo de color.

La aplicación continúa siendo responsable de la accesibilidad del contenido que inyecta en cada slot.

---

#### 41. Teclado y foco

El AppShell deberá permitir operación completa de su chrome sin ratón.

Como mínimo:

1. el control de navegación móvil debe ser alcanzable y operable;
2. su estado expandido debe ser perceptible;
3. cerrar el disclosure debe devolver foco de manera predecible;
4. el overlay no debe capturar foco fuera del patrón esperado;
5. la navegación oculta no debe quedar en tab order;
6. el contenido principal debe ser alcanzable directamente;
7. compactar sidebar no debe eliminar el nombre accesible de controles visibles.

---

#### 42. Movimiento y transición

Las transiciones del chrome serán presentacionales y respetarán preferencias de movimiento reducido.

No se utilizará animación para:

- retrasar un bloqueo;
- ocultar un cambio de contexto;
- comunicar autoridad;
- sustituir un estado textual;
- impedir interacción necesaria.

Una transición puede mejorar orientación espacial, pero no es evidencia de éxito empresarial.

---

#### 43. Privacidad y minimización

El AppShell no necesita conocer identidades empresariales completas.

Las capas propietarias deberán minimizar lo que colocan en `brand`, `context`, `notices` y `headerActions`.

No se utilizarán como contenido ordinario del marco:

- tokens;
- IDs de sesión;
- documento personal;
- secretos;
- payloads de autorización;
- detalles RLS;
- razones internas sensibles;
- datos del actor anterior en dispositivo compartido.

---

#### 44. Loading, error y ausencia

`AppShell` no crea un estado empresarial global `loading`, `error` o `blocked` como sustituto de los contratos propietarios.

Puede renderizar slots vacíos u omitir regiones opcionales cuando la capa propietaria todavía no dispone de contenido presentable.

Reglas:

- ausencia de `context` no implica contexto válido ni inválido;
- ausencia de `notices` no prueba inexistencia de incidentes;
- ausencia de `navigation` no prueba falta de permisos;
- `children` conserva la responsabilidad de mostrar estados de la superficie propietaria.

---

#### 45. Modo sin navegación persistente

El AppShell deberá soportar composición sin `navigation`.

Este modo permite consumidores como el launcher de SHELL, una superficie de acceso o una experiencia que no necesite sidebar.

En ese caso:

- no se renderiza un control móvil de menú vacío;
- no se reserva espacio lateral artificial;
- `brand`, `context`, `notices`, `headerActions` y `children` continúan disponibles según necesidad;
- no se inventa una navegación para uniformar visualmente aplicaciones distintas.

---

#### 46. Tablet y kiosco

Esta tarea no define variantes físicas `tablet` o `kiosk` dentro de `AppShellProps`.

La estructura compartida debe ser suficientemente composable para que los patrones propietarios posteriores puedan:

- reducir chrome;
- mantener contexto material visible;
- omitir navegación cuando no corresponda;
- conservar actor y estado de estación;
- adaptar targets y densidad.

No se canoniza como contrato del AppShell la detección actual de kiosco mediante query parameter.

---

#### 47. Traspaso entre aplicaciones

`AppShell` no transporta autoridad entre aplicaciones.

Un enlace o selector compuesto dentro de `headerActions` puede iniciar navegación, pero:

- la aplicación destino reconstruye contexto;
- revalida sesión y permiso;
- no confía en props del AppShell;
- no recibe roles o permisos como autoridad desde URL;
- no interpreta el origen visual como receipt.

El patrón compartido de traspaso mantiene su tarea propietaria posterior.

---

#### 48. Diagnóstico de contexto

El AppShell no incluye una consola o panel de diagnóstico.

Cuando una capa propietaria necesite mostrar diagnóstico seguro, podrá componer la superficie correspondiente dentro de su contenido o región adecuada.

No pertenecen al AppShell:

- reason codes internos completos;
- traces;
- stack;
- SQL;
- RLS;
- principal técnico;
- payloads de sesión.

La tarea específica de diagnóstico compartido conserva esa responsabilidad.

---

#### 49. Estados de proceso, acción principal y confirmaciones

El AppShell no incorpora por defecto:

- línea de estados de proceso;
- panel de acción principal;
- confirmaciones sensibles;
- error recuperable;
- patrón de tablet;
- patrón de kiosco.

Esas superficies conservan sus propietarios documentales dentro de la misma familia `SHELL-UI`.

El AppShell solo proporciona un marco en el que puedan componerse cuando corresponda.

---

#### 50. Evaluación de `VentoShell` histórico

El archivo histórico de `templates/app-shell-standard` resuelve actualmente, entre otras cosas:

- sesión de Supabase;
- usuario;
- empleado;
- rol;
- sedes asignadas;
- sede activa;
- consulta de catálogo territorial;
- props hacia `VentoChrome`.

Decisión:

```text
VentoShell histórico
→ FUENTE DE EVIDENCIA
→ NO ADOPTAR COMO AppShell COMPARTIDO
```

La causa es estructural: combina resolución de datos y contexto con presentación.

---

#### 51. Evaluación de `VentoChrome` histórico

El `VentoChrome` histórico contiene:

- navegación NEXO hardcodeada;
- permisos NEXO;
- llamadas cliente a Supabase RPC;
- lectura de pathname y query parameters;
- sede derivada de parámetros;
- AppSwitcher;
- ProfileMenu;
- sidebar y header;
- responsive shell.

Decisión por responsabilidad:

| Responsabilidad                | Disposición                                        |
| ------------------------------ | -------------------------------------------------- |
| estructura header/sidebar/main | conservar intención dentro del AppShell compartido |
| responsive y disclosure local  | compartir como comportamiento presentacional       |
| navegación NEXO                | excluir                                            |
| RPC de permisos                | excluir                                            |
| resolución de sede             | excluir                                            |
| AppSwitcher                    | componer externamente                              |
| ProfileMenu                    | componer externamente                              |
| rutas hardcodeadas             | excluir                                            |

---

#### 52. Familia runtime duplicada

La inspección vigente confirma copias actuales de la familia `VentoShell` / `VentoChrome` en seis repositorios de aplicaciones:

```text
vento-nexo
vento-fogo
vento-origo
vento-viso
vento-pulso
vento-numera
```

Las seis comparten una arquitectura reconocible:

- `VentoShell` server-side con resolución local;
- `VentoChrome` client-side;
- AppSwitcher;
- ProfileMenu;
- navegación local;
- contexto visible;
- operating gate local;
- app identity local;
- responsive sidebar/header.

Esta repetición es evidencia suficiente para compartir la **estructura**, pero la divergencia interna impide copiar una de las seis como estándar sin reconciliación.

---

#### 53. Deriva runtime observada

La misma intención de contexto llega actualmente con nombres distintos:

| Consumidor | Props observadas de contexto en `VentoChrome`              |
| ---------- | ---------------------------------------------------------- |
| NEXO       | `activeWorkContextLabel`, `activeWorkContextDescription`   |
| FOGO       | `activeContextLabel`, `activeContextDetail`                |
| ORIGO      | `activeWorkContextLabel`, `activeWorkContextDescription`   |
| VISO       | `activeContextLabel`, `activeContextDescription`           |
| PULSO      | `operationalContextLabel`, `operationalContextDescription` |
| NUMERA     | `activeWorkContextLabel`, `activeWorkContextDescription`   |

Además varían:

- conjuntos de iconos;
- taglines;
- rutas;
- códigos de aplicación;
- navegación;
- integración de query parameters;
- lógica de shell server-side.

La API de `AppShell` elimina esa deriva del marco al recibir `context` como composición, sin inventar una nueva firma propietaria de contexto.

---

#### 54. Evaluación del runtime de SHELL

`vento-shell` no utiliza actualmente la misma copia runtime que las seis aplicaciones.

Su raíz contiene un launcher propio que:

- autentica;
- resuelve acceso a aplicaciones;
- muestra tarjetas de aplicaciones;
- ofrece sesión y perfil en su propio header;
- no necesita obligatoriamente navegación lateral de aplicación.

Decisión:

```text
SHELL
→ CONSUMIDOR CONCEPTUAL DE AppShell
→ COMPOSICIÓN SIN NAVEGACIÓN LATERAL OBLIGATORIA
→ NO FORZAR LA FORMA DE LAS SEIS APPS
```

---

#### 55. Matriz materializada de consumidores

Se evalúan exactamente los siete consumidores web previstos por la definición de `@vento/ui-web`:

| Consumidor     | Estado actual observado                     | Decisión de AppShell                          | Migración física en esta tarea |
| -------------- | ------------------------------------------- | --------------------------------------------- | -----------------------------: |
| `vento-shell`  | launcher propio, sin copia estándar runtime | elegible por composición; navegación opcional |                              0 |
| `vento-nexo`   | familia `VentoShell` / `VentoChrome` local  | elegible mediante reconciliación              |                              0 |
| `vento-fogo`   | familia `VentoShell` / `VentoChrome` local  | elegible mediante reconciliación              |                              0 |
| `vento-origo`  | familia `VentoShell` / `VentoChrome` local  | elegible mediante reconciliación              |                              0 |
| `vento-viso`   | familia `VentoShell` / `VentoChrome` local  | elegible mediante reconciliación              |                              0 |
| `vento-pulso`  | familia `VentoShell` / `VentoChrome` local  | elegible mediante reconciliación              |                              0 |
| `vento-numera` | familia `VentoShell` / `VentoChrome` local  | elegible mediante reconciliación              |                              0 |

Reconciliación cuantitativa:

```text
consumidores evaluados = 7
consumidores conceptualmente elegibles = 7
consumidores con familia estándar duplicada a reconciliar = 6
consumidores con composición launcher diferenciada = 1
consumidores migrados por UI010 = 0
consumidores certificados por UI010 = 0
```

---

#### 56. Disposición de adopción

La decisión de elegibilidad **no equivale a adopción actual**.

Estados documentales resultantes:

```text
@vento/ui-web AppShell
→ ESPECIFICADO DOCUMENTALMENTE

7 consumidores
→ ELEGIBLES PARA ADOPCIÓN POSTERIOR

6 copias runtime estándar
→ REQUIEREN RECONCILIACIÓN

1 launcher SHELL
→ REQUIERE COMPOSICIÓN, NO CLONACIÓN DEL SIDEBAR

migración física
→ NO EJECUTADA
```

Ningún consumidor se declara compatible, migrado o certificado por esta tarea.

---

#### 57. Estrategia de migración posterior

La adopción deberá ejecutarse por lotes reversibles y separar primero las responsabilidades mezcladas.

Secuencia conceptual:

```text
INVENTARIAR CONSUMIDOR
→ SEPARAR ORQUESTACIÓN DE PRESENTACIÓN
→ PREPARAR SLOTS
→ ADOPTAR AppShell
→ VERIFICAR PARIDAD
→ OBSERVAR
→ ENSAYAR ROLLBACK
→ RETIRAR COPIA LEGACY SOLO CON GATE
```

No se autoriza sustitución textual masiva de `VentoShell` o `VentoChrome`.

---

#### 58. Handoff al scaffold versionado

La futura sustitución del template histórico deberá utilizar la decisión de esta tarea para impedir que nuevos consumidores sigan copiando:

- resolución Supabase dentro del shell visual;
- navegación hardcodeada;
- role override cliente;
- selección territorial autoritativa desde cliente;
- listas locales de aplicaciones;
- gating empresarial dentro del chrome.

El scaffold deberá apuntar a dependencias compartidas versionadas y mantener configuración del consumidor explícita.

---

#### 59. Handoff a migración coordinada

La migración de componentes y chrome por aplicación deberá:

1. conservar navegación legítima de cada consumidor;
2. mapear identidad a `brand`;
3. mapear navegación preparada a `navigation`;
4. mapear contexto visual a `context`;
5. mapear avisos a `notices`;
6. mapear utilidades a `headerActions`;
7. mantener lógica de autorización y datos fuera del AppShell;
8. demostrar paridad antes de retirar el chrome local;
9. conservar rollback por repositorio.

La tarea actual no inicia ninguno de esos lotes.

---

#### 60. Handoff a calidad y releases

La futura materialización del AppShell deberá entrar en el gobierno existente de packages compartidos:

- pruebas propias del package;
- build independiente;
- release versionado;
- changelog;
- matriz de compatibilidad;
- actualización controlada de consumidores.

La especificación documental no constituye release ni certificación de compatibilidad.

---

#### 61. Deprecación y rollback

Ninguna copia `VentoShell` / `VentoChrome` actual queda deprecada o autorizada para retiro por esta tarea.

Para retirar una copia deberán existir, como mínimo:

- adopción del AppShell compartido en ese consumidor;
- equivalencia de comportamiento necesaria;
- pruebas del consumidor;
- compatibilidad de versión;
- observabilidad suficiente;
- rollback reproducible;
- ausencia de uso residual del artefacto retirado.

La coexistencia temporal entre AppShell compartido y chrome legacy es válida durante migración controlada.

---

#### 62. Estado físico actual

Al cierre documental de esta tarea:

```text
package físico @vento/ui-web = NO MATERIALIZADO
AppShell compartido físico = NO MATERIALIZADO
exports npm de AppShell = NO MATERIALIZADOS
consumidores migrados = 0/7
copias legacy retiradas = 0
releases publicadas por UI010 = 0
cambios Supabase por UI010 = 0
```

La única existencia aprobada en esta fase es el contrato documental.

---

#### 63. Cambios físicos fuera de alcance

Esta tarea no autoriza:

- crear archivos de componente;
- modificar `packages/`;
- editar las seis aplicaciones consumidoras;
- modificar el launcher de SHELL;
- modificar el template histórico;
- crear migraciones;
- ejecutar SQL;
- cambiar RLS;
- modificar RPC;
- desplegar;
- publicar npm;
- crear tags o releases;
- retirar archivos legacy.

Cada cambio físico conserva su fase y tarea propietaria.

---

#### 64. Contrato futuro de prueba

La implementación y adopción deberán demostrar, como mínimo:

1. render con `brand` y `children`;
2. render sin navegación;
3. render con navegación y nombre accesible;
4. apertura y cierre de navegación móvil;
5. retorno de foco correcto;
6. navegación oculta fuera de tab order;
7. skip hacia contenido principal;
8. `context` perceptible;
9. `notices` perceptibles;
10. `headerActions` composables;
11. reflow sin pérdida de contenido esencial;
12. zoom sin recorte estructural;
13. movimiento reducido;
14. tema compatible;
15. ausencia de dependencia directa de Supabase;
16. ausencia de RPC dentro del AppShell;
17. ausencia de lectura de Auth;
18. ausencia de inferencia de contexto desde URL;
19. ausencia de inferencia de contexto desde cookie;
20. ausencia de inferencia de autoridad desde storage;
21. ausencia de rutas específicas de una aplicación dentro del componente;
22. ausencia de catálogo local de aplicaciones dentro del componente;
23. ausencia de `OperatingGate` como autoridad interna;
24. composición con indicador de contexto;
25. composición con selectores sin activación optimista del contexto;
26. composición con aviso de simulación;
27. composición con navegación preparada externamente;
28. contenido principal sin dependencia de sidebar;
29. launcher SHELL sin navegación lateral obligatoria;
30. paridad por consumidor antes de retirar chrome legacy;
31. rollback del consumidor hacia combinación soportada;
32. compatibilidad entre versiones del package y consumidor;
33. cero expansión de permisos por presentación;
34. cero mutaciones empresariales iniciadas por el AppShell.

Esta lista define evidencia futura y no declara implementación ni ejecución en UI010.

---

#### 65. Cobertura de requisitos existente

No se introduce una obligación transversal nueva porque el registro vigente ya protege las reglas que esta evaluación organiza, entre ellas:

- compartición, paridad y clasificación de AppShell y copias: `TREQ-SHELL-002`;
- catálogo único de aplicaciones: `TREQ-SHELL-003`;
- compatibilidad de packages y consumidores: `TREQ-SHELL-006`;
- rollback antes de release y retiro: `TREQ-SHELL-007`;
- template como fuente y no runtime por existencia: `TREQ-SHELL-029`;
- navegación y chrome sin autoridad propia: `TREQ-SHELL-030`;
- separación de role override, sede y autoridad real: `TREQ-SHELL-031`;
- reconciliación de componentes y copias: `TREQ-SHELL-032`;
- coherencia de textos y estado de template: `TREQ-SHELL-035`;
- release, compatibilidad, deprecación y retiro: `TREQ-SHELL-036` a `TREQ-SHELL-039`;
- contexto persistente autoritativo: `TREQ-UX-077`;
- separación de selección y contexto activo: `TREQ-UX-078`;
- resumen humano de contexto: `TREQ-UX-079`;
- separación y visibilidad de simulación y roles: `TREQ-UX-080`;
- transición autoritativa de contexto: `TREQ-UX-083`;
- reconstrucción de contexto cross-app: `TREQ-UX-089`;
- persistencia responsive del contexto: `TREQ-UX-090`;
- accesibilidad del contexto: `TREQ-UX-091`;
- frescura contextual: `TREQ-UX-092`;
- minimización: `TREQ-UX-093`;
- estados de contexto no resuelto: `TREQ-UX-094`;
- información material siempre visible: `TREQ-UX-183`;
- contexto visible en tablets y kioscos: `TREQ-UX-216`;
- lenguaje humano de rol y contexto: `TREQ-UX-308`.

La tarea asigna esas obligaciones a una frontera composicional concreta sin cambiar su significado ni sus destinos de implementación.

---

#### 66. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** la tarea evalúa y fija la propiedad presentacional y el contrato composicional del AppShell, mientras las obligaciones ejecutables de compartición, contexto, accesibilidad, autorización, compatibilidad, migración y rollback ya están registradas. No introduce una regla de negocio, autorización, integridad, cálculo, transición o integración adicional que requiera una identidad de prueba nueva.

---

#### 67. Criterios de aceptación

La tarea queda documentalmente completa cuando se cumple todo lo siguiente:

- [x] se responde explícitamente si AppShell debe compartirse;
- [x] se aprueba `AppShell` como superficie conceptual de `@vento/ui-web`;
- [x] se define una API mínima por slots;
- [x] se separa composición de autorización y contexto;
- [x] se prohíbe dependencia directa de Supabase;
- [x] se excluyen RPC y resolución de permisos;
- [x] se excluye navegación empresarial del contrato de AppShell;
- [x] se preserva el espacio composicional para contexto y avisos;
- [x] se clasifica el AppShell como superficie interactiva sin volver client-only todo el package;
- [x] se define comportamiento responsive y accesible del chrome;
- [x] se evita canonizar query parameters o `localStorage` como contexto;
- [x] se evalúan los siete consumidores previstos;
- [x] se reconcilian seis copias runtime como candidatos de migración y no como API canónica;
- [x] se conserva SHELL como consumidor por composición sin sidebar obligatorio;
- [x] se clasifica el template histórico como evidencia, no implementación canónica;
- [x] se preserva la migración posterior por lotes reversibles;
- [x] se preserva rollback antes del retiro legacy;
- [x] no se ejecutan cambios físicos en esta fase;
- [x] no se crean ni modifican requisitos de prueba.

---

#### 68. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-UI-009 — Compartir aviso de rol simulado`

**TAREA ACTUAL APROBADA**
`SHELL-UI-010 — Evaluar AppShell compartido`

**SIGUIENTE TAREA RESERVADA**
`SHELL-UI-011 — Compartir navegación orientada a tareas`


### ✅ SHELL-UI-011 — Compartir navegación orientada a tareas

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-010 — Evaluar AppShell compartido
**Tarea siguiente:** SHELL-UI-012 — Compartir línea de estados de proceso
**Tipo de tarea:** Documental; definición canónica de la superficie compartida de navegación orientada a trabajo para `@vento/ui-web`, su modelo presentacional, estados, identidad semántica, composición con AppShell, accesibilidad, fronteras de autorización, reconciliación de consumidores y handoff de migración, sin materializar package, rutas, consultas, permisos, migraciones, releases ni cambios runtime
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Package propietario:** `@vento/ui-web`
**Naturaleza:** patrón visual web compartido, presentacional y orientado a intención de trabajo; no es cola de tareas, resolver de autorización, catálogo de rutas ni motor de navegación empresarial

---

#### 1. Propósito

Esta tarea define la superficie compartida que representa navegación web organizada alrededor de trabajo, obligación, resultado y siguiente paso, en lugar de reproducir como menú el inventario técnico de rutas, entidades, tablas o permisos.

La regla raíz queda:

```text
PROYECCIÓN DE NAVEGACIÓN YA RESUELTA
        ↓
TaskNavigation
        ↓
ORIENTACIÓN VISUAL Y ACCESO A DESTINOS
```

Queda prohibida la dirección inversa:

```text
TaskNavigation
        ✕
DESCUBRIR PERMISOS
        ✕
RESOLVER CONTEXTO
        ✕
CREAR TAREAS
        ✕
DECIDIR PRIORIDAD EMPRESARIAL
```

#### 2. Alcance de la tarea

La tarea fija documentalmente:

- identidad pública conceptual;
- modelo de grupos y destinos;
- identidad semántica de cada destino;
- separación entre identidad, copy, ruta y permiso;
- estados visuales admitidos;
- tratamiento de destinos ocultos, deshabilitados y bloqueados;
- relación entre navegación y foco de trabajo;
- relación con `AppShell`;
- frontera con router, autorización, contexto y Supabase;
- accesibilidad, responsive y comportamiento server-safe;
- reconciliación de los siete consumidores web previstos;
- tratamiento del template histórico;
- handoff a migración, calidad, compatibilidad y retiro legacy.

No materializa código ni adopción física.

#### 3. Dependencias documentales consumidas

La definición consume como entradas aprobadas:

- `SHELL-UI-001`, propietario de la frontera visual web compartida;
- `SHELL-UI-002` a `SHELL-UI-009`, para conservar fronteras de alertas, primitivas, contexto, selectores y simulación;
- `SHELL-UI-010`, que reserva el slot `navigation` del `AppShell` para una superficie ya preparada;
- reglas canónicas de navegación, relevancia, foco, accesibilidad, migración y golden path ya vigentes;
- requisitos SHELL vigentes sobre duplicación, template histórico, compatibilidad y retiro;
- mini-bloque de migración coordinada de consumidores web;
- mini-bloque de paquetes, releases y compatibilidad.

#### 4. Evidencia técnica vigente

La evidencia runtime actual muestra una familia repetida en seis repositorios consumidores:

```text
vento-nexo
vento-fogo
vento-origo
vento-viso
vento-pulso
vento-numera
```

Los seis mantienen tipos locales equivalentes a:

```text
NavGroup
NavItem
```

con una forma aproximada basada en:

```text
href
label
description
icon
permissionCode
```

La implementación local de NEXO confirma además una separación parcial ya existente: la capa de servidor consulta las filas de navegación, evalúa permisos y entrega al chrome grupos filtrados. La copia cliente, sin embargo, conserva `permissionCode` dentro de su tipo visual y vuelve a acoplar navegación con Next.js mediante `usePathname`.

#### 5. Resultado documental

Se aprueba el componente conceptual:

```text
TaskNavigation
```

como parte de:

```text
@vento/ui-web
```

La decisión es **COMPARTIR** la superficie de presentación de navegación, no compartir el resolver de permisos, la fuente de datos de navegación ni el router de cada aplicación.

#### 6. Identidad pública conceptual

La superficie conceptual queda formada por:

```text
TaskNavigation
TaskNavigationProps
TaskNavigationGroup
TaskNavigationItem
TaskNavigationPresentationState
```

No se fijan todavía:

- subpath físico de exportación;
- nombre de archivo TypeScript;
- barrel concreto;
- versión npm;
- clases CSS finales;
- dependencia física de router.

#### 7. Modelo conceptual general

La unidad visual compartida se compone así:

```text
TaskNavigation
├─ grupo 1
│  ├─ destino A
│  └─ destino B
└─ grupo 2
   ├─ destino C
   └─ destino D
```

La profundidad base es de dos niveles estructurales:

```text
grupo
→ destino
```

No se aprueba un árbol arbitrariamente anidado de menús.

#### 8. Superficie conceptual de props

La API conceptual mínima se congela como:

```ts
type TaskNavigationProps = {
  ariaLabel: string;
  groups: readonly TaskNavigationGroup[];
  currentNavigationId?: string;
};
```

La implementación futura podrá conservar atributos HTML compatibles del contenedor cuando no contradigan las reglas semánticas y de accesibilidad de esta tarea.

No se abre una prop genérica `navigation` sin estructura.

#### 9. Estados de presentación

`TaskNavigationPresentationState` conserva exactamente las categorías visuales aplicables al contenido renderizable:

```text
PRIMARY
SECONDARY
DISCOVERABLE
CONTEXTUAL_DISABLED
REQUIRED_BLOCKED
```

Estos valores describen **presentación y descubribilidad**.

No son:

- permisos;
- decisiones de autorización;
- estados de proceso;
- estados de claim;
- estados de una tarea;
- resultados empresariales.

#### 10. Exclusión explícita de `HIDDEN`

`HIDDEN` no forma parte de la unión renderizable de `TaskNavigationPresentationState`.

La capa propietaria debe excluir el destino antes de construir las props cuando corresponda ocultarlo.

Regla:

```text
HIDDEN
→ no se pasa al componente
→ no se renderiza
→ no queda en DOM
→ no queda en tab order
```

Esto evita tratar ocultamiento sensible como una variante CSS.

#### 11. `TaskNavigationGroup`

Cada grupo se define conceptualmente como:

```ts
type TaskNavigationGroup = {
  groupId: string;
  label: string;
  description?: string;
  items: readonly TaskNavigationItem[];
};
```

`groupId` es una identidad estable de composición preparada por la capa propietaria.

No es permiso, ruta, rol ni fuente de autoridad.

#### 12. `TaskNavigationItem`

Cada destino se define conceptualmente como:

```ts
type TaskNavigationItem = {
  navigationId: string;
  intentCode: string;
  label: string;
  description?: string;
  href?: string;
  state: TaskNavigationPresentationState;
  statusLabel?: string;
  ownerLabel?: string;
  icon?: React.ReactNode;
};
```

La estructura no acepta payloads de autorización ni objetos de contexto completos.

#### 13. `navigationId`

`navigationId` es la identidad estable del destino de navegación.

Debe permanecer separado de:

```text
href
label
permissionCode
componentName
processId
```

El componente puede usar `navigationId` para identidad visual estable y comparación con `currentNavigationId`, pero no puede inferir de él permisos, rutas o prioridad.

#### 14. `intentCode`

`intentCode` conserva la intención empresarial estable ya preparada por la capa propietaria.

`TaskNavigation` no lo muestra como copy ordinario y no lo interpreta para:

- decidir grupo;
- decidir orden;
- decidir autorización;
- fabricar un CTA;
- resolver proceso;
- seleccionar aplicación.

Su presencia evita que el label visible se convierta en identidad contractual.

#### 15. `href`

`href` es un destino web ya preparado y seguro para presentación.

Reglas:

1. no es la identidad del destino;
2. no concede autoridad;
3. no se construye dentro del componente a partir de IDs empresariales;
4. no se completa con permisos o contexto desde el cliente;
5. puede ser relativo o absoluto cuando la capa propietaria ya resolvió el destino admitido;
6. su presencia no significa que la operación de destino esté autorizada para ejecutarse sin revalidación propia.

Si `href` se omite, el elemento puede permanecer visible como estado no navegable cuando su presentación sea necesaria.

#### 16. `currentNavigationId`

El destino actual se identifica mediante:

```text
currentNavigationId
```

La capa propietaria debe resolverlo antes de renderizar.

`TaskNavigation` compara esa identidad con `navigationId` y puede proyectar semántica equivalente a `aria-current`.

No lee:

- pathname;
- query params;
- hash;
- storage;
- historial del navegador.

#### 17. `label`

`label` es el nombre humano principal del destino.

Debe expresar resultado, objeto empresarial o finalidad reconocible, según el tipo de navegación.

No debe exponer como nombre ordinario:

- tabla;
- schema;
- RPC;
- componente;
- repositorio;
- ruta;
- permission code;
- enum;
- migración;
- UUID.

#### 18. `description`

`description` aporta orientación secundaria cuando el label por sí solo no explica suficientemente el destino.

No sustituye el nombre accesible principal.

No debe utilizarse para esconder:

- bloqueo material;
- estado crítico;
- consecuencia difícil de revertir;
- contexto que debe permanecer perceptible.

#### 19. `ownerLabel`

`ownerLabel` permite mostrar, como contexto secundario, la aplicación o dominio propietario cuando el destino cruza una frontera de aplicación o cuando esa información evita ambigüedad.

Regla de lenguaje:

```text
finalidad o resultado humano
→ principal

aplicación propietaria
→ contexto secundario
```

No se convierte la marca de la aplicación en la única instrucción de navegación.

#### 20. `statusLabel`

`statusLabel` permite presentar una situación humana breve asociada al destino, por ejemplo cuando está contextual o materialmente bloqueado.

Debe provenir ya preparado por la capa propietaria.

El componente no genera reason codes, diagnósticos ni mensajes a partir de errores técnicos.

Cuando un elemento permanece visible sin `href`, `statusLabel` o una descripción equivalente debe permitir comprender por qué no es un destino ordinariamente navegable cuando esa explicación sea necesaria.

#### 21. `icon`

`icon` es contenido visual opcional y no contractual.

Se utiliza `React.ReactNode` para evitar congelar en el componente una taxonomía de iconos específica de NEXO, FOGO, ORIGO, VISO, PULSO o NUMERA.

El icono:

- no sustituye `label`;
- no es identidad;
- no expresa autoridad por sí solo;
- no puede ser la única señal de estado;
- debe quedar oculto a tecnologías de asistencia cuando sea puramente decorativo.

#### 22. Navegación orientada a tareas no equivale a cola de tareas

`TaskNavigation` organiza acceso alrededor de intención de trabajo.

No es:

```text
TaskQueue
WorkQueue
ClaimQueue
AssignmentResolver
```

Un destino puede llevar a una cola, a un flujo, a una revisión o a una superficie administrativa legítima, pero el componente no recibe el work item empresarial completo.

#### 23. Agrupación operativa

En navegación operativa, la proyección propietaria debe priorizar trabajo y obligación por encima del inventario de entidades.

La estructura compartida soporta, sin hardcodearlos, grupos humanos compatibles con:

```text
Ahora
Después
En espera
Bloqueadas
```

Esos nombres no se generan dentro de `TaskNavigation`.

La capa propietaria decide qué destinos legítimos pertenecen a cada grupo conforme a la fuente canónica de trabajo y relevancia.

#### 24. Agrupación administrativa

En navegación administrativa, la organización debe responder a intención empresarial como:

```text
Planificar
Revisar
Aprobar
Conciliar
Configurar
Auditar
```

`TaskNavigation` no genera un menú a partir de tablas, catálogos, schemas o familias de permisos.

Los labels concretos siguen siendo localizables y deben conservar semántica canónica.

#### 25. Prioridad y foco

La superficie visual no calcula qué trabajo es prioritario.

La capa propietaria entrega grupos e items en el orden ya determinado.

El componente conserva ese orden.

No recibe scores opacos de frontend ni ejecuta políticas de prioridad.

#### 26. Prohibición de ordenamiento autónomo

`TaskNavigation` no ordena automáticamente por:

- label;
- href;
- fecha;
- cantidad;
- color;
- icono;
- role;
- nombre de aplicación.

Reordenar silenciosamente podría romper prioridad, continuidad o intención ya resueltas.

#### 27. Separación entre estado de navegación y estado de tarea

Los estados visuales de navegación no sustituyen estados como:

```text
eligible
assigned
offered
claimed
started
paused
waiting
completed
cancelled
```

Un `PRIMARY` no significa tarea iniciada.

Un `REQUIRED_BLOCKED` no reemplaza el estado empresarial del work item.

#### 28. Abrir no equivale a iniciar

Seleccionar o abrir un destino de navegación:

```text
≠ claim
≠ start
≠ accept
≠ approve
≠ execute
≠ complete
```

Cualquier transición empresarial se resuelve en el propietario correspondiente con su propia autorización y evidencia.

#### 29. Frontera de autorización

`TaskNavigation` recibe únicamente destinos que la capa propietaria decidió que pueden presentarse según las reglas de autorización, relevancia, sensibilidad y contexto aplicables.

Queda prohibido como prop del componente:

```text
permissionCode
requiredPermissions
anyOfPermissions
role
allowedRoles
AccessContext
AuthorizationDecision
canAccess
canExecute
```

La UI compartida no se convierte en seguridad de servidor.

#### 30. Relevancia, visibilidad y descubrimiento

La capa propietaria mantiene separados:

```text
AUTHORIZED
RELEVANT
VISIBLE
DISCOVERABLE
ENABLED
ACTIONABLE
REQUIRED
```

`TaskNavigation` representa el resultado presentacional recibido.

No infiere una categoría desde otra.

En particular, que un destino sea visible no significa que sea ejecutable.

#### 31. Deshabilitado contextual y obligación bloqueada

Los estados:

```text
CONTEXTUAL_DISABLED
REQUIRED_BLOCKED
```

son diferentes.

`CONTEXTUAL_DISABLED` representa un destino relevante cuya precondición actual impide la interacción ordinaria.

`REQUIRED_BLOCKED` representa una obligación que debe permanecer visible aunque no pueda continuarse todavía.

La diferencia debe ser perceptible y no depender solo de color.

#### 32. Comportamiento sin destinos

`TaskNavigation` no inventa una causa cuando `groups` está vacío.

No debe producir automáticamente mensajes como:

```text
No tienes permisos
No hay trabajo
No existen pantallas
```

porque un conjunto vacío puede provenir de causas distintas.

La superficie propietaria decide si corresponde componer `EmptyState`, `Alert`, diagnóstico contextual u otro patrón ya aprobado.

#### 33. Integración con `AppShell`

`SHELL-UI-010` reservó:

```text
AppShell.navigation
```

como un slot de navegación ya preparada.

La composición canónica queda:

```text
AppShell
└─ navigation
   └─ TaskNavigation
```

`AppShell` controla el marco y disclosure responsive.

`TaskNavigation` controla la estructura semántica y visual de grupos y destinos.

#### 34. Landmark y nombre accesible

`ariaLabel` proporciona el nombre accesible de la región de navegación.

La implementación debe evitar landmarks duplicados o anidados de forma confusa cuando se componga dentro de `AppShell`.

La aplicación deberá mantener coherencia entre:

```text
AppShell.navigationLabel
TaskNavigation.ariaLabel
```

sin anunciar dos regiones competidoras para el mismo contenido.

#### 35. Frontera con router

El contrato conceptual no exige:

- App Router;
- Pages Router;
- `next/link`;
- `usePathname`;
- `useSearchParams`;
- router imperativo.

La capa adaptadora de cada consumidor puede resolver la ruta actual y entregar `currentNavigationId`.

El componente compartido no transforma pathname en identidad empresarial.

#### 36. Clasificación server/client

La lógica conceptual de `TaskNavigation` no requiere:

- estado React interno;
- efectos;
- `window`;
- `document`;
- storage;
- timers;
- red;
- sesión;
- router.

Por tanto la superficie base se clasifica como **server-safe**.

Una aplicación puede componerla dentro del `AppShell` interactivo sin convertir el componente en propietario de esa interacción.

#### 37. Responsive

La navegación debe poder presentarse en escritorio, móvil y superficies táctiles compatibles sin cambiar el significado de sus destinos.

La compactación puede modificar:

- disposición;
- densidad visual;
- visibilidad de descripciones secundarias;
- uso de iconos decorativos.

No puede eliminar:

- nombre accesible;
- estado relevante;
- obligación bloqueada;
- destino actual perceptible.

#### 38. Sidebar compactado

Cuando `AppShell` compacte visualmente el área de navegación:

- los controles visibles conservan nombre accesible;
- el icono no se vuelve la única identidad;
- el destino actual sigue siendo distinguible;
- el contenido oculto no permanece como foco fantasma;
- el componente no depende de hover como única forma de conocer un destino.

#### 39. Teclado

Toda navegación interactiva debe ser operable por teclado.

La implementación futura debe conservar:

1. orden lógico según grupos e items recibidos;
2. foco visible;
3. ausencia de destinos ocultos en tab order;
4. enlaces con nombre comprensible;
5. acceso a estados o explicaciones relevantes sin hover;
6. ausencia de trampas de foco creadas por la navegación.

#### 40. Lectores de pantalla

La estructura debe utilizar semántica de navegación, listas, grupos y destinos de forma coherente.

Debe permitir identificar:

- nombre de la región;
- grupo;
- destino;
- destino actual;
- estado no accionable cuando aplique;
- contexto secundario relevante.

No se anuncian códigos técnicos como sustituto de lenguaje humano.

#### 41. Superficies táctiles

Los destinos interactivos deben admitir áreas activables compatibles con las reglas táctiles vigentes.

No se colocarán destinos incompatibles de manera que un toque impreciso active una acción distinta.

La tarea no fija una composición universal para tablet o kiosco; esas superficies conservan sus propietarios posteriores.

#### 42. Foco después de navegar

`TaskNavigation` no fuerza foco sobre contenido de destino ni ejecuta scroll programático.

El propietario de la ruta o flujo decide el tratamiento de foco posterior a una navegación material.

El componente puede conservar semántica de destino actual, pero no simula que la nueva superficie terminó de cargar o confirmó una operación.

#### 43. Localización y terminología

`label`, `description`, `statusLabel`, `ownerLabel` y `ariaLabel` son contenido humano localizable.

Cambiar idioma o copy no cambia:

```text
navigationId
intentCode
```

No se utilizan labels traducidos como claves de lógica.

#### 44. Destinos cross-app

La superficie puede presentar un destino cuyo `href` ya cruza a otra aplicación.

Debe conservar:

- finalidad humana como contenido principal;
- aplicación propietaria como contexto secundario cuando sea útil;
- identidad semántica estable;
- destino seguro ya preparado.

El componente no define payload de handoff, revalidación, retorno de proceso ni transporte de referencias; esa responsabilidad conserva su propietario canónico.

#### 45. Búsqueda, favoritos, recientes y breadcrumbs

No forman parte de la API base de `TaskNavigation` en este corte.

La decisión es explícita: el componente compartido cubre la navegación estructurada por grupos y destinos.

Las implementaciones de búsqueda, favoritos, recientes, regreso lógico y breadcrumbs siguen obligadas por sus reglas UX vigentes, pero no se mezclan dentro de esta primitiva para evitar una API monolítica.

#### 46. Telemetría

`TaskNavigation` no emite por sí mismo eventos empresariales ni interpreta selección como ejecución.

La presencia de:

```text
navigationId
intentCode
```

permite que la capa instrumentadora conserve identidades estables sin usar el label o el href como clave analítica.

Los eventos de presentación, selección, redirección y ejecución permanecen diferenciados.

#### 47. Privacidad y minimización

Las props no deben transportar datos innecesarios del actor o del recurso.

Quedan fuera del componente:

- documento personal;
- correo como identidad ordinaria;
- teléfono;
- token;
- sesión;
- payload de autorización;
- UUID sensible del recurso;
- reason code técnico restringido;
- detalles de otros actores.

La capa propietaria minimiza antes de renderizar.

#### 48. Patrón runtime común observado

Los seis consumidores con chrome conservan una familia equivalente:

```text
VentoShell
→ obtiene/resuelve datos y navegación
→ navGroups
→ VentoChrome
→ SidebarLink
```

La intención reutilizable es válida.

La forma local no se adopta íntegramente porque mezcla aspectos que deben separarse:

- `permissionCode` dentro de `NavItem` visual;
- identidad basada en `href` como key práctica;
- current route derivado localmente desde pathname;
- enums de iconos por aplicación;
- copy y grupos locales sin identidad semántica explícita.

#### 49. Reconciliación de NEXO

Estado observado:

- `NavGroup` y `NavItem` locales;
- navegación consultada desde `app_navigation_items`;
- permisos evaluados antes de construir los grupos;
- `permissionCode` todavía viaja dentro de la forma visual;
- `VentoChrome` calcula activo mediante pathname;
- iconografía local extensa;
- `VentoChrome` mezcla navegación con chrome, contexto y gating.

Decisión:

```text
CANDIDATO_A_MIGRAR
```

Se conserva la separación server-side ya existente y se reemplazará la forma visual por una proyección compatible con `TaskNavigation` durante la migración propietaria.

#### 50. Reconciliación de FOGO

Estado observado:

- `NavGroup` y `NavItem` locales;
- forma visual con `permissionCode`;
- active route resuelto dentro del chrome;
- iconografía y contexto locales;
- navegación acoplada al `VentoChrome` propio.

Decisión:

```text
CANDIDATO_A_MIGRAR
```

La migración conservará únicamente extensiones empresariales legítimas y preparará la misma forma semántica compartida.

#### 51. Reconciliación de ORIGO

Estado observado:

- `NavGroup` y `NavItem` locales;
- `permissionCode` forma parte del item visual;
- iconografía local reducida;
- active route resuelto dentro del chrome.

Decisión:

```text
CANDIDATO_A_MIGRAR
```

La diferencia de iconografía no justifica una API de navegación distinta.

#### 52. Reconciliación de VISO

Estado observado:

- `NavGroup` y `NavItem` locales;
- `permissionCode` dentro del item;
- active route dentro del chrome;
- vocabulario y destinos propios de administración y auditoría.

Decisión:

```text
CANDIDATO_A_MIGRAR
```

`TaskNavigation` debe admitir intención administrativa sin convertir el patrón en una navegación exclusivamente operativa.

#### 53. Reconciliación de PULSO

Estado observado:

- `NavGroup` y `NavItem` locales;
- `permissionCode` dentro del item;
- active route dentro del chrome;
- uso de query params para otras decisiones locales del shell;
- iconografía propia de POS y operación.

Decisión:

```text
CANDIDATO_A_MIGRAR
```

El componente compartido no absorbe query params ni decisiones de estación.

#### 54. Reconciliación de NUMERA

Estado observado:

- `NavGroup` y `NavItem` locales;
- `permissionCode` dentro del item;
- active route dentro del chrome;
- vocabulario y destinos propios de análisis y rentabilidad.

Decisión:

```text
CANDIDATO_A_MIGRAR
```

La superficie compartida conserva la posibilidad de agrupación administrativa y analítica sin incorporar lógica de NUMERA.

#### 55. Reconciliación de SHELL

SHELL no utiliza actualmente la misma familia `NavGroup`/`NavItem` como navegación lateral principal.

Su home funciona como launcher de aplicaciones mediante tarjetas y evalúa acceso a esos destinos.

Decisión:

```text
COMPOSICIÓN_ELEGIBLE_SIN_EQUIVALENTE_RUNTIME_ACTUAL
```

No se obliga a convertir el launcher actual en `TaskNavigation` por esta tarea.

SHELL podrá componer la superficie cuando exista una proyección de navegación orientada a trabajo que corresponda legítimamente a su finalidad.

#### 56. Reconciliación del template histórico

El template `app-shell-standard` conserva:

- grupos `NAV_GROUPS` hardcodeados para NEXO;
- rutas y labels específicos;
- arrays `required` / `anyOf` de permisos;
- consultas cliente de permisos;
- cálculo local de pathname;
- navegación presentada como parte del chrome.

Clasificación:

```text
FUENTE_HISTÓRICA_DE_EVIDENCIA
≠
IMPLEMENTACIÓN_CANÓNICA_DE TaskNavigation
```

No se adopta como fuente del nuevo contrato.

#### 57. Matriz materializada de consumidores

| Consumidor | Patrón actual relevante                                      | Decisión UI011                                        | Implementación en esta tarea |
| ---------- | ------------------------------------------------------------ | ----------------------------------------------------- | ---------------------------- |
| SHELL      | launcher de aplicaciones, sin `NavGroup` lateral equivalente | `COMPOSICIÓN_ELEGIBLE_SIN_EQUIVALENTE_RUNTIME_ACTUAL` | 0                            |
| NEXO       | `NavGroup` / `NavItem` local dentro de chrome                | `CANDIDATO_A_MIGRAR`                                  | 0                            |
| FOGO       | `NavGroup` / `NavItem` local dentro de chrome                | `CANDIDATO_A_MIGRAR`                                  | 0                            |
| ORIGO      | `NavGroup` / `NavItem` local dentro de chrome                | `CANDIDATO_A_MIGRAR`                                  | 0                            |
| VISO       | `NavGroup` / `NavItem` local dentro de chrome                | `CANDIDATO_A_MIGRAR`                                  | 0                            |
| PULSO      | `NavGroup` / `NavItem` local dentro de chrome                | `CANDIDATO_A_MIGRAR`                                  | 0                            |
| NUMERA     | `NavGroup` / `NavItem` local dentro de chrome                | `CANDIDATO_A_MIGRAR`                                  | 0                            |

Control de cobertura:

```text
consumidores esperados: 7
consumidores evaluados: 7
faltantes: 0
duplicados: 0
migrados: 0
certificados: 0
```

#### 58. Forma objetivo de migración

La migración futura no copiará directamente el tipo local `NavItem` hacia el package.

La forma objetivo es:

```text
FUENTE PROPIETARIA DE NAVEGACIÓN
        ↓
AUTORIZACIÓN + RELEVANCIA + CONTEXTO
        ↓
ADAPTER DEL CONSUMIDOR
        ↓
TaskNavigationGroup[]
        ↓
TaskNavigation
```

La autorización nunca se mueve hacia la capa inferior.

#### 59. Adapter local permitido

Cada aplicación puede conservar un adapter local pequeño para traducir su runtime a la proyección compartida.

Ese adapter puede:

- resolver `currentNavigationId` desde router local;
- mapear iconos propios a `ReactNode`;
- preparar labels localizados;
- preparar `ownerLabel`;
- excluir destinos `HIDDEN`;
- construir el orden ya resuelto.

No puede usar el adapter para crear una segunda taxonomía de navegación incompatible.

#### 60. Handoff a migración coordinada

La adopción física queda asignada al mini-bloque de migración ya vigente.

Responsabilidades:

| Tarea           | Handoff de UI011                                                                   |
| --------------- | ---------------------------------------------------------------------------------- |
| `SHELL-MIG-001` | inventariar consumidores, adapters, grupos, destinos, rutas y extensiones locales  |
| `SHELL-MIG-002` | definir lotes reversibles por repositorio                                          |
| `SHELL-MIG-003` | bloquear nuevos consumidores de la forma legacy y preparar compatibilidad temporal |
| `SHELL-MIG-004` | impedir que el template histórico replique navegación hardcodeada                  |
| `SHELL-MIG-005` | adoptar `TaskNavigation` junto con AppShell, chrome y estilos por aplicación       |
| `SHELL-MIG-006` | verificar accesibilidad, tema, densidad y responsive                               |
| `SHELL-MIG-007` | demostrar paridad de rutas, estados y comportamiento                               |
| `SHELL-MIG-008` | retirar únicamente copias legacy sin uso residual                                  |

No se adelanta ninguno de esos cambios físicos.

#### 61. Handoff a calidad, compatibilidad y releases

La materialización futura deberá entrar en el gobierno vigente de paquetes compartidos:

| Tarea          | Responsabilidad                                      |
| -------------- | ---------------------------------------------------- |
| `SHELL-CI-001` | pruebas propias del package                          |
| `SHELL-CI-002` | build independiente                                  |
| `SHELL-CI-003` | release versionado                                   |
| `SHELL-CI-004` | changelog                                            |
| `SHELL-CI-005` | matriz de compatibilidad por consumidor              |
| `SHELL-CI-006` | actualización controlada de consumidores mediante PR |

La existencia documental de `TaskNavigation` no equivale a package publicado.

#### 62. Contrato futuro de prueba

La implementación física y adopción deberán demostrar, como mínimo:

1. render de grupos en el orden recibido;
2. render de items en el orden recibido;
3. unicidad de `navigationId` en la proyección visible;
4. `currentNavigationId` marca exactamente un destino coincidente cuando exista;
5. cambiar label no cambia identidad;
6. cambiar href no cambia identidad;
7. `intentCode` no se muestra como copy ordinario;
8. `permissionCode` no forma parte de la API pública;
9. `HIDDEN` no puede renderizarse como variante visual;
10. `PRIMARY` distinguible sin depender solo de color;
11. `SECONDARY` no se convierte en irrelevante por presentación;
12. `DISCOVERABLE` conserva nombre accesible cuando se presenta;
13. `CONTEXTUAL_DISABLED` es perceptible y no accionable cuando así llega preparado;
14. `REQUIRED_BLOCKED` permanece visible y comprensible;
15. ausencia de inferencia de permisos;
16. ausencia de lectura de rol;
17. ausencia de lectura de contexto;
18. ausencia de dependencia directa de Supabase;
19. ausencia de consultas de red;
20. ausencia de `usePathname` dentro de la superficie base;
21. ausencia de `useSearchParams` dentro de la superficie base;
22. ausencia de storage;
23. ausencia de sorting autónomo;
24. abrir destino no emite start o claim empresarial;
25. href relativo ya preparado se conserva;
26. href absoluto ya preparado se conserva sin introducir autoridad;
27. label humano permanece principal frente a ownerLabel;
28. icono decorativo no sustituye label;
29. navegación vacía no inventa causa;
30. teclado completo;
31. foco visible;
32. destinos ocultos fuera de tab order;
33. lectores de pantalla identifican región, grupo, destino y current;
34. reflow en ancho reducido;
35. zoom sin recorte esencial;
36. integración dentro de `AppShell.navigation` sin landmarks competidores;
37. composición con contexto y avisos sin mezclar responsabilidades;
38. paridad por consumidor antes de retirar la navegación legacy;
39. rollback disponible durante cada lote de migración;
40. compatibilidad de package verificada antes de adopción.

Esta lista define evidencia futura. No declara implementación ni ejecución de pruebas runtime en esta tarea.

#### 63. Cobertura de requisitos vigente

No se introduce una obligación transversal nueva porque el registro canónico vigente ya cubre, entre otras, estas materias:

- tarea actual, siguiente acción y estado del proceso: `TREQ-UX-001`;
- identidad real del foco de trabajo y prohibición de inventar tareas: `TREQ-UX-024`;
- separación entre abrir, claim, inicio y finalización: `TREQ-UX-025`;
- política determinista de foco: `TREQ-UX-026`;
- estados sin tareas, bloqueos y contexto insuficiente: `TREQ-UX-037`;
- accesibilidad del foco: `TREQ-UX-038`;
- separación entre presentar, abrir e iniciar: `TREQ-UX-040`;
- lenguaje humano de navegación: `TREQ-UX-041`;
- `navigation_id` e `intent_code` separados de ruta, label y permiso: `TREQ-UX-042`;
- gramática de grupos, destinos, acciones y estados: `TREQ-UX-043`;
- términos especializados y divulgación progresiva: `TREQ-UX-044`;
- consistencia terminológica cross-app: `TREQ-UX-045`;
- finalidad humana por encima de la marca de aplicación: `TREQ-UX-046`;
- navegación operativa por trabajo, obligación, resultado y siguiente paso: `TREQ-UX-047`;
- navegación administrativa por intención empresarial: `TREQ-UX-048`;
- personalización sin cambiar significado empresarial: `TREQ-UX-049`;
- separación entre label, ruta y permiso: `TREQ-UX-050`;
- lenguaje y revalidación cross-app: `TREQ-UX-051`;
- búsqueda segura y humana: `TREQ-UX-052`;
- breadcrumbs, regreso, recientes y favoritos por identidad semántica: `TREQ-UX-053`;
- localización y accesibilidad de labels: `TREQ-UX-056`;
- telemetría por identidades estables: `TREQ-UX-057`;
- migración de navegación legacy: `TREQ-UX-058`;
- separación entre autorización, relevancia, visibilidad y acción: `TREQ-UX-059` a `TREQ-UX-063`;
- relevancia de accesos cross-app: `TREQ-UX-071`;
- elementos ocultos fuera de árbol accesible: `TREQ-UX-074`;
- separación de operación, administración y excepción: `TREQ-UX-075`;
- migración segura de superficies: `TREQ-UX-076`;
- roles, simulación y navegación diferenciados: `TREQ-UX-080`;
- golden path y reducción segura de pasos: `TREQ-UX-139` a `TREQ-UX-144` y `TREQ-UX-157`;
- jerarquía de divulgación y contenido esencial: `TREQ-UX-182` a `TREQ-UX-188`;
- implementación compartida, reconciliación y template histórico: `TREQ-SHELL-002`, `TREQ-SHELL-029`, `TREQ-SHELL-030` y `TREQ-SHELL-035`;
- compatibilidad, versionado, deprecación y retiro de packages: `TREQ-SHELL-006`, `TREQ-SHELL-007` y `TREQ-SHELL-036` a `TREQ-SHELL-039`.

#### 64. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA**

**Requisitos creados:** 0

**Requisitos modificados:** 0

Justificación: la tarea materializa una superficie compartida de presentación y una reconciliación de consumidores dentro de obligaciones de navegación, accesibilidad, autorización, migración, compatibilidad y retiro que ya están registradas. No introduce una obligación verificable nueva ni altera el significado de una obligación vigente.

#### 65. Fuera de alcance

Esta tarea no ejecuta:

- creación física de `@vento/ui-web`;
- creación de archivos TS/TSX;
- modificación de `VentoChrome`;
- modificación de `VentoShell`;
- migración de consumidores;
- cambio de `app_navigation_items`;
- SQL, DDL o DML;
- cambios de Supabase;
- autorización;
- creación o modificación de roles;
- creación de work items;
- prioridades de colas;
- claims;
- router cross-app;
- implementación de búsqueda, favoritos o breadcrumbs;
- release npm;
- despliegue;
- retiro del template legacy.

#### 66. Criterios de aceptación documental

La tarea queda documentalmente cerrada cuando se cumple todo lo siguiente:

- [x] existe una decisión explícita de compartir navegación orientada a tareas;
- [x] existe identidad pública conceptual;
- [x] existe API conceptual mínima;
- [x] `navigationId` queda separado de href, label y permiso;
- [x] `intentCode` queda separado del copy;
- [x] se definen cinco estados renderizables y `HIDDEN` queda fuera de la API renderizable;
- [x] se separa navegación de cola y work item;
- [x] abrir navegación no equivale a iniciar trabajo;
- [x] permisos, roles y contexto quedan fuera del componente;
- [x] el componente no depende de Supabase;
- [x] el componente no depende conceptualmente de Next Router;
- [x] la superficie base queda clasificada como server-safe;
- [x] se define integración con `AppShell.navigation`;
- [x] se cubren teclado, lectores, foco, responsive y táctil;
- [x] los siete consumidores previstos reciben decisión explícita;
- [x] no existen faltantes ni duplicados en la matriz de consumidores;
- [x] el template histórico queda clasificado como evidencia, no como implementación canónica;
- [x] migración y calidad conservan propietarios explícitos;
- [x] no se ejecuta migración física;
- [x] no se crean ni modifican requisitos de prueba.

#### 67. Decisiones consolidadas

1. `TaskNavigation` es la superficie compartida aprobada para navegación estructurada orientada a trabajo.
2. La navegación se organiza por grupos y destinos; no por árbol técnico arbitrario.
3. `navigationId` es identidad estable del destino.
4. `intentCode` conserva intención estable sin convertirse en copy.
5. `href` es un destino ya preparado y no es autoridad.
6. `currentNavigationId` llega resuelto desde la capa propietaria.
7. La superficie base no lee pathname ni query params.
8. La superficie base es server-safe.
9. Los estados renderizables son `PRIMARY`, `SECONDARY`, `DISCOVERABLE`, `CONTEXTUAL_DISABLED` y `REQUIRED_BLOCKED`.
10. `HIDDEN` se filtra antes de las props y no llega al DOM.
11. El componente no recibe `permissionCode`.
12. El componente no recibe roles ni decisiones de autorización.
13. El componente no recibe contexto autoritativo completo.
14. El componente no consulta Supabase.
15. El componente no calcula relevancia ni prioridad empresarial.
16. El componente conserva el orden recibido.
17. Abrir un destino no equivale a claim, start, approve, execute o complete.
18. La navegación operativa puede proyectar `Ahora`, `Después`, `En espera` y `Bloqueadas`, sin hardcodearlos.
19. La navegación administrativa puede organizarse por intención empresarial sin menú por schema.
20. SHELL no está obligado a reemplazar su launcher actual por esta primitiva.
21. NEXO, FOGO, ORIGO, VISO, PULSO y NUMERA quedan como candidatos de migración.
22. Los seis consumidores con chrome deben retirar `permissionCode` de la forma visual compartida durante la migración.
23. Los adapters locales pueden resolver router e iconos sin crear una segunda semántica de navegación.
24. El template histórico no define la nueva API.
25. La migración permanece posterior, reversible y por consumidor.
26. Compatibilidad, release y retiro legacy permanecen gobernados por sus tareas propietarias.
27. La tarea produce cero cambios de requisitos de prueba.
28. No se materializa código ni se modifica runtime en esta fase.

#### 68. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-UI-010 — Evaluar AppShell compartido`

**TAREA ACTUAL APROBADA**
`SHELL-UI-011 — Compartir navegación orientada a tareas`

**SIGUIENTE TAREA RESERVADA**
`SHELL-UI-012 — Compartir línea de estados de proceso`


### ✅ SHELL-UI-012 — Compartir línea de estados de proceso

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-011 — Compartir navegación orientada a tareas
**Tarea siguiente:** SHELL-UI-013 — Compartir panel de acción principal
**Tipo de tarea:** Documental; definición canónica de la línea compartida de estados de proceso para `@vento/ui-web`, su proyección del ciclo de vida principal, API conceptual, semántica, accesibilidad, fronteras con transiciones, condiciones, navegación, offline y sincronización, reconciliación de consumidores y handoff de migración, sin materializar package, estado de dominio, motor de transiciones, cambios runtime, SQL, migraciones, releases ni despliegues
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Package propietario:** `@vento/ui-web`
**Naturaleza:** patrón visual web compartido, presentacional y de lectura del ciclo de vida ya resuelto; no es máquina de estados, timeline de auditoría, motor de transiciones ni señalización de sincronización

---

#### 1. Propósito

`SHELL-UI-012` define la línea visual compartida que permite comunicar, dentro de una superficie de proceso, la posición principal ya resuelta de una instancia y las posiciones relevantes de su recorrido visible.

La identidad conceptual aprobada es:

```text
ProcessStatusLine
```

La regla raíz queda:

```text
ESTADO Y CICLO DE VIDA AUTORITATIVOS
        ↓
APLICACIÓN PROPIETARIA / CONTRATO DE PROCESO
        ↓
PROYECCIÓN HUMANA Y SEGURA DE ESTADOS
        ↓
ProcessStatusLine
        ↓
PRESENTACIÓN WEB
```

Nunca:

```text
ProcessStatusLine → máquina de estados
ProcessStatusLine → motor de transiciones
ProcessStatusLine → autorización
ProcessStatusLine → fuente de verdad del proceso
ProcessStatusLine → inferencia de transición por posición visual
ProcessStatusLine → escritura de estado
ProcessStatusLine → auditoría completa
ProcessStatusLine → estado offline o de sincronización
```

---

#### 2. Alcance

La tarea cierra documentalmente:

- identidad pública conceptual del patrón;
- responsabilidad del componente;
- API conceptual mínima;
- modelo de paso visible;
- estados presentacionales de cada paso;
- reglas para una única posición principal actual;
- relación con estados iniciales, intermedios y finales;
- tratamiento de ramificaciones, ciclos y reingresos;
- separación entre posición principal y condiciones transversales;
- separación respecto a transición, autorización y efectos;
- semántica HTML y accesibilidad;
- responsive, reflow y movimiento reducido;
- frontera server/client;
- privacidad y minimización;
- evidencia técnica vigente de consumidores;
- disposición documental de los siete consumidores web previstos;
- handoff a migración, calidad y releases;
- cobertura de requisitos vigente.

No se materializa código compartido ni se modifica estado de proceso alguno.

---

#### 3. Dependencias documentales consumidas

La definición conserva las decisiones aprobadas por:

- `SHELL-UI-001`, que fija la frontera de `@vento/ui-web` como implementación visual web compartida sin autoridad empresarial;
- `SHELL-UI-010`, que fija `AppShell` como marco composicional y deja el proceso dentro de su contenido principal;
- `SHELL-UI-011`, que fija `TaskNavigation` para navegación orientada a trabajo sin asumir propiedad del estado de proceso;
- el registro canónico de procesos, que define identidad, estados, transiciones, propietario y reglas de evolución;
- la arquitectura UX, que exige lenguaje humano, siguiente acción comprensible, separación entre presentación y autoridad y estados visibles honestos;
- la fundación compartida, que exige adopción progresiva y reversible de componentes comunes.

Precedencia:

```text
PROCESO Y ESTADO CANÓNICOS
→ PROYECCIÓN DE ESTADO PROPIETARIA
→ ProcessStatusLine
→ COMPOSICIÓN EN SUPERFICIE
→ PRUEBAS DEL PACKAGE
→ ADOPCIÓN CONTROLADA
```

---

#### 4. Evidencia técnica vigente

El estado técnico observado conserva `@vento/ui-web` sin materialización física dentro de la raíz de packages compartidos; el package disponible actualmente en esa raíz es `os-context`.

La evidencia runtime muestra, además, estados y copy de proceso resueltos localmente en consumidores.

En NEXO, la experiencia de remisiones mantiene una normalización local de estados como:

```text
pending
preparing
dispatch_ready
in_transit
partial
received
closed
cancelled
```

con etiquetas humanas y clases visuales locales.

También construye una traza visible de hitos como solicitud, preparación, despacho y recepción.

Esta evidencia demuestra necesidad de una superficie visual común, pero no autoriza a convertir esos valores particulares en un enum transversal.

FOGO conserva formularios y superficies de producción con estado local de interacción y datos específicos del dominio. Ese código confirma que la composición de proceso seguirá siendo propietaria de cada aplicación.

---

#### 5. Resultado documental

Queda especificada la siguiente superficie conceptual:

```ts
type ProcessStatusLineProps = {
  ariaLabel: string;
  steps: readonly ProcessStatusLineStep[];
};
```

```ts
type ProcessStatusLineStep = {
  stepId: string;
  label: string;
  description?: string;
  state: ProcessStatusLineStepState;
};
```

```ts
type ProcessStatusLineStepState =
  | "REACHED"
  | "CURRENT"
  | "NOT_REACHED";
```

La API representa únicamente una proyección visual ya preparada.

No incluye estado empresarial crudo, comandos, permisos, guards, transición, router, almacenamiento, red ni persistencia.

---

#### 6. Identidad pública conceptual

La identidad compartida queda:

```text
ProcessStatusLine
```

Los nombres conceptuales auxiliares son:

```text
ProcessStatusLineProps
ProcessStatusLineStep
ProcessStatusLineStepState
```

No se aprueban alias como:

```text
ProcessStepper
WorkflowStepper
StatusTimeline
ProcessTimeline
WorkflowTimeline
StateMachineView
```

La palabra `Line` expresa una representación visual ordenada y evita presentar el componente como máquina, historial o motor.

---

#### 7. Definición de línea de estados

Una línea de estados es una **proyección visible y ordenada** de posiciones principales relevantes para comprender la instancia actual.

No es necesariamente:

- el grafo completo del proceso;
- todos sus estados canónicos;
- todas sus transiciones;
- toda su historia;
- una lista de eventos;
- una representación de cada condición transversal;
- una promesa de que todos los pasos visibles serán alcanzados.

La aplicación propietaria prepara la proyección válida para el caso actual.

---

#### 8. Superficie conceptual de props

`ProcessStatusLineProps` se mantiene deliberadamente pequeña:

| Propiedad   | Responsabilidad                                     |
| ----------- | --------------------------------------------------- |
| `ariaLabel` | nombre humano y accesible de la región o lista      |
| `steps`     | proyección explícita de pasos visibles ya resueltos |

No se incorporan en la API base:

- `processId`;
- `instanceId`;
- `currentStateCode`;
- `transitionId`;
- `nextAllowedStates`;
- `permissionCode`;
- `role`;
- `canOperate`;
- `isOffline`;
- `syncState`;
- `href`;
- callbacks de transición.

---

#### 9. Modelo de paso

Cada `ProcessStatusLineStep` representa una posición visible preparada por el propietario.

Campos:

```text
stepId
label
description
state
```

`stepId` identifica de forma estable la ocurrencia renderizada dentro de la proyección actual.

`label` presenta el significado humano.

`description` agrega aclaración opcional sin convertirse en lógica.

`state` declara explícitamente la relación del paso con la posición actual.

---

#### 10. Estados presentacionales del paso

La taxonomía visual mínima queda limitada a:

```text
REACHED
CURRENT
NOT_REACHED
```

Estos estados describen relación con el recorrido visible, no resultados de autorización ni condiciones técnicas.

Quedan fuera de esta taxonomía:

```text
BLOCKED
WAITING
DENIED
CONFLICT
SYNCING
QUEUED
OFFLINE
ERROR
STALE
CANCELLED
```

Esos conceptos pertenecen a contratos propietarios de proceso, impedimento, resiliencia o sincronización y pueden componerse alrededor de la línea cuando corresponda.

---

#### 11. `REACHED`

`REACHED` significa exclusivamente:

```text
la capa propietaria confirma que esta posición visible fue alcanzada
```

No significa automáticamente:

- proceso completado;
- evidencia completa;
- aprobación concedida;
- pago confirmado;
- entrega aceptada;
- conciliación cerrada;
- efecto irreversible;
- estado terminal.

La etiqueta visible debe conservar el significado empresarial real de la posición.

---

#### 12. `CURRENT`

`CURRENT` identifica la posición principal actual de la instancia dentro de la proyección visible.

Debe derivarse de una fuente autoritativa preparada por la capa propietaria.

El componente no calcula `CURRENT` mediante:

- índice;
- ruta;
- URL;
- presencia de un botón;
- timestamp más reciente;
- color;
- último paso alcanzado según el cliente;
- estado guardado localmente.

La implementación accesible utilizará una semántica equivalente a `aria-current="step"` sobre la posición actual.

---

#### 13. `NOT_REACHED`

`NOT_REACHED` significa:

```text
la posición pertenece a la proyección visible preparada,
pero la capa propietaria declara que todavía no ha sido alcanzada
```

No implica que la transición hacia ella esté autorizada.

No implica que sea el siguiente destino posible.

No implica que el proceso vaya a alcanzarla necesariamente.

No habilita controles ni comandos.

---

#### 14. Una única posición `CURRENT`

Cuando la línea represente una instancia real con posición principal resuelta, la proyección deberá contener exactamente una posición `CURRENT`.

La capa propietaria no entregará simultáneamente dos estados principales actuales para la misma instancia.

Si la fuente todavía no permite resolver una posición principal válida, el consumidor no fabricará una posición actual para mantener la estética del componente.

La ausencia o inconsistencia debe resolverse mediante la superficie propietaria de estado, bloqueo o recuperación.

---

#### 15. Fuente de verdad

`ProcessStatusLine` no posee fuente de verdad propia.

La dirección permitida es:

```text
REGISTRO / SERVICIO PROPIETARIO
        ↓
ESTADO PRINCIPAL RESUELTO
        ↓
PROYECCIÓN HUMANA
        ↓
ProcessStatusLine
```

La dirección prohibida es:

```text
ProcessStatusLine
        ↓
calcular estado
        ↓
escribir proceso
```

El componente no consulta ni confirma la existencia de la instancia.

---

#### 16. Orden recibido

El orden de `steps` es responsabilidad de la capa propietaria.

`ProcessStatusLine` lo preserva.

No ordena por:

- `stepId`;
- texto;
- tiempo;
- estado visual;
- prioridad;
- supuesto orden universal;
- posición de `CURRENT`.

Esto evita transformar una proyección de dominio en una inferencia de frontend.

---

#### 17. Prohibición de inferir por posición

Queda prohibido el patrón:

```text
índice < CURRENT  → REACHED
índice = CURRENT  → CURRENT
índice > CURRENT  → NOT_REACHED
```

Cada paso trae su estado explícitamente.

Razones:

- un proceso puede ramificarse;
- una ruta puede omitir estados no aplicables;
- un ciclo puede reingresar en una posición;
- una transición excepcional puede alterar la proyección;
- una etapa visible anterior puede no haber sido efectivamente alcanzada en esa ocurrencia;
- la proximidad visual no constituye una transición canónica.

---

#### 18. Proyección visible frente al grafo completo

El registro canónico de procesos contiene un conjunto amplio de estados y transiciones por proceso.

La línea no intenta renderizar todo ese grafo.

Regla:

```text
GRAFO CANÓNICO COMPLETO
≠
PROYECCIÓN VISIBLE DE LA INSTANCIA
```

El propietario puede seleccionar únicamente las posiciones necesarias para orientación humana, siempre que no invente ni falsifique el ciclo real.

No mostrar una posición no la elimina del contrato del proceso.

---

#### 19. Ramificaciones

Cuando el proceso tenga rutas alternativas, el propietario construirá una proyección coherente con la instancia vigente.

No deberán mostrarse ramas alternativas como si fueran pasos inevitables.

Una alternativa puede:

- omitirse si no aplica al caso actual;
- presentarse en otra superficie explicativa;
- aparecer cuando el contrato propietario determine que es material para comprender el estado.

`ProcessStatusLine` no decide qué rama corresponde.

---

#### 20. Ciclos y reingresos

Los procesos con revisión, reintento empresarial o repetición válida pueden volver conceptualmente a una posición equivalente sin reescribir historia.

La proyección debe distinguir ocurrencias cuando esa diferencia sea material.

`stepId` identifica la ocurrencia renderizada y no debe utilizarse para fingir que un paso histórico es la posición actual.

El componente no genera automáticamente sufijos, rondas o revisiones.

El propietario entrega la representación humana necesaria.

---

#### 21. Estado inicial

La posición inicial puede formar parte de la línea cuando sea útil para orientar a la persona.

Su presencia no significa que:

- el proceso esté aprobado;
- haya ocurrido un efecto posterior;
- exista aceptación;
- se hayan cumplido guards futuros.

La línea preserva la semántica de nacimiento definida por el proceso propietario.

---

#### 22. Estados intermedios

Los estados intermedios visibles deberán representar verdades empresariales ya definidas por el propietario.

No podrán comprimirse en una etiqueta genérica que borre diferencias materiales.

El componente no crea un catálogo alternativo de estados intermedios.

La aplicación puede proyectar una etiqueta humana versionada sin exponer el código técnico como copy primario.

---

#### 23. Estado final

El estado final normal puede representarse como `CURRENT` cuando la instancia realmente está en su cierre canónico.

Una posición final histórica puede representarse como `REACHED` únicamente si la proyección pertenece a una revisión o flujo vinculado que conserva ese hecho sin reinterpretarlo.

La línea no declara `completado` por sí misma.

La completitud empresarial sigue dependiendo de la fuente propietaria y de sus obligaciones, evidencias y conciliaciones.

---

#### 24. Condiciones separadas del ciclo principal

La posición principal y las condiciones transversales son dimensiones distintas.

Ejemplos de condiciones que no se convierten en pasos principales por defecto:

- bloqueo;
- atraso;
- riesgo;
- SLA;
- evidencia incompleta;
- dependencia externa;
- atención requerida;
- sincronización pendiente.

Estas condiciones pueden acompañar visualmente la superficie, pero no compiten con `CURRENT`.

---

#### 25. Bloqueo y espera

`BLOCKED` y `WAITING` no se incorporan a `ProcessStatusLineStepState`.

Una instancia puede estar, por ejemplo:

```text
CURRENT = Preparación
CONDICIÓN = Bloqueada por insumo faltante
```

La UI debe comunicar ambas verdades sin convertir el bloqueo en un nuevo estado principal ficticio.

La explicación y recuperación del bloqueo permanecen en los patrones propietarios correspondientes.

---

#### 26. Frontera con offline y sincronización

La línea de estados no representa:

```text
LOCAL_DRAFT
LOCAL_CAPTURED
QUEUED
SYNCING
SERVER_RECEIVED
RESULT_UNKNOWN
CONFLICT
RECONCILIATION_REQUIRED
```

Esos estados describen persistencia, entrega técnica, sincronización o reconciliación y pertenecen a la tarea siguiente reservada y a contratos de resiliencia.

Una operación local pendiente no puede cambiar visualmente la posición principal como si el servidor hubiera confirmado la transición.

---

#### 27. Prohibición de motor de transiciones

`ProcessStatusLine` no contiene:

- tabla de transiciones;
- source-state / target-state rules;
- guards;
- comandos;
- validadores de transición;
- permisos;
- efectos;
- idempotency keys;
- lógica de concurrencia.

La implementación compartida es de lectura y presentación.

---

#### 28. Proximidad visual no equivale a transición

Una línea o conector entre dos pasos es únicamente una ayuda visual.

Nunca significa:

```text
A puede transicionar a B
```

La autorización de una transición se determina fuera del componente.

Incluso pasos adyacentes pueden no representar una transición directa del grafo canónico si la proyección resume posiciones intermedias no necesarias para la orientación humana.

---

#### 29. Ausencia de comandos y callbacks empresariales

La API base no incorpora:

```text
onAdvance
onBack
onStepClick
onTransition
onComplete
onRetry
onApprove
onReject
```

La línea no ejecuta acciones empresariales.

Si una superficie necesita un CTA, lo compone fuera de esta primitiva con contrato y autorización propios.

---

#### 30. Propiedad de la acción principal

La línea puede ayudar a entender dónde está el proceso, pero no decide la acción siguiente.

El propietario del flujo conserva:

- selección de acción principal;
- elegibilidad;
- autorización;
- confirmación;
- guards;
- ejecución;
- receipt;
- recuperación.

No se utiliza el estado visual del paso para habilitar un botón.

---

#### 31. Navegación y router

`ProcessStatusLine` no depende de:

- `href`;
- `Link`;
- `usePathname`;
- `useSearchParams`;
- router global;
- deep links;
- rutas específicas de aplicación.

La posición de proceso y la ubicación de navegación son conceptos separados.

La línea es no interactiva por defecto.

---

#### 32. Relación con `TaskNavigation`

`TaskNavigation` responde a:

```text
¿qué trabajo puedo descubrir o abrir?
```

`ProcessStatusLine` responde a:

```text
¿en qué posición principal está esta instancia y qué posiciones visibles la rodean?
```

Reglas:

1. abrir una entrada de navegación no cambia el proceso;
2. una entrada activa no implica `CURRENT` empresarial;
3. una línea de estados no reemplaza la navegación;
4. la navegación no infiere el estado desde la ruta;
5. ambas superficies reciben proyecciones preparadas por sus propietarios.

---

#### 33. Relación con `AppShell`

`AppShell` no incorpora `ProcessStatusLine` como estado global obligatorio.

La composición ordinaria es:

```text
AppShell
└─ children
   └─ superficie propietaria de proceso
      └─ ProcessStatusLine
```

Esto evita que el chrome transversal pretenda conocer qué proceso, instancia o etapa está activa.

Una aplicación puede no mostrar la línea en superficies sin ciclo de proceso relevante.

---

#### 34. Relación con la señalización de sincronización

La señalización de conectividad y sincronización permanece separada.

Composición permitida:

```text
SUPERFICIE DE PROCESO
├─ ProcessStatusLine
└─ señalización de sincronización
```

Nunca:

```text
SYNCING como paso principal
QUEUED como etapa empresarial
OFFLINE como estado canónico del proceso
```

La siguiente tarea conserva esa propiedad sin ser adelantada por UI012.

---

#### 35. Ausencia de instancia

Cuando no existe una instancia real no se dibuja una línea ficticia de proceso.

La UI no utiliza una secuencia vacía o genérica para dar la impresión de progreso.

Los estados de ausencia, búsqueda, creación o recuperación pertenecen a sus patrones propietarios.

La línea se monta únicamente cuando existe una proyección material que presentar.

---

#### 36. Etiquetas humanas

`label` debe expresar una situación empresarial comprensible.

No se utiliza como copy primario:

- nombre de tabla;
- enum técnico;
- schema;
- RPC;
- identificador interno;
- nombre de componente;
- permiso;
- slug;
- clave de migración.

La etiqueta humana puede cambiar de idioma o redacción sin alterar la identidad canónica del estado en la capa propietaria.

---

#### 37. Identificadores y códigos técnicos

La API base no requiere `VPROC-*`, state codes o transition IDs porque el componente no los necesita para renderizar.

Si una capa propietaria conserva referencias técnicas para soporte, auditoría o telemetría, no deben convertirse automáticamente en contenido visible de la línea.

`stepId` es identidad de la ocurrencia renderizada, no permiso, estado canónico ni comando.

---

#### 38. Localización

Los textos se preparan fuera del componente y pueden localizarse sin cambiar la semántica empresarial.

Reglas:

- `label` y `description` son humanos;
- `ariaLabel` es humano y localizable;
- cambiar copy no altera `state`;
- cambiar idioma no altera el proceso;
- una traducción no puede generar comandos ni transiciones;
- no se utiliza el label como clave de negocio.

---

#### 39. Semántica HTML

La estructura conceptual preferida es una lista ordenada:

```text
ol
└─ li por paso
```

La semántica comunica secuencia visible sin afirmar que la lista sea el grafo completo del proceso.

Los conectores puramente decorativos quedan fuera del árbol accesible.

No se utilizan roles ARIA que simulen un widget interactivo cuando la línea es de lectura.

---

#### 40. Estado actual accesible

La posición `CURRENT` debe ser identificable sin depender de color.

La implementación utilizará una señal accesible equivalente a:

```text
aria-current="step"
```

además de texto o descripción perceptible cuando sea necesario para evitar ambigüedad.

`REACHED` y `NOT_REACHED` también deben poder distinguirse por estructura o texto accesible, no exclusivamente por estilo cromático.

---

#### 41. Componente no interactivo por defecto

Los pasos no son botones ni enlaces por defecto.

No se añaden tab stops a elementos que solo comunican estado.

Esto evita que una persona interprete cada paso como acción disponible.

Si una superficie especializada necesita navegación o detalle por paso, deberá componerse fuera de la API base y no cambiar el significado de la línea compartida.

---

#### 42. Teclado y foco

Por ser una superficie de lectura:

- no roba foco al actualizarse;
- no mueve foco al paso `CURRENT` automáticamente;
- no introduce controles invisibles;
- no exige teclado para descubrir información ordinaria;
- cualquier contenido interactivo compuesto externamente conserva su propia responsabilidad de foco.

Un cambio de estado no debe interrumpir una captura en curso únicamente para destacar la línea.

---

#### 43. Lectores de pantalla

La lectura debe permitir comprender:

- nombre de la línea;
- número y orden de pasos visibles;
- etiqueta de cada paso;
- paso actual;
- información descriptiva relevante.

Los conectores gráficos no se anuncian como contenido.

No se repite un anuncio assertivo completo de la línea ante cada render ordinario.

Los cambios materiales pueden ser anunciados por la superficie propietaria cuando el contrato de experiencia lo requiera.

---

#### 44. Color, iconos y redundancia perceptiva

Los estados visuales pueden utilizar:

- color;
- forma;
- iconografía;
- peso;
- conectores;
- texto auxiliar.

Pero ninguna de esas señales puede funcionar de manera aislada como única diferencia perceptible.

Un check visual no significa por sí solo `completado empresarial`.

La semántica accesible debe acompañar cualquier icono de hito alcanzado.

---

#### 45. Responsive y reflow

La implementación debe conservar comprensión en:

- escritorio;
- tablet;
- móvil;
- zoom;
- viewport estrecho.

En ancho suficiente puede utilizar disposición horizontal.

En ancho reducido puede refluír a una composición vertical o equivalente.

El cambio de orientación visual no altera orden, estado ni semántica.

No se requiere scroll horizontal estructural para comprender la secuencia ordinaria.

---

#### 46. Movimiento reducido

Cualquier transición visual entre estados es presentacional.

Debe respetar preferencia de movimiento reducido.

Quedan prohibidas animaciones que:

- simulen avance del servidor;
- hagan parecer completada una transición no confirmada;
- funcionen como única señal del cambio;
- retrasen la visualización de un estado material;
- conviertan la línea en una barra de progreso temporal falsa.

---

#### 47. Frontera server/client

La API base se clasifica conceptualmente como **server-safe**.

No necesita:

- hooks de estado;
- efectos;
- `window`;
- `document`;
- timers;
- router;
- storage;
- red.

La línea puede renderizarse dentro de una superficie cliente o dentro de un AppShell interactivo sin convertirse ella misma en un componente client-only por necesidad contractual.

---

#### 48. Datos y privacidad

La API minimiza datos deliberadamente.

No requiere:

- actor completo;
- correo;
- documento;
- teléfono;
- tokens;
- sesión;
- payload de autorización;
- detalle RLS;
- secrets;
- evidence payload;
- correlation ID;
- datos de terceros.

La descripción visible deberá evitar información sensible no necesaria para comprender la posición.

---

#### 49. Diferencia frente a timeline de auditoría

`ProcessStatusLine` no es un historial de eventos.

No incorpora en su API base:

- timestamps;
- actor por evento;
- before/after;
- motivo;
- receipt;
- evidencia;
- correlation ID;
- source event;
- transición exacta.

Un timeline de auditoría puede coexistir en una superficie especializada, pero no se confunde con la línea de orientación del ciclo principal.

---

#### 50. Evidencia NEXO

NEXO demuestra actualmente una implementación local de presentación de estados de remisión.

Se observan:

- valores locales de estado;
- traducción a etiquetas humanas;
- estilos locales por estado;
- un estado derivado de disponibilidad para despacho;
- traza humana de solicitud, preparación, despacho y recepción.

Decisión documental:

```text
la evidencia se usa para reconciliar necesidades visuales
≠
los enums locales se convierten en contrato global
```

NEXO será consumidor candidato de la superficie compartida cuando exista materialización y migración autorizadas.

---

#### 51. Evidencia FOGO

FOGO conserva superficies de producción con composición empresarial propia, captura de ingredientes, resultados, empaques, ubicaciones y cantidades.

Esa evidencia demuestra que una línea compartida debe poder integrarse sin conocer:

- recetas;
- lotes;
- unidades;
- empaques;
- destinos;
- reglas de producción.

La aplicación seguirá preparando la proyección del ciclo correspondiente y entregará únicamente los pasos humanos necesarios al componente compartido.

---

#### 52. Evidencia nativa y separación de plataforma

Existe evidencia de experiencias nativas con timelines de pedidos dentro del ecosistema.

No se adopta esa implementación como fuente de `@vento/ui-web`.

La fundación web y la UI nativa permanecen separadas.

Se pueden compartir significados y contratos cuando su propietario lo apruebe, pero no copiar componentes React Native dentro del package web ni declarar compatibilidad por similitud visual.

---

#### 53. Reglas de reconciliación de consumidores

La reconciliación de consumidores utiliza estas disposiciones documentales:

```text
CANDIDATO_A_MIGRAR
CANDIDATO_A_ADOPTAR
COMPOSICIÓN_ELEGIBLE_SIN_EQUIVALENTE_RUNTIME_ACTUAL
```

Definiciones:

- `CANDIDATO_A_MIGRAR`: existe evidencia local de presentación equivalente o cercana que deberá compararse antes de sustitución;
- `CANDIDATO_A_ADOPTAR`: la aplicación tiene procesos que pueden usar el componente, pero esta tarea no confirma una copia equivalente concreta que retirar;
- `COMPOSICIÓN_ELEGIBLE_SIN_EQUIVALENTE_RUNTIME_ACTUAL`: la superficie compartida puede componerse en el producto, pero no se confirma un equivalente runtime actual que migrar.

Ninguna disposición significa implementación física.

---

#### 54. Matriz de consumidores web

La cobertura materializada conserva exactamente los siete consumidores web previstos por la fundación compartida:

| Consumidor | Disposición UI012                                     | Evidencia / decisión                                                                                                               |
| ---------- | ----------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL`    | `COMPOSICIÓN_ELEGIBLE_SIN_EQUIVALENTE_RUNTIME_ACTUAL` | el launcher no debe fabricar un ciclo de proceso global; podrá componer una línea solo dentro de una superficie propietaria futura |
| `VISO`     | `CANDIDATO_A_ADOPTAR`                                 | consumidor web previsto; no se confirma en esta tarea una copia equivalente concreta que retirar                                   |
| `NEXO`     | `CANDIDATO_A_MIGRAR`                                  | se confirmó presentación local de estados y traza de remisiones que deberá reconciliarse durante migración                         |
| `FOGO`     | `CANDIDATO_A_ADOPTAR`                                 | existen superficies de producción empresariales; la proyección de ciclo seguirá siendo propietaria                                 |
| `ORIGO`    | `CANDIDATO_A_ADOPTAR`                                 | consumidor web previsto; la adopción dependerá de procesos y proyecciones propietarias materializadas                              |
| `PULSO`    | `CANDIDATO_A_ADOPTAR`                                 | consumidor web previsto; no se declara un timeline local equivalente sin evidencia específica                                      |
| `NUMERA`   | `CANDIDATO_A_ADOPTAR`                                 | consumidor web previsto; las etapas financieras conservarán semántica y propiedad propias                                          |

Conteo:

```text
consumidores esperados = 7
consumidores materializados en la matriz = 7
faltantes = 0
duplicados = 0
```

---

#### 55. Decisión para SHELL

SHELL no se convierte en propietario universal del estado de los procesos.

El launcher puede abrir aplicaciones, pero no debe mostrar una secuencia empresarial como si conociera el ciclo interno de cada dominio.

Una futura superficie SHELL que agregue trabajo cross-app solo podrá componer `ProcessStatusLine` desde una proyección contractual recibida del propietario correspondiente.

No se infiere estado desde la aplicación activa.

---

#### 56. Decisión para NEXO

NEXO queda como `CANDIDATO_A_MIGRAR`.

La migración futura deberá:

1. inventariar cada presentación local de estado relevante;
2. distinguir chips de estado, trazas, timelines y condiciones;
3. mapear únicamente posiciones principales equivalentes;
4. mantener condiciones como parcialidad, bloqueo o sincronización según su semántica real;
5. comparar copy humano y accesibilidad;
6. conservar comportamiento propietario de las remisiones;
7. demostrar paridad antes de retirar código local.

No se modifica NEXO en esta tarea.

---

#### 57. Decisión para FOGO

FOGO queda como `CANDIDATO_A_ADOPTAR`.

La futura adopción no trasladará al package compartido:

- cálculo de producción;
- ingredientes;
- rendimientos;
- empaques;
- unidades;
- ubicaciones;
- validaciones de lote;
- escritura de inventario.

Solo la proyección humana del ciclo que corresponda podrá usar la línea compartida.

---

#### 58. Decisiones para ORIGO, PULSO, VISO y NUMERA

Los cuatro consumidores quedan como `CANDIDATO_A_ADOPTAR`.

Reglas comunes:

- cada aplicación conserva su fuente de verdad;
- cada una decide qué proceso e instancia está mostrando;
- los estados de dominio no se reemplazan por un enum global de UI;
- la proyección visible usa labels humanos preparados;
- el package no recibe permisos ni comandos;
- la adopción exige evidencia de compatibilidad y rollback;
- la ausencia de un equivalente local confirmado impide declarar migración o retiro en esta tarea.

---

#### 59. Relación con template y patrones legacy

La plantilla AppShell histórica no contiene un contrato canónico de línea de estados que deba convertirse automáticamente en export compartido.

Las implementaciones locales detectadas en aplicaciones se consideran evidencia de uso y necesidades, no API canónica por existencia.

Queda prohibido:

```text
copiar un stepper local al package
→ llamarlo compartido
→ asumir paridad
```

La adopción seguirá la secuencia de package, compatibilidad, migración y retiro controlado.

---

#### 60. Handoff a migración coordinada

La migración posterior deberá:

1. inventariar steppers, timelines, chips, trazas y encabezados de estado por consumidor;
2. separar posición principal, condición transversal, evento histórico y sincronización;
3. identificar la fuente autoritativa de cada proyección;
4. construir adapters locales hacia `ProcessStatusLineStep[]`;
5. demostrar que el adapter no infiere transiciones por índice;
6. conservar copy y localización válidos;
7. comparar accesibilidad y responsive;
8. migrar por repositorio con rollback;
9. impedir nuevos clones del patrón compartido;
10. retirar únicamente implementaciones con ausencia de uso residual demostrada.

No se ejecuta ese handoff en UI012.

---

#### 61. Handoff a calidad y releases

La futura materialización conservará las responsabilidades ya asignadas para paquetes compartidos:

| Área                | Evidencia futura esperada                                        |
| ------------------- | ---------------------------------------------------------------- |
| pruebas del package | semántica de estados, accesibilidad, reflow, ausencia de efectos |
| build               | package independiente reproducible                               |
| release             | identidad versionada e inmutable                                 |
| changelog           | cambios de API y comportamiento visibles                         |
| compatibilidad      | matriz contra consumidores web previstos                         |
| adopción            | cambios controlados por consumidor                               |
| rollback            | retorno a combinación soportada sin recuperar patrones inseguros |

UI012 especifica el contrato de presentación; no publica una versión.

---

#### 62. Contrato futuro de prueba

La implementación física deberá demostrar, como mínimo:

1. render de una lista con pasos explícitos;
2. conservación exacta del orden recibido;
3. un único `CURRENT` en una proyección válida;
4. identificación accesible del `CURRENT`;
5. `REACHED` suministrado explícitamente;
6. `NOT_REACHED` suministrado explícitamente;
7. ausencia de inferencia por índice;
8. ausencia de inferencia por ruta;
9. ausencia de inferencia por timestamp;
10. ausencia de inferencia por color;
11. ausencia de sort interno;
12. ausencia de transitions registry dentro del componente;
13. ausencia de `nextAllowedStates`;
14. ausencia de commands;
15. ausencia de callbacks empresariales;
16. ausencia de escritura de estado;
17. ausencia de Supabase;
18. ausencia de RPC;
19. ausencia de Auth;
20. ausencia de permisos;
21. ausencia de rol como autorización;
22. ausencia de `canOperate`;
23. ausencia de router;
24. ausencia de `href` obligatorio;
25. ausencia de storage;
26. ausencia de timers como progreso;
27. ausencia de estado offline dentro de la taxonomía base;
28. ausencia de estado de sincronización dentro de la taxonomía base;
29. una condición de bloqueo no reemplaza `CURRENT`;
30. una condición de espera no reemplaza `CURRENT`;
31. un conflicto no fabrica una nueva posición principal;
32. ramificación preparada por el propietario;
33. alternativas no aplicables omitibles;
34. ciclo o reingreso con identidad de ocurrencia no ambigua;
35. estado inicial sin efectos implícitos;
36. estado intermedio sin cierre implícito;
37. estado final mostrado solo desde proyección confirmada;
38. paso alcanzado sin copy falso de completitud;
39. conector decorativo sin semántica de transición;
40. lista ordenada semántica;
41. no dependencia exclusiva de color;
42. no dependencia exclusiva de icono;
43. sin tab stops innecesarios;
44. sin robo de foco;
45. sin anuncio assertivo repetitivo;
46. zoom;
47. reflow;
48. viewport estrecho;
49. disposición horizontal cuando exista espacio;
50. disposición vertical o equivalente en ancho reducido;
51. movimiento reducido;
52. ausencia de animación que simule confirmación;
53. server-safe sin APIs cliente obligatorias;
54. datos sensibles ausentes de la API base;
55. códigos técnicos no usados como copy primario;
56. localización sin cambio de identidad empresarial;
57. composición dentro de una superficie propietaria;
58. coexistencia con `TaskNavigation` sin acoplamiento;
59. coexistencia con AppShell sin estado global de proceso;
60. coexistencia con señalización de sincronización separada;
61. ausencia de línea ficticia cuando no existe instancia;
62. adapters por consumidor sin trasladar lógica empresarial al package;
63. paridad NEXO antes de retirar presentación local equivalente;
64. adopción FOGO sin trasladar lógica de producción;
65. adopción de otros consumidores solo con evidencia;
66. rollback por consumidor;
67. ninguna variante visual concede autoridad;
68. ninguna posición visual ejecuta una transición.

Esta lista define evidencia futura; no declara implementación ni ejecución física.

---

#### 63. Cobertura de requisitos vigente

La tarea no necesita crear una obligación transversal nueva porque el registro vigente ya cubre:

- foco real derivado de proceso, instancia, etapa, estado, contexto, recurso y siguiente acción: `TREQ-UX-024`;
- separación entre elegibilidad, asignación, claim, inicio, pausa y finalización: `TREQ-UX-025`;
- foco y estado visibles sin inferencias opacas de frontend: `TREQ-UX-026`, `TREQ-UX-028`;
- superficie operativa centrada en proceso, recurso, etapa, estado y siguiente acción: `TREQ-UX-029`;
- explicación humana de bloqueos y recuperación: `TREQ-UX-031`, `TREQ-UX-037`;
- accesibilidad del foco sin dependencia exclusiva de color o animación: `TREQ-UX-038`;
- eventos diferenciados de presentación, inicio, pausa, bloqueo, handoff y completitud: `TREQ-UX-040`;
- lenguaje humano y separación de identificadores técnicos: `TREQ-UX-041`, `TREQ-UX-043`;
- proyección humana versionada de estados sin inferir transiciones desde copy: `TREQ-UX-054`;
- localización y accesibilidad de etiquetas: `TREQ-UX-056`;
- separación entre autorización, relevancia, visibilidad y posibilidad de actuar: `TREQ-UX-059`;
- taxonomía independiente de impedimentos y condiciones: `TREQ-UX-097`;
- un único estado inicial vigente por proceso: `TREQ-PROC-038`;
- verdad limitada del estado inicial: `TREQ-PROC-040`;
- cobertura de estados intermedios y semántica propia: `TREQ-PROC-043`, `TREQ-PROC-044`;
- una única posición principal y condiciones transversales separadas: `TREQ-PROC-045`;
- control de versión, concurrencia e historia para cambios de estado: `TREQ-PROC-046`;
- un único final normal y cierre no inferido: `TREQ-PROC-048`, `TREQ-PROC-050`;
- grafo explícito de transiciones y prohibición de inferir transición por nombre, orden o proximidad visual: `TREQ-PROC-053`, `TREQ-PROC-054`;
- guards e idempotencia de comandos de transición: `TREQ-PROC-055`;
- completitud empresarial antes de presentar cierre: `TREQ-PROC-081`;
- propiedad única del estado por aplicación propietaria: `TREQ-PROC-019`, `TREQ-PROC-112`;
- handoff sin marcar la etapa siguiente como completada: `TREQ-PROC-034`, `TREQ-PROC-169`;
- reautorización por etapa en procesos híbridos: `TREQ-PROC-168`;
- estados temporales honestos y resultado desconocido: `TREQ-PROC-277`;
- estados de sincronización y reconciliación separados del ciclo principal: `TREQ-PROC-298`;
- responsabilidad compartida clasificada y migración segura: `TREQ-SHELL-002`;
- template histórico separado de runtime compartido: `TREQ-SHELL-029`;
- versionado, compatibilidad y retiro seguro de superficies compartidas: `TREQ-SHELL-036` a `TREQ-SHELL-039`.

UI012 especializa esas obligaciones en una primitiva visual de lectura sin alterar la semántica de los procesos ni crear una nueva fuente de verdad.

---

#### 64. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos descartados:** 0

La cobertura vigente ya exige posición principal única, estados y transiciones gobernados, proyección humana, separación de condiciones, accesibilidad, honestidad de progreso, autoridad server-side y resiliencia. UI012 únicamente fija cómo una superficie web compartida presenta una proyección ya resuelta de esas obligaciones.

---

#### 65. Fuera de alcance

Quedan fuera de UI012:

- materializar `@vento/ui-web`;
- crear archivos TypeScript del package;
- crear exports físicos;
- modificar aplicaciones consumidoras;
- crear o cambiar estados de proceso;
- crear o cambiar transiciones;
- implementar motor de workflow;
- implementar comandos;
- implementar autorización;
- resolver permisos;
- implementar RLS o RPC;
- cambiar Supabase;
- crear SQL o migraciones;
- implementar offline;
- implementar sincronización;
- crear timeline de auditoría;
- decidir la acción principal;
- implementar navegación;
- desplegar;
- publicar releases;
- retirar código legacy.

---

#### 66. Criterios de aceptación documental

`SHELL-UI-012` queda documentalmente cerrada cuando se cumplen simultáneamente:

- [x] existe una identidad única `ProcessStatusLine`;
- [x] pertenece conceptualmente a `@vento/ui-web`;
- [x] se define como superficie de lectura y presentación;
- [x] se especifica una API conceptual mínima;
- [x] cada paso conserva identidad, label, descripción opcional y estado explícito;
- [x] la taxonomía base queda limitada a `REACHED`, `CURRENT` y `NOT_REACHED`;
- [x] se evita `COMPLETE` como afirmación genérica de negocio;
- [x] se exige una única posición `CURRENT` cuando existe una instancia resuelta;
- [x] se prohíbe inferir estados por índice;
- [x] se preserva el orden recibido;
- [x] se distingue proyección visible de grafo completo;
- [x] se resuelven ramificaciones sin presentar alternativas como inevitables;
- [x] se resuelven ciclos y reingresos sin reescribir historia;
- [x] se conservan las semánticas de estado inicial, intermedio y final;
- [x] se separan condiciones transversales de la posición principal;
- [x] bloqueo y espera no se convierten en estados principales de la línea;
- [x] offline y sincronización quedan separados;
- [x] se prohíbe motor de transiciones dentro del componente;
- [x] se declara que proximidad visual no equivale a transición;
- [x] se excluyen comandos y callbacks empresariales de la API base;
- [x] se mantiene la acción principal fuera del componente;
- [x] se mantiene router y navegación fuera del componente;
- [x] se delimita su relación con `TaskNavigation`;
- [x] se delimita su relación con AppShell;
- [x] se conserva la tarea de sincronización siguiente sin adelantarla;
- [x] no se fabrica una línea cuando no existe instancia;
- [x] se exige copy humano y localizable;
- [x] se separan códigos técnicos de contenido ordinario;
- [x] se especifica lista ordenada semántica;
- [x] se identifica accesiblemente el paso actual;
- [x] el componente es no interactivo por defecto;
- [x] se evita tab order innecesario y robo de foco;
- [x] se cubren lectores de pantalla;
- [x] no depende exclusivamente de color o icono;
- [x] se cubren responsive, zoom y reflow;
- [x] se respeta movimiento reducido;
- [x] la API base permanece server-safe;
- [x] se minimizan datos sensibles;
- [x] se separa la línea de un timeline de auditoría;
- [x] se reconcilia evidencia actual de NEXO;
- [x] se conserva composición propietaria de FOGO;
- [x] se mantiene separada la UI nativa;
- [x] se materializan siete decisiones de consumidor;
- [x] existen cero faltantes y cero duplicados en la matriz;
- [x] se define handoff a migración;
- [x] se define handoff a calidad y releases;
- [x] se define evidencia futura de prueba;
- [x] se demuestra cobertura de requisitos existente;
- [x] se crean cero requisitos y se modifican cero;
- [x] no se ejecuta implementación física;
- [x] la siguiente tarea queda únicamente reservada.

---

#### 67. Decisiones consolidadas

Quedan fijadas las siguientes decisiones vinculantes:

1. La superficie conceptual se denomina `ProcessStatusLine`.
2. Pertenece conceptualmente a `@vento/ui-web`.
3. Es una primitiva visual de lectura, no una máquina de estados.
4. La fuente de verdad permanece en la aplicación y contrato propietarios.
5. La API base contiene `ariaLabel` y `steps`.
6. Cada paso contiene `stepId`, `label`, `description` opcional y `state`.
7. Los estados visuales base son `REACHED`, `CURRENT` y `NOT_REACHED`.
8. `REACHED` significa posición alcanzada confirmada por el propietario.
9. `REACHED` no significa proceso completo.
10. `CURRENT` es la única posición principal actual de la proyección válida.
11. `NOT_REACHED` no significa transición autorizada ni siguiente paso garantizado.
12. Los estados de cada paso se entregan explícitamente.
13. El componente no infiere estados por índice.
14. El componente preserva el orden recibido.
15. El componente no ordena por tiempo, texto o estado.
16. La proyección visible no es el grafo completo.
17. El propietario decide qué rama se presenta.
18. Alternativas no aplicables no se muestran como inevitables.
19. Los ciclos y reingresos conservan ocurrencias diferenciadas cuando sea material.
20. `stepId` no es un código de autorización ni de transición.
21. El estado inicial no implica efectos posteriores.
22. Un estado intermedio no implica cierre.
23. El final se presenta únicamente desde una proyección confirmada.
24. La completitud empresarial no se calcula en UI.
25. Cada instancia conserva una posición principal única.
26. Bloqueos, atrasos, riesgos, SLA y pendientes son condiciones separadas.
27. `BLOCKED` no pertenece al enum base de pasos.
28. `WAITING` no pertenece al enum base de pasos.
29. Estados offline y de sincronización no pertenecen al enum base.
30. La tarea siguiente conserva la señalización de sincronización.
31. No existe motor de transiciones dentro del componente.
32. La proximidad visual no prueba una transición válida.
33. No existen callbacks empresariales obligatorios.
34. La línea no ejecuta acciones.
35. La línea no habilita CTAs.
36. La línea no recibe permisos.
37. La línea no recibe roles para autorizar.
38. La línea no recibe `canOperate`.
39. La línea no consulta Supabase.
40. La línea no ejecuta RPC.
41. La línea no escribe estados.
42. La línea no depende de router.
43. La línea no necesita `href`.
44. `TaskNavigation` y `ProcessStatusLine` conservan responsabilidades distintas.
45. AppShell no se convierte en propietario global del estado de proceso.
46. La línea se compone dentro de la superficie propietaria.
47. No se muestra una línea ficticia sin instancia real.
48. Las etiquetas ordinarias usan lenguaje humano.
49. Los códigos técnicos no son copy primario.
50. El copy puede localizarse sin cambiar semántica de negocio.
51. La estructura preferida es una lista ordenada.
52. `CURRENT` se comunica con semántica accesible equivalente a `aria-current="step"`.
53. Los conectores decorativos no se anuncian.
54. Los pasos son no interactivos por defecto.
55. El componente no roba foco.
56. No se crean tab stops innecesarios.
57. El significado no depende solo de color o icono.
58. La implementación debe soportar responsive, zoom y reflow.
59. La animación no puede simular confirmación empresarial.
60. La API base es server-safe.
61. La API minimiza datos sensibles.
62. La línea no sustituye un timeline de auditoría.
63. NEXO queda `CANDIDATO_A_MIGRAR`.
64. FOGO, ORIGO, PULSO, VISO y NUMERA quedan `CANDIDATO_A_ADOPTAR`.
65. SHELL queda `COMPOSICIÓN_ELEGIBLE_SIN_EQUIVALENTE_RUNTIME_ACTUAL`.
66. La matriz cubre siete de siete consumidores, sin faltantes ni duplicados.
67. La adopción será progresiva, reversible y con paridad demostrada.
68. UI012 crea cero requisitos de prueba y modifica cero.

---

#### 68. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-UI-011 — Compartir navegación orientada a tareas`

**TAREA ACTUAL APROBADA**
`SHELL-UI-012 — Compartir línea de estados de proceso`

**SIGUIENTE TAREA RESERVADA**
`SHELL-UI-013 — Compartir panel de acción principal`


### ✅ SHELL-UI-013 — Compartir panel de acción principal

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-012 — Compartir línea de estados de proceso
**Tarea siguiente:** SHELL-UI-014 — Compartir confirmaciones de acciones sensibles
**Tipo de tarea:** Documental; definición canónica del panel compartido de acción principal para `@vento/ui-web`, su identidad, jerarquía, API conceptual, estados de presentación, composición con `Button`, fronteras de autorización y ejecución, accesibilidad, reconciliación de consumidores y handoff de migración, sin materializar package, comandos empresariales, permisos, mutaciones, cambios runtime, SQL, migraciones, releases ni despliegues
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_COMPONENTES_WEB_COMPARTIDOS.md`
**Estado físico resultante:** ESPECIFICADO; PACKAGE, EXPORTS Y PANEL COMPARTIDO NO MATERIALIZADOS
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0
**Package propietario:** `@vento/ui-web`
**Naturaleza:** patrón visual web compartido para presentar y componer una acción principal ya resuelta; no es resolver de autorización, catálogo de acciones, Server Action, endpoint, máquina de estados ni motor de confirmación

---

#### 1. Propósito

`SHELL-UI-013` define `PrimaryActionPanel` como la superficie compartida de `@vento/ui-web` destinada a hacer inequívoca la acción principal ya resuelta para una superficie, caso o etapa de trabajo.

El componente existe para conservar una jerarquía visual y semántica uniforme entre aplicaciones sin trasladar al package la decisión empresarial que determina cuál acción es principal, quién puede ejecutarla, bajo qué condiciones puede ejecutarse ni qué efecto produce.

La regla raíz queda:

```text
CONTRATO PROPIETARIO DE LA SUPERFICIE
        ↓
ACCIÓN PRINCIPAL YA RESUELTA
        ↓
AUTORIZACIÓN + CONTEXTO + ESTADO YA EVALUADOS
        ↓
PROYECCIÓN PRESENTACIONAL
        ↓
PrimaryActionPanel
        ↓
CONTROL DE ACCIÓN COMPUESTO POR EL PROPIETARIO
```

Nunca:

```text
PrimaryActionPanel → selecciona la acción principal
PrimaryActionPanel → concede permiso
PrimaryActionPanel → decide una transición
PrimaryActionPanel → ejecuta una mutación por sí mismo
PrimaryActionPanel → declara éxito sin resultado autoritativo
PrimaryActionPanel → convierte una acción secundaria en principal
```

---

#### 2. Alcance de la tarea

La tarea materializa documentalmente:

- identidad conceptual del componente;
- responsabilidad visual y semántica;
- API conceptual mínima;
- identidad estable de la acción;
- copy humano de la acción;
- estados presentacionales admitidos;
- composición con `Button`;
- regla de una sola acción principal;
- tratamiento acotado de una acción secundaria adyacente;
- separación entre presentación, autorización y ejecución;
- separación entre acción, transición y resultado;
- comportamiento durante espera de resultado;
- tratamiento de concurrencia y reintento;
- frontera con confirmaciones sensibles;
- relación con `ProcessStatusLine`, `TaskNavigation` y AppShell;
- accesibilidad, responsive, tablet y kiosco;
- localización, telemetría y privacidad;
- reconciliación de los siete consumidores web previstos;
- handoff a migración, calidad, compatibilidad y releases;
- cobertura de requisitos existente.

No materializa código, package, export, callback empresarial, permiso, Server Action, RPC, SQL, migración, release ni despliegue.

---

#### 3. Dependencias documentales consumidas

La definición conserva las decisiones ya aprobadas de:

| Fuente                            | Decisión heredada                                                                                      |
| --------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `SHELL-UI-001`                    | `@vento/ui-web` es presentación web compartida y no fuente de autorización, datos o lógica empresarial |
| `SHELL-UI-003`                    | `Button` conserva semántica nativa, variantes, disabled y loading sin declarar resultado empresarial   |
| `SHELL-UI-010`                    | AppShell controla marco y composición, no el proceso ni la decisión empresarial                        |
| `SHELL-UI-011`                    | `TaskNavigation` presenta destinos ya resueltos y no ejecuta acciones de negocio                       |
| `SHELL-UI-012`                    | `ProcessStatusLine` presenta una posición de proceso ya resuelta y no ejecuta transiciones             |
| `AUTH-UI-024`                     | cada superficie conserva una acción principal identificable, única y semánticamente gobernada          |
| `SHELL-MIG-001` a `SHELL-MIG-008` | adopción física por lotes, con paridad, reversibilidad y retiro controlado                             |
| `SHELL-CI-001` a `SHELL-CI-006`   | pruebas, build, versionado, changelog, compatibilidad y actualización controlada de consumidores       |

UI013 no sustituye ninguno de esos propietarios.

---

#### 4. Evidencia técnica vigente

El estado verificable de partida conserva:

- workspace raíz compatible con `packages/*`;
- `packages/os-context` materializado;
- ausencia de package físico `@vento/ui-web`;
- un `Button` local en SHELL con variantes y estado `loading`;
- una familia local `Button` equivalente en NEXO, FOGO, ORIGO, VISO, PULSO y NUMERA;
- variante `primary` en los seis consumidores de negocio inspeccionados;
- ausencia de un `PrimaryActionPanel` transversal materializado;
- launcher propio en SHELL, sin panel transversal equivalente;
- contratos canónicos de acción principal ya definidos fuera de `@vento/ui-web`.

La evidencia permite compartir la composición y jerarquía visual, pero no autoriza convertir una copia local existente en la implementación canónica.

---

#### 5. Resultado documental

Queda especificada la superficie conceptual:

```text
PrimaryActionPanel
PrimaryActionPanelProps
PrimaryActionPresentationState
```

Resultado:

```text
IDENTIDAD DEL PANEL                      = ESPECIFICADA
IDENTIDAD DE ACCIÓN                      = PRESERVADA
JERARQUÍA PRINCIPAL                      = ESPECIFICADA
ESTADOS PRESENTACIONALES                 = ESPECIFICADOS
COMPOSICIÓN CON BUTTON                   = ESPECIFICADA
AUTORIZACIÓN EN EL PANEL                 = PROHIBIDA
MOTOR DE EJECUCIÓN EN EL PANEL           = PROHIBIDO
MOTOR DE TRANSICIONES EN EL PANEL        = PROHIBIDO
CONFIRMACIÓN SENSIBLE EN EL PANEL        = DIFERIDA A SU PROPIETARIO
PACKAGE FÍSICO                           = NO MATERIALIZADO
MIGRACIÓN DE CONSUMIDORES                = NO EJECUTADA
```

---

#### 6. Identidad pública conceptual

La identidad conceptual aprobada es:

```text
PrimaryActionPanel
```

No se crean identidades alternativas como:

```text
ActionBar
PrimaryCTA
SubmitPanel
CommandPanel
WorkflowAction
ActionExecutor
```

El nombre describe una superficie de composición y jerarquía, no una autoridad de ejecución.

---

#### 7. Modelo conceptual general

El modelo objetivo es:

```text
SUPERFICIE PROPIETARIA
  ↓
resuelve una única acción principal
  ↓
resuelve relevancia, autorización, estado y condiciones
  ↓
construye el control ejecutable apropiado
  ↓
PrimaryActionPanel presenta jerarquía y contexto
```

El panel recibe una proyección ya preparada.

No consulta fuentes empresariales para reconstruirla.

---

#### 8. Superficie conceptual de props

La API conceptual mínima queda:

```ts
type PrimaryActionPresentationState =
  | "READY"
  | "PENDING"
  | "CONTEXTUAL_DISABLED"
  | "REQUIRED_BLOCKED";

type PrimaryActionPanelProps = {
  ariaLabel: string;
  actionId: string;
  label: string;
  description?: string;
  state: PrimaryActionPresentationState;
  statusLabel?: string;
  primaryControl: React.ReactNode;
  secondaryControl?: React.ReactNode;
};
```

La forma es conceptual. UI013 no fija subpath npm, archivo TypeScript, barrel, mapa de exports ni layout interno del package.

---

#### 9. Identidad de acción principal

`actionId` identifica de manera estable la acción principal que la superficie propietaria ya resolvió.

Para superficies gobernadas por el registro canónico de acciones de vista, el valor debe corresponder a la identidad aprobada por ese contrato.

`PrimaryActionPanel` no:

- genera `actionId`;
- concatena identificadores de vista;
- interpreta segmentos del código;
- deriva autorización desde el código;
- usa el código como texto visible ordinario;
- sustituye el registro propietario de acciones.

Cambiar copy, layout o implementación del control no cambia por sí mismo la identidad empresarial de la acción.

---

#### 10. Fuente de la acción principal

La acción principal llega resuelta desde la superficie propietaria.

El panel no recibe una colección de candidatos para decidir entre ellos.

Queda prohibido:

```text
acciones[]
→ ordenar por prioridad visual
→ escoger la primera habilitada
→ promover una secundaria por viewport
→ promover una secundaria por rol
→ promover una secundaria por dispositivo
→ inferir la principal por color o posición
```

La selección pertenece al contrato de la superficie y a sus propietarios canónicos.

---

#### 11. `label`

`label` representa el nombre humano aprobado de la acción.

Debe:

- describir una acción concreta;
- comenzar con una intención verbal comprensible cuando el contrato propietario así lo exige;
- identificar el objeto o resultado empresarial;
- ser localizable;
- conservar significado consistente con `actionId`;
- evitar códigos técnicos como copy ordinario.

El panel no reemplaza automáticamente el label por textos genéricos como `Guardar`, `Aceptar`, `Continuar` o `Procesar`.

---

#### 12. `description`

`description` explica contexto o efecto cuando sea útil para comprender qué ocurrirá al actuar.

Puede aclarar:

- objeto afectado;
- resultado esperado;
- alcance visible;
- condición material previa;
- consecuencia relevante no obvia.

No debe convertirse en:

- log técnico;
- payload de autorización;
- dump de servidor;
- lista de permisos;
- sustituto de una confirmación sensible;
- lugar para ocultar consecuencias materiales que deban permanecer perceptibles.

---

#### 13. Estados de presentación

`PrimaryActionPresentationState` contiene únicamente:

```text
READY
PENDING
CONTEXTUAL_DISABLED
REQUIRED_BLOCKED
```

Estos estados describen cómo presentar una acción ya proyectada.

No son estados del proceso, de una transición, de autorización ni de persistencia empresarial.

---

#### 14. `READY`

`READY` significa que la proyección propietaria entrega la acción como disponible para interacción en la superficie actual.

No significa:

```text
permiso garantizado hasta el commit
transición válida sin revalidación
recurso todavía vigente
resultado ya confirmado
servidor disponible
operación idempotente por definición
```

El punto de ejecución conserva sus guards y validaciones autoritativas.

---

#### 15. `PENDING`

`PENDING` representa una acción cuya ejecución equivalente ya fue iniciada por la composición propietaria y cuyo resultado autoritativo todavía no debe considerarse final.

Durante ese estado:

- la interfaz debe evitar activaciones equivalentes repetidas cuando corresponda;
- la identidad de la acción debe permanecer comprensible;
- el estado ocupado debe ser perceptible;
- no se declara éxito;
- no se declara fracaso sin resultado correspondiente;
- no se fabrica un nuevo intento automáticamente;
- no se convierte espera de red en una transición empresarial.

Cuando el control usado sea `Button`, se reutiliza su contrato de `loading` en lugar de redefinirlo dentro del panel.

---

#### 16. `CONTEXTUAL_DISABLED`

`CONTEXTUAL_DISABLED` significa que la acción sigue siendo relevante para comprender la superficie, pero una precondición contextual vigente impide actuar en ese momento.

La causa debe llegar preparada desde el propietario cuando sea material.

Ejemplos de categorías que pueden originar esta presentación, sin convertirlas en lógica del panel:

- información obligatoria aún incompleta;
- contexto operativo todavía no resuelto;
- recurso temporalmente no elegible;
- condición local de interacción aún no satisfecha.

El panel no calcula la causa.

---

#### 17. `REQUIRED_BLOCKED`

`REQUIRED_BLOCKED` representa una acción u obligación que debe permanecer visible porque forma parte del trabajo esperado, aunque actualmente no pueda ejecutarse.

La presentación debe permitir comprender:

- qué acción sigue siendo requerida;
- que no puede ejecutarse ahora;
- una explicación humana cuando esté disponible;
- el camino de recuperación cuando corresponda y sea propiedad de la superficie.

El panel no convierte un bloqueo en permiso, excepción ni bypass.

---

#### 18. Exclusión explícita de `HIDDEN`

`HIDDEN` no forma parte del enum renderizable.

Una acción que no debe revelarse se filtra antes de construir las props.

Por tanto:

```text
HIDDEN
→ no se pasa al componente
→ no se renderiza
→ no permanece en el DOM
→ no entra al orden de foco
→ no deja un control disabled como pista de capacidad
```

La ausencia de la acción tampoco demuestra ausencia de capacidad en servidor.

---

#### 19. `primaryControl`

`primaryControl` contiene el control interactivo ya compuesto por la superficie propietaria.

Puede ser, según el consumidor y el contrato de la acción:

- un `Button` compartido;
- un control de submit compatible;
- una composición cliente propietaria;
- una composición que invoque una Server Action en la capa adecuada;
- otro control accesible que conserve la misma identidad y jerarquía.

El panel no inspecciona el `ReactNode` para inferir permisos, payload, endpoint, transición o resultado.

---

#### 20. Composición con `Button`

La opción ordinaria para una acción de botón será componer el `Button` definido por `SHELL-UI-003`.

`PrimaryActionPanel` no redefine:

- variantes de Button;
- tamaños de Button;
- semántica HTML del botón;
- `disabled`;
- `loading`;
- `aria-busy`;
- tipo nativo;
- foco del control.

Forma conceptual:

```text
PrimaryActionPanel
└─ primaryControl
   └─ Button variant="primary"
```

Una variante visual `danger` no determina por sí sola que una acción sea sensible o destructiva; esa clasificación pertenece al contrato propietario.

---

#### 21. Acción principal única

Una superficie resuelta presenta exactamente una acción principal.

El panel no admite dos `primaryControl` competidores.

Si una interfaz parece requerir dos acciones igualmente dominantes, la solución no es duplicar el panel: debe revisarse la intención de la superficie, la jerarquía de acciones o la necesidad de separar el flujo.

---

#### 22. Acción principal no equivale a autorización

La existencia de `PrimaryActionPanel` no concede autoridad.

Nunca:

```text
visible = autorizado
READY = autorizado irrevocablemente
disabled = denegado por servidor
oculto = permiso inexistente
primary = permitido para cualquier actor
```

La autorización autoritativa permanece fuera de la primitiva visual.

---

#### 23. Acción principal no equivale a transición

Una acción puede:

- navegar;
- consultar;
- capturar un hecho;
- solicitar una decisión;
- ejecutar una operación;
- preparar un cambio;
- publicar una definición;
- reconciliar una diferencia;
- iniciar una integración.

Por tanto, `PrimaryActionPanel` no interpreta toda acción como transición de proceso.

Cuando exista transición, su validez pertenece al contrato y motor propietarios.

---

#### 24. Acción principal no equivale a resultado

Activar el control no autoriza al panel a presentar automáticamente:

```text
completado
aprobado
pagado
entregado
publicado
sincronizado
confirmado
```

El resultado se presenta únicamente cuando la capa propietaria recibe la confirmación adecuada de la fuente de verdad correspondiente.

---

#### 25. Frontera de servidor

Toda acción material conserva su frontera autoritativa.

Según corresponda, la capa propietaria revalida:

- actor;
- permiso;
- recurso;
- propiedad o custodia;
- sede;
- área;
- periodo;
- estado;
- transición;
- vigencia;
- idempotencia;
- precondiciones de negocio.

El panel no sustituye estas validaciones con estado visual.

---

#### 26. Frontera de permiso y contexto

La API base no incorpora:

```text
permissionCode
requiredPermissions
anyOfPermissions
roleCode
allowedRoles
canAccess
canExecute
canOperate
AuthorizationDecision
EffectiveContext
```

La superficie propietaria usa sus mecanismos canónicos y entrega únicamente una proyección presentacional ya minimizada.

---

#### 27. Frontera con Supabase

`PrimaryActionPanel` no depende directamente de Supabase.

No:

- crea clientes;
- consulta tablas;
- ejecuta RPC;
- maneja RLS;
- lee sesión;
- escribe estados;
- escucha realtime;
- interpreta errores de proveedor;
- persiste payloads.

La dirección permitida es:

```text
CAPA PROPIETARIA
→ ejecuta o consulta mediante su infraestructura
→ normaliza estado
→ vuelve a renderizar la proyección
→ PrimaryActionPanel
```

---

#### 28. Frontera con router

El panel no depende de pathname, query params, hash, history ni router.

Una acción principal de navegación puede componer un control que navegue, pero esa navegación pertenece al control o a la aplicación propietaria.

Abrir un destino no debe interpretarse automáticamente como aceptar, leer, claim, iniciar o resolver un caso.

---

#### 29. Jerarquía visual

El panel debe hacer inequívoco cuál es la acción principal sin depender únicamente de color.

La jerarquía puede usar de forma combinada:

- posición;
- tamaño;
- espacio;
- peso visual;
- variante del control;
- copy;
- agrupación;
- contexto explicativo.

No puede presentar una colección indiferenciada de botones con la misma prioridad perceptiva.

---

#### 30. `secondaryControl`

`secondaryControl` admite como máximo una acción secundaria convencional adyacente cuando la superficie propietaria determine que debe convivir visualmente con la principal.

Su presencia no cambia la identidad de la acción principal.

Debe mantenerse subordinada perceptivamente.

No se utiliza para duplicar la misma intención con otro label.

---

#### 31. Acciones secundarias restantes

El contrato de pantalla puede contener más acciones secundarias que las visibles dentro del panel.

UI013 no intenta absorber todo el registro secundario.

Las demás acciones pueden permanecer en:

- enlaces contextuales;
- menús;
- zonas de resultado;
- superficies especializadas;
- rutas de excepción;
- controles propios del contenido.

El panel evita convertirse en una toolbar universal.

---

#### 32. Prohibición de promoción autónoma

`PrimaryActionPanel` no cambia la jerarquía por:

- ancho de pantalla;
- rol;
- dispositivo;
- frecuencia de uso;
- orden de props;
- estado disabled;
- disponibilidad momentánea;
- telemetría;
- personalización local.

Una acción secundaria no se vuelve principal simplemente porque la principal esté bloqueada o no pueda ejecutarse.

---

#### 33. Estado de carga

Cuando la acción utiliza `Button`, el estado `loading` de la primitiva conserva la prevención de doble activación equivalente y la semántica accesible de ocupado.

El panel aporta únicamente el contexto general de `PENDING` cuando la superficie propietaria lo necesita.

No se deben mantener dos fuentes de estado divergentes entre el panel y el control.

La composición propietaria debe entregar una proyección coherente.

---

#### 34. Concurrencia y reintento

El panel no implementa control de concurrencia.

Ante una nueva activación, reintento o cambio de contexto, la capa propietaria conserva:

- revalidación;
- versión vigente;
- actor vigente;
- recurso vigente;
- idempotency key cuando aplique;
- correlación;
- payload material;
- resultado autoritativo.

Un cambio de estado visual no constituye lock empresarial.

---

#### 35. Resultado incierto

Si una operación material queda con resultado desconocido, el panel no vuelve automáticamente a `READY` para inducir repetición.

La capa propietaria debe reconciliar el resultado antes de permitir un nuevo intento cuando exista riesgo de duplicar:

- pagos;
- inventario;
- custodia;
- entregas;
- publicaciones;
- impresiones;
- integraciones externas;
- otros efectos irreversibles o costosos.

La presentación debe permanecer honesta respecto de lo que se conoce.

---

#### 36. Sensibilidad y destructividad

UI013 no crea una taxonomía paralela de sensibilidad.

Una acción sensible, destructiva, irreversible, financiera, privilegiada o de alto impacto conserva la clasificación de su propietario.

El panel puede presentar el control preparado correspondiente, pero no decide:

- si requiere confirmación;
- si requiere reautenticación;
- si requiere doble control;
- si requiere reason code;
- si requiere evidencia;
- si requiere segregación;
- si puede ejecutarse.

---

#### 37. Handoff a confirmaciones sensibles

Las confirmaciones de acciones sensibles permanecen bajo su tarea propietaria posterior.

UI013 fija únicamente esta frontera:

```text
PrimaryActionPanel
→ puede contener una acción que requiera confirmación
→ no implementa la política de confirmación
→ no inventa un diálogo genérico
→ no usa confirmación como permiso
→ no declara éxito al confirmar intención
```

La confirmación no se adelanta desde esta tarea.

---

#### 38. Relación con `ProcessStatusLine`

`ProcessStatusLine` y `PrimaryActionPanel` son piezas distintas.

```text
ProcessStatusLine = dónde está la instancia en su ciclo principal
PrimaryActionPanel = cuál es la acción principal ya resuelta para esta superficie
```

El panel no cambia estados de la línea.

La línea no escoge la acción del panel.

Ambos pueden coexistir dentro de una superficie propietaria.

---

#### 39. Relación con `TaskNavigation`

`TaskNavigation` presenta destinos de trabajo.

`PrimaryActionPanel` presenta la acción dominante dentro de una superficie ya abierta.

Nunca:

```text
seleccionar destino en TaskNavigation
=
ejecutar primary action
```

Una navegación puede llevar a una superficie con panel, pero no hereda autoridad de ejecución.

---

#### 40. Relación con AppShell

AppShell mantiene el marco compartido.

No se convierte en dueño global de la acción principal de cada página.

La composición apropiada conserva:

```text
AppShell
└─ superficie propietaria
   ├─ ProcessStatusLine, cuando aplique
   ├─ contenido de trabajo
   └─ PrimaryActionPanel
```

La ubicación exacta depende de la superficie, no de un slot global obligatorio del shell.

---

#### 41. Posicionamiento junto al contenido afectado

La acción principal debe permanecer próxima al contenido, objeto o decisión que modifica.

No se desplaza a una zona remota únicamente para uniformar layouts entre aplicaciones.

Cuando exista una barra persistente, la composición propietaria debe garantizar que no cubra:

- campos;
- errores;
- mensajes materiales;
- contenido requerido para comprender el efecto;
- controles de recuperación.

La persistencia visual no altera la semántica de la acción.

---

#### 42. Responsive y reflow

El panel debe conservar jerarquía y comprensión en cambios de ancho y zoom.

Puede:

- pasar de composición horizontal a vertical;
- apilar la secundaria bajo la principal;
- ajustar espacio y densidad;
- extender el control principal cuando el layout lo requiera.

No puede:

- invertir la jerarquía;
- promover la secundaria;
- ocultar una obligación bloqueada material;
- depender de scroll horizontal ordinario para acceder a la acción;
- perder el nombre accesible.

---

#### 43. Tablet

UI013 conserva reglas transversales aplicables a tablet, pero no define todavía el patrón físico completo para esa clase de dispositivo.

La composición futura deberá considerar:

- objetivo táctil;
- alcance de la mano;
- postura;
- teclado en pantalla;
- orientación;
- montaje;
- contenido visible antes de confirmar.

La especialización de tablet conserva su tarea propietaria posterior.

---

#### 44. Kiosco

El panel no asume que un kiosco tiene actor humano vigente, permiso amplio ni el mismo patrón de una pantalla personal.

La aplicación propietaria decide si existe una acción principal presentable bajo el contexto del dispositivo y del actor.

UI013 no concede capacidad a partir del perfil del terminal.

La especialización completa para kiosco conserva su tarea propietaria posterior.

---

#### 45. Teclado y foco

El panel no crea tab stops propios si su contenido no los requiere.

Los controles interactivos compuestos deben conservar:

- operación por teclado;
- foco visible;
- orden coherente;
- disabled real cuando corresponda;
- ausencia de trampas de foco.

El panel no roba foco cuando cambia de estado.

Una acción que entra en `PENDING` no debe forzar foco a un indicador puramente visual.

---

#### 46. Lectores de pantalla y anuncios

La región debe poder identificarse mediante `ariaLabel` cuando la composición requiera nombre explícito.

La lectura debe permitir comprender:

- propósito del área de acción;
- nombre de la acción principal;
- estado material de disponibilidad o espera;
- explicación de bloqueo cuando sea necesaria;
- acción secundaria adyacente cuando exista.

No se anuncian códigos técnicos como sustituto del label humano.

`PENDING` no exige por sí mismo un anuncio assertivo repetitivo en cada render.

La superficie propietaria decide cuándo un resultado material necesita live region u otra estrategia de anuncio.

---

#### 47. Localización y terminología

Son localizables:

```text
ariaLabel
label
description
statusLabel
```

Cambiar idioma no cambia `actionId`.

El panel no usa el texto traducido como clave de autorización, telemetría, transición o idempotencia.

La terminología debe conservar el vocabulario empresarial aprobado de cada acción.

---

#### 48. Telemetría

`PrimaryActionPanel` no necesita emitir por sí mismo eventos empresariales.

`actionId` permite instrumentación estable desde la capa propietaria.

La telemetría debe mantener diferenciados, cuando correspondan:

```text
presentación
foco
activación
submit
pending
confirmación de intención
resultado confirmado
denegación
error
reintento
```

El label no se usa como identidad analítica estable.

La telemetría nunca cambia automáticamente cuál acción es principal.

---

#### 49. Privacidad y minimización

La API base no requiere:

- documento personal;
- correo;
- teléfono;
- token;
- sesión;
- payload completo de autorización;
- detalle RLS;
- secrets;
- payload empresarial completo;
- evidencia completa;
- datos de terceros;
- reason codes restringidos.

La superficie propietaria entrega solo el contenido necesario para comprender y operar la acción.

---

#### 50. Evidencia de SHELL

SHELL conserva una primitiva local `Button` con:

- variante `primary`;
- variantes adicionales aprobadas por su reconciliación;
- estado `loading`;
- semántica nativa de botón.

Su home actual funciona como launcher de aplicaciones y no demuestra un `PrimaryActionPanel` transversal equivalente.

Decisión:

```text
COMPOSICIÓN_ELEGIBLE_SIN_EQUIVALENTE_RUNTIME_ACTUAL
```

No se fuerza el launcher actual a adoptar el panel por esta tarea.

---

#### 51. Evidencia de NEXO

NEXO conserva una copia local de la familia estándar `Button` con variante `primary`, tamaños compartidos históricamente y estilos propios del chrome local.

La existencia de esa primitiva demuestra necesidad de jerarquía de acción, pero no un panel transversal ya materializado.

Decisión:

```text
CANDIDATO_A_ADOPTAR
```

La adopción futura deberá mapear la acción principal aprobada de la superficie al panel sin trasladar reglas de NEXO al package.

---

#### 52. Evidencia de FOGO

FOGO conserva la misma familia local de `Button` estándar con variante `primary`.

Sus acciones empresariales de producción siguen perteneciendo a sus superficies y procesos.

Decisión:

```text
CANDIDATO_A_ADOPTAR
```

El panel podrá presentar esas acciones sin conocer recetas, lotes, cantidades, unidades ni reglas de producción.

---

#### 53. Evidencia de ORIGO

ORIGO conserva la familia local `Button` con variante `primary` y composición propia de sus superficies.

Decisión:

```text
CANDIDATO_A_ADOPTAR
```

La adopción no convierte acciones de inventario, abastecimiento, recepción o configuración en semántica del componente compartido.

---

#### 54. Evidencia de VISO

VISO conserva la familia local `Button` estándar con variante `primary`.

Sus acciones administrativas, de revisión, planificación, aprobación y auditoría mantienen contratos propios.

Decisión:

```text
CANDIDATO_A_ADOPTAR
```

El panel debe admitir jerarquía administrativa sin asumir que toda acción principal es una mutación operativa.

---

#### 55. Evidencia de PULSO

PULSO conserva la familia local `Button` estándar con variante `primary` dentro de una aplicación con efectos financieros y operativos propios.

Decisión:

```text
CANDIDATO_A_ADOPTAR
```

El panel no absorbe lógica POS, pagos, idempotencia ni confirmación de proveedor.

---

#### 56. Evidencia de NUMERA

NUMERA conserva la familia local `Button` estándar con variante `primary` dentro de superficies analíticas y administrativas.

Decisión:

```text
CANDIDATO_A_ADOPTAR
```

La acción principal puede ser consulta, revisión o decisión y no necesita convertirse en mutación para usar la misma jerarquía visual.

---

#### 57. Matriz materializada de consumidores

| Consumidor | Evidencia relevante                                               | Decisión UI013                                        | Implementación en esta tarea |
| ---------- | ----------------------------------------------------------------- | ----------------------------------------------------- | ---------------------------- |
| SHELL      | `Button` local propio; launcher sin panel transversal equivalente | `COMPOSICIÓN_ELEGIBLE_SIN_EQUIVALENTE_RUNTIME_ACTUAL` | 0                            |
| NEXO       | familia local `Button` con variante `primary`                     | `CANDIDATO_A_ADOPTAR`                                 | 0                            |
| FOGO       | familia local `Button` con variante `primary`                     | `CANDIDATO_A_ADOPTAR`                                 | 0                            |
| ORIGO      | familia local `Button` con variante `primary`                     | `CANDIDATO_A_ADOPTAR`                                 | 0                            |
| VISO       | familia local `Button` con variante `primary`                     | `CANDIDATO_A_ADOPTAR`                                 | 0                            |
| PULSO      | familia local `Button` con variante `primary`                     | `CANDIDATO_A_ADOPTAR`                                 | 0                            |
| NUMERA     | familia local `Button` con variante `primary`                     | `CANDIDATO_A_ADOPTAR`                                 | 0                            |

Control de cobertura:

```text
consumidores esperados: 7
consumidores evaluados: 7
faltantes: 0
duplicados: 0
adoptados físicamente: 0
certificados: 0
```

---

#### 58. Forma objetivo de adopción

La adopción futura seguirá esta forma:

```text
CONTRATO DE SUPERFICIE
        ↓
ACCIÓN PRINCIPAL CANÓNICA
        ↓
AUTORIZACIÓN + CONTEXTO + ESTADO
        ↓
ADAPTER / COMPOSICIÓN DEL CONSUMIDOR
        ↓
primaryControl + props presentacionales
        ↓
PrimaryActionPanel
```

No se migra copiando un handler local al package.

---

#### 59. Adapter local permitido

El consumidor puede conservar una capa pequeña para preparar la proyección.

Puede:

- resolver `actionId` desde su contrato de superficie;
- preparar label localizado;
- preparar description y statusLabel;
- traducir estado propietario a un estado presentacional válido;
- componer `primaryControl`;
- componer una secundaria adyacente cuando corresponda;
- conectar el control con la infraestructura empresarial propietaria.

No puede usar el adapter para:

- redefinir cuál acción es principal;
- fabricar autoridad;
- crear un catálogo alternativo de estados empresariales;
- convertir un permiso en acción;
- declarar éxito antes del resultado autoritativo;
- cambiar una secundaria a principal por condiciones visuales.

---

#### 60. Handoff a migración coordinada

La adopción física queda en el mini-bloque de migración coordinada.

| Tarea           | Responsabilidad para UI013                                                        |
| --------------- | --------------------------------------------------------------------------------- |
| `SHELL-MIG-001` | inventariar paneles, barras, CTAs, handlers y jerarquías locales por consumidor   |
| `SHELL-MIG-002` | ordenar adopción en lotes reversibles por repositorio                             |
| `SHELL-MIG-003` | establecer compatibilidad temporal y evitar nuevas variantes legacy equivalentes  |
| `SHELL-MIG-004` | evitar que el scaffold replique una composición antigua como estándar transversal |
| `SHELL-MIG-005` | adoptar componentes y composición compartida por aplicación                       |
| `SHELL-MIG-006` | validar accesibilidad, tema, densidad, responsive y movimiento                    |
| `SHELL-MIG-007` | demostrar paridad de acción, estado y comportamiento antes del retiro             |
| `SHELL-MIG-008` | retirar únicamente copias sin consumidores residuales                             |

UI013 no ejecuta ninguno de estos cambios.

---

#### 61. Handoff a calidad, compatibilidad y releases

La futura materialización debe entrar al gobierno de package compartido:

| Tarea          | Responsabilidad                          |
| -------------- | ---------------------------------------- |
| `SHELL-CI-001` | pruebas propias del package              |
| `SHELL-CI-002` | build independiente                      |
| `SHELL-CI-003` | release versionado                       |
| `SHELL-CI-004` | changelog                                |
| `SHELL-CI-005` | matriz de compatibilidad por consumidor  |
| `SHELL-CI-006` | actualización controlada de consumidores |

La aprobación documental de la API conceptual no equivale a release, instalación ni compatibilidad certificada.

---

#### 62. Contrato futuro de prueba

La materialización y adopción deberán demostrar, como mínimo:

1. render de una única acción principal;
2. identidad estable mediante `actionId`;
3. cambio de label sin cambio automático de identidad;
4. copy humano comprensible;
5. ausencia de labels genéricos impuestos por el panel;
6. `READY` no concede autorización;
7. `PENDING` no declara resultado;
8. `CONTEXTUAL_DISABLED` sigue siendo perceptible cuando es relevante;
9. `REQUIRED_BLOCKED` mantiene visible la obligación;
10. ausencia de variante renderizable `HIDDEN`;
11. contenido oculto fuera del DOM y tab order;
12. ausencia de `permissionCode` en la API base;
13. ausencia de roles para autorizar;
14. ausencia de `canExecute` o equivalentes;
15. ausencia de cliente Supabase;
16. ausencia de RPC en el panel;
17. ausencia de router obligatorio;
18. ausencia de motor de transiciones;
19. ausencia de catálogo de acciones dentro del componente;
20. ausencia de ordenamiento o selección autónoma de acciones;
21. una sola acción secundaria adyacente como máximo;
22. secundaria subordinada perceptivamente;
23. secundaria no promovida cuando la principal se bloquea;
24. composición compatible con `Button`;
25. `Button.loading` conserva nombre accesible;
26. activación repetida equivalente controlada durante pending cuando aplique;
27. resultado incierto no induce reintento automático;
28. resultado empresarial solo después de confirmación propietaria;
29. una navegación no se interpreta como resolución empresarial;
30. acción sensible no se define solo por variante visual;
31. confirmación sensible permanece fuera del panel;
32. `ProcessStatusLine` no es modificado por el panel;
33. `TaskNavigation` no se convierte en ejecutor;
34. AppShell no se convierte en propietario global de acciones;
35. panel próximo al contenido afectado;
36. responsive conserva jerarquía;
37. reflow no promueve secundaria;
38. zoom conserva control y contenido esencial;
39. teclado completo en controles compuestos;
40. foco visible;
41. ausencia de robo de foco;
42. lector identifica acción y estado material;
43. significado no depende solo de color;
44. localización sin cambiar `actionId`;
45. telemetría usa identidad estable y no label como clave;
46. datos sensibles ausentes de la API base;
47. adopción NEXO con paridad antes de retirar composición equivalente;
48. adopción FOGO sin trasladar lógica de producción;
49. adopción ORIGO sin trasladar lógica de inventario o configuración;
50. adopción VISO sin trasladar workflow administrativo;
51. adopción PULSO sin trasladar lógica financiera;
52. adopción NUMERA sin trasladar lógica analítica;
53. SHELL solo adopta donde exista una acción principal legítima;
54. rollback por consumidor;
55. compatibilidad del package antes de ampliar adopción.

Esta lista define evidencia futura y no declara ejecución física en UI013.

---

#### 63. Cobertura de requisitos vigente

UI013 no necesita crear una obligación transversal nueva porque el registro canónico vigente ya cubre:

- acción principal visible y distinguible en superficies operativas: `TREQ-UX-001`;
- errores, bloqueos y recuperación en lenguaje humano: `TREQ-UX-002`;
- relevancia, autorización y densidad adecuadas: `TREQ-UX-003`;
- comportamiento táctil y validación física: `TREQ-UX-004`;
- verdad confirmada frente a estado pendiente: `TREQ-UX-005`;
- contingencia y estados pendientes ante fallos de conectividad: `TREQ-UX-006`;
- separación entre autorización, relevancia, visibilidad, habilitación y posibilidad de actuar: `TREQ-UX-059`;
- estados de presentación y tratamiento de obligaciones bloqueadas: `TREQ-UX-062`;
- acción siguiente como contenido esencial de la superficie operativa: `TREQ-UX-063`;
- jerarquía explícita de divulgación y acción necesaria: `TREQ-UX-182`;
- permanencia visible de acción principal, estado y consecuencias materiales: `TREQ-UX-183`;
- proximidad, estabilidad y alcance táctil de la acción principal: `TREQ-UX-207`;
- exactamente una acción principal por pantalla: `TREQ-UX-887`;
- identidad determinista de la acción principal: `TREQ-UX-888`;
- label con verbo y objeto empresarial: `TREQ-UX-889`;
- familia y efecto gobernados: `TREQ-UX-890`;
- frontera de confirmación en servidor: `TREQ-UX-891`;
- navegación separada de resolución del caso: `TREQ-UX-892`;
- captura separada de corrección, aprobación y reversión: `TREQ-UX-893`;
- auditoría sin mutar el hecho investigado: `TREQ-UX-894`;
- supervisión sin ejecutar silenciosamente trabajo ajeno: `TREQ-UX-895`;
- configuración separada de operación de instancias: `TREQ-UX-896`;
- propiedad y sujeto resueltos autoritativamente: `TREQ-UX-897`, `TREQ-UX-898`;
- identificación separada de autorización y transacción: `TREQ-UX-899`;
- bandejas sin resolución automática: `TREQ-UX-900`;
- preparación, recomendación, aprobación y publicación separadas: `TREQ-UX-901`;
- confirmación financiera e idempotencia: `TREQ-UX-902`;
- efectos externos reconciliados antes de declarar éxito: `TREQ-UX-913`;
- gobierno de cambios de acción principal: `TREQ-UX-914`;
- validación humana de visibilidad y jerarquía: `TREQ-UX-916`;
- convivencia gobernada con acciones secundarias: `TREQ-UX-917`, `TREQ-UX-919`, `TREQ-UX-920`;
- borrador separado de aprobación, publicación o ejecución: `TREQ-UX-924`;
- reintento después de reconciliar resultado canónico: `TREQ-UX-931`;
- dispositivo o rol sin promoción arbitraria de secundarias: `TREQ-UX-936`;
- preservación de acción principal durante cambios secundarios: `TREQ-UX-945`, `TREQ-UX-946`;
- preservación contractual de acciones principales y secundarias: `TREQ-UX-1233`, `TREQ-UX-1234`;
- confirmación sin ampliación de permiso: `TREQ-UX-1235`;
- revalidación de alcance, recurso, estado y transición: `TREQ-UX-1239`;
- registro canónico transversal de acciones principales: `TREQ-UX-1819` a `TREQ-UX-1831`;
- responsabilidad compartida clasificada y adopción segura: `TREQ-SHELL-002`, `TREQ-SHELL-006`, `TREQ-SHELL-007`;
- template histórico separado de runtime compartido: `TREQ-SHELL-029`, `TREQ-SHELL-030`;
- versionado, compatibilidad, deprecación y retiro de superficies compartidas: `TREQ-SHELL-036` a `TREQ-SHELL-039`.

UI013 especializa esas obligaciones en una superficie visual común sin cambiar el significado de ninguna obligación vigente.

---

#### 64. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos descartados:** 0

La cobertura vigente ya exige identidad única de acción principal, jerarquía, copy humano, separación de secundarias, autorización independiente, confirmación autoritativa, idempotencia, accesibilidad, adaptación física, migración y compatibilidad. UI013 únicamente fija la composición presentacional compartida de una acción ya resuelta.

---

#### 65. Límites y fuera de alcance

Quedan fuera de UI013:

- materializar `@vento/ui-web`;
- crear archivos TypeScript del package;
- publicar exports;
- modificar consumidores;
- crear el registro de acciones principales;
- cambiar acciones principales aprobadas;
- cambiar acciones secundarias aprobadas;
- resolver permisos;
- resolver contexto autoritativo;
- implementar Server Actions;
- implementar endpoints;
- implementar RPC;
- implementar queries;
- implementar mutaciones;
- implementar máquina de estados;
- implementar transiciones;
- implementar idempotencia empresarial;
- implementar reconciliación de proveedor;
- implementar confirmaciones sensibles;
- implementar offline o sincronización;
- cambiar Supabase;
- crear SQL o migraciones;
- implementar telemetría empresarial;
- publicar releases;
- desplegar;
- retirar código legacy.

---

#### 66. Evidencia de validación y criterios de aceptación documental

| Clase     | Estado         | Evidencia                                                                                                                      |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED   | UI013 es una tarea documental y no materializa código ejecutable, package ni build.                                            |
| LOCAL     | NOT_APPLICABLE | No existe una implementación física de `@vento/ui-web` que certificar localmente dentro de este corte documental.              |
| REMOTA    | PASS           | La secuencia activa parte de UI012 y el archivo propietario reserva de forma coincidente UI013 como panel de acción principal. |
| OPERATIVA | NOT_APPLICABLE | La tarea define presentación y composición sin ejecutar efectos empresariales ni flujo operativo.                              |
| FÍSICA    | NOT_APPLICABLE | Los cambios físicos autorizados son ninguno; no se modifica package, consumidor, base de datos ni despliegue.                  |

Criterios de aceptación documental:

- [x] existe una identidad única `PrimaryActionPanel`;
- [x] pertenece conceptualmente a `@vento/ui-web`;
- [x] se define como superficie de presentación y composición;
- [x] no selecciona la acción principal;
- [x] la acción principal llega resuelta desde su propietario;
- [x] existe `actionId` estable;
- [x] existe label humano localizable;
- [x] description es opcional y no oculta información material;
- [x] se definen `READY`, `PENDING`, `CONTEXTUAL_DISABLED` y `REQUIRED_BLOCKED`;
- [x] `HIDDEN` queda fuera de la API renderizable;
- [x] existe exactamente un `primaryControl`;
- [x] se conserva composición con `Button`;
- [x] no se redefine `Button.loading`;
- [x] no se confunde primary con autorización;
- [x] no se confunde primary con transición;
- [x] no se confunde activación con resultado;
- [x] se conserva revalidación server-side;
- [x] permisos y roles quedan fuera de la API base;
- [x] Supabase queda fuera del componente;
- [x] router queda fuera del componente base;
- [x] la jerarquía no depende solo de color;
- [x] existe como máximo una secundaria adyacente en el panel;
- [x] las demás secundarias permanecen fuera de la primitiva;
- [x] no existe promoción autónoma de secundaria;
- [x] se trata pending sin declarar éxito;
- [x] se conserva control propietario de concurrencia;
- [x] resultado incierto no induce retry automático;
- [x] sensibilidad no se infiere de variante visual;
- [x] confirmaciones sensibles conservan propietario posterior;
- [x] se separa de `ProcessStatusLine`;
- [x] se separa de `TaskNavigation`;
- [x] AppShell no se convierte en dueño global de acción;
- [x] se exige proximidad al contenido afectado;
- [x] responsive conserva jerarquía;
- [x] tablet conserva especialización posterior;
- [x] kiosco conserva especialización posterior;
- [x] se cubren teclado y foco;
- [x] se cubren lectores de pantalla;
- [x] se cubre localización;
- [x] se conserva identidad estable para telemetría;
- [x] se minimizan datos;
- [x] se reconcilia SHELL;
- [x] se reconcilia NEXO;
- [x] se reconcilia FOGO;
- [x] se reconcilia ORIGO;
- [x] se reconcilia VISO;
- [x] se reconcilia PULSO;
- [x] se reconcilia NUMERA;
- [x] la matriz cubre siete de siete consumidores;
- [x] faltantes y duplicados son cero;
- [x] se define handoff de migración;
- [x] se define handoff de calidad y releases;
- [x] se define evidencia futura de prueba;
- [x] la cobertura vigente evita crear requisitos duplicados;
- [x] requisitos creados y modificados son cero;
- [x] no se ejecuta implementación física;
- [x] la siguiente tarea queda únicamente reservada.

---

#### 67. Decisiones consolidadas

Quedan fijadas las siguientes decisiones vinculantes:

1. La superficie conceptual se denomina `PrimaryActionPanel`.
2. Pertenece conceptualmente a `@vento/ui-web`.
3. Presenta una acción principal ya resuelta.
4. No selecciona entre acciones candidatas.
5. La API base incluye `ariaLabel`.
6. La API base incluye `actionId`.
7. La API base incluye `label`.
8. `description` es opcional.
9. `statusLabel` es opcional.
10. Los estados base son `READY`, `PENDING`, `CONTEXTUAL_DISABLED` y `REQUIRED_BLOCKED`.
11. `HIDDEN` no es renderizable.
12. Una acción oculta se filtra upstream.
13. `READY` no concede autoridad.
14. `PENDING` no declara resultado.
15. `CONTEXTUAL_DISABLED` representa relevancia sin accionabilidad contextual actual.
16. `REQUIRED_BLOCKED` mantiene visible una obligación material bloqueada.
17. Existe exactamente un `primaryControl`.
18. El control lo compone la superficie propietaria.
19. `Button` es la primitiva ordinaria reutilizable cuando corresponde.
20. UI013 no redefine variantes de `Button`.
21. UI013 no redefine loading de `Button`.
22. La acción principal es única por superficie resuelta.
23. Dos CTAs igualmente dominantes no son una solución admitida por el panel.
24. `actionId` no es permiso.
25. `actionId` no es endpoint.
26. `actionId` no es transición.
27. `label` no es identidad estable.
28. El panel no recibe permisos.
29. El panel no recibe roles para autorizar.
30. El panel no recibe `canExecute`.
31. El panel no consulta Supabase.
32. El panel no ejecuta RPC.
33. El panel no escribe estados empresariales.
34. El panel no necesita router.
35. Navegar no equivale a resolver.
36. Activar no equivale a completar.
37. Confirmar intención no equivale a confirmar resultado.
38. El servidor conserva la frontera autoritativa.
39. La superficie propietaria conserva guards y precondiciones.
40. El panel puede contener una secundaria adyacente como máximo.
41. La secundaria permanece visualmente subordinada.
42. Las demás secundarias conservan sus superficies propietarias.
43. Una secundaria no se promueve por viewport.
44. Una secundaria no se promueve por rol.
45. Una secundaria no se promueve porque la principal esté bloqueada.
46. La variante `danger` no define por sí sola sensibilidad empresarial.
47. Las confirmaciones sensibles conservan propietario separado.
48. `ProcessStatusLine` conserva posición de ciclo y no acción.
49. `TaskNavigation` conserva destinos y no ejecución.
50. AppShell conserva marco y no acción global.
51. El panel se ubica próximo al contenido afectado.
52. Responsive puede reordenar layout físico sin cambiar jerarquía semántica.
53. Tablet conserva especialización física posterior.
54. Kiosco conserva especialización física posterior.
55. Los controles conservan teclado y foco accesibles.
56. El panel no roba foco.
57. El significado no depende únicamente de color.
58. El copy es localizable sin cambiar `actionId`.
59. Telemetría puede usar `actionId` como identidad estable.
60. La API base minimiza datos sensibles.
61. NEXO queda `CANDIDATO_A_ADOPTAR`.
62. FOGO queda `CANDIDATO_A_ADOPTAR`.
63. ORIGO queda `CANDIDATO_A_ADOPTAR`.
64. VISO queda `CANDIDATO_A_ADOPTAR`.
65. PULSO queda `CANDIDATO_A_ADOPTAR`.
66. NUMERA queda `CANDIDATO_A_ADOPTAR`.
67. SHELL queda `COMPOSICIÓN_ELEGIBLE_SIN_EQUIVALENTE_RUNTIME_ACTUAL`.
68. La matriz cubre siete de siete consumidores, sin faltantes ni duplicados.
69. La adopción será progresiva, reversible y con paridad demostrada.
70. UI013 crea cero requisitos de prueba y modifica cero.

---

#### 68. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-UI-012 — Compartir línea de estados de proceso`

**TAREA ACTUAL APROBADA**
`SHELL-UI-013 — Compartir panel de acción principal`

**SIGUIENTE TAREA RESERVADA**
`SHELL-UI-014 — Compartir confirmaciones de acciones sensibles`


### [ ] SHELL-UI-014 — Compartir confirmaciones de acciones sensibles
### [ ] SHELL-UI-015 — Compartir diagnóstico de contexto
### [ ] SHELL-UI-016 — Compartir estados de error recuperable
### [ ] SHELL-UI-017 — Compartir patrón para tablet
### [ ] SHELL-UI-018 — Compartir patrón para kiosco
### [ ] SHELL-UI-019 — Compartir patrón de proceso interrumpido
### [ ] SHELL-UI-020 — Compartir patrón de traspaso entre aplicaciones
