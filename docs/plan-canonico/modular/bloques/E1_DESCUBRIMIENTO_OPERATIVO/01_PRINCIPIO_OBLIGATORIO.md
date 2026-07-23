### Principio obligatorio

El roadmap no se derivará únicamente del código existente.

```text
OPERACIÓN REAL
+
PROCESOS MANUALES
+
DOCUMENTOS Y HERRAMIENTAS EXTERNAS
+
CÓDIGO ACTUAL
+
DATOS ACTUALES
+
PANTALLAS ACTUALES
+
INFRAESTRUCTURA PARCIAL
+
CAPACIDADES TODAVÍA AUSENTES
        ↓
MAPA DE CAPACIDADES DE VENTO GROUP
        ↓
MATRIZ DE COBERTURA FUNCIONAL Y TÉCNICA
        ↓
ROADMAP OBJETIVO
```

### Principio de no reproducción automática del estado actual

La operación real constituye evidencia, no una orden de conservar sus fallas.

BLOQUE E1 deberá distinguir expresamente entre:

- necesidad empresarial legítima;
- restricción física o legal real;
- práctica temporal;
- workaround;
- defecto operativo;
- ausencia de control;
- deuda técnica;
- comportamiento que debe retirarse.

Una práctica vigente no se convertirá en requisito TO-BE únicamente porque:

- sea conocida por los trabajadores;
- dependa de Excel, WhatsApp, papel o comunicación verbal;
- haya funcionado históricamente;
- exista parcialmente en código;
- esté respaldada por una tabla o pantalla legacy.

BLOQUE E2 deberá conservar la necesidad empresarial y diseñar el proceso
objetivo, eliminando o controlando las fallas detectadas.

### Principio de avance por evidencia suficiente

El descubrimiento no se utilizará para posponer indefinidamente la
implementación futura.

Cada tarea de E1 deberá:

1. consolidar primero la evidencia ya disponible;
2. identificar únicamente los vacíos que cambian decisiones materiales;
3. separar vacíos bloqueantes de vacíos validables posteriormente;
4. vincular todo vacío no bloqueante con una tarea exacta;
5. cerrar cuando exista base suficiente para la tarea siguiente, aunque
   permanezcan variaciones menores pendientes de validación.

No será válido:

- repetir entrevistas sin una decisión concreta que proteger;
- detener una tarea por detalles que no modifican proceso, datos,
  autorización, integración o riesgo;
- declarar una práctica actual como diseño objetivo sin análisis TO-BE;
- iniciar código, migraciones o cambios físicos antes de superar las puertas
  documentales y técnicas definidas por `90_ORDEN_DE_IMPLEMENTACION.md`.
