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


### [ ] SHELL-UI-002 — Compartir Alert
### [ ] SHELL-UI-003 — Compartir Button
### [ ] SHELL-UI-004 — Compartir Card
### [ ] SHELL-UI-005 — Compartir EmptyState
### [ ] SHELL-UI-006 — Compartir indicador de contexto
### [ ] SHELL-UI-007 — Compartir selector de sede
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
