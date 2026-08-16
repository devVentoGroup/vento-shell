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

### [ ] SHELL-UI-008 — Compartir selector de área
### [ ] SHELL-UI-009 — Compartir aviso de rol simulado
### [ ] SHELL-UI-010 — Evaluar AppShell compartido

### [ ] SHELL-UI-011 — Compartir navegación orientada a tareas
### [ ] SHELL-UI-012 — Compartir línea de estados de proceso
### [ ] SHELL-UI-013 — Compartir panel de acción principal
### [ ] SHELL-UI-014 — Compartir confirmaciones de acciones sensibles
### [ ] SHELL-UI-015 — Compartir diagnóstico de contexto
### [ ] SHELL-UI-016 — Compartir estados de error recuperable
### [ ] SHELL-UI-017 — Compartir patrón para tablet
### [ ] SHELL-UI-018 — Compartir patrón para kiosco
### [ ] SHELL-UI-019 — Compartir patrón de proceso interrumpido
### [ ] SHELL-UI-020 — Compartir patrón de traspaso entre aplicaciones
