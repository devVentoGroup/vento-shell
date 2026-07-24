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


### [ ] QA-GOV-001 — Definir gobierno, registro y ciclo de vida de requisitos de prueba
### [ ] CODE-AUD-008 — Detectar `TODO`, `FIXME`, stubs y funciones no terminadas
### [ ] CODE-AUD-009 — Detectar valores hardcodeados y decisiones técnicas temporales
### [ ] CODE-AUD-010 — Detectar pantallas con interfaz pero sin lógica completa
### [ ] CODE-AUD-011 — Detectar infraestructura sin proceso funcional utilizable
### [ ] CODE-AUD-012 — Detectar procesos implementados solo parcialmente
### [ ] CODE-AUD-013 — Detectar código legacy todavía activo
### [ ] CODE-AUD-014 — Detectar código duplicado y fuentes de verdad competidoras
### [ ] CODE-AUD-015 — Detectar rutas, componentes, funciones y tablas sin consumidores
### [ ] CODE-AUD-016 — Ejecutar build, lint, tipos y pruebas disponibles por repositorio
### [ ] CODE-AUD-017 — Auditar autorización, validación de servidor y exposición de datos
### [ ] CODE-AUD-018 — Auditar operación offline, reintentos, concurrencia e idempotencia
### [ ] CODE-AUD-019 — Vincular cada capacidad con su implementación actual verificable
### [ ] CODE-AUD-020 — Crear backlog técnico y funcional trazable por repositorio
