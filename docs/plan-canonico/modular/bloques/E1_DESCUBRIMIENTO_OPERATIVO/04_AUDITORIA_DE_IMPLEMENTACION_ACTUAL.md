### AUDITORÍA DE IMPLEMENTACIÓN ACTUAL

### ✅ CODE-AUD-001 — Inventariar todos los repositorios y superficies desplegadas

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** inventario técnico transversal de repositorios y superficies publicadas
**Dependencia anterior:** `CAP-MAP-015`
**Continuidad reservada:** `CODE-AUD-002`
**Fecha de corte:** 2026-07-23
**Cambios en código o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea establece el inventario inicial verificable de repositorios locales,
repositorios remotos, aplicaciones web, aplicaciones móviles, superficies web
auxiliares, Vercel, Expo/EAS y la infraestructura compartida de Supabase.

El inventario distingue **repositorio**, **aplicación**, **superficie auxiliar**,
**configuración**, **build terminado**, **publicación en tienda** y **despliegue
operativo**. Ninguno de esos estados sustituye a otro.

---

#### 2. Correcciones de interpretación obligatorias

1. **ANIMA es una aplicación móvil Expo.** Sus superficies auxiliares de
   invitación, autenticación y carné no constituyen una aplicación web ANIMA.
2. **PASS es una aplicación móvil Expo.** Su superficie auxiliar de enlaces,
   documentos legales, retorno de pagos y Wallet no constituye una aplicación
   web PASS.
3. **AURA no tiene repositorio, aplicación, dominio operativo ni despliegue.**
   Es una idea diferida para una planeación futura y no seguirá tratándose como
   superficie actual durante esta auditoría.
4. **TALENTO tiene base técnica local**, pero no está desplegado ni adoptado.
5. **VITAL es un proyecto personal separado** y no forma parte de la cobertura
   operativa actual de Vento OS.
6. Un dominio escrito en código no prueba que exista; una respuesta HTTP o un
   despliegue exitoso tampoco prueba adopción por trabajadores.

---

#### 3. Fuentes revisadas

| Fuente                                  | Evidencia obtenida                                    |
| --------------------------------------- | ----------------------------------------------------- |
| workspace `C:\Users\User\devVentoGroup` | directorios, Git, paquetes y configuración local      |
| GitHub `devVentoGroup`                  | existencia, rama principal, visibilidad y despliegues |
| `package.json`, Expo y EAS              | tecnología y forma de distribución                    |
| GitHub/Vercel                           | superficies publicadas y ambientes                    |
| comprobación HTTP                       | respuesta actual de dominios canónicos                |
| Expo/EAS                                | proyectos y builds móviles                            |
| Google Play y App Store                 | publicaciones móviles localizables                    |
| Supabase VENTO                          | proyecto activo y Edge Functions desplegadas          |
| `TEC-01` a `TEC-19`                     | decisiones técnicas ya comprobadas                    |

No se modificó código, despliegues, DNS, bases de datos, funciones ni
configuración externa.

---

#### 4. Inventario maestro de repositorios

| Repositorio local | GitHub                        | Visibilidad | Tipo principal      | Estado de superficie        |
| ----------------- | ----------------------------- | ----------- | ------------------- | --------------------------- |
| `vento-shell`     | `devVentoGroup/vento-shell`   | pública     | Next.js             | web de producción           |
| `vento-viso`      | `devVentoGroup/vento-viso`    | pública     | Next.js             | web de producción           |
| `vento-nexo`      | `devVentoGroup/vento-nexo`    | pública     | Next.js             | web de producción           |
| `vento-fogo`      | `devVentoGroup/vento-fogo`    | pública     | Next.js             | web de producción           |
| `vento-origo`     | `devVentoGroup/vento-origo`   | pública     | Next.js             | web de producción           |
| `vento-pulso`     | `devVentoGroup/vento-pulso`   | pública     | Next.js             | web de producción           |
| `vento-numera`    | `devVentoGroup/vento-numera`  | pública     | Next.js             | web de producción           |
| `vento-group-web` | `devVentoGroup/Vento-Group`   | pública     | Next.js             | web pública de producción   |
| `vento-anima`     | `devVentoGroup/vento-anima`   | pública     | Expo móvil          | tiendas + web auxiliar      |
| `vento-pass`      | `devVentoGroup/vento-pass`    | privada     | Expo móvil          | tiendas + web auxiliar      |
| `vento-talento`   | `devVentoGroup/vento-talento` | privada     | Expo móvil          | base técnica sin despliegue |
| `vento-vital`     | `devVentoGroup/vento-vital`   | pública     | monorepo API + Expo | build interno separado      |

Resultado:

- **12** repositorios locales y **12** remotos correspondientes;
- **10** repositorios públicos y **2** privados;
- rama remota principal `main` en los doce;
- `vento-nexo` estaba abierto localmente en
  `feat/inventory-count-workbook` durante el corte.

La conveniencia de la visibilidad pública se evaluará en `CODE-AUD-017`; esta
tarea solo registra el hecho.

---

#### 5. Aplicaciones web de producción

| Aplicación  | Repositorio       | Dominio canónico               | Evidencia actual                                |
| ----------- | ----------------- | ------------------------------ | ----------------------------------------------- |
| SHELL       | `vento-shell`     | `https://os.ventogroup.co`     | Vercel producción; `307` hacia inicio de sesión |
| VISO        | `vento-viso`      | `https://viso.ventogroup.co`   | Vercel producción; `307` hacia inicio de sesión |
| NEXO        | `vento-nexo`      | `https://nexo.ventogroup.co`   | Vercel producción; `307` hacia inicio de sesión |
| FOGO        | `vento-fogo`      | `https://fogo.ventogroup.co`   | Vercel producción; `307` hacia inicio de sesión |
| ORIGO       | `vento-origo`     | `https://origo.ventogroup.co`  | Vercel producción; `307` hacia inicio de sesión |
| PULSO       | `vento-pulso`     | `https://pulso.ventogroup.co`  | Vercel producción; respuesta `200`              |
| NUMERA      | `vento-numera`    | `https://numera.ventogroup.co` | Vercel producción; `307` hacia inicio de sesión |
| web pública | `vento-group-web` | `https://www.ventogroup.co`    | Vercel producción; respuesta `200`              |

`https://ventogroup.co` redirige hacia `https://www.ventogroup.co`. Los
despliegues de vista previa no se cuentan como aplicaciones adicionales.

---

#### 6. Aplicaciones móviles actuales

##### 6.1. ANIMA

| Campo                          | Evidencia                                                            |
| ------------------------------ | -------------------------------------------------------------------- |
| producto                       | aplicación móvil para trabajadores                                   |
| tecnología                     | Expo / React Native                                                  |
| proyecto EAS                   | `@vento-group-sas/anima`                                             |
| ID EAS                         | `2e1ba93a-039d-49e7-962d-a33ea7eaf9b3`                               |
| identificadores iOS y Android  | `com.vento.anima`                                                    |
| builds comprobados             | producción `STORE` terminada para iOS y Android                      |
| publicación pública comprobada | Google Play                                                          |
| App Store                      | build de producción comprobado; ficha no localizada en esta revisión |

La aplicación publicada en Google Play aparece como **Anima | Vento Group**.

##### 6.2. PASS

| Campo                          | Evidencia                                       |
| ------------------------------ | ----------------------------------------------- |
| producto                       | aplicación móvil de cliente y fidelización      |
| tecnología                     | Expo / React Native                             |
| proyecto EAS                   | `@vento-group-sas/vento-pass`                   |
| ID EAS                         | `d790b644-2ec4-45b0-8f3b-4bb778575496`          |
| identificador iOS              | `co.ventogroup.pass`                            |
| identificador Android          | `com.ventogroup.ventopass`                      |
| builds comprobados             | producción `STORE` terminada para iOS y Android |
| publicación pública comprobada | Google Play y App Store                         |

PASS y ANIMA son las dos aplicaciones móviles operativas comprobadas. Un build
EAS terminado y una ficha de tienda se conservan como evidencias diferentes.

---

#### 7. Superficies web auxiliares de aplicaciones móviles

| Repositorio   | Superficie auxiliar                | Uso                                      | Clasificación               |
| ------------- | ---------------------------------- | ---------------------------------------- | --------------------------- |
| `vento-anima` | autenticación e invitación         | solicitar enlace y establecer contraseña | auxiliar, no aplicación web |
| `vento-anima` | Wallet/carné laboral               | generación y entrega del pase            | auxiliar, no aplicación web |
| `vento-pass`  | enlaces universales                | abrir la aplicación desde enlaces        | auxiliar, no aplicación web |
| `vento-pass`  | privacidad, términos y eliminación | obligaciones y autoservicio              | auxiliar, no aplicación web |
| `vento-pass`  | retorno de pago y Wallet           | completar flujos iniciados en móvil      | auxiliar, no aplicación web |

GitHub registra despliegues Vercel exitosos para estas superficies. Las raíces
`https://anima.ventogroup.co` y `https://pass.ventogroup.co` responden `404`; no
se interpreta como caída de una aplicación web porque ese producto no existe.
`CODE-AUD-002` inventariará las rutas auxiliares concretas.

---

#### 8. Proyectos sin superficie productiva actual

##### 8.1. TALENTO

- existe el repositorio `vento-talento`;
- contiene una base Expo móvil;
- no contiene ID EAS vinculado;
- GitHub no registra despliegues;
- no existe publicación en tienda comprobada;
- permanece como proyecto futuro anterior a ANIMA.

##### 8.2. VITAL

- existe como monorepo separado con `apps/api`, `apps/mobile` y contratos;
- posee el proyecto EAS `@vento-group-sas/vento-vital`;
- se comprobó un build iOS interno de desarrollo;
- no se comprobó build de producción, tienda ni despliegue GitHub;
- permanece fuera de la línea operativa de Vento OS.

##### 8.3. AURA

AURA no se incorpora como repositorio ni superficie:

- no existe repositorio ni aplicación;
- no existe proyecto Expo/EAS;
- no existe despliegue GitHub/Vercel;
- `aura.ventogroup.co` no resuelve;
- su diseño queda diferido a una planeación futura.

Esta ausencia ya estaba decidida y no genera una pregunta nueva.

---

#### 9. Infraestructura remota compartida

Supabase se conserva como infraestructura y no como aplicación empresarial.

| Campo                               | Estado comprobado      |
| ----------------------------------- | ---------------------- |
| proyecto VENTO                      | `vento-os-dev`         |
| referencia                          | `clzdpinthhtknkmefsxx` |
| región                              | `us-east-2`            |
| estado                              | `ACTIVE_HEALTHY`       |
| motor                               | PostgreSQL 17          |
| Edge Functions activas              | **24**                 |
| repositorio canónico de migraciones | `vento-shell`          |

Las Edge Functions activas se agrupan así:

- trabajo y administración: `wallet-pass`, `attendance-report`,
  `staff-invitations-create`, `staff-invitations-accept`,
  `staff-invitations-resend`, `staff-invitations-cancel`, `document-alerts`,
  `register-push-token`, `announcement-notify`, `employee-delete`,
  `shift-publish-notify` y `shift-runtime-processor`;
- PASS, pagos y entrega: `request-account-deletion`, `account-deletion`,
  `process-account-deletions`, `payments-create-intent`, `payments-webhook`,
  `payments-return`, `pass-delivery-quote`, `pass-address-search`,
  `pass-register-push-token`, `support-message-notify`,
  `order-message-notify` y `delivery-portal`.

Doce exigen JWT en la configuración de plataforma y doce no. Esto no concluye
por sí solo que exista una vulnerabilidad: `CODE-AUD-005` inventariará contratos
y `CODE-AUD-017` comprobará la autorización efectiva.

El proyecto `petapetit` aparece en la misma cuenta, pero queda fuera del
inventario VENTO y no fue inspeccionado.

---

#### 10. Automatizaciones visibles

Se encontraron workflows de GitHub Actions en:

| Repositorio   | Superficie visible                                |
| ------------- | ------------------------------------------------- |
| `vento-nexo`  | aplicación temporal de solicitud privilegiada     |
| `vento-pass`  | facturación electrónica y eliminación de cuentas  |
| `vento-pulso` | aplicación de interfaz de facturación electrónica |
| `vento-viso`  | aplicación guiada de formulario de producto       |

Su existencia no prueba ejecución correcta ni vigencia. Jobs, funciones,
disparadores y credenciales se auditarán en `CODE-AUD-005`.

---

#### 11. Hallazgos que continúan a tareas existentes

| ID               | Hallazgo                                                                  | Destino                        |
| ---------------- | ------------------------------------------------------------------------- | ------------------------------ |
| `H-CODE-001-001` | diez repositorios son públicos y dos privados                             | `CODE-AUD-017`                 |
| `H-CODE-001-002` | ANIMA y PASS mezclan móvil y web auxiliar en el mismo repositorio         | `CODE-AUD-002`, `CODE-AUD-005` |
| `H-CODE-001-003` | ANIMA tiene build iOS de producción, pero no se localizó su ficha pública | comprobación técnica posterior |
| `H-CODE-001-004` | TALENTO tiene código sin proyecto EAS ni despliegue                       | `CAP-TAL-001..006`             |
| `H-CODE-001-005` | VITAL solo presenta build interno y está fuera de Vento OS                | conservar separado             |
| `H-CODE-001-006` | doce Edge Functions no exigen JWT en plataforma                           | `CODE-AUD-005`, `CODE-AUD-017` |
| `H-CODE-001-007` | NEXO está abierto en una rama distinta de `main`                          | conservar procedencia          |
| `H-CODE-001-008` | AURA no tiene ninguna superficie actual                                   | planeación futura              |

Todos los destinos ya existen. Esta tarea no añade preguntas ni tareas
redundantes.

---

#### 12. Qué no puede concluirse todavía

Este inventario no demuestra:

- qué rutas y pantallas están completas;
- qué acciones funcionan de extremo a extremo;
- qué código consume cada tabla o función;
- qué despliegue coincide exactamente con el checkout local;
- qué usuarios utilizan cada superficie;
- qué flujos toleran errores, concurrencia o trabajo sin conexión;
- qué repositorios públicos deberían cambiar de visibilidad;
- que una función sin JWT de plataforma carezca de autenticación propia.

Esas conclusiones pertenecen a `CODE-AUD-002` a `CODE-AUD-019`.

---

#### 13. Decisiones propuestas

1. El universo técnico VENTO parte de doce repositorios.
2. Ocho repositorios producen aplicaciones web de producción.
3. ANIMA y PASS son aplicaciones móviles Expo, no aplicaciones web.
4. Sus superficies web se clasifican únicamente como auxiliares.
5. TALENTO conserva base técnica sin considerarse desplegado.
6. VITAL se registra separado y no se incorpora a Vento OS.
7. AURA no se seguirá auditando como superficie actual.
8. Supabase se registra como infraestructura compartida gobernada desde
   `vento-shell`.
9. Vista previa, build, tienda y producción conservarán estados diferentes.
10. Los ocho hallazgos continuarán en tareas ya existentes.
11. No se crean preguntas nuevas para hechos técnicamente comprobables.
12. `CODE-AUD-002` será la única continuidad inmediata.

---

#### 14. Criterios de aceptación

`CODE-AUD-001` podrá aprobarse cuando:

- estén enumerados los repositorios locales y remotos;
- repositorio, aplicación y superficie auxiliar no se confundan;
- web, móvil, API e infraestructura queden diferenciadas;
- ANIMA y PASS permanezcan clasificados como móviles;
- TALENTO no se declare desplegado;
- AURA quede reconocida como inexistente y diferida;
- VITAL permanezca separado;
- dominios declarados y dominios que responden se distingan;
- builds y publicaciones en tienda se documenten por separado;
- Supabase se inventarie sin modificarlo;
- los hallazgos tengan destino;
- no se creen preguntas repetidas;
- `CODE-AUD-002` permanezca como única continuidad.

---

#### 15. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
repositorio
        ↓
producto o componente auxiliar
        ↓
tecnología y ambiente
        ↓
despliegue o ausencia comprobada
        ↓
rutas, pantallas y formularios por inventariar
```

La continuidad será:

```text
CODE-AUD-002
— Inventariar rutas, layouts, pantallas, componentes y formularios
```


### ✅ CODE-AUD-002 — Inventariar rutas, layouts, pantallas, componentes y formularios

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** inventario estático transversal de superficies de interfaz
**Dependencia anterior:** `CODE-AUD-001`
**Continuidad reservada:** `CODE-AUD-003`
**Fecha de corte:** 2026-07-23
**Cambios en código o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea inventaría la estructura visible del código antes de evaluar si cada
acción funciona:

| Elemento                                                | Cantidad comprobada |
| ------------------------------------------------------- | ------------------: |
| rutas web Next.js con `page.*`                          |             **168** |
| layouts Next.js activos                                 |               **9** |
| pantallas ANIMA por Expo Router                         |              **14** |
| layouts ANIMA                                           |               **3** |
| pantallas TALENTO por Expo Router                       |              **12** |
| layouts TALENTO                                         |               **3** |
| pantallas registradas en el Stack de PASS               |              **15** |
| estados previos de PASS: autenticación y perfil         |               **2** |
| pantallas de VITAL separado                             |               **5** |
| módulos en directorios de componentes activos           |             **290** |
| plantilla de componentes de SHELL, no aplicación activa |               **6** |
| módulos candidatos a captura de datos                   |             **256** |

Los 256 candidatos se detectaron por estructuras como `form`, `input`,
`select`, `textarea`, `TextInput`, `useForm` o `FormField`. No equivalen a 256
formularios terminados: indican dónde debe revisarse captura, validación,
persistencia y respuesta durante `CODE-AUD-003` y `CODE-AUD-004`.

---

#### 2. Definiciones usadas

| Término              | Significado en este inventario                                                  |
| -------------------- | ------------------------------------------------------------------------------- |
| ruta web             | directorio que contiene un `page.*` activo de Next.js                           |
| pantalla móvil       | destino de Expo Router o pantalla registrada en navegación                      |
| layout               | envoltura compartida que controla navegación, contexto o presentación           |
| componente           | módulo reutilizable ubicado bajo un directorio `component` o `components`       |
| formulario           | estructura que reúne datos para ejecutar una acción                             |
| candidato de captura | archivo con controles o librerías de captura todavía sin validar funcionalmente |
| superficie auxiliar  | página o endpoint web que apoya una aplicación móvil                            |
| estado especial      | carga, error, acceso denegado, autenticación o ausencia                         |

Una ruta no prueba que la pantalla sea completa. Un archivo llamado `Screen`,
`Form` o `V2` tampoco prueba que esté conectado a la navegación actual.

---

#### 3. Reglas y exclusiones

El conteo:

- excluye `node_modules`, `.next`, `.git`, `.expo`, `dist`, builds, cobertura,
  documentación y cachés;
- separa la plantilla `templates/app-shell-standard` del SHELL activo;
- conserva rutas dinámicas como `[id]`, `[slug]` y `[code]`;
- elimina grupos de organización como `(app)` o `(auth)` de la URL visible;
- no cuenta API routes como pantallas;
- no convierte archivos HTML auxiliares en aplicaciones web;
- no incorpora AURA porque no existe código que inventariar;
- registra VITAL aparte, sin incorporarlo a Vento OS.

---

#### 4. Matriz por repositorio

| Repositorio       |      Rutas o pantallas | Layouts o navegación | Componentes activos | Candidatos de captura |
| ----------------- | ---------------------: | -------------------: | ------------------: | --------------------: |
| `vento-shell`     |                      2 |                    1 |                   5 |                     3 |
| `vento-viso`      |                     60 |                    1 |                  46 |                    63 |
| `vento-nexo`      |                     64 |                    1 |                  32 |                   112 |
| `vento-fogo`      |                      9 |                    1 |                  10 |                    15 |
| `vento-origo`     |                     13 |                    1 |                  11 |                    10 |
| `vento-pulso`     |                      6 |                    2 |                  11 |                     8 |
| `vento-numera`    |                      7 |                    1 |                   7 |                     4 |
| `vento-group-web` |                      7 |                    1 |                  16 |                     1 |
| `vento-anima`     |                     14 |                    3 |                  66 |                    20 |
| `vento-pass`      | 17 estados principales |              1 Stack |                  74 |                    15 |
| `vento-talento`   |                     12 |                    3 |                   4 |                     4 |
| `vento-vital`     |                      5 | 1 shell con pestañas |                   8 |                     1 |

`vento-shell` contiene además **6** módulos en la plantilla estándar. No se
sumaron como componentes activos para evitar contar una copia de referencia como
interfaz desplegada.

---

#### 5. Rutas web por aplicación

##### 5.1. SHELL — 2

```text
/
/login
```

SHELL es una entrada y selector de contexto compacto; el bajo número de rutas es
coherente con su frontera y no significa que deba absorber pantallas de otras
aplicaciones.

##### 5.2. VISO — 60

| Grupo principal          | Rutas |
| ------------------------ | ----: |
| `staff`                  |    10 |
| `website-cms`            |     7 |
| `operations`             |     5 |
| `menu`                   |     4 |
| `businesses`             |     3 |
| `pass-users`             |     3 |
| `products`               |     3 |
| `sites`                  |     3 |
| `vacancies`              |     3 |
| `commercial-audit`       |     2 |
| `commercial-collections` |     2 |
| `content-blocks`         |     2 |
| restantes                |    13 |

```text
/
/accounting
/app-navigation
/app-updates
/businesses
/businesses/[id]
/businesses/new
/commercial-audit
/commercial-audit/structure
/commercial-availability
/commercial-categories
/commercial-collections
/commercial-collections/overview
/commercial-menu
/content-blocks
/content-blocks/[id]
/delivery-rates
/login
/menu
/menu/[id]
/menu/[id]/personalizations/manage
/menu/new
/no-access
/operations
/operations-map
/operations/checkin-points
/operations/employee-profiles
/operations/preview
/operations/site-roles
/ops/audit
/pass-users
/pass-users/[id]
/pass-users/new
/products
/products/[id]
/products/new
/roles-permissions
/sites
/sites/[id]
/sites/[id]/documentos
/staff
/staff/[id]
/staff/attendance
/staff/calendar
/staff/new
/staff/schedule
/staff/schedule/global
/staff/schedule/metrics
/staff/schedule/settings
/staff/shared-devices/new
/vacancies
/vacancies/[id]
/vacancies/new
/website-cms
/website-cms/blocks/[id]
/website-cms/blocks/new
/website-cms/items/[id]
/website-cms/items/new
/website-cms/venues
/website-cms/venues/[slug]
```

##### 5.3. NEXO — 64

| Grupo principal           | Rutas |
| ------------------------- | ----: |
| `inventory`               |    55 |
| `printing`                |     3 |
| raíz, acceso y utilidades |     6 |

```text
/
/inventory/adjust
/inventory/assets
/inventory/assets/counts
/inventory/assets/counts/[id]
/inventory/assets/groups/[id]
/inventory/assets/items/[id]
/inventory/assets/new
/inventory/assets/quick
/inventory/catalog
/inventory/catalog/[id]
/inventory/catalog/[id]/ficha
/inventory/catalog/[id]/presentations
/inventory/catalog/new
/inventory/catalog/presentations
/inventory/cost-center
/inventory/count-initial
/inventory/count-initial/session/[id]
/inventory/entries
/inventory/locations
/inventory/locations/[id]
/inventory/locations/[id]/board
/inventory/locations/[id]/kiosk-withdraw
/inventory/locations/[id]/positions
/inventory/locations/open
/inventory/locations/zone
/inventory/locations/zones
/inventory/lpns
/inventory/movements
/inventory/production-batches
/inventory/remissions
/inventory/remissions/[id]
/inventory/remissions/[id]/edit
/inventory/remissions/conductor
/inventory/remissions/fulfillment
/inventory/remissions/prepare
/inventory/remissions/receive
/inventory/remissions/transit
/inventory/settings
/inventory/settings/categories
/inventory/settings/fulfillment-routes
/inventory/settings/internal-prices
/inventory/settings/locations/[id]/catalog
/inventory/settings/products
/inventory/settings/remissions
/inventory/settings/remissions/products
/inventory/settings/request-policies
/inventory/settings/sites
/inventory/settings/sites/[id]/operations
/inventory/settings/supply-routes
/inventory/settings/units
/inventory/stock
/inventory/stock/assign-location
/inventory/transfers
/inventory/warehouse
/inventory/withdraw
/kiosk/[slug]
/l/[code]
/login
/no-access
/printing/designer
/printing/jobs
/printing/setup
/scanner
```

##### 5.4. FOGO — 9

```text
/
/login
/no-access
/production-batches
/production-batches/new
/recipe-book
/recipes
/recipes/[id]/edit
/recipes/new
```

##### 5.5. ORIGO — 13

```text
/
/login
/no-access
/product-master-review
/purchase-orders
/purchase-orders/[id]
/purchase-orders/[id]/edit
/purchase-orders/new
/receipts
/receipts/new
/suppliers
/suppliers/[id]/edit
/suppliers/new
```

##### 5.6. PULSO — 6

```text
/
/no-access
/orders
/sales-imports
/salon
/scanner
```

##### 5.7. NUMERA — 7

```text
/
/break-even
/cost-centers
/expenses
/login
/no-access
/profitability
```

##### 5.8. Web pública — 7

```text
/
/ecosistema
/empleos
/eventos
/restaurantes
/restaurantes/[slug]
/servicios
```

NEXO y VISO concentran **124 de las 168 rutas web**, aproximadamente el 74 %.
Esto orienta el orden de auditoría; no autoriza reducir las otras aplicaciones.

---

#### 6. Layouts y envolturas compartidas

| Repositorio | Layouts activos | Alcance                              |
| ----------- | --------------: | ------------------------------------ |
| SHELL       |               1 | raíz                                 |
| VISO        |               1 | raíz                                 |
| NEXO        |               1 | raíz                                 |
| FOGO        |               1 | raíz                                 |
| ORIGO       |               1 | raíz                                 |
| PULSO       |               2 | raíz y `/orders`                     |
| NUMERA      |               1 | raíz                                 |
| web pública |               1 | raíz                                 |
| ANIMA       |               3 | raíz, autenticación y aplicación     |
| TALENTO     |               3 | raíz, autenticación y aplicación     |
| PASS        |               1 | `NavigationContainer` + Stack nativo |
| VITAL       |               1 | shell principal + pestañas           |

La copia visual del shell estándar presente en varios repositorios continúa como
duplicación técnica `TEC-18` y se evaluará en `CODE-AUD-014`.

---

#### 7. Pantallas móviles

##### 7.1. ANIMA — 14 pantallas

```text
/
/anima-diagnostics
/account-settings
/splash
/login
/team
/support
/shifts
/operativo
/home
/history
/documents
/carnet
/announcements
```

Los grupos `(auth)` y `(app)` organizan el código, pero no forman parte de la
ruta visible.

##### 7.2. PASS — 15 pantallas de Stack y 2 estados previos

Pantallas registradas:

```text
Home
Club
MyOrders
ChooseSatellite
DeliveryAddresses
AccountSettings
VentoCafe
Saudo
SatelliteExperience
SatellitePass
OrderHome
OrderMenu
OrderCheckout
OrderPlaced
OrderChat
```

El Stack contiene **15 registros**. `SatelliteExperience` y `SatellitePass` son
destinos separados aunque compartan implementación. Antes del Stack existen los
estados `Auth` y `CompleteProfile`.

Los enlaces externos configurados exponen:

```text
/
/orders
/payment-return
```

##### 7.3. TALENTO — 12 pantallas sin despliegue

```text
/auth/callback
/process
/
/documents
/vacancies
/profile
/register
/login
/forgot-password
/vacancy/[id]
/jobs/[id]
/jobs
```

Estas pantallas prueban base técnica, no producto adoptado ni aplicación
publicada.

##### 7.4. VITAL — 5 pantallas separadas

```text
LoginScreen
OnboardingScreen
HoyScreen
SummaryScreen
ProfileScreen
```

`Hoy`, `Resumen` y `Perfil` se muestran mediante pestañas internas. VITAL
permanece separado de Vento OS.

---

#### 8. Superficies auxiliares de ANIMA y PASS

##### 8.1. ANIMA

```text
/
/privacy-policy
/delete-account
/eliminar-cuenta
/api/request-password
/api/set-password
/api/employee-apple-pass
```

Las dos primeras API de autenticación producen páginas de captura, pero siguen
siendo utilidades de la aplicación móvil.

##### 8.2. PASS

Superficie estática principal:

```text
/privacy-policy
/loyalty-terms
/delete-account
/eliminar-cuenta
/payment-return
/.well-known/apple-app-site-association
/.well-known/assetlinks.json
```

Superficie Wallet:

```text
/api/apple-pass
/api/employee-apple-pass
/api/request-account-deletion
/api/wallet/[...slug]
/api/wallet/notify
```

`privacy-policy`, `loyalty-terms`, `delete-account` y `eliminar-cuenta` también
aparecen dentro de `wallet-pass-api`. La duplicación se conserva como hallazgo;
no se eliminó ningún archivo.

---

#### 9. Componentes reutilizables

Los **290** módulos bajo directorios de componentes se distribuyen así:

| Repositorio    | Módulos |
| -------------- | ------: |
| PASS           |      74 |
| ANIMA          |      66 |
| VISO           |      46 |
| NEXO           |      32 |
| web pública    |      16 |
| ORIGO          |      11 |
| PULSO          |      11 |
| FOGO           |      10 |
| VITAL separado |       8 |
| NUMERA         |       7 |
| SHELL activo   |       5 |
| TALENTO        |       4 |

La cantidad no indica reutilización efectiva. PASS conserva, entre otros:

- `MyOrdersScreen` y `MyOrdersScreenV2`;
- tres variantes de `DeliveryAddressesScreen`;
- varias variantes de entrada y checkout de pedidos;
- `OrderPlacedScreen` y `OrderPlacedScreenLive`;
- `Home` y `HomeOptimized`;
- selectores de horario en más de una versión.

`CODE-AUD-003` comprobará cuál se usa; `CODE-AUD-013`, `CODE-AUD-014` y
`CODE-AUD-015` decidirán después qué es legacy, duplicado o no consumido.

---

#### 10. Formularios y captura de datos

La búsqueda estática identificó **256 módulos candidatos**:

| Repositorio    | Candidatos |
| -------------- | ---------: |
| NEXO           |        112 |
| VISO           |         63 |
| ANIMA          |         20 |
| FOGO           |         15 |
| PASS           |         15 |
| ORIGO          |         10 |
| PULSO          |          8 |
| NUMERA         |          4 |
| TALENTO        |          4 |
| SHELL activo   |          3 |
| web pública    |          1 |
| VITAL separado |          1 |

En páginas web, los controles aparecen directamente en:

| Aplicación  | Páginas con captura directa |
| ----------- | --------------------------: |
| NEXO        |                          38 |
| VISO        |                          31 |
| ORIGO       |                           5 |
| FOGO        |                           4 |
| NUMERA      |                           2 |
| SHELL       |                           1 |
| PULSO       |                           1 |
| web pública |                           0 |

Reglas:

1. un buscador y un formulario transaccional pueden contener el mismo elemento
   HTML, pero no producen el mismo resultado;
2. un control dentro de un componente importado puede no aparecer en el archivo
   `page.*`;
3. una pantalla puede cambiar datos sin usar `<form>`;
4. esta tarea localiza captura; `CODE-AUD-003` comprobará la acción y
   `CODE-AUD-004` su implementación.

---

#### 11. Estados especiales de interfaz

Solo se encontraron archivos explícitos especiales en:

| Repositorio | Archivos                                 |
| ----------- | ---------------------------------------- |
| NEXO        | dos `loading.tsx` en alcances diferentes |
| VISO        | `error.tsx` y `global-error.tsx`         |

Las demás aplicaciones pueden manejar carga o error dentro de sus páginas y
componentes, pero no presentan fronteras de archivo equivalentes. Esto se
revisará en `CODE-AUD-010` y `CODE-AUD-018`; no se declara todavía como falla.

---

#### 12. Hallazgos y destinos

| ID               | Hallazgo                                                          | Destino                                      |
| ---------------- | ----------------------------------------------------------------- | -------------------------------------------- |
| `H-CODE-002-001` | NEXO y VISO concentran 124 de 168 rutas web                       | priorización de `CODE-AUD-003..019`          |
| `H-CODE-002-002` | PASS conserva múltiples variantes nominales de pantallas          | `CODE-AUD-003`, `013`, `014`, `015`          |
| `H-CODE-002-003` | páginas legales de PASS aparecen en dos superficies auxiliares    | `CODE-AUD-014`, `CODE-AUD-015`               |
| `H-CODE-002-004` | shell visual y navegación están copiados entre repositorios       | `CODE-AUD-014`, `TEC-18`                     |
| `H-CODE-002-005` | VISO expone producto, menú, comercio y CMS junto a administración | `CODE-AUD-019`                               |
| `H-CODE-002-006` | TALENTO tiene doce pantallas sin despliegue                       | `CAP-TAL-001..006`                           |
| `H-CODE-002-007` | fronteras explícitas de carga y error son desiguales              | `CODE-AUD-010`, `CODE-AUD-018`               |
| `H-CODE-002-008` | 256 candidatos de captura no equivalen a formularios validados    | `CODE-AUD-003`, `CODE-AUD-004`               |
| `H-CODE-002-009` | rutas dinámicas dependen de datos y estados todavía no probados   | `CODE-AUD-003`, `CODE-AUD-007`               |
| `H-CODE-002-010` | AURA no tiene rutas, pantallas ni componentes                     | planeación futura, fuera de auditoría actual |

Todos los destinos ya existen. No se crean preguntas ni tareas redundantes.

---

#### 13. Qué no se concluye todavía

Este inventario no afirma:

- que toda ruta sea accesible para un usuario real;
- que una pantalla guarde correctamente;
- que cada formulario valide y muestre errores;
- que un componente con nombre nuevo sea el activo;
- que dos pantallas parecidas sean duplicadas;
- que una pantalla sin `error.tsx` no maneje errores;
- que una ruta desplegada tenga datos productivos;
- que un componente encontrado tenga consumidor.

Estas comprobaciones pertenecen a las tareas posteriores de auditoría.

---

#### 14. Decisiones propuestas

1. Se adopta el inventario de 168 rutas web como corte inicial.
2. ANIMA se conserva con 14 pantallas Expo Router.
3. PASS se conserva con 15 pantallas de Stack y dos estados previos.
4. TALENTO conserva doce pantallas como base futura no desplegada.
5. VITAL permanece separado con cinco pantallas.
6. Las superficies auxiliares de ANIMA y PASS no se convierten en aplicaciones.
7. AURA permanece fuera del inventario actual.
8. Los 290 módulos de componentes son inventario, no prueba de uso.
9. Los 256 candidatos de captura son puntos de revisión, no formularios
   declarados como completos.
10. Los diez hallazgos continúan en tareas existentes.
11. No se crean preguntas para hechos obtenibles del código.
12. `CODE-AUD-003` será la única continuidad inmediata.

---

#### 15. Criterios de aceptación

`CODE-AUD-002` podrá aprobarse cuando:

- las ocho aplicaciones web tengan rutas enumeradas;
- rutas y grupos internos no se confundan;
- layouts y navegación móvil queden separados;
- ANIMA y PASS permanezcan como móviles;
- TALENTO no se presente como desplegado;
- VITAL permanezca separado;
- AURA no reciba pantallas ficticias;
- superficies auxiliares no se cuenten como aplicaciones;
- componentes y pantallas no se confundan;
- candidatos de captura no se presenten como flujos validados;
- variantes y posibles duplicados conserven destino;
- no se creen preguntas repetidas;
- `CODE-AUD-003` permanezca como única continuidad inmediata.

---

#### 16. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
repositorio y despliegue
        ↓
ruta, layout o pantalla
        ↓
componente y punto de captura
        ↓
acción real por comprobar
```

La continuidad será:

```text
CODE-AUD-003
— Inventariar acciones de usuario y comportamiento efectivo
```


### ✅ CODE-AUD-003 — Inventariar acciones de usuario y comportamiento efectivo

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** trazado estático de interacción, efecto y evidencia
**Dependencia anterior:** `CODE-AUD-002`
**Continuidad reservada:** `CODE-AUD-004`
**Fecha de corte:** 2026-07-23
**Cambios en código o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea conecta cada familia visible de interacción con el efecto que el
código intenta producir:

```text
persona pulsa, escribe, selecciona, escanea o envía
        ↓
manejador de interfaz
        ↓
validación y autorización encontradas
        ↓
cambio local, navegación, servidor, Supabase, dispositivo o tercero
        ↓
respuesta visible y evidencia persistente
```

La revisión confirma que el ecosistema no usa un único patrón:

- las aplicaciones web administrativas usan principalmente Server Actions,
  RPC y escrituras de servidor;
- ANIMA y PASS combinan operaciones directas desde el móvil, RPC, Edge
  Functions y capacidades del dispositivo;
- TALENTO contiene acciones conectadas en código, pero no está desplegado;
- la web pública es principalmente de lectura y navegación;
- VITAL depende de una API HTTP separada sin producción comprobada;
- existen acciones solamente visuales y al menos una interfaz sin efecto
  conectado.

No se ejecutaron altas, ediciones, anulaciones, pagos, movimientos, asistencia,
pedidos ni pruebas con datos reales.

---

#### 2. Estados de comportamiento

| Estado                       | Significado                                                       |
| ---------------------------- | ----------------------------------------------------------------- |
| `LOCAL`                      | cambia la pantalla sin guardar                                    |
| `NAVEGACIÓN`                 | abre otra ruta, aplicación o destino                              |
| `REMOTO_DIRECTO`             | la interfaz llama directamente a Supabase                         |
| `SERVIDOR`                   | pasa por Server Action, API, RPC o Edge Function                  |
| `DISPOSITIVO`                | usa ubicación, cámara, escáner, archivo, impresión o notificación |
| `EXTERNO`                    | abre mapas, correo, tienda, pago u otro proveedor                 |
| `SIN_EFECTO`                 | se muestra un control sin acción conectada                        |
| `IMPLEMENTADO_NO_DESPLEGADO` | existe código, pero no superficie productiva                      |
| `POR_PROBAR`                 | existe conexión estática, pero no fue ejecutada operativamente    |

`POR_PROBAR` no significa roto. Significa que el análisis de código no sustituye
una prueba segura con actor, permiso, dato y resultado controlados.

---

#### 3. Señales técnicas encontradas

Los conteos siguientes son **archivos que contienen la señal**, no número de
acciones. Un mismo archivo puede aparecer en varias columnas.

| Repositorio    | interacción | navegación | autenticación | base/RPC | Edge o HTTP | dispositivo |
| -------------- | ----------: | ---------: | ------------: | -------: | ----------: | ----------: |
| ANIMA          |          67 |         11 |             4 |       21 |           8 |          24 |
| FOGO           |          17 |         14 |             1 |       10 |           0 |           8 |
| web pública    |           6 |         11 |             0 |        0 |           0 |           0 |
| NEXO           |          74 |         76 |             3 |       69 |          11 |          63 |
| NUMERA         |           4 |          5 |             1 |        8 |           0 |           2 |
| ORIGO          |           8 |         18 |             1 |       15 |           0 |           4 |
| PASS           |          63 |         18 |             5 |       25 |           9 |           4 |
| PULSO          |          16 |          5 |             1 |       19 |           2 |          10 |
| SHELL          |           3 |          1 |             2 |        1 |           0 |           1 |
| TALENTO        |          14 |         10 |             1 |        3 |           1 |           1 |
| VISO           |          33 |         57 |             1 |       58 |          12 |          11 |
| VITAL separado |          10 |          0 |             0 |        0 |          14 |           2 |

“base/RPC” incluye lectura o escritura mediante RPC; la autorización y el tipo
exacto de cada contrato se detallarán en `CODE-AUD-005` a `CODE-AUD-007`.

---

#### 4. Acciones comunes del ecosistema web

Las aplicaciones web comparten estas familias:

| Acción del usuario        | Comportamiento encontrado                            | Estado                  |
| ------------------------- | ---------------------------------------------------- | ----------------------- |
| iniciar sesión            | Supabase Auth, mensaje de error y redirección        | `REMOTO_DIRECTO`        |
| cerrar sesión             | acción de servidor o cliente y retorno a login       | `SERVIDOR`              |
| cambiar sede              | actualiza contexto y vuelve a cargar datos           | `LOCAL` + `NAVEGACIÓN`  |
| cambiar rol de revisión   | altera contexto de prueba autorizado                 | `LOCAL` + consultas     |
| abrir aplicación          | comprueba acceso y navega al dominio correspondiente | `NAVEGACIÓN`            |
| abrir AURA                | se muestra como `Próximamente` y queda deshabilitada | `LOCAL`, sin navegación |
| buscar, filtrar u ordenar | modifica resultados visibles                         | `LOCAL`                 |
| guardar formulario        | Server Action, RPC o escritura según módulo          | `SERVIDOR`              |
| descargar o imprimir      | genera archivo, diálogo o trabajo de impresión       | `DISPOSITIVO`           |
| actualizar versión        | recarga la superficie cuando existe actualización    | `NAVEGACIÓN`            |

AURA continúa sin tratarse como producto. Su presencia visual deshabilitada no
equivale a ruta, aplicación ni despliegue.

---

#### 5. SHELL

| Acción                 | Efecto observado                        | Resultado visible        |
| ---------------------- | --------------------------------------- | ------------------------ |
| iniciar sesión         | `signInWithPassword`                    | error o entrada al hub   |
| solicitar recuperación | correo de recuperación de Supabase Auth | mensaje de envío o error |
| mostrar contraseña     | cambia visibilidad local                | campo visible u oculto   |
| abrir aplicación       | consulta permisos y usa enlace externo  | aplicación permitida     |
| cerrar sesión          | Server Action `signOut`                 | regreso al login         |

SHELL no crea datos empresariales desde su pantalla principal. Su única frontera
operativa comprobada es autenticación, autorización de acceso y navegación.

---

#### 6. VISO

| Grupo de acciones  | Ejemplos                                             | Efecto encontrado                              |
| ------------------ | ---------------------------------------------------- | ---------------------------------------------- |
| organización       | crear o editar empresa, sede, área y rol             | Server Actions y Supabase                      |
| trabajadores       | crear, editar, invitar, retirar y asignar            | tablas laborales + Edge Function de invitación |
| horarios           | crear, mover, publicar, borrar y medir turnos        | Server Actions, RPC y tablas de horario        |
| asistencia         | revisar registros, puntos y políticas                | consultas, acciones y RPC                      |
| permisos           | asignar rol, permiso y límite de concurrencia        | tablas y RPC                                   |
| productos y menú   | crear producto, grupo, opción y regla                | tablas comerciales y de catálogo               |
| CMS                | crear, editar, ordenar, publicar y retirar contenido | `website_blocks` y `website_items`             |
| vacantes           | crear, editar y consultar vacantes                   | tabla `vacancies`                              |
| documentos         | cargar y asociar documentos                          | Storage + tablas                               |
| entrega y comercio | tarifas, colecciones y disponibilidad                | Server Actions                                 |

Comportamiento efectivo encontrado:

1. la mayoría de mutaciones sensibles están declaradas como Server Actions;
2. varios flujos usan RPC para operaciones con reglas múltiples;
3. la invitación laboral invoca `staff-invitations-create`;
4. existen cargas hacia Storage;
5. publicación de horarios y CMS producen estado persistente;
6. la prueba operativa de cada permiso sigue pendiente.

---

#### 7. NEXO

| Grupo de acciones      | Ejemplos                                            | Efecto encontrado                |
| ---------------------- | --------------------------------------------------- | -------------------------------- |
| catálogo               | crear, editar, configurar presentación e imagen     | Server Actions, tablas y Storage |
| existencias            | consultar, ajustar, ubicar y conciliar              | tablas de stock y RPC            |
| conteos                | abrir sesión, capturar cantidades, cerrar y aplicar | RPC transaccionales              |
| solicitudes            | crear, dividir, valorar, surtir y revertir          | tablas de reposición + RPC       |
| remisiones             | preparar, despachar, recibir, confirmar y corregir  | tablas + RPC                     |
| traslados              | mover inventario y registrar diferencias            | tablas de transferencia          |
| ubicaciones            | crear áreas, posiciones, catálogos y rutas          | tablas de ubicación              |
| activos                | crear, contar, mantener, mover y documentar         | tablas de activos                |
| producción             | consultar lotes y efectos de inventario             | tablas de producción             |
| impresión              | diseñar etiqueta, crear trabajo e imprimir          | navegador/dispositivo            |
| escaneo                | leer QR, código o LPN                               | cámara/escáner + consulta        |
| dispositivo compartido | firmar acción e identificar actor                   | RPC de firma                     |

NEXO presenta la mayor variedad de acciones y contratos. La existencia de
confirmaciones, firmas y RPC no demuestra todavía idempotencia ni protección
ante doble envío; eso continúa a `CODE-AUD-018`.

---

#### 8. FOGO

| Acción                   | Efecto observado                              |
| ------------------------ | --------------------------------------------- |
| crear o editar receta    | guarda receta, ingredientes, salidas y pasos  |
| cargar foto de paso      | sube archivo a Storage                        |
| copiar estructura        | modifica el formulario local antes de guardar |
| crear lote               | inserta lote de producción                    |
| registrar cantidades     | actualiza consumos, salidas o paquetes        |
| seleccionar área o sede  | cambia contexto operativo                     |
| firmar acción compartida | RPC de firma de actor                         |

Las recetas tienen comportamiento persistente localizado. La adopción real del
módulo de lotes continúa sin quedar demostrada por esta inspección.

---

#### 9. ORIGO

| Acción                               | Efecto observado                                     |
| ------------------------------------ | ---------------------------------------------------- |
| crear o editar proveedor             | Server Action sobre proveedores                      |
| eliminar proveedor                   | eliminación persistente con validaciones de servidor |
| crear o editar orden                 | orden y líneas de compra                             |
| eliminar orden                       | cambio persistente sobre compra                      |
| aprobar o rechazar solicitud maestra | actualiza revisión de producto                       |
| crear recepción                      | entrada, costos y efectos de inventario              |
| corregir o reversar recepción        | RPC específicos de corrección                        |
| abrir recepción desde orden          | navegación con contexto de orden                     |

La recepción combina compras e inventario. `CODE-AUD-018` deberá comprobar que
reintentos o dobles pulsaciones no dupliquen entradas ni costos.

---

#### 10. PULSO

| Acción                          | Efecto observado                        |
| ------------------------------- | --------------------------------------- |
| importar ventas                 | carga archivo, valida filas y crea lote |
| mapear producto externo         | guarda correspondencia con catálogo     |
| contabilizar importación diaria | RPC de publicación/consumo              |
| consultar pedidos               | carga órdenes y estados                 |
| cambiar estado operativo        | RPC de transición                       |
| confirmar excepción de entrega  | RPC de autorización especial            |
| abrir chat                      | crea o consulta conversación            |
| enviar mensaje                  | inserta mensaje e invoca notificación   |
| solicitar atención de mesa      | crea o actualiza llamada                |
| identificar cliente             | captura o escanea QR                    |
| otorgar puntos externos         | RPC de fidelización                     |

La superficie contiene operación de pedidos, importación y salón, pero todavía
no constituye el POS completo definido en la línea base.

---

#### 11. NUMERA

| Acción                      | Efecto observado                                  |
| --------------------------- | ------------------------------------------------- |
| registrar gasto             | Server Action con permiso, validación e inserción |
| administrar centro de costo | actualiza configuración económica                 |
| administrar presupuesto     | escribe presupuesto por centro                    |
| consultar equilibrio        | calcula o consulta datos sin mutar                |
| consultar rentabilidad      | presenta agregados                                |
| cambiar período o filtro    | navegación o estado de consulta                   |

NUMERA combina lectura analítica con mutaciones económicas puntuales. No se
encontró evidencia de que cierre contabilidad, tesorería o cartera completa.

---

#### 12. Web pública

| Acción                                 | Comportamiento                             |
| -------------------------------------- | ------------------------------------------ |
| navegar por secciones                  | rutas internas Next.js                     |
| abrir restaurante                      | ruta dinámica por `slug`                   |
| consultar empleos                      | lectura de elementos CMS tipo `job`        |
| abrir contacto                         | enlace de correo                           |
| abrir redes                            | enlace externo                             |
| mover carrusel                         | estado y gestos locales                    |
| escribir correo y pulsar `Suscribirse` | **no existe envío ni manejador conectado** |

El campo de correo y el botón `Suscribirse` son el único caso confirmado en esta
tarea donde la interfaz ofrece una acción sin comportamiento efectivo.

La página de empleos publica contenido CMS; no reemplaza el portal futuro
TALENTO ni procesa una postulación.

---

#### 13. ANIMA

| Grupo de acciones | Efecto encontrado                                      |
| ----------------- | ------------------------------------------------------ |
| autenticación     | login, recuperación y cierre de sesión                 |
| asistencia        | ubicación, entrada, salida, descansos y sincronización |
| turnos            | consultar, confirmar, cancelar y registrar salida      |
| documentos        | seleccionar, cargar, consultar y eliminar              |
| invitaciones      | crear, reenviar y cancelar mediante Edge Functions     |
| equipo            | consultar trabajador, sede y estado                    |
| anuncios          | consultar, marcar y recibir notificación               |
| soporte           | crear ticket, enviar mensaje y marcar lectura          |
| carné             | comprobar elegibilidad y generar pase                  |
| configuración     | actualizar preferencias y notificaciones               |
| eliminación       | solicitar y confirmar eliminación de cuenta            |

Comportamiento:

- asistencia usa ubicación y RPC;
- documentos usan Storage y tablas;
- notificaciones registran token mediante Edge Function;
- invitaciones y eliminación usan funciones remotas;
- varias acciones conservan caché o estado local para tolerar interrupciones.

La ejecución real en dispositivo, segundo plano, permisos de ubicación y
reintentos continúa a `CODE-AUD-016` y `CODE-AUD-018`.

---

#### 14. PASS

| Grupo de acciones   | Efecto encontrado                                   |
| ------------------- | --------------------------------------------------- |
| registro y acceso   | OTP, verificación y sesión                          |
| perfil              | completar o editar datos                            |
| membresía           | consultar nivel, puntos, movimientos y QR           |
| fidelización        | redimir, cancelar y mostrar resultado               |
| favoritos y opinión | guardar favorito, calificación o comentario         |
| sedes               | escoger restaurante y abrir mapa                    |
| direcciones         | buscar, guardar, editar, borrar y cotizar           |
| pedido              | elegir productos, opciones, regalo, fecha y entrega |
| facturación         | guardar datos del comprador y solicitud             |
| pago                | crear intención, abrir proveedor y procesar retorno |
| seguimiento         | consultar estado y PIN de entrega                   |
| chat                | abrir conversación, enviar mensaje y marcar lectura |
| Wallet              | descargar pase                                      |
| notificaciones      | registrar dispositivo y responder a pulsación       |
| cuenta              | limpiar datos o solicitar eliminación               |

PASS combina:

- Supabase directo para perfil, fidelización, pedido y conversación;
- RPC para membresía, checkout, disponibilidad y chat;
- Edge Functions para pago, dirección, entrega, notificaciones y eliminación;
- salidas externas hacia mapas, configuración, tienda y proveedor de pago.

Las variantes `V2`, `Managed`, `Cached`, `Live` y `Optimized` todavía requieren
confirmación de consumo en `CODE-AUD-013` y `CODE-AUD-015`.

---

#### 15. TALENTO no desplegado

| Acción implementada        | Efecto de código              |
| -------------------------- | ----------------------------- |
| registrar o iniciar sesión | Supabase Auth                 |
| abrir vacante              | navegación a detalle          |
| postularse                 | RPC `submit_application`      |
| completar perfil           | actualización de candidato    |
| cargar documento           | Storage + registro            |
| confirmar entrevista       | RPC `confirm_interview`       |
| aceptar o rechazar oferta  | RPC `respond_to_offer`        |
| consultar proceso          | aplicaciones, etapas y tareas |
| cerrar sesión              | Supabase Auth                 |

Estado: `IMPLEMENTADO_NO_DESPLEGADO`.

Estas acciones no se presentan como operación actual. Su diseño y remodelación
permanecen en `CAP-TAL-001` a `CAP-TAL-006`.

---

#### 16. VITAL separado

VITAL contiene acciones para:

- iniciar sesión y completar onboarding;
- cargar el plan del día;
- completar, aplazar o reprogramar una tarea;
- guardar perfil nutricional y deportivo;
- activar módulos, objetivos y deportes;
- consultar resumen;
- previsualizar o aplicar un plan generado;
- sincronizar notificaciones.

El móvil llama una API HTTP propia. Solo existe build interno y no se comprobó
API productiva, por lo que el estado es `IMPLEMENTADO_NO_DESPLEGADO`. No se
incorpora al backlog operativo de Vento OS.

---

#### 17. Superficies auxiliares móviles

##### 17.1. ANIMA

| Acción                | Efecto                                                 |
| --------------------- | ------------------------------------------------------ |
| solicitar enlace      | API genera solicitud de recuperación                   |
| establecer contraseña | procesa token y actualiza credencial                   |
| eliminar cuenta       | muestra información o entrada al flujo correspondiente |
| descargar carné       | API genera Apple Wallet pass                           |

##### 17.2. PASS

| Acción                 | Efecto                       |
| ---------------------- | ---------------------------- |
| abrir enlace universal | intenta abrir la aplicación  |
| regresar de pago       | redirige hacia `OrderPlaced` |
| descargar Wallet       | genera pase                  |
| eliminar cuenta        | inicia o explica solicitud   |
| consultar términos     | página estática              |

Son utilidades de las aplicaciones móviles, no productos web.

---

#### 18. Comportamientos incompletos o no demostrados

| ID                 | Situación                                                   | Estado                       |
| ------------------ | ----------------------------------------------------------- | ---------------------------- |
| `ACT-CODE-003-001` | suscripción de la web pública no tiene manejador            | `SIN_EFECTO` confirmado      |
| `ACT-CODE-003-002` | TALENTO contiene acciones, pero no despliegue               | `IMPLEMENTADO_NO_DESPLEGADO` |
| `ACT-CODE-003-003` | VITAL depende de API sin producción comprobada              | `IMPLEMENTADO_NO_DESPLEGADO` |
| `ACT-CODE-003-004` | acciones de dispositivo no se ejecutaron en hardware real   | `POR_PROBAR`                 |
| `ACT-CODE-003-005` | operaciones de pago no se ejecutaron                        | `POR_PROBAR`                 |
| `ACT-CODE-003-006` | cambios de inventario, compra y producción no se ejecutaron | `POR_PROBAR`                 |
| `ACT-CODE-003-007` | asistencia no se ejecutó con ubicación real                 | `POR_PROBAR`                 |
| `ACT-CODE-003-008` | variantes de PASS pueden no estar consumidas                | `POR_PROBAR`                 |

No se necesita una respuesta del usuario para comprobar estos puntos. Son
comprobaciones técnicas u operativas dirigidas a tareas posteriores.

---

#### 19. Hallazgos y destinos

| ID               | Hallazgo                                                           | Destino                        |
| ---------------- | ------------------------------------------------------------------ | ------------------------------ |
| `H-CODE-003-001` | la web pública ofrece suscripción sin efecto                       | `CODE-AUD-010`, `CODE-AUD-020` |
| `H-CODE-003-002` | conviven escrituras directas, Server Actions, RPC y Edge Functions | `CODE-AUD-004`, `005`, `017`   |
| `H-CODE-003-003` | NEXO concentra acciones con movimientos y confirmaciones sensibles | `CODE-AUD-018`, `019`          |
| `H-CODE-003-004` | ORIGO combina recepción, costos e inventario                       | `CODE-AUD-006`, `018`, `019`   |
| `H-CODE-003-005` | PULSO mezcla importación, pedidos, salón, chat y fidelización      | `CODE-AUD-012`, `019`          |
| `H-CODE-003-006` | ANIMA depende de ubicación, segundo plano y notificaciones         | `CODE-AUD-016`, `018`          |
| `H-CODE-003-007` | PASS depende de pago, enlaces, Wallet, mapas y notificaciones      | `CODE-AUD-005`, `016`, `018`   |
| `H-CODE-003-008` | TALENTO implementa acciones antes de tener producto aprobado       | `CAP-TAL-001..006`             |
| `H-CODE-003-009` | VITAL tiene comportamiento local sin superficie productiva         | conservar fuera de Vento OS    |
| `H-CODE-003-010` | variantes de PASS requieren confirmar consumidor activo            | `CODE-AUD-013`, `015`          |
| `H-CODE-003-011` | permisos encontrados no prueban autorización de servidor completa  | `CODE-AUD-017`                 |
| `H-CODE-003-012` | feedback e idempotencia no son uniformes                           | `CODE-AUD-010`, `018`          |

Todos los destinos ya existen. No se crean preguntas ni tareas redundantes.

---

#### 20. Regla de seguridad para las siguientes pruebas

Las comprobaciones posteriores:

1. no crearán productos, compras, movimientos, remisiones, asistencia, pedidos
   o pagos productivos sin autorización expresa;
2. usarán lectura, fixtures, entornos controlados o datos expresamente
   autorizados;
3. distinguirán autenticación de autorización por fila y por acción;
4. comprobarán que una operación de actualización tenga lectura y validación
   adecuadas;
5. revisarán funciones privilegiadas sin asumir seguridad por su nombre;
6. se ejecutarán desde `vento-shell` cuando involucren Supabase VENTO.

La revisión del changelog vigente advierte además que la exposición automática
de tablas nuevas al Data API está cambiando. Por eso una llamada encontrada en
código no debe asumirse accesible en todos los ambientes.

---

#### 21. Decisiones propuestas

1. Se adopta la taxonomía de nueve estados de comportamiento.
2. Los conteos técnicos se interpretan como archivos con señales, no acciones.
3. Las acciones web administrativas se consideran conectadas estáticamente,
   pero `POR_PROBAR` operativamente.
4. ANIMA y PASS se conservan como móviles con dependencias de dispositivo.
5. TALENTO y VITAL se clasifican `IMPLEMENTADO_NO_DESPLEGADO`.
6. La suscripción pública queda como `SIN_EFECTO` confirmado.
7. AURA permanece deshabilitada como `Próximamente` y no se trata como producto.
8. No se ejecutan mutaciones productivas durante documentación.
9. Los doce hallazgos continúan en tareas existentes.
10. No se crean preguntas para comprobaciones técnicas.
11. `CODE-AUD-004` será la única continuidad inmediata.

---

#### 22. Criterios de aceptación

`CODE-AUD-003` podrá aprobarse cuando:

- interacción y efecto estén diferenciados;
- navegación, cambio local, servidor, dispositivo y tercero no se confundan;
- cada aplicación tenga familias de acciones inventariadas;
- ANIMA y PASS permanezcan como móviles;
- TALENTO no se declare operativo;
- VITAL permanezca separado;
- AURA no reciba comportamiento ficticio;
- la suscripción sin efecto permanezca visible;
- los flujos sensibles queden sin ejecución productiva;
- las acciones no probadas se marquen `POR_PROBAR`;
- los hallazgos tengan destino;
- no se creen preguntas repetidas;
- `CODE-AUD-004` permanezca como única continuidad.

---

#### 23. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
ruta y pantalla
        ↓
acción que intenta la persona
        ↓
comportamiento localizado en código
        ↓
servicio, consulta y estado local por inventariar
```

La continuidad será:

```text
CODE-AUD-004
— Inventariar hooks, servicios, adaptadores, consultas y estado local
```


### ✅ CODE-AUD-004 — Inventariar hooks, servicios, adaptadores, consultas y estado local

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** inventario estático transversal de organización interna, acceso a datos y memoria de interfaz
**Dependencia anterior:** `CODE-AUD-003`
**Continuidad reservada:** `CODE-AUD-005`
**Fecha de corte:** 2026-07-23
**Cambios en código o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea localiza cómo está distribuida la lógica que sostiene las acciones
inventariadas en `CODE-AUD-003`:

```text
pantalla o componente
        ↓
hook, contexto o estado local
        ↓
servicio, adaptador o consulta embebida
        ↓
cliente Supabase, HTTP o capacidad del dispositivo
        ↓
resultado remoto y copia temporal en la aplicación
```

El resultado principal es que **no existe una única arquitectura interna** para
todo el ecosistema:

- ANIMA y PASS concentran hooks, contextos y persistencia móvil;
- TALENTO y VITAL separan servicios por dominio;
- NEXO y VISO concentran gran parte de las consultas dentro de rutas,
  componentes y Server Actions;
- FOGO, NUMERA y ORIGO usan una mezcla más pequeña de páginas, componentes y
  utilidades Supabase;
- PULSO conserva dos constructores distintos del cliente web de Supabase;
- SHELL contiene `@vento/os-context`, pero no se localizaron consumidores fuera
  del propio paquete;
- la web pública solo contiene una consulta de contenido;
- VITAL permanece separado de Vento OS.

No se ejecutaron consultas contra producción, llamadas HTTP, RPC, cargas,
escrituras, pagos, movimientos, asistencia ni pruebas de dispositivo.

---

#### 2. Qué significa cada elemento

| Elemento           | Significado usado en esta auditoría                                            |
| ------------------ | ------------------------------------------------------------------------------ |
| hook               | función React reutilizable cuyo nombre empieza por `use`                       |
| contexto           | estado compartido por un árbol de componentes                                  |
| servicio           | módulo que agrupa operaciones de un proceso o fuente externa                   |
| adaptador          | transforma una forma de datos en otra forma esperada                           |
| consulta           | lectura o escritura expresada con Supabase, RPC, Storage, Edge Function o HTTP |
| estado local       | dato temporal mantenido en memoria por una pantalla o componente               |
| persistencia local | dato guardado en el dispositivo o navegador                                    |
| caché              | copia temporal con regla de reutilización o vencimiento                        |
| cliente            | configuración de acceso a Supabase o a una API                                 |

Un archivo puede cumplir varias funciones. Por ejemplo, un hook puede consultar
Supabase, transformar filas, guardar caché y exponer estado de carga. Por eso los
conteos siguientes **no deben sumarse como módulos únicos**.

---

#### 3. Alcance y método

La inspección incluyó archivos `ts`, `tsx`, `js` y `jsx` de los doce
repositorios y excluyó:

- `node_modules`, `.next`, `.expo`, `dist`, builds, cobertura y cachés;
- documentación, plantillas y archivos públicos estáticos;
- migraciones y Edge Functions, que pertenecen principalmente a
  `CODE-AUD-005` y `CODE-AUD-006`;
- nombres de archivo sin evidencia en el contenido;
- AURA, porque no existe código que inventariar.

Las señales usadas fueron:

1. definiciones de hooks con nombres `use...`;
2. `useState`, `useReducer`, contextos y almacenamiento local;
3. `.from(...)`, `.rpc(...)`, Storage, invocación de Edge Functions y
   `fetch(...)`;
4. transformaciones, normalizaciones, serialización y mapeos;
5. clientes Supabase y módulos nombrados como servicios;
6. ubicación del acceso remoto dentro de páginas, componentes, hooks,
   `features`, `lib`, contextos o servicios.

---

#### 4. Señales encontradas

Los valores son **archivos con la señal**, no cantidad de hooks, consultas ni
operaciones. Un archivo puede aparecer en varias columnas.

| Repositorio          | hooks definidos | acceso remoto | estado local | transformación |
| -------------------- | --------------: | ------------: | -----------: | -------------: |
| ANIMA                |              39 |            44 |           53 |             76 |
| FOGO                 |               0 |            17 |           13 |             29 |
| web pública          |               0 |             1 |            6 |             13 |
| NEXO                 |               8 |           128 |           62 |            190 |
| NUMERA               |               0 |            12 |            3 |             18 |
| ORIGO                |               0 |            23 |            7 |             29 |
| PASS                 |              37 |            59 |           72 |             79 |
| PULSO                |               0 |            23 |           15 |             20 |
| SHELL                |               0 |             2 |            2 |              2 |
| TALENTO              |               1 |             5 |           14 |             10 |
| VISO                 |               0 |            97 |           30 |            106 |
| VITAL separado       |               1 |            19 |            8 |             34 |
| **Total de señales** |          **86** |       **430** |      **285** |        **606** |

“Transformación” es una señal amplia: incluye mapeos de listas y ayudantes de
formato. No significa que existan 606 adaptadores formales.

Se encontraron además **38 archivos** con `AsyncStorage`, `SecureStore`,
`localStorage` o `sessionStorage`.

---

#### 5. Dónde están ubicados los accesos remotos

| Repositorio    |   total | rutas o páginas | componentes |  hooks | `features` | contextos | `lib` o utilidades | API o servicios |  otros |
| -------------- | ------: | --------------: | ----------: | -----: | ---------: | --------: | -----------------: | --------------: | -----: |
| ANIMA          |      44 |               3 |          21 |     13 |          0 |         1 |                  1 |               1 |      4 |
| FOGO           |      17 |               7 |           4 |      0 |          0 |         0 |                  6 |               0 |      0 |
| web pública    |       1 |               0 |           0 |      0 |          0 |         0 |                  1 |               0 |      0 |
| NEXO           |     128 |              93 |           5 |      0 |          8 |         0 |                 10 |              11 |      1 |
| NUMERA         |      12 |               5 |           3 |      0 |          0 |         0 |                  4 |               0 |      0 |
| ORIGO          |      23 |              12 |           3 |      0 |          0 |         0 |                  8 |               0 |      0 |
| PASS           |      59 |               0 |          25 |     22 |          0 |         0 |                  7 |               2 |      3 |
| PULSO          |      23 |              10 |           4 |      0 |          0 |         0 |                  5 |               3 |      1 |
| SHELL          |       2 |               1 |           0 |      0 |          0 |         0 |                  0 |               0 |      1 |
| TALENTO        |       5 |               0 |           0 |      0 |          5 |         0 |                  0 |               0 |      0 |
| VISO           |      97 |              60 |          24 |      0 |          0 |         0 |                  5 |               8 |      0 |
| VITAL separado |      19 |               0 |           0 |      0 |          0 |         0 |                  0 |              19 |      0 |
| **Total**      | **430** |         **191** |      **89** | **35** |     **13** |     **1** |             **47** |          **44** | **10** |

La tabla confirma tres modelos diferentes:

1. **embebido en la superficie:** NEXO, VISO y las aplicaciones web menores;
2. **hook o componente móvil:** ANIMA y PASS;
3. **servicio explícito:** TALENTO y VITAL.

Esto no decide todavía cuál modelo deberá quedar. La remodelación se diseñará
después de vincular contratos, datos, seguridad y consumidores.

---

#### 6. Librerías y estrategia transversal de estado

No se localizaron dependencias declaradas de:

- TanStack Query o React Query;
- SWR;
- Redux;
- Zustand;
- Jotai;
- MobX.

El estado se resuelve principalmente con:

- `useState` y estado dentro de componentes;
- hooks propios;
- contextos React puntuales;
- estado derivado durante render;
- parámetros de URL en aplicaciones Next.js;
- almacenamiento local del navegador;
- `AsyncStorage` o `SecureStore` en móviles;
- variables de módulo y cachés manuales en casos específicos.

La ausencia de una librería de consultas no se registra como falla automática.
Sí obliga a comprobar por flujo:

- quién refresca los datos;
- cuándo una copia queda vencida;
- cómo se invalida después de guardar;
- qué ocurre al cambiar usuario, sede o rol;
- qué ocurre sin conexión o durante un reintento.

Estas comprobaciones continúan a `CODE-AUD-018`.

---

#### 7. Clientes de datos encontrados

| Repositorio    | Clientes localizados                                                                   |
| -------------- | -------------------------------------------------------------------------------------- |
| ANIMA          | `src/lib/supabase.ts`                                                                  |
| FOGO           | `src/lib/supabase/client.ts`, `server.ts`                                              |
| web pública    | `src/lib/supabase.ts`                                                                  |
| NEXO           | `src/lib/supabase/client.ts`, `server.ts`, `proxy.ts`                                  |
| NUMERA         | `src/lib/supabase/client.ts`, `server.ts`                                              |
| ORIGO          | `src/lib/supabase/client.ts`, `server.ts`                                              |
| PASS           | `src/lib/supabase.ts`                                                                  |
| PULSO          | `src/lib/supabase/client.ts`, `server.ts`, `proxy.ts` y `src/utils/supabase/client.ts` |
| SHELL          | `src/lib/supabase/client.ts`, `server.ts`                                              |
| TALENTO        | `src/lib/supabase.ts`                                                                  |
| VISO           | `src/lib/supabase/client.ts`, `server.ts`, `proxy.ts`, `admin.ts`                      |
| VITAL separado | `supabaseTableClient.js`, `supabaseRpcClient.js` dentro de su API                      |

Los pares `client` y `server` de Next.js son fronteras distintas y no se
consideran duplicación por sí mismos. El caso PULSO sí queda señalado porque
existen dos constructores de navegador con variables admitidas y mensajes de
configuración diferentes.

El cliente `admin` de VISO no se clasifica como exposición, pero queda reservado
para revisar consumidores y límites en `CODE-AUD-017`.

---

#### 8. ANIMA

ANIMA tiene la capa de hooks más desarrollada del ecosistema actual.

##### 8.1. Contextos

| Contexto             | Responsabilidad encontrada                   |
| -------------------- | -------------------------------------------- |
| `auth-context`       | sesión, trabajador y ciclo de autenticación  |
| `attendance-context` | asistencia y estado operativo relacionado    |
| `app-config-context` | configuración y disponibilidad de aplicación |

##### 8.2. Familias de hooks

- autenticación y protección de navegación;
- permisos, rol, sede y capacidades;
- política de versión y configuración;
- asistencia, descansos, geocerca y salida de turno;
- anuncios e historial;
- turnos y equipo;
- documentos y notificaciones;
- soporte;
- carné laboral;
- registro de token de notificaciones.

##### 8.3. Persistencia y adaptadores

El subsistema de asistencia separa:

- construcción de payload;
- validación y objetivo de geocerca;
- estado y latch de geocerca;
- RPC de descansos;
- cola de eventos pendientes;
- normalización del evento;
- lectura, escritura y eliminación en `SecureStore`;
- sincronización posterior.

Esto es evidencia de intención de tolerancia a interrupciones. No demuestra por
sí solo que la cola sea idempotente, que conserve todo evento o que funcione en
segundo plano; esas pruebas permanecen en `CODE-AUD-018`.

La caché de autenticación y las notificaciones de documentos también usan
persistencia local. Debe comprobarse limpieza al cerrar sesión o cambiar de
usuario.

---

#### 9. PASS

PASS combina 37 archivos con hooks definidos, 59 con acceso remoto y 72 con
estado local.

##### 9.1. Hooks principales

- membresía, nivel, puntos, recompensas y redenciones;
- favoritos, recomendaciones y gamificación;
- catálogo, disponibilidad y sede;
- perfil laboral y sitios del trabajador;
- notificaciones, actualizaciones y avisos de asequibilidad;
- animaciones y movimiento reducido;
- eliminación de cuenta;
- contenido de aplicación y experiencias satélite.

##### 9.2. Contextos y estado compartido

Se localizaron contextos React para:

- marca;
- modal QR;
- sustitución controlada de rol.

También existen módulos de estado compartido para:

- regalo del pedido;
- destinatario del regalo;
- entrega;
- programación del pedido.

No todos esos módulos usan React Context; algunos conservan variables y
suscriptores propios. Su ciclo de vida deberá verificarse al cambiar pedido,
usuario o sesión.

##### 9.3. Cachés manuales

La entrada de pedido conserva una caché de dirección y cotización que combina:

- memoria de módulo;
- `AsyncStorage`;
- vencimiento de cinco minutos;
- solicitud en curso compartida;
- contador de invalidación;
- suscriptores;
- consulta de dirección;
- llamadas paralelas a cotización de entrega.

Es una implementación explícita y útil como evidencia, pero reúne consulta,
normalización, caché e invocación remota en un mismo módulo. Su comportamiento
con concurrencia, cierre de sesión, errores parciales y cambios de dirección
continúa a `CODE-AUD-018`.

PASS tiene diez archivos con almacenamiento persistente local. La auditoría no
asume que todos limpien datos de identidad, pedido o rol de la misma manera.

---

#### 10. NEXO

NEXO concentra **128 archivos** con acceso remoto:

- 93 dentro de rutas o páginas;
- 11 dentro de API o servicios locales;
- 10 en `lib`;
- 8 en `features`;
- 5 en componentes;
- 1 en otra ubicación.

Se localizaron 19 archivos de consulta marcados `use client` y 18 marcados
`use server`; los demás incluyen componentes de servidor, utilidades o módulos
sin directiva propia.

Los hooks explícitos se concentran principalmente en impresión:

- dispositivos disponibles;
- configuración almacenada;
- previsualización ZPL.

El resto de inventario, remisiones, conteos, catálogo, activos, ubicaciones y
configuración suele resolver consultas y transformaciones cerca de la ruta o
acción que las consume.

No existe una capa única nombrada `repository` o `service` para todo inventario.
Esto no invalida el funcionamiento, pero aumenta el trabajo necesario para:

- localizar todos los consumidores de una tabla o RPC;
- comparar validaciones repetidas;
- confirmar invalidación después de una mutación;
- distinguir lógica compartida de lógica específica de una pantalla.

Los ocho archivos con almacenamiento local se relacionan principalmente con
preferencias del shell, formularios, impresión y capturas operativas. No deben
confundirse con la fuente de verdad de inventario.

---

#### 11. VISO

VISO concentra **97 archivos** con acceso remoto:

- 60 dentro de rutas o páginas;
- 24 en componentes;
- 8 en API internas;
- 5 en `lib`.

Se localizaron 16 archivos de consulta marcados `use client`, uno marcado
`use server` y 80 sin directiva propia.

No se encontró una familia formal de hooks de dominio. Organización,
trabajadores, horarios, permisos, catálogo, menú, CMS y vacantes combinan:

- consultas en componentes de servidor;
- consultas dentro de componentes cliente;
- Server Actions puntuales;
- rutas API;
- utilidades Supabase;
- transformación local para tablas y formularios.

Existe un cliente Supabase `admin`. Su mera presencia no demuestra uso inseguro:
`CODE-AUD-017` deberá confirmar que solo se construya y consuma en servidor.

Los cuatro archivos con persistencia de navegador corresponden a preferencias
del shell y horario. No se consideran fuente de verdad laboral.

---

#### 12. FOGO, NUMERA, ORIGO y PULSO

##### 12.1. FOGO

FOGO tiene 17 archivos con acceso remoto. Las consultas viven principalmente en
páginas, componentes y utilidades Supabase. Los selectores de contexto de receta
transforman la información para la captura, pero no constituyen un estado global
de aplicación.

La configuración local encontrada pertenece principalmente al shell visual.
Las recetas y lotes permanecen respaldados por datos remotos.

##### 12.2. NUMERA

NUMERA tiene 12 archivos con acceso remoto y poco estado local. Gastos,
presupuestos y lecturas analíticas se resuelven cerca de páginas y componentes.
No se localizó un servicio financiero único ni una caché global.

##### 12.3. ORIGO

ORIGO tiene 23 archivos con acceso remoto. Proveedores y órdenes usan Server
Actions explícitas; recepciones y consultas complementarias se distribuyen entre
páginas, componentes y utilidades.

El formulario de recepción usa almacenamiento local. Esa copia sirve al proceso
de captura y no se considera evidencia contable ni entrada de inventario hasta
que el servidor confirme la operación.

##### 12.4. PULSO

PULSO tiene 23 archivos con acceso remoto repartidos entre páginas, componentes,
acciones del módulo POS, API y utilidades.

Se localizaron dos constructores de cliente de navegador:

1. `src/lib/supabase/client.ts`;
2. `src/utils/supabase/client.ts`.

Ambos construyen `createBrowserClient`, pero aceptan combinaciones distintas de
variables de entorno. El cliente de `src/lib` tiene once importaciones
localizadas; no se encontró una importación del cliente de `src/utils`.
`CODE-AUD-014` y `CODE-AUD-015` deberán confirmar si el segundo es legado o
código sin consumidor antes de eliminar o consolidar algo.

La persistencia local localizada corresponde principalmente al shell visual; el
estado de pedidos, importaciones, chat y fidelización continúa siendo remoto.

---

#### 13. SHELL y paquete compartido de contexto

La aplicación SHELL tiene poco estado local y solo dos archivos con señales de
acceso remoto dentro del alcance de esta tarea.

El paquete `packages/os-context` sí expone ayudantes para:

- obtener el contexto efectivo;
- comprobar un permiso efectivo;
- iniciar una simulación de contexto;
- detener una simulación.

Estos ayudantes reciben un cliente Supabase y llaman RPC canónicos. Sin embargo,
la búsqueda transversal no encontró importaciones de `@vento/os-context` en las
aplicaciones actuales.

Estado: **infraestructura implementada con consumidor no localizado**.

No se elimina ni se declara inútil. `CODE-AUD-011` y `CODE-AUD-015` deberán
confirmar si:

- falta integrar el paquete;
- su contrato fue copiado localmente;
- solo funciona como referencia futura;
- existen consumidores fuera de los checkouts revisados.

---

#### 14. Web pública

La web pública tiene:

- un cliente Supabase;
- un archivo con lectura remota de contenido;
- estado local únicamente para interacción visual;
- ninguna capa de servicios empresariales;
- ninguna persistencia local encontrada.

La consulta de CMS y sus transformaciones son suficientes para la publicación
actual. La suscripción sin efecto documentada en `CODE-AUD-003` tampoco tiene
servicio, adaptador ni persistencia asociados.

---

#### 15. TALENTO no desplegado

TALENTO presenta la separación más explícita por servicios:

| Servicio               | Responsabilidad de código                               |
| ---------------------- | ------------------------------------------------------- |
| `vacancies-service`    | vacantes disponibles y detalle                          |
| `profile-service`      | perfil de candidato                                     |
| `applications-service` | postulaciones, etapas, entrevistas, oferta y preingreso |
| `documents-service`    | documentos requeridos                                   |
| `dashboard-service`    | resumen del proceso                                     |

`applications-service` agrupa consultas paralelas, construye mapas por
postulación, transforma filas a una línea de tiempo y llama RPC para postularse,
responder una oferta y confirmar una entrevista.

El `session-context` mantiene autenticación y candidato en la aplicación.

Esta organización es evidencia técnica, no aprobación del producto ni prueba de
despliegue. Continúa como `IMPLEMENTADO_NO_DESPLEGADO` y su diseño futuro
permanece en `CAP-TAL-001` a `CAP-TAL-006`.

---

#### 16. VITAL separado

VITAL tiene una organización propia de aplicación y API:

- el móvil usa `sessionStore`, `onboardingStore`, un hook del flujo diario y
  notificaciones locales;
- la API contiene servicios de onboarding, perfil, nutrición, planificación,
  deporte, resumen, módulos, seguridad, IA, telemetría y notificaciones;
- la API separa un cliente para tablas y otro para RPC.

Esta estructura no se adopta como arquitectura Vento OS. Se conserva únicamente
como inventario del repositorio separado y sin producción comprobada.

---

#### 17. Adaptadores y transformaciones

Se encontraron transformaciones frecuentes para:

- convertir filas de Supabase en modelos de pantalla;
- agrupar registros por entidad;
- normalizar estados y valores opcionales;
- construir payloads de RPC o Edge Functions;
- convertir formularios a datos persistibles;
- dar formato a fechas, cantidades, dinero y unidades;
- serializar y recuperar cachés;
- construir mapas, listas y árboles para navegación;
- traducir estados técnicos a etiquetas visibles.

La mayoría no vive en archivos llamados `adapter`. Está embebida en:

- páginas;
- Server Actions;
- hooks;
- componentes;
- utilidades;
- servicios de TALENTO y VITAL.

Por eso esta tarea no declara una capa de adaptadores existente. Declara
**responsabilidades de adaptación dispersas** que `CODE-AUD-014` comparará antes
de una remodelación.

---

#### 18. Límites de esta tarea

Este inventario no demuestra:

- que toda consulta se ejecute;
- que una consulta encontrada tenga permisos reales;
- que una tabla esté expuesta al Data API;
- que RLS autorice correctamente cada fila;
- que un cliente marcado para servidor nunca llegue al navegador;
- que una caché se invalide en todos los caminos;
- que un hook tenga un consumidor;
- que dos funciones parecidas sean duplicadas;
- que una transformación preserve todos los datos;
- que el checkout local coincida con producción.

La configuración vigente de Supabase puede exigir exposición y permisos
explícitos para tablas y funciones. Por eso el código cliente no prueba acceso
real; `CODE-AUD-006` y `CODE-AUD-017` revisarán contrato, grants y RLS.

---

#### 19. Hallazgos y destinos

| ID               | Hallazgo                                                                   | Destino                      |
| ---------------- | -------------------------------------------------------------------------- | ---------------------------- |
| `H-CODE-004-001` | 430 archivos contienen señales de acceso remoto                            | `CODE-AUD-005`, `006`, `020` |
| `H-CODE-004-002` | NEXO y VISO concentran 225 de esos 430 archivos                            | `CODE-AUD-005`, `006`, `019` |
| `H-CODE-004-003` | no existe una estrategia transversal de consultas o estado                 | `CODE-AUD-018`, `020`        |
| `H-CODE-004-004` | ANIMA conserva colas de asistencia en `SecureStore`                        | `CODE-AUD-018`               |
| `H-CODE-004-005` | PASS combina contextos, variables de módulo y cachés manuales              | `CODE-AUD-014`, `018`        |
| `H-CODE-004-006` | PULSO tiene dos constructores web y uno no tiene importaciones localizadas | `CODE-AUD-014`, `015`        |
| `H-CODE-004-007` | `@vento/os-context` no tiene consumidores localizados                      | `CODE-AUD-011`, `015`        |
| `H-CODE-004-008` | TALENTO tiene servicios de dominio sin producto desplegado                 | `CAP-TAL-001..006`           |
| `H-CODE-004-009` | VITAL tiene servicios propios, pero permanece fuera de Vento OS            | conservar separado           |
| `H-CODE-004-010` | ANIMA y PASS consultan directamente desde código móvil                     | `CODE-AUD-005`, `017`        |
| `H-CODE-004-011` | adaptaciones y normalizaciones están dispersas                             | `CODE-AUD-014`, `020`        |
| `H-CODE-004-012` | NEXO y VISO mezclan acceso remoto en servidor y cliente                    | `CODE-AUD-005`, `017`        |
| `H-CODE-004-013` | el cliente `admin` de VISO requiere verificar límites de servidor          | `CODE-AUD-017`               |
| `H-CODE-004-014` | almacenamiento local mezcla preferencias, borradores, caché y colas        | `CODE-AUD-014`, `018`        |

Todos los destinos ya existen. No se crean preguntas ni tareas redundantes.

---

#### 20. Comprobaciones técnicas posteriores

Estas comprobaciones quedan asignadas al asistente:

1. identificar cada Server Action, API route, RPC, Edge Function y job;
2. vincular cada consulta con tabla, vista, Storage o función;
3. confirmar consumidores de hooks, servicios y paquete compartido;
4. comparar los dos clientes web de PULSO;
5. comprobar que el cliente `admin` de VISO sea solo de servidor;
6. revisar limpieza de caché y almacenamiento al cerrar sesión;
7. comprobar invalidación después de guardar;
8. probar colas, reintentos y concurrencia en entornos autorizados;
9. comparar transformaciones repetidas antes de proponer consolidación;
10. revisar exposición, grants y RLS desde `vento-shell`.

No requieren una respuesta del usuario en esta fase.

---

#### 21. Regla de seguridad

Las siguientes tareas:

1. no crearán datos productivos sin autorización expresa;
2. no ejecutarán pagos, asistencia, pedidos ni movimientos reales;
3. mantendrán las comprobaciones Supabase VENTO en `vento-shell`;
4. distinguirán lectura estática de prueba operativa;
5. no moverán lógica entre repositorios durante descubrimiento;
6. no adoptarán TALENTO o VITAL por el solo hecho de que exista código;
7. no crearán AURA ni le atribuirán servicios inexistentes.

---

#### 22. Decisiones propuestas

1. Se adopta el inventario de 86 archivos con hooks definidos.
2. Los 430 archivos de acceso remoto son señales, no contratos validados.
3. Los 285 archivos de estado local no constituyen una única fuente de verdad.
4. Las 606 señales de transformación no se presentan como adaptadores formales.
5. ANIMA y PASS conservan su arquitectura móvil actual durante la auditoría.
6. TALENTO conserva sus servicios como base futura no desplegada.
7. VITAL permanece separado.
8. Los clientes web y servidor de Next.js no se tratan como duplicados
   automáticamente.
9. Los dos clientes web de PULSO sí quedan como candidato de duplicación.
10. `@vento/os-context` queda como infraestructura sin consumidor localizado.
11. No se prescribe todavía una librería global de estado o consultas.
12. Las adaptaciones dispersas se compararán antes de consolidarlas.
13. Las comprobaciones técnicas no se convierten en preguntas al usuario.
14. Los catorce hallazgos continúan en tareas existentes.
15. `CODE-AUD-005` será la única continuidad inmediata.

---

#### 23. Criterios de aceptación

`CODE-AUD-004` podrá aprobarse cuando:

- hooks, servicios, adaptadores, consultas y estado local estén diferenciados;
- los conteos se interpreten como archivos con señales;
- la ubicación del acceso remoto quede visible por repositorio;
- ANIMA y PASS permanezcan como aplicaciones móviles;
- NEXO y VISO conserven su concentración documentada;
- PULSO conserve el candidato de doble cliente;
- `@vento/os-context` no se declare consumido sin evidencia;
- TALENTO no se presente como producto desplegado;
- VITAL permanezca separado;
- AURA no reciba arquitectura ficticia;
- caché local y fuente de verdad remota no se confundan;
- no se declare seguridad por la existencia de un cliente o consulta;
- los hallazgos tengan destino;
- no se creen preguntas técnicas innecesarias;
- `CODE-AUD-005` permanezca como única continuidad.

---

#### 24. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
acción de usuario
        ↓
hook, estado, servicio o consulta
        ↓
cliente y transformación
        ↓
contrato de servidor todavía por inventariar
```

La continuidad será:

```text
CODE-AUD-005
— Inventariar Server Actions, API routes, RPC, Edge Functions y jobs
```


### ✅ CODE-AUD-005 — Inventariar Server Actions, API routes, RPC, Edge Functions y jobs

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** inventario contrastado de contratos de servidor, automatización y despliegue
**Dependencia anterior:** `CODE-AUD-004`
**Continuidad reservada:** `CODE-AUD-006`
**Fecha de corte:** 2026-07-23
**Proyecto Supabase comprobado:** `vento-os-dev` (`clzdpinthhtknkmefsxx`)
**Cambios en código o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea conecta la lógica localizada en `CODE-AUD-004` con las fronteras que
pueden ejecutar comportamiento fuera de la pantalla:

```text
pantalla, hook o componente
        ↓
Server Action o API
        ↓
RPC, Edge Function o servicio externo
        ↓
job, cron o disparador
        ↓
datos y efectos que CODE-AUD-006 vinculará
```

El inventario confirmó:

| Elemento                                       |    Resultado |
| ---------------------------------------------- | -----------: |
| archivos con Server Actions                    |      **101** |
| API routes Next.js                             |       **20** |
| métodos HTTP declarados en esas rutas          |       **24** |
| endpoints auxiliares de ANIMA y PASS           |        **8** |
| archivos consumidores de RPC                   |      **105** |
| nombres RPC literales únicos consumidos        |       **93** |
| nombres RPC consumidos que existen remotamente | **93 de 93** |
| Edge Functions activas remotas                 |       **24** |
| Edge Functions locales únicas                  |       **29** |
| jobs `pg_cron` activos remotos                 |        **7** |
| workflows GitHub localizados                   |        **5** |

VITAL se conserva separado: su API propia contiene 15 módulos de rutas, 37
condiciones de endpoint y un `health`, pero no se incorpora a los totales de API
de Vento OS.

No se invocó ninguna Server Action, API, RPC, Edge Function, webhook, cron ni
workflow.

---

#### 2. Estados usados

| Estado           | Significado                                              |
| ---------------- | -------------------------------------------------------- |
| `LOCAL`          | el contrato existe en un checkout revisado               |
| `CONSUMIDO`      | existe una referencia desde otra parte del código        |
| `REMOTO_ACTIVO`  | Supabase informa despliegue activo                       |
| `LOCAL_Y_REMOTO` | existe en código local y como despliegue remoto          |
| `SOLO_LOCAL`     | existe código, pero no aparece desplegado                |
| `SOLO_REMOTO`    | aparece desplegado, pero no existe fuente local canónica |
| `PROGRAMADO`     | existe job activo con calendario                         |
| `DESHABILITADO`  | existe definición, pero declara no ejecutar trabajo      |
| `POR_PROBAR`     | contrato localizado sin ejecución operativa              |

`REMOTO_ACTIVO` significa que la plataforma reporta una función activa. No
demuestra que su lógica termine correctamente ni que tenga autorización
suficiente.

---

#### 3. Fuentes y regla de contraste

Se usaron:

1. código fuente de los doce repositorios;
2. directivas `use server`;
3. rutas `app/api/**/route.*`;
4. endpoints auxiliares bajo directorios `api`;
5. llamadas `.rpc(...)` con nombre literal;
6. llamadas `functions.invoke(...)` y URLs de Edge Functions;
7. `vento-shell/supabase/functions`;
8. `vento-pass/supabase/functions`;
9. `vento-shell/supabase/config.toml`;
10. `vento-shell/schema_public_current.sql`;
11. migraciones canónicas de `vento-shell`;
12. metadatos remotos de `vento-os-dev` obtenidos mediante consultas de solo
    lectura;
13. workflows bajo `.github/workflows`.

Se excluyeron builds, documentación, cachés, `node_modules`, artefactos
generados y el proyecto Supabase `petapetit`.

Los nombres dinámicos de RPC o funciones no pueden extraerse con la misma
certeza que los literales. Los conteos son un mínimo reproducible.

---

#### 4. Server Actions

Se encontraron 101 archivos que contienen una directiva `use server`, ya sea a
nivel de módulo o dentro de una acción.

| Aplicación                                | Archivos | Familias principales                                                            |
| ----------------------------------------- | -------: | ------------------------------------------------------------------------------- |
| FOGO                                      |        3 | recetas y lotes de producción                                                   |
| NEXO                                      |       42 | inventario, catálogo, remisiones, conteos, activos, ubicaciones y configuración |
| NUMERA                                    |        2 | gastos y centros de costo                                                       |
| ORIGO                                     |        5 | proveedores, órdenes, recepciones y revisión de producto                        |
| PULSO                                     |        7 | importaciones, pedidos, identificación y fidelización                           |
| SHELL                                     |        1 | cierre de sesión                                                                |
| VISO                                      |       41 | organización, personal, horarios, permisos, productos, comercio, CMS y vacantes |
| ANIMA, PASS, TALENTO, web pública y VITAL |        0 | no usan Server Actions de Next.js                                               |
| **Total**                                 |  **101** |                                                                                 |

NEXO y VISO reúnen **83 de los 101 archivos**.

##### 4.1. NEXO

Los 42 archivos se distribuyen así:

- 11 de configuración general de inventario;
- 8 de remisiones y su configuración;
- 6 de activos;
- 5 de catálogo y presentaciones;
- 5 de ubicaciones;
- 2 de existencias;
- 1 de conteo inicial;
- 1 de entradas;
- 1 de traslados;
- 1 de retiro;
- 1 de centro de costo.

Hay acciones tanto en archivos `actions.ts` como dentro de páginas. El nombre
del archivo no determina por sí solo autorización, transacción o idempotencia.

##### 4.2. VISO

Los 41 archivos cubren:

- empresas, sedes, horarios comerciales y excepciones;
- trabajadores, perfiles, dispositivos y horarios;
- permisos y navegación;
- productos, menú, disponibilidad y colecciones;
- tarifas de entrega;
- CMS de sedes, bloques y elementos;
- vacantes;
- reprogramación y resolución de pedidos.

VISO también mezcla acciones dentro de páginas y componentes. `CODE-AUD-017`
revisará que toda operación privilegiada valide en servidor y no confíe en
estado del cliente.

##### 4.3. Aplicaciones menores

- FOGO guarda recetas y lotes;
- NUMERA registra gastos y administra centros de costo;
- ORIGO administra proveedores, órdenes y recepciones;
- PULSO procesa importaciones, estados de pedido y acciones POS;
- SHELL solo contiene la acción de cierre de sesión.

---

#### 5. API routes Next.js

##### 5.1. NEXO

| Ruta                                      | Métodos                 |
| ----------------------------------------- | ----------------------- |
| `/api/printing/layouts`                   | `GET`, `POST`, `DELETE` |
| `/api/labelary`                           | `POST`                  |
| `/api/inventory/stock/export-by-loc`      | `GET`                   |
| `/api/inventory/count-initial`            | `POST`                  |
| `/api/inventory/count-initial/approve`    | `POST`                  |
| `/api/inventory/movements/export`         | `GET`                   |
| `/api/inventory/lpns`                     | `GET`                   |
| `/api/inventory/adjust`                   | `POST`                  |
| `/api/inventory/locations`                | `GET`                   |
| `/api/inventory/catalog/export-suppliers` | `GET`                   |
| `/api/inventory/catalog/upload-image`     | `POST`                  |

Total: 11 rutas y 13 métodos declarados.

##### 5.2. VISO

| Ruta                                        | Métodos          |
| ------------------------------------------- | ---------------- |
| `/api/health`                               | `GET`            |
| `/api/viso/staff-schedule-shifts`           | `POST`, `DELETE` |
| `/api/viso/staff-schedule-hidden-employees` | `POST`, `DELETE` |
| `/api/viso/upload-website-media`            | `POST`           |
| `/api/viso/upload-logo`                     | `POST`           |
| `/api/viso/upload-product-image`            | `POST`           |
| `/api/viso/upload-commercial-menu-image`    | `POST`           |
| `/api/viso/attendance-report`               | `GET`            |
| `/api/viso/menu/reorder`                    | `POST`           |

Total: 9 rutas y 11 métodos declarados.

Las rutas de carga, ajuste, aprobación, exportación y reordenamiento quedan
marcadas `POR_PROBAR`. Su autorización y validación pertenecen a
`CODE-AUD-017`.

---

#### 6. Endpoints auxiliares de aplicaciones móviles

##### 6.1. ANIMA

| Superficie            | Endpoint                 | Propósito              |
| --------------------- | ------------------------ | ---------------------- |
| `web-auth`            | `request-password.js`    | solicitar recuperación |
| `web-auth`            | `set-password.js`        | establecer contraseña  |
| `employee-wallet-api` | `employee-apple-pass.js` | generar pase laboral   |

##### 6.2. PASS

| Superficie        | Endpoint                      | Propósito             |
| ----------------- | ----------------------------- | --------------------- |
| `wallet-pass-api` | `apple-pass.js`               | generar pase          |
| `wallet-pass-api` | `employee-apple-pass.js`      | generar pase laboral  |
| `wallet-pass-api` | `request-account-deletion.js` | solicitar eliminación |
| `wallet-pass-api` | `wallet/[...slug].js`         | rutas Wallet          |
| `wallet-pass-api` | `wallet/notify.js`            | actualización Wallet  |

Son ocho endpoints auxiliares. No convierten ANIMA ni PASS en aplicaciones web.

La coexistencia de endpoints Wallet y Edge Functions Wallet queda como posible
duplicación para `CODE-AUD-014`; esta tarea no decide aún cuál es el contrato
vigente.

---

#### 7. API separada de VITAL

VITAL contiene:

- 15 módulos `*Routes.js`;
- 37 condiciones explícitas de endpoint;
- un endpoint `/health`;
- controladores y servicios propios;
- acceso a Supabase mediante clientes HTTP para tablas y RPC.

| Módulo           | Condiciones de endpoint |
| ---------------- | ----------------------: |
| IA               |                       3 |
| hoy              |                       5 |
| módulos          |                       3 |
| notificaciones   |                       3 |
| nutrición        |                       4 |
| onboarding       |                       1 |
| planificación    |                       2 |
| perfil           |                       2 |
| seguridad        |                       2 |
| perfil deportivo |                       2 |
| staff            |                       3 |
| inicio           |                       2 |
| resumen          |                       1 |
| telemetría       |                       3 |
| wear             |                       1 |
| **Total**        |                  **37** |

Permanece `IMPLEMENTADO_NO_DESPLEGADO` y fuera de Vento OS.

---

#### 8. Consumidores RPC

Se encontraron 105 archivos que llaman `.rpc(...)` y 93 nombres literales
únicos. La consulta remota confirmó que **los 93 nombres existen actualmente**
en alguno de los esquemas empresariales revisados.

| Repositorio                      | Archivos consumidores | RPC únicos |
| -------------------------------- | --------------------: | ---------: |
| ANIMA                            |                     8 |         10 |
| FOGO                             |                     8 |          8 |
| NEXO                             |                    25 |         39 |
| NUMERA                           |                     5 |          4 |
| ORIGO                            |                    10 |          8 |
| PASS                             |                    12 |         12 |
| PULSO                            |                    16 |         15 |
| SHELL                            |                     2 |          5 |
| TALENTO                          |                     2 |          4 |
| VISO                             |                    17 |         14 |
| web pública                      |                     0 |          0 |
| **Total de archivos**            |               **105** |            |
| **Nombres únicos transversales** |                       |     **93** |

##### 8.1. ANIMA

`anima_diagnostic_employee_push_tokens`,
`anima_diagnostic_push_token_coverage`, `employee_wallet_eligibility`,
`end_attendance_break`, `has_permission`, `reconcile_staff_invitations`,
`register_shift_departure_event`,
`register_shift_departure_event_autoclose`, `start_attendance_break` y
`sync_attendance_events`.

##### 8.2. FOGO

`attach_shared_device_action_signature_target`, `current_employee_area_id`,
`current_employee_site_id`, `current_shared_operational_device_v1`,
`fogo_recipe_area_options`, `has_operational_role_permission`,
`has_permission` y `sign_shared_device_action`.

##### 8.3. NEXO

NEXO usa 39 RPC para:

- sesiones y ajustes de conteo;
- aplicación masiva de configuración maestra;
- recibo, despacho, valoración y reversión de reposición;
- asignación y consumo de existencias;
- remisiones;
- posiciones y ubicaciones;
- contexto y permisos operativos;
- firma en dispositivo compartido;
- documentos POS internos;
- resumen y sincronización de solicitudes.

Los nombres completos quedan conservados por la búsqueda reproducible del corte;
los de mayor sensibilidad incluyen
`apply_inventory_count_adjustments`,
`apply_restock_receipt`,
`confirm_remission_shipment_receipt`,
`consume_inventory_stock_from_positions`,
`generate_manual_daily_internal_pos_documents`,
`reverse_restock_request` y
`upsert_inventory_stock_by_location`.

##### 8.4. NUMERA y ORIGO

NUMERA usa `current_shared_operational_device_v1`,
`has_operational_role_permission`, `has_permission` y
`numera_current_period_summary`.

ORIGO usa `attach_shared_device_action_signature_target`,
`current_shared_operational_device_v1`,
`has_operational_role_permission`, `has_permission`,
`origo_mark_inventory_entry_corrected`,
`origo_reverse_inventory_entry`, `sign_shared_device_action` y
`upsert_inventory_stock_by_location`.

##### 8.5. PASS

`can_access_beta`, `create_gift_aware_scheduled_order_checkout_draft`,
`ensure_order_conversation`, `get_client_order_chat_unread_counts`,
`get_my_membership`, `get_my_total_earned_points`, `get_my_wallet`,
`get_order_delivery_pin`, `get_order_delivery_slots`,
`get_site_order_status`, `list_my_wallet_ledger` y
`mark_order_conversation_read`.

##### 8.6. PULSO

`archive_finished_order_conversations`,
`attach_shared_device_action_signature_target`,
`award_loyalty_points_external`, `create_order_delivery_courier_link`,
`current_shared_operational_device_v1`,
`get_staff_order_chat_unread_counts`,
`has_operational_role_permission`, `has_permission`,
`mark_order_conversation_read`,
`override_order_delivery_confirmation`,
`pulso_post_daily_sales_import`, `set_order_conversation_archived`,
`sign_shared_device_action`, `update_order_gift_operational_state` y
`update_order_operational_state`.

##### 8.7. SHELL, TALENTO y VISO

SHELL usa `get_effective_context_v1`, `has_effective_permission_v1`,
`has_permission`, `start_context_simulation_v1` y
`stop_context_simulation_v1`.

TALENTO usa `bootstrap_my_candidate`, `confirm_interview`,
`respond_to_offer` y `submit_application`.

VISO usa 14 RPC de permisos, dispositivos compartidos, Wallet laboral,
reprogramación de pedidos, navegación, PIN, perfil operativo, puntos de
asistencia, roles de sede y tablero contable.

Que los 93 nombres existan no demuestra:

- permiso `EXECUTE`;
- exposición al Data API;
- autorización por actor;
- parámetros correctos;
- resultado correcto;
- idempotencia.

---

#### 9. Funciones PostgreSQL remotas

La consulta de metadatos remotos encontró:

| Esquema                         | Funciones | `SECURITY DEFINER` | funciones de trigger |
| ------------------------------- | --------: | -----------------: | -------------------: |
| `public`                        |       246 |                164 |                   60 |
| `pass`                          |        30 |                 27 |                   11 |
| `talento`                       |        16 |                 11 |                    1 |
| `vital`                         |        47 |                  5 |                    1 |
| `club`                          |         7 |                  2 |                    0 |
| `app_private`                   |         1 |                  1 |                    0 |
| **Total en esquemas revisados** |   **347** |            **210** |               **73** |

Estas 347 funciones no equivalen a 347 RPC públicas. Incluyen ayudantes,
funciones de trigger y contratos internos.

La cantidad de `SECURITY DEFINER` se registra como superficie que exige
auditoría, no como vulnerabilidad confirmada. `CODE-AUD-017` revisará:

- propietario;
- `search_path`;
- permisos `EXECUTE`;
- autenticación interna;
- autorización por empresa, sede, rol y fila;
- exposición real.

---

#### 10. Deriva del snapshot SQL local

`schema_public_current.sql` contiene 157 declaraciones de función pública y su
último commit localizado es del 25 de junio de 2026.

El remoto contiene actualmente 246 funciones en `public`.

```text
snapshot local: 157
remoto actual:  246
diferencia:      89
```

Esto no significa que falten 89 migraciones: algunas pueden existir en
migraciones posteriores sin haberse regenerado el snapshot. Sí significa que
el archivo llamado `schema_public_current.sql` **no puede tratarse como snapshot
actual completo** hasta reconciliarlo en `CODE-AUD-006`.

---

#### 11. Edge Functions remotas

Supabase reporta 24 funciones `ACTIVE`.

| Edge Function               | `verify_jwt` | Fuente localizada | Consumidor o activador localizado |
| --------------------------- | ------------ | ----------------- | --------------------------------- |
| `wallet-pass`               | sí           | SHELL             | PASS y APIs Wallet                |
| `attendance-report`         | sí           | SHELL             | ANIMA y VISO                      |
| `staff-invitations-create`  | sí           | SHELL             | ANIMA y VISO                      |
| `staff-invitations-accept`  | no           | SHELL             | enlace de invitación              |
| `document-alerts`           | no           | SHELL             | cron y documentos ANIMA           |
| `request-account-deletion`  | sí           | SHELL             | PASS auxiliar                     |
| `account-deletion`          | sí           | SHELL             | ANIMA y PASS                      |
| `process-account-deletions` | no           | SHELL             | GitHub Actions                    |
| `register-push-token`       | no           | SHELL             | ANIMA y PASS                      |
| `announcement-notify`       | no           | SHELL             | ANIMA                             |
| `employee-delete`           | no           | SHELL             | ANIMA                             |
| `payments-create-intent`    | sí           | SHELL             | PASS                              |
| `payments-webhook`          | no           | SHELL             | proveedor de pagos                |
| `staff-invitations-resend`  | no           | SHELL             | ANIMA                             |
| `staff-invitations-cancel`  | no           | SHELL             | ANIMA                             |
| `shift-publish-notify`      | sí           | SHELL             | ANIMA y función de base           |
| `shift-runtime-processor`   | no           | SHELL             | cron                              |
| `pass-delivery-quote`       | sí           | SHELL             | PASS                              |
| `pass-address-search`       | sí           | SHELL             | PASS                              |
| `support-message-notify`    | sí           | SHELL             | trigger de soporte                |
| `payments-return`           | no           | SHELL             | retorno del proveedor             |
| `pass-register-push-token`  | sí           | PASS              | PASS                              |
| `order-message-notify`      | sí           | PASS              | PULSO                             |
| `delivery-portal`           | no           | **solo remoto**   | enlace de domiciliario            |

Resultado:

- 12 exigen JWT de plataforma;
- 12 no lo exigen;
- las 24 están activas;
- la versión activa más reciente no se asume igual al checkout local.

Una función con `verify_jwt = false` puede necesitar esa configuración para
webhook, cron o enlace firmado. Su seguridad depende entonces de controles
propios que se comprobarán en `CODE-AUD-017`.

---

#### 12. Comparación local contra remoto de Edge Functions

Se localizaron 27 directorios en `vento-shell` y 2 en `vento-pass`: 29 nombres
locales únicos.

```text
local y remoto: 23
solo local:       6
solo remoto:      1
```

##### 12.1. Solo local

- `club-revenuecat-webhook`;
- `club-settle-booster`;
- `club-sync-earn-events`;
- `employee-apple-pass`;
- `employee-wallet-pass`;
- `employee-wallet-sync-eligibility`.

No se declaran fallidas. Se clasifican `SOLO_LOCAL` hasta confirmar si son
desarrollo futuro, reemplazo, función retirada o despliegue faltante.

##### 12.2. Solo remoto

`delivery-portal` está activa en versión 1 y no tiene directorio local canónico.
Su código remoto:

- sirve una página HTML para el domiciliario;
- consulta el pedido mediante token;
- cambia recogida, tránsito, entrega o novedad;
- usa un cliente con `service_role`;
- llama `get_delivery_portal_data_by_token` y
  `update_delivery_portal_state`;
- tiene `verify_jwt = false`.

No se copia automáticamente desde remoto ni se elimina. Primero debe quedar
versionada en `vento-shell` y auditarse el contrato de token en
`CODE-AUD-017`.

##### 12.3. Configuración no representada localmente

El remoto marca `verify_jwt = false` para `payments-return` y
`delivery-portal`, pero `vento-shell/supabase/config.toml` no contiene bloques
para esas dos funciones.

El mismo archivo sí contiene un bloque sin JWT para
`club-revenuecat-webhook`, que actualmente es `SOLO_LOCAL`.

La configuración local no representa por completo el estado remoto.

---

#### 13. Jobs `pg_cron` activos

La consulta remota encontró siete jobs activos. No se leyeron sus comandos para
evitar exponer secretos.

| Job                                                  | Calendario    | Propósito inferido por nombre   |
| ---------------------------------------------------- | ------------- | ------------------------------- |
| `document-alerts-daily`                              | `0 14 * * *`  | alertas documentales            |
| `auto-close-attendance`                              | `59 4 * * *`  | cierre de asistencia            |
| `anima_shift_runtime_processor_every_5m`             | `*/5 * * * *` | procesador de turnos            |
| `pass_delivery_quotes_cleanup_hourly`                | `17 * * * *`  | limpiar cotizaciones            |
| `anima_attendance_day_end_close_0005`                | `5 0 * * *`   | cierre diario                   |
| `attendance_stale_open_shift_autoclose_daily_bogota` | `10 5 * * *`  | cerrar turnos abiertos antiguos |
| `pass_payment_checkout_expiry_reconciliation`        | `*/5 * * * *` | reconciliar pagos vencidos      |

Cinco nombres aparecen en migraciones canónicas:

- `anima_shift_runtime_processor_every_5m`;
- `pass_delivery_quotes_cleanup_hourly`;
- `anima_attendance_day_end_close_0005`;
- `attendance_stale_open_shift_autoclose_daily_bogota`;
- `pass_payment_checkout_expiry_reconciliation`.

Dos jobs activos no tienen definición localizada por nombre en las migraciones:

- `document-alerts-daily`;
- `auto-close-attendance`.

La migración local define además
`purge_inventory_form_drafts_daily`, pero ese job no aparece activo en remoto.

Los tres casos continúan a reconciliación; no se crean ni eliminan jobs durante
esta auditoría.

---

#### 14. GitHub Actions

| Repositorio | Workflow                                | Activación            | Estado observado             |
| ----------- | --------------------------------------- | --------------------- | ---------------------------- |
| NEXO        | `tmp-apply-privileged-request-area.yml` | manual y pull request | temporal por nombre          |
| PASS        | `apply-electronic-billing-ui.yml`       | manual                | declarado `disabled`         |
| PASS        | `process-account-deletions.yml`         | diario y manual       | worker programado            |
| PULSO       | `apply-electronic-billing-ui.yml`       | manual                | declarado `disabled`         |
| VISO        | `apply-guided-product-form.yml`         | push                  | aplica transformación guiada |

La existencia del workflow no prueba que tenga secretos vigentes, ejecuciones
exitosas o que deba conservarse. `CODE-AUD-007`, `CODE-AUD-009`,
`CODE-AUD-013` y `CODE-AUD-015` revisarán su propósito, historial y consumidor.

---

#### 15. Disparadores que llaman servicios

La base remota contiene funciones con `net.http_post` para:

- `notify_shift_published`;
- `notify_support_message_inserted`;
- `run_shift_runtime_processor`.

Entre los triggers activos se confirmó:

| Tabla                     | Trigger                                | Función                           |
| ------------------------- | -------------------------------------- | --------------------------------- |
| `public.support_messages` | `trg_support_messages_notify_inserted` | `notify_support_message_inserted` |

No se encontró un trigger activo asociado a `notify_shift_published` en el
metadato consultado. ANIMA sí contiene referencias directas a
`shift-publish-notify`, por lo que el flujo puede haber cambiado de activador.
`CODE-AUD-006` deberá reconstruir el evento efectivo antes de declarar código
huérfano.

`run_shift_runtime_processor` corresponde al frente programado por cron, no a
un trigger de tabla.

---

#### 16. Fronteras de autorización

Esta tarea separa:

| Control              | Qué puede demostrar                       |
| -------------------- | ----------------------------------------- |
| `use server`         | ejecución en servidor                     |
| API route            | existencia de endpoint HTTP               |
| RPC existente        | función PostgreSQL localizada             |
| `verify_jwt = true`  | validación de JWT en la puerta de Edge    |
| `verify_jwt = false` | ausencia de esa validación automática     |
| `SECURITY DEFINER`   | ejecución con privilegios del propietario |
| job activo           | programación registrada                   |

Ninguno demuestra por sí solo autorización empresarial completa.

Las revisiones siguientes deberán comprobar:

- identidad del actor;
- empresa, sede, rol y alcance;
- validación de parámetros;
- RLS y permisos `EXECUTE`;
- uso de `service_role`;
- firma de webhook, secreto de cron o token de enlace;
- protección contra reintentos;
- trazabilidad del resultado.

---

#### 17. Lo que no se concluye todavía

Este inventario no afirma:

- que los 101 archivos de Server Actions funcionen;
- que las 20 API routes estén desplegadas;
- que los 93 RPC sean ejecutables por cualquier actor;
- que las 210 funciones `SECURITY DEFINER` sean vulnerables;
- que toda Edge Function sin JWT sea pública sin control;
- que una Edge Function activa tenga tráfico;
- que los siete cron hayan terminado correctamente;
- que un workflow haya corrido;
- que una función solo local deba desplegarse;
- que una función solo remota deba eliminarse;
- que VITAL esté en producción;
- que AURA tenga backend.

---

#### 18. Hallazgos y destinos

| ID               | Hallazgo                                                                 | Destino                      |
| ---------------- | ------------------------------------------------------------------------ | ---------------------------- |
| `H-CODE-005-001` | existen 101 archivos con Server Actions                                  | `CODE-AUD-017`, `019`        |
| `H-CODE-005-002` | NEXO y VISO concentran 83 de 101                                         | `CODE-AUD-017`, `019`, `020` |
| `H-CODE-005-003` | existen 20 API routes Next y 8 endpoints auxiliares                      | `CODE-AUD-006`, `017`        |
| `H-CODE-005-004` | los 93 nombres RPC consumidos existen remotamente                        | `CODE-AUD-006`, `017`        |
| `H-CODE-005-005` | existen 347 funciones en los esquemas revisados y 210 `SECURITY DEFINER` | `CODE-AUD-017`               |
| `H-CODE-005-006` | el snapshot local tiene 157 funciones públicas frente a 246 remotas      | `CODE-AUD-006`, `020`        |
| `H-CODE-005-007` | hay 24 Edge Functions activas: 12 con JWT y 12 sin JWT                   | `CODE-AUD-017`               |
| `H-CODE-005-008` | seis Edge Functions existen solo localmente                              | `CODE-AUD-011`, `015`, `020` |
| `H-CODE-005-009` | `delivery-portal` existe solo en remoto y usa `service_role` con token   | `CODE-AUD-006`, `017`, `020` |
| `H-CODE-005-010` | dos configuraciones remotas sin JWT no aparecen en `config.toml`         | `CODE-AUD-006`, `017`        |
| `H-CODE-005-011` | dos cron activos no tienen definición localizada en migraciones          | `CODE-AUD-006`, `011`        |
| `H-CODE-005-012` | un cron definido localmente no aparece activo en remoto                  | `CODE-AUD-006`, `011`        |
| `H-CODE-005-013` | cinco workflows incluyen uno temporal y dos deshabilitados               | `CODE-AUD-009`, `013`, `015` |
| `H-CODE-005-014` | eliminación de cuentas depende de Edge Function y GitHub Actions         | `CODE-AUD-018`, `019`        |
| `H-CODE-005-015` | soporte dispara notificación desde trigger de base                       | `CODE-AUD-006`, `018`        |
| `H-CODE-005-016` | el activador efectivo de `shift-publish-notify` debe reconstruirse       | `CODE-AUD-006`, `015`        |
| `H-CODE-005-017` | Wallet y eliminación tienen contratos en más de una superficie           | `CODE-AUD-014`, `019`        |
| `H-CODE-005-018` | VITAL conserva 37 endpoints separados y sin producción comprobada        | conservar separado           |

Todos los destinos ya existen. No se crean preguntas ni tareas redundantes.

---

#### 19. Comprobaciones técnicas posteriores

Quedan asignadas al asistente:

1. vincular Server Actions y API routes con tablas, Storage y RPC;
2. obtener firmas, esquemas y permisos de los 93 RPC consumidos;
3. reconciliar `schema_public_current.sql` con el remoto;
4. revisar las 210 funciones `SECURITY DEFINER`;
5. comparar hash y fuente local/remota de las 23 Edge Functions compartidas;
6. versionar o explicar `delivery-portal`;
7. clasificar las seis Edge Functions solo locales;
8. revisar autenticación interna de las doce funciones sin JWT;
9. reconciliar los tres jobs con deriva;
10. revisar historial y propósito de los cinco workflows;
11. reconstruir activadores de notificaciones y turnos;
12. identificar contratos duplicados de Wallet y eliminación;
13. comprobar reintentos e idempotencia sin usar producción;
14. mantener todo cambio Supabase VENTO en `vento-shell`.

No requieren respuesta del usuario en esta fase.

---

#### 20. Regla de seguridad

Las tareas posteriores:

1. no invocarán funciones productivas sin autorización expresa;
2. no dispararán cron o workflows;
3. no probarán webhooks de pagos con transacciones reales;
4. no crearán asistencia, inventario, compras, pedidos o pagos;
5. no copiarán secretos desde comandos de cron;
6. no desplegarán funciones solo locales automáticamente;
7. no eliminarán funciones solo remotas;
8. usarán `vento-shell` para cualquier acción Supabase VENTO;
9. distinguirán metadato remoto de validación operativa.

---

#### 21. Decisiones propuestas

1. Se adopta el inventario de 101 archivos con Server Actions.
2. Se adoptan 20 API routes Next.js y 8 endpoints auxiliares.
3. ANIMA y PASS continúan siendo aplicaciones móviles.
4. Los 93 RPC literales quedan confirmados como existentes, no autorizados.
5. Las 347 funciones de los esquemas revisados son inventario remoto, no API
   pública.
6. Las 210 funciones `SECURITY DEFINER` pasan a auditoría de seguridad.
7. `schema_public_current.sql` queda marcado como snapshot desactualizado.
8. Las 24 Edge Functions se clasifican por estado local/remoto.
9. Las doce funciones sin JWT no se declaran vulnerables sin revisar su control
   propio.
10. `delivery-portal` debe recuperar fuente canónica antes de remodelar.
11. Las seis funciones solo locales no se despliegan por inferencia.
12. Los tres casos de deriva cron se reconcilian sin mutaciones durante
    descubrimiento.
13. Los workflows deshabilitados o temporales permanecen visibles.
14. VITAL conserva su API fuera de Vento OS.
15. AURA permanece sin backend.
16. Los dieciocho hallazgos continúan en tareas existentes.
17. No se crean preguntas para comprobaciones técnicas.
18. `CODE-AUD-006` será la única continuidad inmediata.

---

#### 22. Criterios de aceptación

`CODE-AUD-005` podrá aprobarse cuando:

- Server Actions estén diferenciadas de API routes;
- endpoints auxiliares no conviertan móviles en web;
- VITAL permanezca separado;
- los RPC consumidos estén contrastados con remoto;
- existencia no se confunda con permiso;
- funciones PostgreSQL internas no se presenten como RPC públicas;
- Edge Functions locales y remotas estén reconciliadas por estado;
- JWT de plataforma no se confunda con autorización completa;
- jobs de cron queden inventariados sin leer secretos;
- workflows deshabilitados permanezcan visibles;
- deriva local/remota tenga destino;
- no se ejecuten contratos productivos;
- no se creen preguntas repetidas;
- `CODE-AUD-006` permanezca como única continuidad.

---

#### 23. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
acción y lógica interna
        ↓
Server Action, API, RPC, Edge Function o job
        ↓
contrato existente y estado de despliegue
        ↓
tabla, vista, Storage, Realtime y evento por vincular
```

La continuidad será:

```text
CODE-AUD-006
— Vincular código con tablas, vistas, Storage, Realtime y eventos
```


### ✅ CODE-AUD-006 — Vincular código con tablas, vistas, Storage, Realtime y eventos

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** mapa técnico contrastado de persistencia, archivos, sincronización y eventos
**Dependencia anterior:** `CODE-AUD-005`
**Continuidad reservada:** `CODE-AUD-007`
**Fecha de corte:** 2026-07-23
**Proyecto Supabase comprobado:** `vento-os-dev` (`clzdpinthhtknkmefsxx`)
**Cambios en código o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea conecta el código localizado en las aplicaciones con los objetos que
realmente existen en Supabase. El mapa cubre:

```text
código de aplicación
        ↓
tabla o vista consultada
        ↓
archivo guardado en Storage
        ↓
suscripción Realtime o disparador PostgreSQL
        ↓
efecto operativo esperado
```

El resultado no supone que una consulta funcione por el solo hecho de apuntar a
un objeto existente. Existencia, permisos, políticas RLS, publicación Realtime,
contenido real y uso operativo se conservan como comprobaciones diferentes.

---

#### 2. Alcance y método

Se revisaron los doce repositorios conocidos, excluyendo dependencias, builds,
cachés, documentación y artefactos generados. La extracción estática buscó:

- relaciones literales consumidas mediante `.from(...)`;
- cambios explícitos de esquema mediante `.schema(...)`;
- operaciones de Storage y nombres de bucket;
- canales con `.on("postgres_changes", ...)`;
- disparadores y funciones de evento declarados en migraciones;
- estado remoto de esquemas, tablas, vistas, buckets, publicación Realtime y
  triggers habilitados.

El contraste remoto fue de solo lectura y se ejecutó contra `vento-os-dev`
desde el contexto canónico de `vento-shell`. No se invocaron RPC, Edge
Functions, jobs, cargas de archivos ni escrituras productivas.

---

#### 3. Relaciones consumidas por código

La extracción local encontró **206 nombres de relación distintos**. El conteo
por repositorio expresa archivos con al menos una relación literal y nombres
distintos dentro de cada repositorio; un mismo nombre puede aparecer en más de
una aplicación.

| Repositorio | Archivos | Relaciones distintas | Lectura principal                            |
| ----------- | -------: | -------------------: | -------------------------------------------- |
| ANIMA       |       36 |                   24 | asistencia, soporte y trabajador             |
| FOGO        |       14 |                   25 | recetas, producción y catálogo               |
| web pública |        1 |                    2 | catálogo comercial                           |
| NEXO        |      110 |                   90 | inventario, compras, activos y configuración |
| NUMERA      |        9 |                   17 | costos, cierres y resúmenes                  |
| ORIGO       |       20 |                   28 | proveedores, compras y recepción             |
| PASS        |       51 |                   27 | pedidos, fidelización y direcciones          |
| PULSO       |       17 |                   30 | venta, salón, conversación y sesión          |
| TALENTO     |        5 |                   12 | postulación futura y documentos              |
| VISO        |       86 |                   97 | personal, turnos, catálogo y administración  |
| VITAL       |        2 |                    0 | clientes HTTP dinámicos separados            |
| SHELL       |        0 |                    0 | infraestructura, no consumidor UI            |

NEXO y VISO concentran el mayor número de relaciones, pero esto no significa
que sean propietarios únicos de los datos. La propiedad funcional se resolverá
con el mapa de capacidades y la fuente de verdad aprobada.

---

#### 4. Contraste con la base remota

Al incorporar los esquemas `public`, `pass`, `club`, `talento`, `vital`,
`app_private` y `viso`, **204 de los 206 nombres consumidos existen
remotamente**.

| Esquema       | Tablas | Vistas | Tablas con RLS | Tratamiento                                       |
| ------------- | -----: | -----: | -------------: | ------------------------------------------------- |
| `public`      |    185 |     61 |            185 | núcleo compartido actual                          |
| `pass`        |     26 |      1 |             26 | dominio de cliente y fidelización                 |
| `club`        |     11 |      0 |             11 | dominio club                                      |
| `talento`     |     13 |      0 |             13 | base futura, no producto desplegado               |
| `viso`        |     12 |      0 |              1 | planificación interna vía servidor administrativo |
| `app_private` |      1 |      0 |              0 | infraestructura privada                           |
| `vital`       |     54 |      0 |             54 | proyecto separado                                 |

Las tablas `viso.*` no están expuestas directamente a clientes ordinarios.
Las superficies revisadas de VISO las consumen con `createAdminClient()` en el
servidor y después de `requireStaffScheduleAccess(...)`. Por eso la ausencia de
grants para `authenticated` no se clasifica como fallo de ejecución en esta
tarea. `CODE-AUD-017` deberá comprobar que todas las entradas administrativas
mantengan ese límite y que ninguna acepte alcance enviado por el navegador sin
validarlo.

---

#### 5. Dos contratos de relación ausentes

| Relación usada por código     | Consumidor                      | Estado remoto                          | Consecuencia estática                         |
| ----------------------------- | ------------------------------- | -------------------------------------- | --------------------------------------------- |
| `locations_validation`        | NEXO, validación de ubicaciones | no existe en ningún esquema consultado | la inserción fallará si se ejecuta            |
| `restock_operational_summary` | NEXO, página de remisiones      | no existe en ningún esquema consultado | el error se omite y se usa un cálculo alterno |

`locations_validation` tiene una migración local
`20260415000000_nexo_locations_validation.sql` y la versión figura en el
historial remoto, pero el objeto ya no está. No se encontró una migración
posterior que documente su eliminación o cambio de nombre.

`restock_operational_summary` no aparece en migraciones. Sí existe el RPC
`get_restock_request_operational_summary`, lo que indica un posible cruce entre
nombre de relación y contrato RPC. La página actual oculta el fallo porque
continúa con datos de `restock_request_items`.

Ninguno de los dos casos se corregirá durante descubrimiento. Su reconciliación
queda en `CODE-AUD-012`, `CODE-AUD-014` y `CODE-AUD-020`; cualquier cambio de
base deberá crearse y ejecutarse desde `vento-shell`.

---

#### 6. Vistas remotas

Se localizaron **62 vistas**: 61 en `public` y una en `pass`. El código consume
vistas de catálogo, pedidos, asistencia, fidelización, costos, POS, políticas
de solicitud, activos, diagnóstico de sedes y autorización.

**58 vistas** declaran `security_invoker=true`. Cuatro no lo declaran:

- `public.permission_catalog_human_v1`;
- `public.shared_operational_device_actor_policies_admin_v1`;
- `public.shared_operational_device_templates_admin_v1`;
- `public.shared_operational_devices_admin_v1`.

La ausencia de esa opción no prueba por sí sola una exposición. Grants,
propietario, filtros y consumidores deberán comprobarse conjuntamente en
`CODE-AUD-017`.

El snapshot `schema_public_current.sql` continúa sin representar por completo
el estado remoto. Se conserva como evidencia histórica, no como fuente actual,
hasta su reconciliación en `CODE-AUD-020`.

---

#### 7. Storage: inventario y consumidores

El proyecto remoto contiene **14 buckets**. El código actual referencia once y
los once existen.

| Bucket                   | Visibilidad remota | Consumidor localizado | Operación observada                       |
| ------------------------ | ------------------ | --------------------- | ----------------------------------------- |
| `documents`              | público            | ANIMA y VISO          | cargar, eliminar, firmar                  |
| `recipe-step-photos`     | público            | FOGO                  | cargar, actualizar, URL pública           |
| `nexo-catalog-images`    | público            | NEXO                  | cargar, descargar, URL pública            |
| `talento-cv`             | privado            | TALENTO               | cargar, URL firmada                       |
| `talento-documents`      | privado            | TALENTO               | cargar, URL firmada                       |
| `talento-medical`        | privado            | TALENTO               | cargar, URL firmada                       |
| `website-media`          | privado            | VISO                  | cargar, actualizar, eliminar, URL pública |
| `pass-satellite-logos`   | público            | VISO                  | carga y URL pública                       |
| `product-images`         | público            | VISO                  | carga y URL pública                       |
| `commercial-menu-images` | público            | VISO                  | carga y URL pública                       |
| `employee-photos`        | público            | VISO                  | carga y URL pública                       |

Tres buckets remotos no tienen consumidor localizado:

| Bucket              | Estado documental                                                       |
| ------------------- | ----------------------------------------------------------------------- |
| `nexo-ai-documents` | tiene antecedente de migración, pero la pila de IA fue retirada después |
| `public-documents`  | no se localizó definición en migraciones                                |
| `recipe-media`      | no se localizó definición en migraciones                                |

No se inspeccionaron ni descargaron objetos. Por tanto, “sin consumidor” no
significa vacío y “público” no significa que se haya probado una filtración.

---

#### 8. Dos incompatibilidades de Storage por resolver

1. **`documents` es público.** ANIMA y VISO lo usan para documentos asociados a
   trabajadores o sedes. Antes de remodelar debe inventariarse qué rutas y tipos
   de documento existen, mover lo sensible a un contrato privado y evitar URLs
   permanentes cuando corresponda. Destino: `CODE-AUD-017`, `018` y `020`.
2. **`website-media` es privado, pero el endpoint de VISO devuelve
   `getPublicUrl()`.** El sitio público necesita acceso anónimo a los recursos
   publicados; una URL pública calculada no vuelve público un bucket privado.
   Debe decidirse entre bucket público para medios aprobados o entrega mediante
   URL firmada/proxy. Destino: `CODE-AUD-010`, `012`, `017` y `020`.

Los tres buckets privados de TALENTO usan URLs firmadas y son coherentes a
nivel estático con su propósito futuro. Esto no autoriza su puesta en
producción ni el tratamiento de datos de aspirantes.

---

#### 9. Realtime declarado en aplicaciones

Se encontraron **30 suscripciones PostgreSQL** distribuidas en 16 archivos y
trece nombres de tabla o vista:

| Aplicación | Suscripciones | Objetos observados                                                                                                                 |
| ---------- | ------------: | ---------------------------------------------------------------------------------------------------------------------------------- |
| ANIMA      |             6 | `employee_sites`, `support_messages`, `support_ticket_reads`, `support_tickets`                                                    |
| PASS       |            11 | `pass.loyalty_redemptions`, `order_billing_requests`, `order_conversations`, `order_delivery_sessions`, `order_messages`, `orders` |
| PULSO      |            13 | `order_conversations`, `order_messages`, `order_status_events`, `orders`, `pos_sessions`, `pos_table_service_calls`                |

La publicación remota `supabase_realtime` contiene solamente:

- `public.order_conversations`;
- `public.order_delivery_sessions`;
- `public.order_messages`;
- `public.order_status_events`;
- `public.orders`;
- `public.users`.

---

#### 10. Cobertura Realtime efectiva

De las 30 suscripciones declaradas, **20 apuntan a tablas publicadas** y
**10 no están servidas por la publicación actual**.

| Objeto suscrito no servido | Ocurrencias | Causa comprobada                                       |
| -------------------------- | ----------: | ------------------------------------------------------ |
| `employee_sites`           |           1 | tabla fuera de la publicación                          |
| `support_messages`         |           2 | tabla fuera de la publicación                          |
| `support_ticket_reads`     |           1 | tabla fuera de la publicación                          |
| `support_tickets`          |           2 | tabla fuera de la publicación                          |
| `pass.loyalty_redemptions` |           1 | tabla fuera de la publicación                          |
| `order_billing_requests`   |           1 | tabla fuera de la publicación                          |
| `pos_sessions`             |           1 | es una vista, no tabla publicable por Postgres Changes |
| `pos_table_service_calls`  |           1 | es una vista, no tabla publicable por Postgres Changes |

Además, `public.users` está publicado pero no se localizó una suscripción
estática actual.

Esto confirma deriva entre código y configuración. No se añadirán tablas a la
publicación por inferencia: primero se debe decidir cuáles flujos requieren
tiempo real, reemplazar las dos suscripciones a vistas y comprobar volumen,
RLS y filtrado. Destino: `CODE-AUD-010`, `012`, `016`, `018` y `020`.

---

#### 11. Eventos y disparadores PostgreSQL

Se inventariaron disparadores habilitados en los esquemas de dominio:

| Cobertura           | Disparadores habilitados | Lectura                                     |
| ------------------- | -----------------------: | ------------------------------------------- |
| Vento OS, sin VITAL |                      172 | reglas y automatizaciones compartidas       |
| VITAL separado      |                       24 | no se incorporan a la remodelación Vento OS |

Los 172 disparadores Vento incluyen familias para:

- validación y sincronización del catálogo PASS;
- saldo de fidelización y dirección de entrega;
- geocerca, turno y secuencia de asistencia;
- sincronización de sedes y roles del trabajador;
- alcance de ubicaciones y costos de compras;
- estados de pedido, facturación y entrega;
- asignación, versión y validación de políticas de solicitud;
- consistencia de producción, catálogo y remisiones;
- validación de dispositivos operativos compartidos;
- notificación al insertar mensajes de soporte.

Los conteos por evento se superponen cuando un mismo trigger atiende más de una
operación. Por eso no se suman como si fueran procesos distintos.

---

#### 12. Cadenas de evento reconstruidas

##### 12.1 Soporte

```text
mensaje insertado en soporte
        ↓
trigger remoto habilitado
        ↓
notify_support_message_inserted
        ↓
Edge Function de notificación
        ↓
aviso al destinatario
```

La cadena existe en metadatos. La entrega final no se ejecutó ni se declara
probada.

##### 12.2 Publicación de turnos

No existe actualmente un trigger remoto asociado a
`notify_shift_published`. ANIMA contiene una invocación directa a
`shift-publish-notify`, por lo que el activador cambió de base de datos a
aplicación o quedó parcialmente migrado. No se clasifica todavía como código
huérfano. Destino: `CODE-AUD-013`, `015` y `018`.

##### 12.3 Procesamiento programado

`run_shift_runtime_processor` pertenece al flujo cron inventariado en
`CODE-AUD-005`. Se conserva la conexión entre job, función y datos, pero la
reconciliación de definiciones locales/remotas sigue en `CODE-AUD-011` y
`CODE-AUD-020`.

##### 12.4 Pedidos y remisiones

Los cambios de pedidos se propagan mediante triggers de estado y Realtime. Las
remisiones combinan políticas, estados y cálculos derivados; el contrato
ausente `restock_operational_summary` impide considerar esa cadena
completamente reconciliada.

---

#### 13. Mapa resumido por aplicación

| Aplicación | Datos principales                           | Storage                    | Realtime/eventos                                     | Estado                                             |
| ---------- | ------------------------------------------- | -------------------------- | ---------------------------------------------------- | -------------------------------------------------- |
| ANIMA      | trabajadores, turnos, asistencia, soporte   | documentos                 | asistencia y soporte; seis suscripciones no servidas | parcial                                            |
| FOGO       | recetas, producción, catálogo               | fotos de pasos             | triggers de consistencia                             | vinculado estáticamente                            |
| NEXO       | inventario, compras, activos, configuración | imágenes de catálogo       | políticas, costos y remisiones                       | dos contratos de relación requieren reconciliación |
| NUMERA     | costos, cierres, resúmenes                  | ninguno localizado         | cálculos y vistas                                    | vinculado estáticamente                            |
| ORIGO      | proveedores, órdenes, recepción             | ninguno localizado         | costos e inventario                                  | vinculado estáticamente                            |
| PASS       | pedidos, fidelización, direcciones          | ninguno directo localizado | once suscripciones; dos no servidas                  | parcial                                            |
| PULSO      | pedidos, salón, conversación, POS           | ninguno localizado         | trece suscripciones; dos apuntan a vistas            | parcial                                            |
| VISO       | personal, turnos, catálogo, gobierno        | seis buckets               | acceso administrativo y eventos de personal          | requiere auditoría de límite privilegiado          |
| TALENTO    | postulaciones futuras                       | tres buckets privados      | triggers de actualización                            | base futura, no desplegada                         |
| VITAL      | dominio propio                              | infraestructura separada   | 24 triggers separados                                | fuera de Vento OS                                  |
| AURA       | ninguno                                     | ninguno                    | ninguno                                              | idea futura sin diseño                             |

---

#### 14. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                             | Destino                                    |
| ---------------- | ------------------------------------------------------------------------------------ | ------------------------------------------ |
| `H-CODE-006-001` | 204 de 206 relaciones consumidas existen remotamente                                 | `CODE-AUD-017`, `020`                      |
| `H-CODE-006-002` | NEXO y VISO concentran el mapa relacional                                            | `CODE-AUD-014`, `019`                      |
| `H-CODE-006-003` | `locations_validation` falta pese a su antecedente de migración                      | `CODE-AUD-012`, `020`                      |
| `H-CODE-006-004` | `restock_operational_summary` falta y el fallo queda oculto por un cálculo alterno   | `CODE-AUD-012`, `014`, `020`               |
| `H-CODE-006-005` | el snapshot público continúa incompleto frente a remoto                              | `CODE-AUD-020`                             |
| `H-CODE-006-006` | cuatro vistas administrativas no declaran `security_invoker`                         | `CODE-AUD-017`                             |
| `H-CODE-006-007` | los once buckets referenciados existen                                               | `CODE-AUD-017`, `020`                      |
| `H-CODE-006-008` | tres buckets remotos no tienen consumidor actual localizado                          | `CODE-AUD-015`, `020`                      |
| `H-CODE-006-009` | `documents` es público y aloja documentos asociados a personal o sedes               | `CODE-AUD-017`, `018`, `020`               |
| `H-CODE-006-010` | `website-media` es privado pero su endpoint devuelve URL pública                     | `CODE-AUD-010`, `012`, `017`, `020`        |
| `H-CODE-006-011` | diez de treinta suscripciones no están servidas por la publicación                   | `CODE-AUD-010`, `012`, `016`, `018`, `020` |
| `H-CODE-006-012` | PULSO intenta Postgres Changes sobre dos vistas                                      | `CODE-AUD-012`, `016`, `018`               |
| `H-CODE-006-013` | `users` está publicado sin consumidor Realtime localizado                            | `CODE-AUD-015`, `020`                      |
| `H-CODE-006-014` | existen 172 triggers habilitados de Vento OS                                         | `CODE-AUD-017`, `019`, `020`               |
| `H-CODE-006-015` | soporte tiene una cadena trigger-función-notificación identificable                  | `CODE-AUD-018`                             |
| `H-CODE-006-016` | el activador efectivo de publicación de turnos cambió o quedó incompleto             | `CODE-AUD-013`, `015`, `018`               |
| `H-CODE-006-017` | las tablas `viso.*` dependen de controles de aplicación antes de usar `service_role` | `CODE-AUD-017`, `019`                      |
| `H-CODE-006-018` | VITAL conserva datos y eventos propios separados                                     | conservar fuera de Vento OS                |

Todos los hallazgos tienen una tarea canónica de continuación. No se crea una
pregunta para asuntos que pueden resolverse inspeccionando código, metadatos,
logs o configuración.

---

#### 15. Comprobaciones técnicas asignadas al asistente

| Comprobación                                              | Cómo se resolverá                                               | Tarea                        |
| --------------------------------------------------------- | --------------------------------------------------------------- | ---------------------------- |
| identificar el destino correcto de `locations_validation` | historial remoto, migraciones y consumidores                    | `CODE-AUD-020`               |
| decidir si el resumen de remisiones es vista o RPC        | contrato, tipos, consultas y pruebas                            | `CODE-AUD-012`, `014`        |
| verificar grants y filtros de las cuatro vistas           | propietario, grants, RLS subyacente y consumidores              | `CODE-AUD-017`               |
| clasificar objetos de los tres buckets sin consumidor     | metadatos y rutas, sin descargar contenido sensible innecesario | `CODE-AUD-015`, `020`        |
| corregir estrategia de `documents` y `website-media`      | clasificación de datos, consumidor y prueba controlada          | `CODE-AUD-017`, `018`, `020` |
| reconciliar diez suscripciones no servidas                | código, publicación, RLS, logs y prueba segura                  | `CODE-AUD-016`, `018`, `020` |
| reconstruir publicación de turnos                         | invocadores, logs y configuración                               | `CODE-AUD-013`, `015`, `018` |
| auditar límites de `createAdminClient()` en VISO          | guardas, validación de alcance y Server Actions                 | `CODE-AUD-017`, `019`        |

Estas comprobaciones no requieren respuesta del usuario y no se incorporan al
cuestionario operativo.

---

#### 16. Límites de certeza

Esta propuesta confirma estructura y configuración visibles al corte. No
confirma:

- que cada pantalla haya ejecutado su consulta recientemente;
- que existan objetos dentro de cada bucket;
- que un objeto público contenga información sensible;
- que las notificaciones lleguen al dispositivo;
- que todas las políticas RLS representen el modelo objetivo;
- que un trigger habilitado produzca siempre el resultado empresarial esperado;
- que una relación existente tenga datos completos o correctos;
- que TALENTO esté autorizado para tratar postulaciones reales;
- que VITAL sea parte de Vento OS.

Pruebas, fixtures, mocks y demostraciones se inventariarán en `CODE-AUD-007`.

---

#### 17. Reglas de seguridad para continuaciones

1. No descargar documentos de trabajadores solo para confirmar que existen.
2. No volver público un bucket para “probar” una URL.
3. No publicar tablas en Realtime sin revisar volumen, RLS y necesidad.
4. No crear relaciones ausentes antes de definir su contrato.
5. No ejecutar triggers, jobs o Edge Functions con datos productivos.
6. No usar `service_role` desde navegador o aplicación móvil.
7. No tratar URLs firmadas como permisos permanentes.
8. No desplegar la base futura de TALENTO.
9. Toda migración VENTO deberá crearse y ejecutarse desde `vento-shell`.
10. La auditoría documental no autoriza remodelación todavía.

---

#### 18. Decisiones propuestas

1. Se adopta el vínculo de 206 nombres de relación consumidos por código.
2. Se reconocen 204 relaciones existentes y dos contratos ausentes.
3. `locations_validation` y `restock_operational_summary` se reconcilian antes
   de remodelar NEXO.
4. Las 62 vistas quedan inventariadas sin presumir autorización.
5. Las cuatro vistas sin `security_invoker` pasan a auditoría conjunta.
6. Se adopta el inventario remoto de catorce buckets.
7. Los once buckets consumidos existen; tres quedan pendientes de clasificar.
8. `documents` no conservará automáticamente su visibilidad pública.
9. `website-media` deberá alinear privacidad y forma de entrega.
10. Se adoptan treinta suscripciones Realtime declaradas.
11. Las diez suscripciones no servidas se consideran deriva confirmada.
12. Las dos suscripciones a vistas requieren reemplazo de contrato.
13. Los 172 triggers Vento se conservan como inventario, no como diseño
    objetivo.
14. El límite administrativo de VISO se revisará en seguridad.
15. TALENTO permanece futuro y sin despliegue.
16. VITAL permanece separado y AURA sin backend.
17. Los dieciocho hallazgos continúan en tareas ya existentes.
18. `CODE-AUD-007` será la única continuidad inmediata.

---

#### 19. Criterios de aceptación

`CODE-AUD-006` podrá aprobarse cuando:

- tablas y vistas estén diferenciadas;
- los esquemas no públicos estén incluidos;
- las relaciones consumidas estén contrastadas con remoto;
- las dos relaciones ausentes tengan destino;
- Storage distinga bucket existente, visibilidad y consumidor;
- no se confunda URL pública con acceso efectivo;
- Realtime distinga suscripción declarada y tabla publicada;
- las suscripciones a vistas queden señaladas;
- triggers y cadenas de evento estén vinculados;
- VISO conserve explícito su límite administrativo;
- TALENTO, VITAL y AURA mantengan su clasificación;
- ninguna comprobación técnica se traslade al usuario;
- no se realicen mutaciones productivas;
- `CODE-AUD-007` permanezca como única continuidad.

---

#### 20. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
superficie y acción
        ↓
consulta, servicio o contrato de servidor
        ↓
tabla, vista, archivo o evento real
        ↓
brecha técnica con destino canónico
        ↓
pruebas y datos de demostración por inventariar
```

La continuidad será:

```text
CODE-AUD-007
— Inventariar pruebas, fixtures, mocks y datos de demostración
```


### ✅ CODE-AUD-007 — Inventariar pruebas, fixtures, mocks y datos de demostración

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** inventario técnico transversal de mecanismos de validación y datos no operativos  
**Dependencia anterior:** `CODE-AUD-006`  
**Continuidad reservada:** `QA-GOV-001` 
**Fecha de corte:** 2026-07-24  
**Cambios en código o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea inventaría y diferencia:

1. pruebas automatizadas ejecutables;
2. utilidades y dobles de prueba;
3. fixtures persistentes o cargables;
4. mocks visuales o de interfaz;
5. datos de demostración;
6. datos históricos de sandbox;
7. configuraciones de prueba todavía presentes en código;
8. datos técnicos que pueden parecer de prueba, pero cumplen una función vigente.

La revisión confirma que **Vento OS no posee actualmente una suite automatizada de pruebas identificable en sus aplicaciones operativas**.

Los repositorios web, móviles y de infraestructura revisados no declaran comandos `test` ni dependencias de Jest, Vitest, Playwright, Cypress u otro framework equivalente. Sus scripts actuales se limitan principalmente a desarrollo, build, lint, sincronización, auditorías de texto, releases y compilación móvil.

La única suite automatizada localizada pertenece a **VITAL**, proyecto separado y fuera de la cobertura funcional de Vento OS.

---

#### 2. Repositorios incluidos

| Repositorio     | Producto                  | Pruebas automatizadas localizadas |                Fixtures o mocks localizados | Clasificación      |
| --------------- | ------------------------- | --------------------------------: | ------------------------------------------: | ------------------ |
| `vento-shell`   | SHELL + Supabase canónico |                                no | scripts y migraciones históricas de sandbox | Vento OS           |
| `vento-viso`    | VISO                      |                                no |    previews funcionales, sin fixture formal | Vento OS           |
| `vento-nexo`    | NEXO                      |                                no |         mocks visuales y valores de preview | Vento OS           |
| `vento-fogo`    | FOGO                      |                                no |       no se localizó infraestructura formal | Vento OS           |
| `vento-origo`   | ORIGO                     |                                no |       no se localizó infraestructura formal | Vento OS           |
| `vento-pulso`   | PULSO                     |                                no |       no se localizó infraestructura formal | Vento OS           |
| `vento-numera`  | NUMERA                    |                                no |       no se localizó infraestructura formal | Vento OS           |
| `Vento-Group`   | web pública               |                                no |       no se localizó infraestructura formal | superficie pública |
| `vento-anima`   | ANIMA                     |                                no |       no se localizó infraestructura formal | Vento OS móvil     |
| `vento-pass`    | PASS                      |                                no |       no se localizó infraestructura formal | Vento OS móvil     |
| `vento-talento` | TALENTO                   |                                no |       no se localizó infraestructura formal | base futura        |
| `vento-vital`   | VITAL                     |                                sí |   utilidades HTTP y controladores simulados | proyecto separado  |

FOGO, ORIGO, PULSO y NUMERA solo declaran comandos de desarrollo, build, lint o sincronización.

La web pública, ANIMA, PASS y TALENTO tampoco declaran un comando de pruebas.

---

#### 3. Pruebas automatizadas

##### 3.1. Vento OS

No se localizaron archivos o configuraciones verificables correspondientes a:

- Jest;
- Vitest;
- Playwright;
- Cypress;
- React Testing Library;
- Expo Jest;
- pruebas unitarias TypeScript o JavaScript;
- pruebas E2E;
- pruebas de componentes;
- pruebas automatizadas de Edge Functions;
- pruebas automatizadas de migraciones;
- pruebas automatizadas de políticas RLS;
- pruebas automatizadas de contratos RPC;
- pruebas automatizadas de Realtime;
- pruebas automatizadas de flujos móviles.

Esto no demuestra que nunca se hayan realizado pruebas manuales. Demuestra que **no existe evidencia de una suite automatizada reproducible y vinculada a los paquetes actuales**.

`CODE-AUD-016` ejecutará únicamente los comandos realmente disponibles. No deberá presentar `build`, `lint` o `typecheck` como sustitutos de pruebas funcionales.

##### 3.2. VITAL

VITAL declara:

```text
test:contracts:api
ci:contracts
```

y su paquete API ejecuta:

```text
node --test tests/contracts/**/*.test.js
```

Se localizaron cinco archivos de prueba contractual:

1. `staffRoutes.test.js`;
2. `planningRoutes.test.js`;
3. `planningController.test.js`;
4. `telemetryRoutes.test.js`;
5. `telemetryService.test.js`.

Estas pruebas verifican, entre otros comportamientos:

- despacho correcto de rutas;
- respuesta `404` para rutas desconocidas;
- validación de parámetros;
- exigencia de token bearer;
- reglas de campos obligatorios;
- limitación de valores de consulta.

**Decisión de alcance:** estas pruebas se conservan como evidencia técnica de VITAL, pero no se contabilizan como cobertura de Vento OS.

---

#### 4. Utilidades y dobles de prueba

VITAL contiene una utilidad `testUtils.js` con:

- `createMockRes()`;
- `createJsonReq()`;
- `parseBody()`.

Estas funciones construyen solicitudes y respuestas HTTP simuladas para las pruebas de contrato.

No se localizaron utilidades equivalentes compartidas en los repositorios de Vento OS.

No existe actualmente:

- librería transversal de factories;
- servidor HTTP mock;
- cliente Supabase simulado;
- generador de usuarios;
- generador de sedes o áreas;
- simulador de RLS;
- simulador de permisos;
- simulador de dispositivos compartidos;
- simulador de impresión;
- simulador de pagos;
- simulador de notificaciones.

La creación de esas herramientas no pertenece a esta tarea de inventario y no se prescribe automáticamente.

---

#### 5. Mocks visuales y previews de interfaz

NEXO contiene un componente denominado:

```text
MockMiniLabel.tsx
```

El término `Mock` en este caso no representa un doble de prueba. Es un **renderizador visual de etiquetas** utilizado para mostrar una aproximación de la impresión dentro de la interfaz. Recibe dimensiones, código, título, tipo de código de barras y escala de renderizado.

La pantalla de trabajos de impresión también usa datos de fallback como:

```text
EJEMPLO-001
EJ-001
EJ-002
EJ-003
Demo
```

cuando la cola de impresión está vacía.

El hook de preview ZPL conserva el mismo fallback para generar una vista previa sin requerir una ubicación real.

**Clasificación canónica:**

- no son pruebas automatizadas;
- no son fixtures persistentes;
- no escriben datos en Supabase;
- no deben contarse como cobertura;
- sí constituyen datos sintéticos embebidos en una interfaz productiva.

Su necesidad funcional se revisará en `CODE-AUD-009` por tratarse de valores hardcodeados y en `CODE-AUD-010` para confirmar que el preview no se confunda con una impresión real.

---

#### 6. Simulación de rol

NEXO conserva lógica que denomina el override de rol como modo `sandbox/test`.

La implementación determina que un override válido debe comportarse como una simulación estricta y evitar mezclar permisos reales con permisos del rol simulado.

**Clasificación:**

- no es una prueba automatizada;
- no es un mock;
- no es un fixture;
- es una capacidad funcional de simulación administrativa;
- actúa sobre evaluación real de permisos;
- debe someterse a la auditoría de autorización de `CODE-AUD-017`.

El uso de palabras como `sandbox` o `test` no autoriza su eliminación. Primero debe comprobarse quién puede activar el override, qué cookie usa, qué rutas afecta y si existe trazabilidad.

---

#### 7. Seeds y datos persistentes

##### 7.1. Seed local

La configuración obsoleta que apuntaba a `supabase/seed.sql` fue eliminada y el seeding local quedó desactivado.

Por tanto:

- no existe un seed local canónico;
- no existe un dataset demo que se cargue mediante `supabase db reset`;
- no se propone crear uno;
- no se restaurarán datos antiguos de prueba.

##### 7.2. Migraciones cuyo nombre contiene `seed`

No toda migración con la palabra `seed` representa datos de demostración.

Ejemplo:

```text
20260530174500_seed_cost_centers_from_sites.sql
```

puebla centros de costo reales a partir de sedes existentes, es idempotente y forma parte del estado funcional de facturación interna.

Por tanto, las migraciones se clasifican por propósito y no por nombre.

| Tipo                          | Ejemplo                                   | Clasificación              |
| ----------------------------- | ----------------------------------------- | -------------------------- |
| inicialización funcional      | centros de costo desde sedes              | dato canónico              |
| catálogo funcional            | pantallas, capacidades o presets vigentes | dato canónico              |
| migración de datos existentes | catálogo PASS desde productos             | transformación productiva  |
| sandbox temporal              | productos `SBXV1-*`                       | prueba histórica retirada  |
| limpieza de sandbox           | eliminación `SBXV1-*`                     | historial técnico aplicado |

---

#### 8. Sandbox histórico NEXO

Se localizaron las siguientes migraciones históricas:

- `20260317110000_nexo_v1_validation_sandbox_seed.sql`;
- `20260317123000_nexo_v1_validation_sandbox_audience_fix.sql`;
- `20260317124500_nexo_v1_validation_sandbox_site_code_fix.sql`;
- `20260318100117_nexo_v1_validation_sandbox_cleanup.sql`;
- `20260318213000_nexo_v1_validation_sandbox_reseed.sql`;
- `20260324124500_nexo_cleanup_sandbox_v1_catalog.sql`;
- `20260326123000_nexo_cleanup_sandbox_products_and_locs.sql`.

También permanecen:

- `scripts/run-nexo-v1-validation-sandbox-cleanup.ps1`;
- `supabase/templates/nexo_v1_validation_sandbox_cleanup.sql`.

El script genera otra migración de limpieza a partir del template y ejecuta `supabase db push`.

El template elimina explícitamente:

- productos `SBXV1-*`;
- categorías `sbx-v1-*`;
- ubicaciones `LOC-CP-SBX-*`;
- movimientos;
- entradas;
- transferencias;
- remisiones;
- existencias;
- costos relacionados.

La inspección remota confirmó que actualmente permanecen **cero** categorías, productos, ubicaciones y movimientos del sandbox `SBXV1`.

**Clasificación canónica:**

- los datos de sandbox ya no existen;
- las migraciones aplicadas forman parte del historial remoto;
- no deben borrarse individualmente durante esta fase;
- el script y el template de limpieza son candidatos a residuo técnico porque su objetivo ya fue cumplido.

**Destino obligatorio:**

| Hallazgo                               | Destino                                              |
| -------------------------------------- | ---------------------------------------------------- |
| script de cleanup todavía ejecutable   | `CODE-AUD-015`, `CODE-AUD-020`                       |
| template de cleanup todavía disponible | `CODE-AUD-015`, `CODE-AUD-020`                       |
| migraciones históricas de sandbox      | `CODE-AUD-020` y bloque de consolidación de Supabase |
| ausencia actual de datos `SBXV1`       | cerrar como verificado                               |

---

#### 9. Sede `APP-REVIEW`

Supabase conserva:

```text
code: APP-REVIEW
name: App Review (Demo)
site_type: admin
is_active: true
operational_visibility: app_review
```

La sede tiene actualmente:

- una área;
- un centro de costo;
- una relación en `employee_sites`;
- cero configuraciones de producto por sede.

Una migración específica añadió `operational_visibility` y clasificó esta sede como `app_review`, excluyéndola de selectores operativos normales.

**Clasificación provisional:**

- es un dato de demostración vigente;
- no es un fixture local;
- está presente en la base productiva;
- está aislado de la operación normal mediante clasificación;
- probablemente cumple una función de revisión de aplicaciones móviles;
- no se autoriza eliminarlo por inferencia.

**Destino obligatorio:**

| Comprobación                                                     | Tarea                          |
| ---------------------------------------------------------------- | ------------------------------ |
| identificar consumidor actual de `APP-REVIEW`                    | `CODE-AUD-015`                 |
| comprobar si Apple/Google o cuentas de revisión aún lo requieren | `CODE-AUD-019`, `CODE-AUD-020` |
| revisar autorización y aislamiento                               | `CODE-AUD-017`                 |
| decidir conservación, sustitución o eliminación                  | `CODE-AUD-020`                 |

No se crea una pregunta operativa para el usuario todavía. La existencia de consumidores puede comprobarse mediante código, cuentas asociadas y configuración de publicación.

---

#### 10. Otros valores de prueba o demostración remotos

La búsqueda remota por nombres asociados a:

```text
demo
test
sandbox
sbx
example
ejemplo
review
```

solo encontró como elementos empresariales relevantes:

1. la sede `APP-REVIEW`;
2. su centro de costo `ADM-APP-REVIEW`;
3. un punto operativo oculto llamado `pickup_camioneta_principal`.

El punto de recogida oculto no se clasifica como dato demo solamente por estar oculto. Su uso pertenece al inventario operativo y debe conservarse hasta analizar sus consumidores.

No se localizaron productos ni categorías remotas con marcas de demo, test o sandbox.

---

#### 11. Datos de ejemplo embebidos

Se consideran datos de ejemplo embebidos aquellos valores incluidos directamente en código para:

- placeholders;
- previews;
- ejemplos de formato;
- estados vacíos;
- documentación visual;
- formatos de cola;
- códigos de etiqueta.

Estos valores no son necesariamente incorrectos.

Su inventario detallado y decisión de limpieza corresponden a:

```text
CODE-AUD-009
— Detectar valores hardcodeados y decisiones técnicas temporales
```

`CODE-AUD-007` únicamente establece que no deben confundirse con fixtures ni pruebas automatizadas.

---

#### 12. Cobertura real por categoría

| Categoría                     |                Vento OS |                      VITAL separado |
| ----------------------------- | ----------------------: | ----------------------------------: |
| pruebas unitarias             |           0 localizadas |                                  sí |
| pruebas de contrato           |           0 localizadas |                          5 archivos |
| pruebas E2E                   |           0 localizadas |                       0 localizadas |
| pruebas de componentes        |           0 localizadas |                       0 localizadas |
| pruebas móviles               |           0 localizadas |                       0 localizadas |
| pruebas de migraciones        |           0 localizadas |                       0 localizadas |
| pruebas RLS                   |           0 localizadas |                       0 localizadas |
| fixtures formales             |           0 localizados | objetos construidos dentro de tests |
| mocks HTTP                    |           0 localizados |                                  sí |
| previews con datos sintéticos | sí, principalmente NEXO |                        no relevante |
| sandbox persistente activo    |                      no |                       no comprobado |
| dato demo remoto activo       |            `APP-REVIEW` |                    fuera de alcance |

La cifra cero significa “no localizado en el corte”, no “imposible que exista fuera de los repositorios inspeccionados”.

---

#### 13. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                           | Destino                                                        |
| ---------------- | ------------------------------------------------------------------ | -------------------------------------------------------------- |
| `H-CODE-007-001` | Vento OS no tiene suite automatizada identificable                 | `CODE-AUD-016`, `CODE-AUD-020`                                 |
| `H-CODE-007-002` | build y lint no deben presentarse como pruebas funcionales         | `CODE-AUD-016`                                                 |
| `H-CODE-007-003` | VITAL sí tiene cinco archivos de pruebas de contrato               | conservar fuera de Vento OS                                    |
| `H-CODE-007-004` | VITAL contiene mocks HTTP reutilizables dentro de su suite         | conservar fuera de Vento OS                                    |
| `H-CODE-007-005` | NEXO usa datos `EJEMPLO` y `Demo` para previews de impresión       | `CODE-AUD-009`, `CODE-AUD-010`                                 |
| `H-CODE-007-006` | `MockMiniLabel` es preview funcional, no infraestructura de prueba | `CODE-AUD-009`, `CODE-AUD-010`                                 |
| `H-CODE-007-007` | el override de rol se denomina sandbox/test, pero es lógica real   | `CODE-AUD-017`                                                 |
| `H-CODE-007-008` | no existe seed local canónico y el seeding quedó desactivado       | cerrado                                                        |
| `H-CODE-007-009` | migraciones con `seed` pueden contener datos canónicos reales      | `CODE-AUD-020`                                                 |
| `H-CODE-007-010` | el sandbox `SBXV1` fue eliminado completamente del remoto          | cerrado                                                        |
| `H-CODE-007-011` | permanece un script ejecutable para recrear cleanup de sandbox     | `CODE-AUD-015`, `CODE-AUD-020`                                 |
| `H-CODE-007-012` | permanece un template SQL de cleanup ya ejecutado                  | `CODE-AUD-015`, `CODE-AUD-020`                                 |
| `H-CODE-007-013` | `APP-REVIEW` sigue activo como dato demo aislado                   | `CODE-AUD-015`, `CODE-AUD-017`, `CODE-AUD-019`, `CODE-AUD-020` |
| `H-CODE-007-014` | no hay productos o categorías demo/sandbox activos                 | cerrado                                                        |
| `H-CODE-007-015` | no existe estrategia transversal comprobable de pruebas            | `CODE-AUD-020`                                                 |

Todos los hallazgos quedan vinculados a una tarea existente o cerrados con evidencia.

---

#### 14. Decisiones propuestas

1. Se adopta que Vento OS no posee actualmente pruebas automatizadas localizadas.
2. `build`, `lint`, `typecheck` y auditorías de texto no se clasificarán como pruebas funcionales.
3. La suite de VITAL permanece fuera del cómputo de Vento OS.
4. `MockMiniLabel` se clasifica como componente de preview.
5. Los valores `EJEMPLO-*` y `Demo` de impresión se clasifican como datos sintéticos embebidos.
6. No se creará un sistema de seeds como consecuencia automática de esta auditoría.
7. El seeding local permanecerá deshabilitado.
8. Las migraciones de datos canónicos no se clasificarán como demo solo por contener la palabra `seed`.
9. Los datos `SBXV1` se consideran completamente retirados.
10. Las migraciones históricas de sandbox no se borrarán individualmente.
11. El script y template de cleanup pasan a revisión de código sin consumidor.
12. `APP-REVIEW` se considera un dato demo vigente y aislado, pendiente de comprobar consumidores antes de decidir su eliminación.
13. No se crearán fixtures, mocks ni pruebas durante la fase de descubrimiento.
14. La estrategia futura de pruebas, si se aprueba, deberá salir de brechas funcionales verificadas y no de una plantilla genérica.
15. `CODE-AUD-008` será la única continuidad inmediata.

---

#### 15. Límites de certeza

Esta tarea no confirma:

- que jamás hayan existido pruebas eliminadas anteriormente;
- que GitHub Actions externos ejecuten pruebas no visibles en los paquetes;
- que una prueba manual documentada siga vigente;
- que `APP-REVIEW` continúe siendo utilizada por una tienda;
- que todos los valores de ejemplo embebidos sean innecesarios;
- que los scripts históricos puedan eliminarse sin revisar referencias;
- que VITAL deba adoptar la futura estrategia de Vento OS;
- que la ausencia de pruebas implique automáticamente que cada función sea defectuosa.

---

#### 16. Criterios de aceptación

`CODE-AUD-007` podrá aprobarse cuando:

- los doce repositorios estén clasificados;
- Vento OS y VITAL estén separados;
- pruebas, fixtures, mocks y demos no se confundan;
- los paquetes sin comando `test` estén identificados;
- la suite contractual de VITAL esté registrada;
- los mocks HTTP de VITAL estén registrados;
- los previews de impresión de NEXO estén clasificados correctamente;
- el sandbox histórico `SBXV1` tenga estado remoto comprobado;
- el seeding local desactivado quede documentado;
- las migraciones canónicas con palabra `seed` no se marquen como basura;
- `APP-REVIEW` tenga destino verificable antes de decidir su eliminación;
- scripts y templates históricos tengan tarea de revisión;
- cada hallazgo tenga destino canónico;
- no se haya creado ni restaurado información de prueba;
- `CODE-AUD-008` permanezca como única continuidad.

---

#### 17. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
repositorio o superficie
        ↓
mecanismo de validación localizado
        ↓
prueba, mock, preview, demo o historial
        ↓
clasificación correcta
        ↓
hallazgo con destino canónico
```

La continuidad será:

```text
QA-GOV-001
— Definir gobierno, registro y ciclo de vida de requisitos de prueba
```


### ✅ QA-GOV-001 — Definir gobierno, registro y ciclo de vida de requisitos de prueba

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** gobierno técnico y documental transversal de calidad  
**Dependencia anterior:** `CODE-AUD-007`  
**Continuidad reservada:** `CODE-AUD-008`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea establece el sistema canónico mediante el cual Vento OS deberá:

1. detectar que un comportamiento necesita protección mediante pruebas;
2. crear un requisito identificable `TREQ-*`;
3. registrarlo sin depender de la memoria;
4. especificarlo progresivamente;
5. asignarlo a una tarea y posteriormente a un paquete de implementación;
6. implementar la prueba junto con el comportamiento protegido;
7. ejecutarla en el ambiente correspondiente;
8. conservar evidencia;
9. impedir que una regresión reaparezca silenciosamente;
10. certificar la cobertura integral antes del cierre de una aplicación o dominio.

El sistema no obliga a escribir pruebas automatizadas durante la fase documental actual. Sí obliga a registrar inmediatamente la necesidad de prueba y a darle un destino documental exacto.

La cadena canónica será:

```text
regla, riesgo, defecto o contrato detectado
        ↓
requisito de prueba `TREQ-*`
        ↓
Registro Canónico de Requisitos de Prueba
        ↓
especificación funcional y técnica
        ↓
paquete de implementación
        ↓
prueba implementada junto con el código
        ↓
ejecución automática o validación manual controlada
        ↓
evidencia
        ↓
regresión integral y certificación
```

---

#### 2. Problema que resuelve

Hasta `CODE-AUD-007`, Vento OS no dispone de una suite automatizada transversal identificable.

La validación se ha realizado principalmente mediante uso directo de las aplicaciones durante el desarrollo. Ese método seguirá siendo necesario para experiencia, hardware y operación real, pero no garantiza por sí solo que:

- una corrección continúe funcionando después de otro cambio;
- las reglas críticas se vuelvan a probar;
- los casos denegados de autorización se ejecuten;
- una migración preserve datos;
- un reintento no duplique efectos;
- un error corregido no reaparezca;
- todas las aplicaciones consumidoras sigan siendo compatibles;
- exista evidencia reproducible antes de desplegar.

La solución no consiste en crear pruebas genéricas de manera masiva. Consiste en convertir cada necesidad verificable en un requisito trazable y asignado.

---

#### 3. Conceptos canónicos

##### 3.1. Requisito de prueba

Un requisito de prueba es una obligación documental identificada mediante `TREQ-*` que describe un comportamiento, regla, contrato o riesgo que deberá ser verificado.

Ejemplo:

```text
TREQ-NEXO-001
Un retiro parcial debe descontar unidades y no paquetes completos.
```

El requisito define **qué debe quedar protegido**. No es todavía el archivo de prueba.

##### 3.2. Implementación de prueba

Es el código, script, consulta o procedimiento que ejecuta la verificación.

Ejemplos:

- archivo Vitest;
- prueba Node;
- prueba Playwright;
- script SQL de validación;
- prueba de contrato;
- prueba negativa de RLS;
- checklist manual de una impresora física.

##### 3.3. Tarea de pruebas

Una tarea `AUTH-QA-*`, `UX-QA-*`, `SHELL-CI-*` u otra tarea de calidad organiza una actividad de implementación, ejecución o certificación.

Una tarea de pruebas no sustituye el requisito `TREQ-*`.

##### 3.4. Evidencia

Es la demostración verificable de que la prueba fue ejecutada y cuál fue su resultado.

Puede ser:

- ejecución de CI;
- reporte de pruebas;
- ruta del archivo;
- commit;
- artefacto;
- log controlado;
- acta de prueba manual;
- registro de piloto;
- evidencia fotográfica de hardware sin datos sensibles.

##### 3.5. Datos de prueba

Son datos aislados utilizados para ejecutar una prueba sin alterar la operación real.

No equivalen automáticamente a un seed global ni a datos demo persistentes.

---

#### 4. Diferencia entre requisito, tarea, prueba y evidencia

| Elemento            | Pregunta que responde                                    | Ejemplo                   |
| ------------------- | -------------------------------------------------------- | ------------------------- |
| requisito `TREQ-*`  | ¿qué comportamiento debe protegerse?                     | no duplicar una recepción |
| tarea               | ¿qué trabajo organiza su implementación o certificación? | paquete ORIGO o tarea QA  |
| prueba implementada | ¿qué mecanismo lo verifica?                              | archivo de integración    |
| ejecución           | ¿cuándo y dónde se comprobó?                             | CI de un PR               |
| evidencia           | ¿cómo se demuestra el resultado?                         | reporte y commit          |
| incidente           | ¿qué falla real originó o reabrió el requisito?          | recepción duplicada       |

La relación no será necesariamente uno a uno:

- un requisito puede necesitar varias pruebas;
- una prueba parametrizada puede cubrir varios escenarios del mismo requisito;
- una tarea puede implementar varios requisitos;
- una tarea de certificación puede ejecutar requisitos ya implementados.

---

#### 5. Fuente de verdad y prevención de deriva

Se aprueba un modelo de dos niveles:

##### 5.1. Declaración de origen dentro de la tarea

La sección `#### Requisitos de prueba derivados` conserva el momento y la razón por la cual una tarea creó o reutilizó un requisito.

Esa declaración forma parte del historial aprobado de la tarea y no deberá reescribirse para actualizar estados posteriores.

##### 5.2. Registro central de ciclo de vida

`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` será la fuente de verdad del estado vigente de cada requisito.

El registro central podrá actualizar:

- estado;
- tarea responsable;
- paquete;
- repositorio;
- ambiente;
- artefacto de prueba;
- último resultado;
- evidencia;
- relación de sustitución.

La tarea de origen y el registro central no compiten:

```text
tarea de origen
→ explica por qué nació

registro central
→ controla qué ocurrió después
```

---

#### 6. Convención de identificadores

Los requisitos utilizarán:

```text
TREQ-<DOMINIO>-<NNN>
```

Ejemplos:

```text
TREQ-AUTH-001
TREQ-SUPABASE-001
TREQ-NEXO-001
TREQ-PASS-001
TREQ-INTEGRATION-001
TREQ-UX-001
```

Dominios iniciales permitidos:

- `AUTH`;
- `SHELL`;
- `SUPABASE`;
- `ANIMA`;
- `VISO`;
- `NEXO`;
- `FOGO`;
- `ORIGO`;
- `PULSO`;
- `NUMERA`;
- `PASS`;
- `TALENTO`;
- `INTEGRATION`;
- `UX`.

Reglas:

1. La secuencia será global por dominio, no por repositorio.
2. El identificador será inmutable.
3. Un identificador descartado u obsoleto no se reutilizará.
4. Si un requisito cambia de repositorio, conservará su identificador.
5. Si cambia sustancialmente la regla protegida, deberá crearse otro requisito.
6. Un dominio nuevo requerirá decisión documental explícita.
7. Antes de crear un identificador deberá comprobarse que no exista otro requisito equivalente.

---

#### 7. Cuándo debe generarse un requisito

Deberá generarse un `TREQ-*` cuando una tarea detecte o defina al menos uno de estos elementos:

##### 7.1. Reglas de negocio

- cálculos;
- conversiones;
- redondeos;
- límites;
- estados;
- transiciones;
- prerequisitos;
- prohibiciones;
- idempotencia;
- compensaciones.

##### 7.2. Autorización y seguridad

- acceso permitido;
- acceso denegado;
- alcance por empresa, sede o área;
- check-in;
- turno;
- dispositivo compartido;
- simulación;
- datos sensibles;
- RLS;
- grants;
- funciones `SECURITY DEFINER`;
- exposición de Storage;
- secretos.

##### 7.3. Datos y Supabase

- restricciones;
- integridad referencial;
- migraciones;
- backfills;
- normalización;
- conservación de datos;
- rollback;
- RPC;
- triggers;
- Realtime;
- Storage;
- concurrencia;
- transacciones.

##### 7.4. Integraciones

- contrato de entrada;
- contrato de salida;
- autenticación;
- mapeo;
- deduplicación;
- reintentos;
- timeouts;
- fallos parciales;
- webhooks;
- colas;
- impresión;
- notificaciones;
- pagos.

##### 7.5. Incidentes y regresiones

Todo defecto reproducible corregido deberá generar o reutilizar un requisito de regresión.

La corrección no podrá cerrarse únicamente porque funcione una vez de forma manual.

##### 7.6. Procesos completos

Se generarán requisitos E2E cuando sea necesario comprobar una cadena entre:

- aplicaciones;
- dominios;
- actores;
- dispositivos;
- estados;
- documentos;
- inventario;
- ventas;
- producción;
- compras;
- contabilidad;
- fidelización.

---

#### 8. Cuándo no debe generarse un requisito nuevo

No deberá crearse un `TREQ-*` nuevo cuando:

1. ya exista un requisito equivalente;
2. la tarea sea exclusivamente editorial y no altere comportamiento;
3. el cambio sea de formato documental sin efecto ejecutable;
4. la observación describa una preferencia visual sin criterio verificable;
5. el mismo requisito pueda ampliarse mediante casos parametrizados sin cambiar la regla;
6. la necesidad corresponda únicamente a ejecutar nuevamente una prueba ya registrada.

En esos casos deberá:

- reutilizarse el identificador existente; o
- declararse `NO GENERA REQUISITOS DE PRUEBA` con justificación.

---

#### 9. Granularidad y deduplicación

Un requisito deberá proteger una regla o riesgo coherente, no cada archivo ni cada botón.

Ejemplo correcto:

```text
TREQ-NEXO-001
Un retiro parcial descuenta exactamente la cantidad solicitada en la unidad canónica.
```

Ejemplos excesivamente fragmentados:

```text
probar botón retirar
probar campo cantidad
probar función convertUnits
probar componente WithdrawModal
```

Esos elementos pueden convertirse en casos de prueba del mismo requisito.

Deberá crearse otro requisito cuando cambie alguno de estos elementos:

- regla empresarial;
- actor autorizado;
- límite territorial;
- efecto persistente;
- riesgo protegido;
- contrato externo;
- mecanismo de seguridad;
- comportamiento ante error.

---

#### 10. Formato obligatorio dentro de cada tarea

Toda tarea deberá incluir, antes de sus criterios de aceptación:

```text
#### Requisitos de prueba derivados
```

##### 10.1. Cuando genera requisitos

Formato mínimo:

| ID  | Regla protegida | Riesgo | Tipo | Modalidad | Prioridad | Tarea responsable |
| --- | --------------- | ------ | ---- | --------- | --------- | ----------------- |

La tarea deberá indicar si cada requisito:

- se crea;
- reutiliza uno existente;
- amplía casos de un requisito existente;
- sustituye otro requisito.

##### 10.2. Cuando no genera requisitos

Deberá utilizar:

```text
**Resultado:** NO GENERA REQUISITOS DE PRUEBA
```

y explicar por qué no existe comportamiento ejecutable nuevo o modificado.

##### 10.3. Prohibiciones

No serán válidas expresiones como:

- probar después;
- revisar en QA;
- validar en implementación;
- probar cuando exista tiempo;
- agregar tests al final;
- verificar en el piloto;
- corresponde al BLOQUE U.

Toda necesidad deberá tener identificador y tarea responsable exacta.

---

#### 11. Esquema del Registro Canónico

Cada requisito deberá conservar, como mínimo:

| Campo                           | Obligatorio desde | Regla                              |
| ------------------------------- | ----------------- | ---------------------------------- |
| `id`                            | identificación    | único e inmutable                  |
| `dominio`                       | identificación    | dominio estable                    |
| `regla_protegida`               | identificación    | resultado observable               |
| `origen`                        | identificación    | tarea, hallazgo o incidente exacto |
| `riesgo`                        | identificación    | consecuencia que se evita          |
| `prioridad`                     | identificación    | crítica, alta, media o baja        |
| `tipo`                          | identificación    | clase de prueba                    |
| `modalidad`                     | identificación    | automatizada, manual o híbrida     |
| `tarea_responsable`             | identificación    | siguiente dueño documental exacto  |
| `paquete`                       | planificación E5  | paquete exacto                     |
| `repositorio`                   | planificación E5  | propietario técnico                |
| `ambiente`                      | especificación    | lugar de ejecución                 |
| `estado`                        | siempre           | estado vigente                     |
| `artefacto`                     | implementación    | ruta o mecanismo de prueba         |
| `ultimo_resultado`              | ejecución         | pendiente, aprobada o fallida      |
| `evidencia`                     | verificación      | referencia reproducible            |
| `sustituye_o_es_sustituido_por` | cuando aplique    | relación histórica                 |

La tabla canónica del registro deberá contener:

| ID  | Dominio | Regla protegida | Origen | Riesgo / prioridad | Tipo / modalidad | Tarea responsable | Paquete | Repositorio / ambiente | Estado | Artefacto | Último resultado | Evidencia | Relación |
| --- | ------- | --------------- | ------ | ------------------ | ---------------- | ----------------- | ------- | ---------------------- | ------ | --------- | ---------------- | --------- | -------- |

No deberán almacenarse secretos, tokens, contraseñas, datos personales completos ni payloads sensibles dentro del registro.

---

#### 12. Estados del ciclo de vida

##### `IDENTIFICADO`

La necesidad existe, tiene ID, origen, regla, riesgo, prioridad y tarea responsable.

No exige todavía archivo de prueba.

##### `ESPECIFICADO`

Están definidos:

- estado inicial;
- actor o contexto;
- acción;
- resultado esperado;
- datos requeridos;
- ambiente;
- modalidad;
- casos positivos y negativos aplicables.

##### `PLANIFICADO`

Está vinculado con:

- paquete exacto;
- repositorio;
- archivos previstos;
- comando previsto;
- criterio de aceptación;
- puerta de despliegue.

##### `IMPLEMENTADO`

La prueba existe como código o procedimiento controlado.

Este estado no significa que la última ejecución haya aprobado.

##### `VERIFICADO`

La ejecución requerida fue aprobada y existe evidencia reproducible.

Si una ejecución obligatoria posterior falla, el requisito deberá volver a `IMPLEMENTADO` hasta recuperar el resultado.

##### `DIFERIDO`

La prueba fue aplazada mediante decisión explícita.

Exige:

- razón;
- riesgo aceptado;
- tarea exacta de reanudación;
- puerta antes de la cual deberá resolverse;
- responsable.

Un requisito crítico no podrá diferirse para permitir producción ordinaria.

##### `DESCARTADO`

La regla no requiere prueba o el requisito era duplicado.

Exige justificación aprobada y referencia al requisito conservado cuando exista duplicidad.

##### `OBSOLETO`

El comportamiento protegido fue retirado o reemplazado.

Debe conservarse el historial y señalar su sucesor cuando aplique.

---

#### 13. Transiciones permitidas

```text
IDENTIFICADO
        ↓
ESPECIFICADO
        ↓
PLANIFICADO
        ↓
IMPLEMENTADO
        ↓
VERIFICADO
```

Transiciones controladas:

```text
IDENTIFICADO / ESPECIFICADO / PLANIFICADO
        → DIFERIDO

IDENTIFICADO / ESPECIFICADO
        → DESCARTADO

cualquier estado vigente
        → OBSOLETO
```

Reglas adicionales:

1. `VERIFICADO` no es una aprobación permanente.
2. Una falla posterior reabre el requisito.
3. Una modificación sustantiva de la regla puede crear un nuevo requisito.
4. Los estados históricos no se eliminan para ocultar fallas.
5. La fecha y resultado de la última ejecución deberán actualizarse cuando exista automatización.

---

#### 14. Prioridades y efecto sobre las puertas

##### Crítica

Incluye riesgos de:

- acceso no autorizado;
- pérdida o exposición de datos;
- dinero;
- inventario;
- identidad;
- efectos irreversibles;
- cumplimiento legal;
- duplicación de movimientos;
- corrupción de migraciones;
- imposibilidad de rollback.

Regla:

- debe bloquear paquete, merge, despliegue o piloto según corresponda;
- deberá automatizarse cuando el comportamiento sea determinista;
- no podrá quedar diferida para producción ordinaria.

##### Alta

Incluye:

- interrupción de un proceso principal;
- resultado empresarial incorrecto;
- incompatibilidad entre aplicaciones;
- fallo de integración recuperable con impacto operativo alto.

Regla:

- debe resolverse antes de cerrar el paquete o iniciar piloto, salvo puerta explícita más estricta.

##### Media

Incluye:

- errores recuperables;
- rutas secundarias;
- degradación controlada;
- comportamiento no crítico.

Regla:

- podrá planificarse dentro del paquete o antes del cierre integral con destino exacto.

##### Baja

Incluye:

- validaciones no críticas;
- comportamientos cosméticos verificables;
- mejoras de conveniencia.

Regla:

- podrá utilizar validación manual o diferimiento formal sin bloquear producción, si no afecta otro requisito.

---

#### 15. Tipos de prueba

Tipos permitidos:

- `unitaria`;
- `contractual`;
- `componente`;
- `integración`;
- `base_de_datos`;
- `migración`;
- `RLS`;
- `RPC`;
- `seguridad`;
- `concurrencia`;
- `idempotencia`;
- `E2E`;
- `regresión`;
- `interfaz`;
- `experiencia`;
- `manual_operativa`;
- `hardware`.

Un requisito podrá tener un tipo principal y tipos complementarios.

Ejemplo:

```text
tipo principal: integración
complementarios: idempotencia, regresión
```

---

#### 16. Modalidades

##### Automatizada

Se utilizará por defecto cuando el resultado sea determinista y ejecutable sin interpretación humana.

Ejemplos:

- cálculos;
- permisos;
- RLS;
- RPC;
- estados;
- migraciones;
- contratos;
- validaciones;
- reintentos;
- idempotencia;
- integridad.

##### Manual

Se utilizará cuando la comprobación dependa principalmente de:

- comprensión humana;
- ergonomía;
- experiencia;
- operación física;
- impresión real;
- sonido;
- cámara;
- periféricos;
- conectividad del sitio;
- capacitación.

##### Híbrida

Combina una verificación automatizada del contrato con una comprobación física u operativa.

Ejemplo:

```text
automatizada:
el ZPL generado contiene dimensiones y datos correctos

manual:
la Zebra imprime centrada y el código es legible
```

Una prueba manual no será una categoría inferior. Deberá tener pasos, ambiente, responsable, resultado y evidencia.

---

#### 17. Momento de creación, especificación e implementación

| Etapa                        | Obligación                                                           |
| ---------------------------- | -------------------------------------------------------------------- |
| E1 — descubrimiento          | crear o reutilizar `TREQ-*` y registrar riesgo                       |
| E2 — procesos y experiencia  | definir actor, escenario, resultado y casos operativos               |
| E3 — Supabase                | definir datos, integridad, migración, RLS, RPC y rollback            |
| E4 — servicios transversales | definir contratos, colas, impresión, notificaciones y evidencia      |
| E5 — planificación           | asignar paquete, repositorio, ambiente, archivos, comando y puerta   |
| T / R0 — infraestructura     | habilitar runner, CI, staging, harness y datos aislados              |
| implementación por paquete   | escribir la prueba junto con el código o migración                   |
| integración                  | ejecutar contratos entre consumidores                                |
| piloto e hypercare           | convertir cada defecto en regresión                                  |
| U — cierre integral          | ejecutar regresión completa, seguridad, E2E, experiencia y operación |

El BLOQUE U no será el lugar inicial para escribir las pruebas unitarias, contractuales, de seguridad o integración que debieron acompañar el paquete.

---

#### 18. Regla para defectos y regresiones

Cuando se detecte un defecto:

1. deberá reproducirse de forma controlada;
2. deberá buscarse si ya existe un `TREQ-*`;
3. si no existe, deberá crearse;
4. deberá registrarse el caso que falló;
5. la corrección deberá incluir la prueba automatizada cuando sea viable;
6. si solo es verificable manualmente, deberá documentarse el procedimiento;
7. la prueba deberá fallar antes de la corrección cuando sea técnicamente posible;
8. deberá aprobar después de la corrección;
9. quedará incorporada a la regresión futura;
10. el incidente se cerrará con evidencia.

No se admitirá corregir un error crítico y confiar únicamente en recordar volver a probarlo.

---

#### 19. Estrategia de datos de prueba

`QA-GOV-001` no crea ni ordena restaurar un seed global.

Se conservan las decisiones de `CODE-AUD-007`:

- el seeding local permanece deshabilitado;
- no se cargará un catálogo demo completo durante `supabase db reset`;
- las migraciones productivas no se tratarán como fixtures;
- no se reutilizarán datos históricos de sandbox retirados.

La estrategia preferida será:

1. factories o constructores mínimos;
2. fixtures específicos por contrato;
3. datos efímeros;
4. transacciones revertibles;
5. proyectos o ambientes aislados;
6. identificadores explícitos de prueba;
7. limpieza determinista.

Producción:

- no deberá recibir datasets sintéticos por defecto;
- no deberá utilizarse para pruebas destructivas;
- solo admitirá verificaciones controladas y no mutantes, salvo piloto o procedimiento aprobado;
- no deberán copiarse datos personales reales a ambientes de prueba sin anonimización y autorización.

---

#### 20. Ambientes de ejecución

Valores permitidos:

- `local_aislado`;
- `CI`;
- `staging`;
- `preview`;
- `piloto_controlado`;
- `hardware_fisico`;
- `produccion_no_mutante`;
- `produccion_controlada`, únicamente cuando exista autorización expresa.

Cada requisito deberá indicar el ambiente mínimo requerido antes de pasar a `PLANIFICADO`.

---

#### 21. Relación con paquetes de implementación

`DELIV-PKG-016` deberá convertir los requisitos asignados en una matriz ejecutable.

Cada paquete deberá declarar:

- requisitos incluidos;
- requisitos excluidos;
- requisitos diferidos;
- archivos de prueba;
- datos de prueba;
- comandos;
- ambiente;
- criterios de aprobación;
- pruebas existentes que no pueden romperse;
- evidencia esperada;
- efecto de una falla sobre merge, despliegue, piloto y rollback.

Una capacidad no podrá entrar a implementación si sus requisitos críticos no están al menos `PLANIFICADOS`.

---

#### 22. Relación con tareas `AUTH-QA-*` y `UX-QA-*`

Las tareas existentes del BLOQUE U se conservan.

Su función será:

- certificar escenarios integrales;
- ejecutar pruebas de seguridad;
- validar comportamiento por rol;
- validar procesos entre aplicaciones;
- comprobar experiencia y operación real;
- ejecutar regresión transversal.

No deberán utilizarse para aplazar la implementación de pruebas que pertenecen al paquete.

Ejemplo:

```text
TREQ-AUTH-001
→ se implementa mediante pruebas RLS, RPC y servidor dentro del paquete
→ se vuelve a certificar mediante AUTH-QA-023 en BLOQUE U
```

---

#### 23. Relación con el Registro Canónico de Brechas

Un `TREQ-*` no es automáticamente una brecha.

Puede representar:

- una regla nueva;
- una protección preventiva;
- una regresión;
- un criterio de aceptación;
- una obligación de seguridad.

Cuando la ausencia de una prueba implique cobertura insuficiente, podrá vincularse también con un `GAP-*`.

Relación:

```text
GAP
→ describe qué falta o está mal

TREQ
→ describe qué deberá comprobarse para demostrar la corrección

DELIV-PKG
→ implementa la solución y la prueba
```

---

#### 24. Responsabilidades

Las responsabilidades pueden recaer en la misma persona, pero no podrán omitirse.

##### Autor de la tarea de origen

- detecta la necesidad;
- busca duplicados;
- crea o reutiliza el ID;
- registra regla, riesgo, prioridad y tarea responsable.

##### Propietario funcional

- confirma que el resultado esperado representa la operación real;
- define casos permitidos, denegados y excepciones.

##### Propietario técnico

- define tipo, modalidad, ambiente y estrategia de datos;
- evita pruebas acopladas a detalles irrelevantes.

##### Propietario del paquete

- implementa;
- integra con CI;
- conserva pruebas anteriores;
- entrega evidencia.

##### Responsable de verificación

- ejecuta o revisa la evidencia;
- registra el resultado;
- reabre el requisito si falla.

---

#### 25. Puertas obligatorias

##### Aprobación de una tarea documental

Una tarea podrá aprobarse sin implementar la prueba cuando:

- el requisito está creado o reutilizado;
- la fila está registrada;
- la tarea responsable es exacta;
- la etapa de implementación está definida;
- no queda una mención narrativa sin dueño.

##### Aprobación de un paquete E5

Exige:

- requisitos críticos y altos identificados;
- escenarios especificados;
- paquete, repositorio y ambiente asignados;
- modalidad definida;
- diferimientos justificados;
- criterio de evidencia.

##### Cierre de implementación

Exige:

- pruebas implementadas;
- comandos ejecutables;
- resultado aprobado;
- no ruptura de regresión;
- evidencia;
- actualización del registro.

##### Entrada a piloto

Exige:

- cero requisitos críticos fallidos;
- requisitos altos aplicables verificados;
- validaciones manuales de hardware programadas;
- rollback probado cuando corresponda.

##### Cierre del BLOQUE U

Exige:

- regresión integral;
- E2E;
- seguridad;
- pruebas por aplicación;
- validaciones operativas;
- estado final de todos los requisitos críticos y altos.

---

#### 26. Evidencia mínima

##### Automatizada

Deberá incluir:

- ID `TREQ-*`;
- archivo o suite;
- comando;
- ambiente;
- fecha o ejecución;
- resultado;
- commit o versión;
- enlace o ruta de reporte cuando exista.

##### Manual

Deberá incluir:

- ID `TREQ-*`;
- procedimiento;
- actor;
- sede o ambiente;
- dispositivo;
- datos usados;
- fecha;
- resultado;
- observaciones;
- evidencia adjunta cuando corresponda.

No será evidencia suficiente escribir solamente:

```text
probado manualmente
```

---

#### 27. Control temporal antes de automatizar el registro

Hasta implementar `SHELL-CI-017`, la verificación será manual y deberá comprobar:

1. que el ID no esté duplicado;
2. que el dominio esté permitido;
3. que el origen exista;
4. que la tarea responsable exista;
5. que `VERIFICADO` tenga evidencia;
6. que `DIFERIDO` tenga tarea de reanudación;
7. que `DESCARTADO` tenga justificación;
8. que un requisito crítico no llegue a E5 sin paquete;
9. que todo requisito usado en un paquete exista en el registro;
10. que no haya requisitos eliminados silenciosamente.

Después, `SHELL-CI-017` deberá convertir estas reglas en un verificador automático.

---

#### 28. Política para cambios y pull requests futuros

Cuando exista infraestructura de CI, todo cambio que implemente o modifique una regla protegida deberá:

- mencionar los IDs `TREQ-*`;
- añadir o actualizar las pruebas;
- ejecutar la suite correspondiente;
- impedir merge si falla una prueba bloqueante;
- publicar evidencia;
- actualizar el registro cuando cambie el estado.

Esta política no se implementa durante `QA-GOV-001`. Su implementación pertenece al BLOQUE T y a los paquetes correspondientes.

---

#### 29. Cobertura desde este punto

Desde `CODE-AUD-008`, toda tarea nueva deberá aplicar inmediatamente este gobierno.

Las tareas anteriores a `QA-GOV-001` no se modificarán una por una durante la continuidad inmediata.

Se crea la siguiente tarea derivada:

```text
QA-REG-001
— Consolidar retrospectivamente requisitos de prueba de decisiones,
  hallazgos e incidentes anteriores a QA-GOV-001
```

Definición de `QA-REG-001`:

- **Bloque:** E1;
- **archivo lógico propietario:** `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
- **dependencia:** `CODE-AUD-020`;
- **momento de ejecución:** después de `CODE-AUD-020` y antes de `CAP-SCOPE-001`;
- **propósito:** revisar decisiones aprobadas, hallazgos, `AUTH-QA-*`, `UX-QA-*`, brechas y reglas críticas anteriores; crear requisitos faltantes; deduplicarlos; asignar tareas de maduración;
- **restricción:** no implementar pruebas ni modificar código;
- **salida:** registro retrospectivo inicial completo y trazable.

`QA-REG-001` no interrumpe la continuidad inmediata hacia `CODE-AUD-008`, pero deberá quedar físicamente materializada antes de avanzar desde `QA-GOV-001`.

---

#### 30. Estado inicial del registro

El archivo `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` ya existe con una estructura inicial, pero su tabla permanece vacía.

Decisión:

- no se inventarán requisitos para llenar el registro;
- los requisitos nuevos comenzarán a registrarse desde `CODE-AUD-008`;
- la cobertura retrospectiva se realizará mediante `QA-REG-001`;
- los IDs se asignarán únicamente después de identificar una regla concreta;
- las pruebas existentes de VITAL permanecerán fuera de Vento OS.

---

#### 31. Correcciones documentales asociadas a la consolidación

Al consolidar la aprobación de `QA-GOV-001` deberán ejecutarse estas acciones documentales:

1. reemplazar el marcador de `QA-GOV-001` por su contenido aprobado;
2. conservar `CODE-AUD-008` como continuidad inmediata;
3. materializar el marcador de `QA-REG-001` dentro de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
4. insertar `QA-REG-001` en `90_ORDEN_DE_IMPLEMENTACION.md` después de `CODE-AUD-020` y antes de `CAP-SCOPE-001`;
5. alinear `00_CABECERA_Y_ESTADO.md` con la continuidad vigente;
6. regenerar el compilado y el registro global;
7. comprobar que cada identificador de tarea aparezca exactamente una vez;
8. normalizar en `01_PROTOCOLO.md` la duplicación del párrafo sobre pendientes sin destino;
9. conservar las reglas de prueba como bloque normativo identificable sin dejar una numeración incoherente.

Estas acciones son de consolidación documental. No constituyen implementación de pruebas.

---

#### 32. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `QA-GOV-001` define el gobierno documental y el ciclo de vida de requisitos de prueba, pero no crea ni modifica un comportamiento ejecutable de Vento OS.

La tarea sí genera la tarea documental derivada `QA-REG-001`, responsable de la consolidación retrospectiva.

---

#### 33. Decisiones propuestas

1. Se adopta `TREQ-*` como identificador canónico de requisitos de prueba.
2. Un requisito no equivale a una tarea, archivo o evidencia.
3. La tarea de origen conserva la razón histórica del requisito.
4. El registro central conserva su estado vigente.
5. Los IDs serán inmutables y no reutilizables.
6. Toda regla determinista crítica deberá automatizarse cuando sea técnicamente viable.
7. Las pruebas manuales se conservarán para experiencia, operación y hardware.
8. Una prueba manual deberá producir evidencia estructurada.
9. E1 identifica requisitos.
10. E2, E3 y E4 los especifican.
11. E5 los asigna a paquetes.
12. T y R0 crean infraestructura de ejecución.
13. Cada paquete implementa sus pruebas junto con el código.
14. Piloto e hypercare convierten defectos en regresiones.
15. U ejecuta certificación integral, no la primera implementación de todas las pruebas.
16. No se crea un seed global.
17. Los datos de prueba deberán ser mínimos, aislados y limpiables.
18. Producción no se utilizará para pruebas destructivas.
19. Los requisitos críticos bloquearán las puertas correspondientes.
20. `VERIFICADO` podrá reabrirse si una ejecución posterior falla.
21. Los requisitos descartados u obsoletos permanecerán como historial.
22. `AUTH-QA-*` y `UX-QA-*` se conservarán como tareas de certificación.
23. Un requisito podrá vincularse con una brecha, pero no será automáticamente una brecha.
24. `SHELL-CI-017` automatizará posteriormente la validación del registro.
25. Desde `CODE-AUD-008`, todas las tareas deberán registrar o descartar expresamente requisitos.
26. `QA-REG-001` consolidará retrospectivamente lo aprobado antes de este gobierno.
27. `QA-REG-001` se ejecutará después de `CODE-AUD-020`.
28. `CODE-AUD-008` permanecerá como única continuidad inmediata después de aprobar esta tarea.

---

#### 34. Límites de esta tarea

`QA-GOV-001` no:

- selecciona todavía Jest, Vitest, Playwright u otra herramienta;
- crea suites;
- crea fixtures;
- crea seeds;
- modifica GitHub Actions;
- crea un ambiente staging;
- ejecuta pruebas;
- modifica Supabase;
- corrige defectos;
- asigna requisitos retrospectivos concretos;
- declara cubierta una regla solo porque exista una tarea `QA`;
- convierte VITAL en parte de Vento OS.

Las herramientas y arquitectura física se definirán en T, R0 y los paquetes de implementación.

---

#### 35. Criterios de aceptación

`QA-GOV-001` podrá aprobarse cuando:

- requisito, tarea, prueba, ejecución y evidencia estén diferenciados;
- la fuente de verdad del ciclo de vida esté definida;
- la convención `TREQ-*` esté definida;
- los dominios iniciales estén definidos;
- los disparadores de creación estén definidos;
- los casos de no creación estén definidos;
- la deduplicación esté definida;
- el formato obligatorio por tarea esté definido;
- los campos del registro estén definidos;
- los estados y transiciones estén definidos;
- las prioridades y bloqueos estén definidos;
- los tipos y modalidades estén definidos;
- el momento de implementación por etapa esté definido;
- el tratamiento de defectos y regresiones esté definido;
- la estrategia de datos no contradiga `CODE-AUD-007`;
- los ambientes estén definidos;
- la relación con E5, T, R0 y U esté definida;
- la relación con `AUTH-QA-*`, `UX-QA-*` y brechas esté definida;
- las responsabilidades estén definidas;
- la evidencia mínima esté definida;
- el control manual previo a `SHELL-CI-017` esté definido;
- `QA-REG-001` tenga identificador, propósito, dependencia, archivo propietario y momento;
- `QA-REG-001` quede obligado a materializarse antes de avanzar;
- `CODE-AUD-008` permanezca como continuidad inmediata;
- no se haya implementado código, CI ni Supabase.

---

#### 36. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
necesidad verificable
        ↓
TREQ identificado y registrado
        ↓
especificación progresiva
        ↓
paquete y repositorio
        ↓
prueba implementada con el cambio
        ↓
ejecución y evidencia
        ↓
regresión y certificación integral
```

La continuidad inmediata será:

```text
CODE-AUD-008
— Detectar TODO, FIXME, stubs y funciones no terminadas
```


### ✅ CODE-AUD-008 — Detectar `TODO`, `FIXME`, stubs y funciones no terminadas

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría estática transversal de marcadores de deuda, implementaciones provisionales y funciones sin efecto completo  
**Dependencia anterior:** `QA-GOV-001`  
**Continuidad reservada:** `CODE-AUD-009`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea inspecciona señales explícitas y semánticas de implementación incompleta en los repositorios inventariados para Vento OS.

La revisión diferencia:

1. comentarios `TODO`;
2. comentarios `FIXME`;
3. marcadores `HACK`, `WIP`, `Not implemented` o equivalentes;
4. funciones que solo muestran un mensaje de “Próximamente”;
5. handlers vacíos;
6. funciones que retornan un valor neutro sin ejecutar la capacidad prometida;
7. lógica declarada temporalmente;
8. scripts o workflows creados para aplicar un parche provisional;
9. artefactos de error dejados por una implementación incompleta;
10. textos de interfaz, placeholders y estados vacíos que no constituyen deuda técnica.

Resultado general:

- no se localizaron marcadores `FIXME`, `Not implemented` o `stub` confirmados dentro del código de ejecución de Vento OS;
- las búsquedas genéricas de `TODO` producen numerosos falsos positivos porque coinciden con las palabras españolas `todo` y `todos`;
- se localizaron dos funciones de navegación de PASS que son stubs reales;
- se localizó una regla temporal en el historial de Saudo que puede ocultar transacciones legítimas;
- se localizaron en NEXO un script, un workflow temporal con permisos de escritura y un artefacto de error que demuestran una automatización de parche incompleta;
- se localizó una coincidencia `TODO:` dentro de la migración baseline histórica de `vento-shell`, pero el contexto exacto no quedó establecido mediante la búsqueda indexada y no se clasifica como defecto activo;
- no se eliminará ni modificará nada durante descubrimiento.

---

#### 2. Definiciones utilizadas

| Categoría             | Definición                                                                                            |
| --------------------- | ----------------------------------------------------------------------------------------------------- |
| `TODO`                | nota explícita de trabajo pendiente dentro del código                                                 |
| `FIXME`               | nota explícita de comportamiento defectuoso que requiere corrección                                   |
| stub                  | función, componente o endpoint que conserva la firma esperada, pero no ejecuta la capacidad prometida |
| handler vacío         | evento registrado que no produce efecto intencional                                                   |
| placeholder funcional | superficie visible que simula una capacidad aún inexistente                                           |
| fallback válido       | respuesta defensiva utilizada cuando una dependencia o dato no está disponible                        |
| estado vacío          | interfaz que comunica correctamente que no existen registros                                          |
| lógica temporal       | comportamiento explícitamente provisional que afecta resultados                                       |
| parche temporal       | script o workflow creado para modificar código mediante sustituciones transitorias                    |
| artefacto de error    | log o archivo persistido para registrar el fallo de una automatización                                |
| función parcial       | ejecuta una parte del proceso, pero omite casos que el propio código reconoce                         |

Una coincidencia textual no basta para clasificar un archivo como incompleto.

---

#### 3. Alcance revisado

La auditoría mantiene la clasificación de doce repositorios:

| Repositorio     | Tratamiento                                   |
| --------------- | --------------------------------------------- |
| `vento-shell`   | infraestructura y fuente canónica de Supabase |
| `vento-viso`    | VISO                                          |
| `vento-nexo`    | NEXO                                          |
| `vento-fogo`    | FOGO                                          |
| `vento-origo`   | ORIGO                                         |
| `vento-pulso`   | PULSO                                         |
| `vento-numera`  | NUMERA                                        |
| `Vento-Group`   | web pública                                   |
| `vento-anima`   | ANIMA                                         |
| `vento-pass`    | PASS                                          |
| `vento-talento` | base técnica futura                           |
| `vento-vital`   | proyecto separado, no computado como Vento OS |

Se excluyeron como evidencia concluyente:

- `node_modules`;
- archivos generados por dependencias;
- `package-lock.json`;
- documentación que solamente describe tareas futuras;
- el documento canónico que contiene los nombres `TODO` y `FIXME`;
- coincidencias dentro de palabras españolas;
- placeholders de formularios;
- estados vacíos de interfaz;
- retornos `null` o `[]` que representan resultados válidos;
- excepciones usadas como guardas de configuración o validación.

---

#### 4. Método de detección

Se buscaron señales como:

```text
TODO
TODO:
FIXME
HACK
WIP
stub
Not implemented
no implementado
en desarrollo
Próximamente
temporary
placeholder
return null
return []
handlers vacíos
```

Después de la búsqueda textual se realizó clasificación manual de los resultados relevantes.

La revisión no considera automáticamente incompleto un archivo por contener:

```text
placeholder="Nombre"
return null
return []
throw new Error(...)
```

Esas construcciones pueden ser correctas según su contrato.

---

#### 5. Resultado de marcadores explícitos

##### 5.1. `FIXME`

No se localizaron usos confirmados de `FIXME` dentro del código de ejecución de las aplicaciones Vento OS.

Las coincidencias encontradas pertenecen principalmente al documento canónico y al nombre de esta tarea.

##### 5.2. `Not implemented` y `stub`

No se localizaron marcadores confirmados `Not implemented`, `not implemented` o `stub` dentro del código de ejecución de Vento OS.

La ausencia de la palabra no demuestra que todas las funciones estén completas. Por eso esta tarea también inspecciona comportamiento semántico.

##### 5.3. `TODO`

La búsqueda genérica de `TODO` no puede utilizarse directamente en repositorios escritos en español porque produce coincidencias como:

```text
todo
todos
obtener todo el stock
todos los trabajadores
```

Esas coincidencias no representan marcadores técnicos.

La búsqueda más estricta `TODO:` localizó una coincidencia en:

```text
vento-shell/supabase/migrations/00000000000000_baseline.sql
```

La migración es una baseline histórica extensa. La búsqueda indexada no permitió establecer de forma confiable:

- la línea exacta;
- el objeto SQL afectado;
- si el comentario sigue vigente;
- si una migración posterior ya resolvió el asunto.

Por tanto:

- no se declara una función SQL incompleta;
- no se modifica la baseline;
- el marcador deberá localizarse y clasificarse durante la consolidación técnica de `CODE-AUD-020` y la auditoría de E3;
- no genera todavía un requisito `TREQ-*` porque no existe una regla protegida concreta identificada.

---

#### 6. PASS — funciones de navegación que son stubs reales

Archivo:

```text
vento-pass/src/utils/navigation.ts
```

El propio archivo se presenta como:

```text
Funciones de navegación (placeholders y enlaces externos)
```

##### 6.1. `goToMovements`

La función actual solo ejecuta:

```text
Alert.alert("Próximamente", "Pantalla de historial en desarrollo.")
```

No:

- navega;
- consulta movimientos;
- abre una pantalla;
- informa que la capacidad está deshabilitada por configuración;
- recibe un error técnico que justifique el fallback.

**Clasificación:** stub funcional confirmado.

La existencia de otras pantallas de historial en PASS no permite concluir automáticamente cuál debería consumir esta función. Primero deberá identificarse:

- dónde se importa;
- qué botón la invoca;
- qué historial promete;
- si debe conectarse a una ruta existente;
- si debe retirarse por duplicación.

##### 6.2. `onScanTable`

La función actual solo ejecuta:

```text
Alert.alert("Próximamente", "Escaneo de mesa en desarrollo.")
```

No:

- solicita permiso de cámara;
- abre un escáner;
- valida un QR;
- identifica mesa o sede;
- inicia un proceso;
- declara una feature flag.

**Clasificación:** stub funcional confirmado.

No se asume que el escaneo de mesa deba implementarse necesariamente. La decisión podrá ser:

1. implementar la capacidad;
2. reemplazarla por otro flujo;
3. retirarla;
4. ocultarla hasta que exista contrato funcional.

##### 6.3. Fallbacks de menú

`goToMenuVento` y `goToMenuSaudo` sí navegan cuando reciben un objeto de navegación válido o cuando existe `navigationRef`.

Solo muestran “Próximamente” si no existe mecanismo de navegación.

**Clasificación:** fallback defensivo, no stub confirmado.

---

#### 7. PASS — historial de Saudo con lógica explícitamente parcial

Archivo:

```text
vento-pass/src/components/Saudo.tsx
```

El historial filtra transacciones mediante:

```text
metadata.site_id
```

El propio código declara:

```text
Por ahora, filtramos solo las que tienen metadata con site_id
```

y excluye toda transacción que no tenga ese campo.

Consecuencia estática:

- una transacción legítima sin `metadata.site_id` no aparece en el historial de Saudo;
- el usuario no recibe indicación de que existen registros sin atribución;
- la ausencia en pantalla puede confundirse con inexistencia;
- no se verificó si todos los productores actuales escriben `site_id`.

**Clasificación:** función parcial y decisión temporal explícita.

Esta tarea no declara que actualmente existan transacciones omitidas. Declara que el código admite silenciosamente esa posibilidad.

Destinos:

- `CODE-AUD-009`: registrar la decisión temporal;
- `CODE-AUD-012`: revisar el proceso de historial parcialmente implementado;
- `CODE-AUD-019`: vincular la capacidad con productores y contratos;
- `CODE-AUD-020`: definir corrección o migración.

El texto:

```text
Próximamente habrá productos para canjear
```

usado cuando no existen recompensas es un estado vacío de interfaz y no se clasifica como stub.

---

#### 8. NEXO — automatización temporal de parche no finalizada

Se localizaron estos artefactos:

```text
vento-nexo/scripts/tmp-apply-privileged-request-area.mjs
vento-nexo/.github/workflows/tmp-apply-privileged-request-area.yml
vento-nexo/scripts/tmp-privileged-area-patch-error.txt
```

##### 8.1. Script temporal

El script declara que fue activado después de que un workflow temporal estuviera disponible en `preview`.

Su mecanismo consiste en:

- abrir archivos de remisiones;
- buscar fragmentos literales;
- reemplazar cadenas de código;
- fallar si no encuentra el texto esperado;
- escribir directamente los archivos modificados.

No constituye una migración estructurada ni una implementación estable.

##### 8.2. Workflow temporal

El workflow:

- se ejecuta manualmente y al abrir o actualizar PR hacia `preview`;
- solicita permiso `contents: write`;
- hace checkout directo de `preview`;
- modifica dinámicamente el propio script antes de ejecutarlo;
- aplica el parche;
- escribe un archivo de error y lo hace commit en `preview` si falla;
- intenta compilar;
- en caso de éxito elimina el script, el workflow y los logs temporales;
- hace commit y push automático a `preview`.

La lógica de autolimpieza solo ocurre si toda la secuencia termina correctamente.

##### 8.3. Error persistente

El archivo:

```text
scripts/tmp-privileged-area-patch-error.txt
```

registra:

```text
Error: createRemission inventory block missing
```

Esto demuestra que:

- el workflow sí intentó ejecutar el parche;
- una sustitución esperada no encontró el bloque;
- la fase de limpieza no se completó;
- el script, workflow y log permanecieron versionados.

**Clasificación:** implementación temporal fallida y artefactos de transición todavía presentes.

No se concluye automáticamente que la selección privilegiada de área esté ausente del código actual. Puede haber sido implementada de otra forma. Debe comprobarse:

- si el comportamiento objetivo ya existe;
- si el workflow sigue activable;
- si puede volver a modificar `preview`;
- si los permisos de escritura siguen siendo necesarios;
- si los tres artefactos pueden retirarse;
- si el error dejó una implementación parcial.

Destinos:

- `CODE-AUD-013`: clasificar como mecanismo legacy todavía activo o activable;
- `CODE-AUD-015`: confirmar consumidores y necesidad;
- `CODE-AUD-016`: revisar su relación con build y CI;
- `CODE-AUD-017`: revisar permisos y mutación automática de ramas;
- `CODE-AUD-020`: decidir retiro y registrar el backlog.

---

#### 9. Matriz por repositorio

| Repositorio     | Marcador o función incompleta confirmada                               | Estado                                         |
| --------------- | ---------------------------------------------------------------------- | ---------------------------------------------- |
| `vento-shell`   | una coincidencia `TODO:` en baseline histórica sin contexto suficiente | por clasificar en `CODE-AUD-020` / E3          |
| `vento-viso`    | no se localizó marcador o stub confirmado                              | sin hallazgo explícito al corte                |
| `vento-nexo`    | workflow, script y log de parche temporal fallido                      | confirmado                                     |
| `vento-fogo`    | no se localizó marcador o stub confirmado                              | sin hallazgo explícito al corte                |
| `vento-origo`   | no se localizó marcador o stub confirmado                              | sin hallazgo explícito al corte                |
| `vento-pulso`   | no se localizó marcador o stub confirmado                              | sin hallazgo explícito al corte                |
| `vento-numera`  | no se localizó marcador o stub confirmado                              | sin hallazgo explícito al corte                |
| `Vento-Group`   | no se localizó marcador o stub confirmado                              | sin hallazgo explícito al corte                |
| `vento-anima`   | no se localizó marcador o stub confirmado                              | sin hallazgo explícito al corte                |
| `vento-pass`    | dos funciones de navegación stub y un filtro temporal parcial          | confirmado                                     |
| `vento-talento` | no se localizó marcador o stub confirmado                              | producto futuro; no equivale a código completo |
| `vento-vital`   | fuera de Vento OS                                                      | no incorporado al backlog Vento OS             |

“Sin hallazgo explícito” no significa que todo el repositorio esté completo. Las tareas `CODE-AUD-009` a `CODE-AUD-012` continuarán la detección semántica.

---

#### 10. Falsos positivos excluidos

##### 10.1. Palabra española `todo`

Expresiones como:

```text
obtener todo el stock
todos los registros
todos los trabajadores
```

no son comentarios `TODO`.

##### 10.2. Placeholders de formularios

Ejemplos:

```text
placeholder="Nombre"
placeholder="Buscar"
```

son ayudas de interfaz, no funciones incompletas.

##### 10.3. Estados vacíos

Mensajes como:

```text
Sin novedades por ahora
No hay productos disponibles
Tus transacciones aparecerán aquí
```

pueden ser estados correctos cuando no existen datos.

##### 10.4. Retornos neutros

`return null` y `return []` pueden representar:

- registro inexistente;
- configuración ausente;
- lista vacía;
- fallo controlado;
- componente que no debe renderizar.

Solo serán stubs cuando el contrato prometa una acción y el retorno la suprima sin justificación.

##### 10.5. Excepciones

`throw new Error(...)` no implica función sin terminar. Muchas ocurrencias son guardas válidas de:

- configuración;
- autenticación;
- parámetros;
- dependencias;
- integridad.

##### 10.6. Fallbacks defensivos

Mostrar un mensaje de indisponibilidad cuando falta una dependencia no es igual a exponer una capacidad que nunca fue implementada.

---

#### 11. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                   | Clasificación                                 | Destino                                    |
| ---------------- | ------------------------------------------------------------------------------------------ | --------------------------------------------- | ------------------------------------------ |
| `H-CODE-008-001` | no se localizaron `FIXME`, `Not implemented` o `stub` explícitos en runtime Vento OS       | resultado de inventario                       | cerrado; continuar auditoría semántica     |
| `H-CODE-008-002` | la búsqueda genérica de `TODO` se contamina con `todo` y `todos`                           | limitación metodológica                       | cerrado                                    |
| `H-CODE-008-003` | existe una coincidencia `TODO:` en la baseline SQL sin contexto confirmado                 | marcador histórico por clasificar             | `CODE-AUD-020`, E3                         |
| `H-CODE-008-004` | `goToMovements` de PASS solo muestra “Próximamente”                                        | stub funcional                                | `CODE-AUD-010`, `012`, `015`, `019`, `020` |
| `H-CODE-008-005` | `onScanTable` de PASS solo muestra “Próximamente”                                          | stub funcional                                | `CODE-AUD-010`, `012`, `015`, `019`, `020` |
| `H-CODE-008-006` | los fallbacks de menú PASS sí intentan navegar                                             | fallback válido                               | cerrado                                    |
| `H-CODE-008-007` | historial Saudo excluye transacciones sin `metadata.site_id`                               | función parcial temporal                      | `CODE-AUD-009`, `012`, `019`, `020`        |
| `H-CODE-008-008` | NEXO conserva workflow temporal con `contents: write` y mutación automática de `preview`   | automatización provisional activa o activable | `CODE-AUD-013`, `015`, `016`, `017`, `020` |
| `H-CODE-008-009` | el parche NEXO falló y dejó script, workflow y log versionados                             | transición incompleta                         | `CODE-AUD-013`, `015`, `020`               |
| `H-CODE-008-010` | no se localizaron handlers literalmente vacíos mediante las búsquedas realizadas           | resultado de inventario                       | cerrado                                    |
| `H-CODE-008-011` | placeholders, estados vacíos y retornos neutros no pueden tratarse como deuda sin contexto | regla de clasificación                        | cerrado                                    |
| `H-CODE-008-012` | VITAL permanece separado del backlog Vento OS                                              | límite de alcance                             | cerrado                                    |

Todos los hallazgos quedan cerrados o vinculados con tareas existentes.

---

#### 12. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 12.1. Requisitos nuevos

| ID              | Regla protegida                                                                                                                                                                            | Origen                             | Riesgo                                                               | Tipo / modalidad                                   | Prioridad | Tarea responsable inmediata | Estado         |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------- | --------- | --------------------------- | -------------- |
| `TREQ-PASS-001` | Toda acción visible de “movimientos” deberá abrir una capacidad real y autorizada, o no deberá exponerse como acción disponible                                                            | `H-CODE-008-004`                   | acción engañosa y navegación muerta                                  | interfaz + E2E / automatizada                      | alta      | `CODE-AUD-010`              | `IDENTIFICADO` |
| `TREQ-PASS-002` | Toda acción visible de escaneo de mesa deberá ejecutar el flujo aprobado con validación de dispositivo y servidor, o permanecer retirada de la navegación                                  | `H-CODE-008-005`                   | capacidad operativa ficticia o uso incorrecto de QR                  | interfaz + hardware + E2E / híbrida                | alta      | `CODE-AUD-010`              | `IDENTIFICADO` |
| `TREQ-PASS-003` | El historial de Saudo deberá atribuir cada transacción a una sede de forma determinista o mostrar explícitamente su estado sin atribución, sin omitir silenciosamente registros legítimos  | `H-CODE-008-007`                   | historial incompleto y pérdida de trazabilidad visible               | integración + regresión / automatizada             | alta      | `CODE-AUD-012`              | `IDENTIFICADO` |
| `TREQ-NEXO-001` | La selección privilegiada de área solicitante deberá funcionar desde el código canónico y superar build y validación sin depender de workflows o scripts temporales que reescriban la rama | `H-CODE-008-008`, `H-CODE-008-009` | deriva de código, mutación insegura de rama e implementación parcial | integración + seguridad + regresión / automatizada | alta      | `CODE-AUD-016`              | `IDENTIFICADO` |

##### 12.2. Materialización obligatoria

Al aprobar `CODE-AUD-008`, estas cuatro filas deberán agregarse al:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

No deberán marcarse como `IMPLEMENTADO` ni `VERIFICADO`.

##### 12.3. Maduración posterior

- `TREQ-PASS-001` y `TREQ-PASS-002` deberán precisar consumidores y alcance en `CODE-AUD-010`, `012`, `015` y `019`.
- `TREQ-PASS-003` deberá identificar productores de transacciones, contrato de `site_id`, datos existentes y migración necesaria.
- `TREQ-NEXO-001` deberá determinar si el comportamiento ya está integrado y si los artefactos temporales pueden retirarse.
- La asignación a paquetes E5 ocurrirá después de `CODE-AUD-020`, la matriz de cobertura y el diseño funcional correspondiente.

---

#### 13. Decisiones propuestas

1. No se tratarán coincidencias textuales como defectos sin inspección semántica.
2. `FIXME`, `Not implemented` y `stub` no tienen ocurrencias confirmadas en runtime Vento OS al corte.
3. Una búsqueda de `TODO` deberá distinguir mayúsculas, delimitadores y comentarios para evitar falsos positivos en español.
4. La coincidencia de baseline se conserva como marcador histórico pendiente de clasificación.
5. No se editará una migración baseline aplicada para eliminar un comentario.
6. `goToMovements` se clasifica como stub.
7. `onScanTable` se clasifica como stub.
8. Los fallbacks de menú PASS no se clasifican como stubs.
9. El filtro temporal del historial Saudo se clasifica como implementación parcial.
10. No se presume que ya existan datos históricos omitidos.
11. El script de parche NEXO se clasifica como temporal.
12. El workflow NEXO se clasifica como automatización provisional con capacidad de escritura.
13. El log persistente confirma que la automatización falló.
14. No se eliminarán los artefactos hasta confirmar el estado real del comportamiento y sus consumidores.
15. Los textos de estados vacíos no se clasificarán como funciones incompletas.
16. Los placeholders de campos no se clasificarán como deuda.
17. `return null` y `return []` requerirán análisis contractual antes de clasificarse.
18. TALENTO no se considera completo solo porque no tenga marcadores explícitos.
19. VITAL permanece fuera de Vento OS.
20. Se crean cuatro requisitos `TREQ-*`.
21. Los cuatro requisitos quedan inicialmente `IDENTIFICADO`.
22. `CODE-AUD-009` será la única continuidad inmediata.

---

#### 14. Límites de certeza

Esta tarea no confirma:

- que todos los comentarios pendientes estén indexados por GitHub;
- que nunca existan marcadores en ramas diferentes a las inspeccionadas;
- que una función sin comentario esté completa;
- que una alerta “Próximamente” sea alcanzable actualmente;
- que los stubs de PASS tengan consumidores activos;
- que existan transacciones Saudo omitidas en producción;
- que la selección privilegiada de área NEXO esté ausente;
- que el workflow temporal continúe ejecutándose;
- que el `TODO:` de baseline represente una brecha vigente;
- que todos los retornos neutros sean correctos;
- que ausencia de marcador implique calidad funcional.

Las tareas siguientes inspeccionarán decisiones temporales, interfaces sin lógica y procesos parciales.

---

#### 15. Criterios de aceptación

`CODE-AUD-008` podrá aprobarse cuando:

- `TODO`, `FIXME`, stub, fallback y estado vacío estén diferenciados;
- se documente la contaminación de búsqueda por palabras españolas;
- la coincidencia de baseline tenga destino sin editar la migración;
- los dos stubs de PASS estén identificados;
- los fallbacks de menú no se clasifiquen erróneamente;
- el filtro parcial de Saudo tenga destino;
- el script temporal de NEXO esté inventariado;
- el workflow temporal y sus permisos estén inventariados;
- el error persistente del parche esté registrado;
- cada repositorio tenga clasificación;
- los falsos positivos estén excluidos;
- cada hallazgo tenga destino exacto;
- se creen `TREQ-PASS-001` a `TREQ-PASS-003`;
- se cree `TREQ-NEXO-001`;
- los requisitos permanezcan en estado `IDENTIFICADO`;
- no se elimine ni modifique código;
- no se modifique Supabase;
- `CODE-AUD-009` permanezca como única continuidad.

---

#### 16. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
marcador o comportamiento sospechoso
        ↓
clasificación semántica
        ↓
stub, parcial, temporal, fallback o falso positivo
        ↓
hallazgo con tarea responsable
        ↓
TREQ cuando existe comportamiento que proteger
        ↓
decisiones técnicas temporales por auditar
```

La continuidad será:

```text
CODE-AUD-009
— Detectar valores hardcodeados y decisiones técnicas temporales
```


### ✅ CODE-AUD-009 — Detectar valores hardcodeados y decisiones técnicas temporales

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría estática transversal de configuración incrustada, reglas duplicadas y decisiones provisionales  
**Dependencia anterior:** `CODE-AUD-008`  
**Continuidad reservada:** `CODE-AUD-010`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea identifica valores escritos directamente dentro del código y determina cuáles son:

1. identificadores canónicos válidos;
2. constantes técnicas legítimas;
3. valores de presentación;
4. fallbacks controlados;
5. reglas empresariales duplicadas;
6. decisiones temporales;
7. configuraciones que deberían provenir de catálogo, base de datos o ambiente;
8. límites técnicos que pueden truncar información;
9. mecanismos provisionales todavía activos o activables;
10. riesgos que requieren requisitos de prueba.

Resultado general:

- se confirma una dispersión importante de listas de roles privilegiados dentro de páginas, acciones y rutas;
- se confirma el uso repetido de identificadores de permisos escritos manualmente en archivos consumidores;
- se confirma que PASS mezcla datos dinámicos de sedes con identidad, ubicación y enlaces de marca todavía incrustados en código;
- se confirman políticas de reintento, espera y refresco escritas como números locales sin gobierno transversal;
- se confirma al menos un límite fijo de 500 productos en un proceso operativo de NEXO;
- se mantienen como decisiones temporales ya detectadas el filtro parcial del historial de Saudo y la automatización provisional de parche de NEXO;
- no todo valor literal constituye una brecha;
- no se ordena reemplazar masivamente constantes por variables de ambiente;
- no se modifica código durante esta tarea.

---

#### 2. Definiciones utilizadas

##### 2.1. Hardcode crítico

Valor escrito directamente en el código que controla:

- autorización;
- alcance territorial;
- empresa, sede o área;
- dinero;
- inventario;
- identidad;
- seguridad;
- estado empresarial;
- integración externa;
- retención;
- límite funcional;
- comportamiento de producción.

##### 2.2. Hardcode de configuración

Valor que puede ser correcto hoy, pero debería administrarse desde:

- catálogo canónico;
- configuración de aplicación;
- registro de sede;
- variable de ambiente;
- tabla de configuración;
- servicio transversal;
- paquete compartido.

##### 2.3. Constante legítima

Valor deliberadamente estable y versionado junto con el código.

Ejemplos:

- identificador canónico de aplicación;
- nombre de estado de una máquina de estados;
- código de permiso importado desde catálogo generado;
- tamaño de un protocolo físico;
- nombre de una ruta interna;
- clave de caché;
- sentinel estrictamente interno no persistido.

##### 2.4. Número mágico

Número cuyo efecto no es evidente y no tiene:

- nombre;
- unidad;
- justificación;
- documentación;
- configuración;
- prueba asociada.

##### 2.5. Decisión técnica temporal

Solución reconocida como provisional mediante expresiones como:

- por ahora;
- temporal;
- fallback;
- compatibilidad legacy;
- parche;
- preview;
- mientras;
- hasta que;
- hardcoded;
- mock;
- workaround.

---

#### 3. Criterio canónico de clasificación

Un literal no será problemático solo por estar escrito en el código.

Se evalúan estas preguntas:

1. ¿Representa una regla empresarial?
2. ¿Puede cambiar sin desplegar código?
3. ¿Existe ya una fuente canónica?
4. ¿Está duplicado en varios repositorios?
5. ¿Afecta autorización o seguridad?
6. ¿Puede producir divergencia entre aplicaciones?
7. ¿Puede truncar u ocultar datos?
8. ¿Depende del ambiente?
9. ¿El propio código lo declara provisional?
10. ¿Existe prueba que detecte su desactualización?

Clasificación:

| Resultado                          | Tratamiento                            |
| ---------------------------------- | -------------------------------------- |
| constante legítima                 | conservar                              |
| constante legítima, pero duplicada | centralizar cuando corresponda         |
| configuración operativa            | mover a fuente administrable           |
| regla empresarial                  | modelar canónicamente                  |
| decisión temporal                  | registrar destino y retiro             |
| límite riesgoso                    | definir paginación, cobertura y prueba |
| valor de ambiente                  | separar por ambiente                   |
| dato visual                        | conservar salvo divergencia real       |

---

#### 4. Autorización basada en listas locales de roles

Se localizaron comprobaciones directas como:

```ts
["propietario", "gerente_general"].includes(role)
```

y:

```ts
["propietario", "gerente_general", "contador"].includes(role)
```

en superficies de:

- NEXO;
- VISO;
- FOGO;
- ORIGO;
- scripts temporales asociados a NEXO.

Ejemplos revisados:

```text
vento-nexo/src/app/inventory/adjust/page.tsx
vento-nexo/src/app/inventory/catalog/actions.ts
vento-nexo/src/app/inventory/catalog/new/actions.ts
vento-nexo/src/app/inventory/settings/request-policies/actions.ts
vento-viso/src/app/api/viso/upload-logo/route.ts
vento-viso/src/app/api/viso/upload-website-media/route.ts
vento-fogo/src/app/recipe-book/page.tsx
vento-origo/src/app/purchase-orders/[id]/page.tsx
```

Caso confirmado en NEXO:

```ts
const canUseAllSites =
  ["propietario", "gerente_general", "contador"].includes(role);
```

Problemas:

- la capacidad queda asociada al nombre del rol en lugar del permiso canónico;
- una modificación del catálogo puede no propagarse;
- cada repositorio puede mantener una lista diferente;
- un rol puede conservar acceso después de perder la capacidad;
- un rol nuevo puede quedar bloqueado aunque reciba el permiso;
- se mezclan autorización, alcance y conveniencia de interfaz;
- la interfaz y el servidor pueden aplicar criterios distintos.

No toda comprobación de rol debe eliminarse. Puede ser válida para:

- presentación de una etiqueta;
- simulación controlada;
- compatibilidad temporal;
- selección de experiencia;
- transición documentada.

No será válida como fuente final de autorización cuando ya exista un permiso canónico y un contexto resoluble.

**Clasificación:** hardcode crítico transversal.

Destinos:

- `CODE-AUD-017` — revisar autorización, permisos, RLS y seguridad;
- `CODE-AUD-019` — mapear consumidores y contratos;
- `CODE-AUD-020` — materializar correcciones y paquetes;
- implementación posterior del catálogo y resolutor canónico de autorización.

---

#### 5. Códigos de permisos escritos manualmente

Se localizaron patrones como:

```ts
const APP_ID = "nexo";
const PERMISSION = "inventory.adjustments";
```

y otras variantes en NEXO, FOGO, ORIGO y PULSO.

Un literal de permiso no es incorrecto si:

- coincide con el catálogo aprobado;
- tiene propietario;
- es validado durante build;
- no está duplicado con nombres diferentes;
- el consumidor utiliza el resolutor canónico;
- existe trazabilidad de versión.

El riesgo aparece cuando el string:

- se escribe manualmente en cada archivo;
- no se deriva del catálogo;
- puede contener errores tipográficos;
- puede quedar obsoleto;
- no se verifica contra una versión;
- se combina con una lista local de roles;
- se utiliza con convenciones distintas entre aplicaciones.

Esta brecha ya está conceptualmente relacionada con la decisión aprobada de evitar cadenas de permisos escritas manualmente.

**Clasificación:** hardcode contractual de autorización.

Destinos:

- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- paquete posterior de tipos y constantes derivados del catálogo.

---

#### 6. PASS — identidad operativa y datos de sede mezclados con código de marca

PASS ya contiene capacidades para resolver sedes y experiencias desde datos dinámicos. Sin embargo, permanecen valores específicos de Vento Café y Saudo dentro de componentes y constantes.

Superficies revisadas:

```text
vento-pass/src/utils/site.ts
vento-pass/src/hooks/useVentoSite.ts
vento-pass/src/components/VentoCafe.tsx
vento-pass/src/components/Saudo.tsx
vento-pass/src/constants/business.ts
vento-pass/src/constants/google.ts
vento-pass/src/components/vento/LocationMap.tsx
```

Ejemplos:

```ts
getSiteIdByBusinessType("saudo")
```

y equivalentes para Vento Café.

También permanecen:

- coordenadas de Vento Café y Saudo;
- enlaces de Google Maps;
- enlaces de reseña;
- nombres de marca;
- dirección física escrita dentro del componente;
- nombre de sede dentro de notificaciones;
- selección de `BrandProvider` por literal;
- lógica diferenciada por componentes específicos.

Ejemplo confirmado dentro de Saudo:

```text
Av. 7 Este #2 - 48 Local 4, Cúcuta, Norte de Santander
```

Estos valores pueden ser correctos. El problema es su convivencia con un modelo dinámico de satélites y sedes.

Riesgos:

- cambiar la dirección en Supabase no cambia la mostrada por el componente;
- una coordenada puede divergir de la sede canónica;
- el enlace de reseña puede quedar obsoleto;
- una nueva sede obliga a modificar código;
- el mismo dato puede aparecer distinto en PASS, VISO y la web;
- una marca dinámica puede seguir dependiendo de un componente especial.

La identidad visual puede permanecer versionada en código cuando sea un activo de producto. La identidad operativa deberá provenir de una fuente canónica.

Separación propuesta:

| Dato                     | Fuente recomendada                       |
| ------------------------ | ---------------------------------------- |
| `site_id`, código y tipo | registro canónico de sede                |
| nombre comercial vigente | registro de sede o experiencia           |
| dirección                | registro canónico de sede                |
| coordenadas              | registro canónico de sede                |
| horarios                 | configuración operativa                  |
| enlace Maps              | derivado o configurado                   |
| enlace de reseña         | configuración comercial                  |
| logo y paleta base       | configuración de marca versionada        |
| componente excepcional   | solo cuando exista necesidad UX aprobada |

**Clasificación:** hardcode operativo y comercial con riesgo de deriva.

Destinos:

- `CODE-AUD-015` — confirmar consumidores reales;
- `CODE-AUD-019` — mapear contrato entre PASS, sedes y experiencias;
- `CODE-AUD-020` — definir migración y paquete;
- E2/E3/E4 para contrato definitivo.

---

#### 7. PASS — URLs, esquemas y destinos externos

Se localizaron destinos escritos directamente en código:

```text
vento-pass://
vento-pass-dev://
https://pass.ventogroup.co
https://vailavainilla.com
```

Superficies:

```text
vento-pass/App.js
vento-pass/src/utils/navigation.ts
vento-pass/src/constants/google.ts
```

Clasificación individual:

##### 7.1. Esquemas móviles

Los esquemas:

```text
vento-pass://
vento-pass-dev://
```

pueden ser constantes legítimas de protocolo.

Deben permanecer coordinados con:

- configuración Expo;
- enlaces universales;
- intent filters;
- dominios verificados;
- retorno de pagos;
- notificaciones.

##### 7.2. Dominio de PASS

```text
https://pass.ventogroup.co
```

es un contrato de integración y no un simple texto visual.

Debe:

- estar centralizado;
- diferenciar ambientes cuando aplique;
- validarse contra configuración móvil y web;
- evitar rutas distintas entre builds.

##### 7.3. Vaila

```ts
const url = "https://vailavainilla.com";
```

es un destino externo comercial. No constituye un defecto inmediato, pero está incrustado en una función de navegación.

Debe definirse si:

- es un destino fijo de producto;
- depende del país o ambiente;
- puede cambiar desde configuración;
- debe abrir una experiencia interna;
- requiere analítica o allowlist.

**Clasificación:** contrato externo centralizable, no secreto.

Destinos:

- `CODE-AUD-019`;
- `CODE-AUD-020`;
- BLOQUE X de integraciones.

---

#### 8. PASS y ANIMA — tiempos, reintentos y refresco

Se localizaron valores técnicos como:

```text
10 000 ms de timeout
2 reintentos
1 000 ms de espera base
15 000 ms de refresco
24 horas para considerar una validación reciente
500 ms y 1 500 ms de espera visual
```

Ejemplos en PASS:

```text
vento-pass/App.js
vento-pass/src/components/Saudo.tsx
vento-pass/src/components/VentoCafe.tsx
vento-pass/src/components/OrderPlacedScreenLive.tsx
```

Ejemplos con intervalos similares en ANIMA:

```text
vento-anima/src/components/home/use-home-today-team.ts
vento-anima/src/components/home/use-home-screen-lifecycle.ts
vento-anima/src/hooks/attendance/shared.ts
```

No se concluye que esos valores sean incorrectos.

El hallazgo es que representan políticas técnicas y de experiencia que actualmente pueden estar:

- duplicadas;
- sin nombre;
- sin unidad visible;
- sin justificación;
- sin control por ambiente;
- sin coordinación con modo en segundo plano;
- sin presupuesto transversal de red;
- sin pruebas de solapamiento o cancelación.

Clasificación:

| Valor                   | Clasificación inicial         |
| ----------------------- | ----------------------------- |
| duración de animación   | constante UX local válida     |
| espera para abrir modal | constante UX local, nombrable |
| timeout de red          | política técnica transversal  |
| número de reintentos    | política técnica transversal  |
| intervalo de polling    | política de sincronización    |
| ventana de 24 horas     | regla funcional o comercial   |

Destinos:

- `CODE-AUD-014` — revisar servicios, sincronización y dependencias;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- E2/E4 para definir política.

No se genera todavía un requisito de prueba exclusivo para los valores temporales porque aún no existe una política canónica con valores esperados. Los requisitos se crearán cuando E2/E4 definan:

- timeout;
- backoff;
- frecuencia;
- foreground/background;
- cancelación;
- límite de solicitudes;
- degradación offline.

---

#### 9. NEXO — límite fijo de 500 productos

En:

```text
vento-nexo/src/app/inventory/adjust/page.tsx
```

la consulta inicial de productos incluye:

```ts
.limit(500)
```

El mismo flujo intenta recuperar posteriormente productos faltantes que tengan stock positivo visible. Esa compensación reduce el riesgo, pero no demuestra cobertura completa.

Un producto activo podría quedar fuera cuando:

- esté después de los primeros 500;
- tenga stock cero;
- deba seleccionarse para crear un ajuste positivo;
- no aparezca todavía en stock por sede, ubicación o posición;
- el orden alfabético lo deje fuera del corte.

Consecuencia:

- el usuario puede no encontrar un producto válido;
- el sistema puede mostrar una cantidad de productos menor al catálogo real;
- el límite técnico se convierte en límite funcional silencioso;
- el crecimiento del catálogo puede activar el defecto sin modificar código.

No se afirma que Vento Group tenga actualmente más de 500 productos aplicables en esa consulta. Se registra el riesgo de escalabilidad.

Soluciones que deberán evaluarse:

1. paginación;
2. búsqueda remota;
3. carga por demanda;
4. consulta completa controlada;
5. filtro obligatorio por sede/categoría;
6. RPC específica;
7. límite administrado con indicador de truncamiento.

**Clasificación:** límite funcional hardcodeado con riesgo de omisión silenciosa.

Destinos:

- `CODE-AUD-010` — revisar la experiencia cuando falta el producto;
- `CODE-AUD-012` — revisar el proceso de ajuste;
- `CODE-AUD-020` — materializar solución;
- paquete NEXO correspondiente.

---

#### 10. Decisiones temporales heredadas de CODE-AUD-008

##### 10.1. Historial de Saudo

El comentario:

```text
Por ahora, filtramos solo las que tienen metadata con site_id
```

confirma una decisión temporal.

Se mantiene:

```text
TREQ-PASS-003
```

No se crea un requisito duplicado.

##### 10.2. Parche temporal de NEXO

Persisten:

```text
scripts/tmp-apply-privileged-request-area.mjs
.github/workflows/tmp-apply-privileged-request-area.yml
scripts/tmp-privileged-area-patch-error.txt
```

Se mantiene:

```text
TREQ-NEXO-001
```

No se crea un requisito duplicado.

---

#### 11. Valores que no se clasifican automáticamente como brecha

##### 11.1. Identificadores canónicos de aplicación

Ejemplos:

```ts
const APP_ID = "nexo";
```

Pueden permanecer en código cuando:

- son estables;
- están versionados;
- se importan o verifican;
- no sustituyen una consulta dinámica.

##### 11.2. Estados y códigos de dominio

Valores como:

```text
requested
in_production
ready_for_transport
in_transit
completed
```

son contratos empresariales válidos si provienen de una máquina de estados canónica.

##### 11.3. Claves internas

Ejemplos:

- claves de caché;
- claves de almacenamiento;
- nombres de eventos;
- sentinels no persistidos;
- rutas internas.

##### 11.4. Diseño visual

No se clasifican como brecha por sí solos:

- colores;
- tamaños;
- espacios;
- tiempos de animación;
- textos estáticos;
- iconos.

##### 11.5. Límites defensivos

Un límite puede ser legítimo si:

- existe paginación;
- se informa truncamiento;
- el proceso no requiere cobertura completa;
- existe búsqueda adicional;
- está documentado y probado.

---

#### 12. Matriz por repositorio

| Repositorio     | Hallazgo principal                                                                                   | Clasificación                        |
| --------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `vento-shell`   | valores de migraciones y catálogos requieren análisis de E3; no se tratan masivamente como hardcodes | reservado para auditoría de Supabase |
| `vento-viso`    | listas locales de roles en rutas administrativas y permisos escritos por consumidor                  | crítico de autorización              |
| `vento-nexo`    | listas de roles, permisos manuales, límite de 500 y parche temporal                                  | crítico y técnico                    |
| `vento-fogo`    | comprobaciones locales de rol y permisos por superficie                                              | crítico de autorización              |
| `vento-origo`   | comprobaciones locales de rol y permisos por superficie                                              | crítico de autorización              |
| `vento-pulso`   | identificadores de aplicación y permisos distribuidos; requiere contraste con catálogo               | contractual                          |
| `vento-numera`  | no se confirma un hardcode crítico específico mediante esta revisión                                 | sin cierre de integridad             |
| `Vento-Group`   | contenido público y diseño estáticos son esperables; configuración operativa deberá separarse        | principalmente legítimo              |
| `vento-anima`   | tiempos de sincronización y refresco locales; posible lógica de capacidad por rol a consolidar       | técnico y de autorización            |
| `vento-pass`    | identidad de sedes, ubicación, enlaces, tiempos y decisiones temporales                              | operativo, comercial y técnico       |
| `vento-talento` | no se confirma hardcode crítico específico; producto futuro                                          | sin cierre de integridad             |
| `vento-vital`   | proyecto separado                                                                                    | fuera de Vento OS                    |

“Sin hardcode crítico específico confirmado” no significa ausencia total. Significa que esta tarea no obtuvo evidencia suficiente para formular una brecha concreta.

---

#### 13. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                   | Clasificación                     | Destino                         |
| ---------------- | ------------------------------------------------------------------------------------------ | --------------------------------- | ------------------------------- |
| `H-CODE-009-001` | capacidades privilegiadas dependen de listas locales de roles en varias aplicaciones       | hardcode crítico                  | `CODE-AUD-017`, `019`, `020`    |
| `H-CODE-009-002` | códigos de permisos se escriben manualmente en múltiples consumidores                      | hardcode contractual              | `CODE-AUD-017`, `019`, `020`    |
| `H-CODE-009-003` | PASS mezcla resolución dinámica de sedes con identidad operativa incrustada                | riesgo de deriva                  | `CODE-AUD-015`, `019`, `020`    |
| `H-CODE-009-004` | dirección, coordenadas y enlaces comerciales de sedes permanecen en código PASS            | configuración operativa/comercial | `CODE-AUD-015`, `019`, `020`    |
| `H-CODE-009-005` | esquemas y dominios de PASS son contratos distribuidos en código                           | integración centralizable         | `CODE-AUD-019`, `020`, BLOQUE X |
| `H-CODE-009-006` | URL de Vaila está escrita directamente en la navegación                                    | integración centralizable         | `CODE-AUD-019`, `020`, BLOQUE X |
| `H-CODE-009-007` | timeout, reintentos, polling y ventanas temporales carecen de gobierno transversal visible | decisión técnica dispersa         | `CODE-AUD-014`, `019`, `020`    |
| `H-CODE-009-008` | NEXO aplica un límite inicial fijo de 500 productos en ajustes                             | riesgo de omisión silenciosa      | `CODE-AUD-010`, `012`, `020`    |
| `H-CODE-009-009` | filtro temporal de Saudo permanece vigente                                                 | decisión temporal                 | mantiene `TREQ-PASS-003`        |
| `H-CODE-009-010` | workflow y script temporal de NEXO permanecen versionados                                  | decisión temporal                 | mantiene `TREQ-NEXO-001`        |
| `H-CODE-009-011` | identificadores, estados, diseño y sentinels no son automáticamente brechas                | regla de clasificación            | cerrado                         |
| `H-CODE-009-012` | no se confirma hardcode crítico específico en NUMERA o TALENTO                             | límite de evidencia               | continuar auditoría             |

Todos los hallazgos quedan cerrados o vinculados con tareas existentes. No se crea una tarea nueva del roadmap.

---

#### 14. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 14.1. Requisitos nuevos completos

| ID                     | Regla protegida                                                                                                                                                                                                           | Origen                                               | Riesgo                                                                                              | Tipo / modalidad                                                                       | Prioridad | Tarea responsable inmediata | Estado         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- | --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | --------- | --------------------------- | -------------- |
| `TREQ-AUTH-001`        | Toda capacidad protegida deberá resolverse mediante permisos, contexto y alcance canónicos; una lista local de nombres de rol no podrá conceder por sí sola autorización final.                                           | `CODE-AUD-009` / `H-CODE-009-001`                    | acceso indebido, denegación incorrecta y divergencia entre aplicaciones                             | seguridad + autorización + regresión / automatizada                                    | crítica   | `CODE-AUD-017`              | `IDENTIFICADO` |
| `TREQ-AUTH-002`        | Todo identificador de permiso consumido por código deberá existir en la versión vigente del catálogo, utilizar la convención aprobada y quedar libre de strings huérfanos, duplicados o mal escritos.                     | `CODE-AUD-009` / `H-CODE-009-002`                    | controles inoperantes, permisos obsoletos y fallos silenciosos de autorización                      | contractual + estática + integración / automatizada                                    | crítica   | `CODE-AUD-017`              | `IDENTIFICADO` |
| `TREQ-PASS-004`        | El nombre operativo, dirección, coordenadas, enlaces y demás datos administrables de una sede mostrados por PASS deberán corresponder a la fuente canónica vigente y no divergir por literales duplicados en componentes. | `CODE-AUD-009` / `H-CODE-009-003` y `H-CODE-009-004` | información comercial incorrecta, navegación errónea y divergencia entre sedes                      | contractual + integración + interfaz / automatizada con validación manual de ubicación | alta      | `CODE-AUD-019`              | `IDENTIFICADO` |
| `TREQ-INTEGRATION-001` | Los esquemas, dominios y URLs externas utilizados por una aplicación deberán corresponder al ambiente y contrato aprobados, y no podrán divergir entre configuración móvil, web, pagos, notificaciones o navegación.      | `CODE-AUD-009` / `H-CODE-009-005` y `H-CODE-009-006` | deep links rotos, retorno incorrecto, navegación a destinos obsoletos y diferencias entre ambientes | contractual + integración + E2E / automatizada                                         | alta      | `CODE-AUD-019`              | `IDENTIFICADO` |
| `TREQ-NEXO-002`        | Todo producto activo y elegible para un ajuste deberá poder localizarse y seleccionarse sin quedar omitido silenciosamente por límites fijos de consulta.                                                                 | `CODE-AUD-009` / `H-CODE-009-008`                    | imposibilidad de ajustar productos válidos y cobertura incompleta del catálogo                      | integración + paginación + E2E / automatizada                                          | alta      | `CODE-AUD-012`              | `IDENTIFICADO` |

##### 14.2. Requisitos reutilizados

| ID              | Motivo                                                                     |
| --------------- | -------------------------------------------------------------------------- |
| `TREQ-PASS-003` | ya protege la atribución completa del historial de Saudo                   |
| `TREQ-NEXO-001` | ya protege la eliminación de dependencia de scripts y workflows temporales |

##### 14.3. Filas completas para el Registro Canónico

Al aprobar `CODE-AUD-009`, agregar debajo de las filas existentes de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`:

```md
| `TREQ-AUTH-001` | `AUTH` | Toda capacidad protegida deberá resolverse mediante permisos, contexto y alcance canónicos; una lista local de nombres de rol no podrá conceder por sí sola autorización final. | `CODE-AUD-009` / `H-CODE-009-001` | Acceso indebido, denegación incorrecta y divergencia entre aplicaciones / crítica | seguridad + autorización + regresión / automatizada | `CODE-AUD-017 — Revisar autorización, permisos, RLS y seguridad` | Pendiente de asignación en E5 | transversal / CI, staging y ambientes pendientes | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
| `TREQ-AUTH-002` | `AUTH` | Todo identificador de permiso consumido por código deberá existir en la versión vigente del catálogo, utilizar la convención aprobada y quedar libre de strings huérfanos, duplicados o mal escritos. | `CODE-AUD-009` / `H-CODE-009-002` | Controles inoperantes, permisos obsoletos y fallos silenciosos de autorización / crítica | contractual + estática + integración / automatizada | `CODE-AUD-017 — Revisar autorización, permisos, RLS y seguridad` | Pendiente de asignación en E5 | transversal / CI pendiente | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
| `TREQ-PASS-004` | `PASS` | El nombre operativo, dirección, coordenadas, enlaces y demás datos administrables de una sede mostrados por PASS deberán corresponder a la fuente canónica vigente y no divergir por literales duplicados en componentes. | `CODE-AUD-009` / `H-CODE-009-003` y `H-CODE-009-004` | Información comercial incorrecta, navegación errónea y divergencia entre sedes / alta | contractual + integración + interfaz / automatizada con validación manual de ubicación | `CODE-AUD-019 — Mapear dependencias, contratos y consumidores` | Pendiente de asignación en E5 | `vento-pass` / local, CI, staging y dispositivo físico pendientes | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
| `TREQ-INTEGRATION-001` | `INTEGRATION` | Los esquemas, dominios y URLs externas utilizados por una aplicación deberán corresponder al ambiente y contrato aprobados, y no podrán divergir entre configuración móvil, web, pagos, notificaciones o navegación. | `CODE-AUD-009` / `H-CODE-009-005` y `H-CODE-009-006` | Deep links rotos, retorno incorrecto, navegación a destinos obsoletos y diferencias entre ambientes / alta | contractual + integración + E2E / automatizada | `CODE-AUD-019 — Mapear dependencias, contratos y consumidores` | Pendiente de asignación en E5 | transversal / CI, staging y builds móviles pendientes | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
| `TREQ-NEXO-002` | `NEXO` | Todo producto activo y elegible para un ajuste deberá poder localizarse y seleccionarse sin quedar omitido silenciosamente por límites fijos de consulta. | `CODE-AUD-009` / `H-CODE-009-008` | Imposibilidad de ajustar productos válidos y cobertura incompleta del catálogo / alta | integración + paginación + E2E / automatizada | `CODE-AUD-012 — Detectar procesos parcialmente implementados` | Pendiente de asignación en E5 | `vento-nexo` / local, CI y staging pendientes | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
```

Estas son las líneas completas. No deberán reemplazarse por una lista de identificadores.

---

#### 15. Decisiones propuestas

1. No se realizará una sustitución indiscriminada de literales.
2. Los valores se clasificarán por efecto, no por apariencia.
3. Las listas locales de roles no serán fuente final de autorización.
4. Los permisos deberán derivarse o validarse contra el catálogo versionado.
5. Los datos operativos de sede deberán tener fuente canónica.
6. La identidad visual podrá permanecer versionada en código cuando corresponda.
7. Los enlaces comerciales y dominios deberán tratarse como contratos.
8. Los esquemas móviles estables podrán conservarse como constantes verificadas.
9. Los tiempos de red y sincronización deberán convertirse en políticas nombradas.
10. No se fijan todavía valores canónicos de timeout o polling.
11. El límite de 500 productos se considera riesgo funcional.
12. No se afirma que el catálogo actual ya supere dicho límite.
13. `TREQ-PASS-003` se reutiliza y no se duplica.
14. `TREQ-NEXO-001` se reutiliza y no se duplica.
15. Se crean `TREQ-AUTH-001` y `TREQ-AUTH-002`.
16. Se crea `TREQ-PASS-004`.
17. Se crea `TREQ-INTEGRATION-001`.
18. Se crea `TREQ-NEXO-002`.
19. Los cinco requisitos nuevos quedan `IDENTIFICADO`.
20. No se crea una tarea nueva del roadmap.
21. `CODE-AUD-010` será la única continuidad inmediata.

---

#### 16. Límites de certeza

Esta tarea no confirma:

- que todas las listas de roles hayan sido localizadas;
- que cada literal de permiso esté incorrecto;
- que todas las sedes de PASS tengan datos divergentes;
- que los enlaces actuales estén rotos;
- que el catálogo de NEXO ya exceda 500 productos;
- que todo intervalo de 15 segundos produzca carga excesiva;
- que NUMERA o TALENTO no contengan hardcodes;
- que una constante estable deba migrarse a Supabase;
- que las migraciones con datos canónicos sean datos hardcodeados incorrectos;
- que todas las decisiones temporales estén todavía activas en producción.

Las tareas siguientes deberán revisar consumidores, procesos completos, seguridad, dependencias y estado de ejecución.

---

#### 17. Criterios de aceptación

`CODE-AUD-009` podrá aprobarse cuando:

- hardcode crítico, configuración, constante y número mágico estén diferenciados;
- las listas locales de roles estén inventariadas;
- los códigos manuales de permisos tengan destino;
- PASS tenga documentada la mezcla entre sede dinámica y datos incrustados;
- URLs y esquemas estén clasificados como contratos;
- timeout, polling y reintentos estén registrados sin inventar valores nuevos;
- el límite de 500 productos esté documentado;
- las decisiones temporales anteriores reutilicen sus requisitos;
- cada hallazgo tenga destino;
- las cinco filas nuevas `TREQ-*` estén completas;
- no se creen requisitos duplicados;
- no se cree una tarea nueva sin necesidad;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-010` permanezca como continuidad inmediata.

---

#### 18. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
valor literal o decisión provisional
        ↓
clasificación por impacto
        ↓
constante legítima, configuración, regla o riesgo
        ↓
fuente canónica y propietario
        ↓
requisito de prueba cuando existe comportamiento protegible
        ↓
consumidores e interfaces por revisar
```

La continuidad será:

```text
CODE-AUD-010
— Detectar interfaces sin lógica real detrás
```


### ✅ CODE-AUD-010 — Detectar pantallas con interfaz pero sin lógica completa

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de superficies visibles, acciones disponibles y cobertura funcional real  
**Dependencia anterior:** `CODE-AUD-009`  
**Continuidad reservada:** `CODE-AUD-011`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea contrasta pantallas, formularios, botones, tarjetas, vistas previas y controles visibles con la lógica que realmente ejecutan.

El objetivo no es declarar incompleta una pantalla por ser sencilla. El objetivo es detectar superficies que:

1. ofrecen una acción que no ejecuta el proceso prometido;
2. muestran datos cuya cobertura es parcial sin informarlo;
3. presentan controles de mutación en un modo donde no pueden funcionar;
4. aparentan persistir una configuración que solo se usa de manera transitoria;
5. permiten confirmar una operación basándose en una simulación no equivalente al resultado real;
6. comunican éxito sin persistencia verificable;
7. contienen módulos visibles pero todavía no tienen contrato funcional completo;
8. ocultan dependencias ausentes mediante fallbacks silenciosos;
9. poseen lógica local, pero no lógica de servidor o persistencia;
10. ya tienen una brecha reconocida por otro plan canónico y deben quedar trazadas sin duplicar tareas.

Resultado general:

- se confirma una brecha funcional en la selección de audiencia de novedades de ANIMA;
- se confirma que el modo fallback de novedades de ANIMA sigue exponiendo controles de creación, edición y eliminación que no funcionan de forma coherente;
- se confirma que la vista previa de impresión de NEXO es una representación local y no una reproducción del resultado físico de la impresora;
- se incorpora la brecha ya reconocida por el plan web para la interfaz de newsletter;
- se reutilizan los requisitos existentes de PASS y NEXO relacionados con interfaces o datos parciales;
- no se confirma que los stubs `goToMovements` y `onScanTable` estén expuestos actualmente en una pantalla activa;
- se comprobaron varias pantallas de TALENTO, NUMERA, PULSO y NEXO que sí tienen lectura, mutación o navegación real;
- no se crea una tarea nueva del roadmap;
- no se modifica código durante esta tarea.

---

#### 2. Definiciones utilizadas

##### 2.1. Interfaz completa

Una interfaz es funcionalmente completa cuando:

- la acción visible tiene un contrato definido;
- el evento llega a una implementación real;
- el servidor valida autorización y datos cuando corresponde;
- el resultado se persiste o consulta desde la fuente correcta;
- los errores se comunican;
- los estados de carga y éxito representan el resultado real;
- la pantalla no oculta exclusiones relevantes;
- la experiencia coincide con la capacidad anunciada.

##### 2.2. Interfaz parcial

La pantalla ejecuta una parte del proceso, pero omite:

- alcance;
- persistencia;
- validación;
- casos de error;
- edición;
- auditoría;
- consumidores;
- cobertura total de datos;
- equivalencia con el resultado físico.

##### 2.3. Interfaz ficticia

La pantalla o control parece ofrecer una capacidad, pero:

- solo muestra una alerta;
- no tiene handler real;
- modifica únicamente estado local;
- no llama a ningún contrato;
- comunica éxito sin persistencia;
- utiliza datos estáticos como si fueran operativos.

##### 2.4. Interfaz degradada

La pantalla funciona con una fuente alternativa o modo de contingencia, pero debe:

- declarar el modo;
- limitar acciones imposibles;
- evitar confirmaciones falsas;
- preservar seguridad;
- permitir recuperación.

##### 2.5. Estado vacío válido

Un mensaje como:

```text
No hay registros
Sin novedades
Aún no existen movimientos
```

no es una interfaz incompleta cuando representa correctamente el resultado de una consulta real.

##### 2.6. Feature flag válida

Ocultar una capacidad mediante una bandera de entorno no implica falta de lógica si:

- la bandera es intencional;
- la ruta también queda protegida;
- el backend no depende solo del ocultamiento visual;
- la capacidad se habilita únicamente cuando su contrato está listo.

---

#### 3. Método de revisión

Para cada superficie relevante se contrastó:

```text
elemento visible
        ↓
handler o navegación
        ↓
servicio, acción, API, RPC o Edge Function
        ↓
persistencia o lectura real
        ↓
autorización y alcance
        ↓
resultado visible
```

Se buscaron especialmente:

- textos `Próximamente`;
- funciones placeholder;
- controles visibles en modos fallback;
- formularios sin persistencia;
- botones sin efecto;
- `href="#"`;
- acciones que solo cambian estado local;
- pantallas con datos simulados;
- vistas previas no equivalentes al resultado real;
- filtros que omiten datos silenciosamente;
- tareas funcionales ya reconocidas en planes especializados.

La búsqueda textual fue complementada con inspección de componentes y servicios. No se clasificó una pantalla solo por su nombre, apariencia o cantidad de código.

---

#### 4. ANIMA — selección de audiencia que no controla la visibilidad persistente

Archivos revisados:

```text
vento-anima/app/(app)/announcements.tsx
vento-anima/src/components/announcements/use-announcements-screen.ts
```

La pantalla de creación de novedades ofrece:

```text
Seleccionar sede o trabajador
Opcional. Sin marcar = se envía a todos.
```

Sin embargo, las opciones realmente disponibles son:

- sedes;
- roles.

No existe un selector de trabajador individual en esa interfaz.

Además, la selección solo aparece al crear. Cuando se edita una novedad:

- no se carga una audiencia persistida;
- no se muestra la audiencia original;
- no se permite modificarla;
- no se informa que solo se editará el contenido.

La consulta de novedades lee únicamente:

```text
id
title
body
tag
published_at
created_at
```

y obtiene todas las novedades activas. No se localizaron en ese flujo:

- columnas de audiencia;
- filtro por sede del trabajador;
- filtro por rol;
- filtro por empleado;
- relación persistida entre anuncio y audiencia.

Durante la creación, los valores seleccionados se envían a:

```text
announcement-notify
```

después de insertar el anuncio.

Por tanto, el comportamiento actual es:

```text
selección en la interfaz
        ↓
destinatarios de una notificación puntual
        ≠
alcance persistente de visibilidad del anuncio
```

La interfaz no distingue expresamente esas dos funciones.

Consecuencias:

- un gerente puede creer que restringió quién verá la novedad;
- la novedad puede seguir siendo leída por usuarios fuera de la audiencia notificada;
- editar la novedad no conserva ni muestra el criterio usado al notificar;
- no existe trazabilidad visible de a quién se dirigió;
- la etiqueta “trabajador” no corresponde con los controles disponibles.

**Clasificación:** interfaz con contrato funcional ambiguo y proceso parcialmente implementado.

Destino:

- `CODE-AUD-012 — Detectar procesos implementados solo parcialmente`;
- `CODE-AUD-017 — Auditar autorización, validación de servidor y exposición de datos`;
- `CODE-AUD-019 — Vincular cada capacidad con su implementación actual verificable`;
- `CODE-AUD-020 — Crear backlog técnico y funcional trazable por repositorio`.

Decisión pendiente de diseño:

1. la audiencia solo controla notificaciones; o
2. la audiencia controla también la visibilidad persistente.

La interfaz deberá nombrar y ejecutar exactamente la opción aprobada.

---

#### 5. ANIMA — modo fallback con controles de mutación todavía visibles

El hook de novedades inicia con una colección local:

```text
ANNOUNCEMENTS
```

y utiliza esa colección como fallback cuando la tabla remota no existe.

En ese caso la pantalla indica:

```text
Comunicados y anuncios internos (modo local).
```

No obstante, para un usuario considerado gestor, la pantalla sigue mostrando:

- `Nueva novedad`;
- `Editar`;
- `Eliminar`.

Comportamiento real:

##### Crear o editar

`handleSave` detecta el modo fallback y detiene la acción con:

```text
Activa la tabla announcements en Supabase antes de crear novedades.
```

##### Eliminar

`handleDelete` no aplica la misma guarda de modo fallback. Intenta eliminar en Supabase y termina en error si la infraestructura no está disponible.

Esto genera una pantalla visualmente editable que en realidad opera como solo lectura.

Consecuencias:

- se ofrece una acción que no puede completarse;
- un gerente puede llenar un formulario para descubrir el bloqueo al final;
- editar una novedad fallback tampoco puede persistirse;
- eliminar sigue intentando una operación remota inválida;
- el modo degradado no tiene contrato uniforme.

**Clasificación:** interfaz degradada con mutaciones incoherentes.

Regla propuesta:

```text
modo remoto disponible
→ lectura y mutaciones según permisos

modo fallback
→ lectura explícitamente local y controles de mutación ocultos o deshabilitados
```

Destinos:

- `CODE-AUD-012`;
- `CODE-AUD-017`;
- `CODE-AUD-020`.

---

#### 6. NEXO — vista previa de impresión local no equivalente a una impresión física

Archivo revisado:

```text
vento-nexo/src/app/printing/jobs/_components/PreviewPanel.tsx
```

La pantalla muestra:

```text
3. Vista previa
Confirma rápido y manda a imprimir.
Preview local
```

La representación puede provenir de:

1. `LayoutPreview`, construido con elementos HTML posicionados en milímetros; o
2. `MockMiniLabel`, utilizado como representación local de la etiqueta.

La pantalla también permite visualizar el ZPL generado.

No se localizó en el componente actual:

- render remoto del ZPL mediante motor equivalente a Zebra;
- imagen generada por la impresora;
- validación de fuentes soportadas;
- comprobación física de márgenes;
- verificación de contraste y densidad;
- prueba de legibilidad del código;
- equivalencia demostrada entre la simulación HTML y el ZPL;
- advertencia de que la simulación no sustituye una prueba física.

El chip `Preview local` evita presentarlo como una vista remota real. Sin embargo, el texto “Confirma rápido y manda a imprimir” todavía le atribuye función de aprobación operativa.

No se afirma que el ZPL sea incorrecto. Se establece que:

```text
representación local
        ≠
resultado físico verificado
```

Riesgos:

- posiciones diferentes entre HTML, ZPL e impresora;
- recorte por dimensiones o márgenes;
- código QR, DataMatrix o Code128 ilegible;
- diferencia entre DPI configurado y dispositivo real;
- operador que aprueba una simulación pensando que valida la salida física.

**Clasificación:** interfaz parcialmente completa; tiene lógica de previsualización, pero no equivalencia física demostrada.

Destinos:

- `CODE-AUD-012`;
- `CODE-AUD-018 — Auditar operación offline, reintentos, concurrencia e idempotencia`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- BLOQUE X para integración con impresión;
- paquete NEXO de impresión.

---

#### 7. Web pública — formulario de newsletter reconocido como interfaz sin implementación final

El plan especializado de VISO Web Studio y Vento Group Web ya materializó:

```text
WEB-FRM-011 — Implementar suscripción de newsletter o retirar la interfaz
```

Ese marcador confirma que la superficie pública presenta o contempla una interfaz de suscripción cuyo contrato todavía debe resolverse.

Esta tarea no duplica `WEB-FRM-011`.

El cierre aceptable será uno de estos:

##### Opción A — Implementar

- validar formato;
- registrar consentimiento;
- persistir o enviar al proveedor aprobado;
- evitar duplicados;
- comunicar éxito real;
- comunicar error real;
- aplicar privacidad y retención;
- permitir baja cuando corresponda;
- producir evidencia.

##### Opción B — Retirar

- eliminar el formulario y cualquier promesa de suscripción;
- no conservar un botón inerte;
- no simular confirmación.

**Clasificación:** interfaz pública con destino funcional existente.

Destino exacto:

```text
WEB-FRM-011 — Implementar suscripción de newsletter o retirar la interfaz
```

No se crea una tarea nueva.

---

#### 8. PASS — stubs confirmados, pero sin pantalla consumidora vigente comprobada

`CODE-AUD-008` confirmó:

```text
goToMovements
onScanTable
```

como funciones placeholder.

La revisión actual del Home de PASS no las importa. El Home consume:

```text
goToMenuVento
goToMenuSaudo
goToVailaWebView
```

y las tarjetas dinámicas navegan hacia `SatellitePass`.

Por tanto, esta tarea no afirma que hoy exista una pantalla activa mostrando los botones de movimientos o escaneo de mesa.

Clasificación actual:

| Elemento             | Estado                |
| -------------------- | --------------------- |
| función incompleta   | confirmado            |
| consumidor actual    | no confirmado         |
| botón visible actual | no confirmado         |
| capacidad aprobada   | pendiente de decisión |

Se mantienen:

- `TREQ-PASS-001`;
- `TREQ-PASS-002`.

Destino:

- `CODE-AUD-015 — Detectar rutas, componentes, funciones y tablas sin consumidores`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

Si no tienen consumidores ni capacidad aprobada, podrán retirarse en lugar de implementarse.

---

#### 9. Hallazgos visibles anteriores que se reutilizan

##### 9.1. Historial de Saudo

El historial puede omitir transacciones sin `metadata.site_id`.

Esto afecta una pantalla real y visible, pero ya está cubierto por:

```text
TREQ-PASS-003
```

No se crea un requisito duplicado.

##### 9.2. Ajustes de NEXO

La lista inicial limitada a 500 productos puede impedir localizar productos válidos.

Esto afecta una interfaz real, pero ya está cubierto por:

```text
TREQ-NEXO-002
```

No se crea un requisito duplicado.

##### 9.3. Parche de selección privilegiada de área

La dependencia de un parche temporal ya está cubierta por:

```text
TREQ-NEXO-001
```

No se crea un requisito duplicado.

---

#### 10. Pantallas revisadas que sí tienen lógica real

Estas superficies se excluyen como falsos positivos de esta tarea.

##### 10.1. TALENTO — Inicio

La pantalla:

- obtiene `getHomeDashboardSummary`;
- carga postulación principal;
- calcula requisitos pendientes;
- navega al siguiente paso;
- refresca desde la fuente remota.

**Clasificación:** interfaz conectada.

##### 10.2. TALENTO — Documentos

La pantalla:

- consulta requisitos y archivos;
- selecciona archivos;
- sube documentos;
- obtiene URL firmada;
- abre el archivo;
- refresca después de guardar.

**Clasificación:** interfaz conectada.

##### 10.3. TALENTO — Perfil

La pantalla:

- consulta el perfil del candidato;
- convierte datos al formulario;
- guarda mediante `updateMyCandidateProfile`;
- controla cambios;
- maneja error y cierre de sesión.

**Clasificación:** interfaz conectada.

##### 10.4. NUMERA — Panel principal

La pantalla ejecuta:

```text
numera_current_period_summary
```

y muestra métricas obtenidas del resultado.

**Clasificación:** interfaz de lectura conectada.

##### 10.5. NUMERA — Rentabilidad

La pantalla consulta:

```text
numera_cost_center_monthly_summary
```

y muestra datos por centro de costo.

**Clasificación:** interfaz de lectura conectada.

##### 10.6. PULSO — Importaciones de ventas

La pantalla incluye:

- carga de archivo;
- parseo XLSX;
- mapeo;
- validación;
- persistencia de lotes;
- condiciones para contabilizar.

**Clasificación:** interfaz conectada.

##### 10.7. PULSO — Escáner POS

El componente utiliza acciones reales para:

- identificar cliente;
- validar redención;
- procesar resultados;
- mostrar saldo.

**Clasificación:** interfaz conectada.

##### 10.8. PULSO — Salón

La pantalla consume datos reales de:

- zonas;
- mesas;
- sesiones;
- llamados;
- actualizaciones Realtime.

**Clasificación:** interfaz conectada.

##### 10.9. NEXO — Diseñador de plantillas

El módulo:

- carga plantillas;
- guarda por API;
- elimina por API;
- persiste en `printing_label_templates`.

**Clasificación:** interfaz conectada.

La brecha está en la fidelidad de la vista previa física, no en la persistencia del diseñador.

##### 10.10. PASS — Club

La pantalla utiliza:

- membresía;
- wallet;
- ledger;
- RevenueCat;
- compra;
- restauración.

Además, la entrada al Club está gobernada por una feature flag.

**Clasificación:** interfaz conectada y controlada por bandera.

---

#### 11. Criterio sobre pantallas futuras o inactivas

Una ruta o componente puede existir sin estar habilitado.

No se clasificará como brecha visible cuando:

- no tenga navegación activa;
- esté detrás de una feature flag desactivada;
- sea un borrador aislado;
- no tenga consumidor;
- el usuario no pueda alcanzarlo.

En esos casos corresponde:

- `CODE-AUD-015` para confirmar consumidores;
- retiro del código si quedó huérfano;
- activación posterior solo al cumplir sus contratos.

La mera existencia de JSX no demuestra exposición operativa.

---

#### 12. Matriz por repositorio

| Repositorio     | Resultado de CODE-AUD-010                                                                                                      | Clasificación                       |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------- |
| `vento-shell`   | no es aplicación funcional de negocio; la página auxiliar de apertura ANIMA sí construye y abre el deep link                   | sin interfaz ficticia confirmada    |
| `vento-viso`    | las superficies administrativas muestreadas tienen consultas o acciones; la cobertura total continúa en auditorías posteriores | sin hallazgo concluyente nuevo      |
| `vento-nexo`    | vista previa de impresión local sin equivalencia física demostrada; ajuste puede omitir productos por límite ya registrado     | parcial                             |
| `vento-fogo`    | no se confirma pantalla visible sin lógica mediante esta revisión                                                              | sin hallazgo concluyente nuevo      |
| `vento-origo`   | no se confirma pantalla visible sin lógica mediante esta revisión                                                              | sin hallazgo concluyente nuevo      |
| `vento-pulso`   | importaciones, salón y escáner muestreados poseen lógica real                                                                  | conectado                           |
| `vento-numera`  | dashboard y rentabilidad consultan fuentes reales                                                                              | conectado                           |
| `Vento-Group`   | newsletter tiene brecha reconocida por el plan web                                                                             | incompleta con destino existente    |
| `vento-anima`   | audiencia de novedades ambigua y fallback con mutaciones incoherentes                                                          | incompleta                          |
| `vento-pass`    | stubs sin consumidor visible confirmado; historial parcial ya registrado                                                       | pendiente de consumidores / parcial |
| `vento-talento` | inicio, documentos y perfil están conectados a servicios reales                                                                | conectado, producto futuro          |
| `vento-vital`   | proyecto separado                                                                                                              | fuera de Vento OS                   |

“Sin hallazgo concluyente nuevo” no equivale a aprobación integral del repositorio.

---

#### 13. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                                                               | Clasificación                           | Destino                             |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | ----------------------------------- |
| `H-CODE-010-001` | ANIMA presenta selección de audiencia, pero la lectura no aplica alcance persistente y la creación solo usa los valores para notificar | interfaz y contrato parcial             | `CODE-AUD-012`, `017`, `019`, `020` |
| `H-CODE-010-002` | ANIMA mantiene crear, editar y eliminar visibles durante fallback local                                                                | interfaz degradada incoherente          | `CODE-AUD-012`, `017`, `020`        |
| `H-CODE-010-003` | NEXO utiliza preview local o mock como apoyo para confirmar impresión sin equivalencia física demostrada                               | interfaz parcial                        | `CODE-AUD-012`, `018`, `019`, `020` |
| `H-CODE-010-004` | newsletter pública debe implementarse o retirarse                                                                                      | interfaz sin contrato final             | `WEB-FRM-011`                       |
| `H-CODE-010-005` | `goToMovements` y `onScanTable` son stubs, pero no se confirma consumidor visible actual                                               | código incompleto posiblemente huérfano | `CODE-AUD-015`, `019`, `020`        |
| `H-CODE-010-006` | historial Saudo tiene cobertura parcial                                                                                                | hallazgo reutilizado                    | mantiene `TREQ-PASS-003`            |
| `H-CODE-010-007` | selección de producto en ajuste NEXO puede truncarse                                                                                   | hallazgo reutilizado                    | mantiene `TREQ-NEXO-002`            |
| `H-CODE-010-008` | varias pantallas TALENTO, NUMERA, PULSO y NEXO sí poseen contratos reales                                                              | falsos positivos descartados            | cerrado                             |
| `H-CODE-010-009` | una pantalla oculta por feature flag no se considera superficie operativa disponible                                                   | regla de clasificación                  | cerrado                             |
| `H-CODE-010-010` | no se confirma una pantalla incompleta nueva en VISO, FOGO u ORIGO                                                                     | límite de evidencia                     | continuar `CODE-AUD-011` a `020`    |

Todos los hallazgos quedan cerrados o vinculados a tareas existentes.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 14. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 14.1. Requisitos nuevos completos

| ID                     | Regla protegida                                                                                                                                                                                                                            | Origen                            | Riesgo                                                                                          | Tipo / modalidad                                              | Prioridad | Tarea responsable inmediata                                                 | Estado         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------- | --------- | --------------------------------------------------------------------------- | -------------- |
| `TREQ-ANIMA-001`       | Cuando la interfaz de novedades permita seleccionar audiencia, deberá distinguir si controla notificaciones o visibilidad persistente; el modelo aprobado deberá conservarse, editarse, auditarse y aplicarse al leer.                     | `CODE-AUD-010` / `H-CODE-010-001` | exposición fuera de alcance, usuarios objetivo no informados y falsa percepción de segmentación | contractual + autorización + integración + E2E / automatizada | alta      | `CODE-AUD-012 — Detectar procesos implementados solo parcialmente`          | `IDENTIFICADO` |
| `TREQ-ANIMA-002`       | Cuando novedades opere con datos fallback o en modo solo lectura, no deberá mostrar controles de crear, editar o eliminar que no puedan completarse; el modo deberá ser explícito y coherente.                                             | `CODE-AUD-010` / `H-CODE-010-002` | trabajo perdido, errores previsibles y experiencia administrativa engañosa                      | interfaz + regresión / automatizada                           | alta      | `CODE-AUD-012 — Detectar procesos implementados solo parcialmente`          | `IDENTIFICADO` |
| `TREQ-NEXO-003`        | Toda vista previa usada para aprobar una impresión deberá identificar si es simulación y demostrar correspondencia suficiente entre plantilla, ZPL, DPI, dimensiones, códigos y muestra física antes de considerarse validación de salida. | `CODE-AUD-010` / `H-CODE-010-003` | etiquetas recortadas, códigos ilegibles y diferencia entre vista previa e impresión física      | contractual + interfaz + hardware + regresión / híbrida       | alta      | `CODE-AUD-012 — Detectar procesos implementados solo parcialmente`          | `IDENTIFICADO` |
| `TREQ-INTEGRATION-002` | Toda interfaz pública de newsletter deberá registrar una suscripción y consentimiento reales mediante el contrato aprobado, comunicar el resultado verdadero y permitir el tratamiento definido; de lo contrario no deberá publicarse.     | `CODE-AUD-010` / `H-CODE-010-004` | falsa confirmación, pérdida de contactos y tratamiento de datos sin contrato verificable        | integración + privacidad + E2E / automatizada                 | alta      | `WEB-FRM-011 — Implementar suscripción de newsletter o retirar la interfaz` | `IDENTIFICADO` |

##### 14.2. Requisitos reutilizados

| ID              | Uso en esta tarea                                              |
| --------------- | -------------------------------------------------------------- |
| `TREQ-PASS-001` | conservar hasta confirmar consumidor o retirar `goToMovements` |
| `TREQ-PASS-002` | conservar hasta confirmar consumidor o retirar `onScanTable`   |
| `TREQ-PASS-003` | protege la cobertura completa del historial de Saudo           |
| `TREQ-NEXO-001` | protege la implementación canónica sin parche temporal         |
| `TREQ-NEXO-002` | protege la selección completa de productos en ajustes          |

No se cambia el estado de esos requisitos durante `CODE-AUD-010`.

##### 14.3. Filas completas para el Registro Canónico

Al aprobar `CODE-AUD-010`, agregar debajo de las filas existentes de:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

las siguientes líneas completas:

```md
| `TREQ-ANIMA-001` | `ANIMA` | Cuando la interfaz de novedades permita seleccionar audiencia, deberá distinguir si controla notificaciones o visibilidad persistente; el modelo aprobado deberá conservarse, editarse, auditarse y aplicarse al leer. | `CODE-AUD-010` / `H-CODE-010-001` | Exposición fuera de alcance, usuarios objetivo no informados y falsa percepción de segmentación / alta | contractual + autorización + integración + E2E / automatizada | `CODE-AUD-012 — Detectar procesos implementados solo parcialmente` | Pendiente de asignación en E5 | `vento-anima` / local, CI, staging y dispositivo móvil pendientes | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
| `TREQ-ANIMA-002` | `ANIMA` | Cuando novedades opere con datos fallback o en modo solo lectura, no deberá mostrar controles de crear, editar o eliminar que no puedan completarse; el modo deberá ser explícito y coherente. | `CODE-AUD-010` / `H-CODE-010-002` | Trabajo perdido, errores previsibles y experiencia administrativa engañosa / alta | interfaz + regresión / automatizada | `CODE-AUD-012 — Detectar procesos implementados solo parcialmente` | Pendiente de asignación en E5 | `vento-anima` / local, CI, staging y dispositivo móvil pendientes | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
| `TREQ-NEXO-003` | `NEXO` | Toda vista previa usada para aprobar una impresión deberá identificar si es simulación y demostrar correspondencia suficiente entre plantilla, ZPL, DPI, dimensiones, códigos y muestra física antes de considerarse validación de salida. | `CODE-AUD-010` / `H-CODE-010-003` | Etiquetas recortadas, códigos ilegibles y diferencia entre vista previa e impresión física / alta | contractual + interfaz + hardware + regresión / híbrida | `CODE-AUD-012 — Detectar procesos implementados solo parcialmente` | Pendiente de asignación en E5 | `vento-nexo` / local, CI, staging e impresora física pendientes | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
| `TREQ-INTEGRATION-002` | `INTEGRATION` | Toda interfaz pública de newsletter deberá registrar una suscripción y consentimiento reales mediante el contrato aprobado, comunicar el resultado verdadero y permitir el tratamiento definido; de lo contrario no deberá publicarse. | `CODE-AUD-010` / `H-CODE-010-004` | Falsa confirmación, pérdida de contactos y tratamiento de datos sin contrato verificable / alta | integración + privacidad + E2E / automatizada | `WEB-FRM-011 — Implementar suscripción de newsletter o retirar la interfaz` | Pendiente de asignación en el plan web y E5 cuando corresponda | `Vento-Group` y `vento-viso` / CI, preview y producción pública pendientes | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
```

Estas filas no deberán resumirse como una lista de identificadores.

---

#### 15. Decisiones propuestas

1. Una pantalla visualmente completa no se considerará funcional sin contrato ejecutable.
2. La existencia de un handler no demuestra persistencia correcta.
3. Una selección de audiencia deberá declarar si controla notificación, visibilidad o ambas.
4. La audiencia de novedades ANIMA no se considerará persistida con la implementación actual.
5. El texto “trabajador” deberá corregirse si solo existen filtros por sede y rol.
6. El modo fallback de novedades deberá ser coherentemente de solo lectura.
7. Los controles imposibles deberán ocultarse o deshabilitarse antes de que el usuario llene el formulario.
8. La vista previa local de NEXO no se considerará equivalente a una impresión física.
9. La simulación podrá conservarse como ayuda visual.
10. La aprobación física requerirá prueba sobre impresora real cuando corresponda.
11. `WEB-FRM-011` se conserva como destino exacto de newsletter.
12. No se crea una tarea web duplicada.
13. Los stubs de PASS no se consideran botones activos sin consumidor confirmado.
14. `CODE-AUD-015` decidirá si esos stubs están huérfanos.
15. `TREQ-PASS-001`, `002` y `003` se reutilizan.
16. `TREQ-NEXO-001` y `002` se reutilizan.
17. Se crean `TREQ-ANIMA-001` y `TREQ-ANIMA-002`.
18. Se crea `TREQ-NEXO-003`.
19. Se crea `TREQ-INTEGRATION-002`.
20. Los cuatro requisitos nuevos quedan en estado `IDENTIFICADO`.
21. No se crea una tarea nueva del roadmap.
22. `CODE-AUD-011` será la única continuidad inmediata.

---

#### 16. Límites de certeza

Esta tarea no confirma:

- que todas las rutas sean alcanzables en producción;
- que todos los roles vean los mismos controles;
- que cada botón de todas las aplicaciones haya sido ejecutado;
- que el Edge Function de notificaciones no conserve auditoría por otra vía;
- que las novedades actuales contengan datos sensibles;
- que la vista previa NEXO produzca hoy una impresión incorrecta;
- que el formulario público de newsletter esté publicado en todas las rutas;
- que los stubs PASS carezcan de consumidores en ramas distintas;
- que ausencia de hallazgo en VISO, FOGO u ORIGO implique integridad completa;
- que las pantallas conectadas estén libres de errores de negocio;
- que una consulta real garantice autorización correcta.

Las tareas siguientes revisarán infraestructura, procesos parciales, legacy, duplicidad, consumidores, build, seguridad, concurrencia y trazabilidad funcional.

---

#### 17. Criterios de aceptación

`CODE-AUD-010` podrá aprobarse cuando:

- interfaz completa, parcial, ficticia y degradada estén diferenciadas;
- estados vacíos y feature flags no se clasifiquen erróneamente;
- la audiencia de novedades ANIMA esté contrastada con su persistencia real;
- el modo fallback de novedades esté documentado;
- la edición y eliminación durante fallback tengan destino;
- la vista previa local de NEXO esté diferenciada de la salida física;
- newsletter tenga `WEB-FRM-011` como destino exacto;
- los stubs PASS no se declaren visibles sin evidencia;
- los requisitos anteriores se reutilicen sin duplicarse;
- las pantallas conectadas revisadas queden excluidas como falsos positivos;
- cada hallazgo tenga destino;
- las cuatro filas nuevas `TREQ-*` estén completas;
- no se cree una tarea nueva;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-011` permanezca como continuidad inmediata.

---

#### 18. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
pantalla o control visible
        ↓
handler y navegación
        ↓
contrato real
        ↓
persistencia, alcance y resultado
        ↓
interfaz completa, parcial, degradada o ficticia
        ↓
TREQ y tarea responsable
```

La continuidad será:

```text
CODE-AUD-011
— Detectar infraestructura sin proceso funcional utilizable
```


### ✅ CODE-AUD-011 — Detectar infraestructura sin proceso funcional utilizable

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de infraestructura técnica sin recorrido empresarial utilizable de extremo a extremo  
**Dependencia anterior:** `CODE-AUD-010`  
**Continuidad reservada:** `CODE-AUD-012`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea contrasta la existencia de infraestructura con la existencia de un proceso funcional utilizable.

Se considera infraestructura:

- tablas;
- vistas;
- funciones SQL;
- RPC;
- políticas RLS;
- rutas API;
- componentes;
- formularios aislados;
- registros de aplicación;
- permisos;
- plantillas;
- modelos de datos;
- servicios locales;
- código no desplegado.

Se considera proceso funcional utilizable cuando existe una cadena comprobable:

```text
necesidad empresarial
        ↓
actor y contexto
        ↓
entrada alcanzable
        ↓
acciones y estados
        ↓
validación y autorización
        ↓
persistencia o efecto real
        ↓
resultado visible
        ↓
excepciones, corrección y auditoría
```

Resultado general:

- AURA conserva una reserva de catálogo y permiso, pero no una aplicación o proceso;
- NEXO conserva infraestructura de LPN, pero no un ciclo de vida operativo alcanzable;
- PULSO conserva una base técnica amplia de POS interno, pero no un proceso integrado de apertura, venta, cobro, caja y cierre;
- TALENTO contiene pantallas y servicios conectados, pero no constituye todavía un proceso productivo desplegado;
- existen datos de asistencia y pagos sin procesos funcionales comprobados de corrección;
- impresión NEXO no se clasifica como infraestructura sin proceso porque sí puede enviar ZPL mediante BrowserPrint;
- dispositivos compartidos no se clasifican como infraestructura pura porque ya existe creación, resolución de sesión y firma de actor en acciones concretas;
- la existencia de tablas vacías no basta por sí sola para declarar infraestructura inútil;
- no se crea ninguna tarea nueva del roadmap;
- se crean tres requisitos de prueba;
- no se modifica código ni Supabase.

---

#### 2. Diferencia entre infraestructura y proceso

##### 2.1. Infraestructura disponible

Existe una o más piezas técnicas que podrían soportar un proceso.

Ejemplos:

- tabla y RLS;
- endpoint de lectura;
- formulario sin ruta;
- función SQL sin consumidor;
- aplicación registrada sin repositorio;
- pantalla no desplegada;
- esquema de dominio sin flujo de usuario.

##### 2.2. Proceso ausente

No existe una cadena alcanzable que permita al actor:

1. iniciar;
2. continuar;
3. completar;
4. corregir;
5. consultar el resultado;
6. demostrar quién actuó.

##### 2.3. Proceso parcial

Existe un recorrido utilizable, pero omite etapas o casos.

Este caso pertenece principalmente a:

```text
CODE-AUD-012
— Detectar procesos implementados solo parcialmente
```

##### 2.4. Artefacto sin consumidor

Existe una pieza técnica cuya utilización no está confirmada.

Este caso deberá profundizarse en:

```text
CODE-AUD-015
— Detectar rutas, componentes, funciones y tablas sin consumidores
```

Una misma evidencia puede alimentar varias tareas sin duplicar el hallazgo.

---

#### 3. Criterios de clasificación

Una infraestructura se clasifica como **sin proceso funcional utilizable** cuando se confirma una o más de estas condiciones:

- no existe ruta alcanzable;
- la ruta redirige fuera del dominio;
- existe solo lectura, pero el dominio exige mutaciones;
- existe componente, pero no consumidor;
- existe función de servidor, pero no invocación;
- existe registro de aplicación, pero no repositorio ni pantallas;
- existe modelo de datos, pero no estados ni transiciones ejecutables;
- existe proceso en código, pero no despliegue accesible;
- existe infraestructura de persistencia, pero no corrección auditable;
- existe un fragmento técnico que no permite completar el objetivo empresarial.

No se clasifica automáticamente como brecha cuando:

- la infraestructura es deliberadamente compartida;
- la pieza es una reserva futura explícita y no se presenta como operativa;
- existe un proceso funcional aunque todavía necesite mejoras;
- la tabla está vacía porque aún no hubo operación real;
- el componente está detrás de una feature flag aprobada;
- el servicio es interno y no necesita una pantalla propia.

---

#### 4. AURA — reserva técnica sin producto ni proceso

La auditoría técnica confirmó:

- no existe repositorio AURA;
- no existen rutas ni pantallas;
- no existen elementos de navegación;
- no existe proceso de marketing implementado;
- existe una aplicación `aura` activa en catálogo;
- existe un permiso base de acceso.

Por tanto:

```text
registro de aplicación
+
permiso reservado
≠
aplicación funcional
```

**Clasificación:** reserva técnica explícita sin proceso funcional.

No se exige implementar AURA.

La decisión correcta es conservarla como:

```text
APLICACIÓN DIFERIDA
```

hasta ejecutar:

- `AURA-AUD-001 — Confirmar repositorio propietario`;
- `AURA-AUD-002 — Confirmar estado real del producto`;
- `AURA-AUD-005 — Inventariar procesos de marketing`;
- `AURA-AUD-010 — Decidir continuidad, reemplazo o retiro`;
- `AURA-AUD-012 — Mantener roadmap de implementación bloqueado hasta decisión`.

Riesgo:

- confundir catálogo técnico con disponibilidad empresarial;
- asignar permisos a una capacidad inexistente;
- presentar una aplicación como activa sin proceso, propietario o despliegue;
- iniciar implementación antes de una decisión de alcance.

No se crea una tarea nueva.

---

#### 5. NEXO — infraestructura LPN sin ciclo de vida operativo alcanzable

Infraestructura confirmada:

```text
inventory_lpns
inventory_lpn_items
/api/inventory/lpns
LpnCreateForm
/inventory/lpns
```

##### 5.1. API

La ruta:

```text
src/app/api/inventory/lpns/route.ts
```

implementa únicamente:

```text
GET
```

y devuelve:

```text
id
code
site_id
created_at
```

No implementa:

- creación;
- activación;
- cierre;
- anulación;
- reetiquetado;
- empaque;
- desempaque;
- traslado;
- cambio de custodia;
- consulta de contenido;
- división;
- unión;
- anidamiento.

##### 5.2. Ruta visible

La página:

```text
src/app/inventory/lpns/page.tsx
```

no presenta gestión de LPN.

Redirige directamente a:

```text
/inventory/stock
```

##### 5.3. Formulario aislado

Existe:

```text
src/features/inventory/lpns/lpn-create-form.tsx
```

El formulario contiene:

- selector local de sedes;
- códigos de sede escritos en código;
- captura manual de `site_id` cuando no existe valor predeterminado;
- vista previa de código;
- una acción recibida por propiedad.

No se localizó otro archivo que importe `LpnCreateForm`.

Por tanto, la existencia del componente no demuestra una pantalla utilizable.

##### 5.4. Contenido del LPN

No se localizaron consumidores de aplicación para:

```text
inventory_lpn_items
```

La tabla puede existir, pero no existe un proceso alcanzable de:

```text
LPN
→ contenido
→ cantidad
→ ubicación
→ movimiento
→ custodia
→ cierre
```

##### 5.5. Conclusión LPN

La extensión canónica de NEXO ya declara expresamente que el subdominio no se considera resuelto por la sola existencia de:

- tablas;
- permisos;
- rutas legacy.

**Clasificación:** infraestructura de dominio sin proceso funcional utilizable.

Destinos exactos:

- `NEXO-DOM-002 — Definir propósito y tipos canónicos de LPN`;
- `NEXO-DOM-003 — Definir ciclo de vida de LPN: crear, activar, cerrar, anular y reetiquetar`;
- `NEXO-DOM-004 — Definir contenido, empaque y desempaque de LPN`;
- `NEXO-DOM-007 — Definir relación sede → LOC → LPN → contenido`;
- `NEXO-DOM-019 — Separar identidad permanente del contenedor físico e identidad temporal o persistente del LPN`;
- `NEXO-DOM-021 — Prohibir doble contabilización entre existencia suelta en LOC y existencia contenida en LPN`;
- `NEXO-DOM-022 — Definir que mover un LPN mueve atómicamente todo su contenido`;
- `NEXO-UX-026 — Diseñar ciclo de vida completo de LPN`;
- `NEXO-UX-027 — Diseñar empaque, desempaque y consulta de contenido`;
- `NEXO-UX-036 — Diseñar búsqueda por LOC, LPN, código, responsable y contenido`;
- `NEXO-UX-037 — Diseñar impresión de LOC, LPN, activo y documento`;
- `NEXO-UX-040 — Validar el prototipo del subdominio con decoración, vajilla, herramientas y repuestos`;
- `CODE-AUD-015`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se autoriza completar el componente existente antes de definir el dominio.


---

#### 6. PULSO — base técnica de POS sin proceso interno completo de venta y caja

Infraestructura confirmada en el esquema `pos`:

```text
pos_sessions
pos_session_orders
pos_payments
pos_cash_shifts
pos_cash_movements
pos_tables
pos_zones
pos_modifiers
pos_modifier_options
pos_product_modifiers
pos_order_item_modifiers
```

También existe:

```text
process_order_payment(...)
```

La función:

- consulta una orden;
- marca la orden como pagada y completada;
- inserta un registro de pago;
- calcula puntos;
- actualiza lealtad.

##### 6.1. Consumidores confirmados

La superficie de salón de PULSO:

- consulta zonas;
- consulta mesas;
- consulta sesiones abiertas;
- consulta llamados;
- permite crear y resolver llamados;
- escucha cambios Realtime.

Por tanto, el proceso de llamados de salón sí tiene comportamiento real.

##### 6.2. Proceso POS no localizado

No se localizó en PULSO una cadena completa para:

1. abrir turno de caja;
2. abrir sesión de mesa o mostrador;
3. crear venta interna;
4. agregar líneas y modificadores;
5. asociar venta con sesión;
6. cobrar mediante un medio aprobado;
7. registrar pago;
8. corregir o anular el medio de pago;
9. registrar entrada o salida de caja;
10. cerrar sesión;
11. cuadrar y cerrar caja;
12. emitir hechos de inventario;
13. emitir hechos económicos a NUMERA;
14. acumular o redimir puntos mediante el contrato final.

Búsquedas sobre:

```text
pos_cash_shifts
pos_cash_movements
process_order_payment
```

no localizaron consumidores de aplicación que permitan ejecutar ese ciclo completo.

La auditoría remota también confirmó que las tablas POS internas estaban vacías al corte.

Una tabla vacía no demuestra por sí sola que no exista proceso. En este caso se combina con:

- ausencia de consumidores encontrados;
- lectura de sesiones sin creación encontrada;
- falta de apertura y cierre de caja;
- falta de flujo integrado de cobro;
- falta de corrección auditable de pago.

##### 6.3. Conclusión PULSO

La infraestructura de salón y llamados no equivale a un POS interno completo.

**Clasificación:** fundación técnica de POS con proceso empresarial principal todavía no utilizable de extremo a extremo.

Destinos exactos:

- `PULSO-AUTH-001 — Inventariar vistas POS`;
- `PULSO-AUTH-002 — Inventariar órdenes`;
- `PULSO-AUTH-008 — Definir permisos de cierre y anulación`;
- `PULSO-AUTH-012 — Integrar dispositivos POS compartidos`;
- `PULSO-AUTH-013 — Registrar trabajador que ejecuta la operación`;
- `PULSO-UX-001 — Inventariar procesos de venta, caja y salón`;
- `PULSO-UX-007 — Simplificar creación de venta`;
- `PULSO-UX-008 — Simplificar cobro y medios de pago`;
- `PULSO-UX-009 — Separar anulación, devolución y reembolso`;
- `PULSO-UX-010 — Diseñar apertura y cierre de caja`;
- `PULSO-UX-016 — Conectar venta con inventario`;
- `PULSO-UX-017 — Conectar venta con NUMERA`;
- `PULSO-UX-018 — Conectar venta con PASS`;
- `CODE-AUD-012`;
- `CODE-AUD-015`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se deberá declarar PULSO POS completo por la sola existencia del esquema y las vistas.

---

#### 7. TALENTO — implementación conectada, pero sin proceso productivo desplegado

`CODE-AUD-003` y `CODE-AUD-010` confirmaron que TALENTO contiene superficies conectadas para:

- inicio;
- perfil;
- documentos;
- postulación.

No obstante, TALENTO se mantiene como producto futuro y no tiene una superficie productiva comprobada.

Por tanto:

```text
código conectado
+
servicios
+
pantallas
≠
proceso operativo disponible
```

**Clasificación:** implementación no desplegada, no infraestructura vacía.

Destinos exactos:

- `CAP-TAL-001 — Diseñar alcance y responsabilidades de TALENTO, VISO y ANIMA`;
- `CAP-TAL-002 — Diseñar publicación de vacantes, consulta y postulación en TALENTO`;
- `CAP-TAL-003 — Diseñar expediente progresivo de datos, documentos, consentimiento y conservación`;
- `CAP-TAL-004 — Diseñar evaluación, entrevista, decisión, oferta y pre-registro de candidato`;
- `CAP-TAL-005 — Diseñar traspaso trazable e idempotente de TALENTO hacia ANIMA y VISO`;
- `CAP-TAL-006 — Diseñar período de prueba, permisos provisionales, continuidad definitiva y cierre`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se crea requisito de prueba nuevo durante esta tarea porque el proceso objetivo todavía debe ser aprobado en E2.

---

#### 8. Datos sin proceso de corrección comprobado

##### 8.1. Marcaciones de asistencia

Existen:

- `attendance_logs`;
- consultas de ANIMA;
- informes de VISO;
- notas de incidencia.

No se encontró una acción interna que permita corregir:

- hora;
- tipo de marcación;
- entrada o salida equivocada;
- duplicado;
- marcación atribuida al evento incorrecto.

Esto no significa que toda marcación deba ser editable.

Primero debe definirse:

- quién solicita;
- quién aprueba;
- qué campos pueden corregirse;
- cómo se conserva el valor anterior;
- qué evidencia es obligatoria;
- cómo afecta nómina, turno y contexto.

**Clasificación:** datos disponibles sin proceso de corrección aprobado y utilizable.

Destinos:

- `PROC-CAT-002 — Diseñar el proceso TO-BE para capacidades manuales, parciales, rotas o ausentes`;
- `CODE-AUD-012`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- bloques funcionales de ANIMA y VISO cuando E2 asigne propiedad.

No se crea `TREQ-*` todavía porque la regla de corrección no está aprobada.

##### 8.2. Medios de pago

Existen:

- `pos.pos_payments`;
- `payments.transactions`;
- intención de pago;
- webhook;
- conciliación técnica.

No se encontró una acción interna de corrección manual y auditable del medio de pago.

**Clasificación:** infraestructura de pagos sin proceso aprobado de corrección.

Destinos:

- `PULSO-UX-008`;
- `PULSO-UX-009`;
- `PULSO-AUTH-008`;
- `PROC-CAT-002`;
- `CODE-AUD-012`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se crea un requisito separado hasta definir si la corrección será:

- edición;
- reversión;
- anulación;
- devolución;
- asiento compensatorio.

---

#### 9. Falsos positivos excluidos

##### 9.1. Impresión NEXO

NEXO no conserva únicamente plantillas.

La pantalla de trabajos de impresión:

- detecta impresoras mediante BrowserPrint;
- conecta una impresora;
- genera ZPL;
- envía el ZPL mediante `device.send`;
- comunica éxito o error.

Por tanto, existe un proceso local de impresión.

Las brechas de:

- fidelidad de preview;
- persistencia de cola;
- confirmación física;
- reintentos;
- idempotencia;
- monitoreo;
- fallback;

pertenecen a `CODE-AUD-012`, `018`, E4 y `TREQ-NEXO-003`.

**No se clasifica como infraestructura sin proceso.**

##### 9.2. Dispositivos compartidos

Se confirmó:

- creación administrativa desde VISO;
- usuario técnico;
- plantilla;
- sede;
- área;
- aplicaciones permitidas;
- políticas de actor;
- resolución de sesión en aplicaciones;
- firma de actor por PIN para acciones concretas de NEXO.

Por tanto, existe un recorrido funcional parcial.

Las brechas restantes de:

- provisión física;
- cambio de trabajador;
- revocación;
- sesión expirada;
- superficie contextual;
- ergonomía;
- contingencia;

pertenecen a:

- `UX-STATION-*`;
- `AUTH-DEV-*`;
- `CODE-AUD-012`;
- `CODE-AUD-017`;
- `CODE-AUD-018`.

**No se clasifica como infraestructura pura sin proceso.**

##### 9.3. NUMERA, FOGO y ORIGO

NUMERA tiene consultas reales de resumen y rentabilidad.

FOGO tiene superficies de recetas y lotes.

ORIGO administra órdenes y recepciones.

El hecho de que ciertas tablas tengan cero registros no permite declarar que el proceso sea inexistente.

Su cobertura y completitud deberán evaluarse en `CODE-AUD-012`.

---

#### 10. Matriz por repositorio

| Repositorio     | Resultado de CODE-AUD-011                                                                               | Clasificación                                       |
| --------------- | ------------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| `vento-shell`   | contiene fundamentos de AURA, LPN, POS, pagos y dispositivos; la existencia física no demuestra proceso | infraestructura central                             |
| `vento-viso`    | administra dispositivos compartidos; no es infraestructura pura                                         | proceso parcial confirmado                          |
| `vento-nexo`    | LPN sin ciclo alcanzable; impresión sí envía a impresora                                                | un hallazgo confirmado y un falso positivo excluido |
| `vento-fogo`    | recetas y lotes tienen superficies conectadas                                                           | revisar completitud en `CODE-AUD-012`               |
| `vento-origo`   | órdenes y recepciones tienen superficies conectadas                                                     | revisar completitud en `CODE-AUD-012`               |
| `vento-pulso`   | salón y llamados funcionan; POS interno completo no está localizado                                     | infraestructura principal sin proceso E2E           |
| `vento-numera`  | dashboard y rentabilidad están conectados                                                               | revisar completitud en `CODE-AUD-012`               |
| `Vento-Group`   | newsletter es interfaz sin backend final, no infraestructura sin proceso                                | mantiene `WEB-FRM-011`                              |
| `vento-anima`   | asistencia funciona; no existe corrección comprobada de marcación                                       | dato sin proceso de corrección                      |
| `vento-pass`    | pedidos, lealtad y Club tienen lógica; stubs se revisan como consumidores                               | no se confirma infraestructura pura nueva           |
| `vento-talento` | código conectado, pero producto futuro sin despliegue comprobado                                        | implementación no productiva                        |
| `vento-vital`   | proyecto separado                                                                                       | fuera de Vento OS                                   |
| AURA            | catálogo y permiso sin repositorio ni proceso                                                           | reserva diferida                                    |


---

#### 11. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                            | Clasificación                                 | Destino                                                                                                  |
| ---------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `H-CODE-011-001` | AURA existe como aplicación y permiso reservados, sin repositorio, rutas, pantallas o procesos      | reserva técnica                               | `AURA-AUD-001` a `AURA-AUD-012`                                                                          |
| `H-CODE-011-002` | NEXO tiene tablas LPN y endpoint de lectura, pero no ciclo de vida alcanzable                       | infraestructura sin proceso                   | `NEXO-DOM-002` a `008`, `019` a `024`, `NEXO-UX-026` a `040`, `CODE-AUD-015`, `019`, `020`               |
| `H-CODE-011-003` | `/inventory/lpns` redirige a stock                                                                  | ruta sin proceso LPN                          | mismo destino de `H-CODE-011-002`                                                                        |
| `H-CODE-011-004` | `LpnCreateForm` no tiene consumidor localizado                                                      | componente aislado                            | `CODE-AUD-015`, `019`, `020`                                                                             |
| `H-CODE-011-005` | no se localizaron consumidores de `inventory_lpn_items`                                             | modelo sin operación de contenido             | `NEXO-DOM-004`, `007`, `021`, `022`, `NEXO-UX-027`, `036`, `CODE-AUD-015`                                |
| `H-CODE-011-006` | PULSO conserva esquema POS, vistas y función de pago sin ciclo integrado de venta y caja localizado | fundación sin proceso E2E                     | `PULSO-AUTH-*`, `PULSO-UX-001`, `007` a `010`, `016` a `018`, `CODE-AUD-012`, `015`, `017`, `019`, `020` |
| `H-CODE-011-007` | salón PULSO sí consulta sesiones y gestiona llamados                                                | proceso real                                  | cerrado como falso positivo                                                                              |
| `H-CODE-011-008` | TALENTO tiene código conectado, pero no superficie productiva comprobada                            | implementación no desplegada                  | `CAP-TAL-001` a `006`, `CODE-AUD-019`, `020`                                                             |
| `H-CODE-011-009` | asistencia conserva datos sin corrección funcional comprobada                                       | infraestructura de datos sin proceso aprobado | `PROC-CAT-002`, `CODE-AUD-012`, `019`, `020`                                                             |
| `H-CODE-011-010` | pagos conservan estructuras sin corrección manual auditable                                         | infraestructura de datos sin proceso aprobado | `PULSO-UX-008`, `009`, `PULSO-AUTH-008`, `PROC-CAT-002`, `CODE-AUD-012`, `017`, `019`, `020`             |
| `H-CODE-011-011` | impresión NEXO sí envía ZPL con BrowserPrint                                                        | proceso local existente                       | `CODE-AUD-012`, `018`, mantiene `TREQ-NEXO-003`                                                          |
| `H-CODE-011-012` | dispositivos compartidos ya tienen creación, sesión y firma en acciones concretas                   | proceso parcial existente                     | `UX-STATION-*`, `AUTH-DEV-*`, `CODE-AUD-012`, `017`, `018`                                               |
| `H-CODE-011-013` | una tabla vacía no demuestra ausencia de proceso                                                    | regla de clasificación                        | cerrado                                                                                                  |
| `H-CODE-011-014` | el Registro Canónico de Requisitos de Prueba está desalineado con tareas aprobadas                  | brecha documental                             | corregir durante consolidación de `CODE-AUD-011`; `QA-REG-001` verifica retrospectivamente               |

Todos los hallazgos quedan cerrados o vinculados a tareas existentes.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 12. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Requisitos nuevos derivados:

- `TREQ-SHELL-001`;
- `TREQ-NEXO-004`;
- `TREQ-PULSO-001`.

Requisitos reutilizados:

- `TREQ-NEXO-003`;
- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`.

Las definiciones completas, estados, responsables, ambientes y evidencias de estos requisitos existen únicamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

No se duplican filas completas del Registro Canónico dentro de esta tarea.

---
#### 13. Decisiones aprobadas

1. La infraestructura no se considerará proceso.
2. Una aplicación registrada no se considerará producto disponible.
3. Una tabla, permiso o endpoint no demostrará cobertura funcional.
4. AURA permanecerá diferida y no navegable hasta decisión.
5. No se exigirá implementar AURA.
6. LPN se declara infraestructura sin ciclo operativo alcanzable.
7. El formulario LPN aislado no se tomará como implementación.
8. La ruta redirigida no se tomará como pantalla LPN.
9. El diseño LPN deberá preceder cualquier reutilización del componente.
10. PULSO salón se reconoce como proceso conectado.
11. PULSO POS completo no se considera implementado.
12. La función `process_order_payment` no prueba por sí sola un proceso de caja.
13. TALENTO se clasifica como implementación no productiva, no como infraestructura vacía.
14. Corrección de asistencia deberá diseñarse antes de implementarse.
15. Corrección de pagos deberá distinguir edición, reversión, anulación, devolución y compensación.
16. Impresión NEXO se excluye como falso positivo porque sí envía ZPL.
17. Dispositivos compartidos se excluyen como falso positivo puro porque ya tienen acciones funcionales.
18. Tablas vacías no bastan para declarar ausencia de proceso.
19. Se deriva `TREQ-SHELL-001`.
20. Se deriva `TREQ-NEXO-004`.
21. Se deriva `TREQ-PULSO-001`.
22. Los tres requisitos quedan en estado `IDENTIFICADO`.
23. No se crea una tarea nueva del roadmap.
24. `CODE-AUD-012` será la única continuidad inmediata.

---

#### 14. Límites de certeza

Esta tarea no confirma:

- que nunca haya existido un consumidor LPN en otra rama;
- que las tablas LPN estén vacías;
- que la función de pago POS no sea invocada externamente;
- que ningún sistema externo escriba sesiones POS;
- que AURA deba eliminarse;
- que TALENTO no pueda desplegarse con la infraestructura actual;
- que toda corrección de asistencia deba permitirse;
- que todo pago pueda editarse;
- que una tabla con registros implique proceso correcto;
- que una tabla sin registros implique proceso roto;
- que impresión NEXO tenga confirmación física;
- que el ciclo de dispositivos compartidos esté completo;
- que todos los procesos parciales hayan sido detectados.

`CODE-AUD-012` continuará con los procesos que sí tienen un recorrido, pero no lo completan correctamente.

---

#### 15. Criterios de aceptación

`CODE-AUD-011` podrá aprobarse cuando:

- infraestructura y proceso estén diferenciados;
- AURA quede clasificada como reserva;
- LPN quede contrastado entre tabla, API, ruta y componente;
- se documente que la ruta LPN redirige;
- se documente que el formulario LPN no tiene consumidor localizado;
- el POS interno se diferencie del proceso de llamados de salón;
- el esquema POS no se confunda con un POS completo;
- TALENTO quede clasificado como no productivo;
- asistencia y pagos tengan destinos sin inventar reglas;
- impresión NEXO sea excluida como falso positivo;
- dispositivos compartidos sean excluidos como falso positivo puro;
- cada hallazgo tenga destino exacto;
- no se cree ninguna tarea nueva;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-012` permanezca como continuidad inmediata.

---

#### 16. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
tabla, función, API, componente o registro
        ↓
actor y entrada alcanzable
        ↓
estados y acciones
        ↓
resultado empresarial
        ↓
proceso utilizable o infraestructura aislada
        ↓
diseño, retiro, integración o paquete
```

La continuidad será:

```text
CODE-AUD-012
— Detectar procesos implementados solo parcialmente
```


### ✅ CODE-AUD-012 — Detectar procesos implementados solo parcialmente

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de recorridos funcionales que ya ejecutan efectos reales, pero todavía no completan el contrato empresarial de extremo a extremo  
**Dependencia anterior:** `CODE-AUD-011`  
**Continuidad reservada:** `CODE-AUD-013`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea identifica procesos que:

- ya tienen una entrada alcanzable;
- ejecutan al menos una validación o mutación real;
- producen algún resultado visible o persistente;
- pero todavía omiten una etapa, excepción, transición, integración, corrección, recuperación o cierre obligatorio.

Resultado general:

- se confirman procesos parciales en `vento-anima`, `vento-pass`, `vento-nexo`, `vento-viso`, `vento-fogo` y `vento-origo`;
- no se reclasifican como parciales las capacidades inexistentes o puramente técnicas ya cubiertas por `CODE-AUD-010` y `CODE-AUD-011`;
- no se declara un defecto por la sola existencia de un modo piloto, degradado o de solo registro;
- cada modo parcial deberá quedar explícitamente diferenciado de la operación final;
- se reutilizan requisitos de prueba ya existentes;
- se derivan cinco requisitos de prueba nuevos;
- se propone una sola tarea nueva del roadmap, porque no existe una tarea funcional exacta para cerrar el ciclo de novedades internas de ANIMA;
- no se modifican repositorios funcionales;
- no se modifica Supabase.

---

#### 2. Definición canónica de proceso parcial

Un proceso se clasifica como **parcialmente implementado** cuando existe esta base:

```text
actor
  ↓
entrada alcanzable
  ↓
validación
  ↓
acción real
  ↓
persistencia o efecto observable
```

pero falta uno o más componentes del contrato completo:

```text
estado inicial
→ ejecución
→ transición
→ confirmación
→ excepción
→ corrección
→ recuperación
→ integración posterior
→ cierre auditable
```

No es suficiente que una pantalla “haga algo”.

Para considerarse completo, el proceso deberá demostrar:

1. propósito empresarial aprobado;
2. actor y contexto autorizados;
3. entrada alcanzable;
4. datos de entrada completos;
5. validación de servidor;
6. estados y transiciones válidos;
7. persistencia atómica cuando corresponda;
8. resultado visible;
9. manejo de diferencias;
10. corrección sin destruir historial;
11. reintento o recuperación;
12. efecto sobre dominios consumidores;
13. evidencia auditable;
14. finalización inequívoca.

---

#### 3. Diferencia frente a otras tareas CODE-AUD

##### 3.1. No corresponde a CODE-AUD-010

`CODE-AUD-010` cubre interfaces que aparentan capacidad, pero no tienen lógica real suficiente detrás.

Ejemplos ya clasificados:

- acción de movimientos de PASS que solo muestra “Próximamente”;
- escaneo de mesa de PASS que solo muestra una alerta;
- newsletter pública sin persistencia real.

##### 3.2. No corresponde a CODE-AUD-011

`CODE-AUD-011` cubre infraestructura sin proceso utilizable.

Ejemplos ya clasificados:

- AURA como reserva;
- LPN sin ciclo operativo alcanzable;
- POS interno de PULSO sin recorrido completo;
- TALENTO sin despliegue productivo.

##### 3.3. Sí corresponde a CODE-AUD-012

Esta tarea cubre recorridos que sí ejecutan una parte real del proceso, pero quedan incompletos.

Ejemplos:

- crear una novedad y enviar notificación, pero no persistir ni aplicar su audiencia;
- enviar ZPL a la impresora, pero eliminar la cola antes de confirmar el resultado;
- registrar una remisión operativa, pero no afectar inventario porque el modo real está desactivado;
- crear un dispositivo compartido, pero no poder revocarlo o rotar sus credenciales desde una superficie administrativa;
- registrar producción real en una sola acción, pero no manejar inicio, producción parcial, finalización y corrección;
- registrar una recepción en modo solo registro, pero no completar la entrada de inventario y sus integraciones posteriores.

---

#### 4. Método aplicado

Para cada proceso se contrastó:

```text
actor
→ ruta o pantalla
→ acción de servidor
→ tabla, RPC o función
→ estado
→ resultado visible
→ consumidor posterior
→ corrección
→ cierre
```

Se revisaron especialmente:

- rutas alcanzables;
- formularios;
- server actions;
- RPC;
- flags de operación;
- persistencia local;
- estados declarados;
- transiciones encontradas;
- ausencia de consumidores posteriores;
- modos piloto, fallback o solo registro;
- tareas funcionales ya existentes en el plan.

La ausencia de una coincidencia en búsqueda de código no se interpreta por sí sola como prueba absoluta de inexistencia. Los hallazgos se formulan como estado comprobado de las ramas principales inspeccionadas al corte.

---

#### 5. ANIMA — novedades con CRUD y notificación, pero sin contrato completo de audiencia

Archivo principal revisado:

```text
vento-anima/src/components/announcements/use-announcements-screen.ts
```

##### 5.1. Capacidad real confirmada

El flujo permite:

- consultar novedades activas;
- crear una novedad;
- editar título, cuerpo y etiqueta;
- eliminar una novedad;
- invocar `announcement-notify`;
- seleccionar sedes y roles al crear.

Por tanto, no es una interfaz ficticia.

##### 5.2. Brecha de audiencia

Las selecciones:

```text
formSiteIds
formRoleCodes
```

solo se envían a:

```text
announcement-notify
```

después de insertar una novedad.

La fila persistida en `announcements` no conserva en ese flujo:

- sedes objetivo;
- roles objetivo;
- regla global o segmentada;
- versión de audiencia;
- criterio de visibilidad persistente.

La lectura posterior consulta todas las novedades activas y no aplica la audiencia seleccionada.

Por tanto, la interfaz actualmente puede significar:

```text
audiencia de la notificación
```

pero no demuestra:

```text
audiencia persistente de la novedad
```

##### 5.3. Edición incompleta

Al editar:

- no se cargan sedes o roles anteriores;
- no se actualiza una audiencia persistida;
- no se define si una edición vuelve a notificar;
- no se distingue edición editorial de redistribución;
- no se conserva historial de versiones.

##### 5.4. Eliminación

La acción encontrada ejecuta eliminación física sobre `announcements`.

No se encontró en este recorrido:

- archivo;
- despublicación;
- vigencia;
- motivo;
- historial de edición o retiro.

La política final deberá decidir si la eliminación física está permitida.

##### 5.5. Modo fallback

Cuando la tabla no existe:

- se cargan datos locales;
- la pantalla indica “modo local”;
- el guardado se rechaza con una alerta.

Este comportamiento ya está protegido por `TREQ-ANIMA-002`, pero sigue siendo un proceso degradado que deberá expresarse sin controles engañosos.

##### 5.6. Clasificación

**Proceso parcial confirmado.**

Capacidades reales:

```text
lectura
+ creación
+ edición básica
+ eliminación
+ notificación
```

Contrato incompleto:

```text
audiencia persistente
+ visibilidad
+ edición de audiencia
+ reenvío
+ archivo
+ historial
```

Destinos:

- nueva tarea `ANIMA-UX-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- `TREQ-ANIMA-001`;
- `TREQ-ANIMA-002`.

---

#### 6. PASS — historial de Saudo con atribución incompleta de sede

Archivo revisado:

```text
vento-pass/src/components/Saudo.tsx
```

La vista filtra transacciones por:

```text
metadata.site_id
```

Cuando una transacción no contiene ese campo:

```text
return false
```

Por tanto:

- la carga de transacciones es real;
- el historial se renderiza;
- el filtro por sede es real;
- pero una transacción legítima sin `metadata.site_id` desaparece silenciosamente.

No existe en este flujo una alternativa para:

- resolver la sede desde el beneficio;
- resolverla desde la orden;
- mostrar “sin atribución”;
- solicitar reconciliación;
- advertir al usuario que el historial está incompleto.

**Clasificación:** proceso de historial parcialmente implementado.

Destino exacto:

- `PASS-UX-006 — Diseñar historial`;
- `PASS-UX-009 — Diferenciar estado pendiente, usado y cancelado`;
- `PASS-QA-001 — Probar flujo completo de acumulación`;
- `PASS-QA-002 — Probar flujo completo de redención`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-PASS-003`.

No se crea un requisito nuevo porque la regla ya está registrada.

---

#### 7. NEXO — ajustes con cobertura parcial del catálogo elegible

Archivo revisado:

```text
vento-nexo/src/app/inventory/adjust/page.tsx
```

##### 7.1. Capacidad real confirmada

La pantalla:

- exige permiso;
- resuelve sedes;
- permite seleccionar LOC;
- consulta stock por sede, LOC y posición;
- carga productos controlados;
- presenta el formulario de ajuste.

##### 7.2. Corte de productos

La consulta inicial utiliza:

```text
.limit(500)
```

Después se recuperan productos omitidos únicamente cuando aparecen con cantidad positiva en:

- stock por sede;
- stock por LOC;
- stock por posición.

Este rescate evita perder productos con existencia positiva, pero no recupera necesariamente:

- productos activos elegibles con stock cero;
- productos nuevos;
- productos fuera de los primeros quinientos por orden alfabético;
- productos que deban ajustarse desde cero por conteo o corrección.

Por tanto, el proceso de ajuste es real, pero su selector puede conservar una cobertura parcial del catálogo.

##### 7.3. Clasificación

**Proceso parcial confirmado.**

Destino exacto:

- `NEXO-UX-019 — Diseñar flujo completo de ajustes`;
- `NEXO-UX-021 — Mostrar solo información necesaria según etapa`;
- `NEXO-UX-022 — Diseñar manejo de diferencias y excepciones`;
- `NEXO-UX-023 — Probar flujos en tablets y kioscos`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-NEXO-002`.

No se crea un requisito nuevo porque la regla ya está registrada.

---

#### 8. NEXO — impresión local sin ciclo durable del trabajo

Archivos revisados:

```text
vento-nexo/src/app/printing/jobs/page.tsx
vento-nexo/src/app/printing/jobs/_components/QueuePanel.tsx
```

##### 8.1. Capacidad real confirmada

El flujo:

- detecta impresoras con BrowserPrint;
- conecta un dispositivo;
- genera ZPL;
- prepara una cola;
- conserva texto de cola en `localStorage`;
- envía ZPL mediante `device.send`;
- informa callback de éxito o error.

Por tanto, sí existe impresión local real.

##### 8.2. Cola no durable

La “cola” es texto local del navegador.

No se encontró en este recorrido:

- identificador de trabajo;
- estado `pending`;
- estado `sending`;
- estado `sent`;
- estado `confirmed`;
- estado `failed`;
- número de intentos;
- propietario;
- dispositivo;
- plantilla usada;
- hash del ZPL;
- evidencia de impresión;
- reimpresión controlada;
- recuperación desde otra terminal.

##### 8.3. Eliminación anticipada

En modo de una columna:

```text
sendZpl(...)
setQueueText("")
```

En modo con layout:

```text
sendZpl(...)
setQueueText("")
```

La cola se limpia inmediatamente después de invocar el envío, no después de que el callback confirme éxito.

En modo `3-up`, las filas se retiran de la cola después de invocar el envío.

Esto permite el escenario:

```text
envío iniciado
→ cola retirada
→ callback de error
→ trabajo perdido de la cola visible
```

##### 8.4. Confirmación limitada

El mensaje:

```text
Impresión enviada
```

confirma que BrowserPrint aceptó el envío, pero no demuestra:

- que la impresora imprimió;
- que el papel estaba disponible;
- que la etiqueta fue legible;
- que el trabajo no se duplicó;
- que el operador recibió la salida correcta.

##### 8.5. Clasificación

**Proceso parcial confirmado.**

Destino exacto:

- `NEXO-UX-037 — Diseñar impresión de LOC, LPN, activo y documento`;
- `NEXO-UX-038 — Diseñar operación con escáner y etiquetas dañadas`;
- `NEXO-AUTH-028 — Proteger impresión y reimpresión mediante permisos atómicos`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-NEXO-003`;
- crea `TREQ-NEXO-005`.

---

#### 9. NEXO — remisiones operativas con publicación de inventario desactivable

Archivo principal revisado:

```text
vento-nexo/src/app/inventory/remissions/[id]/detail-actions.ts
```

##### 9.1. Capacidad real confirmada

El dominio contiene:

- solicitud;
- preparación;
- cantidades preparadas;
- cantidades despachadas;
- validaciones de presentación;
- ubicaciones;
- faltantes;
- tránsito;
- recepción;
- estados operativos;
- firmas de actor en acciones aplicables.

No es infraestructura vacía.

##### 9.2. Modo operativo sin inventario

La publicación de inventario depende de:

```text
remissions.inventory_posting_enabled
```

El fallback global es:

```text
false
```

También existen flags por ubicación:

```text
inventory_real_enabled
remissions_posting_enabled
```

cuyo valor predeterminado es falso.

Por tanto, el sistema puede conservar el flujo operativo y sus eventos sin que necesariamente exista el efecto final sobre inventario real.

Este modo corresponde al piloto actualmente conocido y no se clasifica por sí mismo como error.

##### 9.3. Brecha contractual

El proceso permanece parcial mientras no exista una distinción inequívoca entre:

```text
remisión operativa registrada
```

y:

```text
remisión con inventario publicado
```

También deberán definirse:

- puerta de activación;
- responsables;
- LOC habilitados;
- comportamiento mixto entre ubicaciones;
- reconciliación del período piloto;
- prevención de doble publicación;
- tratamiento de remisiones completadas antes de activar inventario;
- evidencia de qué movimiento fue emitido;
- reversión o corrección.

##### 9.4. Clasificación

**Proceso parcial e intencionalmente degradado.**

Destino exacto:

- `NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión`;
- `NEXO-UX-010 — Diseñar flujo completo de preparación`;
- `NEXO-UX-011 — Diseñar flujo completo de despacho`;
- `NEXO-UX-012 — Diseñar flujo completo de tránsito`;
- `NEXO-UX-013 — Diseñar flujo completo de recepción`;
- `NEXO-UX-022 — Diseñar manejo de diferencias y excepciones`;
- `NEXO-UX-023 — Probar flujos en tablets y kioscos`;
- `NEXO-UX-025 — Definir métricas de tiempo, error y capacitación para el piloto operativo`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-NEXO-006`.

---

#### 10. Dispositivos compartidos — creación completa, administración del ciclo de vida incompleta

Archivos y superficies revisadas:

```text
vento-viso/src/app/staff/shared-devices/new/page.tsx
vento-viso/src/app/staff/page.tsx
vento-nexo/src/lib/auth/shared-device-signature.ts
vento-shell/supabase/migrations/*shared_device*
```

##### 10.1. Capacidad real confirmada

VISO puede:

- seleccionar una plantilla;
- asignar sede;
- asignar área;
- seleccionar aplicaciones;
- definir aplicación principal;
- crear usuario técnico;
- generar contraseña temporal;
- crear el registro del dispositivo;
- copiar políticas de actor;
- registrar el evento `device.created`.

NEXO ya puede exigir firma de actor por PIN en acciones concretas.

Por tanto, el modelo no es solo infraestructura.

##### 10.2. Superficie administrativa parcial

En VISO se localizó la creación del dispositivo, pero no una superficie equivalente y completa para:

- listar todos los dispositivos;
- ver estado;
- editar sede o área;
- cambiar aplicaciones;
- cambiar plantilla;
- suspender;
- revocar;
- rotar contraseña;
- recuperar credenciales;
- transferir un dispositivo;
- consultar sesiones;
- cerrar sesiones;
- consultar eventos;
- marcar pérdida o daño;
- retirar físicamente una estación.

##### 10.3. Experiencia de actor parcial

El modelo técnico contempla firma por PIN, pero el ciclo final todavía requiere definir y probar:

- identificación inicial;
- cambio de trabajador;
- cierre explícito;
- expiración;
- trabajador sin turno;
- trabajador sin PIN;
- PIN bloqueado;
- contingencia;
- operación offline;
- estación sin periférico;
- revocación inmediata.

##### 10.4. Clasificación

**Proceso parcial confirmado.**

Destino exacto:

- `AUTH-DEV-011 — Permitir revocar un dispositivo`;
- `AUTH-DEV-012 — Manejar sesión expirada`;
- `AUTH-DEV-013 — Manejar cambio de trabajador`;
- `AUTH-DEV-014 — Probar tablets de NEXO`;
- `AUTH-DEV-015 — Probar terminales de PULSO`;
- `AUTH-DEV-016 — Probar pantallas de FOGO`;
- `UX-STATION-004 — Diseñar identificación, cambio y cierre de actor en estaciones compartidas`;
- `UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación`;
- `UX-STATION-008 — Prototipar alternativas con trabajadores reales`;
- `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`;
- `UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción`;
- `UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados`;
- `CODE-AUD-017`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-AUTH-003`.

---

#### 11. ORIGO — recepción con modos inventario y solo registro

Archivos revisados:

```text
vento-origo/src/app/receipts/new/page.tsx
vento-origo/src/components/vento/receipts/receipt-form.tsx
```

##### 11.1. Capacidad real confirmada

El proceso contiene:

- selección de proveedor;
- orden de compra opcional;
- recepción directa de emergencia;
- productos;
- presentaciones;
- cantidades;
- costos e impuestos;
- lote y vencimiento;
- LOC y posición;
- solicitud de maestro de datos;
- corrección;
- firma de actor en dispositivo compartido;
- modos `inventory` y `record_only`.

##### 11.2. Modo solo registro

El servidor resuelve:

```text
receipt_operation_mode
```

como:

```text
inventory
```

o:

```text
record_only
```

En modo solo registro, la compra puede conservar evidencia administrativa sin mover inventario.

Este modo puede ser válido durante transición, pero no equivale a una recepción completa de inventario.

##### 11.3. Brechas que permanecen

El proceso final deberá definir y demostrar:

- cuándo se permite `record_only`;
- quién puede seleccionarlo;
- cómo se muestra en listados;
- si puede convertirse posteriormente en entrada real;
- cómo se evita una segunda recepción manual en NEXO;
- cómo se tratan recepciones parciales;
- cómo se tratan diferencias contra la orden;
- cómo se actualizan cantidades recibidas;
- cómo se emite el evento financiero;
- cómo se corrige sin duplicar stock ni costo;
- cómo se concilia una compra registrada sin entrada de inventario.

##### 11.4. Clasificación

**Proceso parcial e intencionalmente dual.**

Destino exacto:

- `ORIGO-UX-001 — Inventariar el proceso completo de abastecimiento`;
- `ORIGO-UX-002 — Separar solicitud, compra, aprobación y recepción`;
- `ORIGO-UX-009 — Diseñar recepción total`;
- `ORIGO-UX-010 — Diseñar recepción parcial`;
- `ORIGO-UX-011 — Diseñar diferencias contra orden`;
- `ORIGO-UX-013 — Evitar repetir recepción manualmente en NEXO`;
- `ORIGO-UX-014 — Conectar recepción con entrada de inventario`;
- `ORIGO-UX-015 — Conectar compra con evento financiero`;
- `ORIGO-AUTH-006 — Definir permisos de aprobación`;
- `ORIGO-AUTH-007 — Definir permisos de recepción`;
- `ORIGO-AUTH-008 — Definir permisos de corrección`;
- `ORIGO-AUTH-011 — Registrar actor de recepción`;
- `ORIGO-AUTH-012 — Integrar contexto operativo donde aplique`;
- `CODE-AUD-017`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-ORIGO-001`.

---

#### 12. FOGO — registro real de lote sin ciclo operativo completo de producción

Archivos revisados:

```text
vento-fogo/src/app/production-batches/new/page.tsx
vento-fogo/src/app/production-batches/page.tsx
```

##### 12.1. Capacidad real confirmada

FOGO puede:

- seleccionar una receta publicada;
- resolver ruta productiva;
- capturar rendimiento;
- capturar consumo real;
- capturar empaques;
- capturar coproductos y subproductos;
- exigir LOC destino cuando corresponde;
- exigir firma de actor en estación compartida;
- invocar `fogo_create_real_production_batch`;
- listar lote, consumo, costos, empaque y destino.

Esto demuestra una mutación productiva real.

##### 12.2. Modelo de una sola acción

El flujo encontrado registra el lote real mediante una acción final.

En la superficie inspeccionada no se localizó un recorrido de usuario para:

- iniciar un lote;
- marcarlo en progreso;
- registrar producción parcial;
- pausar;
- reanudar;
- cambiar responsable;
- registrar desperdicio durante ejecución;
- bloquear por control de calidad;
- finalizar;
- cancelar;
- corregir mediante evento compensatorio.

La lista conoce etiquetas como:

```text
draft
posted
completed
cancelled
```

pero no se localizaron en `vento-fogo` acciones equivalentes que gestionen todo ese ciclo.

##### 12.3. Consecuencia

El proceso actual puede servir como:

```text
registro posterior de producción ejecutada
```

pero no demuestra todavía:

```text
gestión operativa del lote durante el turno
```

##### 12.4. Clasificación

**Proceso parcial confirmado.**

Destino exacto:

- `FOGO-AUTH-009 — Proteger inicio de producción`;
- `FOGO-AUTH-010 — Proteger producción parcial`;
- `FOGO-AUTH-011 — Proteger finalización`;
- `FOGO-AUTH-012 — Proteger correcciones y anulaciones`;
- `FOGO-AUTH-014 — Registrar actor y turno`;
- `FOGO-UX-001 — Inventariar procesos reales de producción`;
- `FOGO-UX-003 — Diseñar inicio por área productiva`;
- `FOGO-UX-004 — Mostrar producción pendiente del turno`;
- `FOGO-UX-005 — Diseñar inicio de lote`;
- `FOGO-UX-006 — Diseñar producción parcial`;
- `FOGO-UX-007 — Diseñar finalización de lote`;
- `FOGO-UX-010 — Registrar cantidades, desperdicio y resultado`;
- `FOGO-UX-011 — Diseñar correcciones sin alterar historial`;
- `FOGO-UX-012 — Conectar consumo de insumos con NEXO`;
- `FOGO-UX-013 — Conectar producto terminado con NEXO`;
- `CODE-AUD-017`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-FOGO-001`.

---

#### 13. Falsos positivos y exclusiones

##### 13.1. AURA

No es un proceso parcial.

Es una reserva sin producto y permanece en `CODE-AUD-011`.

##### 13.2. LPN

No es un proceso parcial alcanzable.

La infraestructura sin ciclo pertenece a `CODE-AUD-011`.

##### 13.3. POS interno completo de PULSO

No se reclasifica como parcial.

La fundación técnica sin recorrido de venta y caja completo pertenece a `CODE-AUD-011`.

##### 13.4. PASS movimientos y escaneo de mesa

Son acciones sin lógica completa detrás.

Permanecen en `CODE-AUD-010`.

##### 13.5. Newsletter pública

La interfaz no persiste una suscripción real.

Permanence en `CODE-AUD-010` y `WEB-FRM-011`.

##### 13.6. Corrección de marcaciones y pagos

No se encontró un proceso aprobado de corrección.

Permanecen como infraestructura de datos sin proceso en `CODE-AUD-011`.

##### 13.7. Código legacy

La existencia de rutas o estructuras antiguas no se resuelve aquí.

Continúa en:

```text
CODE-AUD-013
— Detectar código legacy todavía activo
```

##### 13.8. Artefactos sin consumidor

La falta de consumidor se profundizará en:

```text
CODE-AUD-015
— Detectar rutas, componentes, funciones y tablas sin consumidores
```

---

#### 14. Matriz por repositorio

| Repositorio     | Resultado de CODE-AUD-012                                                                                     | Clasificación                  |
| --------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| `vento-shell`   | soporta contratos y persistencia de varios procesos parciales; no se detecta una nueva superficie propia      | infraestructura transversal    |
| `vento-viso`    | creación de dispositivo compartido real, sin ciclo administrativo completo                                    | proceso parcial                |
| `vento-nexo`    | ajustes, impresión y remisiones tienen recorridos reales con brechas de cobertura, confirmación e integración | procesos parciales confirmados |
| `vento-fogo`    | registro real de lote, pero sin ciclo operativo completo de inicio, parcialidad, finalización y corrección    | proceso parcial                |
| `vento-origo`   | recepción real con modos inventario y solo registro; integración final todavía condicionada                   | proceso parcial                |
| `vento-pulso`   | salón y llamados tienen lógica; POS integral sigue clasificado en CODE-AUD-011                                | sin nuevo hallazgo parcial     |
| `vento-numera`  | no se confirma una nueva brecha parcial durante este corte                                                    | continuar en CODE-AUD-019      |
| `Vento-Group`   | newsletter pertenece a interfaz sin lógica completa                                                           | excluido                       |
| `vento-anima`   | novedades tienen CRUD y notificación, pero audiencia y ciclo editorial están incompletos                      | proceso parcial                |
| `vento-pass`    | historial de Saudo omite transacciones sin atribución de sede                                                 | proceso parcial                |
| `vento-talento` | producto no desplegado                                                                                        | excluido                       |
| `vento-vital`   | proyecto separado                                                                                             | fuera de Vento OS              |
| AURA            | reserva sin aplicación                                                                                        | excluido                       |

---

#### 15. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                             | Destino                                                                  |
| ---------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `H-CODE-012-001` | ANIMA crea y notifica novedades, pero no persiste ni aplica audiencia de lectura                     | `ANIMA-UX-017`, `CODE-AUD-019`, `020`, `TREQ-ANIMA-001`                  |
| `H-CODE-012-002` | ANIMA no recupera audiencia al editar ni define reenvío                                              | `ANIMA-UX-017`, `TREQ-ANIMA-001`                                         |
| `H-CODE-012-003` | ANIMA elimina físicamente y no demuestra archivo o historial editorial                               | `ANIMA-UX-017`, `CODE-AUD-019`, `020`                                    |
| `H-CODE-012-004` | ANIMA fallback permite lectura, pero rechaza mutaciones                                              | `TREQ-ANIMA-002`, `CODE-AUD-020`                                         |
| `H-CODE-012-005` | PASS excluye silenciosamente transacciones de Saudo sin `metadata.site_id`                           | `PASS-UX-006`, `PASS-QA-001`, `002`, `TREQ-PASS-003`                     |
| `H-CODE-012-006` | NEXO ajustes corta el catálogo inicial a 500 y solo rescata omitidos con stock positivo              | `NEXO-UX-019`, `021`, `022`, `023`, `TREQ-NEXO-002`                      |
| `H-CODE-012-007` | la cola de impresión NEXO es estado local, no un trabajo durable                                     | `NEXO-UX-037`, `038`, `CODE-AUD-018`, `019`, `020`, `TREQ-NEXO-005`      |
| `H-CODE-012-008` | NEXO limpia elementos de impresión antes del callback definitivo                                     | mismo destino de `H-CODE-012-007`                                        |
| `H-CODE-012-009` | una remisión puede avanzar operativamente sin publicar inventario real                               | `NEXO-UX-009` a `013`, `022`, `023`, `025`, `TREQ-NEXO-006`              |
| `H-CODE-012-010` | no está cerrado el contrato de activación y reconciliación del piloto de remisiones                  | mismo destino de `H-CODE-012-009`                                        |
| `H-CODE-012-011` | VISO crea dispositivos compartidos, pero no demuestra administración completa posterior              | `AUTH-DEV-011` a `016`, `UX-STATION-004`, `007` a `012`, `TREQ-AUTH-003` |
| `H-CODE-012-012` | ORIGO permite `record_only` e `inventory` sin que el cierre integral de abastecimiento esté definido | `ORIGO-UX-001`, `002`, `009` a `015`, `TREQ-ORIGO-001`                   |
| `H-CODE-012-013` | FOGO registra un lote real en una acción final, pero no gestiona el ciclo durante el turno           | `FOGO-AUTH-009` a `014`, `FOGO-UX-001`, `003` a `013`, `TREQ-FOGO-001`   |
| `H-CODE-012-014` | las etiquetas de estado de lote no equivalen a transiciones operativas alcanzables                   | mismo destino de `H-CODE-012-013`                                        |
| `H-CODE-012-015` | no todo modo parcial es un defecto; deberá quedar identificado y no confundirse con operación final  | `PROC-CAT-002`, `CODE-AUD-019`, `020`                                    |

Todos los hallazgos quedan cerrados, reutilizan una tarea existente o generan una tarea explícita.

---

#### 16. Nueva tarea propuesta

No existe una tarea funcional exacta para el ciclo de novedades internas de ANIMA.

Se propone agregar en:

```text
docs/plan-canonico/modular/bloques/F_ANIMA/00_BLOQUE_F.md
```

inmediatamente después de:

```md
### [ ] ANIMA-UX-016 — Auditar y completar recordatorios operativos de inicio y cierre de turno
```

la línea completa:

```md
### [ ] ANIMA-UX-017 — Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad
```

Esta tarea deberá definir:

- audiencia de notificación;
- audiencia de lectura;
- publicación global o segmentada;
- persistencia;
- edición;
- reenvío;
- archivo;
- vigencia;
- historial;
- permisos;
- evidencia;
- comportamiento fallback.

No se crea ninguna otra tarea nueva.

---

#### 17. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 17.1. Requisitos reutilizados

- `TREQ-ANIMA-001`;
- `TREQ-ANIMA-002`;
- `TREQ-PASS-003`;
- `TREQ-NEXO-002`;
- `TREQ-NEXO-003`;
- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`.

No se cambia su estado durante esta tarea.

##### 17.2. Requisitos nuevos

###### `TREQ-NEXO-005`

Un trabajo de impresión no podrá retirarse definitivamente de la cola antes de recibir el resultado del envío; deberá poder conservar estado, error, reintento, dispositivo, contenido e identificación suficientes para evitar pérdida o duplicación.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-NEXO-006`

Toda remisión deberá indicar de forma verificable si fue únicamente registrada de manera operativa o si publicó movimientos reales de inventario; la activación, mezcla por LOC, reconciliación y reintento no podrán producir doble contabilización.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-AUTH-003`

Todo dispositivo compartido deberá tener un ciclo auditable de creación, activación, uso, cambio de actor, expiración, suspensión, revocación, rotación de credenciales y retiro, sin conservar acceso después de quedar inactivo.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-ORIGO-001`

Toda recepción deberá declarar si mueve inventario o si es solo registro, conservar esa modalidad de forma visible y auditable, y evitar que su conversión, corrección o repetición duplique cantidades, costos, orden recibida o evento financiero.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-FOGO-001`

Todo lote productivo deberá demostrar el ciclo aprobado de inicio, producción parcial, consumo, desperdicio, resultado, finalización, cancelación o corrección, con actor, turno, cantidades y efectos de inventario auditables.

**Estado inicial propuesto:** `IDENTIFICADO`.

Las filas canónicas completas se agregarán únicamente en:

```text
04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

después de la aprobación de `CODE-AUD-012`.

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 18. Decisiones propuestas

1. Un proceso parcial deberá ejecutar al menos un efecto real.
2. Una interfaz sin efecto continuará en `CODE-AUD-010`.
3. Infraestructura sin recorrido continuará en `CODE-AUD-011`.
4. ANIMA novedades se declara proceso parcial.
5. Audiencia de notificación y audiencia de lectura no se presumirán equivalentes.
6. La eliminación física de novedades deberá someterse a decisión funcional.
7. Se crea `ANIMA-UX-017`.
8. PASS Saudo mantiene `TREQ-PASS-003`.
9. NEXO ajustes mantiene `TREQ-NEXO-002`.
10. Impresión NEXO se reconoce como funcional, pero no durable.
11. Se deriva `TREQ-NEXO-005`.
12. El piloto de remisiones no se considera un defecto por estar desactivado el inventario.
13. El modo operativo de remisiones no podrá confundirse con inventario publicado.
14. Se deriva `TREQ-NEXO-006`.
15. Dispositivos compartidos se reconocen como proceso parcial, no como infraestructura vacía.
16. Se deriva `TREQ-AUTH-003`.
17. ORIGO `record_only` se reconoce como modalidad transitoria o específica, no como recepción completa de inventario.
18. Se deriva `TREQ-ORIGO-001`.
19. FOGO tiene registro productivo real, pero no ciclo operativo completo.
20. Se deriva `TREQ-FOGO-001`.
21. No se crea ninguna tarea adicional fuera de `ANIMA-UX-017`.
22. No se modifican estados de requisitos existentes.
23. No se modifica código.
24. No se modifica Supabase.
25. `CODE-AUD-013` será la única continuidad inmediata.

---

#### 19. Límites de certeza

Esta tarea no confirma:

- que ninguna otra rama contenga administración adicional de dispositivos;
- que BrowserPrint nunca confirme impresión física mediante capacidades no inspeccionadas;
- que todas las remisiones actuales operen con inventario desactivado;
- que todos los LOC tengan flags desactivados;
- que `record_only` de ORIGO deba eliminarse;
- que toda recepción deba mover inventario;
- que FOGO deba adoptar obligatoriamente estados largos para todas las áreas;
- que toda novedad de ANIMA deba tener audiencia segmentada;
- que una eliminación física esté siempre prohibida;
- que ninguna integración externa complete los procesos observados;
- que todos los procesos parciales existentes hayan sido detectados.

Las tareas siguientes deberán profundizar:

- `CODE-AUD-013`: código legacy activo;
- `CODE-AUD-015`: artefactos sin consumidor;
- `CODE-AUD-017`: autorización y seguridad;
- `CODE-AUD-018`: offline, reintentos, concurrencia e idempotencia;
- `CODE-AUD-019`: vínculo entre capacidad e implementación verificable;
- `CODE-AUD-020`: backlog técnico y funcional.

---

#### 20. Criterios de aceptación

`CODE-AUD-012` podrá aprobarse cuando:

- exista una definición verificable de proceso parcial;
- se diferencie de interfaz ficticia e infraestructura aislada;
- ANIMA novedades quede evaluado;
- PASS historial quede evaluado;
- NEXO ajustes quede evaluado;
- NEXO impresión quede evaluado;
- NEXO remisiones quede evaluado;
- dispositivos compartidos queden evaluados;
- ORIGO recepción quede evaluado;
- FOGO producción quede evaluado;
- cada hallazgo tenga destino exacto;
- la única tarea nueva sea `ANIMA-UX-017`;
- los requisitos reutilizados estén identificados;
- los cinco requisitos nuevos estén identificados;
- las filas completas no se dupliquen dentro de esta tarea;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-013` permanezca como continuidad inmediata.

---

#### 21. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
recorrido real
→ etapa disponible
→ etapa ausente o degradada
→ riesgo
→ tarea funcional
→ requisito de prueba
→ paquete posterior
```

La continuidad será:

```text
CODE-AUD-013
— Detectar código legacy todavía activo
```


### ✅ CODE-AUD-013 — Detectar código legacy todavía activo

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de código, contratos, aliases, fallbacks y estructuras heredadas que todavía participan en ejecución real  
**Dependencia anterior:** `CODE-AUD-012`  
**Continuidad reservada:** `CODE-AUD-014`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea identifica elementos legacy que todavía intervienen en:

- renderizado;
- navegación;
- autorización;
- persistencia;
- resolución de contexto;
- selección de datos;
- transición de estados;
- contratos entre aplicaciones;
- compatibilidad con filas antiguas;
- ejecución de procesos actuales.

La clasificación no depende del nombre del archivo ni de que el código contenga la palabra `legacy`.

Un elemento se considera **legacy todavía activo** cuando:

```text
fue reemplazado, superado o declarado transitorio
        +
todavía es consumido durante la ejecución actual
```

Resultado general:

- PULSO continúa montando su tablero operativo actual sobre `orders-board-legacy`;
- PULSO acepta simultáneamente dos nombres para un mismo estado de tránsito;
- NEXO mantiene fallbacks activos para esquemas antiguos de configuración de producto por sede;
- NEXO deriva comportamiento operativo desde roles, nombres de sede y conjuntos hardcodeados cuando faltan contratos canónicos;
- NEXO permite operar productos sin perfil canónico y les asigna semántica predeterminada;
- NEXO conserva compatibilidad explícita con productos sin SKU;
- VISO y PASS mantienen `logo_url` como contrato heredado junto a `card_logo_url` y `header_logo_url`;
- VISO conserva un tipo de carga `legacy`;
- el sistema de simulación mediante role override sigue activo y distribuido en varias aplicaciones;
- migraciones históricas, scripts no invocados y etiquetas textuales no se consideran automáticamente legado activo;
- no se crea ninguna tarea nueva del roadmap;
- se derivan cinco requisitos de prueba;
- no se modifica código ni Supabase.

---

#### 2. Definiciones utilizadas

##### 2.1. Código legacy activo

Código antiguo o transitorio que todavía es alcanzado por el recorrido actual.

Ejemplos:

- componente nuevo que importa y renderiza un componente `legacy`;
- wrapper que delega la mayor parte de la operación a una implementación antigua;
- columna antigua que todavía se escribe y consulta;
- alias de estado aceptado en producción;
- fallback que sustituye columnas o tablas canónicas ausentes;
- lógica basada en nombres que reemplaza temporalmente un catálogo;
- datos sin migrar que reciben supuestos automáticos.

##### 2.2. Compatibilidad temporal válida

Puente explícito que:

- tiene propietario;
- tiene consumidores conocidos;
- está limitado;
- preserva comportamiento;
- produce evidencia cuando se activa;
- tiene pruebas de paridad;
- posee criterio y momento de retiro.

No todo puente temporal es un defecto.

##### 2.3. Legado dormido

Código que permanece en el repositorio, pero no tiene consumidor o entrada alcanzable confirmada.

Corresponde principalmente a:

```text
CODE-AUD-015
— Detectar rutas, componentes, funciones y tablas sin consumidores
```

##### 2.4. Código histórico

No se considera legado activo por sí solo:

- migraciones ya ejecutadas;
- documentos históricos;
- changelogs;
- commits;
- fixtures;
- scripts de migración no conectados con build o runtime;
- copias archivadas no importadas.

##### 2.5. Alias de compatibilidad

Nombre antiguo aceptado junto con el nombre actual.

Ejemplos:

```text
on_the_way
in_transit
```

o:

```text
received
closed
```

El alias puede ser necesario durante una transición, pero no debe permanecer indefinidamente sin contrato.

---

#### 3. Criterios de clasificación

Para declarar un hallazgo se verificó al menos una de estas condiciones:

1. existe importación desde una ruta activa;
2. existe invocación desde una pantalla o acción actual;
3. una columna legacy todavía se escribe;
4. una columna legacy todavía se usa como fallback;
5. el código acepta dos contratos equivalentes;
6. un error de esquema activa una rama heredada;
7. faltan datos canónicos y el sistema aplica supuestos;
8. una regla basada en nombre o rol sustituye una fuente canónica;
9. la compatibilidad no tiene criterio de retiro visible;
10. el elemento puede alterar resultados actuales.

No se declara brecha únicamente porque:

- el archivo contiene `legacy` en su nombre;
- existe una migración de limpieza;
- una dependencia externa está marcada deprecated;
- un mensaje de interfaz dice “producto legacy”;
- existe un fallback visual inocuo;
- la compatibilidad está aprobada y acotada;
- el código pertenece a una versión antigua, pero no es consumido.

---

#### 4. PULSO — el tablero actual depende directamente de `orders-board-legacy`

Archivos revisados:

```text
vento-pulso/src/app/orders/orders-board.tsx
vento-pulso/src/app/orders/orders-board-live.tsx
vento-pulso/src/app/orders/orders-board-legacy.tsx
vento-pulso/src/app/orders/page.tsx
```

##### 4.1. Dependencia runtime confirmada

El componente actual:

```text
orders-board.tsx
```

importa:

```ts
import { OrdersBoard as BaseOrdersBoard } from "./orders-board-legacy";
```

Después agrega comportamiento de regalos y finalmente renderiza:

```tsx
<BaseOrdersBoard {...props} orders={orders} />
```

Por tanto:

```text
OrdersBoardLive
        ↓
OrdersBoard actual
        ↓
OrdersBoard legacy
```

El archivo `orders-board-legacy.tsx` no es una copia dormida. Continúa siendo la base visual y funcional del tablero activo.

##### 4.2. Responsabilidades todavía concentradas en la base legacy

La implementación heredada conserva contratos y comportamiento para:

- tarjetas de pedido;
- modal;
- pestañas de pedido, chat e historial;
- facturación;
- mensajes;
- eventos;
- estados;
- despacho;
- acciones operativas.

Las mejoras actuales se montan alrededor de ella mediante wrappers.

Riesgos:

- cambiar el wrapper no elimina la dependencia legacy;
- la lógica puede repartirse entre tres capas;
- tipos y estados pueden divergir;
- una corrección puede aplicarse en la capa equivocada;
- retirar el archivo sin mapa de paridad puede romper chat, historial o facturación;
- el nombre “legacy” puede hacer que se subestime que sigue siendo producción.

##### 4.3. Scripts históricos de parche

Persisten scripts que fueron utilizados para redirigir modificaciones hacia el tablero legacy.

Sin embargo, el `package.json` actual no contiene hooks `predev` o `prebuild` que demuestren su ejecución automática.

Clasificación:

```text
orders-board-legacy.tsx
→ legacy activo confirmado

scripts de parche
→ artefactos sin activación actual confirmada
→ CODE-AUD-015
```

##### 4.4. Destino

- `PULSO-AUTH-002 — Inventariar órdenes`;
- `PULSO-UX-001 — Inventariar procesos de venta, caja y salón`;
- `PULSO-UX-007 — Simplificar creación de venta`;
- `PULSO-UX-013 — Diseñar confirmaciones para acciones sensibles`;
- `PULSO-UX-019 — Validar el prototipo con caja, salón, barra, cocina y mostrador`;
- `SHELL-AUD-001 — Buscar código duplicado entre repositorios`;
- `SHELL-PKG-004 — Definir política de compatibilidad`;
- `SHELL-PKG-005 — Definir política de deprecación`;
- `CODE-AUD-014`;
- `CODE-AUD-015`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se autoriza reemplazar el tablero antes de levantar una matriz de paridad.

---

#### 5. PULSO — vocabulario doble de estados de tránsito

En las superficies actuales se aceptan:

```text
in_transit
on_the_way
```

Ambos se muestran como:

```text
En camino
```

y ambos permiten avanzar a:

```text
delivered
```

Esto constituye un alias de compatibilidad activo.

No se determina todavía cuál debe ser el nombre final.

La decisión deberá establecer:

- estado canónico;
- consumidores de cada alias;
- datos existentes;
- eventos emitidos;
- filtros;
- Realtime;
- integraciones;
- backfill;
- ventana de compatibilidad;
- criterio de retiro.

Riesgos:

- órdenes excluidas por filtros;
- transiciones distintas para el mismo significado;
- métricas divididas;
- eventos incompatibles;
- consultas que contemplan solo uno de los valores;
- aliases que se vuelven permanentes.

Destino:

- `PULSO-UX-001`;
- `SHELL-CON-010 — Centralizar estados de procesos`;
- `SUPA-AUD-018`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-001`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-006`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `SUPA-TRANS-013`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 6. NEXO — fallback de configuración antigua de producto por sede

Archivo principal:

```text
vento-nexo/src/app/inventory/remissions/page-helpers.ts
```

##### 6.1. Consulta canónica intentada

La primera consulta solicita:

```text
product_id
is_active
default_area_kind
area_kinds
remission_category_id
audience
remission_enabled
updated_at
created_at
```

##### 6.2. Rama legacy activa

Cuando esa consulta produce error, el código ejecuta otra consulta sin:

```text
audience
remission_enabled
```

Después completa artificialmente:

```ts
audience: null
remission_enabled: null
```

La compatibilidad puede permitir operar contra un esquema o despliegue desactualizado.

Pero actualmente:

- el fallback se activa por cualquier error de la primera consulta;
- no distingue columna ausente de error de permisos, red o consulta;
- no produce evidencia visible;
- no declara ambiente;
- no tiene fecha de retiro;
- puede degradar silenciosamente reglas de audiencia o habilitación.

Consecuencia:

```text
error de consulta moderna
        ↓
modelo antiguo asumido
        ↓
operación continúa con semántica reducida
```

**Clasificación:** puente legacy activo sin observabilidad suficiente.

Destinos:

- `SUPA-AUD-016 — Comparar Supabase remoto con migraciones y configuración de vento-shell`;
- `SUPA-AUD-017 — Detectar drift, cambios manuales y objetos sin migración`;
- `SUPA-AUD-018 — Identificar tablas, columnas, funciones y políticas legacy`;
- `SUPA-AUD-019 — Detectar duplicidades, datos huérfanos y fuentes de verdad competidoras`;
- `SUPA-TRANS-003 — Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos`;
- `SUPA-TRANS-005 — Definir backfills y correcciones de calidad de datos`;
- `SUPA-TRANS-006 — Definir vistas, wrappers o aliases temporales de compatibilidad`;
- `SUPA-TRANS-007 — Definir adaptación coordinada de consumidores`;
- `SUPA-TRANS-012 — Definir retiro progresivo de objetos legacy`;
- `SUPA-TRANS-013 — Definir verificación de paridad local, staging y producción`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 7. NEXO — alcance de remisiones derivado desde roles y fallbacks hardcodeados

El flujo actual contiene reglas de compatibilidad como:

```text
cajero
→ cajero / mostrador

barista
→ bar / barra

cocinero
→ cocina
```

Además, cuando falla la consulta del catálogo `area_kinds`, utiliza:

```text
cajero
mostrador
bar
barra
cocina
```

como conjunto permitido para remisiones.

Esta lógica sigue activa dentro de la resolución de área.

No se trata únicamente de un valor hardcodeado. Es una segunda fuente de verdad que puede sustituir:

- roles operativos;
- áreas activas;
- catálogo de tipos de área;
- reglas por sede;
- capacidades configuradas.

Riesgos:

- un rol nuevo no recibe área;
- una sede con códigos distintos opera incorrectamente;
- una falla de catálogo cambia silenciosamente autorización o alcance;
- el rol base se usa como proxy del contexto operativo;
- la compatibilidad evita detectar una configuración incompleta.

Destino:

- `PROC-ACTOR-002 — Vincular cada proceso con roles operativos aplicables`;
- `PROC-ACTOR-010 — Prohibir autorización derivada únicamente del nombre del rol`;
- `NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión`;
- `NEXO-UX-021 — Mostrar solo información necesaria según etapa`;
- `NEXO-AUTH-029 — Eliminar dependencia de permisos amplios legacy`;
- `AUTH-DEV-*` cuando aplique a estaciones;
- `CODE-AUD-014`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-AUTH-001`.

---

#### 8. NEXO — aliases de estado de remisión todavía aceptados

La presentación actual reconoce, entre otros:

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

Los valores:

```text
received
closed
```

se muestran ambos como:

```text
Recibida
```

y la matriz de acciones acepta ambos para reversión.

Esto indica que dos estados con significado potencialmente distinto o sucesivo continúan tratados como equivalentes en ciertas superficies.

La tarea no declara que uno deba eliminarse inmediatamente.

Debe definirse:

- si `received` es recepción física;
- si `closed` es cierre administrativo;
- si son sinónimos históricos;
- qué transiciones existen;
- cuál consume inventario;
- cuál habilita reversión;
- cuál es final;
- cómo se migran registros existentes.

Destino:

- `NEXO-UX-009` a `NEXO-UX-013`;
- `PROC-CAT-009` a `PROC-CAT-014`;
- `SHELL-CON-010`;
- `SUPA-AUD-018`;
- `SUPA-TRANS-001`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-006`;
- `SUPA-TRANS-012`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 9. NEXO — productos sin perfil canónico reciben semántica predeterminada

En creación de remisiones se consulta primero:

```text
product_inventory_profiles
```

Cuando un producto no aparece allí, el flujo lo recupera desde:

```text
products
```

y le asigna:

```text
inventory_kind: null
measurement_mode: fixed_presentation
default_tolerance_percent: null
requires_actual_dispatch_qty: false
requires_count_alongside_weight: false
```

Esto mantiene utilizables productos antiguos sin perfil.

Sin embargo, el fallback no es neutro.

Define comportamiento operativo:

- modalidad de medición;
- captura de cantidad;
- tolerancia;
- conteo;
- despacho real.

Un producto sin perfil puede comportarse como presentación fija aunque su naturaleza real sea:

- peso variable;
- conteo con peso;
- volumen;
- lote;
- empaque;
- producto producido.

**Clasificación:** compatibilidad de datos legacy activa con riesgo semántico.

Destino:

- `CAP-SCOPE-004 — Evaluar catálogo, productos, presentaciones, unidades, menús y recetas`;
- `CAP-SCOPE-006 — Evaluar inventario, lotes, vencimientos, LOC y LPN`;
- `NEXO-DOM-001 — Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 10. NEXO — productos legacy sin SKU continúan soportados

El componente:

```text
vento-nexo/src/components/inventory/SkuField.tsx
```

muestra expresamente:

```text
Sin SKU (legacy)
Producto legacy sin SKU
```

y permite:

- conservar el registro sin SKU;
- editar el SKU manualmente;
- asignar SKU automático si queda vacío.

La compatibilidad es razonable durante saneamiento del catálogo.

El riesgo aparece si no existe:

- inventario completo de registros afectados;
- regla de unicidad;
- prioridad de backfill;
- bloqueo para nuevos productos sin SKU;
- distinción entre identificador visible y clave técnica;
- verificación de consumidores que usan SKU;
- criterio de retiro de la compatibilidad.

**Clasificación:** datos legacy activos, con mecanismo de regularización parcial.

Destino:

- `CAP-SCOPE-004`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `DATA-NORM-AUD-004 — Detectar duplicados semánticos mediante valores normalizados de comparación`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 11. NEXO — clasificación de sede inferida desde nombre cuando falta contrato

El editor de configuración de producto intenta utilizar:

```text
site_type
```

y capacidades de sede.

Cuando faltan, puede inferir:

```text
nombre contiene "centro de producción"
→ production_center

cualquier otro nombre
→ satellite
```

La misma inferencia influye en qué sedes aparecen como productivas o satélites cuando no existe registro de capacidades.

Esto es un puente de compatibilidad activo con modelos anteriores de sede.

Riesgos:

- un cambio de nombre altera comportamiento;
- una sede administrativa puede clasificarse como satélite;
- una nueva sede productiva queda fuera;
- una traducción o variación ortográfica rompe la inferencia;
- la ausencia de capacidades queda oculta;
- el nombre visible se convierte en regla empresarial.

Destino:

- `CAP-SCOPE-001 — Evaluar gobierno, empresas, sedes y organización`;
- `PROC-CAT-005 — Definir aplicación propietaria de cada proceso`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 12. VISO y PASS — `logo_url` continúa como contrato heredado activo

Archivos revisados:

```text
vento-viso/src/components/viso/business-form.tsx
vento-viso/src/app/businesses/[id]/page.tsx
vento-viso/src/app/api/viso/upload-logo/route.ts
vento-pass/src/utils/satelliteLogos.ts
```

##### 12.1. Modelo actual

El modelo nuevo contiene:

```text
card_logo_url
header_logo_url
```

pero conserva:

```text
logo_url
```

##### 12.2. Escritura legacy confirmada

VISO:

- inicializa card y header desde `logo_url`;
- calcula un `legacyLogo`;
- envía `logo_url` como campo oculto;
- guarda simultáneamente las tres columnas;
- muestra diagnóstico “Legacy logo URL”.

##### 12.3. Lectura legacy confirmada

PASS elige:

```text
card_logo_url
→ fallback logo_url
```

o:

```text
header_logo_url
→ fallback logo_url
```

Por tanto, `logo_url` todavía forma parte del contrato de ejecución y no es una columna histórica pasiva.

##### 12.4. Carga legacy

El endpoint de VISO acepta:

```text
kind = legacy
```

como valor predeterminado cuando no recibe `card` o `header`.

Esto permite generar nuevos objetos legacy.

##### 12.5. Evaluación

La compatibilidad evita romper satélites sin logos separados.

Pero falta definir:

- backfill de card y header;
- precedencia definitiva;
- consumidores;
- prohibición de nuevas escrituras legacy;
- tratamiento de satélites antiguos;
- prueba visual de paridad;
- retiro de `kind=legacy`;
- retiro futuro de la columna.

Destino:

- `VISO-UX-017 — Evitar duplicar configuración propia de otras aplicaciones`;
- `VISO-UX-018 — Enlazar a la aplicación propietaria cuando corresponda`;
- `PASS-UX-001 — Inventariar pantallas actuales de cliente`;
- `SUPA-AUD-018`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-006`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `SUPA-TRANS-013`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-PASS-004`.

---

#### 13. Role override — puente activo de simulación distribuido

Se localizaron implementaciones de:

```text
checkPermissionWithRoleOverride
```

en varias aplicaciones.

La función de NEXO:

- lee un rol simulado desde cookie;
- consulta permisos de `role_permissions`;
- resuelve alcance;
- sustituye estrictamente el rol efectivo durante simulación;
- contiene una excepción especial para conductor en tránsito.

No se clasifica el role override como defecto por existir.

El plan ya aprobó una simulación separada.

La brecha es de transición y distribución:

- la implementación está copiada entre repositorios;
- puede divergir;
- combina simulación con excepciones operativas;
- consulta contratos legacy de permisos;
- el comportamiento depende de cada copia;
- no existe todavía paquete compartido aprobado.

Destino:

- `SHELL-AUD-005 — Comparar role override`;
- `SHELL-AUD-003 — Comparar helpers de permisos`;
- `SHELL-PKG-004 — Definir política de compatibilidad`;
- `SHELL-PKG-005 — Definir política de deprecación`;
- `SHELL-CON-003 — Centralizar códigos de permisos`;
- `SHELL-CON-007 — Centralizar tipos de contexto`;
- `CODE-AUD-014`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-AUTH-001`;
- mantiene `TREQ-AUTH-002`.

---

#### 14. Artefactos excluidos como falsos positivos

##### 14.1. Migraciones históricas

Archivos con nombres como:

```text
cleanup_legacy
drop_legacy
deactivate_legacy
```

no son código runtime por el solo hecho de permanecer en:

```text
supabase/migrations
```

Deben conservarse como historial reproducible.

E3 verificará el estado final de los objetos, no eliminará migraciones aplicadas.

##### 14.2. Scripts de parche no conectados

Los scripts de PULSO que apuntaron al tablero legacy no aparecen en los scripts actuales de `package.json`.

Se reservan para `CODE-AUD-015`.

##### 14.3. Dependencias deprecated del lockfile

Una advertencia de paquete no demuestra lógica empresarial legacy.

Corresponde a build y dependencias:

```text
CODE-AUD-016
```

##### 14.4. Valores de dominio antiguos no declarados obsoletos

Códigos como:

```text
preparacion
venta
```

no se consideran legacy sin una decisión canónica que los reemplace.

##### 14.5. Modo `record_only`

El modo de ORIGO fue clasificado como proceso parcial en `CODE-AUD-012`.

No se reclasifica como legacy únicamente por ser transitorio.

##### 14.6. Código sin consumidor

Aunque un archivo parezca antiguo, si no se confirma importación o ruta activa deberá resolverse en `CODE-AUD-015`.

---

#### 15. Matriz por repositorio

| Repositorio     | Legado activo confirmado                                                                                                     | Clasificación                   |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `vento-shell`   | objetos legacy deberán verificarse en E3; migraciones históricas se excluyen como runtime                                    | pendiente de auditoría de datos |
| `vento-viso`    | escritura de `logo_url`, fallback de logos y carga `legacy`; role override distribuido                                       | compatibilidad activa           |
| `vento-nexo`    | columnas opcionales con fallback, áreas por rol, aliases de estado, productos sin perfil/SKU, sedes inferidas, role override | legado activo transversal       |
| `vento-fogo`    | role override distribuido; no se confirma otro legado funcional específico                                                   | compatibilidad compartida       |
| `vento-origo`   | role override distribuido; no se confirma otro legado funcional específico                                                   | compatibilidad compartida       |
| `vento-pulso`   | tablero legacy en la cadena runtime y aliases de estado                                                                      | legado activo crítico           |
| `vento-numera`  | no se confirma legado activo específico en este corte                                                                        | sin cierre de integridad        |
| `Vento-Group`   | no se confirma legado activo específico en este corte                                                                        | sin cierre de integridad        |
| `vento-anima`   | no se confirma legado activo específico en este corte                                                                        | sin cierre de integridad        |
| `vento-pass`    | lectura de `logo_url` como fallback activo                                                                                   | compatibilidad activa           |
| `vento-talento` | no se confirma legado activo específico; producto futuro                                                                     | fuera de producción             |
| `vento-vital`   | proyecto separado                                                                                                            | fuera de Vento OS               |

“Sin legado activo específico confirmado” no equivale a certificación de ausencia.

---

#### 16. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                         | Clasificación                  | Destino                                                                                    |
| ---------------- | ------------------------------------------------------------------------------------------------ | ------------------------------ | ------------------------------------------------------------------------------------------ |
| `H-CODE-013-001` | el tablero actual de órdenes PULSO importa y renderiza `orders-board-legacy`                     | dependencia runtime legacy     | `PULSO-AUTH-002`, `PULSO-UX-001`, `007`, `013`, `019`, `CODE-AUD-014`, `015`, `019`, `020` |
| `H-CODE-013-002` | la funcionalidad del tablero queda distribuida entre live, wrapper actual y base legacy          | transición sin consolidar      | `SHELL-AUD-001`, `SHELL-PKG-004`, `005`, `CODE-AUD-014`                                    |
| `H-CODE-013-003` | PULSO acepta `in_transit` y `on_the_way` para el mismo estado visible                            | alias activo                   | `SHELL-CON-010`, `SUPA-TRANS-*`, `CODE-AUD-014`, `019`, `020`                              |
| `H-CODE-013-004` | scripts históricos apuntan al tablero legacy, pero no se prueba ejecución actual                 | posible artefacto huérfano     | `CODE-AUD-015`                                                                             |
| `H-CODE-013-005` | NEXO cambia a una consulta antigua cuando falla la consulta con `audience` y `remission_enabled` | fallback legacy activo         | `SUPA-AUD-016` a `019`, `SUPA-TRANS-003`, `005` a `007`, `012`, `013`                      |
| `H-CODE-013-006` | NEXO deriva áreas de remisión desde nombres de rol y listas hardcodeadas                         | fuente de verdad legacy        | `PROC-ACTOR-002`, `010`, `NEXO-AUTH-029`, `CODE-AUD-014`, `017`, `019`, `020`              |
| `H-CODE-013-007` | NEXO trata `received` y `closed` como equivalentes en superficies operativas                     | alias de estados               | `PROC-CAT-009` a `014`, `SHELL-CON-010`, `SUPA-TRANS-*`                                    |
| `H-CODE-013-008` | productos sin perfil reciben supuestos operativos predeterminados                                | compatibilidad de datos legacy | `CAP-SCOPE-004`, `006`, `SUPA-TRANS-005`, `007`, `012`, `CODE-AUD-019`, `020`              |
| `H-CODE-013-009` | productos sin SKU continúan operables mediante tratamiento legacy                                | compatibilidad de datos        | `CAP-SCOPE-004`, `DATA-NORM-AUD-004`, `SUPA-TRANS-005`, `007`, `012`                       |
| `H-CODE-013-010` | la clase de una sede puede inferirse desde su nombre cuando faltan datos canónicos               | fallback semántico legacy      | `CAP-SCOPE-001`, `SUPA-AUD-019`, `SUPA-TRANS-005`, `007`, `012`                            |
| `H-CODE-013-011` | VISO continúa escribiendo `logo_url` junto a card/header y PASS todavía lo consume               | columna legacy activa          | `VISO-UX-017`, `018`, `PASS-UX-001`, `SUPA-AUD-018`, `019`, `SUPA-TRANS-*`                 |
| `H-CODE-013-012` | el endpoint de logos conserva `kind=legacy`                                                      | entrada legacy activa          | mismo destino de `H-CODE-013-011`                                                          |
| `H-CODE-013-013` | role override permanece duplicado entre aplicaciones                                             | puente distribuido             | `SHELL-AUD-003`, `005`, `SHELL-PKG-004`, `005`, `CODE-AUD-014`, `017`                      |
| `H-CODE-013-014` | migraciones históricas con nombre legacy no son runtime                                          | falso positivo                 | cerrado                                                                                    |
| `H-CODE-013-015` | no se confirma legado activo específico en ANIMA, NUMERA, TALENTO o Vento Group                  | límite de evidencia            | continuar `CODE-AUD-014` a `020`                                                           |

Todos los hallazgos quedan cerrados o vinculados a tareas existentes.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 17. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 17.1. Requisitos reutilizados

- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`;
- `TREQ-PASS-004`;
- `TREQ-NEXO-002`;
- `TREQ-NEXO-006`.

No se cambia su estado.

##### 17.2. Requisitos nuevos

###### `TREQ-PULSO-002`

El tablero operativo de órdenes deberá migrar desde `orders-board-legacy` sin perder paridad comprobada de pedidos, filtros, transiciones, despacho, conversación, historial, facturación, regalos, eventos y actualización en tiempo real; después del retiro no podrá existir una importación runtime hacia la implementación legacy.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-NEXO-007`

Todo fallback legacy de configuración de remisiones deberá distinguir errores de esquema de errores de permisos, red o consulta, registrar cuándo se activa y demostrar que no amplía ni reduce silenciosamente productos, audiencia, áreas, alcance o estados antes de su retiro.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-NEXO-008`

Ningún producto podrá participar en una operación de inventario aplicando silenciosamente semántica predeterminada por ausencia de SKU o perfil canónico; toda excepción transitoria deberá ser identificable, auditable, regularizable y protegida por pruebas de paridad.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-PASS-005`

La selección de logos de cada experiencia PASS deberá utilizar `card_logo_url` y `header_logo_url` como contrato canónico; `logo_url` solo podrá funcionar como fallback temporal identificado, y su backfill y retiro deberán preservar paridad visual antes de impedir nuevas escrituras legacy.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-SUPABASE-001`

Todo wrapper, alias, columna, vista o fallback legacy todavía activo deberá tener propietario, consumidores, condición de activación, evidencia de uso, prueba de paridad, estrategia de rollback y puerta explícita de retiro antes de modificar o eliminar el contrato heredado.

**Estado inicial propuesto:** `IDENTIFICADO`.

Las filas canónicas completas deberán agregarse únicamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

después de la aprobación de `CODE-AUD-013`.

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 18. Decisiones propuestas

1. El nombre `legacy` no bastará para clasificar un artefacto.
2. Se exigirá evidencia de consumo o ejecución actual.
3. `orders-board-legacy` se declara legado runtime activo.
4. Su retiro exigirá matriz de paridad funcional.
5. Los scripts históricos de parche pasan a `CODE-AUD-015`.
6. `in_transit` y `on_the_way` se declaran aliases activos pendientes de normalización.
7. `received` y `closed` deberán diferenciarse o consolidarse mediante decisión de proceso.
8. El fallback de columnas de NEXO se declara compatibilidad activa.
9. Un error genérico no deberá activar silenciosamente un contrato antiguo.
10. Las reglas de área por nombre de rol no serán fuente canónica definitiva.
11. Los productos sin perfil no deberán recibir semántica operativa silenciosa en el estado objetivo.
12. Los productos sin SKU deberán regularizarse antes de retirar compatibilidad.
13. La inferencia de sede por nombre se declara fallback legacy.
14. `logo_url` se declara contrato heredado todavía activo.
15. `card_logo_url` y `header_logo_url` serán el contrato objetivo sujeto a validación.
16. El endpoint no deberá seguir creando objetos `legacy` después de cerrar el backfill.
17. Role override se conserva como simulación, pero deberá consolidarse.
18. Las migraciones históricas no se eliminarán por contener la palabra legacy.
19. Se derivan cinco requisitos de prueba.
20. No se crea ninguna tarea nueva.
21. No se modifica código.
22. No se modifica Supabase.
23. `CODE-AUD-014` será la única continuidad inmediata.

---

#### 19. Límites de certeza

Esta tarea no confirma:

- que todos los registros existentes utilicen columnas legacy;
- que todos los aliases aparezcan en producción;
- que `logo_url` pueda eliminarse inmediatamente;
- que `on_the_way` o `in_transit` sea el estado definitivo;
- que `closed` y `received` deban fusionarse;
- que todos los productos sin perfil sean operativamente incorrectos;
- que todo producto deba tener SKU visible;
- que los scripts históricos de PULSO no sean ejecutados manualmente;
- que ninguna otra rama contenga consumidores legacy;
- que la inferencia por nombre se active actualmente para todas las sedes;
- que role override deba retirarse;
- que todas las migraciones legacy hayan cumplido su objetivo;
- que no exista legado activo adicional en repositorios sin hallazgo específico.

E3 deberá verificar datos y objetos reales antes de cualquier retiro.

---

#### 20. Criterios de aceptación

`CODE-AUD-013` podrá aprobarse cuando:

- legacy activo, dormido e histórico estén diferenciados;
- PULSO tenga documentada la dependencia runtime hacia su tablero legacy;
- se documenten los aliases de estado;
- los scripts sin activación probada no se clasifiquen como runtime;
- el fallback de columnas NEXO quede registrado;
- las reglas por rol y nombre de sede tengan destino;
- los productos sin perfil y sin SKU tengan tratamiento explícito;
- el contrato heredado de logos quede documentado;
- role override quede clasificado como puente distribuido;
- las migraciones históricas queden excluidas como falsos positivos;
- cada hallazgo tenga destino exacto;
- no se cree ninguna tarea nueva;
- los cinco requisitos nuevos estén identificados;
- las filas completas no se dupliquen dentro de la tarea;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-014` permanezca como continuidad inmediata.

---

#### 21. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
artefacto heredado
→ consumidor actual
→ motivo de compatibilidad
→ riesgo de permanencia
→ prueba de paridad
→ adaptación de consumidores
→ retiro controlado
```

La continuidad será:

```text
CODE-AUD-014
— Detectar código duplicado y fuentes de verdad competidoras
```


### ✅ CODE-AUD-014 — Detectar código duplicado y fuentes de verdad competidoras

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de duplicación ejecutable, contratos replicados y fuentes de verdad paralelas  
**Dependencia anterior:** `CODE-AUD-013`  
**Continuidad reservada:** `CODE-AUD-015`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea identifica dos familias de riesgo:

1. **código duplicado activo**, cuando una misma responsabilidad está implementada en varios repositorios o archivos y puede evolucionar de forma distinta;
2. **fuentes de verdad competidoras**, cuando un mismo hecho empresarial puede obtenerse, inferirse o modificarse desde más de una fuente sin un propietario, precedencia o reconciliación inequívocos.

Resultado general:

- la fundación de Vento OS continúa copiada dentro de varias aplicaciones;
- AppShell, contexto operativo, role override, permisos, navegación y contratos básicos presentan implementaciones locales;
- ya existe divergencia funcional entre copias del evaluador de role override;
- el catálogo visible de aplicaciones se encuentra hardcodeado en cada AppShell mientras la navegación se consulta dinámicamente desde Supabase;
- NEXO resuelve la habilitación de remisiones mediante varias capas de configuración y fallbacks distribuidos;
- NEXO compone la semántica operativa de un producto desde varias tablas y reglas locales;
- inventario mantiene un ledger de movimientos y tres proyecciones mutables que ciertas rutas actualizan de forma secuencial;
- PASS conserva simultáneamente experiencias estáticas de Vento Café y Saudo y la experiencia dinámica basada en `pass_satellites`;
- PASS puede resolver la sede por heurística sobre `sites` o mediante `pass_satellites.site_id`;
- las duplicaciones de compatibilidad ya detectadas en `CODE-AUD-013` se reutilizan y no se registran dos veces;
- no se crea ninguna tarea nueva del roadmap;
- se derivan siete requisitos de prueba;
- no se modifica código ni Supabase.

---

#### 2. Definiciones utilizadas

##### 2.1. Duplicación técnica

Dos o más implementaciones ejecutables de la misma responsabilidad.

Ejemplos:

- dos evaluadores de permisos;
- varios resolutores de contexto;
- AppShell copiado por repositorio;
- normalización de unidades repetida;
- listas de aplicaciones replicadas;
- lógica de stock escrita en varias rutas.

##### 2.2. Duplicación deliberada

Duplicación permitida temporalmente cuando:

- existe propietario;
- tiene alcance conocido;
- se conserva paridad;
- se prueba;
- tiene mecanismo de actualización;
- posee criterio de retiro.

##### 2.3. Fuente de verdad canónica

Única fuente autorizada para crear o modificar un hecho empresarial.

Puede existir más de una representación, pero las demás deberán ser:

- proyecciones;
- cachés;
- vistas;
- snapshots;
- índices;
- réplicas;
- adaptadores.

Cada representación derivada deberá declarar de qué fuente proviene y cómo se reconcilia.

##### 2.4. Fuente competidora

Fuente que puede decidir o modificar el mismo hecho sin una precedencia inequívoca.

Ejemplos:

- capacidad de una sede definida por tabla especializada y por `site_type`;
- permiso evaluado por helper canónico y por lista local de roles;
- unidad base tomada de perfil, política, presentación o columna del producto;
- stock calculado por ledger y también escrito directamente en varias tablas;
- sede cliente resuelta por relación explícita y por búsqueda de nombre.

##### 2.5. Proyección válida

Tabla o vista derivada que:

- no redefine la regla empresarial;
- se actualiza atómicamente;
- puede reconstruirse;
- se reconcilia;
- tiene semántica documentada;
- no puede divergir silenciosamente.

---

#### 3. Método aplicado

Para cada responsabilidad se contrastó:

```text
hecho empresarial
→ escritor o resolutor
→ fuentes consultadas
→ precedencia
→ consumidores
→ mecanismos de actualización
→ pruebas
→ reconciliación
```

Se buscó especialmente:

- el mismo archivo o helper en varios repositorios;
- estructuras TypeScript repetidas;
- constantes repetidas;
- decisiones locales de autorización;
- lecturas de tablas diferentes para el mismo hecho;
- fallbacks basados en nombres o tipos;
- escrituras paralelas;
- proyecciones actualizadas desde cliente o API;
- rutas antiguas y nuevas disponibles simultáneamente;
- contratos configurados en Supabase y replicados en código.

No se clasifica como duplicación problemática:

- una interfaz específica de aplicación;
- una copia generada automáticamente;
- un adaptador local pequeño;
- un tipo derivado de contrato versionado;
- una caché con fuente y TTL explícitos;
- una proyección reconstruible y reconciliada;
- una configuración por sede con jerarquía formalmente aprobada.

---

#### 4. Fundación compartida copiada entre aplicaciones

Se confirmaron archivos equivalentes dentro de aplicaciones como:

```text
src/components/vento/standard/vento-shell.tsx
src/components/vento/standard/vento-chrome.tsx
src/lib/auth/role-override.ts
src/lib/auth/operational-context.ts
src/lib/auth/operational-session.ts
src/lib/auth/permissions.ts
src/lib/supabase/server.ts
```

Las copias de `vento-shell.tsx` en NEXO, VISO y PULSO contienen la misma estructura base:

- tipos de sede;
- asignaciones del trabajador;
- contexto activo;
- dispositivo compartido;
- puertas operativas;
- catálogo de aplicaciones;
- navegación;
- bypass administrativo;
- resolución de jornada;
- permisos por navegación;
- renderizado de Chrome.

No son simples componentes visuales.

Cada copia participa en:

- autorización;
- visibilidad;
- contexto;
- disponibilidad de aplicaciones;
- bloqueo por jornada;
- navegación;
- dispositivos compartidos.

##### 4.1. Divergencias ya visibles

NEXO agrega responsabilidades que otras copias no tienen o no manejan igual:

- `checkOperationalPermission`;
- cookie local de sede;
- permisos operativos específicos de remisión;
- conjunto ampliado de iconos;
- lógica específica de aplicaciones y rutas.

PULSO y VISO conservan catálogos e iconos diferentes.

Estas diferencias pueden ser válidas como extensiones, pero actualmente el límite entre:

```text
núcleo compartido
```

y:

```text
extensión local
```

no está materializado mediante contrato o paquete.

##### 4.2. Riesgo

- una corrección de seguridad puede aplicarse solo en una aplicación;
- la misma sesión puede resolverse de forma distinta;
- los dispositivos compartidos pueden tener puertas diferentes;
- el app switcher puede divergir;
- los tipos copiados pueden dejar de representar la base;
- cada repositorio puede interpretar distinto un cambio de Supabase.

##### 4.3. Destino

- `SHELL-AUD-001` a `SHELL-AUD-010`;
- `SHELL-PKG-001` a `SHELL-PKG-008`;
- `SHELL-CON-001` a `SHELL-CON-016`;
- `CODE-AUD-016`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se ordena extraer todo a un único paquete.

`SHELL-AUD-010` deberá clasificar cada pieza como:

```text
compartir
generar
mantener local
```

---

#### 5. Evaluadores de role override ya divergentes

Se compararon las implementaciones de NEXO y FOGO.

##### 5.1. FOGO

FOGO carga desde `role_permissions`:

```text
scope_site_id
scope_area_id
scope_site_type
scope_area_kind
```

y evalúa esos campos directamente.

##### 5.2. NEXO

NEXO no selecciona `scope_site_id` ni `scope_area_id` dentro de esa carga.

En su lugar:

- asigna ambos como `null`;
- consulta todos los `employee_sites` activos;
- exige que el contexto de sede esté dentro de ese conjunto;
- contiene una excepción específica para conductor y tránsito.

Por tanto, dos aplicaciones que afirman ejecutar:

```text
checkPermissionWithRoleOverride
```

no aplican exactamente el mismo contrato de alcance.

##### 5.3. Riesgo

- una simulación puede permitir en una app y denegar en otra;
- un scope por sede concreta puede ignorarse;
- la cobertura del trabajador puede reemplazar el scope del permiso;
- una excepción funcional puede quedar incrustada en el helper general;
- una prueba de una copia no protege a las demás.

##### 5.4. Clasificación

**Duplicación crítica con divergencia funcional confirmada.**

Destinos:

- `SHELL-AUD-003`;
- `SHELL-AUD-004`;
- `SHELL-AUD-005`;
- `SHELL-AUD-009`;
- `SHELL-CON-003`;
- `SHELL-CON-006`;
- `SHELL-CON-007`;
- `AUTH-CTX-025` a `AUTH-CTX-030`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-AUTH-001`;
- mantiene `TREQ-AUTH-002`;
- crea `TREQ-AUTH-004`.

---

#### 6. Catálogo de aplicaciones y navegación distribuido

Cada AppShell conserva un arreglo local:

```text
APP_SWITCHER_ITEMS
```

con:

- identificador;
- nombre;
- descripción;
- URL;
- logo;
- color;
- estado;
- grupo.

Al mismo tiempo, la navegación interna se obtiene desde:

```text
app_navigation_items
```

y el acceso depende de permisos y aplicaciones permitidas.

##### 6.1. Fuentes actuales

```text
APP_SWITCHER_ITEMS local
→ qué aplicación existe, URL, marca y estado

app_navigation_items
→ qué navegación tiene la aplicación

shared_operational_devices.allowed_app_codes
→ qué aplicación puede abrir un dispositivo

apps / app_permissions
→ qué aplicación y permisos existen en autorización
```

Estas fuentes representan aspectos diferentes, pero el código no contiene un contrato central que garantice:

- que todos los IDs existan;
- que las URLs coincidan;
- que un estado `soon` no contradiga el catálogo;
- que un dispositivo no reciba una aplicación ausente del switcher;
- que todos los repositorios tengan la misma lista;
- que la eliminación de una aplicación se propague.

##### 6.2. Riesgo

- AURA puede aparecer diferente entre aplicaciones;
- un dominio puede cambiar sin actualizar todos los repositorios;
- una app activa puede seguir marcada `soon`;
- una aplicación permitida puede no tener URL;
- el mismo color, logo o descripción puede divergir;
- el switcher puede presentar una capacidad inexistente.

##### 6.3. Destino

- `SHELL-AUD-006`;
- `SHELL-AUD-009`;
- `SHELL-AUD-010`;
- `SHELL-CON-002`;
- `SHELL-CON-011`;
- `SHELL-PKG-004`;
- `SHELL-PKG-005`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-SHELL-001`;
- crea `TREQ-SHELL-003`.

---

#### 7. NEXO — varias fuentes resuelven si una sede puede operar remisiones

Se localizaron estas fuentes activas:

```text
area_kinds.use_for_remission
site_purpose_settings
site_area_purpose_rules
site_operational_capabilities
sites.site_type
areas.kind
contexto operativo activo
shared_operational_devices.site_id / area_id
product_site_settings.remission_enabled
product_site_settings.area_kinds
```

##### 7.1. Jerarquía parcial existente

La configuración administrativa permite:

```text
global
→ area_kinds.use_for_remission

por sede
→ site_purpose_settings.mode

excepciones por sede y área
→ site_area_purpose_rules
```

El resolutor de áreas intenta primero las reglas específicas y después combina áreas activas con el catálogo global.

##### 7.2. Segunda decisión para la sede

La creación de remisiones consulta:

```text
site_operational_capabilities.can_request_remissions
```

Cuando no existe fila, vuelve a:

```text
sites.site_type === satellite
```

Por tanto, la capacidad “esta sede solicita remisiones” puede depender de:

1. una capacidad explícita; o
2. una clasificación general de sede.

##### 7.3. Decisiones adicionales

Después se filtran:

- productos habilitados;
- áreas del producto;
- contexto del trabajador;
- contexto del dispositivo;
- permiso.

Estas condiciones son legítimas, pero están distribuidas entre páginas, helpers y acciones.

##### 7.4. Riesgo

- dos superficies pueden usar una parte distinta de la jerarquía;
- la ausencia de una fila puede interpretarse como herencia o como denegación;
- `site_type` puede reactivar una capacidad no configurada;
- el catálogo global puede competir con una excepción vacía;
- un producto puede aparecer en catálogo y ser rechazado al guardar;
- un dispositivo y un trabajador pueden obtener resultados diferentes.

##### 7.5. Clasificación

**Fuentes de decisión distribuidas con precedencia parcialmente codificada.**

Destinos:

- `PROC-CAT-003` a `PROC-CAT-018`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `NEXO-UX-009` a `NEXO-UX-013`;
- `NEXO-AUTH-029`;
- `SHELL-CON-009`;
- `SHELL-CON-012`;
- `SUPA-AUD-019`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-NEXO-009`.

No se elimina la configuración por capas.

Se exige convertirla en una jerarquía canónica única y reutilizable.

---

#### 8. NEXO — semántica operativa de producto compuesta desde varias fuentes

En remisiones se utilizan:

```text
products.unit
products.stock_unit_code
products.product_type
product_inventory_profiles.inventory_kind
product_inventory_profiles.measurement_mode
product_inventory_profiles.default_tolerance_percent
product_inventory_profiles.requires_actual_dispatch_qty
product_inventory_profiles.requires_count_alongside_weight
product_uom_profiles
product_request_policies
product_site_settings
```

##### 8.1. Precedencias actuales

El flujo puede decidir la cantidad base mediante:

1. una política de solicitud;
2. una presentación física;
3. la unidad de stock;
4. la unidad legacy del producto;
5. el fallback `"un"`.

La modalidad de medición puede provenir de:

1. `product_inventory_profiles.measurement_mode`;
2. una normalización local;
3. `fixed_presentation` cuando falta perfil.

La disponibilidad depende adicionalmente de `product_site_settings`.

##### 8.2. Lógica repetida

La interpretación de unidades, presentaciones y perfiles aparece en:

- remisiones;
- conteo inicial;
- retiro desde kiosco;
- tablero de LOC;
- catálogo;
- configuración de remisiones;
- presentación de productos.

Existen helpers comunes, pero también normalizadores, tipos y fallbacks locales.

##### 8.3. Riesgo

- una pantalla convierte distinto que otra;
- la unidad mostrada puede no ser la unidad persistida;
- una política puede contradecir un perfil;
- una presentación inactiva puede seguir siendo aceptada por otro flujo;
- un producto sin perfil recibe semántica de código;
- un cambio de unidad puede no propagarse a todas las superficies;
- la configuración por sede puede alterar disponibilidad sin alterar conversión.

##### 8.4. Clasificación

No se declara que las tablas sean duplicadas por diseño.

El hallazgo es:

```text
la precedencia y las invariantes viven parcialmente en código consumidor
```

en lugar de existir como contrato único.

Destinos:

- `CAP-SCOPE-004`;
- `CAP-SCOPE-006`;
- `SHELL-AUD-009`;
- `SHELL-CON-001`;
- `SHELL-CON-009`;
- `SHELL-CON-012`;
- `SUPA-AUD-019`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `SUPA-ARC-*`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-NEXO-008`;
- crea `TREQ-NEXO-010`.

---

#### 9. Inventario — ledger y proyecciones mutables actualizados desde una misma ruta

La ruta de ajustes utiliza:

```text
inventory_movements
inventory_stock_by_site
inventory_stock_by_location
inventory_stock_by_position
```

##### 9.1. Comportamiento confirmado

La ruta:

1. lee las tres proyecciones;
2. calcula diferencias;
3. inserta un movimiento;
4. actualiza stock por sede;
5. actualiza stock por LOC;
6. actualiza stock por posición;
7. puede ejecutar RPC de reconciliación;
8. puede actualizar costo del producto;
9. puede insertar un evento de costo.

Estas operaciones se ejecutan mediante llamadas sucesivas desde la ruta.

##### 9.2. Competencia potencial de verdad

Si `inventory_movements` es el ledger canónico, las tablas de stock deberían ser proyecciones derivadas.

Sin embargo, las proyecciones son modificadas directamente y luego utilizadas para decidir cantidades futuras.

Un fallo después de insertar el movimiento puede dejar:

```text
movimiento creado
+
una o más proyecciones sin actualizar
```

Un fallo posterior puede dejar costo y stock en estados distintos.

##### 9.3. Riesgo

- stock por sede distinto de la suma de LOC;
- stock de LOC distinto de posiciones;
- movimiento sin proyección;
- proyección sin evento equivalente;
- reintento que duplica el movimiento;
- costo actualizado sin evento o viceversa;
- correcciones especiales acumuladas como lógica local.

##### 9.4. Clasificación

**Fuentes mutables múltiples sin atomicidad demostrada en esta ruta.**

Destinos:

- `SUPA-AUD-004` a `SUPA-AUD-008`;
- `SUPA-AUD-018`;
- `SUPA-AUD-019`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `SUPA-ARC-003`;
- `SUPA-ARC-005`;
- `SUPA-ARC-006`;
- `SUPA-ARC-012`;
- `SUPA-ARC-013`;
- `SUPA-ARC-014`;
- `SUPA-TRANS-*`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-SUPABASE-002`.

No se decide todavía si el ledger o una tabla de stock será la fuente final.

E3 deberá aprobarlo explícitamente.

---

#### 10. PASS — experiencias estáticas y dinámicas activas en paralelo

`App.js` registra simultáneamente:

```text
VentoCafe
Saudo
SatelliteExperience
SatellitePass
```

Las rutas de Vento Café y Saudo usan componentes específicos.

La experiencia nueva utiliza:

```text
pass_satellites
→ site_id
→ configuración de marca
→ experiencia dinámica
```

##### 10.1. Resolución antigua de sede

La utilidad `site.ts` busca la sede mediante una combinación de:

```text
sites.type
sites.name
sites.code
BUSINESS_SEARCH_TERMS
```

y toma el primer resultado activo.

##### 10.2. Resolución dinámica

La experiencia dinámica utiliza:

```text
pass_satellites.site_id
```

y puede combinar:

```text
sites.address / latitude / longitude
```

con:

```text
pass_satellites.address_override
pass_satellites.latitude_override
pass_satellites.longitude_override
```

##### 10.3. Doble implementación

Para una misma marca pueden coexistir:

```text
componente específico
+
búsqueda heurística de sede
```

y:

```text
componente dinámico
+
relación explícita pass_satellites.site_id
```

Esto no es únicamente una diferencia visual.

Afecta:

- sede de recompensas;
- historial;
- marca;
- dirección;
- coordenadas;
- enlaces;
- navegación;
- pedidos;
- filtros;
- caché.

##### 10.4. Riesgo

- una ruta usa un `site_id` y otra usa otro;
- una marca corregida en VISO no cambia el componente estático;
- la experiencia dinámica y la específica muestran datos distintos;
- una nueva sede queda fuera de la heurística;
- una ruta vieja permanece accesible después de migrar;
- pruebas sobre una experiencia no protegen la otra.

##### 10.5. Destino

- `PASS-UX-001 — Inventariar pantallas actuales de cliente`;
- `PASS-UX-002 — Diseñar navegación principal`;
- `PASS-UX-003 — Diseñar inicio`;
- `PASS-UX-004 — Diseñar identificación por QR`;
- `PASS-UX-006 — Diseñar historial`;
- `PASS-UX-010 — Simplificar interfaz móvil`;
- `PASS-UX-013 — Ejecutar pruebas con clientes reales`;
- `SHELL-AUD-001`;
- `SHELL-AUD-009`;
- `SUPA-AUD-019`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `CODE-AUD-015`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-PASS-004`;
- mantiene `TREQ-PASS-005`;
- crea `TREQ-PASS-006`.

---

#### 11. Duplicaciones ya cubiertas por tareas anteriores

##### 11.1. PULSO `orders-board-legacy`

Permanece cubierto por:

```text
CODE-AUD-013
TREQ-PULSO-002
```

`CODE-AUD-014` añade que la responsabilidad está distribuida entre:

- live bridge;
- wrapper actual;
- implementación legacy;
- bridges adicionales.

No se crea otro requisito.

##### 11.2. Aliases de estados

Los estados equivalentes de PULSO y NEXO permanecen cubiertos por:

- `TREQ-SUPABASE-001`;
- transición de Supabase;
- centralización de estados.

##### 11.3. `logo_url`

La columna legacy y sus nuevos campos permanecen cubiertos por:

```text
TREQ-PASS-005
```

`CODE-AUD-014` amplía el análisis hacia la coexistencia de experiencia estática y dinámica.

##### 11.4. Role override

La compatibilidad legacy permanece cubierta por:

- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`;
- `TREQ-SUPABASE-001`.

Se crea `TREQ-AUTH-004` únicamente para proteger la paridad entre evaluadores duplicados.

---

#### 12. Falsos positivos excluidos

##### 12.1. Componentes visuales parecidos

No se clasifican como duplicación crítica cuando representan:

- una composición propia;
- estilo de aplicación;
- pantalla de dominio;
- layout específico.

##### 12.2. Configuración global con override por sede

No es fuente competidora si existe una jerarquía inequívoca:

```text
global
→ override por sede
→ override por área
```

El hallazgo aparece cuando esa jerarquía se implementa de manera distinta en cada consumidor o incluye fallbacks no declarados.

##### 12.3. Cachés

AsyncStorage, caché de memoria y snapshots no son fuentes canónicas si:

- tienen TTL;
- pueden invalidarse;
- no escriben el hecho empresarial;
- la fuente remota prevalece.

##### 12.4. Vistas y proyecciones

No son fuentes competidoras por existir.

Se convierten en riesgo cuando:

- son directamente mutables;
- no pueden reconstruirse;
- no se actualizan atómicamente;
- no existe conciliación.

##### 12.5. Datos comerciales y operativos separados

`pass_satellites` puede ser propietario de la experiencia comercial y `sites` de la sede operativa.

La separación es válida si el contrato define:

- campos propios;
- campos heredados;
- overrides permitidos;
- precedencia;
- sincronización;
- consumidores.

##### 12.6. Tipos locales

Un tipo local pequeño no exige paquete compartido si no representa un contrato transversal.

---

#### 13. Matriz por repositorio

| Repositorio     | Duplicación o competencia confirmada                                                          | Clasificación           |
| --------------- | --------------------------------------------------------------------------------------------- | ----------------------- |
| `vento-shell`   | contiene la base y los contratos candidatos, pero todavía no se distribuyen como fuente única | fundación pendiente     |
| `vento-viso`    | AppShell y auth locales; administra `pass_satellites`; catálogo de apps local                 | duplicación compartida  |
| `vento-nexo`    | AppShell/auth locales; múltiples resolutores de capacidad, producto y stock                   | crítica                 |
| `vento-fogo`    | AppShell/auth locales con evaluador de scope distinto a NEXO                                  | crítica de autorización |
| `vento-origo`   | AppShell/auth locales; requiere comparación completa en SHELL-AUD                             | duplicación compartida  |
| `vento-pulso`   | AppShell local y responsabilidad de órdenes distribuida                                       | duplicación activa      |
| `vento-numera`  | AppShell y contratos locales pendientes de comparación                                        | duplicación compartida  |
| `Vento-Group`   | no se confirma fuente competidora nueva en este corte                                         | sin hallazgo nuevo      |
| `vento-anima`   | implementación móvil propia; contratos de contexto deberán compararse                         | pendiente               |
| `vento-pass`    | experiencias estáticas y dinámicas, dos resoluciones de sede y múltiples capas de marca       | competencia activa      |
| `vento-talento` | producto futuro; no se clasifica como riesgo productivo                                       | diferido                |
| `vento-vital`   | proyecto separado                                                                             | fuera de Vento OS       |

---

#### 14. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                | Destino                                                                 |
| ---------------- | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `H-CODE-014-001` | AppShell y fundación operativa están copiados entre aplicaciones                        | `SHELL-AUD-001` a `010`, `SHELL-PKG-*`, `SHELL-CON-*`, `TREQ-SHELL-002` |
| `H-CODE-014-002` | las copias ya contienen extensiones y comportamientos diferentes                        | mismo destino de `H-CODE-014-001`                                       |
| `H-CODE-014-003` | NEXO y FOGO evalúan role override con semántica territorial distinta                    | `SHELL-AUD-003` a `005`, `CODE-AUD-017`, `TREQ-AUTH-004`                |
| `H-CODE-014-004` | cada AppShell conserva un catálogo local de aplicaciones                                | `SHELL-AUD-006`, `SHELL-CON-002`, `TREQ-SHELL-003`                      |
| `H-CODE-014-005` | el catálogo local debe coexistir con navegación, permisos y apps permitidas en Supabase | `SHELL-AUD-006`, `009`, `010`, `CODE-AUD-019`, `020`                    |
| `H-CODE-014-006` | la capacidad de remisiones de una sede se resuelve desde varias tablas y fallbacks      | `PROC-CAT-*`, `NEXO-UX-009` a `013`, `SUPA-AUD-019`, `TREQ-NEXO-009`    |
| `H-CODE-014-007` | la semántica de producto se compone desde varias tablas y precedencias locales          | `CAP-SCOPE-004`, `006`, `SUPA-AUD-019`, `TREQ-NEXO-010`                 |
| `H-CODE-014-008` | la interpretación de unidades y perfiles se repite entre varios consumidores NEXO       | `SHELL-AUD-009`, `SHELL-CON-001`, `012`, `CODE-AUD-019`, `020`          |
| `H-CODE-014-009` | ajustes escribe ledger y tres proyecciones mediante pasos sucesivos                     | `SUPA-AUD-*`, `SUPA-ARC-*`, `CODE-AUD-018`, `TREQ-SUPABASE-002`         |
| `H-CODE-014-010` | PASS registra rutas específicas y dinámicas para experiencias equivalentes              | `PASS-UX-*`, `CODE-AUD-015`, `019`, `020`, `TREQ-PASS-006`              |
| `H-CODE-014-011` | PASS puede resolver sede mediante heurística o relación explícita                       | `PASS-UX-001`, `006`, `SUPA-AUD-019`, `TREQ-PASS-006`                   |
| `H-CODE-014-012` | datos operativos de `sites` y overrides comerciales requieren contrato de propiedad     | `SUPA-AUD-022`, `023`, `PASS-UX-001`, `TREQ-PASS-006`                   |
| `H-CODE-014-013` | tablero legacy, aliases y logos legacy ya están cubiertos por requisitos anteriores     | reutilización                                                           | mantener `TREQ-PULSO-002`, `TREQ-PASS-005`, `TREQ-SUPABASE-001` |
| `H-CODE-014-014` | no toda configuración por capas constituye competencia                                  | regla de clasificación                                                  | cerrado                                                         |
| `H-CODE-014-015` | no se confirma una fuente competidora nueva en Vento Group, TALENTO o VITAL             | límite de evidencia                                                     | continuar auditoría                                             |

Todos los hallazgos quedan cerrados o vinculados a tareas existentes.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 15. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 15.1. Requisitos reutilizados

- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`;
- `TREQ-SHELL-001`;
- `TREQ-NEXO-006`;
- `TREQ-NEXO-007`;
- `TREQ-NEXO-008`;
- `TREQ-PASS-004`;
- `TREQ-PASS-005`;
- `TREQ-PULSO-002`;
- `TREQ-SUPABASE-001`.

No se cambia su estado.

##### 15.2. Requisitos nuevos

- `TREQ-SHELL-002` — paridad y distribución controlada de la fundación compartida;
- `TREQ-SHELL-003` — catálogo único de aplicaciones, destinos y estado;
- `TREQ-AUTH-004` — equivalencia de decisiones entre evaluadores de autorización;
- `TREQ-NEXO-009` — jerarquía única de capacidad de remisiones por sede y área;
- `TREQ-NEXO-010` — precedencia única de semántica operativa de producto;
- `TREQ-PASS-006` — convergencia entre experiencia estática, experiencia dinámica y sede;
- `TREQ-SUPABASE-002` — atomicidad y reconciliación entre ledger y proyecciones de inventario.

Las filas canónicas completas deberán agregarse únicamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 16. Decisiones propuestas

1. No toda duplicación será eliminada.
2. Cada pieza se clasificará como compartir, generar o mantener local.
3. La fundación común no seguirá dependiendo de copias manuales sin pruebas de paridad.
4. Las extensiones locales deberán separarse del núcleo.
5. Los evaluadores de autorización deberán producir la misma decisión para el mismo contexto.
6. Las excepciones de negocio no deberán incrustarse en una copia general sin contrato.
7. El catálogo de aplicaciones deberá tener una fuente canónica.
8. La navegación podrá seguir siendo dinámica.
9. La jerarquía de capacidad de remisiones deberá centralizarse en un resolutor único.
10. `site_type` no deberá competir indefinidamente con capacidades explícitas.
11. La semántica de producto deberá tener precedencia aprobada.
12. Los consumidores no deberán inventar fallbacks incompatibles.
13. E3 deberá decidir la fuente canónica de stock.
14. Ledger y proyecciones deberán actualizarse atómicamente o reconciliarse.
15. PASS deberá decidir y ejecutar la convergencia entre rutas específicas y dinámicas.
16. `sites` y `pass_satellites` podrán coexistir con propiedad de campos explícita.
17. Se derivan siete requisitos de prueba.
18. No se crea ninguna tarea nueva.
19. No se modifica código.
20. No se modifica Supabase.
21. `CODE-AUD-015` será la única continuidad inmediata.

---

#### 17. Límites de certeza

Esta tarea no confirma:

- que cada copia de AppShell tenga exactamente el mismo número de líneas;
- que toda diferencia entre aplicaciones sea incorrecta;
- que el mecanismo final de distribución deba ser un paquete npm;
- que `apps` contenga actualmente toda la metadata del switcher;
- que las proyecciones de stock no tengan triggers adicionales;
- que todos los ajustes terminen en divergencia;
- que `inventory_movements` deba ser obligatoriamente la fuente definitiva;
- que todas las rutas estáticas de PASS sean alcanzadas desde Home;
- que `pass_satellites` y `sites` deban fusionarse;
- que toda regla por sede deba vivir en una sola tabla;
- que todas las duplicaciones existentes hayan sido detectadas;
- que ausencia de hallazgo en un repositorio equivalga a integridad.

E3 deberá revisar objetos, triggers, funciones y datos reales antes de aprobar una fuente de verdad.

---

#### 18. Criterios de aceptación

`CODE-AUD-014` podrá aprobarse cuando:

- duplicación técnica, deliberada y proyección válida estén diferenciadas;
- las copias de AppShell estén inventariadas;
- la divergencia del role override esté documentada;
- el catálogo de aplicaciones tenga destino;
- la jerarquía de remisiones tenga destino;
- las fuentes de semántica de producto tengan destino;
- ledger y proyecciones de stock estén contrastados;
- PASS estático y dinámico estén contrastados;
- cada hallazgo tenga tarea responsable;
- no se cree ninguna tarea nueva;
- los siete requisitos nuevos estén identificados;
- las filas completas se entreguen fuera de esta tarea;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-015` permanezca como continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
hecho empresarial
→ implementaciones y fuentes actuales
→ propietario
→ fuente canónica
→ proyecciones y adaptadores
→ pruebas de paridad y reconciliación
→ retiro de duplicación accidental
```

La continuidad será:

```text
CODE-AUD-015
— Detectar rutas, componentes, funciones y tablas sin consumidores
```


### ✅ CODE-AUD-015 — Detectar rutas, componentes, funciones y tablas sin consumidores

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de alcanzabilidad, referencias, consumidores y artefactos huérfanos  
**Dependencia anterior:** `CODE-AUD-014`  
**Continuidad reservada:** `CODE-AUD-016`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea identifica artefactos que existen en los repositorios o en el esquema, pero para los cuales no se localizó una cadena funcional completa y actualmente alcanzable.

Se revisaron:

- rutas y páginas;
- componentes;
- hooks y helpers;
- exports;
- endpoints;
- server actions;
- scripts;
- tablas;
- vistas;
- RPC;
- funciones;
- navegación;
- registros de pantalla;
- imports estáticos;
- manifests de build históricos disponibles;
- referencias textuales;
- comandos de `package.json`;
- consumidores actuales e históricos.

Resultado general:

- NEXO conserva una superficie LPN fragmentada: componente de creación sin montaje localizado, ruta que redirige, endpoint de lectura sin caller interno localizado y tablas sin ciclo completo;
- PASS conserva una cadena alternativa de seguimiento de pedidos que no está registrada en la navegación activa;
- PASS conserva al menos un export auxiliar sin consumidor localizado;
- PULSO conserva scripts manuales de parche que no forman parte de sus comandos actuales;
- el repositorio archivado `vento-platform` contiene un prototipo POS histórico, pero la ruta POS alcanzable del último build inspeccionado solo consumía identificación de cliente, puntos y canjes;
- las acciones históricas de creación de orden y pago existen en código fuente, pero no aparecen conectadas a la ruta POS compilada inspeccionada;
- algunos objetos `pos.*` sí tienen consumidores actuales en el salón de `vento-pulso`;
- otros objetos solo tienen consumidores históricos dormidos, referencias de tipos o ninguna referencia ejecutable confirmada;
- el prototipo histórico no se adopta como arquitectura base del nuevo POS;
- se crearán tareas explícitas para auditar el prototipo y diseñar un POS integral nuevo;
- no se autoriza eliminar ningún artefacto durante E1;
- se reutilizan requisitos existentes;
- se derivan cuatro requisitos de prueba nuevos;
- no se modifica código ni Supabase.

---

#### 2. Regla de clasificación

Un artefacto se clasifica como **sin consumidor confirmado** cuando no se localiza una cadena demostrable como:

```text
entrada alcanzable
→ consumidor
→ invocación
→ resultado
```

Para código:

```text
ruta, import, registro, navegación, script o build
→ artefacto
```

Para datos:

```text
aplicación, RPC, trigger, vista, función, integración o proceso externo
→ objeto
```

Para scripts:

```text
package.json, workflow, hook, documentación operativa vigente o ejecución controlada
→ script
```

Estados de clasificación permitidos:

```text
CONSUMIDO_ACTUAL
CONSUMIDO_HISTORICO_DORMIDO
SIN_CONSUMIDOR_CONFIRMADO
CONSUMO_PARCIAL
CONSUMO_TRANSITIVO_HUERFANO
RESERVA_APROBADA
CONSUMIDOR_EXTERNO_PENDIENTE
NO_DETERMINADO
```

---

#### 3. “Sin consumidor” no significa “seguro para eliminar”

No se deberá eliminar un artefacto únicamente porque una búsqueda textual no encuentre referencias.

Antes de retirar deberá comprobarse:

1. imports estáticos;
2. imports dinámicos;
3. resolución por convención;
4. rutas de framework;
5. navegación;
6. registros en base de datos;
7. llamadas mediante URL;
8. RPC por nombre construido;
9. triggers;
10. funciones SQL;
11. vistas;
12. Edge Functions;
13. webhooks;
14. workflows;
15. scripts manuales aprobados;
16. clientes móviles;
17. consumidores externos;
18. ambientes y ramas;
19. datos históricos;
20. rollback.

También deberá distinguirse:

```text
existe en el código fuente
≠
está enlazado a una entrada
≠
fue incluido en el build
≠
es utilizado actualmente
```

---

#### 4. NEXO — fragmentos LPN sin recorrido consumidor completo

Artefactos revisados:

```text
src/features/inventory/lpns/lpn-create-form.tsx
src/app/inventory/lpns/page.tsx
src/app/api/inventory/lpns/route.ts
inventory_lpns
inventory_lpn_items
```

##### 4.1. Componente de creación

`LpnCreateForm` contiene:

- selector de sede;
- preview del código;
- `site_id`;
- acción de creación;
- botón “Crear LPN”.

La búsqueda del símbolo solo localizó su propio archivo.

No se localizó:

- importación;
- página que lo monte;
- server action conectada;
- entrada desde navegación;
- prueba;
- historia;
- uso desde otra aplicación.

**Clasificación:** `SIN_CONSUMIDOR_CONFIRMADO`.

##### 4.2. Ruta `/inventory/lpns`

La ruta existe, pero su única acción es:

```text
redirect("/inventory/stock")
```

El sincronizador de navegación la clasifica dentro de:

```text
NEVER_MENU_EXACT
```

Por tanto, no monta un flujo LPN ni promueve la pantalla como candidato de menú.

**Clasificación:** ruta técnica sin proceso LPN propio.

##### 4.3. Endpoint LPN

Existe:

```text
GET /api/inventory/lpns
```

El endpoint:

- autentica;
- consulta `inventory_lpns`;
- devuelve `id`, `code`, `site_id` y `created_at`.

No se localizó dentro de `vento-nexo` una referencia a:

```text
/api/inventory/lpns
```

No se descarta un consumidor externo, manual o futuro.

**Clasificación:** `CONSUMIDOR_EXTERNO_PENDIENTE`.

##### 4.4. Tablas LPN

`inventory_lpns` tiene al menos un consumidor de lectura mediante el endpoint.

`inventory_lpn_items` no presentó consumidor de aplicación localizado durante la búsqueda.

No se revisaron todavía exhaustivamente todas las dependencias SQL remotas.

**Clasificación:**

```text
inventory_lpns
→ CONSUMO_PARCIAL

inventory_lpn_items
→ SIN_CONSUMIDOR_DE_APLICACION_CONFIRMADO
```

##### 4.5. Conclusión

La capacidad LPN no está ausente por completo, pero sus piezas no forman una cadena utilizable:

```text
ruta
→ redirección

componente
→ sin montaje

endpoint
→ sin caller interno

tablas
→ sin ciclo funcional completo
```

Destinos:

- `NEXO-DOM-002` a `NEXO-DOM-008`;
- `NEXO-DOM-019` a `NEXO-DOM-024`;
- `NEXO-UX-026` a `NEXO-UX-040`;
- nueva tarea `SHELL-AUD-011`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-NEXO-004`.

No se crea un requisito LPN nuevo porque `TREQ-NEXO-004` ya exige el ciclo completo.

---

#### 5. PASS — cadena alternativa de seguimiento sin registro de navegación

Artefactos revisados:

```text
src/components/OrderTrackingScreen.tsx
src/components/OrderPlacedScreenLive.tsx
src/components/OrderPlacedScreen.tsx
App.js
```

##### 5.1. Navegación activa

`App.js` registra:

```text
OrderPlaced
→ OrderPlacedScreen
```

No registra:

```text
OrderTrackingScreen
OrderPlacedScreenLive
```

##### 5.2. Cadena alternativa

`OrderTrackingScreen` importa:

```text
OrderPlacedScreenLive
```

y agrega lógica de:

- estado de entrega;
- PIN de entrega;
- consulta de la orden;
- presentación del seguimiento.

La búsqueda de `OrderTrackingScreen` solo localizó su propio archivo y archivos de configuración, no un import o registro de pantalla.

`OrderPlacedScreenLive` tiene como consumidor localizado a `OrderTrackingScreen`.

Esto forma:

```text
OrderTrackingScreen
→ sin entrada localizada

OrderPlacedScreenLive
→ consumido solo por OrderTrackingScreen
```

**Clasificación:**

```text
OrderTrackingScreen
→ SIN_CONSUMIDOR_CONFIRMADO

OrderPlacedScreenLive
→ CONSUMO_TRANSITIVO_HUERFANO
```

##### 5.3. Riesgo

- dos implementaciones evolucionan por separado;
- correcciones de pagos o estados se aplican en una sola;
- una ruta profunda futura puede montar una pantalla no probada;
- código muerto sigue aumentando superficie de mantenimiento;
- eliminación impulsiva puede perder lógica útil de PIN o seguimiento.

##### 5.4. Destino

- `PASS-UX-001`;
- `PASS-UX-002`;
- `PASS-UX-006`;
- `PASS-UX-013`;
- nueva tarea `SHELL-AUD-011`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-PASS-007`.

No se ordena eliminar la cadena.

Primero deberá compararse contra el flujo canónico y decidir:

```text
integrar
fusionar
reemplazar
retirar
```

---

#### 6. PASS — export auxiliar sin consumidor localizado

Archivo:

```text
src/utils/site.ts
```

Export:

```text
clearSiteIdCache()
```

La búsqueda solo localizó la definición.

El módulo sí tiene consumidores reales para:

- `getCurrentSiteIdCached`;
- `getSiteIdByBusinessType`.

Por tanto, no se considera huérfano el archivo completo.

**Clasificación:** export individual sin consumidor confirmado.

Destino:

- nueva tarea `SHELL-AUD-011`;
- `PASS-UX-001`;
- `CODE-AUD-020`.

Prioridad: baja.

No genera requisito de prueba independiente.

---

#### 7. PULSO — antecedente histórico real en `vento-platform`

Repositorio:

```text
devVentoGroup/vento-platform
```

Ruta histórica:

```text
apps/vento-os/modules/pos
```

Entrada histórica:

```text
apps/vento-os/app/staff/pos/page.tsx
```

##### 7.1. Qué estaba realmente alcanzable

La página histórica importaba y utilizaba:

- `decodeQRCode`;
- `processRedemptionAction`;
- `awardPointsAction`;
- identificación de clientes;
- validación de canjes;
- otorgamiento manual de puntos.

La misma pantalla mostraba:

```text
Sistema POS (Próximamente)
```

con el control deshabilitado.

Por tanto, la entrada alcanzable era:

```text
scanner de cliente
+ loyalty
+ canjes
```

y no:

```text
POS completo
```

##### 7.2. Evidencia del build histórico

El manifest de rutas inspeccionado contenía:

```text
/staff/pos
```

pero no una segunda ruta para venta, caja, pagos o administración POS.

El manifest de server actions incluía para `/staff/pos`:

- `validateRedemption`;
- `processRedemptionAction`;
- `awardPointsAction`.

No incluía como acciones consumidas por esa ruta:

- `createOrderAction`;
- `processPaymentAction`.

Esto permite distinguir:

```text
acción presente en source
```

de:

```text
acción conectada al build alcanzable
```

##### 7.3. Documentación histórica inconsistente

Un documento histórico marcaba PULSO como:

```text
POS funcional
```

pero esa afirmación contradice:

- la pantalla que dice “Próximamente”;
- el manifest del build;
- las acciones realmente enlazadas.

La documentación histórica no se utilizará como prueba de capacidad.

**Clasificación:** documentación sobreestimada y obsoleta.

---

#### 8. PULSO histórico — acciones fuente dormidas y objetos referenciados

##### 8.1. `createOrderAction`

El archivo histórico:

```text
apps/vento-os/modules/pos/actions/create-order.action.ts
```

sí contiene lógica para:

- crear `orders`;
- crear `order_items`;
- consultar `pos_tables`;
- consultar o crear `pos_sessions`;
- insertar `pos_session_orders`.

Sin embargo:

- no aparece conectado a la ruta POS compilada inspeccionada;
- usa pasos sucesivos;
- aplica eliminaciones compensatorias manuales;
- utiliza bypass administrativo para owner;
- no falla la orden si falla la creación de sesión;
- no falla la orden si falla `pos_session_orders`;
- deja un `TODO` para cursos;
- no demuestra idempotencia;
- no demuestra concurrencia de mesa;
- no demuestra cierre de sesión;
- no demuestra split, merge, transferencia o corrección.

**Clasificación de consumidor:** `CONSUMIDO_HISTORICO_DORMIDO`.

##### 8.2. `processPaymentAction`

El archivo histórico:

```text
apps/vento-os/modules/pos/actions/process-payment.action.ts
```

sí invoca:

```text
process_order_payment
```

pero tampoco aparece conectado a la ruta POS compilada inspeccionada.

Además, su comentario afirma que la RPC crea movimientos de inventario.

La RPC actual inspeccionada:

- actualiza la orden;
- inserta `pos_payments`;
- actualiza puntos;
- inserta `loyalty_transactions`;
- no crea movimientos de inventario.

Por tanto, el comentario y la implementación real divergen.

**Clasificación de consumidor:** `CONSUMIDO_HISTORICO_DORMIDO`.

##### 8.3. Datos mock

`types.ts` mezcla:

- tipos de tablas reales;
- modelos de orden;
- tipos de caja y pagos;
- mesas, zonas y cursos;
- datos mock;
- menú con precios de demostración;
- meseros ficticios;
- órdenes mock;
- modificadores mock.

La coexistencia de tipos y mocks confirma que el módulo era una combinación de:

```text
prototipo visual
+ contratos tentativos
+ acciones parciales
+ scanner real
```

No constituye una arquitectura POS aprobada.

---

#### 9. Matriz real de consumidores POS

| Objeto o capacidad            | Consumidor histórico en `vento-platform` | Conectado al build POS histórico inspeccionado | Consumidor actual en `vento-pulso`     | Clasificación                             |
| ----------------------------- | ---------------------------------------- | ---------------------------------------------: | -------------------------------------- | ----------------------------------------- |
| identificación QR de cliente  | sí                                       |                                             sí | sí, mediante scanner actual            | `CONSUMIDO_ACTUAL`                        |
| canje PASS                    | sí                                       |                                             sí | sí                                     | `CONSUMIDO_ACTUAL`                        |
| otorgamiento manual de puntos | sí                                       |                                             sí | sí, con implementación actual distinta | `CONSUMIDO_ACTUAL`                        |
| `orders` y `order_items`      | `createOrderAction`                      |                                  no confirmado | sí, órdenes operativas y PASS          | dominio activo, creación POS no conectada |
| `pos_zones`                   | tipos y prototipo                        |                                  no confirmado | sí, salón                              | `CONSUMIDO_ACTUAL`                        |
| `pos_tables`                  | `createOrderAction`                      |                                             no | sí, salón                              | `CONSUMIDO_ACTUAL`                        |
| `pos_sessions`                | `createOrderAction`                      |                                             no | sí, salón                              | `CONSUMIDO_ACTUAL`                        |
| `pos_table_service_calls`     | no corresponde al prototipo inicial      |                                             no | sí, salón                              | `CONSUMIDO_ACTUAL`                        |
| `pos_session_orders`          | `createOrderAction`                      |                                             no | no localizado en aplicación actual     | `CONSUMIDO_HISTORICO_DORMIDO`             |
| `process_order_payment`       | `processPaymentAction`                   |                                             no | no localizado                          | `CONSUMIDO_HISTORICO_DORMIDO`             |
| `pos_payments`                | indirectamente mediante RPC              |                                             no | no localizado                          | `CONSUMIDO_HISTORICO_DORMIDO`             |
| `pos_cash_shifts`             | tipo declarado                           |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_cash_movements`          | tipo declarado                           |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_modifiers`               | tipo y mock                              |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_modifier_options`        | tipo y mock                              |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_product_modifiers`       | tipo declarado                           |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_order_item_modifiers`    | tipo declarado                           |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |

Esta matriz reemplaza la conclusión simplificada de que todos los objetos POS estaban completamente huérfanos.

---

#### 10. Decisión canónica sobre el nuevo POS

El POS nuevo **no se basará en el modelo histórico**.

El prototipo de `vento-platform` se utilizará únicamente como:

- inventario forense;
- referencia de necesidades detectadas;
- fuente de piezas puntuales reutilizables;
- evidencia de contratos y datos que ya pudieron crearse;
- insumo para migración o retiro.

No se reutilizará automáticamente:

- esquema;
- nombres de estados;
- acciones;
- componentes;
- tipos;
- cálculos;
- RPC;
- reglas de autorización;
- modelos de mesa;
- modelo de caja;
- modelo de pago;
- mocks;
- flujos visuales.

Cada pieza deberá clasificarse como:

```text
REUTILIZAR
ADAPTAR
REESCRIBIR
REEMPLAZAR
RETIRAR
CONSERVAR_SOLO_COMO_HISTORIA
```

---

#### 11. Alcance mínimo del POS integral objetivo

La arquitectura nueva deberá diseñar, como mínimo, los siguientes dominios.

##### 11.1. Venta, cuenta y pedido

- orden comercial;
- cuenta o check;
- líneas;
- snapshots de producto, nombre, precio e impuesto;
- asientos;
- cursos;
- notas;
- modificadores;
- combos;
- cantidades;
- estados;
- canales;
- consumo en mesa;
- mostrador;
- recogida;
- domicilio;
- pedidos programados;
- venta rápida;
- venta sin cliente;
- cliente identificado.

##### 11.2. Salón

- sedes;
- zonas;
- mesas;
- capacidad;
- estado derivado;
- sesión de servicio;
- mesero responsable;
- transferencia;
- unión y separación de mesas;
- apertura y cierre;
- cambio de mesa;
- cuentas simultáneas;
- llamados;
- reservas futuras si se aprueban.

##### 11.3. Menú, disponibilidad y precios

- catálogo vendible por sede;
- horarios;
- canal;
- lista de precios;
- impuestos;
- cargos de servicio;
- disponibilidad;
- agotados;
- modificadores;
- opciones obligatorias;
- sustituciones;
- promociones;
- descuentos;
- autorizaciones;
- cortesías;
- precio manual controlado.

##### 11.4. Cocina, barra y despacho

- estaciones;
- routing por producto;
- comandas;
- impresoras;
- KDS;
- fire;
- hold;
- cursos;
- prioridades;
- reimpresión;
- recall;
- preparación parcial;
- listo;
- entregado;
- trazabilidad de actor y tiempos.

##### 11.5. Pagos

- intención de pago;
- tender;
- efectivo;
- tarjeta;
- transferencia;
- bono;
- crédito aprobado;
- pago mixto;
- pago parcial;
- propina;
- vuelto;
- referencia;
- autorización;
- captura;
- fallo;
- reversión;
- devolución;
- reembolso;
- chargeback cuando aplique;
- conciliación.

##### 11.6. Caja

- terminal;
- cajón;
- turno de caja;
- apertura;
- fondo inicial;
- ingresos;
- egresos;
- retiros;
- consignaciones;
- arqueos;
- conteos;
- cierre;
- diferencia;
- aprobación;
- reapertura controlada;
- reporte por actor, terminal y sede.

##### 11.7. Integraciones

- NEXO para inventario;
- PASS para cliente, acumulación y redención;
- NUMERA para hechos económicos y conciliación;
- facturación electrónica;
- impresión;
- dispositivos compartidos;
- periféricos;
- notificaciones;
- delivery;
- KDS;
- reporting.

##### 11.8. Integridad técnica

- comandos de servidor;
- transacciones atómicas;
- idempotency key;
- control de concurrencia;
- ledger financiero inmutable;
- correcciones compensatorias;
- outbox de eventos;
- reintentos;
- operación offline o degradada;
- recuperación;
- observabilidad;
- auditoría;
- RLS;
- autorización atómica;
- actor real;
- sede;
- área;
- turno;
- dispositivo;
- versionado de contratos.

##### 11.9. Principio de separación

La arquitectura deberá decidir explícitamente la relación entre:

```text
orders
pos_sessions
cuentas/checks
pagos
turnos de caja
movimientos de inventario
hechos económicos
```

No se asumirá que:

```text
una orden
=
una cuenta
=
un pago
=
una mesa
```

---

#### 12. PULSO — scripts manuales sin integración actual confirmada

Se localizaron scripts como:

```text
scripts/apply-orders-chat-inbox-mount.py
scripts/apply-order-modal-operational-improvements.py
scripts/run-order-modal-operational-improvements.py
scripts/apply-electronic-billing-ui.mjs
```

El `package.json` actual contiene únicamente:

```text
dev
build
start
lint
audit:i18n
```

No contiene:

- `predev`;
- `prebuild`;
- `postinstall`;
- comando de parche;
- comando de migración de UI.

El runner inspeccionado:

- abre otro script;
- cambia el target desde el tablero actual al tablero legacy;
- compila y ejecuta el código modificado.

**Clasificación:** `SIN_CONSUMIDOR_AUTOMATICO_CONFIRMADO`.

No se puede afirmar que nunca sea ejecutado manualmente.

Destinos:

- nueva tarea `SHELL-AUD-011`;
- `PULSO-UX-001`;
- `PULSO-UX-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-PULSO-002`.

---

#### 13. Falsos positivos excluidos

##### 13.1. `pos_tables`, `pos_zones` y `pos_sessions`

Tienen consumidores actuales confirmados en PULSO salón.

**Clasificación:** `CONSUMIDO_ACTUAL`.

##### 13.2. `pos_table_service_calls`

Tiene consumidor actual y Realtime.

No pertenece al prototipo POS inicial.

**Clasificación:** `CONSUMIDO_ACTUAL`.

##### 13.3. `process_order_payment`

No está completamente “sin consumidor histórico”.

Tiene un caller en código fuente archivado.

Su clasificación correcta es:

```text
CONSUMIDOR_HISTORICO_DORMIDO
+
SIN_CALLER_ACTUAL_LOCALIZADO
```

##### 13.4. `pos_session_orders`

Tiene escritor en una acción histórica dormida.

No tiene consumidor actual localizado.

##### 13.5. Bridges de órdenes PULSO

Se confirmaron consumidores para:

```text
OrdersLiveBridge
DeliveryOverrideBridge
DeliveryDispatchBridge
```

desde `page.tsx` o `layout.tsx`.

**Clasificación:** `CONSUMIDO_ACTUAL`.

##### 13.6. Rutas Next.js

Un `page.tsx` es una entrada por convención aunque no aparezca en búsqueda textual.

La auditoría diferencia:

```text
ruta existente
ruta compilada
ruta promovida
ruta enlazada
ruta funcional
```

##### 13.7. Migraciones

Las migraciones aplicadas son historial reproducible.

No se eliminan por no ser importadas desde TypeScript.

##### 13.8. `app_screen_registry`

Tiene productor desde el sincronizador y consumidor administrativo en VISO.

**Clasificación:** `CONSUMIDO_ACTUAL`.

---

#### 14. Cobertura por repositorio

| Repositorio      | Resultado                                                                                                                    |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `vento-shell`    | conserva objetos POS con consumidores actuales, históricos dormidos y no confirmados; E3 decidirá fuente, migración o retiro |
| `vento-platform` | prototipo histórico archivado; scanner/loyalty alcanzable, POS completo no conectado                                         |
| `vento-viso`     | no se confirma artefacto huérfano nuevo; consume `app_screen_registry`                                                       |
| `vento-nexo`     | componente LPN sin montaje, ruta redirigida, endpoint sin caller interno y consumo LPN incompleto                            |
| `vento-fogo`     | no se confirma huérfano nuevo durante este corte                                                                             |
| `vento-origo`    | no se confirma huérfano nuevo durante este corte                                                                             |
| `vento-pulso`    | salón y órdenes activos; POS integral ausente; scripts manuales sin integración; varios objetos sin consumidor actual        |
| `vento-numera`   | no se confirma huérfano nuevo durante este corte                                                                             |
| `Vento-Group`    | no se confirma huérfano nuevo durante este corte                                                                             |
| `vento-anima`    | no se confirma huérfano nuevo durante este corte                                                                             |
| `vento-pass`     | cadena alternativa de seguimiento desconectada y export auxiliar sin consumidor                                              |
| `vento-talento`  | producto futuro; ausencia de navegación productiva no equivale a código muerto                                               |
| `vento-vital`    | fuera de Vento OS                                                                                                            |

“No se confirma huérfano nuevo” no equivale a certificación de ausencia.

---

#### 15. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                  | Clasificación                        | Destino                                                               |
| ---------------- | ----------------------------------------------------------------------------------------- | ------------------------------------ | --------------------------------------------------------------------- |
| `H-CODE-015-001` | `LpnCreateForm` no tiene importación o montaje localizado                                 | `SIN_CONSUMIDOR_CONFIRMADO`          | `NEXO-DOM-*`, `NEXO-UX-026` a `040`, `SHELL-AUD-011`, `TREQ-NEXO-004` |
| `H-CODE-015-002` | `/inventory/lpns` solo redirige a stock                                                   | ruta sin proceso propio              | mismo destino                                                         |
| `H-CODE-015-003` | el sincronizador excluye `/inventory/lpns` del menú                                       | no promovida                         | mismo destino                                                         |
| `H-CODE-015-004` | `GET /api/inventory/lpns` no tiene caller interno localizado                              | `CONSUMIDOR_EXTERNO_PENDIENTE`       | `SHELL-AUD-011`, `SUPA-AUD-022`, `023`                                |
| `H-CODE-015-005` | `inventory_lpn_items` no tiene consumidor de aplicación localizado                        | objeto sin consumidor app confirmado | `SUPA-AUD-019`, `022`, `023`, `TREQ-SUPABASE-003`                     |
| `H-CODE-015-006` | `OrderTrackingScreen` no está registrado ni importado por la navegación activa            | `SIN_CONSUMIDOR_CONFIRMADO`          | `PASS-UX-001`, `002`, `006`, `013`, `SHELL-AUD-011`, `TREQ-PASS-007`  |
| `H-CODE-015-007` | `OrderPlacedScreenLive` solo es consumido por una pantalla desconectada                   | `CONSUMO_TRANSITIVO_HUERFANO`        | mismo destino                                                         |
| `H-CODE-015-008` | `clearSiteIdCache` no tiene consumidor localizado                                         | export huérfano de baja prioridad    | `SHELL-AUD-011`, `CODE-AUD-020`                                       |
| `H-CODE-015-009` | scripts manuales PULSO no están conectados a comandos actuales                            | sin consumidor automático confirmado | `SHELL-AUD-011`, `PULSO-UX-019`, `CODE-AUD-020`                       |
| `H-CODE-015-010` | la ruta POS histórica solo consumía scanner, loyalty y canjes                             | prototipo parcial alcanzable         | `PULSO-UX-020`, `PULSO-UX-021`, `TREQ-PULSO-003`                      |
| `H-CODE-015-011` | `createOrderAction` existe, pero no estaba conectada al build POS inspeccionado           | consumidor histórico dormido         | `PULSO-UX-020`, `SUPA-AUD-022`, `023`                                 |
| `H-CODE-015-012` | `processPaymentAction` llama la RPC, pero no estaba conectada al build POS inspeccionado  | consumidor histórico dormido         | mismo destino                                                         |
| `H-CODE-015-013` | el comentario de pago afirma movimientos de inventario que la RPC inspeccionada no crea   | contrato divergente                  | `PULSO-UX-020`, `PULSO-UX-021`, `TREQ-PULSO-003`                      |
| `H-CODE-015-014` | tipos reales, mocks y contratos tentativos están mezclados en el módulo histórico         | prototipo no canónico                | `PULSO-UX-020`, `PULSO-UX-021`                                        |
| `H-CODE-015-015` | `pos_zones`, `pos_tables` y `pos_sessions` sí tienen consumidores actuales                | falso positivo corregido             | cerrado                                                               |
| `H-CODE-015-016` | `pos_session_orders`, `pos_payments` y la RPC tienen consumo histórico dormido, no actual | clasificación corregida              | `SUPA-AUD-022`, `023`, `TREQ-SUPABASE-003`                            |
| `H-CODE-015-017` | caja y modificadores no tienen consumidor ejecutable actual o histórico confirmado        | objeto sin consumidor confirmado     | `PULSO-UX-020`, `PULSO-UX-021`, `SUPA-AUD-022`, `023`                 |
| `H-CODE-015-018` | una búsqueda textual no prueba ausencia de consumidores dinámicos o externos              | regla de seguridad                   | `SHELL-AUD-011`, `TREQ-SHELL-004`                                     |
| `H-CODE-015-019` | no se confirma un nuevo huérfano en VISO, FOGO, ORIGO, NUMERA, ANIMA o Vento Group        | límite de evidencia                  | continuar `CODE-AUD-016` a `020`                                      |

Todos los hallazgos quedan cerrados o vinculados a tareas concretas.

---

#### 16. Tareas nuevas propuestas

##### 16.1. Fundación compartida

Agregar:

```md
### [ ] SHELL-AUD-011 — Clasificar y retirar rutas, componentes, funciones, scripts y endpoints sin consumidores confirmados
```

La tarea deberá:

- generar inventario;
- registrar evidencia de consumidor;
- distinguir uso estático, dinámico, por convención y externo;
- clasificar conservar, integrar, fusionar, reemplazar o retirar;
- verificar impacto;
- ejecutar eliminación mediante PR;
- exigir build, typecheck, lint y pruebas;
- conservar rollback;
- actualizar documentación y navegación.

##### 16.2. PULSO

Agregar:

```md
### [ ] PULSO-UX-020 — Auditar el prototipo POS histórico de vento-platform y clasificar cada pieza como reutilizable, adaptable o descartable
### [ ] PULSO-UX-021 — Diseñar la arquitectura funcional y técnica del POS integral objetivo sin heredar como contrato el prototipo histórico
```

`PULSO-UX-020` deberá producir una matriz por:

- pantalla;
- componente;
- acción;
- función;
- tabla;
- vista;
- RPC;
- estado;
- permiso;
- integración;
- dato existente.

`PULSO-UX-021` deberá definir:

- dominios;
- agregados;
- estados;
- comandos;
- eventos;
- ownership;
- atomicidad;
- idempotencia;
- concurrencia;
- offline;
- auditoría;
- integraciones;
- interfaces operativas;
- pruebas;
- estrategia de migración.

No se crea ninguna otra tarea nueva.

---

#### 17. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 17.1. Requisitos reutilizados

- `TREQ-NEXO-004`;
- `TREQ-PULSO-001`;
- `TREQ-PULSO-002`;
- `TREQ-SHELL-002`;
- `TREQ-SUPABASE-001`;
- `TREQ-SUPABASE-002`.

No se cambia su estado.

##### 17.2. Requisitos nuevos

###### `TREQ-SHELL-004`

Ninguna ruta, componente, función, script o endpoint podrá retirarse por “no usado” sin evidencia reproducible que cubra imports estáticos y dinámicos, convenciones de framework, navegación, scripts, CI, consumidores externos y ambientes; el retiro deberá superar build, typecheck, lint y pruebas aplicables.

###### `TREQ-PASS-007`

El retorno de pago y el seguimiento de un pedido deberán abrir una única experiencia canónica; cualquier pantalla alternativa deberá integrarse con paridad demostrada o retirarse, y ninguna cadena transitivamente huérfana podrá permanecer como implementación paralela sin decisión explícita.

###### `TREQ-SUPABASE-003`

Ninguna tabla, vista, función, RPC, trigger, política, publicación o bucket podrá eliminarse o declararse operativo sin un mapa verificable de propietarios, consumidores directos, dependencias SQL, consumidores externos, datos existentes, reemplazo y puerta de retiro.

###### `TREQ-PULSO-003`

Ninguna pieza del prototipo POS histórico podrá incorporarse al POS objetivo por la sola existencia de código, tablas o datos; deberá demostrar ajuste al proceso aprobado, contrato canónico, seguridad, atomicidad, idempotencia, concurrencia, recuperación, auditoría, integraciones y pruebas, o deberá adaptarse, reemplazarse o descartarse.

Las filas completas se entregan fuera de esta tarea para agregarlas únicamente al registro `04A`.

---

#### 18. Decisiones propuestas

1. “Sin referencia textual” no equivaldrá a “seguro para eliminar”.
2. Se distinguirán consumidores actuales, históricos dormidos, dinámicos, SQL y externos.
3. `LpnCreateForm` se clasifica como sin consumidor confirmado.
4. `/inventory/lpns` no se considera una superficie LPN funcional.
5. El endpoint LPN queda pendiente de confirmar consumidor externo.
6. `inventory_lpns` no se considera completamente huérfana.
7. `inventory_lpn_items` requiere mapa SQL y funcional.
8. `OrderTrackingScreen` se clasifica como desconectada.
9. `OrderPlacedScreenLive` se clasifica como huérfano transitivo.
10. Los scripts PULSO se clasifican como manuales sin integración actual confirmada.
11. `vento-platform` se reconoce como antecedente histórico real.
12. Su ruta POS alcanzable se clasifica como scanner, loyalty y canjes.
13. `createOrderAction` y `processPaymentAction` se clasifican como código histórico dormido.
14. `pos_zones`, `pos_tables`, `pos_sessions` y `pos_table_service_calls` se reconocen como consumidos actualmente.
15. `pos_session_orders`, `pos_payments` y `process_order_payment` tienen antecedente histórico, pero no caller actual localizado.
16. Caja y modificadores no tienen consumidor ejecutable confirmado.
17. El documento histórico que decía “POS funcional” no prevalece sobre el código.
18. El prototipo histórico no será arquitectura base.
19. Solo se rescatarán piezas aprobadas mediante matriz explícita.
20. El POS objetivo se diseñará desde cero como sistema integral.
21. Se crean `SHELL-AUD-011`, `PULSO-UX-020` y `PULSO-UX-021`.
22. Se derivan cuatro requisitos de prueba.
23. No se modifica código.
24. No se modifica Supabase.
25. `CODE-AUD-016` será la única continuidad inmediata.

---

#### 19. Límites de certeza

Esta tarea no confirma:

- que un endpoint sin caller interno no tenga consumidor externo;
- que un script no sea ejecutado manualmente;
- que una tabla sin referencia TypeScript no tenga trigger, vista o función;
- que el manifest inspeccionado represente todos los builds históricos;
- que ninguna rama histórica haya conectado las acciones POS;
- que el índice de búsqueda incluya todas las ramas;
- que todos los objetos remotos correspondan al repositorio;
- que los objetos POS existentes deban conservar su diseño;
- que todos los huérfanos hayan sido detectados;
- que un artefacto clasificado pueda eliminarse inmediatamente.

E3 deberá inspeccionar el Supabase remoto y sus dependencias antes de migrar o retirar objetos.

---

#### 20. Criterios de aceptación

`CODE-AUD-015` podrá aprobarse cuando:

- exista definición de consumidor;
- se distinga ausencia confirmada de incertidumbre;
- LPN quede evaluado por ruta, componente, endpoint y tablas;
- PASS seguimiento alternativo quede evaluado;
- los scripts PULSO queden evaluados;
- `vento-platform` quede reconocido como prototipo histórico;
- se diferencie código fuente dormido de consumidor compilado;
- cada objeto POS tenga clasificación individual;
- los objetos usados por salón queden excluidos como huérfanos;
- el prototipo histórico no se adopte como contrato;
- se materialicen `SHELL-AUD-011`, `PULSO-UX-020` y `PULSO-UX-021`;
- se identifiquen los cuatro requisitos nuevos;
- no se autorice eliminación durante E1;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-016` permanezca como continuidad inmediata.

---

#### 21. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
artefacto
→ consumidor actual o histórico
→ alcanzabilidad
→ clasificación
→ propietario
→ conservar / rescatar / adaptar / reemplazar / retirar
→ pruebas
→ cambio controlado
```

Para PULSO:

```text
prototipo histórico
→ auditoría de rescate
→ proceso empresarial objetivo
→ arquitectura POS nueva
→ contratos canónicos
→ implementación progresiva
```

La continuidad será:

```text
CODE-AUD-016
— Revisar estado de build, lint, typecheck y pruebas
```


### ✅ CODE-AUD-016 — Ejecutar build, lint, tipos y pruebas disponibles por repositorio

**Estado:** APROBADO
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

| Repositorio       | Build o smoke build                | Typecheck                            | Lint                                       | Pruebas disponibles      | Resultado de corte                                     |
| ----------------- | ---------------------------------- | ------------------------------------ | ------------------------------------------ | ------------------------ | ------------------------------------------------------ |
| `vento-anima`     | ✅ export Android                   | ✅                                    | No declara script                          | No declara script        | validación local disponible aprobada                   |
| `vento-fogo`      | ✅                                  | ✅                                    | ✅ 8 warnings, 0 errores                    | No declara script        | build y tipos aprobados; deuda no bloqueante           |
| `vento-group-web` | ✅ después de instalar dependencias | ✅ después de instalar dependencias   | ❌ `next lint` no es compatible con Next 16 | No declara script        | build y tipos aprobados; herramienta de lint bloqueada |
| `vento-nexo`      | ❌                                  | ❌                                    | ❌ 54 errores, 128 warnings                 | No declara script        | bloqueo de tipos/build y deuda de lint                 |
| `vento-numera`    | ✅ después de instalar dependencias | ✅                                    | ✅                                          | No declara script        | validación local disponible aprobada                   |
| `vento-origo`     | ✅                                  | ✅                                    | ❌ 4 errores, 5 warnings                    | No declara script        | deuda de lint bloqueante                               |
| `vento-pass`      | ✅ export Android                   | ✅                                    | No declara script                          | No declara script        | validación local disponible aprobada                   |
| `vento-pulso`     | ✅                                  | ✅                                    | ❌ 20 errores                               | No declara script        | deuda de lint bloqueante                               |
| `vento-shell`     | ✅                                  | ✅                                    | ❌ 10 errores, 7 warnings                   | No declara script        | deuda de lint bloqueante                               |
| `vento-talento`   | ✅ export Android                   | ✅                                    | No declara script                          | No declara script        | validación local disponible aprobada                   |
| `vento-viso`      | ✅                                  | ✅                                    | ❌ 17 errores, 35 warnings                  | No declara script        | deuda de lint bloqueante                               |
| `vento-vital`     | No declara build raíz ejecutable   | No declara typecheck raíz ejecutable | No declara script                          | ✅ 13 de 13 contratos API | pruebas contractuales aprobadas                        |

`vento-vital` conserva estructura monorepo con scripts de build móvil remotos; no se ejecutaron porque son EAS/producción y no constituyen una prueba local disponible equivalente.

---

#### 4. Hallazgos confirmados

| ID               | Hallazgo                                                                                                                                                                                                                                                                                                     | Evidencia reproducida                                                                                                                                                                               | Impacto                                                                                                                                         | Destino obligatorio                    |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| `H-CODE-016-001` | Vento Group Web declara `lint=next lint`, pero Next 16 interpreta `lint` como directorio y no ejecuta análisis.                                                                                                                                                                                              | `npm run lint` termina con código 1: `Invalid project directory ... vento-group-web\\lint`. Build y tipos pasan tras sincronizar dependencias.                                                      | La calidad estática de este repositorio no tiene puerta ejecutable.                                                                             | `CODE-AUD-020` y `QA-REG-001`          |
| `H-CODE-016-002` | NEXO no puede completar typecheck ni build por una API de hoja de cálculo no presente en el tipo instalado.                                                                                                                                                                                                  | `src/app/api/inventory/catalog/export-suppliers/route.ts:423`: `Property 'dataValidations' does not exist on type 'Worksheet'`.                                                                     | La aplicación no tiene build de producción verificable.                                                                                         | `CODE-AUD-020` y `QA-REG-001`          |
| `H-CODE-016-003` | Cinco repositorios tienen errores de lint bloqueantes.                                                                                                                                                                                                                                                       | NEXO: 54; ORIGO: 4; PULSO: 20; SHELL: 10; VISO: 17.                                                                                                                                                 | La puerta estática no es verde aunque varios builds y tipos pasen.                                                                              | `CODE-AUD-020` y `QA-REG-001`          |
| `H-CODE-016-004` | FOGO pasa lint con deuda no bloqueante.                                                                                                                                                                                                                                                                      | 8 warnings y 0 errores.                                                                                                                                                                             | La puerta actual permite el build, pero la deuda debe priorizarse antes de endurecer CI.                                                        | `CODE-AUD-020`                         |
| `H-CODE-016-005` | NUMERA no tenía dependencias instaladas al inicio del corte; después de `npm install` pasa build, tipos y lint. La instalación reporta 8 vulnerabilidades y scripts de `sharp` y `unrs-resolver` pendientes de aprobación. Vento Group Web también reporta 4 vulnerabilidades y script de `sharp` pendiente. | `npm install` completado en ambos repositorios; no cambió el manifiesto.                                                                                                                            | La reproducibilidad local depende de instalar y revisar dependencias; los avisos no se deben resolver automáticamente mediante `npm audit fix`. | `CODE-AUD-020`                         |
| `H-CODE-016-006` | La mayor parte de los repositorios no declara pruebas automatizadas y los clientes Expo no declaran lint o build local en scripts.                                                                                                                                                                           | Solo VITAL declara y ejecuta pruebas: 13/13 contratos API. ANIMA, PASS y TALENTO solo aportan export Android y tipos; FOGO, Group Web, NEXO, NUMERA, ORIGO, PULSO, SHELL y VISO no declaran `test`. | La evidencia de build no protege regresiones de proceso, autorización o integración.                                                            | `QA-REG-001` después de `CODE-AUD-020` |

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


### ✅ CODE-AUD-017 — Auditar autorización, validación de servidor y exposición de datos

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de autorización efectiva, límites privilegiados, RLS, grants, contratos de servidor y exposición de datos  
**Dependencia anterior:** `CODE-AUD-016` — APROBADA  
**Continuidad reservada:** `CODE-AUD-018`  
**Fecha de corte:** 2026-07-24  
**Proyecto Supabase comprobado:** `vento-os-dev` (`clzdpinthhtknkmefsxx`)  
**Cambios en código, CI, despliegues o Supabase:** no realizados. Las consultas remotas fueron de solo lectura; no se invocaron mutaciones, RPC operativas, Edge Functions, webhooks, jobs ni enlaces productivos.

---

#### 1. Resultado de esta tarea

Esta tarea contrasta las protecciones declaradas en código con la autorización que realmente aplican las fronteras de servidor y Supabase:

```text
actor autenticado o enlace externo
→ entrada de aplicación, API, Edge Function o RPC
→ validación de identidad
→ permiso y alcance territorial
→ política RLS, grant o privilegio elevado
→ columnas y datos efectivamente accesibles
→ efecto autorizado o denegación
```

La auditoría identifica tres categorías:

1. **fallos confirmados**, porque la combinación vigente de código, grants, políticas o funciones permite una acción más amplia que el contrato empresarial;
2. **controles condicionales o fail-open**, porque la protección depende de que exista un secreto y, si falta, la ejecución continúa;
3. **controles correctos localizados**, que se conservan para evitar falsos positivos y para usarlos como referencia de implementación.

Resultado consolidado:

| Clasificación                     | Cantidad |
| --------------------------------- | -------: |
| hallazgos críticos confirmados    |    **3** |
| hallazgos altos confirmados       |    **8** |
| controles condicionales fail-open |    **3** |
| hallazgos medios o de gobierno    |    **3** |
| controles positivos explícitos    |    **6** |

Los hallazgos críticos confirmados son:

1. la aceptación de invitaciones laborales permite que el cuerpo enviado por el cliente proponga `role` y `site_id`, y después usa `service_role` para materializarlos en `employees`;
2. `public.users` permite que cada usuario autenticado actualice su propia fila completa, incluyendo campos que no deben ser autoadministrables como `loyalty_points`, `role` e `is_active`;
3. `pass.loyalty_transactions` permite inserciones directas del propio usuario y un trigger `SECURITY DEFINER` aplica `points_delta` al saldo de `public.users`.

Estos tres hallazgos constituyen bloqueos de seguridad. No deberán esperar a una remodelación visual ni a una prueba operativa para ser reconocidos.

---

#### 2. Alcance y fuentes contrastadas

La auditoría revisó:

- políticas RLS de tablas críticas;
- grants de `anon`, `authenticated` y `service_role`;
- columnas y constraints relevantes;
- funciones `SECURITY DEFINER`;
- permisos `EXECUTE`;
- vistas con y sin `security_invoker`;
- buckets y políticas de `storage.objects`;
- configuración `verify_jwt` de las 24 Edge Functions activas;
- fuente remota de Edge Functions sin código local canónico;
- Server Actions y rutas que construyen clientes privilegiados;
- contratos de perfil, fidelización, documentos, compras, pedidos, dispositivos y asistencia;
- búsquedas de secretos literales en los repositorios;
- visibilidad de repositorios;
- decisiones aprobadas en `CODE-AUD-001` a `CODE-AUD-016`.

Se excluyeron:

- VITAL, salvo para conservar su separación;
- AURA, porque no existe implementación;
- explotación activa;
- lectura o descarga de objetos de Storage;
- intentos de escalamiento;
- creación de usuarios, invitaciones, transacciones, redenciones, órdenes o documentos;
- ejecución de funciones sin JWT;
- inspección del valor de secretos remotos.

La ausencia de una prueba ofensiva no reduce la certeza cuando el defecto se demuestra directamente por código, grants y política vigente.

---

#### 3. Estados de certeza

| Estado                     | Significado                                                               |
| -------------------------- | ------------------------------------------------------------------------- |
| `CONFIRMADO`               | la definición vigente permite o expone el comportamiento                  |
| `CONDICIONAL`              | el riesgo depende de configuración o secreto no inspeccionado             |
| `CONTROL_PRESENTE`         | existe autenticación o autorización explícita suficiente a nivel estático |
| `REQUIERE_PRUEBA_NEGATIVA` | el contrato parece correcto, pero debe ejecutarse con actores denegados   |
| `GOBIERNO`                 | requiere decisión de visibilidad, propiedad, versionado o retiro          |
| `FUERA_DE_ALCANCE`         | no pertenece a Vento OS o no existe implementación                        |

Ningún hallazgo se clasifica solo por el nombre de una función, tabla, rol o política.

---

#### 4. Escalamiento de privilegios durante la aceptación de invitaciones

La Edge Function `staff-invitations-accept`:

1. valida que exista un usuario autenticado;
2. acepta `role` y `site_id` desde el cuerpo enviado por el cliente o desde `user_metadata`;
3. comprueba únicamente que el rol y la sede existan y estén activos;
4. actualiza `auth.users.user_metadata`;
5. hace `upsert` de `employees` con ese rol y esa sede;
6. crea o actualiza la sede primaria del trabajador;
7. intenta marcar una invitación como aceptada después de materializar la identidad laboral.

No existe una lectura previa obligatoria de una invitación pendiente, vigente, vinculada al correo o usuario, cuyo rol y sede sean la única fuente aceptada.

Consecuencia:

```text
usuario autenticado
→ propone role y site_id
→ función valida existencia, no asignación
→ service_role materializa employees.role y employees.site_id
```

Clasificación: **CRÍTICA — CONFIRMADA**.

El contrato correcto deberá ser:

```text
token o sesión autenticada
→ invitación pendiente y vigente localizada en servidor
→ identidad, rol, sede y demás alcance tomados de la invitación
→ consumo atómico de la invitación
→ creación laboral
→ imposibilidad de elevar o sustituir valores desde el cliente
```

Destinos obligatorios:

- `ANIMA-AUTH-019 — Evitar que ANIMA otorgue permisos directamente`;
- `ANIMA-AUTH-020 — Mantener Supabase como fuente de verdad`;
- `AUTH-SRV-004 — Eliminar confianza exclusiva en la interfaz`;
- `AUTH-SRV-005 — Validar permiso en cada escritura`;
- `AUTH-SRV-006 — Validar sede en cada escritura`;
- `SUPA-AUD-010 — Auditar Auth, usuarios, identidades, sesiones y vínculos empresariales`;
- `SUPA-AUD-011 — Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema`;
- `AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección`;
- `AUTH-DB-004 — Reducir grants innecesarios de authenticated`;
- `CODE-AUD-020`;
- `TREQ-AUTH-005`.

**Puerta inmediata propuesta:** no ampliar el flujo de invitaciones a nuevos actores hasta que el rol y la sede queden vinculados en servidor a una invitación válida.

---

#### 5. Autoadministración excesiva de `public.users`

La tabla `public.users` contiene, entre otros:

- identidad y contacto;
- documento;
- fecha de nacimiento;
- correo;
- `role`;
- `is_active`;
- `loyalty_points`;
- preferencias y metadatos.

La combinación vigente es:

```text
grant UPDATE para authenticated
+
users_update_self
USING id = auth.uid()
WITH CHECK id = auth.uid()
```

La política restringe la fila, pero no las columnas. Por tanto, el propietario de la fila puede enviar una actualización que incluya campos no autoadministrables.

El código legítimo de PASS solo necesita modificar un subconjunto de perfil:

- `full_name`;
- `document_id`;
- `phone`;
- `birth_date`.

Ese caso no justifica conceder actualización general sobre toda la fila.

Clasificación:

- modificación de `loyalty_points`: **CRÍTICA — CONFIRMADA**;
- modificación de `role` o `is_active`: **ALTA — CONFIRMADA** como ruptura de integridad de identidad, aunque la autorización laboral principal use `employees`;
- actualización de datos de perfil permitidos: capacidad válida que debe conservarse mediante contrato limitado.

Contrato objetivo:

```text
cliente
→ RPC o acción de servidor de perfil
→ allowlist de campos editables
→ validación y normalización
→ columnas protegidas fuera del payload
```

Destinos:

- `PASS-INT-004 — Definir administración laboral de clientes cuando corresponda`;
- `PASS-INT-005 — Evitar mezclar identidad cliente y trabajador`;
- `AUTH-SRV-004`;
- `AUTH-SRV-005`;
- `SUPA-AUD-009 — Inventariar políticas RLS, grants y privilegios por rol`;
- `SUPA-AUD-010`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `TREQ-AUTH-006`.

---

#### 6. Lectura excesiva de datos personales de clientes

`public.users` permite lectura mediante:

- `users_select_self`;
- políticas específicas de caja;
- `staff_select_all_users`, cuyo criterio es `is_active_staff()`.

`is_active_staff()` no exige una capacidad concreta de atención, caja, fidelización o consulta de clientes. La política expone la fila completa y no una proyección mínima.

Los campos disponibles incluyen:

- nombre;
- documento;
- teléfono;
- correo;
- fecha de nacimiento;
- saldo de puntos;
- estado y metadatos.

PULSO ya demuestra un patrón más adecuado: una Server Action valida `pulso.pos.main` para una sede y devuelve solo una proyección concreta del cliente escaneado. Sin embargo, ese control de aplicación no elimina la política amplia de base.

Clasificación: **ALTA — CONFIRMADA**.

Contrato objetivo:

```text
capacidad autorizada
→ búsqueda por identificador permitido
→ proyección mínima para el proceso
→ sin SELECT general de toda la tabla
→ auditoría del actor y la sede cuando corresponda
```

Destinos:

- `PULSO-AUTH-006 — Definir permisos de cajero`;
- `PULSO-AUTH-009 — Proteger acumulación de puntos`;
- `PULSO-AUTH-010 — Proteger redenciones`;
- `PASS-INT-004`;
- `AUTH-SRV-005`;
- `AUTH-SRV-006`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `TREQ-AUTH-006`.

---

#### 7. Escritura directa del ledger de fidelización

`pass.loyalty_transactions` permite:

```text
INSERT
WITH CHECK auth.uid() = user_id
```

La fila incluye:

- `kind`;
- `points_delta`;
- descripción;
- metadatos.

El constraint valida forma básica, pero no prueba que el incremento provenga de una venta, ajuste autorizado o evento económico legítimo.

Después de cada inserción, el trigger:

```text
on_loyalty_transaction_created
→ pass.update_loyalty_balance()
→ public.users.loyalty_points += new.points_delta
```

Consecuencia:

```text
cliente autenticado
→ inserta transacción propia con points_delta positivo
→ trigger privilegiado actualiza saldo
```

Clasificación: **CRÍTICA — CONFIRMADA**.

Debe revocarse la escritura directa del cliente sobre el ledger. La acumulación, ajuste, gasto y reversión deberán ejecutarse mediante contratos de servidor diferenciados, con actor, origen, idempotencia, referencia y autorización.

Destinos:

- `PULSO-AUTH-009`;
- `PULSO-AUTH-010`;
- `PASS-INT-001 — Definir integración PULSO → PASS para acumulación`;
- `PASS-INT-002 — Definir integración PULSO → PASS para redención`;
- `PASS-QA-001 — Probar flujo completo de acumulación`;
- `PASS-QA-002 — Probar flujo completo de redención`;
- `AUTH-SRV-004`;
- `AUTH-SRV-005`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `TREQ-PASS-008`.

---

#### 8. Redención no atómica y validación de personal demasiado amplia

PASS procesa actualmente una redención desde el cliente mediante varios pasos:

1. lee recompensa;
2. lee saldo;
3. genera QR;
4. inserta `loyalty_redemptions`;
5. inserta `loyalty_transactions`;
6. intenta eliminar la redención si falla la transacción.

La compensación desde el cliente no constituye una transacción atómica y puede dejar diferencias ante cierre de aplicación, red, concurrencia o fallo parcial.

Además, conviven políticas específicas por rol y sede con:

```text
staff_select_all_redemptions
staff_validate_redemptions
```

Las políticas RLS permisivas se combinan con OR. La política general para cualquier trabajador activo amplía las específicas y permite que personal sin capacidad de caja o fuera de la sede vea o valide redenciones.

Clasificación:

- falta de atomicidad: **ALTA — CONFIRMADA**;
- ampliación por política permisiva: **ALTA — CONFIRMADA**.

Contrato objetivo:

```text
RPC o acción de servidor
→ recompensa activa y sede válida
→ saldo bloqueado o cálculo transaccional
→ redención + ledger en una transacción
→ idempotency key
→ validación limitada a permiso, sede y estado
→ evento de auditoría
```

Destinos:

- `PULSO-AUTH-009`;
- `PULSO-AUTH-010`;
- `PASS-INT-001`;
- `PASS-INT-002`;
- `PASS-QA-001`;
- `PASS-QA-002`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `CODE-AUD-018`;
- `TREQ-PASS-008`.

---

#### 9. Documentos laborales: política amplia y bucket público

La tabla `public.documents` permite selección cuando el actor:

- es propietario o destinatario;
- tiene permisos administrativos;
- o simplemente pertenece de forma activa a la misma sede del documento.

La pertenencia a una sede no equivale a autorización para leer documentos personales de otros trabajadores.

El bucket `documents` está configurado como público. En un bucket público, una URL conocida no depende de la política SELECT de `storage.objects`. Esto invalida la expectativa de que RLS de Storage proteja el contenido confidencial.

No se descargaron objetos ni se confirmó que todos sean sensibles. El defecto es el contrato de exposición:

```text
documento laboral
→ ruta en bucket público
→ acceso anónimo por URL conocida
```

Clasificación:

- política de metadatos por simple pertenencia de sede: **ALTA — CONFIRMADA**;
- bucket público para documentos laborales: **ALTA — CONFIRMADA** como superficie de exposición; la sensibilidad de cada objeto deberá inventariarse.

Contrato objetivo:

```text
tipo documental y sensibilidad
→ bucket privado
→ objeto vinculado a propietario y recurso
→ permiso por actor, proceso y alcance
→ URL firmada o proxy de servidor de corta duración
→ auditoría de consulta
→ retención y eliminación
```

Destinos:

- `ANIMA-UX-013 — Simplificar documentos y datos personales`;
- `EVID-ARC-001` a `EVID-ARC-010`;
- `SUPA-AUD-012 — Auditar buckets, rutas, políticas y ciclos de vida de Storage`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `AUTH-DB-005`;
- `TREQ-SUPABASE-004`.

---

#### 10. Vistas administrativas sin `security_invoker`

Cuatro vistas no declaran `security_invoker=true`:

- `permission_catalog_human_v1`;
- `shared_operational_device_actor_policies_admin_v1`;
- `shared_operational_device_templates_admin_v1`;
- `shared_operational_devices_admin_v1`.

Las cuatro son propiedad de un rol privilegiado y permiten `SELECT` a `authenticated`.

Las tres vistas de dispositivos compartidos exponen información administrativa como:

- identificadores de dispositivo;
- `auth_user_id`;
- sede y área;
- aplicaciones permitidas;
- políticas de actor;
- banderas de PIN, sesión y acciones;
- metadatos.

Una vista sin `security_invoker` puede ejecutar con privilegios del propietario y eludir las políticas RLS de las tablas subyacentes.

Clasificación:

- vistas administrativas de dispositivos: **ALTA — CONFIRMADA**;
- catálogo humano de permisos: **REQUIERE DECISIÓN**, porque la lectura puede ser deliberadamente pública para usuarios autenticados, pero debe quedar explícita.

Destinos:

- `SUPA-AUD-003`;
- `SUPA-AUD-007`;
- `SUPA-AUD-009`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `AUTH-DB-005`;
- `AUTH-DEV-*`;
- `TREQ-SUPABASE-005`.

---

#### 11. RPC privilegiadas ejecutables por `anon`

Se localizaron funciones `SECURITY DEFINER` ejecutables por `anon` sin una guarda interna de autenticación, entre ellas:

- `get_site_cost_center`;
- `resolve_internal_transfer_price`;
- `resolve_internal_transfer_price_for_profile`;
- `assert_inventory_uom_profile_stock_input`;
- `shared_device_actor_is_allowed_v1`.

El riesgo varía:

| Función                                    | Exposición                                             |
| ------------------------------------------ | ------------------------------------------------------ |
| `get_site_cost_center`                     | identificador interno de centro de costo por sede      |
| `resolve_internal_transfer_price*`         | precios internos, moneda, listas y factores            |
| `assert_inventory_uom_profile_stock_input` | existencia y conversión de perfiles/ubicaciones        |
| `shared_device_actor_is_allowed_v1`        | inferencia de elegibilidad de trabajador y dispositivo |

La exposición de precios internos a `anon` no corresponde a un contrato público aprobado.

Clasificación: **ALTA — CONFIRMADA** para precios y centros de costo; **MEDIA — CONFIRMADA** para inferencias de validación.

Destinos:

- `SUPA-AUD-003`;
- `SUPA-AUD-006`;
- `SUPA-AUD-007`;
- `SUPA-AUD-009`;
- `AUTH-DB-003`;
- `AUTH-DB-005`;
- `TREQ-SUPABASE-005`.

---

#### 12. Órdenes de compra con autorización genérica de trabajador

`public.purchase_orders` tiene una política `ALL` cuyo criterio es únicamente que exista una fila en `employees` con el identificador del actor.

No exige:

- trabajador activo;
- permiso de ORIGO;
- rol;
- sede;
- centro de costo;
- alcance sobre la orden;
- estado permitido;
- separación entre consulta, creación, aprobación, recepción, corrección o eliminación.

Clasificación: **ALTA — CONFIRMADA**.

Contrato objetivo:

```text
acción sobre orden
→ permiso ORIGO específico
→ sede o centro de costo autorizado
→ estado actual compatible
→ campos permitidos para la transición
→ actor y auditoría
```

Destinos:

- `ORIGO-AUTH-004` a `ORIGO-AUTH-010`;
- `AUTH-SRV-005`;
- `AUTH-SRV-006`;
- `AUTH-SRV-011`;
- `AUTH-SRV-012`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `TREQ-ORIGO-002`.

---

#### 13. Enlace público de PDF de orden de compra

La ruta de PDF permite:

- sesión autenticada con `origo.access`;
- o token público firmado.

Cuando el token es válido, la ruta usa `service_role` para leer la orden, líneas, productos, proveedor y sede.

El helper del token:

- admite una vigencia de 30 días;
- usa HMAC;
- pero, si no existen secretos de ambiente, termina usando una cadena predeterminada incorporada al código.

Esto es un patrón fail-open: la ausencia de configuración no bloquea la generación ni validación; vuelve predecible el secreto.

No se comprobó si producción tiene configurado un secreto real. Por tanto:

- defecto de diseño: **ALTO — CONFIRMADO**;
- explotación actual: **CONDICIONAL**.

Contrato objetivo:

```text
secreto obligatorio
→ fallo de arranque o 500 si falta
→ token de alcance único para una orden
→ expiración corta y explícita
→ revocación o rotación
→ contenido mínimo para proveedor
→ auditoría de emisión y acceso
```

Destinos:

- `ORIGO-AUTH-009`;
- `ORIGO-AUTH-010`;
- `SUPA-AUD-015 — Auditar extensiones, secretos, variables y configuración del proyecto`;
- `AUTH-SRV-011`;
- `CODE-AUD-020`;
- `TREQ-ORIGO-002`.

---

#### 14. Mutación amplia de pedidos y líneas

Las políticas de `public.orders` y `public.order_items` permiten a cualquier trabajador con acceso a la sede actualizar la fila completa.

El criterio de sitio es necesario, pero no suficiente. Las filas contienen campos relacionados con:

- estado;
- despacho;
- pago;
- total;
- fidelización;
- inventario;
- anulación;
- entrega;
- referencias externas;
- precios, cantidades y compensaciones.

La base no distingue en la política si el actor está autorizado para cambiar un estado operativo, modificar un precio, marcar pago, alterar fidelización o anular.

Clasificación: **ALTA — CONFIRMADA**.

Contrato objetivo:

```text
acción nombrada
→ permiso específico
→ sede activa
→ estado de origen
→ transición permitida
→ columnas limitadas
→ RPC transaccional
→ evento de auditoría
```

Destinos:

- `PULSO-AUTH-006` a `PULSO-AUTH-011`;
- `AUTH-SRV-005`;
- `AUTH-SRV-006`;
- `AUTH-SRV-011`;
- `AUTH-SRV-012`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `CODE-AUD-018`;
- `TREQ-PULSO-004`.

---

#### 15. Administración de autorización sin alcance territorial suficiente

Las políticas de:

- `employee_site_operational_profiles`;
- `site_operational_roles`;
- `operational_role_permissions`;

permiten administración a `is_manager()`, `is_manager_or_owner()` o equivalentes.

La función `is_manager()` identifica el rol `gerente`, pero la política no limita la fila administrada a la sede del gerente.

Consecuencia:

```text
gerente de una sede
→ política global de administración
→ posibilidad de modificar configuración de otras sedes o filas globales
```

Clasificación: **ALTA — CONFIRMADA**.

Destinos:

- `VISO-AUTH-005` a `VISO-AUTH-009`;
- `VISO-AUTH-018`;
- `VISO-AUTH-019`;
- `VISO-UX-013`;
- `AUTH-SRV-005`;
- `AUTH-SRV-006`;
- `AUTH-SRV-012`;
- `AUTH-DB-002`;
- `TREQ-AUTH-007`.

---

#### 16. Edge Functions con `verify_jwt=false`

Las 24 Edge Functions activas se distribuyen así:

```text
12 con verify_jwt=true
12 con verify_jwt=false
```

La revisión de las doce sin JWT automático produjo:

| Función                     | Control propio                              | Resultado                                                   |
| --------------------------- | ------------------------------------------- | ----------------------------------------------------------- |
| `staff-invitations-accept`  | bearer válido                               | autenticación presente, autorización de rol/sede defectuosa |
| `document-alerts`           | secreto cron opcional                       | fail-open si falta el secreto                               |
| `process-account-deletions` | bearer igual a secreto obligatorio          | control presente                                            |
| `register-push-token`       | bearer validado con `auth.getUser`          | control presente                                            |
| `announcement-notify`       | bearer + rol de gestión activo              | control presente                                            |
| `employee-delete`           | bearer + UID propietario configurado        | control presente, contrato rígido                           |
| `payments-webhook`          | checksum del proveedor obligatorio          | control presente                                            |
| `staff-invitations-resend`  | bearer + rol + sede para gerente            | control presente                                            |
| `staff-invitations-cancel`  | bearer + rol + sede para gerente            | control presente                                            |
| `shift-runtime-processor`   | secreto cron opcional                       | fail-open si no existe secreto en tabla ni ambiente         |
| `payments-return`           | superficie pública sin mutación             | exposición deliberada aceptable                             |
| `delivery-portal`           | token aleatorio hasheado + expiración + PIN | control presente; fuente solo remota                        |

`document-alerts` y `shift-runtime-processor` usan el patrón:

```text
si existe secreto y no coincide → denegar
si no existe secreto → continuar
```

Esto debe convertirse en:

```text
si no existe secreto → fallar
si no coincide → denegar
si coincide → ejecutar
```

Clasificación:

- dos funciones cron: **ALTA — CONDICIONAL**;
- `staff-invitations-accept`: cubierta por el hallazgo crítico;
- las demás: `CONTROL_PRESENTE` o superficie pública deliberada.

Destinos:

- `SUPA-AUD-014`;
- `SUPA-AUD-015`;
- `AUTH-DB-003`;
- `AUTH-DB-005`;
- `CODE-AUD-020`;
- `TREQ-SUPABASE-006`.

---

#### 17. `delivery-portal`: contrato razonable, pero fuente solo remota

La función remota usa:

- token aleatorio de 32 bytes;
- almacenamiento del hash;
- vigencia de 12 horas;
- bloqueo por estado;
- PIN hasheado para confirmar entrega;
- contador máximo de intentos;
- eventos de auditoría;
- validación del estado y pago antes de tránsito.

No se clasifica como exposición sin control.

Sin embargo:

- la Edge Function existe solo en remoto;
- su código no está versionado en el directorio canónico de `vento-shell`;
- la URL del proyecto está incrustada en el RPC generador;
- el contrato debe quedar reproducible mediante migración y fuente local.

Clasificación: **GOBIERNO / DRIFT**, no vulnerabilidad confirmada.

Destinos:

- `SUPA-AUD-014`;
- `SUPA-AUD-016`;
- `SUPA-AUD-017`;
- `CODE-AUD-020`;
- mantiene `TREQ-SUPABASE-003`.

---

#### 18. Controles positivos que deben conservarse

##### 18.1. Cliente administrativo de VISO

`createAdminClient()`:

- importa `server-only`;
- exige `SUPABASE_SERVICE_ROLE_KEY`;
- no persiste sesión;
- no tiene fallback público.

Estado: `CONTROL_PRESENTE`.

El control debe complementarse con validación obligatoria antes de cada consumidor.

##### 18.2. Identificación de cliente en PULSO

La Server Action:

- valida sesión;
- exige `pulso.pos.main` para la sede recibida;
- usa cliente privilegiado solo después de autorizar;
- devuelve una proyección limitada.

Estado: `CONTROL_PRESENTE`, aunque la política general de `public.users` siga siendo demasiado amplia.

##### 18.3. Registro de push token

`register-push-token` valida manualmente el bearer mediante `auth.getUser` y vincula la escritura al usuario autenticado.

Estado: `CONTROL_PRESENTE`.

##### 18.4. Webhook de pagos

`payments-webhook`:

- falla si no existe secreto;
- verifica checksum;
- registra eventos;
- detecta duplicados;
- resuelve la transacción antes de cambiar su estado.

Estado: `CONTROL_PRESENTE`; concurrencia e idempotencia completas continúan a `CODE-AUD-018`.

##### 18.5. Funciones `SECURITY DEFINER`

Las funciones `SECURITY DEFINER` de los esquemas revisados tienen `search_path` fijado.

Estado: **control transversal positivo**. No sustituye la revisión de grants ni autorización interna.

##### 18.6. Esquema `viso`

Las tablas internas de planificación del esquema `viso` no conceden acceso ordinario a `authenticated`. Sus consumidores localizados usan cliente administrativo en servidor.

Estado: `CONTROL_PRESENTE`, sujeto a que todos los endpoints conserven la guarda previa.

---

#### 19. Repositorios públicos y secretos

El inventario mantiene diez repositorios públicos y dos privados.

La búsqueda no localizó una `service_role` real escrita literalmente en los archivos revisados. Sí localizó:

- referencias a variables de ambiente;
- scripts que leen `.env.local`;
- un secreto de desarrollo predeterminado para PDF de ORIGO;
- esquema, migraciones, nombres de funciones, políticas y arquitectura en repositorios públicos.

Un repositorio público no constituye por sí solo una vulnerabilidad. Sí incrementa la obligación de:

- eliminar fallbacks secretos;
- aplicar mínimo privilegio;
- no depender de ocultar nombres;
- definir una política de visibilidad;
- revisar historial Git, no solo el estado actual;
- impedir que scripts temporales o dumps contengan credenciales.

Clasificación: **GOBIERNO — MEDIA**.

Destinos:

- `SUPA-AUD-015`;
- `CODE-AUD-020`.

No se crea un requisito de prueba solo por la visibilidad del repositorio.

---

#### 20. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                                | Certeza / riesgo            | Destino                                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------------------- | --------------------------- | -------------------------------------------------------------------------------------------------- |
| `H-CODE-017-001` | aceptación de invitación materializa rol y sede enviados por el cliente                                 | `CONFIRMADO` / crítico      | `ANIMA-AUTH-019`, `020`; `AUTH-SRV-004`, `005`, `006`; `AUTH-DB-002`, `004`; `TREQ-AUTH-005`       |
| `H-CODE-017-002` | `public.users` permite autoadministrar columnas protegidas                                              | `CONFIRMADO` / crítico      | `PASS-INT-004`, `005`; `AUTH-SRV-004`, `005`; `AUTH-DB-002`, `004`; `TREQ-AUTH-006`                |
| `H-CODE-017-003` | personal activo puede leer la fila completa de todos los clientes                                       | `CONFIRMADO` / alto         | `PULSO-AUTH-006`, `009`, `010`; `PASS-INT-004`; `AUTH-DB-002`, `004`; `TREQ-AUTH-006`              |
| `H-CODE-017-004` | cliente puede insertar transacciones propias que incrementan su saldo                                   | `CONFIRMADO` / crítico      | `PULSO-AUTH-009`, `010`; `PASS-INT-001`, `002`; `AUTH-DB-002`, `004`; `TREQ-PASS-008`              |
| `H-CODE-017-005` | redención se compone en cliente sin transacción atómica                                                 | `CONFIRMADO` / alto         | `PASS-INT-002`; `PASS-QA-002`; `CODE-AUD-018`; `TREQ-PASS-008`                                     |
| `H-CODE-017-006` | políticas generales de personal amplían consulta y validación de redenciones                            | `CONFIRMADO` / alto         | `PULSO-AUTH-010`; `AUTH-DB-002`, `004`; `TREQ-PASS-008`                                            |
| `H-CODE-017-007` | pertenencia a sede permite leer metadatos documentales de otros trabajadores                            | `CONFIRMADO` / alto         | `EVID-ARC-*`; `SUPA-AUD-012`; `AUTH-DB-002`, `004`; `TREQ-SUPABASE-004`                            |
| `H-CODE-017-008` | bucket `documents` es público                                                                           | `CONFIRMADO` / alto         | `EVID-ARC-*`; `SUPA-AUD-012`; `AUTH-DB-002`, `004`, `005`; `TREQ-SUPABASE-004`                     |
| `H-CODE-017-009` | tres vistas administrativas de dispositivos no usan `security_invoker` y son legibles por authenticated | `CONFIRMADO` / alto         | `SUPA-AUD-003`, `007`, `009`; `AUTH-DB-002`, `004`, `005`; `TREQ-SUPABASE-005`                     |
| `H-CODE-017-010` | RPC anónimas exponen precios internos, centros de costo y validaciones                                  | `CONFIRMADO` / alto         | `SUPA-AUD-003`, `006`, `007`, `009`; `AUTH-DB-003`, `005`; `TREQ-SUPABASE-005`                     |
| `H-CODE-017-011` | cualquier fila de trabajador habilita CRUD total de órdenes de compra                                   | `CONFIRMADO` / alto         | `ORIGO-AUTH-004..010`; `AUTH-SRV-005`, `006`, `011`, `012`; `AUTH-DB-002`, `004`; `TREQ-ORIGO-002` |
| `H-CODE-017-012` | enlace público de PDF tiene secreto fallback y vigencia de 30 días                                      | `CONDICIONAL` / alto        | `ORIGO-AUTH-009`, `010`; `SUPA-AUD-015`; `TREQ-ORIGO-002`                                          |
| `H-CODE-017-013` | personal con acceso a sede puede actualizar filas completas de pedidos y líneas                         | `CONFIRMADO` / alto         | `PULSO-AUTH-006..011`; `AUTH-SRV-005`, `006`, `011`, `012`; `AUTH-DB-002`, `004`; `TREQ-PULSO-004` |
| `H-CODE-017-014` | gerentes pueden administrar configuración operativa sin filtro territorial de fila                      | `CONFIRMADO` / alto         | `VISO-AUTH-005..009`, `018`, `019`; `VISO-UX-013`; `AUTH-DB-002`; `TREQ-AUTH-007`                  |
| `H-CODE-017-015` | `document-alerts` falla abierto si falta secreto cron                                                   | `CONDICIONAL` / alto        | `SUPA-AUD-014`, `015`; `AUTH-DB-003`, `005`; `TREQ-SUPABASE-006`                                   |
| `H-CODE-017-016` | `shift-runtime-processor` falla abierto si no hay secreto en tabla ni ambiente                          | `CONDICIONAL` / alto        | mismo destino                                                                                      |
| `H-CODE-017-017` | ocho funciones sin JWT tienen control propio suficiente a nivel estático                                | `CONTROL_PRESENTE`          | conservar y probar negativamente                                                                   |
| `H-CODE-017-018` | `payments-return` es pública, pero no muta datos                                                        | `CONTROL_PRESENTE`          | cerrado                                                                                            |
| `H-CODE-017-019` | `delivery-portal` tiene token fuerte y controles, pero fuente solo remota                               | `GOBIERNO` / alto por drift | `SUPA-AUD-014`, `016`, `017`; `CODE-AUD-020`; mantiene `TREQ-SUPABASE-003`                         |
| `H-CODE-017-020` | VISO mantiene el cliente admin bajo `server-only`                                                       | `CONTROL_PRESENTE`          | conservar                                                                                          |
| `H-CODE-017-021` | las funciones `SECURITY DEFINER` revisadas tienen `search_path` fijado                                  | `CONTROL_PRESENTE`          | conservar                                                                                          |
| `H-CODE-017-022` | no se localizó una service role literal en el estado actual de los repositorios                         | límite de evidencia         | revisar historial en `SUPA-AUD-015`                                                                |
| `H-CODE-017-023` | diez repositorios continúan públicos                                                                    | `GOBIERNO` / medio          | `SUPA-AUD-015`, `CODE-AUD-020`                                                                     |

Todos los hallazgos tienen destino.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 21. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 21.1. Requisitos reutilizados

- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`;
- `TREQ-AUTH-003`;
- `TREQ-AUTH-004`;
- `TREQ-ORIGO-001`;
- `TREQ-PULSO-001`;
- `TREQ-PULSO-003`;
- `TREQ-SUPABASE-003`.

No se cambia su estado.

##### 21.2. Requisitos nuevos

- `TREQ-AUTH-005`;
- `TREQ-AUTH-006`;
- `TREQ-AUTH-007`;
- `TREQ-PASS-008`;
- `TREQ-PULSO-004`;
- `TREQ-ORIGO-002`;
- `TREQ-SUPABASE-004`;
- `TREQ-SUPABASE-005`;
- `TREQ-SUPABASE-006`.

Las filas canónicas completas deberán agregarse exclusivamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 22. Decisiones propuestas

1. Autenticación y autorización permanecerán diferenciadas.
2. Un bearer válido no autoriza a elegir rol, sede, permiso o alcance.
3. La invitación persistida será la única fuente del rol y sede durante activación laboral.
4. Los clientes no podrán escribir directamente campos derivados, privilegiados o de saldo.
5. El perfil autoadministrable se implementará mediante una allowlist de campos.
6. La consulta de clientes devolverá una proyección mínima para el proceso autorizado.
7. El ledger de puntos no admitirá inserciones directas de clientes.
8. Acumulación, gasto, ajuste, reversión y redención serán operaciones de servidor trazables.
9. La redención será atómica e idempotente.
10. Un trabajador activo no obtendrá por sí solo acceso general a clientes, redenciones, órdenes o configuración.
11. Las políticas permisivas duplicadas deberán analizarse como una unión lógica OR.
12. Los documentos laborales no permanecerán en buckets públicos.
13. La pertenencia a una sede no será permiso suficiente para leer documentos de otros trabajadores.
14. Las vistas administrativas deberán usar `security_invoker` o revocar acceso directo y exponerse mediante contrato autorizado.
15. Toda función `SECURITY DEFINER` deberá combinar `search_path` fijo, grants mínimos y autorización interna.
16. Los RPC de precios internos y configuración no serán ejecutables por `anon`.
17. Cada mutación de compra o pedido deberá limitar permiso, sede, estado y columnas.
18. La administración de seguridad por gerente deberá respetar su alcance territorial.
19. Toda Edge Function sin JWT automático deberá implementar un control propio obligatorio y fail-closed.
20. Un secreto opcional no se considerará autenticación.
21. Los enlaces públicos privilegiados deberán exigir secretos obligatorios, alcance, expiración y revocación.
22. El patrón server-only de VISO y los controles correctos localizados se conservarán.
23. La fuente de `delivery-portal` deberá recuperarse y versionarse antes de remodelarla.
24. Los hallazgos críticos bloquearán ampliaciones del flujo afectado hasta su contención.
25. No se ejecutarán pruebas ofensivas ni mutaciones productivas durante E1.
26. Los nueve requisitos nuevos se registrarán únicamente en `04A`.
27. No se crea una tarea nueva del roadmap.
28. `CODE-AUD-018` será la única continuidad inmediata después de la aprobación.

---

#### 23. Límites de certeza

Esta tarea no confirma:

- qué secretos existen actualmente en los ambientes remotos;
- que el fallback de ORIGO esté activo en producción;
- que las funciones cron sin secreto configurado sean invocables actualmente sin control;
- que un objeto específico del bucket `documents` haya sido descargado sin autorización;
- que todos los repositorios públicos hayan sido clonados por terceros;
- que no existan secretos en el historial Git;
- que toda función con control estático correcto resista concurrencia o replay;
- que los controles de entrega y pagos sean completamente idempotentes;
- que la política empresarial final de visibilidad de clientes ya esté decidida;
- que cada campo de documentos tenga la misma sensibilidad.

La explotación no es necesaria para concluir los fallos de diseño y autorización demostrados por políticas, grants y código.

---

#### 24. Criterios de aceptación

`CODE-AUD-017` podrá aprobarse cuando:

- autenticación, autorización, alcance, RLS, grant y privilegio elevado estén diferenciados;
- las 24 Edge Functions queden clasificadas por JWT y control propio;
- las doce funciones sin JWT tengan evaluación individual;
- el escalamiento de invitaciones quede clasificado como crítico;
- la escritura amplia de `public.users` quede documentada;
- la escritura directa del ledger de puntos quede documentada;
- la redención cliente y las políticas generales tengan destino;
- la lectura amplia de PII tenga destino;
- documentos, bucket y URLs públicas tengan destino;
- vistas sin `security_invoker` y grants directos tengan destino;
- RPC anónimas y `SECURITY DEFINER` estén diferenciadas;
- órdenes de compra, pedidos y configuración operativa tengan destino;
- los controles positivos no se conviertan en falsos positivos;
- cada hallazgo tenga tarea responsable y momento de resolución;
- los requisitos nuevos tengan identificador único;
- las filas completas se incorporen únicamente a `04A`;
- no se creen tareas redundantes;
- no se modifique código, CI, despliegues ni Supabase;
- `CODE-AUD-018` permanezca como continuidad reservada.

---

#### 25. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
actor, sesión o token
→ frontera de servidor
→ permiso y alcance
→ RLS, grant o función privilegiada
→ columnas y datos accesibles
→ acción autorizada o denegada
→ evidencia y requisito de regresión
```

La continuidad será:

```text
CODE-AUD-018
— Auditar operación offline, reintentos, concurrencia e idempotencia
```


### ✅ CODE-AUD-018 — Auditar operación offline, reintentos, concurrencia e idempotencia

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de tolerancia a conectividad intermitente, persistencia local, reintentos, replay, concurrencia, atomicidad e idempotencia  
**Dependencia anterior:** `CODE-AUD-017` — APROBADA  
**Continuidad reservada:** `CODE-AUD-019`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no realizados. La revisión fue documental y estática; no se enviaron operaciones productivas, pagos, redenciones, movimientos, recepciones, impresiones, webhooks ni eventos offline.

---

#### 1. Resultado de esta tarea

Esta tarea determina qué ocurre cuando una operación empresarial:

- se inicia sin conexión;
- pierde conectividad después de que el servidor pudo recibirla;
- se reintenta manual o automáticamente;
- llega dos o más veces;
- compite con otra operación sobre el mismo recurso;
- se ejecuta parcialmente;
- se recibe fuera de orden;
- queda pendiente en el dispositivo;
- cruza una frontera asíncrona, un webhook, una cola o un periférico;
- necesita distinguir entre envío, aceptación, procesamiento y efecto empresarial confirmado.

La cadena auditada es:

```text
intención del actor
→ identificador estable de operación
→ persistencia local o envío inmediato
→ frontera de servidor
→ revalidación de identidad, permiso, contexto y versión
→ deduplicación y control de concurrencia
→ transacción o efecto reconciliable
→ confirmación estable
→ retiro seguro de la cola
→ auditoría y recuperación
```

Resultado consolidado:

| Clasificación                                           | Cantidad |
| ------------------------------------------------------- | -------: |
| controles positivos explícitos                          |    **6** |
| brechas críticas confirmadas                            |    **4** |
| riesgos críticos parciales o pendientes de prueba       |    **2** |
| brechas altas confirmadas                               |    **3** |
| riesgos altos parciales, no implementados o de gobierno |    **6** |
| brechas medias de gobierno                              |    **1** |
| superficies con operación offline empresarial real      |    **1** |
| superficies con borrador o cola únicamente local        |    **2** |

La conclusión principal es:

```text
ANIMA
→ posee la única implementación offline empresarial explícita y parcialmente robusta

NEXO impresión
→ posee una cola local, pero no una cola durable de trabajos confirmados

ORIGO
→ conserva borradores de formulario, pero no ejecuta recepciones offline

RESTO DEL ECOSISTEMA
→ opera principalmente online y no demuestra un contrato transversal de
  idempotencia, reintento, concurrencia o recuperación
```

No existe todavía una política canónica única que obligue a cada mutación a declarar:

- si admite operación offline;
- qué identificador idempotente utiliza;
- qué errores pueden reintentarse;
- qué recurso o versión protege;
- qué atomicidad ofrece;
- cómo resuelve duplicados y eventos fuera de orden;
- cuándo la interfaz puede comunicar éxito;
- cómo se recupera una operación parcialmente aplicada.

---

#### 2. Alcance y fuentes contrastadas

La auditoría utilizó:

- las decisiones aprobadas en `CODE-AUD-001` a `CODE-AUD-017`;
- el código canónico actual de ANIMA, PASS, NEXO, ORIGO y VENTO-SHELL;
- los contratos de asistencia y sincronización de ANIMA;
- las migraciones de idempotencia de asistencia;
- la redención de puntos de PASS;
- la creación y conciliación de pagos;
- el webhook de Wompi;
- los ajustes de inventario de NEXO;
- la cola de impresión BrowserPrint de NEXO;
- la creación, corrección y reversión de recepciones de ORIGO;
- los hallazgos previos sobre remisiones, POS, automatizaciones, Edge Functions, cron, notificaciones y consumidores legacy;
- las tareas existentes de E2, E3, E4, E5 y los roadmaps por aplicación.

Cortes estáticos principales:

| Repositorio   | Referencia revisada                        | Superficie principal                            |
| ------------- | ------------------------------------------ | ----------------------------------------------- |
| `vento-anima` | `50b77742cc0ae85f873d42152108a50acc9d6964` | cola offline, sincronización y asistencia       |
| `vento-pass`  | `b5a4aec908ef12226f798078577ab089a29ccda2` | redenciones, historial y cliente móvil          |
| `vento-shell` | `1bad886843d2c3300611680f98a266e59899e064` | RPC, migraciones, pagos, webhook y conciliación |
| `vento-nexo`  | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` | ajustes de inventario e impresión               |
| `vento-origo` | `71de15eacae4b91ced5357bf021cac459dd6fff0` | recepción, inventario, costos y correcciones    |

No se ejecutaron:

- pruebas de doble envío contra producción;
- pruebas de pérdida de red durante una transacción;
- carreras concurrentes reales;
- replays de webhook;
- impresiones físicas;
- pagos reales o de prueba;
- redenciones;
- recepciones;
- movimientos de inventario;
- cambios de reloj del dispositivo;
- reinstalación de aplicaciones con colas pendientes.

La ausencia de ejecución dinámica no reduce la certeza de las brechas que se demuestran directamente mediante secuencias de lectura y escritura no transaccionales, retiro prematuro de colas o ausencia de clave idempotente.

---

#### 3. Estados de certeza

| Estado                            | Significado                                                                                    |
| --------------------------------- | ---------------------------------------------------------------------------------------------- |
| `CONTROL_PRESENTE`                | existe un mecanismo explícito y verificable a nivel estático                                   |
| `PARCIAL`                         | existe una parte del contrato, pero no cubre toda la operación o todos sus efectos             |
| `CONFIRMADO`                      | el código demuestra una posibilidad concreta de duplicación, pérdida, carrera o estado parcial |
| `NO_IMPLEMENTADO`                 | no existe una capacidad offline o un control transversal demostrable                           |
| `REQUIERE_PRUEBA_CONCURRENTE`     | el diseño contiene controles, pero necesita ejecución simultánea para cerrar certeza           |
| `REQUIERE_PRUEBA_DE_RECUPERACIÓN` | debe comprobarse pérdida de red, reinicio, replay o fallo intermedio                           |
| `GOBIERNO`                        | falta contrato canónico, propietario, métrica, retención o política de operación               |

Un bloqueo de doble clic en la interfaz no se clasifica como control de integridad. Un `loading`, una referencia `inFlight`, un botón deshabilitado o una comparación local solo protege una instancia de interfaz; no protege:

- dos pestañas;
- dos dispositivos;
- una retransmisión de red;
- un webhook repetido;
- dos workers;
- dos actores sobre el mismo recurso;
- una respuesta perdida después de que el servidor aplicó el efecto.

---

#### 4. Definiciones obligatorias usadas en la auditoría

##### 4.1. Operación offline

Una capacidad es realmente offline cuando puede:

1. aceptar una intención sin conexión;
2. persistirla de manera durable;
3. conservar identidad, contexto, recurso, versión y evidencia suficientes;
4. sobrevivir al cierre o reinicio de la aplicación;
5. sincronizarse después;
6. revalidarse en servidor;
7. producir un único efecto empresarial o un conflicto explícito;
8. mostrar estado pendiente, confirmado, rechazado o fallido.

Guardar un borrador en `localStorage`, `sessionStorage` o memoria no convierte la acción empresarial en offline.

##### 4.2. Reintento

Un reintento reutiliza la misma intención y la misma clave idempotente. Repetir una acción generando una clave nueva se considera una operación nueva, aunque el usuario perciba que solo está intentando de nuevo.

##### 4.3. Idempotencia

Para una misma clave y el mismo contenido lógico:

```text
primer procesamiento
→ aplica el efecto y conserva el resultado

replay posterior
→ no repite el efecto
→ devuelve el mismo resultado estable o su referencia
```

Si la misma clave llega con un contenido distinto, deberá producir un conflicto y no reemplazar silenciosamente la intención original.

##### 4.4. Atomicidad

Una operación es atómica cuando sus efectos empresariales indivisibles se confirman juntos o no se confirma ninguno. Cuando una transacción única no sea posible, deberá existir una saga o compensación durable, idempotente y observable; un `delete` de mejor esfuerzo desde el cliente no constituye una garantía equivalente.

##### 4.5. Concurrencia

Toda mutación deberá declarar uno de estos mecanismos o una combinación aprobada:

- bloqueo de fila;
- versión optimista;
- compare-and-swap;
- restricción única;
- serialización por recurso;
- reserva;
- clave idempotente;
- cola con exclusión por recurso;
- transacción con nivel de aislamiento adecuado.

##### 4.6. Semántica de entrega

Las colas, webhooks y redes se asumirán como **al menos una vez**. El sistema no dependerá de que el transporte entregue exactamente una vez. El efecto empresarial exactamente una vez se aproximará mediante deduplicación, atomicidad, control de versión y conciliación.

---

#### 5. Matriz transversal por aplicación y superficie

| Aplicación o superficie | Operación offline actual                                | Reintentos                                                                                 | Concurrencia                                                                                | Idempotencia                                                                                                  | Resultado                               |
| ----------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| ANIMA asistencia        | cola durable en SecureStore para marcación y descansos  | backoff para errores semejantes a red; sincronización periódica y al volver a primer plano | referencias `inFlight` locales; deduplicación de marcaciones en servidor                    | marcaciones normales con `client_event_id` e índice único; descansos sin deduplicación contractual demostrada | `PARCIAL`, es la base más avanzada      |
| PASS redención          | no demostrada                                           | nuevo intento manual                                                                       | lectura de saldo antes de dos escrituras separadas                                          | no existe clave idempotente en el flujo cliente                                                               | `CONFIRMADO` crítico                    |
| PASS pagos              | requiere conexión                                       | replay del proveedor y conciliación programada                                             | bloqueo de transacción al aplicar estado; creación de intentos no serializada completamente | referencia persistida y registro de eventos, pero claim y efecto no son una sola unidad                       | `PARCIAL`                               |
| NEXO ajustes            | no demostrada                                           | reenvío manual de la solicitud                                                             | lectura-modificación-escritura sobre proyecciones                                           | no existe identificador de operación                                                                          | `CONFIRMADO` crítico                    |
| NEXO remisiones         | no demostrada como offline                              | cobertura incompleta ya registrada                                                         | transiciones y efectos requieren revisión por estado/recurso                                | no se ha demostrado exactamente una vez en todos los efectos                                                  | `PARCIAL`; conserva `TREQ-NEXO-006`     |
| NEXO impresión          | cola de texto local                                     | reimpresión manual; sin estado durable de reintento                                        | no existe claim de trabajo por dispositivo                                                  | no existe ID durable de trabajo ni acuse verificable                                                          | `CONFIRMADO` alto                       |
| ORIGO recepción         | borrador en `sessionStorage`; envío online              | reenvío manual                                                                             | múltiples lecturas y escrituras secuenciales                                                | no existe clave de operación para recepción o corrección                                                      | `CONFIRMADO` crítico                    |
| PULSO                   | no demostrada                                           | depende de reenvío o integraciones futuras                                                 | modelo operativo todavía en definición                                                      | no existe contrato transversal comprobado                                                                     | `NO_IMPLEMENTADO` / pendiente de diseño |
| FOGO                    | no demostrada                                           | no demostrados                                                                             | no demostrada                                                                               | no demostrada                                                                                                 | `NO_IMPLEMENTADO`                       |
| VISO                    | no demostrada                                           | reenvío manual de formularios                                                              | protecciones locales variables                                                              | no existe convención transversal comprobada                                                                   | `NO_IMPLEMENTADO`                       |
| NUMERA                  | no demostrada                                           | reenvío manual                                                                             | no demostrada                                                                               | no demostrada                                                                                                 | `NO_IMPLEMENTADO`                       |
| SHELL                   | no ejecuta la mayoría de mutaciones de dominio          | no aplica como aplicación para muchas acciones                                             | actúa como hub                                                                              | contratos compartidos todavía no unificados                                                                   | `GOBIERNO`                              |
| TALENTO                 | sin superficie productiva                               | no aplica                                                                                  | no aplica                                                                                   | no aplica                                                                                                     | fuera de operación actual               |
| web pública             | no existen mutaciones empresariales offline demostradas | variable por formulario                                                                    | no demostrada                                                                               | no demostrada                                                                                                 | online                                  |

La matriz no exige que todas las aplicaciones trabajen offline. Exige que cada capacidad declare su modalidad real y no permita que la interfaz confunda:

```text
borrador local
≠ operación en cola
≠ solicitud recibida por servidor
≠ operación procesada
≠ efecto empresarial conciliado
```

---

#### 6. Control positivo: marcaciones offline de ANIMA

ANIMA contiene la implementación más completa encontrada:

- cola de marcaciones por usuario en SecureStore;
- identificador de evento creado antes del envío;
- `occurred_at`, sede, geolocalización, dispositivo y contexto de turno;
- estados `pending`, `syncing`, `failed` y `conflict`;
- número de intentos, último error y próximo reintento;
- sincronización cada quince segundos mientras existen pendientes;
- sincronización forzada al volver la aplicación a primer plano;
- procesamiento secuencial de la cola;
- diferenciación entre aplicado, duplicado, conflicto y error;
- índice único por trabajador y `client_event_id`;
- RPC que convierte una violación única en resultado `duplicate`;
- registro separado de conflictos de sincronización;
- revalidación de trabajador activo y acceso a sede en servidor;
- estados visibles de cola, sincronización, fallo y bloqueo.

Clasificación:

```text
persistencia local                    CONTROL_PRESENTE
identificador estable                 CONTROL_PRESENTE
replay de marcación normal            CONTROL_PRESENTE
revalidación básica de servidor       CONTROL_PRESENTE
conflicto explícito                    CONTROL_PRESENTE
prueba de reinicio, pérdida y carrera  PENDIENTE
```

Este patrón deberá conservarse como referencia, pero no se considera completo para toda asistencia ni automáticamente reutilizable por otros dominios.

---

#### 7. Brecha ANIMA: persistencia local no confirmada antes de comunicar cola

Las funciones que escriben las colas en SecureStore capturan el error, lo registran y terminan sin propagarlo.

Consecuencia posible:

```text
la acción online falla
→ ANIMA intenta guardar el evento
→ SecureStore falla
→ el helper no lanza error
→ la capa superior puede continuar como si el evento hubiera quedado en cola
→ el usuario recibe éxito optimista
→ al cerrar la app, la intención puede no existir
```

**Hallazgo:** `H-CODE-018-001`  
**Estado:** `CONFIRMADO`  
**Severidad:** crítica  
**Riesgo:** pérdida silenciosa de una marcación o descanso que el trabajador cree guardado.  
**Destino:** `ANIMA-AUTH-014`, `ANIMA-UX-011`, `ANIMA-UX-012`, `AUTH-QA-026`, `NFR-REQ-004`.  
**Prueba:** `TREQ-ANIMA-003`.

Decisión propuesta:

Una acción solo podrá responder `queued: true` después de confirmar que la cola fue persistida. Si la persistencia local falla, la interfaz deberá comunicar que la operación no fue guardada y conservar una ruta de recuperación explícita.

---

#### 8. Brecha ANIMA: descansos sin idempotencia demostrada en servidor

Los eventos de descanso crean un `clientEventId` y lo incluyen dentro de `notes`, pero las llamadas vigentes a:

- `start_attendance_break`;
- `end_attendance_break`;

no demuestran una columna idempotente, restricción única ni resultado estable por evento. La sincronización decide localmente si debe aplicar, descartar o marcar conflicto y luego invoca la RPC.

La secuencia:

```text
consultar estado actual
→ decidir proceder
→ llamar RPC
```

no es atómica. Dos dispositivos o un replay después de una respuesta perdida pueden observar el mismo estado previo.

**Hallazgo:** `H-CODE-018-002`  
**Estado:** `CONFIRMADO` a nivel contractual; requiere prueba concurrente para medir la manifestación  
**Severidad:** alta  
**Riesgo:** doble inicio, doble cierre, cierre del descanso equivocado o resultado local divergente.  
**Destino:** `ANIMA-AUTH-014`, `ANIMA-AUTH-015`, `QUEUE-ARC-003`, `QUEUE-ARC-009`, `AUTH-QA-026`.  
**Prueba:** `TREQ-ANIMA-004`.

Decisión propuesta:

Los descansos deberán usar una clave idempotente persistida en una columna propia y procesarse mediante una operación de servidor que:

- bloquee o versione el estado de asistencia relevante;
- aplique la transición válida;
- devuelva `applied`, `duplicate` o `conflict`;
- conserve el mismo resultado para replays posteriores.

---

#### 9. Brecha ANIMA: fallback que reduce el contrato de sincronización

Cuando el cliente interpreta que `sync_attendance_events` no existe, ejecuta una inserción alternativa mediante `insertAttendanceLogWithRetry` y devuelve `applied`.

Aunque la tabla dispone de un índice único para `client_event_id`, el fallback:

- evita el contrato explícito de resultados `duplicate` y `conflict`;
- puede diferir en validaciones, auditoría y tratamiento de errores;
- convierte drift de esquema en una ruta funcional silenciosa;
- permite que ambientes distintos procesen la misma cola mediante contratos diferentes.

**Hallazgo:** `H-CODE-018-003`  
**Estado:** `CONFIRMADO`  
**Severidad:** alta  
**Riesgo:** divergencia entre ambientes y pérdida de semántica de sincronización.  
**Destino:** `ANIMA-AUTH-014`, `ANIMA-AUTH-015`, `SUPA-TRANS-006`, `CODE-AUD-020`, `TREQ-SUPABASE-001`.  
**Prueba:** se incorpora a `TREQ-ANIMA-003` y reutiliza `TREQ-SUPABASE-001`.

Decisión propuesta:

La ausencia del contrato de sincronización deberá ser un error de despliegue observable y no una razón para degradar a una escritura alternativa sin equivalencia probada. Cualquier compatibilidad temporal deberá estar versionada, tener prueba de paridad y fecha de retiro.

---

#### 10. Brecha transversal: reintento basado en heurísticas locales

ANIMA identifica errores semejantes a conectividad mediante cadenas como:

- `network request failed`;
- `failed to fetch`;
- `timeout`;
- `enotfound`;
- `econnrefused`.

Después usa backoff exponencial con tope. Este control es útil, pero no constituye una política transversal porque:

- depende del texto del error;
- no incorpora jitter;
- no usa `Retry-After`;
- no diferencia timeout antes de envío y timeout después de posible commit;
- no clasifica conflictos, validación, autorización, rate limit, indisponibilidad o error permanente mediante códigos canónicos;
- no establece un máximo canónico de edad o intentos para todas las colas;
- no existe una cola de fallos durable común.

**Hallazgo:** `H-CODE-018-004`  
**Estado:** `PARCIAL`  
**Severidad:** alta  
**Destino:** `TSVC-CAT-006`, `QUEUE-ARC-006`, `QUEUE-ARC-008`, `NFR-REQ-004`, `NFR-REQ-009`.  
**Prueba:** `TREQ-INTEGRATION-003`.

Decisión propuesta:

Cada frontera deberá devolver una clasificación estable:

```text
RETRYABLE_NETWORK
RETRYABLE_TIMEOUT_UNKNOWN_COMMIT
RETRYABLE_RATE_LIMIT
RETRYABLE_SERVER
CONFLICT_VERSION
DUPLICATE_APPLIED
DENIED
INVALID
EXPIRED
PERMANENT_FAILURE
```

La política de reintento deberá depender del código, no de texto libre.

---

#### 11. Brecha crítica: redención de puntos de PASS no atómica

El flujo vigente de redención:

1. consulta el producto y su costo;
2. consulta el saldo del usuario;
3. genera un QR en el cliente;
4. inserta la redención;
5. inserta una transacción de gasto;
6. intenta borrar la redención si falla la segunda inserción.

No existe una única operación de servidor que bloquee o versione el saldo y confirme ambos registros juntos. Tampoco existe una clave idempotente de redención.

Carrera posible:

```text
solicitud A lee 100 puntos
solicitud B lee 100 puntos
A valida costo 80
B valida costo 80
A crea redención
B crea redención
A registra -80
B registra -80
```

Fallo parcial posible:

```text
se crea redención
→ se pierde conexión o falla ledger
→ el cliente intenta compensar con delete
→ la compensación falla o se repite
→ queda redención huérfana o estado ambiguo
```

**Hallazgo:** `H-CODE-018-005`  
**Estado:** `CONFIRMADO`  
**Severidad:** crítica  
**Destino:** `PULSO-AUTH-010`, `PASS-INT-002`, `PASS-QA-002`, `INT-SALES-006`, `INT-SALES-007`.  
**Prueba:** reutiliza `TREQ-PASS-008`.

Decisión propuesta:

La redención deberá ejecutarse mediante una única acción de servidor atómica e idempotente que:

- reciba clave estable de operación;
- bloquee o versione el saldo;
- valide producto, sede, estado, costo y actor;
- cree redención y movimiento de puntos en una misma transacción;
- genere o reserve el código de canje en servidor;
- devuelva el mismo resultado ante replay;
- impida saldo negativo y doble gasto;
- audite validación, cancelación y reversión.

---

#### 12. Control parcial: creación de pagos con referencia persistida

El flujo de pagos conserva controles positivos:

- una transacción previa con `idempotency_key` persistida;
- uso de esa clave como referencia del proveedor;
- validación de propietario, proveedor, moneda, monto y estado;
- estados `pending` y `requires_action`;
- conciliación periódica de checkouts vencidos;
- bloqueo de fila durante la actualización del estado recibida por webhook.

Esto reduce el riesgo de crear referencias empresariales diferentes para el mismo registro de pago.

Clasificación:

```text
referencia estable de proveedor  CONTROL_PRESENTE
validación de propietario         CONTROL_PRESENTE
bloqueo al aplicar estado         CONTROL_PRESENTE
creación concurrente de intentos  PARCIAL
replay completo                   REQUIERE_PRUEBA_CONCURRENTE
```

---

#### 13. Brecha de pagos: intentos concurrentes con resultado mutable

Dos solicitudes simultáneas de creación de intent pueden leer la misma transacción en `pending` o `requires_action`, generar expiraciones distintas y construir URLs diferentes con la misma referencia. La RPC posterior actualiza `raw_request`, pero no demuestra un claim exclusivo que garantice que solo una solicitud construya el resultado canónico.

Consecuencias posibles:

- dos respuestas distintas para la misma transacción;
- sobrescritura de la solicitud persistida;
- diferencia entre la URL abierta por el cliente y el snapshot conservado;
- expiraciones competidoras;
- conciliación difícil después de una respuesta perdida.

**Hallazgo:** `H-CODE-018-006`  
**Estado:** `REQUIERE_PRUEBA_CONCURRENTE`, con brecha contractual confirmada  
**Severidad:** alta  
**Destino:** `INT-EXT-012`, `INT-EXT-015`, `SUPA-ARC-020`, `PASS-QA-001`, `PASS-QA-002`.  
**Prueba:** `TREQ-PASS-009`.

Decisión propuesta:

La creación de intento deberá reclamar la transacción de manera atómica y conservar un resultado reutilizable. Un replay válido deberá devolver la URL y expiración ya asignadas mientras sigan vigentes, o crear una nueva versión explícita después de expirar la anterior.

---

#### 14. Brecha de pagos: deduplicación de webhook separada del efecto

El webhook:

1. verifica la firma;
2. consulta si el evento ya está procesado;
3. aplica el estado de la transacción;
4. registra o actualiza el evento como procesado.

El registro de eventos tiene una clave única y la actualización de la transacción usa bloqueo de fila, ambos controles positivos. Sin embargo, la secuencia de consulta, efecto y registro no es una única operación atómica.

Dos entregas concurrentes pueden superar la consulta antes de que cualquiera marque el evento. Además, cuando el proveedor no entrega un ID utilizable se genera un UUID nuevo, por lo que dos replays del mismo payload no compartirían clave de deduplicación.

También falta una política explícita para eventos válidos fuera de orden, por ejemplo:

```text
approved
→ webhook retrasado de rejected

refunded
→ replay posterior de approved
```

**Hallazgo:** `H-CODE-018-007`  
**Estado:** `PARCIAL` / `REQUIERE_PRUEBA_CONCURRENTE`  
**Severidad:** crítica  
**Destino:** `SUPA-AUD-014`, `SUPA-ARC-020`, `INT-EXT-010`, `INT-EXT-012`, `INT-EXT-015`.  
**Prueba:** `TREQ-PASS-009` y `TREQ-INTEGRATION-003`.

Decisión propuesta:

La recepción del webhook deberá:

- derivar una clave determinista del identificador del proveedor o de un hash canónico aprobado;
- reclamar el evento atómicamente antes del efecto;
- conservar payload original, firma, hash, fechas y número de intento;
- aplicar una máquina de estados monotónica o una regla explícita de precedencia;
- registrar efecto y evento en una misma transacción o mediante outbox/inbox reconciliable;
- devolver éxito estable para duplicados ya procesados.

---

#### 15. Brecha crítica: ajustes de inventario NEXO no son atómicos

La ruta de ajuste vigente:

1. lee stock de sede;
2. lee stock de LOC;
3. lee stock de posición;
4. calcula el delta en la aplicación;
5. inserta el movimiento;
6. actualiza la proyección por sede;
7. actualiza la proyección por LOC;
8. actualiza la proyección por posición;
9. puede actualizar costo del producto;
10. puede insertar un evento de costo.

Estas operaciones se ejecutan secuencialmente fuera de una transacción única.

Carrera posible:

```text
A lee stock 10
B lee stock 10
A suma 5 y escribe 15
B resta 3 y escribe 7
resultado esperado 12
resultado final posible 7
```

Fallo parcial posible:

```text
movimiento insertado
→ stock de sede actualizado
→ falla stock de LOC
→ la respuesta devuelve error
→ el usuario reintenta
→ se inserta otro movimiento
```

**Hallazgo:** `H-CODE-018-008`  
**Estado:** `CONFIRMADO`  
**Severidad:** crítica  
**Destino:** `NEXO-AUTH-011`, `SUPA-AUD-019`, `SUPA-AUD-022`, `SUPA-AUD-023`, `SHELL-CON-023`.  
**Prueba:** reutiliza `TREQ-SUPABASE-002`.

Decisión propuesta:

Todo ajuste deberá procesarse en servidor mediante un contrato que:

- reciba clave idempotente;
- bloquee o versione el stock objetivo;
- inserte el ledger una sola vez;
- actualice o derive las proyecciones de sede, LOC y posición dentro de la misma transacción;
- actualice costo y evento asociado de forma atómica cuando corresponda;
- devuelva el resultado previo ante replay;
- rechace la misma clave con payload diferente;
- preserve conciliación y reconstrucción desde la fuente de verdad.

---

#### 16. Brecha crítica: recepción ORIGO compone múltiples efectos sin transacción única

La creación de una recepción puede ejecutar, entre otros efectos:

- inserción de cabecera;
- inserción de líneas;
- vinculación de firma de dispositivo compartido;
- inserción de movimientos;
- actualización de stock por sede;
- actualización por LOC;
- actualización de costos;
- inserción de eventos de costo;
- incremento de cantidad recibida por línea de orden;
- cambio de estado de orden de compra;
- creación de solicitudes de maestro de datos;
- cierre de relación entre recepción original y corrección.

No existe una clave idempotente de recepción ni una transacción única que abarque el efecto empresarial completo.

El propio código reconoce estados parciales mediante mensajes como:

```text
la recepción se registró,
pero no se pudieron guardar las solicitudes...
```

o:

```text
la recepción corregida se creó,
pero no se pudo cerrar la auditoría...
```

La corrección además puede reversar primero la recepción original y fallar antes de crear o vincular la sustituta.

**Hallazgo:** `H-CODE-018-009`  
**Estado:** `CONFIRMADO`  
**Severidad:** crítica  
**Destino:** `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016`, `INT-PROC-002`, `INT-PROC-003`, `INT-PROC-005`.  
**Prueba:** `TREQ-ORIGO-003`.

Decisión propuesta:

La recepción deberá convertirse en una operación de servidor transaccional e idempotente. La corrección deberá ser una transición compuesta indivisible o una saga durable que nunca deje la original reversada sin un estado explícito y recuperable de sustitución pendiente.

---

#### 17. Brecha alta: cola de impresión NEXO no es una cola empresarial durable

La cola de impresión actual:

- es texto guardado en `localStorage` del navegador;
- no registra un ID durable por trabajo;
- no tiene actor, sede, área, dispositivo, plantilla, versión ni payload hash canónicos;
- envía ZPL directamente mediante BrowserPrint;
- vacía la cola inmediatamente después de invocar el envío;
- no espera el callback de éxito antes de retirar el trabajo;
- no puede distinguir con certeza envío, recepción por bridge, procesamiento por impresora o salida física;
- no conserva una cola de fallos ni reintentos auditables;
- no separa reintento técnico de reimpresión empresarial.

Fallo posible:

```text
se invoca send
→ la interfaz limpia localStorage
→ BrowserPrint devuelve error
→ el trabajo ya no está en cola
```

Ambigüedad posible:

```text
la impresora recibió el trabajo
→ se pierde el callback
→ el usuario reimprime
→ sale una etiqueta duplicada
```

**Hallazgo:** `H-CODE-018-010`  
**Estado:** `CONFIRMADO`  
**Severidad:** alta  
**Destino:** `NEXO-UX-037`, `NEXO-UX-038`, `PRINT-ARC-006`, `PRINT-ARC-010`, `PRINT-ARC-011`, `PRINT-ARC-012`, `PRINT-ARC-014`, `PRINT-ARC-017`.  
**Prueba:** reutiliza `TREQ-NEXO-005`.

Decisión propuesta:

Un trabajo no se retirará antes de una confirmación definida. Cuando el periférico no pueda confirmar impresión física, el sistema deberá distinguir al menos:

```text
queued
claimed
sent_to_adapter
adapter_acknowledged
unknown_outcome
failed
cancelled
reprint_requested
```

La reimpresión deberá crear una acción nueva, enlazada con el trabajo original y con motivo obligatorio cuando corresponda.

---

#### 18. Remisiones: idempotencia todavía no demostrada de extremo a extremo

Las tareas previas ya comprobaron que las remisiones pueden operar en modo de registro y que la publicación de movimientos reales no está uniformemente consolidada.

Para `CODE-AUD-018` no se declara un defecto nuevo adicional sin una prueba completa de todas las transiciones. Se conserva el riesgo existente:

- activar inventario después de operar en modo registro;
- reintentar preparación, despacho, tránsito o recepción;
- mezclar efectos por LOC;
- conciliar operaciones históricas;
- repetir movimientos después de una respuesta perdida.

**Hallazgo:** `H-CODE-018-011`  
**Estado:** `REQUIERE_PRUEBA_DE_RECUPERACIÓN`  
**Severidad:** crítica por impacto potencial  
**Destino:** `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013`, `INT-SALES-007`, `SHELL-CON-023`.  
**Prueba:** reutiliza `TREQ-NEXO-006`.

No se afirma que exista doble contabilización actual. Se afirma que el contrato exactamente una vez todavía no está demostrado.

---

#### 19. Brecha transversal: protecciones locales no sustituyen concurrencia de servidor

Se identificaron controles útiles como:

- `actionInFlightRef`;
- `syncInFlightRef`;
- botones deshabilitados;
- estados `loading`;
- procesamiento secuencial dentro de una instancia;
- comparación local del último estado conocido.

Estos mecanismos reducen repeticiones accidentales dentro de la misma instancia, pero no resuelven:

- dos dispositivos del mismo actor;
- dos actores sobre el mismo recurso;
- dos pestañas;
- dos procesos de servidor;
- dos webhooks;
- una respuesta perdida;
- un reintento después de reinicio;
- una cola recuperada en otro dispositivo.

**Hallazgo:** `H-CODE-018-012`  
**Estado:** `GOBIERNO` con manifestaciones confirmadas en flujos específicos  
**Severidad:** alta  
**Destino:** `NFR-REQ-002`, `TSVC-CAT-006`, `QUEUE-ARC-009`, `SHELL-CON-023`, `INT-APP-004`.  
**Prueba:** `TREQ-INTEGRATION-003`.

Decisión propuesta:

Toda integridad crítica deberá estar protegida en la frontera que posee la fuente de verdad. El cliente podrá mejorar experiencia, pero nunca será la única defensa contra duplicación o carrera.

---

#### 20. Brecha transversal: no existe contrato canónico de operación pendiente

Fuera de ANIMA no se encontró una semántica común para diferenciar:

```text
local_draft
queued
sending
server_received
processing
applied
duplicate
conflict
retry_scheduled
failed_permanent
cancelled
expired
unknown_outcome
```

Como resultado, distintas superficies pueden usar “guardado”, “enviado”, “registrado”, “procesado” o “impreso” con significados diferentes.

**Hallazgo:** `H-CODE-018-013`  
**Estado:** `NO_IMPLEMENTADO`  
**Severidad:** alta  
**Destino:** `NFR-REQ-004`, `UX-STATION-007`, `TSVC-CAT-006`, `QUEUE-ARC-002`, `QUEUE-ARC-010`, `INT-APP-008`.  
**Prueba:** `TREQ-INTEGRATION-003`.

Decisión propuesta:

Cada proceso deberá declarar:

- estado local;
- estado de transporte;
- estado de procesamiento;
- estado empresarial;
- mensaje visible;
- acción permitida;
- responsable de recuperación;
- tiempo máximo antes de escalar.

---

#### 21. Brecha transversal: no existe registro canónico de idempotencia

Los patrones actuales son heterogéneos:

| Patrón                | Ejemplo                | Limitación                                                             |
| --------------------- | ---------------------- | ---------------------------------------------------------------------- |
| restricción única     | marcaciones ANIMA      | localizada a una tabla y tipo de evento                                |
| referencia persistida | pagos                  | no cubre por sí sola claim, respuesta estable y eventos fuera de orden |
| comprobación previa   | webhook                | puede competir antes de registrar el claim                             |
| comparación de estado | descansos              | consulta y efecto no son una unidad atómica                            |
| bloqueo local         | formularios y acciones | no protege concurrencia distribuida                                    |
| compensación cliente  | redención PASS         | no garantiza reversión                                                 |
| reenvío manual        | múltiples formularios  | puede crear una nueva operación duplicada                              |
| cola local de texto   | impresión NEXO         | no conserva identidad ni acuse durable                                 |

**Hallazgo:** `H-CODE-018-014`  
**Estado:** `GOBIERNO`  
**Severidad:** alta  
**Destino:** `SHELL-CON-023`, `TSVC-CAT-006`, `QUEUE-ARC-003`, `INT-APP-004`, `INT-EXT-012`, `INT-DB-005`.  
**Prueba:** `TREQ-INTEGRATION-003`.

Contrato mínimo propuesto:

```text
operation_id
operation_type
actor_id
subject_id o device_id
resource_type
resource_id o draft_fingerprint
payload_hash
contract_version
client_occurred_at
server_received_at
status
result_reference
attempt_count
last_error_code
expires_at
```

Reglas:

1. la clave se genera antes del primer intento;
2. permanece igual durante todos los reintentos de la misma intención;
3. el servidor guarda hash y versión del payload;
4. misma clave + mismo hash devuelve el resultado anterior;
5. misma clave + hash distinto produce conflicto;
6. la retención supera la ventana máxima de replay;
7. las claves no contienen secretos ni PII innecesaria;
8. el ámbito evita colisiones entre dominios y actores;
9. el resultado conserva referencia al recurso o evento creado;
10. la limpieza del registro es controlada y auditable.

---

#### 22. Brecha transversal: falta patrón outbox/inbox para efectos asíncronos

Las integraciones actuales combinan:

- escrituras de dominio;
- triggers;
- Edge Functions;
- notificaciones;
- webhooks;
- cron;
- GitHub Actions;
- callbacks de periféricos.

No se ha demostrado un patrón transversal en el que:

```text
transacción de negocio
+ evento de salida durable
→ commit único
→ entrega reintentable
→ consumidor deduplicado
→ auditoría y conciliación
```

Tampoco se ha demostrado una inbox canónica para eventos externos.

**Hallazgo:** `H-CODE-018-015`  
**Estado:** `GOBIERNO`  
**Severidad:** alta  
**Destino:** `SUPA-AUD-014`, `SUPA-ARC-020`, `QUEUE-ARC-001`, `QUEUE-ARC-002`, `QUEUE-ARC-003`, `QUEUE-ARC-006`, `QUEUE-ARC-008`, `QUEUE-ARC-009`, `INT-DB-007`.  
**Prueba:** `TREQ-INTEGRATION-003`.

No se impone todavía una tecnología específica. E3 y E4 deberán decidir cuándo usar:

- transacción directa;
- outbox;
- inbox;
- cron reconciliador;
- cola gestionada;
- worker;
- Edge Function;
- adaptador local;
- compensación.

---

#### 23. Borradores locales y operación degradada

Se encontraron usos legítimos de almacenamiento local o de sesión para:

- cola de asistencia;
- borrador de recepción ORIGO;
- cola y configuración de impresión;
- sesión y preferencias;
- caches de lectura.

Cada uso deberá clasificarse por separado:

| Tipo                     | Puede comunicar “operación realizada” | Debe sincronizar             | Requiere idempotencia de servidor |
| ------------------------ | ------------------------------------- | ---------------------------- | --------------------------------- |
| preferencia local        | no                                    | no necesariamente            | no                                |
| cache de lectura         | no                                    | refresca                     | no para lectura                   |
| borrador local           | no                                    | solo cuando el usuario envía | sí al enviar una mutación crítica |
| cola offline empresarial | solo como “pendiente”                 | sí                           | sí                                |
| trabajo periférico       | solo según estado confirmado          | sí o adaptador local         | sí                                |

**Hallazgo:** `H-CODE-018-016`  
**Estado:** `GOBIERNO`  
**Severidad:** media  
**Destino:** `NFR-REQ-004`, `UX-STATION-007`, `ANIMA-UX-011`, `PRINT-ARC-017`.  
**Prueba:** cubierta por `TREQ-ANIMA-003`, `TREQ-NEXO-005` y `TREQ-INTEGRATION-003`.

---

#### 24. Política canónica propuesta de operación offline

Cada capacidad deberá elegir explícitamente una modalidad:

| Modalidad                | Comportamiento                                                               |
| ------------------------ | ---------------------------------------------------------------------------- |
| `ONLINE_REQUIRED`        | bloquea envío sin conexión y conserva borrador cuando corresponda            |
| `READ_CACHED`            | permite consulta de snapshot claramente fechado, sin presentarlo como actual |
| `LOCAL_DRAFT`            | permite preparar datos, pero no afirma efecto empresarial                    |
| `OFFLINE_QUEUED`         | acepta intención durable y la sincroniza con idempotencia y revalidación     |
| `LOCAL_PERIPHERAL_QUEUE` | entrega a adaptador local con estados y acuses definidos                     |
| `MANUAL_CONTINGENCY`     | usa procedimiento alterno documentado y posterior conciliación               |

Una aplicación no será declarada “offline” de forma global. La modalidad pertenece a cada capacidad.

Toda capacidad `OFFLINE_QUEUED` deberá definir:

- motivo empresarial que justifica offline;
- actor y dispositivo permitidos;
- datos mínimos que pueden conservarse localmente;
- cifrado y retención;
- clave idempotente;
- versión o snapshot del recurso;
- vencimiento;
- orden relativo con otros eventos;
- política de revalidación;
- resolución de conflicto;
- UX de estado pendiente;
- mecanismo de reintento;
- procedimiento de recuperación;
- auditoría;
- prueba de reinstalación, reinicio y múltiples dispositivos.

---

#### 25. Política canónica propuesta de reintentos

Reglas mínimas:

1. Un retry conserva `operation_id` y payload lógico.
2. Los errores de validación, permiso o conflicto no se reintentan automáticamente.
3. Los timeouts de resultado desconocido se reintentan consultando primero el resultado por clave.
4. Los rate limits respetan `Retry-After` cuando exista.
5. El backoff usa exponencial con jitter y límite.
6. Toda cola define intentos máximos, edad máxima y expiración.
7. Al agotar política, el trabajo pasa a fallo permanente o cola de revisión.
8. Un operador autorizado puede reintentar sin cambiar la identidad de la operación original.
9. Una corrección del payload crea una nueva operación y referencia la anterior.
10. Los reintentos no omiten autorización, validación ni control de versión.
11. El sistema registra intento, fecha, error, duración y resultado.
12. Las respuestas duplicadas no se muestran como errores cuando el efecto ya existe.

---

#### 26. Política canónica propuesta de concurrencia

Cada mutación deberá declarar:

| Campo                 | Pregunta obligatoria                                                       |
| --------------------- | -------------------------------------------------------------------------- |
| recurso protegido     | ¿qué entidad o agregado no puede modificarse simultáneamente sin control?  |
| granularidad          | ¿fila, producto+sede, pedido, turno, caja, LPN, recepción, pago o trabajo? |
| versión               | ¿qué versión leyó el cliente?                                              |
| estrategia            | ¿bloqueo, versión optimista, unique, serialización, reserva o combinación? |
| transición            | ¿qué estados de origen permiten la acción?                                 |
| resultado concurrente | ¿espera, conflicto, duplicate o merge?                                     |
| compensación          | ¿qué ocurre si un efecto secundario falla?                                 |
| auditoría             | ¿qué actor, operación y versión quedan registrados?                        |

No se permitirá un patrón de lectura-modificación-escritura de cantidades críticas sin bloqueo, compare-and-swap o función atómica en servidor.

---

#### 27. Política canónica propuesta de tiempo y orden

Las acciones offline y asíncronas deberán conservar dos tiempos:

```text
client_occurred_at
→ cuándo afirma el dispositivo que ocurrió la acción

server_received_at / server_applied_at
→ cuándo fue recibida y aplicada por la fuente de verdad
```

El reloj del dispositivo no definirá por sí solo precedencia, cierre contable, turno, vencimiento, saldo ni orden definitivo.

Cuando el orden sea relevante se deberá incluir:

- secuencia por agregado;
- versión esperada;
- dependencia de evento anterior;
- política para huecos;
- política para eventos tardíos;
- política para expirados;
- resolución humana cuando no sea seguro ordenar automáticamente.

---

#### 28. Política canónica propuesta de confirmación visible

Los mensajes deberán corresponder al estado real:

| Estado técnico        | Mensaje admisible                             |
| --------------------- | --------------------------------------------- |
| borrador local        | “Borrador guardado en este dispositivo”       |
| cola persistida       | “Pendiente de sincronización”                 |
| servidor recibió      | “Recibido; procesando”                        |
| aplicado              | “Registrado” o equivalente empresarial        |
| duplicado aplicado    | “Ya estaba registrado”                        |
| conflicto             | “No se aplicó porque el recurso cambió”       |
| resultado desconocido | “Verificando resultado; no repitas la acción” |
| fallo permanente      | “No se aplicó; requiere revisión”             |

No se comunicará éxito definitivo inmediatamente después de:

- una actualización optimista;
- guardar en memoria;
- invocar `send` a un periférico;
- iniciar un `fetch`;
- recibir un timeout;
- crear solo una parte de una operación compuesta.

---

#### 29. Inventario consolidado de hallazgos y destinos

| ID               | Hallazgo                                                                    | Estado / severidad                          | Destino exacto                                                                                                                                                                                        | Requisito                               |
| ---------------- | --------------------------------------------------------------------------- | ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| `H-CODE-018-001` | ANIMA puede comunicar cola aunque falle persistencia en SecureStore         | `CONFIRMADO` / crítica                      | `ANIMA-AUTH-014`; `ANIMA-UX-011`; `ANIMA-UX-012`; `AUTH-QA-026`; `NFR-REQ-004`                                                                                                                        | `TREQ-ANIMA-003`                        |
| `H-CODE-018-002` | descansos no demuestran deduplicación atómica por `clientEventId`           | `CONFIRMADO` / alta                         | `ANIMA-AUTH-014`; `ANIMA-AUTH-015`; `QUEUE-ARC-003`; `QUEUE-ARC-009`; `AUTH-QA-026`                                                                                                                   | `TREQ-ANIMA-004`                        |
| `H-CODE-018-003` | fallback de marcación evita el contrato completo de sincronización          | `CONFIRMADO` / alta                         | `SUPA-TRANS-006`; `CODE-AUD-020`; `ANIMA-AUTH-015`                                                                                                                                                    | `TREQ-ANIMA-003`; `TREQ-SUPABASE-001`   |
| `H-CODE-018-004` | política de retry depende de heurísticas y no es transversal                | `PARCIAL` / alta                            | `TSVC-CAT-006`; `QUEUE-ARC-006`; `QUEUE-ARC-008`; `NFR-REQ-004`; `NFR-REQ-009`                                                                                                                        | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-005` | redención PASS se compone en cliente sin atomicidad ni clave idempotente    | `CONFIRMADO` / crítica                      | `PULSO-AUTH-010`; `PASS-INT-002`; `PASS-QA-002`; `INT-SALES-006`; `INT-SALES-007`                                                                                                                     | `TREQ-PASS-008`                         |
| `H-CODE-018-006` | creación concurrente de intentos puede producir respuestas distintas        | `REQUIERE_PRUEBA_CONCURRENTE` / alta        | `INT-EXT-012`; `INT-EXT-015`; `SUPA-ARC-020`; `PASS-QA-002`                                                                                                                                           | `TREQ-PASS-009`                         |
| `H-CODE-018-007` | webhook consulta duplicado antes del efecto y registra después              | `PARCIAL` / crítica                         | `SUPA-AUD-014`; `SUPA-ARC-020`; `INT-EXT-010`; `INT-EXT-012`; `INT-EXT-015`                                                                                                                           | `TREQ-PASS-009`; `TREQ-INTEGRATION-003` |
| `H-CODE-018-008` | ajuste NEXO actualiza ledger, proyecciones y costo secuencialmente          | `CONFIRMADO` / crítica                      | `NEXO-AUTH-011`; `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SHELL-CON-023`                                                                                                                      | `TREQ-SUPABASE-002`                     |
| `H-CODE-018-009` | recepción y corrección ORIGO pueden quedar parcialmente aplicadas           | `CONFIRMADO` / crítica                      | `ORIGO-UX-009`; `ORIGO-UX-010`; `ORIGO-UX-014`; `ORIGO-UX-016`; `INT-PROC-002`; `INT-PROC-003`; `INT-PROC-005`                                                                                        | `TREQ-ORIGO-003`                        |
| `H-CODE-018-010` | impresión retira trabajo antes del callback de éxito                        | `CONFIRMADO` / alta                         | `NEXO-UX-037`; `NEXO-UX-038`; `PRINT-ARC-006`; `PRINT-ARC-010`; `PRINT-ARC-011`; `PRINT-ARC-012`; `PRINT-ARC-014`; `PRINT-ARC-017`                                                                    | `TREQ-NEXO-005`                         |
| `H-CODE-018-011` | exactamente una vez en remisiones no está demostrado                        | `REQUIERE_PRUEBA_DE_RECUPERACIÓN` / crítica | `NEXO-UX-009`; `NEXO-UX-010`; `NEXO-UX-011`; `NEXO-UX-012`; `NEXO-UX-013`; `INT-SALES-007`; `SHELL-CON-023`                                                                                           | `TREQ-NEXO-006`                         |
| `H-CODE-018-012` | bloqueos locales no protegen concurrencia distribuida                       | `GOBIERNO` / alta                           | `NFR-REQ-002`; `TSVC-CAT-006`; `QUEUE-ARC-009`; `SHELL-CON-023`; `INT-APP-004`                                                                                                                        | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-013` | no existe estado común de operación pendiente                               | `NO_IMPLEMENTADO` / alta                    | `NFR-REQ-004`; `UX-STATION-007`; `QUEUE-ARC-002`; `QUEUE-ARC-010`; `INT-APP-008`                                                                                                                      | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-014` | no existe registro canónico de idempotencia                                 | `GOBIERNO` / alta                           | `SHELL-CON-023`; `TSVC-CAT-006`; `QUEUE-ARC-003`; `INT-APP-004`; `INT-EXT-012`; `INT-DB-005`                                                                                                          | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-015` | no existe patrón transversal outbox/inbox                                   | `GOBIERNO` / alta                           | `SUPA-AUD-014`; `SUPA-ARC-020`; `QUEUE-ARC-001`; `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-004`; `QUEUE-ARC-005`; `QUEUE-ARC-006`; `QUEUE-ARC-007`; `QUEUE-ARC-008`; `QUEUE-ARC-009`; `INT-DB-007` | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-016` | borrador, cache, cola y efecto confirmado no están clasificados globalmente | `GOBIERNO` / media                          | `NFR-REQ-004`; `UX-STATION-007`; `ANIMA-UX-011`; `PRINT-ARC-017`                                                                                                                                      | requisitos asociados                    |

Todos los hallazgos tienen destino.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 30. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 30.1. Requisitos reutilizados

- `TREQ-PASS-008` — redención y ledger atómicos e idempotentes;
- `TREQ-NEXO-005` — cola de impresión no pierde ni duplica trabajos;
- `TREQ-NEXO-006` — remisiones y movimientos no producen doble contabilización;
- `TREQ-SUPABASE-001` — fallback legacy con paridad y retiro controlado;
- `TREQ-SUPABASE-002` — operaciones de inventario atómicas o reconciliables.

No se cambia su estado.

##### 30.2. Requisitos nuevos

- `TREQ-ANIMA-003` — una marcación offline solo se presenta como encolada después de persistencia durable; sobrevive reinicio y reintentos y produce un único efecto confirmado por `client_event_id`;
- `TREQ-ANIMA-004` — inicio y cierre de descanso usan identificador idempotente, transición atómica y resultado estable frente a replay, carrera y eventos fuera de orden;
- `TREQ-PASS-009` — creación de intentos y recepción de webhooks de pago resisten solicitudes concurrentes, duplicadas, tardías y fuera de orden sin duplicar ni retroceder efectos;
- `TREQ-ORIGO-003` — una recepción, su efecto de inventario, costo, orden y auditoría se confirman atómicamente o quedan en estado recuperable; el replay no crea una segunda recepción;
- `TREQ-INTEGRATION-003` — toda operación asíncrona o reintentable conserva clave, hash, versión, resultado y política de retry; mismo evento no produce más de un efecto y payload diferente con la misma clave genera conflicto.

Las filas canónicas completas deberán agregarse exclusivamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 31. Decisiones propuestas

1. La operación offline se definirá por capacidad, no por aplicación completa.
2. Se distinguirán `ONLINE_REQUIRED`, `READ_CACHED`, `LOCAL_DRAFT`, `OFFLINE_QUEUED`, `LOCAL_PERIPHERAL_QUEUE` y `MANUAL_CONTINGENCY`.
3. Un borrador local nunca equivaldrá a una operación empresarial registrada.
4. Una cola solo podrá comunicar estado pendiente después de confirmar persistencia durable.
5. Toda intención reintentable obtendrá un `operation_id` estable antes del primer envío.
6. Todos los reintentos de la misma intención reutilizarán la misma clave y el mismo payload lógico.
7. Misma clave y mismo hash devolverán el resultado estable anterior.
8. Misma clave y payload distinto producirán conflicto.
9. Toda cola offline revalidará actor, permiso, contexto, recurso, versión y vigencia en servidor.
10. Una acción offline pendiente no activará por sí sola contexto, autorización, saldo, stock, pago ni transición terminal.
11. Los errores se clasificarán por códigos canónicos y no únicamente por texto.
12. Los reintentos automáticos usarán backoff con jitter, límites de intentos y edad, expiración y cola de fallos.
13. Un timeout de resultado desconocido se resolverá consultando por clave antes de generar una operación nueva.
14. Los bloqueos de interfaz se conservarán como UX, pero no se considerarán integridad.
15. Las cantidades y transiciones críticas se protegerán mediante bloqueo, versión, unique, serialización o compare-and-swap en servidor.
16. Las operaciones compuestas usarán transacción única o una saga durable e idempotente.
17. Las compensaciones de mejor esfuerzo desde el cliente no sustituirán atomicidad.
18. Webhooks y colas se diseñarán bajo entrega al menos una vez.
19. Todo webhook reclamará o registrará el evento atómicamente antes de producir efectos.
20. Los eventos externos conservarán payload, firma, hash, fuente, intento y fechas.
21. Las máquinas de estado definirán tratamiento de eventos duplicados, tardíos y fuera de orden.
22. La redención PASS se trasladará a una acción de servidor atómica e idempotente.
23. La creación de intentos de pago devolverá un resultado canónico reutilizable para la transacción vigente.
24. El webhook de pagos no dependerá de un UUID aleatorio para deduplicar un evento sin ID del proveedor.
25. Los ajustes de inventario no actualizarán ledger y proyecciones mediante escrituras independientes desde una ruta de aplicación.
26. Las recepciones ORIGO y sus correcciones se convertirán en operaciones atómicas o sagas recuperables.
27. Un trabajo de impresión no se eliminará antes del acuse definido.
28. Reimpresión y retry técnico serán acciones diferentes y auditables.
29. ANIMA conservará su índice único y resultados `applied`, `duplicate` y `conflict` como patrón positivo.
30. ANIMA no degradará silenciosamente a un contrato de inserción alternativo cuando falte la RPC canónica.
31. Los descansos incorporarán idempotencia real en servidor.
32. El sistema conservará hora del dispositivo y hora de servidor sin usar el reloj cliente como única precedencia.
33. E3 decidirá persistencia, constraints, bloqueo, outbox/inbox y conciliación.
34. E4 decidirá contratos de cola, impresión, notificaciones, reintentos y fallos.
35. E5 asignará cada requisito a un paquete con pruebas de pérdida de red, replay, concurrencia, recuperación y hardware cuando aplique.
36. Los cinco requisitos nuevos se registrarán únicamente en `04A`.
37. No se crea una tarea nueva del roadmap.
38. `CODE-AUD-019` permanecerá como única continuidad reservada después de la aprobación.

---

#### 32. Límites de certeza

Esta tarea no confirma:

- que una duplicación o pérdida ya haya ocurrido en producción;
- el comportamiento de SecureStore cuando el sistema operativo elimina credenciales o la aplicación se reinstala;
- la misma semántica de almacenamiento entre iOS y Android;
- que dos webhooks concurrentes hayan aplicado un efecto dos veces;
- que Wompi entregue eventos sin identificador;
- la precedencia final aprobada entre estados de pago fuera de orden;
- qué nivel de confirmación física soporta cada modelo de impresora;
- que BrowserPrint pueda confirmar impresión material y no solo recepción del comando;
- la atomicidad interna de RPC no inspeccionadas en esta tarea;
- la cobertura completa de cada transición de remisiones;
- el comportamiento del POS externo ante replay;
- los límites de rate, timeout y retry de proveedores externos;
- la política final de retención de claves idempotentes;
- la tecnología definitiva de cola, worker, outbox o inbox;
- qué capacidades adicionales deberán admitir operación offline después del diseño E2.

Estas incertidumbres tienen destino en tareas existentes y no invalidan los defectos estáticos confirmados.

---

#### 33. Criterios de aceptación

`CODE-AUD-018` podrá aprobarse cuando:

- operación offline, borrador local, cache y cola periférica estén diferenciados;
- la única cola empresarial offline actual quede identificada;
- los controles positivos de ANIMA queden preservados;
- la pérdida posible por fallo de persistencia local quede documentada;
- los descansos queden separados de la idempotencia de marcaciones normales;
- el fallback de sincronización quede clasificado;
- reintento y nueva operación no se confundan;
- los errores retryable y permanentes requieran códigos canónicos;
- la redención PASS quede clasificada como no atómica;
- intentos y webhooks de pagos queden evaluados por replay y concurrencia;
- ajustes NEXO queden evaluados por carrera, atomicidad y reintento;
- recepción ORIGO quede evaluada como operación compuesta;
- la cola de impresión no se considere durable ni confirmada;
- remisiones conserven su requisito de exactamente una vez sin afirmar un fallo no probado;
- los bloqueos locales no se presenten como control distribuido;
- exista una política propuesta de modalidad offline;
- exista una política propuesta de idempotencia, retry, tiempo, orden y confirmación visible;
- cada hallazgo tenga destino documental exacto;
- los requisitos reutilizados y nuevos tengan identificador único;
- las filas completas nuevas se incorporen únicamente en `04A`;
- no se creen tareas redundantes;
- no se modifique código, CI, despliegues ni Supabase;
- `CODE-AUD-019` permanezca como continuidad reservada.

---

#### 34. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
capacidad y modalidad de conectividad
→ operación identificada antes del primer envío
→ persistencia local cuando corresponda
→ reintento con la misma identidad
→ revalidación y control de versión en servidor
→ deduplicación y concurrencia
→ transacción o saga recuperable
→ resultado estable
→ confirmación visible correcta
→ auditoría, conciliación y prueba
```

La continuidad será:

```text
CODE-AUD-019
— Vincular cada capacidad con su implementación actual verificable
```


### ✅ CODE-AUD-019 — Vincular cada capacidad con su implementación actual verificable

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** consolidación transversal de trazabilidad capacidad → implementación → contrato → evidencia → brecha  
**Dependencia anterior:** `CODE-AUD-018` — APROBADA  
**Continuidad reservada:** `CODE-AUD-020`  
**Línea base funcional:** `LB-CAP-VENTO-001 v1.0` — 18 familias y 217 subcapacidades  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no realizados  

---

#### 1. Resultado de esta tarea

Esta tarea crea el registro `MAP-IMPL-CAP-001`, que vincula individualmente las **217 subcapacidades** de `LB-CAP-VENTO-001 v1.0` con la implementación actual que puede comprobarse mediante repositorios, superficies, contratos de servidor, objetos de datos, despliegues, uso operativo o evidencia manual y externa.

La cadena aprobable será:

```text
capacidad empresarial
→ aplicación propietaria candidata
→ repositorio o medio que la representa actualmente
→ ruta, acción, contrato, dato, dispositivo o tercero
→ estado de vinculación verificable
→ limitación o brecha
→ tarea exacta que deberá resolverla
```

Resultado cuantitativo:

| Estado de vinculación                      | Subcapacidades |
| ------------------------------------------ | -------------: |
| `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         |         **29** |
| `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        |         **96** |
| `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` |         **27** |
| `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   |         **48** |
| `SIN_IMPLEMENTACIÓN_VERIFICABLE`           |         **16** |
| `FUTURA_CON_BASE_TÉCNICA`                  |          **1** |
| **Total**                                  |        **217** |

Las cantidades describen la evidencia localizada en el corte. No equivalen a porcentaje de avance, prioridad ni aceptación operativa.

---

#### 2. Qué significa vincular una capacidad

Una capacidad queda vinculada cuando el registro identifica, como mínimo:

1. su identificador y resultado empresarial;
2. la aplicación propietaria candidata aprobada;
3. el repositorio, servicio, archivo, documento, dispositivo o tercero que la representa hoy;
4. una superficie o contrato reproducible;
5. la persistencia, evento o evidencia que conserva el resultado;
6. el estado real de esa vinculación;
7. la limitación que impide declararla completa;
8. la tarea exacta que deberá convertir la brecha en backlog, diseño o implementación.

No basta con encontrar:

- un permiso;
- una tabla;
- una ruta;
- un componente;
- un prototipo;
- una pantalla vacía;
- una migración histórica;
- una aplicación registrada;
- una operación manual no confirmada.

La vinculación debe conservar la diferencia entre **existencia técnica**, **uso comprobado**, **estructura sin uso**, **operación manual o externa**, **ausencia** y **base futura**.

---

#### 3. Estados de vinculación

| Estado                                     | Regla                                                                                                                                                                |
| ------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | se localizaron superficie, contrato y persistencia, además de datos o evidencia de operación suficiente; puede seguir siendo parcial respecto del resultado objetivo |
| `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | existe una representación reproducible, pero faltan etapas, autorización, adopción, corrección, auditoría, integración o evidencia de uso completa                   |
| `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | existen código, tablas, RPC o pantallas, pero no datos o adopción operativa comprobada                                                                               |
| `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | el resultado se obtiene actualmente mediante personas, archivos, papel, mensajes, sistemas externos o terceros; no se presenta como implementación interna           |
| `SIN_IMPLEMENTACIÓN_VERIFICABLE`           | no se localizó una representación técnica suficiente ni evidencia operativa concreta para vincular el resultado sin inventarlo                                       |
| `FUTURA_CON_BASE_TÉCNICA`                  | existe una base técnica reutilizable, pero no un producto desplegado, adoptado y aprobado como operación actual                                                      |

Un estado de vinculación no sustituye los estados de cobertura de `CAP-MAP-014`, la clasificación empresarial de `CAP-MAP-012` ni la propiedad definitiva que se resolverá en `CAP-SCOPE-001` a `CAP-SCOPE-019`.

---

#### 4. Fuentes y corte de evidencia

El mapa consolida exclusivamente evidencia ya obtenida en:

- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-018`;
- repositorios reconocidos de Vento OS;
- proyecto Supabase `vento-os-dev`;
- despliegues Vercel, Expo/EAS y tiendas comprobados;
- procesos manuales, externos y documentos registrados en `OPS-AUD-*` y `OPS-PLAN-*`;
- requisitos de prueba vigentes en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

El repositorio `vento-shell` se reconoce como propietario técnico de migraciones y contratos compartidos. No se convierte por ello en propietario empresarial de todas las capacidades.

---

#### 5. Paquetes de evidencia reutilizables

Cada fila de la matriz referencia uno o más paquetes. El paquete permite repetir evidencia sin ocultar la vinculación individual de las 217 subcapacidades.

| Código   | Paquete                                   | Evidencia reproducible                                                                                                                                                                                                                                                                                                                              |
| -------- | ----------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EVC-01` | Gobierno y estructura VISO                | `vento-viso`: Server Actions de empresas, sedes, áreas, roles, permisos y navegación; relaciones `companies`, `sites`, `areas`, `roles`, `app_permissions`, `role_permissions` y `employee_permissions`. Contraste: `CODE-AUD-003`, `005`, `006`, `009`, `014` y `017`.                                                                             |
| `EVC-02` | Personas, turnos e invitaciones           | `vento-viso` y `vento-shell`: trabajadores, perfiles, sedes, áreas, turnos, publicación, invitaciones y retiro; Edge Functions `staff-invitations-*`, `attendance-report`, `employee-delete` y `shift-runtime-processor`. Contraste: `CODE-AUD-003`, `005`, `006`, `011`, `012` y `017`.                                                            |
| `EVC-03` | Asistencia y experiencia ANIMA            | `vento-anima`: pantallas y hooks de asistencia; `queue-storage.ts`, `queue-sync.ts`, `use-attendance.ts`, `break-rpc.ts`; RPC `sync_attendance_events`, `start_attendance_break`, `end_attendance_break`; cron de cierre. Contraste: `CODE-AUD-003`, `005`, `006`, `012`, `017` y `018`.                                                            |
| `EVC-04` | Base técnica TALENTO                      | `vento-talento`: vacantes, postulación, perfil, documentos, entrevistas y ofertas; RPC `bootstrap_my_candidate`, `submit_application`, `confirm_interview`, `respond_to_offer`; esquema `talento` y buckets privados. No hay despliegue ni registros operativos comprobados. Contraste: `CAP-MAP-014`, `CODE-AUD-001`, `003`, `005`, `006` y `011`. |
| `EVC-05` | Catálogo de producto NEXO/VISO            | `vento-nexo` y `vento-viso`: productos, categorías, presentaciones, unidades, ingredientes, imágenes, menú y disponibilidad; buckets `nexo-catalog-images`, `product-images` y `commercial-menu-images`. Contraste: `CODE-AUD-003`, `005`, `006`, `014` y `017`.                                                                                    |
| `EVC-06` | Recetas y conocimiento FOGO               | `vento-fogo`: acciones de recetas, ingredientes, salidas, pasos, rendimientos y fotos; bucket `recipe-step-photos`; tablas de recetas con datos. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006` y `012`.                                                                                                                                    |
| `EVC-07` | Compras y proveedores ORIGO               | `vento-origo`: proveedores, órdenes, líneas, revisión maestra y recepción; Server Actions y RPC `origo_mark_inventory_entry_corrected`, `origo_reverse_inventory_entry`, `upsert_inventory_stock_by_location`. La recepción nueva conserva estructura sin adopción comprobada. Contraste: `CODE-AUD-003`, `005`, `006`, `012`, `017` y `018`.       |
| `EVC-08` | Inventario, ubicaciones y remisiones NEXO | `vento-nexo`: existencias, movimientos, entradas, ubicaciones, posiciones, conteos, solicitudes, remisiones y traslados; APIs `/api/inventory/*`; RPC de conteo, consumo, recepción, reversión y remisión. Contraste: `CODE-AUD-003`, `005`, `006`, `011`, `012`, `014`, `017` y `018`.                                                             |
| `EVC-09` | Activos y reutilizables NEXO              | `vento-nexo`: activos, grupos, custodia, movimientos, mantenimiento, conteos, documentos y vehículos. Hay superficies y tablas; mantenimiento y conteos patrimoniales no tienen uso comprobado. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011` y `012`.                                                                              |
| `EVC-10` | Ejecución productiva FOGO                 | `vento-fogo` y objetos compartidos: solicitudes, lotes, consumos, salidas, paquetes, cantidades, firma de dispositivo y efectos de inventario. Las estructuras productivas revisadas no tienen registros operativos comprobados. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011`, `012` y `018`.                                      |
| `EVC-11` | Pedidos, venta, salón y POS PULSO         | `vento-pulso`: pedidos, transiciones, conversación, atención de mesa, identificación, importación de ventas y RPC POS; Realtime de pedidos y mensajes. El POS integral, caja y cierre conservan tablas sin uso comprobado. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011`, `012`, `014`, `017` y `018`.                              |
| `EVC-12` | Cliente, fidelización y comercio PASS     | `vento-pass`: perfil, membresía, QR, redención, direcciones, checkout, pedido, pago, seguimiento, chat, Wallet y notificaciones; RPC de wallet, checkout, chat y entrega; Edge Functions de pago, dirección, entrega y cuenta. Contraste: `CODE-AUD-003`, `005`, `006`, `008` a `018`.                                                              |
| `EVC-13` | Transporte y entrega                      | NEXO cubre traslados y remisiones; PULSO/PASS cubren pedido y entrega; `delivery-portal` remoto opera por token y `service_role`; las sesiones de entrega nuevas no tienen uso comprobado. Contraste: `CODE-AUD-005`, `006`, `011`, `012`, `015`, `017` y `018`.                                                                                    |
| `EVC-14` | Finanzas, pagos y costos                  | `vento-numera`: gastos, centros de costo, presupuestos y resúmenes; PULSO/PASS: pagos y venta; ORIGO/NEXO: costos, compras y documentos internos. Bancos, cartera, tesorería, impuestos y cierre contable no están completos. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011`, `012`, `017` y `018`.                                  |
| `EVC-15` | Instalaciones                             | Sedes, áreas, ubicaciones y activos permiten identificar espacios y equipos, pero no existe módulo ni ciclo dedicado para mantenimiento de instalaciones, limpieza, plagas, servicios, calibración, llaves, obras y cierre de novedades. Contraste: `CAP-MAP-014`, `CODE-AUD-011`, `012` y `015`.                                                   |
| `EVC-16` | CMS y web pública                         | `vento-viso`: `website_blocks`, `website_items`, medios y publicación; `Vento-Group`: rutas públicas y contenido; `website-media` requiere reconciliar su entrega. Newsletter no tiene efecto. Contraste: `CODE-AUD-003`, `006`, `010`, `012`, `014`, `017` y `018`.                                                                                |
| `EVC-17` | Tecnología, autorización y periféricos    | `vento-shell`, SHELL y aplicaciones: Auth, contexto efectivo, permisos, dispositivos compartidos, navegación, builds, workflows, soporte ANIMA e impresión NEXO/BrowserPrint. Contraste: `CODE-AUD-001`, `003`, `005`, `006`, `011`, `012`, `014`, `016`, `017` y `018`.                                                                            |
| `EVC-18` | Documentos y evidencia                    | ANIMA/VISO usan `documents`; VISO usa medios e imágenes; TALENTO usa tres buckets privados; existen reglas, tipos y solicitudes, pero retención, versiones, firmas, acceso temporal y eliminación integral siguen incompletos. Contraste: `CODE-AUD-003`, `006`, `012`, `015` y `017`.                                                              |
| `EVC-19` | Reportes y analítica                      | NUMERA ofrece resúmenes, equilibrio y rentabilidad; NEXO y VISO exportan o reportan dominios puntuales; PULSO carece de exportación de auditoría comprobada. No existe marco común completo de indicadores, calidad y mejora. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011` y `016`.                                                |
| `EVC-20` | Continuidad y recuperación                | Existen colas offline ANIMA, tickets, cron, reconciliación de pagos, account deletion, backups de plataforma y estados técnicos aislados; no existe un ciclo empresarial integral de continuidad, incorporación posterior y cierre de pendientes. Contraste: `CAP-MAP-014`, `CODE-AUD-005`, `006`, `011`, `016` y `018`.                            |
| `EVC-21` | Operación manual o externa                | Evidencia AS-IS en papel, Excel, WhatsApp, Makos, Rappi, ManyChat, Shopify, bancos, asesores, proveedores y coordinación humana. Esta evidencia demuestra que la capacidad existe, no que esté implementada en Vento OS. Contraste: `OPS-AUD-*`, `OPS-PLAN-*`, `CAP-MAP-005`, `014` y `CODE-AUD-003`.                                               |
| `EVC-22` | Ausencia técnica comprobada               | No se localizó una ruta, servicio, contrato, objeto de datos y ciclo utilizable suficiente para el resultado. La ausencia se conserva como brecha y no se transforma en código ficticio. Contraste: `CAP-MAP-014`, `CODE-AUD-010`, `011`, `012` y `015`.                                                                                            |
| `EVC-23` | Plataforma Supabase compartida            | `vento-shell` conserva migraciones, RLS, funciones, triggers, Edge Functions, cron y contratos compartidos. Es propietario técnico de la plataforma, no propietario empresarial universal. Contraste: `CODE-AUD-005`, `006`, `013`, `014`, `015`, `017` y `018`.                                                                                    |

---

#### 6. Reglas de lectura de la matriz

1. **Propietaria candidata** conserva las decisiones de `CAP-MAP-004`; no es propiedad definitiva.
2. **Implementación actual localizada** describe dónde se representa hoy el resultado, aunque la representación sea parcial, manual o inexistente.
3. **Evidencia** remite a los paquetes de la sección 5 y a las auditorías allí enumeradas.
4. **Destino** siempre contiene tareas existentes; `CODE-AUD-020` deberá convertir la evidencia en backlog técnico y funcional por repositorio.
5. Una fila `VERIFICADA_EN_USO` no declara terminada la capacidad TO-BE.
6. Una fila `ESTRUCTURA_SIN_USO_COMPROBADO` no autoriza poblar datos ni desplegar el flujo.
7. Una fila `MANUAL_O_EXTERNA_DOCUMENTADA` no autoriza eliminar el método actual antes del reemplazo y la transición.
8. Una fila `SIN_IMPLEMENTACIÓN_VERIFICABLE` no se interpreta como capacidad innecesaria.

---

#### 7. Matriz completa de las 217 subcapacidades

##### 7.1. `CAP-01` — Dirección y gobierno

| ID          | Subcapacidad                                    | Propietaria candidata | Implementación actual localizada                                        | Evidencia          | Estado de vinculación                    | Destino exacto                  |
| ----------- | ----------------------------------------------- | --------------------- | ----------------------------------------------------------------------- | ------------------ | ---------------------------------------- | ------------------------------- |
| `CAP-01.01` | Definir dirección y objetivos                   | VISO                  | Decisión o relación humana; VISO conserva estructura relacionada.       | `EVC-01`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.02` | Tomar y registrar decisiones empresariales      | VISO                  | Decisión o relación humana; VISO conserva estructura relacionada.       | `EVC-01`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.03` | Gobernar empresas, marcas y establecimientos    | VISO                  | VISO: empresas, sedes, áreas y estructura organizativa desplegada.      | `EVC-01`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.04` | Gobernar sedes, oficinas y áreas                | VISO                  | VISO: empresas, sedes, áreas y estructura organizativa desplegada.      | `EVC-01`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.05` | Definir responsabilidades y límites de decisión | VISO                  | VISO: roles, permisos, reglas y coordinación administrativa parcial.    | `EVC-01`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.06` | Gestionar políticas y reglas internas           | VISO                  | VISO: roles, permisos, reglas y coordinación administrativa parcial.    | `EVC-01`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.07` | Gestionar riesgos empresariales                 | VISO                  | VISO: roles, permisos, reglas y coordinación administrativa parcial.    | `EVC-01`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.08` | Coordinar operación entre negocios y sedes      | VISO                  | VISO: roles, permisos, reglas y coordinación administrativa parcial.    | `EVC-01`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.09` | Gestionar relaciones con asesores y autoridades | VISO                  | Decisión o relación humana; VISO conserva estructura relacionada.       | `EVC-01`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.10` | Verificar cumplimiento de decisiones            | VISO                  | No se localizó ciclo técnico para comprobar cumplimiento de decisiones. | `EVC-01`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-001` |

##### 7.2. `CAP-02` — Personas y trabajo

| ID          | Subcapacidad                                | Propietaria candidata         | Implementación actual localizada                                                             | Evidencia                              | Estado de vinculación                    | Destino exacto                                                                                                            |
| ----------- | ------------------------------------------- | ----------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `CAP-02.01` | Planear necesidades de personal             | VISO                          | VISO: administración laboral parcial.                                                        | `EVC-02`                               | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.02` | Reclutar y seleccionar                      | TALENTO + VISO                | VISO publica vacantes; TALENTO tiene código y esquema sin despliegue ni datos.               | `EVC-04`, `EVC-02`                     | `FUTURA_CON_BASE_TÉCNICA`                | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-TAL-001`, `CAP-TAL-002`, `CAP-TAL-003`, `CAP-TAL-004`, `CAP-TAL-005`, `CAP-TAL-006` |
| `CAP-02.03` | Vincular e incorporar trabajadores          | TALENTO → VISO / ANIMA        | VISO/Edge Functions gestionan invitación; ANIMA completa acceso; traspaso TALENTO pendiente. | `EVC-04`, `EVC-02`, `EVC-03`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-TAL-001`, `CAP-TAL-002`, `CAP-TAL-003`, `CAP-TAL-004`, `CAP-TAL-005`, `CAP-TAL-006` |
| `CAP-02.04` | Mantener información laboral                | VISO                          | VISO: empleados, sedes, áreas, perfiles y turnos con datos operativos.                       | `EVC-02`                               | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.05` | Asignar sedes, áreas y funciones            | VISO                          | VISO: empleados, sedes, áreas, perfiles y turnos con datos operativos.                       | `EVC-02`                               | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.06` | Programar turnos                            | VISO                          | VISO: empleados, sedes, áreas, perfiles y turnos con datos operativos.                       | `EVC-02`                               | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.07` | Registrar asistencia y tiempo trabajado     | ANIMA                         | ANIMA: marcación, ubicación, descansos, cola offline y RPC de sincronización.                | `EVC-03`, `EVC-23`                     | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `INT-WORK-003`, `ANIMA-UX-011`, `ANIMA-UX-012`                                           |
| `CAP-02.08` | Gestionar novedades, ausencias y reemplazos | VISO                          | VISO/ANIMA: novedades y asistencia parcial, sin corrección auditable completa.               | `EVC-02`, `EVC-03`                     | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `INT-WORK-003`, `ANIMA-UX-011`, `ANIMA-UX-012`                                           |
| `CAP-02.09` | Capacitar y comprobar preparación           | VISO                          | Seguimiento principalmente humano; documentos y datos parciales en VISO/ANIMA.               | `EVC-02`, `EVC-21`                     | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.10` | Acompañar desempeño y desarrollo            | VISO                          | Seguimiento principalmente humano; documentos y datos parciales en VISO/ANIMA.               | `EVC-02`, `EVC-21`                     | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.11` | Gestionar documentos laborales              | ANIMA / VISO / TALENTO        | Storage y tablas laborales en ANIMA/VISO; TALENTO conserva base futura.                      | `EVC-18`, `EVC-02`, `EVC-03`, `EVC-04` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-TAL-001`, `CAP-TAL-002`, `CAP-TAL-003`, `CAP-TAL-004`, `CAP-TAL-005`, `CAP-TAL-006` |
| `CAP-02.12` | Gestionar pagos y beneficios laborales      | NUMERA (candidata pendiente)  | Pago laboral atendido fuera del sistema; NUMERA no cubre nómina completa.                    | `EVC-14`, `EVC-21`                     | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.13` | Gestionar retiro y cierre de accesos        | VISO + aplicaciones afectadas | VISO y Edge Functions permiten retiro parcial; cierre transversal de accesos incompleto.     | `EVC-02`, `EVC-17`                     | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-TAL-001`, `CAP-TAL-002`, `CAP-TAL-003`, `CAP-TAL-004`, `CAP-TAL-005`, `CAP-TAL-006` |

##### 7.3. `CAP-03` — Seguridad, salud y cumplimiento

| ID          | Subcapacidad                                 | Propietaria candidata | Implementación actual localizada                                                             | Evidencia                    | Estado de vinculación               | Destino exacto                  |
| ----------- | -------------------------------------------- | --------------------- | -------------------------------------------------------------------------------------------- | ---------------------------- | ----------------------------------- | ------------------------------- |
| `CAP-03.01` | Identificar peligros y riesgos laborales     | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.02` | Prevenir accidentes y enfermedades           | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.03` | Entregar y controlar elementos de protección | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.04` | Reportar e investigar incidentes             | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.05` | Gestionar emergencias y evacuación           | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.06` | Controlar higiene e inocuidad                | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.07` | Realizar inspecciones obligatorias           | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.08` | Gestionar requisitos legales y certificados  | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.09` | Conservar evidencia de cumplimiento          | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.10` | Gestionar acciones correctivas               | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |

##### 7.4. `CAP-04` — Productos, preparaciones y conocimiento

| ID          | Subcapacidad                                  | Propietaria candidata | Implementación actual localizada                                                    | Evidencia                    | Estado de vinculación               | Destino exacto                  |
| ----------- | --------------------------------------------- | --------------------- | ----------------------------------------------------------------------------------- | ---------------------------- | ----------------------------------- | ------------------------------- |
| `CAP-04.01` | Definir productos y servicios                 | NEXO                  | NEXO/VISO: catálogo, presentaciones, unidades, categorías e ingredientes con datos. | `EVC-05`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.02` | Definir presentaciones y unidades             | NEXO                  | NEXO/VISO: catálogo, presentaciones, unidades, categorías e ingredientes con datos. | `EVC-05`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.03` | Clasificar productos                          | NEXO                  | NEXO/VISO: catálogo, presentaciones, unidades, categorías e ingredientes con datos. | `EVC-05`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.04` | Gestionar ingredientes y componentes          | NEXO                  | NEXO/VISO: catálogo, presentaciones, unidades, categorías e ingredientes con datos. | `EVC-05`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.05` | Definir recetas y métodos de preparación      | FOGO                  | FOGO: recetas, pasos, rendimientos y porciones con persistencia comprobada.         | `EVC-06`, `EVC-05`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.06` | Definir rendimientos y porciones              | FOGO                  | FOGO: recetas, pasos, rendimientos y porciones con persistencia comprobada.         | `EVC-06`, `EVC-05`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.07` | Gestionar menús y disponibilidad              | PULSO                 | VISO/NEXO/PULSO/PASS: menú, oferta y disponibilidad parcial por canal.              | `EVC-05`, `EVC-11`, `EVC-12` | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.08` | Gestionar información nutricional y alérgenos | NEXO / FOGO           | NEXO/FOGO: campos y reglas parciales de especificación, calidad y vigencia.         | `EVC-05`, `EVC-06`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.09` | Gestionar calidad y especificaciones          | NEXO / FOGO           | NEXO/FOGO: campos y reglas parciales de especificación, calidad y vigencia.         | `EVC-05`, `EVC-06`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.10` | Gestionar cambios y vigencia del conocimiento | NEXO / FOGO           | NEXO/FOGO: campos y reglas parciales de especificación, calidad y vigencia.         | `EVC-05`, `EVC-06`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-004` |

##### 7.5. `CAP-05` — Abastecimiento

| ID          | Subcapacidad                                | Propietaria candidata | Implementación actual localizada                                                                   | Evidencia                    | Estado de vinculación                      | Destino exacto                                                                                  |
| ----------- | ------------------------------------------- | --------------------- | -------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| `CAP-05.01` | Planear necesidades de abastecimiento       | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.02` | Solicitar productos, materiales o servicios | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.03` | Buscar y evaluar proveedores                | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.04` | Solicitar y comparar ofertas                | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.05` | Negociar condiciones                        | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.06` | Aprobar compras                             | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.07` | Emitir y controlar órdenes                  | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.08` | Recibir productos y servicios               | ORIGO                 | ORIGO: recepción y verificación implementadas como estructura; cero uso comprobado.                | `EVC-07`, `EVC-08`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.09` | Verificar cantidades, calidad y documentos  | ORIGO                 | ORIGO: recepción y verificación implementadas como estructura; cero uso comprobado.                | `EVC-07`, `EVC-08`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.10` | Gestionar diferencias y devoluciones        | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.11` | Evaluar cumplimiento de proveedores         | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.12` | Gestionar compras urgentes                  | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |

##### 7.6. `CAP-06` — Inventario y almacenamiento

| ID          | Subcapacidad                                   | Propietaria candidata | Implementación actual localizada                                                          | Evidencia          | Estado de vinculación                    | Destino exacto                                                                                             |
| ----------- | ---------------------------------------------- | --------------------- | ----------------------------------------------------------------------------------------- | ------------------ | ---------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `CAP-06.01` | Definir lugares de almacenamiento              | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.02` | Identificar productos, lotes y recipientes     | NEXO                  | NEXO: productos, lotes/LPN y recipientes; ciclo LPN todavía incompleto.                   | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.03` | Registrar entradas                             | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.04` | Ubicar y reubicar existencias                  | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.05` | Consultar disponibilidad                       | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.06` | Reservar o separar existencias                 | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.07` | Registrar consumo y salida                     | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.08` | Trasladar entre lugares                        | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.09` | Solicitar y gestionar remisiones               | NEXO                  | NEXO: remisiones y estados con uso piloto/parcial; efectos de inventario por reconciliar. | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.10` | Preparar y despachar remisiones                | NEXO                  | NEXO: remisiones y estados con uso piloto/parcial; efectos de inventario por reconciliar. | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.11` | Recibir y confirmar remisiones                 | NEXO                  | NEXO: remisiones y estados con uso piloto/parcial; efectos de inventario por reconciliar. | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.12` | Contar inventario                              | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.13` | Investigar y ajustar diferencias               | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.14` | Controlar vencimiento, daño y pérdida          | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.15` | Controlar frío y condiciones de almacenamiento | NEXO                  | Condiciones de frío se controlan operativamente; no hay integración técnica completa.     | `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |

##### 7.7. `CAP-07` — Activos y reutilizables

| ID          | Subcapacidad                                        | Propietaria candidata | Implementación actual localizada                                                              | Evidencia          | Estado de vinculación                      | Destino exacto                  |
| ----------- | --------------------------------------------------- | --------------------- | --------------------------------------------------------------------------------------------- | ------------------ | ------------------------------------------ | ------------------------------- |
| `CAP-07.01` | Identificar y clasificar activos                    | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.02` | Registrar ubicación y custodia                      | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.03` | Entregar, prestar y devolver                        | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.04` | Transferir custodia                                 | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.05` | Contar activos y reutilizables                      | NEXO                  | NEXO: sesiones y líneas de conteo patrimonial sin uso comprobado.                             | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.06` | Registrar condición, daño, pérdida y faltante       | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.07` | Planear y ejecutar mantenimiento                    | NEXO                  | NEXO: estructura de mantenimiento/garantías/baja; adopción no comprobada o ejecución externa. | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.08` | Gestionar reparación y repuestos                    | NEXO                  | NEXO: estructura de mantenimiento/garantías/baja; adopción no comprobada o ejecución externa. | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.09` | Controlar garantías y seguros                       | NEXO                  | NEXO: estructura de mantenimiento/garantías/baja; adopción no comprobada o ejecución externa. | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.10` | Gestionar baja, venta, descarte o reemplazo         | NEXO                  | NEXO: estructura de mantenimiento/garantías/baja; adopción no comprobada o ejecución externa. | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.11` | Gestionar kits y conjuntos                          | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.12` | Gestionar vehículos y equipos de transporte         | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.13` | Controlar combustible, kilometraje y disponibilidad | NEXO                  | Combustible, kilometraje y disponibilidad se controlan fuera del ciclo canónico.              | `EVC-09`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-007` |

##### 7.8. `CAP-08` — Producción

| ID          | Subcapacidad                                   | Propietaria candidata | Implementación actual localizada                                                                                    | Evidencia                    | Estado de vinculación                      | Destino exacto                                                                                                                           |
| ----------- | ---------------------------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `CAP-08.01` | Recopilar necesidades de producción            | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.02` | Planear cantidades y fechas                    | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.03` | Revisar capacidad, personal, equipos e insumos | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.04` | Priorizar trabajo productivo                   | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.05` | Programar producción                           | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.06` | Preparar ingredientes y materiales             | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.07` | Ejecutar lotes o preparaciones                 | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.08` | Registrar cantidades producidas                | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.09` | Registrar consumo, rendimiento y merma         | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.10` | Controlar calidad durante producción           | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.11` | Empacar y etiquetar                            | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.12` | Liberar, retener o rechazar producto           | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.13` | Gestionar reproceso y aprovechamiento          | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.14` | Cerrar y conciliar producción                  | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |

##### 7.9. `CAP-09` — Venta, cobro y pedidos

| ID          | Subcapacidad                                               | Propietaria candidata | Implementación actual localizada                                                               | Evidencia                    | Estado de vinculación                      | Destino exacto                                                                |
| ----------- | ---------------------------------------------------------- | --------------------- | ---------------------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------ | ----------------------------------------------------------------------------- |
| `CAP-09.01` | Definir oferta y precios de venta                          | PULSO                 | VISO/NEXO/PULSO: oferta y precios disponibles por catálogo y menú.                             | `EVC-05`, `EVC-11`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.02` | Recibir solicitudes y pedidos                              | PULSO                 | PASS/PULSO y sistemas externos registran pedidos digitales con uso limitado.                   | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.03` | Confirmar disponibilidad y condiciones                     | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.04` | Registrar pedidos                                          | PULSO                 | PASS/PULSO y sistemas externos registran pedidos digitales con uso limitado.                   | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.05` | Modificar, sustituir o cancelar pedidos                    | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.06` | Enviar pedidos a preparación                               | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.07` | Coordinar preparación y entrega                            | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.08` | Registrar ventas                                           | PULSO                 | Pedidos/pagos digitales parciales; POS, caja, corrección y facturación integral no operativos. | `EVC-11`, `EVC-12`, `EVC-14` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.09` | Cobrar y confirmar pagos                                   | PULSO                 | Pedidos/pagos digitales parciales; POS, caja, corrección y facturación integral no operativos. | `EVC-11`, `EVC-12`, `EVC-14` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.10` | Emitir factura o soporte                                   | PULSO                 | Pedidos/pagos digitales parciales; POS, caja, corrección y facturación integral no operativos. | `EVC-11`, `EVC-12`, `EVC-14` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.11` | Gestionar mesas y servicio presencial                      | PULSO                 | PULSO: sesiones de salón y llamados de mesa con comportamiento real localizado.                | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.12` | Gestionar pedidos para llevar                              | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.13` | Gestionar pedidos recibidos por aplicaciones o mensajes    | PULSO                 | Makos/Rappi/ManyChat/WhatsApp y coordinación humana; integración canónica pendiente.           | `EVC-11`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.14` | Gestionar pedidos especiales, catering y ventas a empresas | PULSO                 | Makos/Rappi/ManyChat/WhatsApp y coordinación humana; integración canónica pendiente.           | `EVC-11`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.15` | Cerrar y revisar la jornada de venta                       | PULSO                 | Tablas de sesión y cierre POS existen sin jornada propia comprobada.                           | `EVC-11`, `EVC-12`, `EVC-14` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |

##### 7.10. `CAP-10` — Clientes y relaciones

| ID          | Subcapacidad                             | Propietaria candidata | Implementación actual localizada                                               | Evidencia                    | Estado de vinculación                      | Destino exacto                                 |
| ----------- | ---------------------------------------- | --------------------- | ------------------------------------------------------------------------------ | ---------------------------- | ------------------------------------------ | ---------------------------------------------- |
| `CAP-10.01` | Identificar y conocer clientes           | PASS / PULSO          | PASS/public.users: identidad de cliente y perfil con datos.                    | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.02` | Registrar preferencias y autorizaciones  | PASS / PULSO          | PASS/PULSO: perfil, chat, mensajes, preferencias y comunicación parcial.       | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.03` | Atender preguntas y solicitudes          | PULSO                 | PASS/PULSO: perfil, chat, mensajes, preferencias y comunicación parcial.       | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.04` | Recibir y resolver reclamos              | PULSO                 | Atención manual o por chat; no existe ciclo canónico completo.                 | `EVC-12`, `EVC-11`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.05` | Gestionar devoluciones y compensaciones  | PULSO                 | Atención manual o por chat; no existe ciclo canónico completo.                 | `EVC-12`, `EVC-11`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.06` | Medir satisfacción                       | PULSO                 | Tabla de feedback y superficies relacionadas sin uso comprobado.               | `EVC-12`, `EVC-11`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.07` | Gestionar fidelización y beneficios      | PASS / PULSO          | PASS: membresía, wallet y redención; ledger y atomicidad requieren corrección. | `EVC-12`, `EVC-11`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.08` | Gestionar reservas y eventos             | PULSO                 | Atención manual o por chat; no existe ciclo canónico completo.                 | `EVC-12`, `EVC-11`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.09` | Comunicar cambios que afecten al cliente | PULSO                 | PASS/PULSO: perfil, chat, mensajes, preferencias y comunicación parcial.       | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.10` | Proteger información del cliente         | PULSO                 | PASS/PULSO: perfil, chat, mensajes, preferencias y comunicación parcial.       | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |

##### 7.11. `CAP-11` — Transporte, despacho y entrega

| ID          | Subcapacidad                              | Propietaria candidata | Implementación actual localizada                                                  | Evidencia                                        | Estado de vinculación                      | Destino exacto                                                 |
| ----------- | ----------------------------------------- | --------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------ | ------------------------------------------ | -------------------------------------------------------------- |
| `CAP-11.01` | Planear necesidades de transporte         | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.02` | Definir recorridos y prioridades          | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.03` | Asignar vehículo y responsable            | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.04` | Preparar carga                            | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.05` | Confirmar cantidades y condición al salir | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.06` | Transferir custodia para transporte       | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.07` | Ejecutar recorrido                        | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.08` | Registrar novedades durante transporte    | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.09` | Entregar y confirmar recepción            | NEXO / PULSO          | Sesiones de entrega y portal existen; uso operativo nuevo no comprobado.          | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.10` | Gestionar faltantes, daños y devoluciones | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.11` | Cerrar y revisar el recorrido             | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.12` | Gestionar entregas mediante terceros      | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |

##### 7.12. `CAP-12` — Dinero, costos y obligaciones

| ID          | Subcapacidad                       | Propietaria candidata | Implementación actual localizada                                                                     | Evidencia                                        | Estado de vinculación                      | Destino exacto                  |
| ----------- | ---------------------------------- | --------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------ | ------------------------------------------ | ------------------------------- |
| `CAP-12.01` | Registrar hechos económicos        | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.02` | Gestionar caja                     | PULSO                 | PULSO conserva modelo de caja y sesiones sin uso comprobado.                                         | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.03` | Gestionar bancos y pagos           | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.04` | Gestionar cuentas por cobrar       | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.05` | Gestionar cuentas por pagar        | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.06` | Facturar y controlar documentos    | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.07` | Conciliar ventas, pagos y entregas | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.08` | Conciliar compras y recepciones    | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.09` | Calcular costos                    | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.10` | Distribuir costos compartidos      | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.11` | Gestionar presupuestos             | NUMERA                | NUMERA tiene tablas de presupuesto sin registros operativos comprobados.                             | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.12` | Gestionar tesorería                | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.13` | Gestionar impuestos y obligaciones | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.14` | Cerrar períodos y emitir reportes  | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.15` | Analizar rentabilidad              | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |

##### 7.13. `CAP-13` — Instalaciones

| ID          | Subcapacidad                                | Propietaria candidata | Implementación actual localizada                                                   | Evidencia          | Estado de vinculación               | Destino exacto                  |
| ----------- | ------------------------------------------- | --------------------- | ---------------------------------------------------------------------------------- | ------------------ | ----------------------------------- | ------------------------------- |
| `CAP-13.01` | Inventariar espacios e instalaciones        | NEXO                  | VISO/NEXO identifican sedes, áreas, ubicaciones y activos.                         | `EVC-15`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.02` | Planear mantenimiento                       | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.03` | Solicitar y ejecutar reparaciones           | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.04` | Gestionar limpieza y saneamiento            | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.05` | Controlar plagas                            | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.06` | Controlar agua, energía, gas y servicios    | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.07` | Inspeccionar condiciones                    | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.08` | Calibrar equipos                            | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.09` | Gestionar llaves, acceso físico y seguridad | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.10` | Gestionar obras y adecuaciones              | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.11` | Registrar y cerrar novedades                | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |

##### 7.14. `CAP-14` — Comunicación y promoción

| ID          | Subcapacidad                                 | Propietaria candidata                 | Implementación actual localizada                                                                | Evidencia                    | Estado de vinculación                    | Destino exacto                                                 |
| ----------- | -------------------------------------------- | ------------------------------------- | ----------------------------------------------------------------------------------------------- | ---------------------------- | ---------------------------------------- | -------------------------------------------------------------- |
| `CAP-14.01` | Definir identidad y mensajes                 | VISO CMS / AURA futura                | Identidad y mensajes existen en configuración, CMS y aplicaciones, sin gobierno único completo. | `EVC-16`                     | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.02` | Planear comunicación y promociones           | VISO CMS / AURA futura                | CMS y operación manual cubren una parte; AURA no existe como aplicación.                        | `EVC-16`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.03` | Crear y aprobar contenido                    | VISO CMS / AURA futura                | VISO CMS y web pública crean, publican y presentan contenido con datos.                         | `EVC-16`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.04` | Publicar y administrar medios                | VISO CMS / AURA futura                | VISO CMS y web pública crean, publican y presentan contenido con datos.                         | `EVC-16`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.05` | Gestionar campañas                           | AURA futura / operación actual manual | No se localizó implementación canónica suficiente; AURA continúa diferida.                      | `EVC-16`, `EVC-21`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.06` | Gestionar promociones y cupones              | PULSO / PASS / AURA futura            | PASS/PULSO/VISO contienen beneficios, disponibilidad y reglas promocionales parciales.          | `EVC-12`, `EVC-11`, `EVC-16` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.07` | Captar oportunidades de venta                | AURA futura / operación actual manual | No se localizó implementación canónica suficiente; AURA continúa diferida.                      | `EVC-16`, `EVC-21`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.08` | Gestionar ventas a empresas                  | AURA futura / operación actual manual | Ventas empresariales, catering y eventos se coordinan manualmente.                              | `EVC-16`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.09` | Gestionar catering y eventos comerciales     | AURA futura / operación actual manual | Ventas empresariales, catering y eventos se coordinan manualmente.                              | `EVC-16`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.10` | Medir resultados de comunicación y promoción | AURA futura / operación actual manual | No se localizó implementación canónica suficiente; AURA continúa diferida.                      | `EVC-16`, `EVC-21`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.11` | Gestionar reputación y comentarios públicos  | AURA futura / operación actual manual | CMS y operación manual cubren una parte; AURA no existe como aplicación.                        | `EVC-16`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |

##### 7.15. `CAP-15` — Tecnología y soporte

| ID          | Subcapacidad                                         | Propietaria candidata                     | Implementación actual localizada                                                                     | Evidencia                    | Estado de vinculación                    | Destino exacto                                                  |
| ----------- | ---------------------------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------------------- | ---------------------------- | ---------------------------------------- | --------------------------------------------------------------- |
| `CAP-15.01` | Gestionar cuentas y accesos                          | VISO / SHELL / aplicación afectada        | SHELL/VISO/aplicaciones: Auth, permisos, contexto y dispositivos; controles de servidor desiguales.  | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.02` | Gestionar computadores, celulares y tabletas         | NEXO / aplicación afectada                | NEXO y dispositivos compartidos representan equipos parcialmente.                                    | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.03` | Gestionar redes y conectividad                       | NEXO / aplicación afectada                | Redes y conectividad se administran fuera de una aplicación canónica.                                | `EVC-17`, `EVC-23`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.04` | Gestionar impresoras y periféricos                   | NEXO / aplicación afectada                | NEXO: impresión BrowserPrint/ZPL y colas locales; periféricos sin gobierno integral.                 | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.05` | Gestionar aplicaciones y proveedores tecnológicos    | SHELL / VENTO-SHELL                       | SHELL/vento-shell: catálogo, navegación, repositorios, despliegues y proveedores técnicos parciales. | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.06` | Atender solicitudes de soporte                       | Aplicación afectada + soporte transversal | ANIMA: tickets y mensajes de soporte; no es mesa de servicio transversal completa.                   | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.07` | Gestionar fallas e incidentes tecnológicos           | Aplicación afectada + soporte transversal | Tickets, logs y operación humana; clasificación y cierre de incidentes incompletos.                  | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.08` | Gestionar cambios y versiones                        | Aplicación afectada + soporte transversal | GitHub, Vercel, EAS y actualizaciones por aplicación; gobierno de cambio fragmentado.                | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.09` | Probar soluciones antes de usarlas                   | Aplicación afectada + soporte transversal | APP-REVIEW, builds y validaciones puntuales; suite transversal insuficiente.                         | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.10` | Gestionar licencias, contratos y costos tecnológicos | Aplicación afectada + soporte transversal | Gestión manual sin registro canónico completo.                                                       | `EVC-17`, `EVC-23`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.11` | Capacitar en el uso de herramientas                  | Aplicación afectada + soporte transversal | Gestión manual sin registro canónico completo.                                                       | `EVC-17`, `EVC-23`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |

##### 7.16. `CAP-16` — Información, documentos y evidencia

| ID          | Subcapacidad                              | Propietaria candidata                                   | Implementación actual localizada                                                               | Evidencia                    | Estado de vinculación               | Destino exacto                                                  |
| ----------- | ----------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ---------------------------- | ----------------------------------- | --------------------------------------------------------------- |
| `CAP-16.01` | Clasificar información y documentos       | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.02` | Crear y aprobar documentos                | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.03` | Guardar y localizar documentos            | Aplicación propietaria del hecho + gobierno transversal | Storage, tablas y búsquedas permiten guardar y localizar documentos en varios dominios.        | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.04` | Controlar versiones y vigencia            | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.05` | Compartir información de forma autorizada | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.06` | Proteger datos personales y sensibles     | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.07` | Conservar registros y evidencia           | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.08` | Archivar y eliminar de forma controlada   | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.09` | Gestionar firmas y aprobaciones           | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.10` | Atender solicitudes sobre información     | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.11` | Investigar accesos o cambios indebidos    | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |

##### 7.17. `CAP-17` — Medición, análisis y mejora

| ID          | Subcapacidad                          | Propietaria candidata        | Implementación actual localizada                                                     | Evidencia          | Estado de vinculación                    | Destino exacto                                                  |
| ----------- | ------------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------ | ------------------ | ---------------------------------------- | --------------------------------------------------------------- |
| `CAP-17.01` | Definir medidas e indicadores         | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.02` | Recopilar información                 | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.03` | Verificar calidad de información      | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.04` | Preparar reportes                     | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.05` | Analizar ventas y demanda             | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.06` | Analizar inventario y abastecimiento  | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.07` | Analizar producción y rendimiento     | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.08` | Analizar servicio y clientes          | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.09` | Analizar costos y rentabilidad        | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.10` | Identificar problemas y oportunidades | NUMERA + aplicaciones fuente | Análisis y seguimiento principalmente humanos; no existe ciclo común de mejora.      | `EVC-19`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.11` | Definir y seguir acciones de mejora   | NUMERA + aplicaciones fuente | Análisis y seguimiento principalmente humanos; no existe ciclo común de mejora.      | `EVC-19`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.12` | Comprobar resultados                  | NUMERA + aplicaciones fuente | Análisis y seguimiento principalmente humanos; no existe ciclo común de mejora.      | `EVC-19`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |

##### 7.18. `CAP-18` — Continuidad e incidentes

| ID          | Subcapacidad                                  | Propietaria candidata       | Implementación actual localizada                                                            | Evidencia                    | Estado de vinculación                    | Destino exacto                                                  |
| ----------- | --------------------------------------------- | --------------------------- | ------------------------------------------------------------------------------------------- | ---------------------------- | ---------------------------------------- | --------------------------------------------------------------- |
| `CAP-18.01` | Identificar dependencias críticas             | Aplicación afectada + SHELL | No se localizó inventario/priorización empresarial canónica de continuidad.                 | `EVC-20`, `EVC-17`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.02` | Preparar respuestas alternativas              | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.03` | Detectar y reportar incidentes                | Aplicación afectada + SHELL | Tickets y eventos técnicos permiten reportar algunos incidentes.                            | `EVC-20`, `EVC-17`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.04` | Evaluar impacto y prioridad                   | Aplicación afectada + SHELL | No se localizó inventario/priorización empresarial canónica de continuidad.                 | `EVC-20`, `EVC-17`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.05` | Mantener operación mínima                     | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.06` | Recuperar equipos, servicios e información    | Aplicación afectada + SHELL | Infraestructura y cron ofrecen recuperación parcial; no hay prueba empresarial por dominio. | `EVC-20`, `EVC-17`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.07` | Registrar trabajo realizado durante la falla  | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.08` | Incorporar posteriormente lo ocurrido         | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.09` | Confirmar que no quedaron pendientes          | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.10` | Aprender del incidente y mejorar la respuesta | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.11` | Gestionar respaldos y recuperación            | Aplicación afectada + SHELL | Infraestructura y cron ofrecen recuperación parcial; no hay prueba empresarial por dominio. | `EVC-20`, `EVC-17`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.12` | Coordinar comunicación durante incidentes     | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |

---

#### 8. Mapa inverso por repositorio y superficie

| Repositorio o medio                                                                     | Capacidades vinculadas actualmente                                                                                                                                                  | Límite que debe conservar `CODE-AUD-020`                                                                              |
| --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `vento-shell`                                                                           | contratos compartidos, Auth, autorización, Edge Functions, cron, migraciones, eventos e infraestructura transversal de `CAP-02`, `CAP-09` a `CAP-12`, `CAP-15`, `CAP-16` y `CAP-18` | no convertir infraestructura compartida en propiedad empresarial universal; reconciliar remoto y repositorio          |
| `vento-viso`                                                                            | `CAP-01`, gran parte de `CAP-02` y `CAP-03`, administración de catálogo, CMS, vacantes y documentos                                                                                 | separar gobierno administrativo, producto, CMS y funciones consumidoras; endurecer autorización y alcance             |
| `vento-anima`                                                                           | asistencia, turnos personales, documentos, anuncios, soporte, carné y configuración de `CAP-02`, `CAP-15` y `CAP-16`                                                                | completar corrección, idempotencia, Realtime, segundo plano y límites de datos                                        |
| `vento-talento`                                                                         | base futura de reclutamiento, postulación, documentos, entrevistas y oferta de `CAP-02`                                                                                             | no declararlo operativo; diseñar traspaso TALENTO → VISO/ANIMA sin duplicar identidad                                 |
| `vento-nexo`                                                                            | producto, inventario, remisiones, traslados, activos, ubicaciones, impresión y parte de instalaciones: `CAP-04`, `CAP-06`, `CAP-07`, `CAP-11`, `CAP-13` y `CAP-15`                  | separar fuente de verdad, retirar contratos legacy, completar LPN/activos/remisiones y asegurar atomicidad            |
| `vento-fogo`                                                                            | recetas y base de ejecución productiva: `CAP-04` y `CAP-08`                                                                                                                         | distinguir recetas en uso de lotes sin adopción; completar ciclo productivo y efectos de inventario                   |
| `vento-origo`                                                                           | proveedores, órdenes, revisión maestra y recepción: `CAP-05` y vínculos con `CAP-06` y `CAP-12`                                                                                     | convertir recepción secuencial en operación atómica, idempotente y adoptada                                           |
| `vento-pulso`                                                                           | pedidos, estados, salón, conversación, importación y base POS: `CAP-09`, `CAP-10`, `CAP-11` y caja de `CAP-12`                                                                      | completar POS, consumidor final, caja, facturación, correcciones y cierre; retirar dependencia legacy controladamente |
| `vento-numera`                                                                          | gastos, centros de costo, resúmenes, equilibrio y rentabilidad: `CAP-12` y `CAP-17`                                                                                                 | no presentar analítica parcial como contabilidad, cartera, tesorería o cierre completos                               |
| `vento-pass`                                                                            | cliente, membresía, fidelización, pedido, pago, entrega, chat y Wallet: `CAP-09`, `CAP-10` y `CAP-11`                                                                               | centralizar sedes, contratos, redención y pagos; separar cliente de RBAC laboral                                      |
| `Vento-Group` + CMS VISO                                                                | contenido público, empleos publicados, marca y oferta: `CAP-14`                                                                                                                     | distinguir publicación actual de AURA futura; implementar o retirar newsletter ficticia                               |
| Makos, Rappi, ManyChat, Shopify, WhatsApp, Excel, papel, bancos, asesores y proveedores | ejecución AS-IS manual o externa de ventas, pedidos, pagos, abastecimiento, cumplimiento, instalaciones, mercadeo y continuidad                                                     | mantener coexistencia, reconciliación, evidencia y cutover antes de retirar el método actual                          |

---

#### 9. Artefactos técnicos que no constituyen una capacidad por sí mismos

| Artefacto                                   | Clasificación                                    | Vinculación o destino                                                                          |
| ------------------------------------------- | ------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
| aplicación `aura` registrada y permiso base | reserva técnica, no implementación               | capacidades `CAP-14`; decisión en `AURA-AUD-010` e `INT-MKT-001`                               |
| repositorio y esquema TALENTO               | base futura                                      | `CAP-02.02`, `CAP-02.03`, `CAP-02.11` y `CAP-02.13`; `CAP-TAL-001` a `CAP-TAL-006`             |
| VITAL                                       | producto personal separado                       | fuera de `LB-CAP-VENTO-001`; no se incorpora al backlog Vento OS                               |
| sede `APP-REVIEW`                           | dato de demostración aislado                     | soporte de `CAP-15.09`; conservación o retiro en `CODE-AUD-020`                                |
| scripts y migraciones históricas de sandbox | historial o residuo técnico                      | `CODE-AUD-020`; no representan una capacidad actual                                            |
| `delivery-portal` solo remoto               | implementación no reproducible desde repositorio | `CAP-11.07` a `CAP-11.12`; versionar y auditar mediante `CODE-AUD-020` y tareas de integración |
| buckets sin consumidor localizado           | infraestructura no asignada                      | clasificar en `CODE-AUD-020` y E3 antes de conservar, migrar o retirar                         |
| permisos, tablas, triggers y RPC aislados   | piezas técnicas                                  | solo cuentan cuando la matriz los vincula a una capacidad, actor, contrato y resultado         |

---

#### 10. Contratos distribuidos que requieren una única frontera

| Frente                                       | Capacidad principal          | Implementación actual                                    | Riesgo conservado                                        | Destino                                                                                              |
| -------------------------------------------- | ---------------------------- | -------------------------------------------------------- | -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| identidad laboral y acceso                   | `CAP-02`, `CAP-15.01`        | VISO, ANIMA, SHELL, `vento-shell` y Supabase             | reglas duplicadas, alcance desigual y cierre incompleto  | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-SCOPE-015`                                                     |
| producto y presentación                      | `CAP-04`                     | NEXO, VISO, FOGO, ORIGO, PULSO y PASS                    | fuentes competidoras y conversiones incompatibles        | `CODE-AUD-020`, `CAP-SCOPE-004`                                                                      |
| compra → recepción → inventario → costo      | `CAP-05`, `CAP-06`, `CAP-12` | ORIGO, NEXO, NUMERA y Supabase                           | efectos parciales, duplicación y conciliación incompleta | `CODE-AUD-020`, `CAP-SCOPE-005`, `CAP-SCOPE-006`, `CAP-SCOPE-012`                                    |
| producción → inventario → costo              | `CAP-08`, `CAP-06`, `CAP-12` | FOGO, NEXO y NUMERA                                      | estructuras sin uso, cierre y efectos no probados        | `CODE-AUD-020`, `CAP-SCOPE-008`, `CAP-SCOPE-006`, `CAP-SCOPE-012`                                    |
| pedido → venta → pago → inventario → lealtad | `CAP-09`, `CAP-10`, `CAP-12` | PULSO, PASS, NEXO, NUMERA, POS externos y Edge Functions | doble emisión, pago fuera de orden y efectos no atómicos | `CODE-AUD-020`, `CAP-SCOPE-009`, `CAP-SCOPE-010`, `CAP-SCOPE-012`, `INT-SALES-001` a `INT-SALES-011` |
| remisión, transporte y entrega               | `CAP-06`, `CAP-11`           | NEXO, PULSO, PASS y `delivery-portal`                    | custodia, estados y reintentos distribuidos              | `CODE-AUD-020`, `CAP-SCOPE-006`, `CAP-SCOPE-011`                                                     |
| documentos y evidencia                       | `CAP-16`                     | ANIMA, VISO, TALENTO, Storage y funciones                | acceso, retención, versión y sensibilidad inconsistentes | `CODE-AUD-020`, `CAP-SCOPE-016`                                                                      |
| incidentes y continuidad                     | `CAP-18`                     | colas, tickets, cron, backups y operación manual         | recuperación sin reconciliación empresarial integral     | `CODE-AUD-020`, `CAP-SCOPE-018`                                                                      |

---

#### 11. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                                                       | Clasificación                     | Destino                                                                   |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------- | ------------------------------------------------------------------------- |
| `H-CODE-019-001` | las 217 subcapacidades pueden vincularse sin crear una taxonomía paralela                                                      | control documental                | cerrado mediante `MAP-IMPL-CAP-001`                                       |
| `H-CODE-019-002` | una misma capacidad puede tener productora actual, propietaria candidata y consumidores distintos                              | frontera arquitectónica           | `CAP-SCOPE-001` a `CAP-SCOPE-019`; `CODE-AUD-020`                         |
| `H-CODE-019-003` | VISO y NEXO concentran la mayor superficie técnica, pero no son propietarios universales                                       | concentración de implementación   | `CODE-AUD-020`; `CAP-SCOPE-001`, `004`, `006`, `007`, `013`, `015`, `016` |
| `H-CODE-019-004` | TALENTO vincula capacidades reales, pero permanece como base futura sin despliegue ni adopción                                 | futuro con base técnica           | `CAP-TAL-001` a `CAP-TAL-006`; `CODE-AUD-020`                             |
| `H-CODE-019-005` | AURA no cubre actualmente ninguna capacidad aunque exista reserva de catálogo                                                  | reserva sin implementación        | `AURA-AUD-010`; `INT-MKT-001`; `CODE-AUD-020`                             |
| `H-CODE-019-006` | varias capacidades dependen de medios manuales o externos que no pueden retirarse por la sola existencia de código             | coexistencia operativa            | `CODE-AUD-020`; E5 y tareas de integración correspondientes               |
| `H-CODE-019-007` | recepción, producción, POS, mantenimiento de activos, entrega, gastos y presupuestos contienen estructuras sin uso comprobado  | adopción no demostrada            | `CODE-AUD-020`; `CAP-SCOPE-005`, `007`, `008`, `009`, `011`, `012`        |
| `H-CODE-019-008` | instalaciones y continuidad carecen de implementación empresarial integral verificable                                         | brecha funcional                  | `CAP-SCOPE-013`, `CAP-SCOPE-018`, `CODE-AUD-020`                          |
| `H-CODE-019-009` | contratos de identidad, producto, pagos, inventario, documentos y entrega están distribuidos entre repositorios                | contrato transversal              | `CODE-AUD-020`, BLOQUE X, E3 y E4 mediante tareas ya existentes           |
| `H-CODE-019-010` | `vento-shell` contiene contratos y migraciones compartidos, pero no debe absorber propiedad funcional                          | regla de propiedad                | `CAP-SCOPE-001` a `CAP-SCOPE-019`; `SHELL-CON-023`                        |
| `H-CODE-019-011` | `TREQ-PASS-004` y `TREQ-INTEGRATION-001` quedan vinculados a las evidencias de sedes, dominios y contratos distribuidos        | obligación de regresión existente | conservar en `04A`; implementación en sus paquetes E5                     |
| `H-CODE-019-012` | artefactos sin capacidad o sin consumidor deben entrar al backlog técnico, no convertirse en funciones empresariales ficticias | deuda o residuo técnico           | `CODE-AUD-020`                                                            |

No se crea ninguna tarea nueva del roadmap. Todos los hallazgos tienen destino existente y exacto.

---

#### 12. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS

**Justificación:** esta tarea consolida trazabilidad documental y no introduce ni modifica comportamiento ejecutable. Mantiene vigentes, entre otros, `TREQ-PASS-004`, `TREQ-INTEGRATION-001`, `TREQ-SUPABASE-001`, `TREQ-SUPABASE-002`, `TREQ-NEXO-005`, `TREQ-NEXO-006`, `TREQ-ORIGO-001`, `TREQ-ORIGO-003`, `TREQ-ANIMA-003`, `TREQ-ANIMA-004`, `TREQ-PASS-009` y `TREQ-INTEGRATION-003`.

La matriz no marca ningún requisito como implementado o verificado. `CODE-AUD-020` y los paquetes E5 deberán conservar la relación entre capacidad, hallazgo, requisito y corrección.

---

#### 13. Decisiones propuestas

1. Se adopta `MAP-IMPL-CAP-001` como mapa técnico de referencia de `LB-CAP-VENTO-001 v1.0`.
2. Las 217 subcapacidades quedan vinculadas individualmente con una representación actual o con una ausencia explícita.
3. Propietaria candidata, productora actual, consumidora y repositorio técnico permanecen como conceptos separados.
4. Una tabla, permiso, ruta, RPC o componente aislado no prueba cobertura empresarial.
5. Una operación manual o externa se conserva como implementación AS-IS y no se borra del mapa.
6. Una estructura sin datos no se presenta como operación adoptada.
7. TALENTO conserva su vínculo con capacidades de personas sin declararse operativo.
8. AURA permanece como idea futura y no recibe cobertura ficticia.
9. VITAL permanece fuera de Vento OS.
10. `vento-shell` conserva migraciones y contratos compartidos sin convertirse en propietario universal.
11. Los contratos distribuidos deberán converger mediante las tareas de propiedad, integración, datos y servicios ya existentes.
12. `CODE-AUD-020` convertirá cada vínculo parcial, manual, ausente, futuro o competidor en backlog trazable por repositorio.
13. No se modifican código, datos, despliegues, Supabase ni el registro de requisitos de prueba.
14. No se crean tareas ni requisitos de prueba nuevos.
15. `CODE-AUD-020` será la única continuidad inmediata.

---

#### 14. Límites de certeza

Esta tarea no confirma:

- adopción cotidiana de cada ruta o pantalla;
- que el despliegue productivo corresponda exactamente al checkout inspeccionado;
- que una relación con datos contenga información suficiente y correcta;
- que una operación manual haya sido observada en todas las sedes;
- que una implementación parcial sea la arquitectura que deberá conservarse;
- que todos los permisos, RLS, RPC, Edge Functions, reintentos y transacciones sean correctos;
- que una capacidad vinculada esté lista para cutover;
- que una tabla vacía deba poblarse;
- que un artefacto sin consumidor pueda retirarse sin análisis;
- que los nombres actuales de rutas, tablas o repositorios sean los nombres objetivo.

Los límites no impiden vincular la evidencia existente. Impiden transformar inferencias en hechos.

---

#### 15. Criterios de aceptación

`CODE-AUD-019` podrá aprobarse cuando:

- las 18 familias y 217 subcapacidades estén presentes exactamente una vez;
- cada subcapacidad tenga propietaria candidata, implementación actual, evidencia, estado y destino;
- uso, parcialidad, estructura sin uso, manual/external, ausencia y base futura estén diferenciados;
- la matriz no confunda repositorio técnico con aplicación propietaria;
- VISO y NEXO no se conviertan en propietarios universales por concentración de código;
- TALENTO permanezca futuro, AURA permanezca diferida y VITAL permanezca separado;
- las capacidades manuales y externas permanezcan visibles;
- los contratos distribuidos tengan destino exacto;
- los artefactos sin capacidad o consumidor queden reservados para `CODE-AUD-020`;
- todos los hallazgos tengan tareas existentes;
- se declare expresamente que no genera requisitos de prueba nuevos;
- no se modifique código, CI, despliegues, Supabase ni 04A;
- `CODE-AUD-020` permanezca como única continuidad inmediata.

---

#### 16. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
LB-CAP-VENTO-001 v1.0
→ 217 subcapacidades
→ MAP-IMPL-CAP-001
→ repositorio, superficie, contrato, dato o medio actual
→ estado de vinculación y limitación
→ hallazgo con destino exacto
→ backlog técnico y funcional por repositorio
```

La continuidad será exclusivamente:

```text
CODE-AUD-020
— Crear backlog técnico y funcional trazable por repositorio
```

`CODE-AUD-020` deberá transformar esta matriz en unidades de backlog sin reabrir la taxonomía, sin duplicar brechas y sin asignar una corrección a un repositorio que solo sea consumidor.


### ✅ CODE-AUD-020 — Crear backlog técnico y funcional trazable por repositorio

**Estado:** APROBADO
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** consolidación final de brechas de código, capacidad, datos, seguridad, adopción y operación  
**Dependencia anterior:** `CODE-AUD-019` — APROBADA  
**Continuidad obligatoria:** `QA-REG-001` — Consolidar retrospectivamente requisitos de prueba anteriores a QA-GOV-001  
**Línea base funcional:** `MAP-IMPL-CAP-001` / `LB-CAP-VENTO-001 v1.0`  
**Fecha de corte conservada:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no realizados  

---

#### 1. Resultado de esta tarea

Esta tarea crea el registro documental `BKL-REPO-001`, que transforma la evidencia de `CODE-AUD-001` a `CODE-AUD-019` y las 217 filas de `MAP-IMPL-CAP-001` en un backlog accionable, propietario y trazable por repositorio o medio operativo.

La cadena resultante es:

```text
capacidad o hallazgo
→ repositorio, aplicación o medio actual
→ brecha técnica o funcional consolidada
→ prioridad y puerta
→ tarea canónica existente
→ requisito de prueba existente cuando aplique
→ evidencia exigida para cerrar
```

El registro contiene **18 entradas funcionales** y **65 entradas técnicas**, para un total de **83 elementos de backlog**.

| Cobertura de entrada                                                          | Resultado |
| ----------------------------------------------------------------------------- | --------: |
| Subcapacidades de `MAP-IMPL-CAP-001`                                          |   **217** |
| Subcapacidades sin remediación inmediata (`IMPLEMENTACIÓN_VERIFICADA_EN_USO`) |    **29** |
| Subcapacidades abiertas consolidadas en backlog funcional                     |   **188** |
| Familias funcionales                                                          |    **18** |
| Elementos técnicos por repositorio o superficie                               |    **65** |
| Hallazgos con destino explícito a `CODE-AUD-020` cubiertos                    |    **94** |
| Hallazgos de límite o control conservados sin acción nueva                    |     **3** |

Los identificadores `BKL-*` son **registros del backlog**, no tareas del roadmap. No deberán insertarse como encabezados `###`, no alteran el orden de implementación y no sustituyen las tareas canónicas indicadas en cada fila.

---

#### 2. Fuentes obligatorias y alcance

El backlog consolida:

- `CODE-AUD-001` a `CODE-AUD-019`;
- `MAP-IMPL-CAP-001` y sus 217 subcapacidades;
- requisitos vigentes de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
- tareas existentes de E2, E3, E4, E5, BLOQUE X, GAP y QA;
- procesos manuales y terceros registrados como operación AS-IS.

No se vuelve a auditar el código ni se actualiza el corte. `CODE-AUD-020` organiza y asigna la evidencia ya aprobada; una revisión posterior deberá registrar un nuevo corte y no sobrescribir este historial.

---

#### 3. Convención y estados del backlog

| Elemento         | Convención                      | Uso                                           |
| ---------------- | ------------------------------- | --------------------------------------------- |
| Registro         | `BKL-REPO-001`                  | contenedor documental de esta tarea           |
| Brecha funcional | `BKL-FUNC-NNN`                  | agrupación por familia `CAP-*`                |
| Brecha técnica   | `BKL-<REPO>-NNN` o `BKL-XR-NNN` | trabajo técnico por repositorio o transversal |

Estado inicial de todas las filas abiertas: `REGISTRADO`.

| Prioridad | Regla                                                                                                                   |
| --------- | ----------------------------------------------------------------------------------------------------------------------- |
| `P0`      | riesgo crítico de seguridad, integridad, dinero, inventario, identidad, build bloqueado o activación operativa insegura |
| `P1`      | necesario antes de adopción, cutover, ampliación de alcance o siguiente release relevante                               |
| `P2`      | mejora funcional o técnica necesaria antes de escalar, pero con control actual aceptable                                |
| `P3`      | saneamiento, retiro o deuda de bajo riesgo que exige evidencia antes de eliminar                                        |

Una fila solo podrá pasar a `CERRADO` cuando la tarea canónica responsable registre evidencia reproducible y los `TREQ-*` relacionados estén implementados y verificados cuando corresponda.

---

#### 4. Reglas de consolidación

1. Una fila funcional puede agrupar varias subcapacidades, pero enumera todos sus identificadores abiertos.
2. Una fila técnica puede agrupar hallazgos equivalentes del mismo repositorio y resultado de cierre.
3. Ninguna fila crea una tarea nueva; el destino utiliza identificadores ya materializados.
4. `IMPLEMENTACIÓN_VERIFICADA_EN_USO` se conserva como baseline y pasa a protección mediante QA, no a remediación automática.
5. `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` exige diseño, piloto y evidencia antes de activarse.
6. `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` exige coexistencia y cutover; no autoriza retirar el método AS-IS.
7. `SIN_IMPLEMENTACIÓN_VERIFICABLE` exige decisión en `CAP-SCOPE-*`; no obliga automáticamente a construir software.
8. Hallazgos de seguridad P0 deben contenerse antes de ampliar el proceso afectado.
9. Toda corrección de base, RLS, función, trigger, Storage o Edge Function se materializa en `vento-shell`.
10. `QA-REG-001` se ejecutará inmediatamente después de esta tarea y antes de `CAP-SCOPE-001`.

---

#### 5. Backlog funcional consolidado

Las 29 subcapacidades con implementación verificada en uso aparecen como baseline protegida; las otras 188 aparecen exactamente una vez en la columna **Brechas abiertas**.

| ID             | Familia                                            | Repositorios o medios actuales                                                                   | Prioridad | Brechas abiertas por estado                                                                                                                                                                                                                                                  | Baseline verificada en uso                                                                             | Decisión y resultado requerido                                                                                                                    | Destino exacto                                                                                                                                            |
| -------------- | -------------------------------------------------- | ------------------------------------------------------------------------------------------------ | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BKL-FUNC-001` | `CAP-01` — Dirección y gobierno                    | `vento-viso`                                                                                     | `P1`      | **Parcial (4):** `CAP-01.05`, `CAP-01.06`, `CAP-01.07`, `CAP-01.08`<br>**Manual o externa (3):** `CAP-01.01`, `CAP-01.02`, `CAP-01.09`<br>**Sin implementación (1):** `CAP-01.10`                                                                                            | `CAP-01.03`, `CAP-01.04`                                                                               | Definir propiedad y ciclo TO-BE de decisiones, políticas, riesgos y verificación de cumplimiento sin convertir VISO en propietario universal.     | `CAP-SCOPE-001`                                                                                                                                           |
| `BKL-FUNC-002` | `CAP-02` — Personas y trabajo                      | `vento-viso`, `vento-anima`, `vento-talento`, `vento-numera`, `vento-shell`                      | `P0`      | **Parcial (6):** `CAP-02.01`, `CAP-02.03`, `CAP-02.07`, `CAP-02.08`, `CAP-02.11`, `CAP-02.13`<br>**Manual o externa (3):** `CAP-02.09`, `CAP-02.10`, `CAP-02.12`<br>**Futura con base técnica (1):** `CAP-02.02`                                                             | `CAP-02.04`, `CAP-02.05`, `CAP-02.06`                                                                  | Separar TALENTO, VISO y ANIMA; cerrar asistencia, novedades, documentos, retiro de accesos y tratamiento del proceso laboral externo.             | `CAP-SCOPE-002`; `CAP-TAL-001`; `CAP-TAL-002`; `CAP-TAL-003`; `CAP-TAL-004`; `CAP-TAL-005`; `CAP-TAL-006`; `INT-WORK-003`; `ANIMA-UX-011`; `ANIMA-UX-012` |
| `BKL-FUNC-003` | `CAP-03` — Seguridad, salud y cumplimiento         | `vento-viso`, `vento-nexo`, `vento-fogo` y operación manual                                      | `P1`      | **Parcial (10):** `CAP-03.01`, `CAP-03.02`, `CAP-03.03`, `CAP-03.04`, `CAP-03.05`, `CAP-03.06`, `CAP-03.07`, `CAP-03.08`, `CAP-03.09`, `CAP-03.10`                                                                                                                           | —                                                                                                      | Decidir qué controles se digitalizan, integran o permanecen manuales y crear evidencia auditable de inspección y corrección.                      | `CAP-SCOPE-003`                                                                                                                                           |
| `BKL-FUNC-004` | `CAP-04` — Productos, preparaciones y conocimiento | `vento-nexo`, `vento-fogo`, `vento-pulso`, `vento-pass`, `vento-viso`                            | `P1`      | **Parcial (3):** `CAP-04.08`, `CAP-04.09`, `CAP-04.10`                                                                                                                                                                                                                       | `CAP-04.01`, `CAP-04.02`, `CAP-04.03`, `CAP-04.04`, `CAP-04.05`, `CAP-04.06`, `CAP-04.07`              | Conservar el catálogo en uso, cerrar calidad, alérgenos, vigencia y precedencias compartidas de producto, presentación y receta.                  | `CAP-SCOPE-004`                                                                                                                                           |
| `BKL-FUNC-005` | `CAP-05` — Abastecimiento                          | `vento-origo`, `vento-nexo`, `vento-numera`, `vento-shell`                                       | `P0`      | **Parcial (5):** `CAP-05.01`, `CAP-05.02`, `CAP-05.03`, `CAP-05.06`, `CAP-05.07`<br>**Estructura sin uso (2):** `CAP-05.08`, `CAP-05.09`<br>**Manual o externa (5):** `CAP-05.04`, `CAP-05.05`, `CAP-05.10`, `CAP-05.11`, `CAP-05.12`                                        | —                                                                                                      | Completar abastecimiento y recepción, preservar negociación manual cuando corresponda y conectar inventario, costos y documentos sin duplicación. | `CAP-SCOPE-005`; `ORIGO-UX-009`; `ORIGO-UX-010`; `ORIGO-UX-014`; `ORIGO-UX-016`                                                                           |
| `BKL-FUNC-006` | `CAP-06` — Inventario y almacenamiento             | `vento-nexo`, `vento-shell`                                                                      | `P0`      | **Parcial (6):** `CAP-06.02`, `CAP-06.06`, `CAP-06.09`, `CAP-06.10`, `CAP-06.11`, `CAP-06.14`<br>**Manual o externa (1):** `CAP-06.15`                                                                                                                                       | `CAP-06.01`, `CAP-06.03`, `CAP-06.04`, `CAP-06.05`, `CAP-06.07`, `CAP-06.08`, `CAP-06.12`, `CAP-06.13` | Cerrar LPN, remisiones, frío, reconciliación y atomicidad del ledger y sus proyecciones.                                                          | `CAP-SCOPE-006`; `NEXO-UX-009`; `NEXO-UX-010`; `NEXO-UX-011`; `NEXO-UX-012`; `NEXO-UX-013`                                                                |
| `BKL-FUNC-007` | `CAP-07` — Activos y reutilizables                 | `vento-nexo`                                                                                     | `P1`      | **Parcial (7):** `CAP-07.01`, `CAP-07.02`, `CAP-07.03`, `CAP-07.04`, `CAP-07.06`, `CAP-07.11`, `CAP-07.12`<br>**Estructura sin uso (5):** `CAP-07.05`, `CAP-07.07`, `CAP-07.08`, `CAP-07.09`, `CAP-07.10`<br>**Manual o externa (1):** `CAP-07.13`                           | —                                                                                                      | Completar ciclo de activos, conteo patrimonial, mantenimiento, garantías, baja, vehículos y consumibles reutilizables.                            | `CAP-SCOPE-007`                                                                                                                                           |
| `BKL-FUNC-008` | `CAP-08` — Producción                              | `vento-fogo`, `vento-nexo`, `vento-shell`                                                        | `P0`      | **Estructura sin uso (14):** `CAP-08.01`, `CAP-08.02`, `CAP-08.03`, `CAP-08.04`, `CAP-08.05`, `CAP-08.06`, `CAP-08.07`, `CAP-08.08`, `CAP-08.09`, `CAP-08.10`, `CAP-08.11`, `CAP-08.12`, `CAP-08.13`, `CAP-08.14`                                                            | —                                                                                                      | No activar estructuras productivas hasta aprobar el ciclo de lote, consumo, desperdicio, resultado, corrección e inventario.                      | `CAP-SCOPE-008`; `FOGO-UX-005`; `FOGO-UX-006`; `FOGO-UX-007`; `FOGO-UX-010`; `FOGO-UX-011`; `FOGO-UX-012`; `FOGO-UX-013`                                  |
| `BKL-FUNC-009` | `CAP-09` — Venta, cobro y pedidos                  | `vento-pulso`, `vento-pass`, `vento-nexo`, `vento-numera`, `vento-shell` y POS externo           | `P0`      | **Parcial (8):** `CAP-09.03`, `CAP-09.05`, `CAP-09.06`, `CAP-09.07`, `CAP-09.08`, `CAP-09.09`, `CAP-09.10`, `CAP-09.12`<br>**Estructura sin uso (1):** `CAP-09.15`<br>**Manual o externa (2):** `CAP-09.13`, `CAP-09.14`                                                     | `CAP-09.01`, `CAP-09.02`, `CAP-09.04`, `CAP-09.11`                                                     | Completar POS, caja, cobro, facturación, anulaciones y efectos exactamente una vez, conservando coexistencia con el POS externo.                  | `CAP-SCOPE-009`; `PULSO-UX-001`; `INT-POS-001`; `INT-POS-019`                                                                                             |
| `BKL-FUNC-010` | `CAP-10` — Clientes y relaciones                   | `vento-pass`, `vento-pulso`, `vento-viso`                                                        | `P0`      | **Parcial (4):** `CAP-10.02`, `CAP-10.03`, `CAP-10.09`, `CAP-10.10`<br>**Estructura sin uso (2):** `CAP-10.06`, `CAP-10.07`<br>**Manual o externa (3):** `CAP-10.04`, `CAP-10.05`, `CAP-10.08`                                                                               | `CAP-10.01`                                                                                            | Cerrar identidad de cliente, reclamos, servicio, fidelización, redención y experiencia de seguimiento sin exponer PII ni saldo.                   | `CAP-SCOPE-010`; `PASS-UX-001`                                                                                                                            |
| `BKL-FUNC-011` | `CAP-11` — Transporte, despacho y entrega          | `vento-nexo`, `vento-pulso`, `vento-pass`, `vento-shell` y `delivery-portal`                     | `P1`      | **Parcial (3):** `CAP-11.04`, `CAP-11.05`, `CAP-11.06`<br>**Estructura sin uso (1):** `CAP-11.09`<br>**Manual o externa (8):** `CAP-11.01`, `CAP-11.02`, `CAP-11.03`, `CAP-11.07`, `CAP-11.08`, `CAP-11.10`, `CAP-11.11`, `CAP-11.12`                                        | —                                                                                                      | Definir planeación, custodia, transporte, portal, entrega, novedades, evidencia y conciliación entre NEXO, PULSO, PASS y terceros.                | `CAP-SCOPE-011`; `NEXO-UX-009`; `PULSO-UX-001`                                                                                                            |
| `BKL-FUNC-012` | `CAP-12` — Dinero, costos y obligaciones           | `vento-numera`, `vento-pulso`, `vento-origo`, `vento-nexo`, `vento-shell` y terceros financieros | `P0`      | **Parcial (8):** `CAP-12.01`, `CAP-12.06`, `CAP-12.07`, `CAP-12.08`, `CAP-12.09`, `CAP-12.10`, `CAP-12.14`, `CAP-12.15`<br>**Estructura sin uso (2):** `CAP-12.02`, `CAP-12.11`<br>**Manual o externa (5):** `CAP-12.03`, `CAP-12.04`, `CAP-12.05`, `CAP-12.12`, `CAP-12.13` | —                                                                                                      | Distinguir costos y resúmenes existentes de contabilidad, tesorería, cartera, bancos, impuestos y presupuesto todavía no adoptados.               | `CAP-SCOPE-012`                                                                                                                                           |
| `BKL-FUNC-013` | `CAP-13` — Instalaciones                           | `vento-nexo`, `vento-viso` y operación manual                                                    | `P1`      | **Parcial (1):** `CAP-13.01`<br>**Sin implementación (10):** `CAP-13.02`, `CAP-13.03`, `CAP-13.04`, `CAP-13.05`, `CAP-13.06`, `CAP-13.07`, `CAP-13.08`, `CAP-13.09`, `CAP-13.10`, `CAP-13.11`                                                                                | —                                                                                                      | Decidir BUILD, BUY, integración o operación manual para mantenimiento de instalaciones, limpieza, plagas, servicios, llaves y calibración.        | `CAP-SCOPE-013`                                                                                                                                           |
| `BKL-FUNC-014` | `CAP-14` — Comunicación y promoción                | `vento-viso`, `Vento-Group`, `vento-pass`, `vento-pulso` y AURA futura                           | `P2`      | **Parcial (2):** `CAP-14.01`, `CAP-14.06`<br>**Manual o externa (4):** `CAP-14.02`, `CAP-14.08`, `CAP-14.09`, `CAP-14.11`<br>**Sin implementación (3):** `CAP-14.05`, `CAP-14.07`, `CAP-14.10`                                                                               | `CAP-14.03`, `CAP-14.04`                                                                               | Conservar CMS y web actuales, resolver newsletter y decidir AURA antes de crear campañas o automatizaciones nuevas.                               | `CAP-SCOPE-014`; `AURA-AUD-010`; `INT-MKT-001`                                                                                                            |
| `BKL-FUNC-015` | `CAP-15` — Tecnología y soporte                    | `vento-shell` y todos los repositorios consumidores                                              | `P0`      | **Parcial (7):** `CAP-15.02`, `CAP-15.04`, `CAP-15.05`, `CAP-15.06`, `CAP-15.07`, `CAP-15.08`, `CAP-15.09`<br>**Manual o externa (3):** `CAP-15.03`, `CAP-15.10`, `CAP-15.11`                                                                                                | `CAP-15.01`                                                                                            | Consolidar Auth, contratos, dispositivos, impresión, soporte, observabilidad, despliegues y gobierno técnico transversal.                         | `CAP-SCOPE-015`; `GAP-CTRL-001`; `GAP-CTRL-006`                                                                                                           |
| `BKL-FUNC-016` | `CAP-16` — Información, documentos y evidencia     | `vento-shell`, `vento-viso`, `vento-anima`, `vento-talento` y aplicaciones propietarias          | `P0`      | **Parcial (10):** `CAP-16.01`, `CAP-16.02`, `CAP-16.04`, `CAP-16.05`, `CAP-16.06`, `CAP-16.07`, `CAP-16.08`, `CAP-16.09`, `CAP-16.10`, `CAP-16.11`                                                                                                                           | `CAP-16.03`                                                                                            | Definir clasificación, acceso, versión, retención, firma, auditoría y eliminación de documentos y evidencia por dominio.                          | `CAP-SCOPE-016`; `GAP-CTRL-001`; `GAP-CTRL-006`                                                                                                           |
| `BKL-FUNC-017` | `CAP-17` — Medición, análisis y mejora             | `vento-numera` y aplicaciones fuente                                                             | `P1`      | **Parcial (9):** `CAP-17.01`, `CAP-17.02`, `CAP-17.03`, `CAP-17.04`, `CAP-17.05`, `CAP-17.06`, `CAP-17.07`, `CAP-17.08`, `CAP-17.09`<br>**Manual o externa (3):** `CAP-17.10`, `CAP-17.11`, `CAP-17.12`                                                                      | —                                                                                                      | Aprobar definiciones de métricas, calidad, fuentes, periodicidad y ciclo de mejora sin presentar reportes parciales como analítica integral.      | `CAP-SCOPE-017`; `GAP-CTRL-001`; `GAP-CTRL-006`                                                                                                           |
| `BKL-FUNC-018` | `CAP-18` — Continuidad e incidentes                | `vento-shell`, aplicaciones afectadas y operación manual                                         | `P0`      | **Parcial (3):** `CAP-18.03`, `CAP-18.06`, `CAP-18.11`<br>**Manual o externa (7):** `CAP-18.02`, `CAP-18.05`, `CAP-18.07`, `CAP-18.08`, `CAP-18.09`, `CAP-18.10`, `CAP-18.12`<br>**Sin implementación (2):** `CAP-18.01`, `CAP-18.04`                                        | —                                                                                                      | Crear inventario de procesos críticos, contingencia, recuperación, reincorporación y cierre auditable por dominio.                                | `CAP-SCOPE-018`; `GAP-CTRL-001`; `GAP-CTRL-006`                                                                                                           |

---

#### 6. Backlog técnico transversal y por repositorio

| ID               | Repositorio o superficie                     | Prioridad / tipo              | Brecha consolidada                                                          | Hallazgos origen                                                                                                                                                                                     | Acción y resultado esperado                                                                                                                                                                           | Destino exacto                                                                                                                                                                                                                                                                                                                                                           | Requisitos existentes                                               | Evidencia de cierre                                                                                                                   | Momento                                                                               |
| ---------------- | -------------------------------------------- | ----------------------------- | --------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `BKL-XR-001`     | `vento-shell` / Supabase                     | `P0` / `DATOS`                | Reconciliar estado remoto, migraciones y contratos locales                  | `H-CODE-004-001`; `H-CODE-005-006`; `H-CODE-006-001`; `H-CODE-006-005`; `H-CODE-006-014`; `H-CODE-019-009`                                                                                           | Crear el inventario reproducible de relaciones, funciones, vistas, triggers y dependencias; identificar drift y convertir toda diferencia aceptada en migración versionada.                           | `SUPA-AUD-004`; `SUPA-AUD-006`; `SUPA-AUD-008`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-AUD-024`; `SUPA-TRANS-001`; `SUPA-TRANS-003`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                                                   | `TREQ-SUPABASE-001`; `TREQ-SUPABASE-003`                            | Mapa objeto → capacidad → consumidor completo, diff local/remoto explicado, migraciones y rollback definidos.                         | E3, antes de cualquier paquete de migración o retiro                                  |
| `BKL-XR-002`     | `vento-shell` / Edge Functions               | `P0` / `INTEGRACIÓN`          | Versionar funciones, cron y superficies remotas no reproducibles            | `H-CODE-005-008`; `H-CODE-005-009`; `H-CODE-017-019`                                                                                                                                                 | Clasificar funciones solo locales, remoto-only y cron; incorporar o retirar `delivery-portal` mediante fuente, configuración y despliegue reproducibles sin perder controles de token.                | `SUPA-AUD-014`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-TRANS-003`; `SUPA-TRANS-007`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                                                                                                                                   | `TREQ-SUPABASE-003`; `TREQ-SUPABASE-006`                            | Cada función y cron tiene fuente, configuración, propietario, consumidor, despliegue, secreto y prueba negativa.                      | E3/E4, antes de modificar funciones o portales productivos                            |
| `BKL-XR-003`     | `vento-shell` / Storage / Realtime           | `P0` / `SEGURIDAD`            | Corregir Storage, publicaciones y consumidores Realtime                     | `H-CODE-006-007`; `H-CODE-006-008`; `H-CODE-006-009`; `H-CODE-006-010`; `H-CODE-006-011`; `H-CODE-006-013`                                                                                           | Clasificar buckets sin consumidor, privatizar contenido sensible, corregir entrega de medios y alinear publicaciones con suscripciones reales; retirar publicaciones sin consumidor confirmado.       | `SUPA-AUD-012`; `SUPA-AUD-013`; `SUPA-AUD-016`; `SUPA-AUD-017`; `EVID-ARC-003`; `EVID-ARC-007`; `EVID-ARC-008`; `SUPA-TRANS-001`; `SUPA-TRANS-007`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                                                                   | `TREQ-SUPABASE-004`; `TREQ-SUPABASE-003`                            | Matriz bucket/ruta/sensibilidad y publicación/canal/consumidor aprobada, con acceso temporal y regresión.                             | P0 de seguridad antes de ampliar documentos, medios o Realtime                        |
| `BKL-XR-004`     | `vento-shell` / datos de entorno             | `P1` / `GOBIERNO`             | Clasificar seeds, cleanup, baseline y datos demo                            | `H-CODE-007-009`; `H-CODE-007-011`; `H-CODE-007-012`; `H-CODE-007-013`; `H-CODE-008-003`                                                                                                             | Separar datos canónicos de fixtures, retirar scripts o templates peligrosos, decidir `APP-REVIEW` y documentar el marcador histórico sin ejecutar cleanup sobre producción.                           | `SUPA-AUD-015`; `SUPA-AUD-018`; `SHELL-AUD-011`; `SUPA-TRANS-002`; `SUPA-TRANS-012`; `SUPA-TRANS-015`; `QA-REG-001`                                                                                                                                                                                                                                                      | —                                                                   | Todo artefacto queda clasificado como conservar, fixture, histórico o retirar; no permanece script destructivo activable sin control. | E3 y consolidación de QA, antes de crear entornos de prueba                           |
| `BKL-XR-005`     | SHELL + consumidores                         | `P0` / `AUTORIZACIÓN`         | Centralizar permisos, roles, contexto y propiedad funcional                 | `H-CODE-009-001`; `H-CODE-009-002`; `H-CODE-014-003`; `H-CODE-014-004`; `H-CODE-019-002`                                                                                                             | Sustituir listas locales y strings manuales por contratos compartidos; conservar diferencias legítimas por aplicación y validar equivalencia territorial.                                             | `SHELL-AUD-003`; `SHELL-AUD-004`; `SHELL-AUD-005`; `SHELL-AUD-006`; `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-CON-002`; `SHELL-CON-003`; `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-CON-006`; `SHELL-CON-007`; `SHELL-CON-016`; `AUTH-SRV-017`                                                                                                                              | `TREQ-AUTH-001`; `TREQ-AUTH-002`; `TREQ-AUTH-004`; `TREQ-SHELL-003` | Mismos casos de actor/contexto producen decisión equivalente en todos los consumidores y el catálogo no diverge.                      | E4, antes de refactorizar autorización en aplicaciones                                |
| `BKL-XR-006`     | Transversal / `vento-shell`                  | `P0` / `ASINCRONÍA`           | Definir estado de operación, retry, idempotencia, outbox e inbox            | `H-CODE-004-003`; `H-CODE-009-007`; `H-CODE-018-004`; `H-CODE-018-012`; `H-CODE-018-013`; `H-CODE-018-014`; `H-CODE-018-015`; `H-CODE-019-009`                                                       | Crear contratos compartidos para operación pendiente, error canónico, reintento, deduplicación, concurrencia, compensación, conciliación y cola de fallos.                                            | `TSVC-CAT-001`; `TSVC-CAT-002`; `TSVC-CAT-003`; `TSVC-CAT-004`; `TSVC-CAT-006`; `TSVC-CAT-007`; `TSVC-CAT-008`; `QUEUE-ARC-001`; `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-006`; `QUEUE-ARC-008`; `QUEUE-ARC-009`; `QUEUE-ARC-010`; `SHELL-CON-008`; `SHELL-CON-012`; `SHELL-CON-013`; `SHELL-CON-015`; `SHELL-CON-023`; `SHELL-CON-024`                              | `TREQ-INTEGRATION-003`                                              | Contrato y ADR aprobados; cada operación reintentable declara clave, hash, estados, timeout desconocido, retry y recuperación.        | E3/E4, puerta previa a pagos, inventario, recepción, producción, impresión y webhooks |
| `BKL-XR-007`     | SHELL + aplicaciones web                     | `P1` / `ARQUITECTURA`         | Consolidar AppShell, navegación, tipos y contratos compartidos              | `H-CODE-002-004`; `H-CODE-004-011`; `H-CODE-014-001`; `H-CODE-014-002`; `H-CODE-014-005`; `H-CODE-019-003`; `H-CODE-019-010`                                                                         | Comparar copias, clasificar compartir/generar/local y migrar por PR con compatibilidad y rollback; `vento-shell` no asume propiedad empresarial.                                                      | `SHELL-AUD-001`; `SHELL-AUD-006`; `SHELL-AUD-007`; `SHELL-AUD-008`; `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-PKG-001`; `SHELL-PKG-002`; `SHELL-PKG-004`; `SHELL-PKG-005`; `SHELL-PKG-006`; `SHELL-PKG-007`; `SHELL-PKG-008`; `SHELL-CON-001`; `SHELL-CON-002`                                                                                                            | `TREQ-SHELL-002`; `TREQ-SHELL-003`                                  | Matriz de paridad y plan de migración por repositorio; ninguna copia se retira antes de pruebas y rollback.                           | E4, antes de extraer paquetes compartidos                                             |
| `BKL-XR-008`     | Transversal                                  | `P3` / `RETIRO`               | Clasificar artefactos y exports sin consumidor confirmado                   | `H-CODE-015-008`; `H-CODE-019-012`                                                                                                                                                                   | Aplicar búsqueda estática, dinámica, framework, base, CI y consumidores externos antes de retirar o conservar artefactos.                                                                             | `SHELL-AUD-011`; `SUPA-AUD-022`; `SUPA-AUD-023`                                                                                                                                                                                                                                                                                                                          | `TREQ-SHELL-004`; `TREQ-SUPABASE-003`                               | Cada artefacto tiene consumidor confirmado o evidencia de retiro seguro y PR verificable.                                             | Después de definir reemplazos; nunca antes de la paridad                              |
| `BKL-XR-009`     | Todos los repositorios                       | `P0` / `CALIDAD`              | Crear baseline de CI, pruebas y validaciones por repositorio                | `H-CODE-007-001`; `H-CODE-007-015`; `H-CODE-016-003`; `H-CODE-016-006`                                                                                                                               | Descomponer build, typecheck, lint y test por repositorio; asignar propietario y bloquear paquetes E5 sin puertas mínimas.                                                                            | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`; `GAP-CTRL-008`                                                                                                                                                                                                                                                                             | —                                                                   | QA-REG-001 produce matriz de comandos, ambientes, fixtures, requisitos TREQ y evidencia reproducible por paquete.                     | Inmediatamente después de CODE-AUD-020 y antes de CAP-SCOPE-001                       |
| `BKL-XR-010`     | GitHub / repositorios                        | `P1` / `GOBIERNO`             | Decidir visibilidad y controles de repositorios                             | `H-CODE-001-001`; `H-CODE-017-023`                                                                                                                                                                   | Clasificar repositorios públicos y privados, secretos, datos y riesgos de exposición; documentar la decisión sin asumir que visibilidad pública equivale a vulnerabilidad.                            | `SUPA-AUD-015`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                           | —                                                                   | Decisión de visibilidad, inventario de secretos y controles de publicación aprobados por repositorio.                                 | Antes de ampliar integraciones o publicar nuevos repositorios                         |
| `BKL-XR-011`     | Móvil y web                                  | `P1` / `ESTADO_LOCAL`         | Separar preferencia, borrador, caché, cola y efecto confirmado              | `H-CODE-004-014`; `H-CODE-012-015`; `H-CODE-018-016`                                                                                                                                                 | Definir taxonomía y almacenamiento permitido, caducidad, cifrado, invalidación, reanudación y relación con el estado del servidor.                                                                    | `SHELL-AUD-009`; `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-CON-012`; `QUEUE-ARC-002`; `QUEUE-ARC-010`; `TSVC-CAT-008`                                                                                                                                                                                                                                                     | `TREQ-ANIMA-003`; `TREQ-INTEGRATION-003`                            | Cada dato local tiene clase, propietario, persistencia, TTL y regla de reconciliación; la interfaz no confunde cola con confirmación. | E4 y paquete de cada aplicación que use almacenamiento local                          |
| `BKL-XR-012`     | NEXO, VISO, ANIMA y PASS                     | `P0` / `FRONTERA_SERVIDOR`    | Normalizar lectura y mutación entre cliente, servidor, RPC y Edge Functions | `H-CODE-003-002`; `H-CODE-004-010`; `H-CODE-004-012`; `H-CODE-005-002`; `H-CODE-019-003`                                                                                                             | Clasificar cada escritura y consulta por frontera autorizada, minimizar clientes privilegiados y eliminar confianza exclusiva en UI o código móvil.                                                   | `AUTH-SRV-001`; `AUTH-SRV-002`; `AUTH-SRV-003`; `AUTH-SRV-004`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-007`; `AUTH-SRV-010`; `AUTH-SRV-011`; `AUTH-SRV-012`; `AUTH-SRV-013`; `AUTH-SRV-017`; `SUPA-AUD-022`; `SUPA-AUD-023`                                                                                                                                           | `TREQ-AUTH-001`; `TREQ-AUTH-005`; `TREQ-AUTH-006`; `TREQ-AUTH-007`  | Matriz acción → frontera → permiso → alcance → datos → auditoría aprobada y pruebas negativas asociadas.                              | P0, antes de conservar o reescribir mutaciones                                        |
| `BKL-VISO-001`   | `vento-viso`                                 | `P0` / `AUTORIZACIÓN`         | Restringir administración de seguridad por territorio y capacidad           | `H-CODE-017-014`                                                                                                                                                                                     | Sustituir la concesión global derivada de `gerente` por permiso, sede, área y columnas autorizadas; auditar cambios.                                                                                  | `VISO-AUTH-005`; `VISO-AUTH-006`; `VISO-AUTH-007`; `VISO-AUTH-008`; `VISO-AUTH-009`; `VISO-AUTH-018`; `VISO-AUTH-019`; `VISO-UX-013`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-012`; `AUTH-DB-002`                                                                                                                                                                      | `TREQ-AUTH-007`                                                     | Pruebas de gerente global, gerente de sede y actor sin permiso demuestran aislamiento territorial.                                    | P0 antes de ampliar administración de roles o perfiles                                |
| `BKL-VISO-002`   | `vento-viso` / `vento-shell`                 | `P0` / `SEGURIDAD`            | Encapsular cliente administrativo y tablas `viso.*`                         | `H-CODE-004-013`; `H-CODE-006-017`; `H-CODE-017-020`                                                                                                                                                 | Mantener `server-only`, identificar cada uso de `service_role`, validar autorización antes de invocarlo y reducir operaciones directas sobre tablas administrativas.                                  | `AUTH-SRV-001`; `AUTH-SRV-004`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-017`; `SUPA-AUD-009`; `SUPA-AUD-022`; `SUPA-AUD-023`; `AUTH-DB-002`; `AUTH-DB-004`                                                                                                                                                                                                             | `TREQ-AUTH-001`; `TREQ-AUTH-007`                                    | Ningún cliente privilegiado es importable desde browser y cada acción administrativa tiene guard y auditoría.                         | P0 junto con endurecimiento de RLS                                                    |
| `BKL-VISO-003`   | `vento-viso` + `Vento-Group`                 | `P1` / `MEDIOS`               | Corregir contrato de `website-media`                                        | `H-CODE-006-010`                                                                                                                                                                                     | Alinear privacidad del bucket, URL entregada, caché, autorización y ciclo de vida con el uso público aprobado del CMS.                                                                                | `SUPA-AUD-012`; `SUPA-AUD-016`; `SUPA-AUD-017`; `EVID-ARC-003`; `EVID-ARC-007`; `SUPA-TRANS-001`; `SUPA-TRANS-007`                                                                                                                                                                                                                                                       | `TREQ-SUPABASE-004`                                                 | La ruta pública o firmada corresponde a la clasificación del medio y no expone otros objetos.                                         | Antes de migrar o ampliar el CMS                                                      |
| `BKL-VISO-004`   | `vento-viso`                                 | `P1` / `CALIDAD`              | Resolver errores de lint bloqueantes                                        | `H-CODE-016-003`                                                                                                                                                                                     | Descomponer los errores por módulo, corregirlos sin cambios semánticos ocultos y establecer el comando reproducible en CI.                                                                            | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Lint verde con baseline documentada y sin desactivar reglas para ocultar errores.                                                     | Antes del primer paquete E5 de VISO                                                   |
| `BKL-VISO-005`   | `vento-viso`                                 | `P1` / `PROPIEDAD_FUNCIONAL`  | Separar administración, catálogo, CMS y capacidades consumidoras            | `H-CODE-002-005`; `H-CODE-019-003`                                                                                                                                                                   | Usar VISO como superficie administrativa sin convertirlo en propietario de producto, marketing, inventario o procesos de otras aplicaciones.                                                          | `CAP-SCOPE-001`; `CAP-SCOPE-002`; `CAP-SCOPE-003`; `CAP-SCOPE-004`; `CAP-SCOPE-014`; `CAP-SCOPE-016`; `CAP-SCOPE-019`; `SHELL-CON-016`; `VISO-UX-017`; `VISO-UX-018`                                                                                                                                                                                                     | —                                                                   | Cada acción de VISO enlaza o administra mediante contrato de la aplicación propietaria y no duplica lógica empresarial.               | E2, al aprobar propiedad de dominios                                                  |
| `BKL-ANIMA-001`  | `vento-anima`                                | `P1` / `FUNCIONAL`            | Completar audiencia, lectura, edición y archivo de novedades                | `H-CODE-010-001`; `H-CODE-012-001`; `H-CODE-012-002`; `H-CODE-012-003`                                                                                                                               | Persistir audiencia, aplicarla al leer, recuperarla al editar, definir reenvío y reemplazar eliminación destructiva por archivo/historial cuando corresponda.                                         | `ANIMA-UX-017`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-011`; `SUPA-AUD-022`; `SUPA-AUD-023`                                                                                                                                                                                                                                                                           | `TREQ-ANIMA-001`                                                    | Pruebas por audiencia, edición, archivo y lectura fuera de alcance; historial editorial auditable.                                    | Paquete ANIMA de novedades en E5                                                      |
| `BKL-ANIMA-002`  | `vento-anima`                                | `P1` / `DEGRADACIÓN`          | Alinear interfaz de fallback con capacidades reales                         | `H-CODE-010-002`; `H-CODE-012-004`                                                                                                                                                                   | Ocultar o deshabilitar mutaciones cuando el origen solo admite lectura y mostrar el modo degradado de forma explícita.                                                                                | `ANIMA-UX-017`; `TSVC-CAT-008`; `SHELL-CON-008`                                                                                                                                                                                                                                                                                                                          | `TREQ-ANIMA-002`                                                    | Modo fallback no ofrece acciones imposibles y recupera la capacidad al restablecer el contrato principal.                             | Junto con el paquete ANIMA que retire o formalice el fallback                         |
| `BKL-ANIMA-003`  | `vento-anima` / `vento-viso`                 | `P1` / `PROCESO`              | Diseñar corrección auditable de asistencia y novedades                      | `H-CODE-011-009`                                                                                                                                                                                     | Definir solicitud, aprobación, corrección, motivo, actor, antes/después y efecto sobre reportes sin editar historia silenciosamente.                                                                  | `PROC-CAT-002`; `PROC-CAT-013`; `PROC-CAT-014`; `PROC-CAT-018`; `CAP-SCOPE-002`; `ANIMA-UX-011`; `ANIMA-UX-012`                                                                                                                                                                                                                                                          | —                                                                   | Proceso TO-BE y eventos de corrección aprobados; cada ajuste conserva original, actor y evidencia.                                    | E2 antes de implementar correcciones                                                  |
| `BKL-ANIMA-004`  | `vento-anima` / `vento-shell`                | `P0` / `AUTORIZACIÓN`         | Eliminar confianza en rol y sede enviados al aceptar invitación             | `H-CODE-017-001`                                                                                                                                                                                     | Tomar rol, sede, vigencia e identidad solo de invitación persistida y pendiente; rechazar metadatos o payload autoadministrables.                                                                     | `ANIMA-AUTH-019`; `ANIMA-AUTH-020`; `AUTH-SRV-004`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-DB-002`; `AUTH-DB-004`                                                                                                                                                                                                                                                         | `TREQ-AUTH-005`                                                     | Pruebas de manipulación de payload no cambian rol ni sede; replay y expiración quedan controlados.                                    | P0 antes de aceptar nuevas invitaciones productivas                                   |
| `BKL-ANIMA-005`  | `vento-anima` / `vento-shell`                | `P0` / `OFFLINE`              | Confirmar persistencia durable y contrato único de marcación                | `H-CODE-004-004`; `H-CODE-018-001`; `H-CODE-018-003`                                                                                                                                                 | No comunicar “encolado” si SecureStore falla; conservar `client_event_id`, sobrevivir reinicio y retirar fallback que evita semántica `applied/duplicate/conflict` sin paridad.                       | `ANIMA-AUTH-014`; `ANIMA-AUTH-015`; `ANIMA-UX-011`; `ANIMA-UX-012`; `AUTH-QA-026`; `SUPA-TRANS-006`                                                                                                                                                                                                                                                                      | `TREQ-ANIMA-003`; `TREQ-SUPABASE-001`                               | Escenarios de cierre, reinicio, respuesta perdida y replay convergen sin pérdida ni doble marcación.                                  | P0 en paquete de sincronización ANIMA                                                 |
| `BKL-ANIMA-006`  | `vento-anima` / `vento-shell`                | `P0` / `CONCURRENCIA`         | Hacer idempotentes las transiciones de descanso                             | `H-CODE-018-002`                                                                                                                                                                                     | Usar identificador persistido y RPC atómica para inicio/cierre; resolver duplicado, conflicto y eventos fuera de orden.                                                                               | `ANIMA-AUTH-014`; `ANIMA-AUTH-015`; `QUEUE-ARC-003`; `QUEUE-ARC-009`; `AUTH-QA-026`                                                                                                                                                                                                                                                                                      | `TREQ-ANIMA-004`                                                    | Dos dispositivos y replays no crean dos descansos ni cierran uno distinto.                                                            | P0 junto con asistencia offline                                                       |
| `BKL-ANIMA-007`  | `vento-anima`                                | `P1` / `ENTREGA`              | Formalizar build, tienda, segundo plano y validaciones móviles              | `H-CODE-001-003`; `H-CODE-003-006`; `H-CODE-016-006`                                                                                                                                                 | Vincular build productivo, ficha pública, permisos, tareas de segundo plano, notificaciones y comandos de validación reproducibles.                                                                   | `QA-REG-001`; `CAP-SCOPE-015`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                                            | —                                                                   | Build y ficha están vinculados; escenarios de permisos, background y notificación tienen evidencia en dispositivo.                    | Antes de siguiente release móvil                                                      |
| `BKL-TAL-001`    | `vento-talento`                              | `P2` / `PRODUCTO_FUTURO`      | Mantener TALENTO no operativo hasta aprobar alcance y despliegue            | `H-CODE-001-004`; `H-CODE-002-006`; `H-CODE-003-008`; `H-CODE-004-008`; `H-CODE-011-008`; `H-CODE-019-004`                                                                                           | No activar pantallas, servicios, buckets ni esquema como producto actual; definir alcance, postulación, expediente, evaluación, oferta y período de prueba.                                           | `CAP-TAL-001`; `CAP-TAL-002`; `CAP-TAL-003`; `CAP-TAL-004`; `CAP-TAL-005`; `CAP-TAL-006`; `CAP-SCOPE-002`                                                                                                                                                                                                                                                                | —                                                                   | Producto y transición aprobados, ambiente y despliegue definidos, datos piloto autorizados y sin duplicar identidad laboral.          | E2; diferido hasta aprobar CAP-TAL-001 a CAP-TAL-006                                  |
| `BKL-TAL-002`    | `vento-talento`, `vento-viso`, `vento-anima` | `P1` / `TRASPASO`             | Definir handoff idempotente de candidato a trabajador                       | `H-CODE-019-002`; `H-CODE-019-004`                                                                                                                                                                   | Separar candidato, pre-registro y trabajador; transferir datos, consentimiento, documentos, rol provisional y cierre sin crear identidades duplicadas.                                                | `CAP-TAL-001`; `CAP-TAL-003`; `CAP-TAL-004`; `CAP-TAL-005`; `CAP-TAL-006`; `SHELL-CON-014`; `SHELL-CON-023`                                                                                                                                                                                                                                                              | —                                                                   | Contrato de traspaso, claves, estados y rollback aprobados antes de cualquier integración.                                            | E2/E4 antes de implementar TALENTO                                                    |
| `BKL-NEXO-001`   | `vento-nexo`                                 | `P0` / `CALIDAD`              | Restablecer typecheck, build y lint reproducibles                           | `H-CODE-016-002`; `H-CODE-016-003`                                                                                                                                                                   | Resolver incompatibilidad de `Worksheet.dataValidations`, separar errores de lint y no silenciar el problema mediante casts globales o desactivación de reglas.                                       | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Instalación limpia, typecheck, build y lint verdes con comandos documentados.                                                         | P0 antes de cualquier paquete E5 de NEXO                                              |
| `BKL-NEXO-002`   | `vento-nexo`                                 | `P0` / `GOBIERNO_CI`          | Retirar workflow, script y log de parche temporal                           | `H-CODE-008-008`; `H-CODE-008-009`; `H-CODE-009-010`                                                                                                                                                 | Eliminar capacidad de mutar `preview` automáticamente, conservar historia necesaria y verificar que el código canónico ya contiene la solución aprobada.                                              | `SHELL-AUD-011`; `QA-REG-001`; `SHELL-PKG-007`; `SHELL-PKG-008`                                                                                                                                                                                                                                                                                                          | `TREQ-NEXO-001`                                                     | No queda workflow activable con `contents: write`; rama y código canónico pasan build y regresión.                                    | P0 de saneamiento antes de nuevos cambios NEXO                                        |
| `BKL-NEXO-003`   | `vento-nexo`                                 | `P1` / `CATÁLOGO`             | Eliminar truncamiento de productos en ajustes                               | `H-CODE-009-008`; `H-CODE-010-007`; `H-CODE-012-006`                                                                                                                                                 | Implementar búsqueda/paginación completa y demostrar que todo producto elegible puede localizarse independientemente de stock actual.                                                                 | `NEXO-UX-019`; `NEXO-UX-021`; `NEXO-UX-022`; `NEXO-UX-023`                                                                                                                                                                                                                                                                                                               | `TREQ-NEXO-002`                                                     | Prueba con más de 500 productos y producto sin stock confirma selección sin omisiones.                                                | Paquete NEXO de ajustes                                                               |
| `BKL-NEXO-004`   | `vento-nexo` / `vento-shell`                 | `P1` / `LPN`                  | Construir ciclo alcanzable y auditable de LPN                               | `H-CODE-011-002`; `H-CODE-011-003`; `H-CODE-011-004`; `H-CODE-011-005`; `H-CODE-015-001`; `H-CODE-015-002`; `H-CODE-015-003`; `H-CODE-015-004`; `H-CODE-015-005`                                     | Conectar creación, contenido, ubicación, custodia, movimiento, cierre, anulación y reetiquetado; clasificar endpoint y objetos sin consumidor.                                                        | `NEXO-DOM-002`; `NEXO-DOM-003`; `NEXO-DOM-004`; `NEXO-DOM-005`; `NEXO-DOM-006`; `NEXO-DOM-007`; `NEXO-DOM-008`; `NEXO-DOM-019`; `NEXO-DOM-020`; `NEXO-DOM-021`; `NEXO-DOM-022`; `NEXO-DOM-023`; `NEXO-DOM-024`; `NEXO-UX-026`; `NEXO-UX-027`; `NEXO-UX-036`; `NEXO-UX-037`; `NEXO-UX-038`; `NEXO-UX-039`; `NEXO-UX-040`; `SHELL-AUD-011`; `SUPA-AUD-022`; `SUPA-AUD-023` | `TREQ-NEXO-004`; `TREQ-SUPABASE-003`                                | Flujo E2E en tablet y base, sin doble contabilización; todo objeto LPN tiene consumidor y propietario.                                | E2 diseño; E3 datos; E5 implementación NEXO                                           |
| `BKL-NEXO-005`   | `vento-nexo` / `vento-shell`                 | `P0` / `CONTRATO_DATOS`       | Resolver relaciones ausentes y fallbacks legacy de remisiones               | `H-CODE-006-003`; `H-CODE-006-004`; `H-CODE-013-005`; `H-CODE-013-010`                                                                                                                               | Determinar contrato canónico de `locations_validation` y resumen operativo, distinguir error de esquema de permisos/red y retirar inferencias por nombre o consulta legacy con transición controlada. | `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-AUD-018`; `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-TRANS-001`; `SUPA-TRANS-005`; `SUPA-TRANS-006`; `SUPA-TRANS-007`; `SUPA-TRANS-012`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                             | `TREQ-NEXO-007`; `TREQ-SUPABASE-001`                                | Paridad entre contrato nuevo y fallback demostrada; ausencia de objeto no se oculta como éxito parcial.                               | P0 antes de retirar compatibilidad o ampliar remisiones                               |
| `BKL-NEXO-006`   | `vento-nexo`, `vento-fogo`, `vento-origo`    | `P0` / `PRODUCTO`             | Unificar perfil, unidades, SKU y precedencias de producto                   | `H-CODE-013-008`; `H-CODE-013-009`; `H-CODE-014-007`; `H-CODE-014-008`                                                                                                                               | Definir fuente canónica y backfill para stock, entrada, conversión, modalidad y tolerancias; no inventar defaults silenciosos.                                                                        | `CAP-SCOPE-004`; `CAP-SCOPE-006`; `DATA-NORM-AUD-004`; `SUPA-AUD-019`; `SUPA-TRANS-005`; `SUPA-TRANS-007`; `SUPA-TRANS-012`; `SHELL-AUD-009`; `SHELL-CON-001`; `SHELL-CON-012`                                                                                                                                                                                           | `TREQ-NEXO-008`; `TREQ-NEXO-010`                                    | Mismos casos producen misma unidad y conversión en todos los consumidores; excepciones quedan identificadas y migrables.              | E2/E3 antes de modificar inventario o producción                                      |
| `BKL-NEXO-007`   | `vento-nexo` / `vento-shell`                 | `P0` / `ATOMICIDAD`           | Convertir ajuste de inventario en operación atómica e idempotente           | `H-CODE-014-009`; `H-CODE-018-008`                                                                                                                                                                   | Unificar movimiento, stock por sede/LOC/posición, costo y evento derivado mediante RPC transaccional o mecanismo reconciliable con clave estable.                                                     | `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-ARC-016`; `SUPA-ARC-017`; `SUPA-TRANS-008`; `SHELL-CON-023`                                                                                                                                                                                                                                                        | `TREQ-SUPABASE-002`                                                 | Fallos inyectados y solicitudes concurrentes no dejan proyecciones divergentes ni duplican movimientos.                               | P0 en paquete E3/E5 de ajustes                                                        |
| `BKL-NEXO-008`   | `vento-nexo` / `vento-shell`                 | `P0` / `REMISIONES`           | Cerrar autorización y exactamente-una-vez en remisiones                     | `H-CODE-012-009`; `H-CODE-012-010`; `H-CODE-013-006`; `H-CODE-014-006`; `H-CODE-018-011`                                                                                                             | Resolver capacidad por permisos/contexto, declarar modo record-only o inventory, publicar efectos idempotentes y conciliar estados y LOC.                                                             | `PROC-ACTOR-002`; `PROC-ACTOR-010`; `NEXO-AUTH-029`; `NEXO-UX-009`; `NEXO-UX-010`; `NEXO-UX-011`; `NEXO-UX-012`; `NEXO-UX-013`; `NEXO-UX-022`; `NEXO-UX-023`; `NEXO-UX-025`; `SUPA-AUD-019`; `SHELL-CON-023`                                                                                                                                                             | `TREQ-NEXO-006`; `TREQ-NEXO-009`                                    | Piloto y replay demuestran un solo efecto, alcance correcto y reconciliación completa.                                                | P0 antes de activar inventario del piloto                                             |
| `BKL-NEXO-009`   | `vento-nexo`                                 | `P1` / `IMPRESIÓN`            | Crear trabajo durable de impresión y validar salida física                  | `H-CODE-007-005`; `H-CODE-007-006`; `H-CODE-010-003`; `H-CODE-011-011`; `H-CODE-012-007`; `H-CODE-012-008`; `H-CODE-018-010`                                                                         | Separar preview de aprobación física; conservar trabajo, dispositivo, ZPL, resultado, error, reintento y motivo de reimpresión hasta ack definitivo.                                                  | `NEXO-UX-037`; `NEXO-UX-038`; `NEXO-AUTH-028`; `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-006`; `QUEUE-ARC-008`; `QUEUE-ARC-009`; `QUEUE-ARC-010`                                                                                                                                                                                                                      | `TREQ-NEXO-003`; `TREQ-NEXO-005`                                    | Pruebas BrowserPrint y físicas por DPI/tamaño/código; pérdida de conexión no pierde ni duplica trabajo.                               | Paquete NEXO de impresión y hardware                                                  |
| `BKL-NEXO-010`   | `vento-nexo`                                 | `P1` / `ACTIVOS`              | Validar adopción de conteo, mantenimiento, garantías y baja                 | `H-CODE-019-007`                                                                                                                                                                                     | No declarar operativas las estructuras de activos; definir ciclo, responsables, evidencia, repuestos, vehículo y transición desde controles externos.                                                 | `CAP-SCOPE-007`; `PROC-CAT-002`; `GAP-CTRL-005`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                          | —                                                                   | Clasificación empresarial y proceso TO-BE aprobados; piloto demuestra uso y trazabilidad antes del rollout.                           | E2 y paquete NEXO de activos                                                          |
| `BKL-NEXO-011`   | `vento-nexo` / operación                     | `P1` / `INSTALACIONES`        | Definir solución para mantenimiento de instalaciones                        | `H-CODE-019-008`                                                                                                                                                                                     | Evaluar BUILD, BUY, integración o control manual para limpieza, plagas, servicios, calibración, llaves, obras y cierre de novedades.                                                                  | `CAP-SCOPE-013`; `PROC-CAT-002`; `GAP-CTRL-005`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                          | —                                                                   | Decisión aprobada por subcapacidad y método actual conservado hasta cutover.                                                          | E1/E2 antes de asignar implementación                                                 |
| `BKL-FOGO-001`   | `vento-fogo` / `vento-nexo`                  | `P0` / `PRODUCCIÓN`           | Completar y adoptar el ciclo productivo                                     | `H-CODE-012-013`; `H-CODE-012-014`; `H-CODE-019-007`                                                                                                                                                 | Diseñar inicio, parciales, consumos, desperdicio, resultado, finalización, cancelación y corrección; conectar inventario y costo sin borrar historia.                                                 | `CAP-SCOPE-008`; `FOGO-AUTH-009`; `FOGO-AUTH-010`; `FOGO-AUTH-011`; `FOGO-AUTH-012`; `FOGO-AUTH-013`; `FOGO-AUTH-014`; `FOGO-UX-005`; `FOGO-UX-006`; `FOGO-UX-007`; `FOGO-UX-010`; `FOGO-UX-011`; `FOGO-UX-012`; `FOGO-UX-013`                                                                                                                                           | `TREQ-FOGO-001`                                                     | Piloto con lote real autorizado demuestra estados, actor, consumo, terminado, corrección e inventario coherentes.                     | P0 de diseño y piloto antes de activar producción                                     |
| `BKL-FOGO-002`   | `vento-fogo`                                 | `P2` / `CALIDAD`              | Resolver warnings de lint antes de endurecer CI                             | `H-CODE-016-004`                                                                                                                                                                                     | Clasificar los ocho warnings, corregir los que representen riesgo y documentar baseline temporal sin convertir warnings en deuda permanente.                                                          | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Lint sin warnings no aceptados o con excepciones temporales, justificadas y fechadas.                                                 | Antes de activar lint estricto en CI                                                  |
| `BKL-ORIGO-001`  | `vento-origo` / `vento-shell`                | `P0` / `RECEPCIÓN`            | Hacer atómica e idempotente la recepción y corrección                       | `H-CODE-003-004`; `H-CODE-012-012`; `H-CODE-018-009`; `H-CODE-019-007`                                                                                                                               | Unificar cabecera, líneas, movimientos, stock, costos, cantidades de orden, estado, solicitudes maestras y corrección bajo una operación durable y reconciliable.                                     | `CAP-SCOPE-005`; `ORIGO-UX-009`; `ORIGO-UX-010`; `ORIGO-UX-014`; `ORIGO-UX-016`; `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-TRANS-008`; `SHELL-CON-023`                                                                                                                                                                                                       | `TREQ-ORIGO-001`; `TREQ-ORIGO-003`; `TREQ-SUPABASE-002`             | Fallos inyectados y replay no duplican recepción, inventario, costo ni orden recibida; corrección garantiza reemplazo.                | P0 antes del piloto con efecto de inventario                                          |
| `BKL-ORIGO-002`  | `vento-origo` / `vento-shell`                | `P0` / `AUTORIZACIÓN`         | Restringir órdenes de compra y endurecer PDF público                        | `H-CODE-017-011`; `H-CODE-017-012`                                                                                                                                                                   | Aplicar permiso, sede/centro de costo, estado y columnas; eliminar secreto fallback y usar token scoped, corto y revocable.                                                                           | `ORIGO-AUTH-004`; `ORIGO-AUTH-005`; `ORIGO-AUTH-006`; `ORIGO-AUTH-007`; `ORIGO-AUTH-008`; `ORIGO-AUTH-009`; `ORIGO-AUTH-010`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-011`; `AUTH-SRV-012`; `AUTH-DB-002`; `AUTH-DB-004`; `SUPA-AUD-015`                                                                                                                               | `TREQ-ORIGO-002`                                                    | Pruebas por rol/sede/estado y token expirado/revocado; enlace sin secreto configurado falla cerrado.                                  | P0 antes de compartir documentos de compra                                            |
| `BKL-ORIGO-003`  | `vento-origo`                                | `P1` / `CALIDAD`              | Resolver errores de lint bloqueantes                                        | `H-CODE-016-003`                                                                                                                                                                                     | Corregir los errores de lint con instalación limpia y crear puerta CI reproducible.                                                                                                                   | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Lint verde y sin supresiones globales no justificadas.                                                                                | Antes del primer paquete E5 de ORIGO                                                  |
| `BKL-PULSO-001`  | `vento-pulso` / `vento-shell`                | `P0` / `POS`                  | Construir ciclo E2E de venta, caja y pago                                   | `H-CODE-003-005`; `H-CODE-011-006`; `H-CODE-011-010`; `H-CODE-015-010`; `H-CODE-015-011`; `H-CODE-015-012`; `H-CODE-015-013`; `H-CODE-015-014`; `H-CODE-015-016`; `H-CODE-015-017`; `H-CODE-019-007` | Separar prototipo, mocks y contratos reales; completar apertura, venta, líneas, modificadores, cobro, pago, inventario, lealtad, reversión y cierre.                                                  | `CAP-SCOPE-009`; `PULSO-UX-001`; `PULSO-UX-007`; `PULSO-UX-008`; `PULSO-UX-009`; `PULSO-UX-010`; `PULSO-UX-016`; `PULSO-UX-017`; `PULSO-UX-018`; `PULSO-UX-020`; `PULSO-UX-021`; `PULSO-AUTH-006`; `PULSO-AUTH-007`; `PULSO-AUTH-008`; `PULSO-AUTH-009`; `PULSO-AUTH-010`; `SUPA-AUD-022`; `SUPA-AUD-023`                                                                | `TREQ-PULSO-001`; `TREQ-PULSO-003`                                  | Escenario E2E en terminal controlada cuadra caja, inventario, pago, lealtad, anulación y auditoría.                                   | P0 de diseño y arquitectura antes de activar POS interno                              |
| `BKL-PULSO-002`  | `vento-pulso`                                | `P1` / `LEGACY`               | Migrar tablero legacy y normalizar estados                                  | `H-CODE-013-001`; `H-CODE-013-002`; `H-CODE-013-003`                                                                                                                                                 | Demostrar paridad del tablero, retirar import runtime legacy y resolver `in_transit`/`on_the_way` mediante contrato canónico y migración.                                                             | `PULSO-AUTH-002`; `PULSO-UX-001`; `PULSO-UX-007`; `PULSO-UX-013`; `PULSO-UX-019`; `SHELL-AUD-001`; `SHELL-PKG-004`; `SHELL-PKG-005`; `SHELL-CON-010`; `SUPA-TRANS-001`; `SUPA-TRANS-006`; `SUPA-TRANS-007`; `SUPA-TRANS-012`; `SUPA-TRANS-013`                                                                                                                           | `TREQ-PULSO-002`; `TREQ-SUPABASE-001`                               | Pruebas de paridad aprobadas y cero imports runtime al módulo legacy después del cutover.                                             | Antes de retirar `orders-board-legacy`                                                |
| `BKL-PULSO-003`  | `vento-pulso` / `vento-shell`                | `P0` / `AUTORIZACIÓN`         | Proteger mutaciones de pedidos y líneas                                     | `H-CODE-017-013`                                                                                                                                                                                     | Reemplazar update amplio por acciones nombradas con permiso, sede, estado inicial, transición y columnas permitidas.                                                                                  | `PULSO-AUTH-006`; `PULSO-AUTH-007`; `PULSO-AUTH-008`; `PULSO-AUTH-009`; `PULSO-AUTH-010`; `PULSO-AUTH-011`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-011`; `AUTH-SRV-012`; `AUTH-DB-002`; `AUTH-DB-004`                                                                                                                                                                 | `TREQ-PULSO-004`                                                    | Pruebas negativas impiden cambiar pago, precio, inventario, lealtad o estado fuera de transición autorizada.                          | P0 antes de usar PULSO con pedidos reales                                             |
| `BKL-PULSO-004`  | `vento-pulso`                                | `P3` / `RETIRO`               | Clasificar scripts manuales sin comando actual                              | `H-CODE-015-009`                                                                                                                                                                                     | Confirmar uso histórico/externo, documentar reemplazo y retirar o integrar scripts sin convertirlos en fuente productiva accidental.                                                                  | `SHELL-AUD-011`; `PULSO-UX-019`                                                                                                                                                                                                                                                                                                                                          | `TREQ-SHELL-004`                                                    | Cada script queda vinculado a comando/documentación o retirado con evidencia.                                                         | Después de decidir arquitectura POS                                                   |
| `BKL-PULSO-005`  | `vento-pulso` / Supabase                     | `P1` / `REALTIME`             | Corregir suscripciones sobre vistas y publicación                           | `H-CODE-006-011`; `H-CODE-006-012`                                                                                                                                                                   | Determinar tablas/eventos reales, evitar Postgres Changes sobre vistas no servidas y definir fallback/polling con estado visible.                                                                     | `SUPA-AUD-013`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-ARC-019`; `SUPA-TRANS-001`; `SUPA-TRANS-007`; `SUPA-TRANS-013`                                                                                                                                                                                                                                                     | —                                                                   | Suscripciones reciben eventos reproducibles o usan contrato alterno probado sin silencio.                                             | Antes de depender de actualización en tiempo real                                     |
| `BKL-PULSO-006`  | `vento-pulso`                                | `P1` / `CALIDAD`              | Resolver errores de lint bloqueantes                                        | `H-CODE-016-003`                                                                                                                                                                                     | Corregir los errores por módulo y establecer puerta CI reproducible.                                                                                                                                  | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Lint verde sin desactivar reglas para ocultar deuda.                                                                                  | Antes del primer paquete E5 de PULSO                                                  |
| `BKL-NUMERA-001` | `vento-numera`                               | `P1` / `ALCANCE_FUNCIONAL`    | Separar costos/reportes de contabilidad y tesorería completas               | `H-CODE-019-007`                                                                                                                                                                                     | Clasificar gastos, presupuestos, bancos, cartera, obligaciones, impuestos, cierres y rentabilidad; no presentar tablas vacías como proceso operativo.                                                 | `CAP-SCOPE-012`; `CAP-SCOPE-017`; `PROC-CAT-002`; `GAP-CTRL-005`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                         | —                                                                   | Clasificación BUILD/BUY/INTEGRATE/MANUAL y propietario aprobados por subcapacidad.                                                    | E1/E2 antes de ampliar NUMERA                                                         |
| `BKL-NUMERA-002` | `vento-numera`                               | `P1` / `DEPENDENCIAS`         | Reproducir instalación y resolver vulnerabilidades/scripts pendientes       | `H-CODE-016-005`                                                                                                                                                                                     | Documentar versión de runtime, lockfile y aprobación de scripts; evaluar vulnerabilidades sin ejecutar `npm audit fix` indiscriminado.                                                                | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Instalación limpia reproducible, scripts revisados y vulnerabilidades con decisión explícita.                                         | Antes del primer release posterior al corte                                           |
| `BKL-PASS-001`   | `vento-pass`                                 | `P2` / `RETIRO_UX`            | Resolver stubs y pantallas desconectadas                                    | `H-CODE-008-004`; `H-CODE-008-005`; `H-CODE-010-005`; `H-CODE-015-006`; `H-CODE-015-007`                                                                                                             | Confirmar consumidor, implementar flujo real o retirar acciones/pantallas; evitar cadenas transitivamente huérfanas.                                                                                  | `PASS-UX-001`; `PASS-UX-002`; `PASS-UX-006`; `PASS-UX-013`; `SHELL-AUD-011`                                                                                                                                                                                                                                                                                              | `TREQ-PASS-001`; `TREQ-PASS-002`; `TREQ-PASS-007`                   | Navegación activa no expone “Próximamente” como capacidad y no conserva pantallas paralelas sin decisión.                             | Paquete de convergencia UX PASS                                                       |
| `BKL-PASS-002`   | `vento-pass`                                 | `P1` / `HISTORIAL`            | Corregir atribución de transacciones Saudo                                  | `H-CODE-008-007`; `H-CODE-009-009`; `H-CODE-010-006`; `H-CODE-012-005`                                                                                                                               | Resolver sede determinísticamente o mostrar sin atribución; backfill y retiro del filtro temporal sin omitir transacciones legítimas.                                                                 | `PASS-UX-006`; `PASS-QA-001`; `PASS-QA-002`; `SUPA-AUD-019`; `SUPA-TRANS-005`; `SUPA-TRANS-007`                                                                                                                                                                                                                                                                          | `TREQ-PASS-003`                                                     | Historial incluye todos los casos y distingue atribución, no atribución y datos legacy.                                               | Antes de retirar filtro temporal                                                      |
| `BKL-PASS-003`   | `vento-pass`, `vento-viso`, `vento-shell`    | `P1` / `CONTRATOS`            | Centralizar sedes, identidad comercial, dominios y enlaces                  | `H-CODE-009-003`; `H-CODE-009-004`; `H-CODE-009-005`; `H-CODE-009-006`; `H-CODE-014-011`; `H-CODE-014-012`                                                                                           | Definir fuente canónica de site, marca, dirección, coordenadas, URLs y esquemas; retirar heurísticas y literales con compatibilidad controlada.                                                       | `PASS-UX-001`; `PASS-UX-006`; `SHELL-CON-002`; `SHELL-CON-014`; `SHELL-CON-016`; `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-TRANS-005`; `SUPA-TRANS-007`                                                                                                                                                                                                      | `TREQ-PASS-004`; `TREQ-INTEGRATION-001`; `TREQ-PASS-006`            | Todas las rutas resuelven la misma sede y datos comerciales; links por ambiente pasan E2E.                                            | E3/E4 antes de consolidar experiencias                                                |
| `BKL-PASS-004`   | `vento-pass`                                 | `P1` / `CONVERGENCIA_UX`      | Consolidar experiencias y rutas equivalentes                                | `H-CODE-002-002`; `H-CODE-002-003`; `H-CODE-003-010`; `H-CODE-014-010`                                                                                                                               | Elegir rutas canónicas para experiencias, legales, retorno y seguimiento; conservar compatibilidad solo con consumidor y puerta de retiro.                                                            | `PASS-UX-001`; `PASS-UX-002`; `PASS-UX-003`; `PASS-UX-006`; `PASS-UX-013`; `SHELL-AUD-011`                                                                                                                                                                                                                                                                               | `TREQ-PASS-006`; `TREQ-PASS-007`                                    | Una sola experiencia canónica por flujo y rutas reemplazadas con redirects/deep links probados.                                       | Antes de siguiente reorganización de navegación                                       |
| `BKL-PASS-005`   | `vento-pass` / `vento-pulso` / `vento-shell` | `P0` / `FIDELIZACIÓN`         | Mover ledger y redención a contratos autorizados y atómicos                 | `H-CODE-017-004`; `H-CODE-017-005`; `H-CODE-017-006`; `H-CODE-018-005`                                                                                                                               | Impedir inserción cliente, validar permiso/sede/estado y ejecutar redención y saldo mediante operación server atómica e idempotente.                                                                  | `PULSO-AUTH-009`; `PULSO-AUTH-010`; `PASS-INT-001`; `PASS-INT-002`; `PASS-QA-002`; `AUTH-DB-002`; `AUTH-DB-004`; `SHELL-CON-023`                                                                                                                                                                                                                                         | `TREQ-PASS-008`                                                     | Pruebas concurrentes y de autorización no permiten crear puntos, doble gasto ni redención fuera de sede.                              | P0 antes de ampliar fidelización o canjes                                             |
| `BKL-PASS-006`   | `vento-pass` / `vento-shell`                 | `P0` / `PAGOS`                | Serializar intentos y aplicar webhooks exactamente una vez                  | `H-CODE-018-006`; `H-CODE-018-007`                                                                                                                                                                   | Reclamar idempotency key/evento de forma atómica, conservar resultado, impedir regresión de estados y conciliar eventos tardíos o ambiguos.                                                           | `INT-EXT-010`; `INT-EXT-012`; `INT-EXT-015`; `SUPA-ARC-020`; `SUPA-AUD-014`; `PASS-QA-002`; `SHELL-CON-023`                                                                                                                                                                                                                                                              | `TREQ-PASS-009`; `TREQ-INTEGRATION-003`                             | Carreras, replay y orden invertido convergen en una transacción y estado terminal válidos.                                            | P0 en paquete de pagos y webhooks                                                     |
| `BKL-PASS-007`   | `vento-pass`, `vento-pulso`, `vento-shell`   | `P0` / `PRIVACIDAD`           | Proteger columnas de usuario y limitar lectura de PII                       | `H-CODE-017-002`; `H-CODE-017-003`                                                                                                                                                                   | Separar campos autoadministrables y protegidos; ofrecer proyecciones mínimas por proceso, permiso y sede.                                                                                             | `PASS-INT-004`; `PASS-INT-005`; `PULSO-AUTH-006`; `PULSO-AUTH-009`; `PULSO-AUTH-010`; `AUTH-SRV-004`; `AUTH-SRV-005`; `AUTH-DB-002`; `AUTH-DB-004`                                                                                                                                                                                                                       | `TREQ-AUTH-006`                                                     | Cliente no modifica saldo/rol/estado y personal no consulta PII fuera del proceso autorizado.                                         | P0 antes de ampliar acceso a clientes                                                 |
| `BKL-PASS-008`   | `vento-pass` / móvil                         | `P1` / `ARQUITECTURA_MÓVIL`   | Reducir consultas directas, cachés y dependencias dispersas                 | `H-CODE-003-007`; `H-CODE-004-005`; `H-CODE-004-010`; `H-CODE-016-006`                                                                                                                               | Clasificar acceso directo permitido, centralizar adaptadores, separar caché de estado servidor y definir comandos de validación móvil.                                                                | `SHELL-AUD-008`; `SHELL-AUD-009`; `SHELL-AUD-010`; `TSVC-CAT-004`; `TSVC-CAT-008`; `QA-REG-001`                                                                                                                                                                                                                                                                          | —                                                                   | Acceso y caché tienen contrato/TTL/error; build móvil y regresiones se ejecutan reproduciblemente.                                    | Antes de ampliar pagos, Wallet o mapas                                                |
| `BKL-WEB-001`    | `Vento-Group` / `vento-viso`                 | `P1` / `FORMULARIO`           | Implementar o retirar newsletter pública                                    | `H-CODE-003-001`; `H-CODE-010-004`                                                                                                                                                                   | Registrar consentimiento y resultado real mediante contrato aprobado o retirar completamente la promesa y controles.                                                                                  | `WEB-FRM-011`                                                                                                                                                                                                                                                                                                                                                            | `TREQ-INTEGRATION-002`                                              | E2E demuestra alta/baja/duplicado/error o la interfaz ya no existe.                                                                   | Paquete web correspondiente                                                           |
| `BKL-WEB-002`    | `Vento-Group` y `vento-numera`               | `P1` / `CALIDAD_DEPENDENCIAS` | Corregir lint web y revisar instalación/vulnerabilidades                    | `H-CODE-016-001`; `H-CODE-016-005`                                                                                                                                                                   | Reemplazar comando inválido de Next 16, validar scripts de dependencias y decidir vulnerabilidades sin actualización automática destructiva.                                                          | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Instalación limpia, lint real y decisiones de scripts/vulnerabilidades reproducibles.                                                 | Antes del siguiente despliegue web o NUMERA                                           |
| `BKL-WEB-003`    | `Vento-Group` / `vento-viso`                 | `P1` / `CMS`                  | Alinear consumo público con contrato de medios                              | `H-CODE-006-010`                                                                                                                                                                                     | Resolver cómo el CMS publica medios privados, evitar URLs permanentes no autorizadas y mantener compatibilidad con bloques existentes.                                                                | `SUPA-AUD-012`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-TRANS-001`; `SUPA-TRANS-007`; `EVID-ARC-003`; `EVID-ARC-007`                                                                                                                                                                                                                                                       | `TREQ-SUPABASE-004`                                                 | Carga, publicación, reemplazo y eliminación usan el mismo contrato y no exponen objetos ajenos.                                       | Antes de migrar media o endurecer el bucket                                           |
| `BKL-AURA-001`   | AURA / `vento-shell` / `vento-viso`          | `P2` / `DECISIÓN`             | Decidir continuidad, reemplazo o retiro de AURA                             | `H-CODE-001-008`; `H-CODE-002-010`; `H-CODE-011-001`; `H-CODE-019-005`                                                                                                                               | No considerar aplicación ni permiso como capacidad implementada; decidir producto, propietario, alcance y relación con CMS/marketing.                                                                 | `AURA-AUD-010`; `INT-MKT-001`; `CAP-SCOPE-014`; `CAP-SCOPE-019`                                                                                                                                                                                                                                                                                                          | `TREQ-SHELL-001`                                                    | Decisión aprobada: construir con roadmap, reemplazar reserva o retirar catálogo/permiso sin navegación engañosa.                      | E1/E2 antes de diseñar campañas AURA                                                  |
| `BKL-EXT-001`    | Operación manual y terceros                  | `P1` / `CUTOVER`              | Conservar coexistencia y reconciliación de métodos AS-IS                    | `H-CODE-019-006`; `H-CODE-019-007`; `H-CODE-019-008`                                                                                                                                                 | Para papel, Excel, WhatsApp, Makos, Rappi, bancos y proveedores, definir fuente temporal, captura paralela, conciliación, criterio de corte y rollback.                                               | `CAP-SCOPE-005`; `CAP-SCOPE-007`; `CAP-SCOPE-008`; `CAP-SCOPE-009`; `CAP-SCOPE-011`; `CAP-SCOPE-012`; `CAP-SCOPE-013`; `CAP-SCOPE-018`; `PROC-CAT-001`; `PROC-CAT-002`; `GAP-CTRL-005`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                   | —                                                                   | Cada método externo tiene propietario, dato maestro, conciliación, fecha/puerta de retiro y contingencia.                             | E2 y paquete de transición de cada dominio                                            |
| `BKL-EXT-002`    | `delivery-portal` / `vento-shell`            | `P0` / `DRIFT`                | Versionar y gobernar portal de entrega remoto                               | `H-CODE-005-009`; `H-CODE-017-019`                                                                                                                                                                   | Conservar token fuerte, recuperar fuente/configuración, registrar despliegue y vincularlo con capacidades de entrega y auditoría.                                                                     | `SUPA-AUD-014`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-TRANS-003`; `SUPA-TRANS-007`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                                                                                                   | `TREQ-SUPABASE-003`                                                 | Fuente reproducible y prueba de token/expiración; no existe función remota sin propietario ni rollback.                               | P0 antes de modificar portal o sesiones de entrega                                    |
| `BKL-EXT-003`    | POS externo / PULSO / NEXO / NUMERA / PASS   | `P0` / `INTEGRACIÓN`          | Formalizar convivencia y transición del POS externo                         | `H-CODE-019-006`; `H-CODE-019-007`; `H-CODE-019-009`                                                                                                                                                 | Auditar API, importar hechos con payload/hash, mapear entidades, usar cuarentena e idempotencia y producir efectos internos exactamente una vez.                                                      | `INT-POS-001`; `INT-POS-002`; `INT-POS-003`; `INT-POS-004`; `INT-POS-005`; `INT-POS-006`; `INT-POS-007`; `INT-POS-008`; `INT-POS-009`; `INT-POS-010`; `INT-POS-011`; `INT-POS-012`; `INT-POS-013`; `INT-POS-014`; `INT-POS-015`; `INT-POS-016`; `INT-POS-017`; `INT-POS-018`; `INT-POS-019`; `INT-POS-020`; `INT-POS-021`; `INT-POS-022`; `INT-POS-023`; `INT-POS-024`   | `TREQ-PULSO-001`; `TREQ-PULSO-003`; `TREQ-INTEGRATION-003`          | Piloto sin efectos y piloto con efectos concilian ventas, inventario, finanzas y lealtad; credenciales se reducen al cutover.         | BLOQUE X y E5, antes de retirar Makos/POS vigente                                     |

---

#### 7. Distribución y puertas

| Puerta         | Elementos                                   | Regla                                                                          |
| -------------- | ------------------------------------------- | ------------------------------------------------------------------------------ |
| Contención P0  | **28 técnicos** más familias funcionales P0 | no ampliar ni activar la superficie afectada antes de diseño, control y prueba |
| Corrección P1  | **31 técnicos**                             | completar antes de adopción, cutover o siguiente release relevante             |
| Evolución P2   | **4 técnicos**                              | ejecutar después de propiedad y proceso TO-BE aprobados                        |
| Saneamiento P3 | **2 técnicos**                              | retirar solo con consumidor, reemplazo, regresión y rollback comprobados       |

Secuencia obligatoria:

```text
CODE-AUD-020 aprobado
→ QA-REG-001
→ CAP-SCOPE-001 a CAP-SCOPE-019
→ GAP-CTRL-001 a GAP-CTRL-008
→ diseño E2 / arquitectura E3 y E4 / integraciones BLOQUE X
→ paquetes E5 por repositorio
→ pruebas y pilotos
→ cierre de filas BKL con evidencia
```

No se permite saltar desde este backlog directamente a cambios de producción. Las tareas destino determinan diseño, arquitectura, migración, autorización y pruebas.

---

#### 8. Hallazgos conservados sin acción nueva

| Hallazgo         | Disposición                                                                                                |
| ---------------- | ---------------------------------------------------------------------------------------------------------- |
| `H-CODE-010-010` | límite de evidencia: no se confirmó una pantalla incompleta adicional; se conserva como resultado negativo |
| `H-CODE-013-015` | límite de evidencia: no se confirmó legado activo adicional en los repositorios indicados                  |
| `H-CODE-015-019` | límite de evidencia: no se confirmó un huérfano adicional; no autoriza omitir futuras comprobaciones       |

Los controles positivos y hallazgos cerrados de `CODE-AUD-001` a `019` permanecen en su tarea de origen. No se duplican como deuda.

---

#### 9. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS

**Justificación:** esta tarea organiza brechas y vincula requisitos ya identificados; no introduce ni modifica comportamiento ejecutable. `QA-REG-001` deberá comprobar que todos los requisitos anteriores estén registrados con filas completas y que cada paquete posterior declare cuáles implementa.

Se conservan expresamente los requisitos asociados en las filas del backlog, incluidos los dominios `AUTH`, `SHELL`, `SUPABASE`, `ANIMA`, `NEXO`, `FOGO`, `ORIGO`, `PULSO`, `PASS` e `INTEGRATION`.

---

#### 10. Decisiones propuestas

1. Se adopta `BKL-REPO-001` como backlog derivado y trazable del corte de auditoría E1.
2. El backlog se compone de 18 filas funcionales y 65 filas técnicas.
3. Las 188 subcapacidades no verificadas en uso quedan enumeradas exactamente una vez en el backlog funcional.
4. Las 29 subcapacidades verificadas en uso permanecen como baseline, no como trabajo terminado.
5. Las brechas técnicas se asignan por repositorio o superficie, aunque la propiedad funcional pueda pertenecer a otra aplicación.
6. `vento-shell` es propietario técnico de migraciones y contratos compartidos, no propietario empresarial universal.
7. Los identificadores `BKL-*` no son tareas del roadmap y no requieren materialización como encabezados.
8. No se crea ninguna tarea nueva porque todos los elementos tienen destino canónico existente.
9. Las operaciones manuales y externas se conservan hasta cumplir su puerta de cutover y rollback.
10. `QA-REG-001` es la continuidad inmediata y obligatoria.

---

#### 11. Límites de certeza

- El backlog refleja el corte de evidencia del 24 de julio de 2026; no afirma el estado de commits posteriores.
- Una fila técnica puede requerir subdivisión durante diseño o implementación, pero no podrá perder sus capacidades, hallazgos, requisitos ni destino.
- Una fila funcional no decide todavía BUILD, BUY, integración, manual, diferido o retiro; esa decisión pertenece a `CAP-SCOPE-*`.
- Los conteos no equivalen a porcentaje de avance ni estimación de esfuerzo.
- Ninguna evidencia manual o externa fue retirada ni reemplazada durante esta tarea.
- No se ejecutaron migraciones, pruebas destructivas, cambios de permisos, builds productivos ni despliegues.

---

#### 12. Criterios de aceptación

`CODE-AUD-020` podrá aprobarse cuando:

- exista un registro único `BKL-REPO-001`;
- las 217 subcapacidades estén contabilizadas como baseline o brecha;
- las 188 subcapacidades abiertas aparezcan exactamente una vez en el backlog funcional;
- las 29 verificadas en uso permanezcan visibles como baseline protegida;
- cada fila funcional tenga repositorio o medio, prioridad, decisión, destino y puerta;
- cada fila técnica tenga repositorio, hallazgos, acción, destino y evidencia de cierre;
- todos los hallazgos con destino explícito a `CODE-AUD-020` estén cubiertos o conservados como límite de evidencia;
- ningún destino cite una tarea inexistente;
- los `BKL-*` se declaren registros y no tareas nuevas;
- se conserve VITAL fuera del backlog de Vento OS;
- AURA y TALENTO no se presenten como productos operativos;
- los medios manuales y externos conserven coexistencia y cutover;
- los P0 tengan puerta previa a ampliación o activación;
- no se generen requisitos de prueba duplicados;
- `QA-REG-001` quede como continuidad inmediata;
- no se modifique código, CI, despliegues ni Supabase.

---

#### 13. Resultado y continuidad

Al aprobarse quedará cerrada la auditoría documental de implementación actual con la cadena:

```text
inventario de repositorios y superficies
→ contratos y datos
→ procesos parciales, legacy y huérfanos
→ seguridad, concurrencia e idempotencia
→ mapa capacidad ↔ implementación
→ backlog por repositorio
```

La continuidad obligatoria será:

```text
QA-REG-001
— Consolidar retrospectivamente requisitos de prueba anteriores a QA-GOV-001
```

