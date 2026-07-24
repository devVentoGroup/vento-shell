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


**PROPUESTA PARA APROBACIÓN**
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


**PROPUESTA PARA APROBACIÓN**
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

**PROPUESTA PARA APROBACIÓN**
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


**PROPUESTA PARA APROBACIÓN**
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

### [ ] CODE-AUD-012 — Detectar procesos implementados solo parcialmente
### [ ] CODE-AUD-013 — Detectar código legacy todavía activo
### [ ] CODE-AUD-014 — Detectar código duplicado y fuentes de verdad competidoras
### [ ] CODE-AUD-015 — Detectar rutas, componentes, funciones y tablas sin consumidores
### [ ] CODE-AUD-016 — Ejecutar build, lint, tipos y pruebas disponibles por repositorio
### [ ] CODE-AUD-017 — Auditar autorización, validación de servidor y exposición de datos
### [ ] CODE-AUD-018 — Auditar operación offline, reintentos, concurrencia e idempotencia
### [ ] CODE-AUD-019 — Vincular cada capacidad con su implementación actual verificable
### [ ] CODE-AUD-020 — Crear backlog técnico y funcional trazable por repositorio
