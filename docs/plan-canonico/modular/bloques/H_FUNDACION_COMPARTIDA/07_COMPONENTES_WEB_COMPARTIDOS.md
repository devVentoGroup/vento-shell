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
