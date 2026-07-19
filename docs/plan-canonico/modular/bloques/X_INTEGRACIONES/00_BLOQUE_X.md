## BLOQUE X

**Integraciones empresariales internas y externas**

Relación con los demás bloques:

BLOQUE E2
→ identifica la necesidad empresarial y los eventos requeridos

BLOQUE X
→ define emisores internos y externos, consumidores, contratos,
  credenciales técnicas, idempotencia, reintentos, compensaciones
  y traspasos entre sistemas y aplicaciones

BLOQUE H
→ implementa los contratos y tipos compartidos en vento-shell

Los tres bloques son complementarios y no duplican responsabilidades.

REGLA GENERAL

Una integración no deberá obligar al trabajador a registrar nuevamente
la información que ya produjo una aplicación propietaria.

### [ ] INT-APP-001 Crear catálogo de eventos empresariales
### [ ] INT-APP-002 Definir aplicación emisora de cada evento
### [ ] INT-APP-003 Definir aplicaciones consumidoras
### [ ] INT-APP-004 Definir idempotencia
### [ ] INT-APP-005 Definir reintentos
### [ ] INT-APP-006 Definir compensaciones
### [ ] INT-APP-007 Definir auditoría transversal
### [ ] INT-APP-008 Definir estados pendientes de sincronización
### [ ] INT-APP-009 Definir manejo de errores parciales
### [ ] INT-APP-010 Evitar escrituras cruzadas sin contrato

INTEGRACIONES CON SISTEMAS EXTERNOS

### [ ] INT-EXT-001 Inventariar sistemas externos, proveedores, propietarios y finalidad
### [ ] INT-EXT-002 Definir principal técnico independiente por integración
### [ ] INT-EXT-003 Diferenciar credenciales emitidas por proveedores y credenciales emitidas por Vento
### [ ] INT-EXT-004 Definir autenticación mediante API key, OAuth, HMAC, certificado u otro mecanismo
### [ ] INT-EXT-005 Definir alcance mínimo de cada credencial
### [ ] INT-EXT-006 Separar credenciales de desarrollo, staging y producción
### [ ] INT-EXT-007 Definir almacenamiento seguro de secretos
### [ ] INT-EXT-008 Definir rotación, expiración y revocación
### [ ] INT-EXT-009 Definir contratos de entrada y salida versionados
### [ ] INT-EXT-010 Definir estrategia webhook, polling o híbrida
### [ ] INT-EXT-011 Definir validación de firma, origen, timestamp y replay
### [ ] INT-EXT-012 Definir idempotencia y deduplicación por sistema externo
### [ ] INT-EXT-013 Definir mapeo de identificadores externos y canónicos
### [ ] INT-EXT-014 Definir conservación controlada del payload original
### [ ] INT-EXT-015 Definir rate limits, reintentos, backoff y circuit breaker
### [ ] INT-EXT-016 Definir cuarentena o dead-letter
### [ ] INT-EXT-017 Definir auditoría, métricas, alertas y conciliación
### [ ] INT-EXT-018 Definir contingencia ante indisponibilidad del proveedor
### [ ] INT-EXT-019 Definir retiro de integración y revocación de credenciales
### [ ] INT-EXT-020 Prohibir credenciales compartidas entre integraciones

Separación obligatoria:

```text
PermissionKey
→ capacidad empresarial

IntegrationPrincipal
→ identidad técnica de la integración

ExternalCredentialId
→ referencia interna a una credencial

API key, token o secret
→ valor secreto almacenado fuera de tablas expuestas
```

Reglas:

- ninguna integración externa recibirá `service_role`;
- ningún secreto se almacenará en frontend o variable pública;
- los logs registrarán identificadores de credencial, no sus valores;
- una credencial de lectura no se reutilizará para escritura;
- cada entorno tendrá credenciales independientes;
- toda credencial deberá poder revocarse sin modificar contratos empresariales.

VISO → ANIMA → CONTEXTO

### [ ] INT-WORK-001 VISO publica turno
### [ ] INT-WORK-002 ANIMA presenta turno
### [ ] INT-WORK-003 ANIMA registra asistencia
### [ ] INT-WORK-004 Supabase confirma contexto efectivo
### [ ] INT-WORK-005 SHELL y aplicaciones consumen contexto

ORIGO → NEXO → NUMERA

### [ ] INT-PROC-001 ORIGO aprueba orden de compra
### [ ] INT-PROC-002 ORIGO registra recepción
### [ ] INT-PROC-003 NEXO crea entrada de inventario
### [ ] INT-PROC-004 NUMERA recibe evento económico
### [ ] INT-PROC-005 Evitar recepción duplicada

FOGO ↔ NEXO

### [ ] INT-PROD-001 FOGO solicita o reserva insumos
### [ ] INT-PROD-002 NEXO registra consumo
### [ ] INT-PROD-003 FOGO finaliza lote
### [ ] INT-PROD-004 NEXO registra producto terminado
### [ ] INT-PROD-005 Resolver producción insuficiente para remisiones

POS EXTERNO → CONTRATO CANÓNICO DE VENTAS → NEXO / NUMERA / PASS

Principio de transición

Mientras PULSO no sea la fuente operativa y fiscal definitiva de ventas,
el POS vigente podrá actuar como fuente temporal de ventas confirmadas.

El POS externo será fuente temporal de:

- hecho de venta;
- líneas vendidas;
- documento fiscal emitido externamente;
- descuentos;
- impuestos;
- propinas;
- medios de pago;
- anulaciones y devoluciones.

El POS externo no será propietario de:

- inventario;
- recetas;
- costos;
- contabilidad interna;
- catálogo canónico de productos;
- fidelización;
- autorización laboral.

### [ ] INT-POS-001 Auditar documentación, endpoints, webhooks y límites del POS vigente
### [ ] INT-POS-002 Confirmar información disponible mediante API
### [ ] INT-POS-003 Definir al POS vigente como fuente temporal del hecho de venta
### [ ] INT-POS-004 Solicitar credencial independiente, revocable e inicialmente de solo lectura
### [ ] INT-POS-005 Definir contrato canónico de venta y línea de venta
### [ ] INT-POS-006 Importar encabezados, líneas, estados y timestamps
### [ ] INT-POS-007 Importar descuentos, impuestos, propinas y medios de pago
### [ ] INT-POS-008 Importar anulaciones, devoluciones y reembolsos
### [ ] INT-POS-009 Conservar payload original, versión, hash y fecha de recepción
### [ ] INT-POS-010 Mapear empresa, sede, terminal y caja externa
### [ ] INT-POS-011 Mapear producto externo, producto Vento, presentación y receta
### [ ] INT-POS-012 Enviar líneas sin mapeo a cuarentena sin descontar inventario
### [ ] INT-POS-013 Definir idempotencia por sistema, venta y línea externa
### [ ] INT-POS-014 Definir webhook cuando exista y polling de conciliación como respaldo
### [ ] INT-POS-015 Emitir evento canónico de venta validada
### [ ] INT-POS-016 Producir salida de inventario en NEXO exactamente una vez
### [ ] INT-POS-017 Producir evento económico para NUMERA exactamente una vez
### [ ] INT-POS-018 Producir evento de fidelización para PASS cuando corresponda
### [ ] INT-POS-019 Compensar anulaciones y devoluciones sin borrar historia
### [ ] INT-POS-020 Ejecutar conciliación diaria entre POS y efectos internos
### [ ] INT-POS-021 Ejecutar piloto sin efectos sobre inventario ni finanzas
### [ ] INT-POS-022 Ejecutar piloto controlado con efectos habilitados
### [ ] INT-POS-023 Definir transición futura desde POS externo hacia PULSO
### [ ] INT-POS-024 Revocar o reducir credenciales cuando PULSO asuma la fuente

Flujo obligatorio:

```text
POS EXTERNO
        ↓
ADAPTADOR DEL PROVEEDOR
        ↓
STAGING Y PAYLOAD ORIGINAL
        ↓
VALIDACIÓN E IDEMPOTENCIA
        ↓
MAPEO DE SEDES Y PRODUCTOS
        ↓
CONTRATO CANÓNICO DE VENTA
        ├── NEXO
        ├── NUMERA
        └── PASS, cuando corresponda
```

Reglas:

- el proveedor no escribirá directamente en tablas internas;
- el proveedor no recibirá acceso a Supabase;
- una línea sin mapeo no descontará inventario;
- una venta duplicada no producirá efectos adicionales;
- una devolución generará una compensación auditable;
- el documento fiscal seguirá siendo responsabilidad del POS vigente;
- la integración temporal no se considerará implementación completa de PULSO.

PULSO → CONTRATO CANÓNICO DE VENTAS → NEXO / NUMERA / PASS

### [ ] INT-SALES-001 PULSO registra venta
### [ ] INT-SALES-002 PULSO emite el mismo contrato canónico utilizado durante la transición
### [ ] INT-SALES-003 NEXO registra salida de inventario
### [ ] INT-SALES-004 NUMERA recibe evento de venta
### [ ] INT-SALES-005 PASS acumula puntos
### [ ] INT-SALES-006 PASS procesa redención
### [ ] INT-SALES-007 Evitar efectos duplicados por reintento
### [ ] INT-SALES-008 Conciliar convivencia entre POS externo y PULSO
### [ ] INT-SALES-009 Definir corte por sede, terminal y fecha efectiva
### [ ] INT-SALES-010 Impedir que ambas fuentes emitan la misma venta
### [ ] INT-SALES-011 Retirar adaptador externo sin modificar consumidores internos

AURA ↔ PASS / PULSO

### [ ] INT-MKT-001 Definir campañas solo después de aprobar AURA
### [ ] INT-MKT-002 Definir beneficios publicados en PASS
### [ ] INT-MKT-003 Definir validación comercial desde PULSO

