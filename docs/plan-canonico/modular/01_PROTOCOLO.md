## Protocolo obligatorio de continuidad

1. Leer primero el `Estado canónico` y la `Continuidad inmediata`.

   Ambos bloques deberán coincidir en:

   - última tarea aprobada;
   - tarea actual;
   - siguiente tarea reservada;
   - bloque actual;
   - estado de implementación.

   Si existe una contradicción, deberá corregirse antes de desarrollar
   una nueva tarea.

2. Continuar exclusivamente con la tarea indicada como `Tarea actual`.

   La `Siguiente tarea` permanece reservada y no podrá iniciarse hasta que:

   - la tarea actual haya sido aprobada explícitamente;
   - el usuario solicite expresamente continuar;
   - se compruebe que no existe una etapa contractual intermedia.

3. No implementar código, migraciones ni cambios en Supabase,
   salvo que la tarea lo ordene expresamente.

4. Cada tarea `AUTH-*` deberá entregarse como un archivo Markdown
   descargable e independiente que contenga exclusivamente el bloque
   completo de la tarea desarrollada.

   El archivo deberá estar listo para reemplazar el marcador o bloque
   correspondiente dentro del documento canónico.

   Convención obligatoria de nombre:

   `AUTH-<BLOQUE>-<NÚMERO>_PROPUESTA_PARA_REEMPLAZAR.md`

   Ejemplo:

   `AUTH-CAT-018_PROPUESTA_PARA_REEMPLAZAR.md`

   En el mensaje del chat deberá incluirse únicamente:

   - el enlace de descarga del archivo `.md`;
   - el marcador exacto que debe reemplazarse;
   - el marcador de la tarea siguiente que debe conservarse;
   - un resumen breve de las decisiones propuestas;
   - el estado de la tarea.

   No deberá pegarse en el chat el contenido completo de la tarea.

   No entregar la tarea como:

   - bloque de código Markdown completo dentro del chat;
   - bloque de redacción editable;
   - documento editable integrado en la interfaz;
   - texto normal extenso;
   - resumen sin archivo adjunto;
   - documento canónico completo;
   - archivo que incluya tareas diferentes de la solicitada;
   - archivo que sustituya silenciosamente todo el documento canónico.

   El archivo deberá ser Markdown plano codificado en UTF-8 y utilizar
   la extensión `.md`.

5. Toda tarea nueva inicia con:

   **PROPUESTA PARA APROBACIÓN**

   Mientras permanezca en propuesta deberá utilizar dentro del archivo:

   `### 🟡 AUTH-...`

   El archivo deberá contener toda la definición sustantiva necesaria
   para evaluar y aprobar la tarea, sin depender de explicaciones
   complementarias del chat.

6. No marcar una tarea como aprobada hasta que el usuario diga
   explícitamente:

   **APROBADO**

   Antes de esa instrucción:

   - no utilizar el marcador ✅;
   - no cambiar el estado interno de la tarea a `APROBADA`;
   - no presentar decisiones propuestas como canónicas;
   - no iniciar implementación;
   - no avanzar automáticamente a la tarea siguiente.

7. Después de la aprobación:

   - la tarea quedará conceptualmente aprobada para la siguiente
     consolidación documental;
   - no será obligatorio generar nuevamente el archivo de la tarea;
   - no será obligatorio actualizar inmediatamente el encabezado,
     la revisión documental, la continuidad ni el progreso general;
   - no deberá entregarse el documento canónico completo;
   - las actualizaciones administrativas podrán consolidarse
     posteriormente en lote;
   - cuando una aprobación requiera corregir el contenido sustantivo
     del archivo, deberá entregarse un nuevo archivo llamado:

     `AUTH-<BLOQUE>-<NÚMERO>_APROBADA_PARA_REEMPLAZAR.md`

   La versión aprobada deberá conservar íntegramente las decisiones
   aceptadas y no incluir tareas adicionales.

8. No avanzar a la tarea siguiente hasta que el usuario lo solicite
   expresamente.

   Cuando el usuario solicite la siguiente tarea, deberá entregarse
   nuevamente como un archivo `.md` independiente siguiendo el punto 4.

   La ausencia de una consolidación inmediata no invalida las
   aprobaciones expresas ya otorgadas.

9. Cuando un hallazgo de auditoría contradiga una decisión posterior,
   prevalece la decisión canónica aprobada más reciente.

   La tarea documental inmediata se determina mediante:

   1. `Estado canónico`;
   2. `Continuidad inmediata`.

   `manifest.json` define exclusivamente el orden físico de compilación
   de los fragmentos y no el orden de ejecución del roadmap.

   El orden de ejecución posterior se determina mediante:

   `90_ORDEN_DE_IMPLEMENTACION.md`
   +
   dependencias y puertas aprobadas de cada bloque.

   Las referencias de continuidad incluidas dentro de tareas aprobadas
   representan el estado existente cuando se aprobó esa tarea y no deberán
   interpretarse automáticamente como continuidad vigente.

   Si una tarea posterior inserta una etapa obligatoria intermedia, deberán
   actualizarse el encabezado, la continuidad inmediata y la transición de
   la tarea precedente durante la siguiente consolidación documental.

10. El BLOQUE A contiene evidencia histórica.
    ADR-AUTH-001 y las tareas AUTH aprobadas contienen decisiones normativas.

11. Toda futura migración de Supabase deberá crearse y documentarse
    en vento-shell.

12. No reducir silenciosamente el alcance de una tarea.

13. El roadmap de autorización define quién puede ejecutar una capacidad,
    bajo qué modalidad, alcance, contexto y recurso.

14. El roadmap funcional y de experiencia define qué proceso resuelve
    cada aplicación, qué pantallas utiliza cada actor y cómo se conecta
    el proceso entre aplicaciones.

15. Las decisiones funcionales, de navegación o experiencia no podrán
    contradecir el catálogo canónico, las matrices, el contexto efectivo,
    la precedencia ni las denegaciones aprobadas.

16. Ninguna pantalla, ruta o componente se considerará terminado únicamente
    porque exista técnicamente. Deberá estar vinculado con:
    - un proceso empresarial;
    - un actor objetivo;
    - una acción principal;
    - permisos funcionales;
    - protección del lado servidor;
    - criterios de usabilidad;
    - trazabilidad cuando corresponda.

17. Las aplicaciones se reorganizarán por procesos y responsabilidades
    empresariales, no por carpetas, rutas técnicas o nombres de componentes.

18. Toda función transversal deberá tener una aplicación propietaria.
    Las demás aplicaciones podrán consumirla, pero no duplicar su lógica,
    su autorización ni su fuente de verdad.

19. Los cambios funcionales o de experiencia que no requieran modificar
    Supabase deberán documentarse en el roadmap y en el repositorio
    propietario de la aplicación.

    Cuando el cambio requiera una migración de Supabase,
    aplicará obligatoriamente el punto 11.

20. Toda nueva necesidad funcional o técnica deberá analizarse primero
    contra:

    - el documento canónico vigente;
    - el catálogo de autorización vigente;
    - el código actual del repositorio propietario;
    - las decisiones aprobadas que afecten el proceso.

21. Antes de entregar una implementación deberá determinarse expresamente
    si el cambio afecta:

    - permisos;
    - modalidad;
    - alcance;
    - turno o check-in;
    - área activa;
    - dispositivo compartido;
    - simulación;
    - contrato de recurso;
    - matrices;
    - Supabase;
    - RLS;
    - RPC;
    - auditoría;
    - experiencia o navegación.

22. Todo cambio contractual deberá pasar por:

    - propuesta documental;
    - análisis de impacto;
    - aprobación explícita;
    - nueva versión del catálogo cuando corresponda;
    - implementación;
    - pruebas;
    - actualización documental.

23. Un cambio que no afecte autorización deberá declararlo expresamente
    antes de implementarse.

24. Todo paquete de implementación deberá incluir, cuando corresponda:

    - repositorio propietario;
    - archivos exactos que se crean o modifican;
    - migración versionada en `vento-shell`;
    - orden de aplicación;
    - comandos;
    - pruebas;
    - resultado esperado;
    - evidencia de verificación;
    - mecanismo de rollback;
    - actualización documental requerida.

25. Ningún cambio entregado en otra conversación deberá aplicarse
    automáticamente sin verificarlo contra el documento canónico vigente
    y el estado actual de los repositorios.

26. Supabase deberá tratarse como una plataforma canónica integral y no
    únicamente como un conjunto de tablas en `public`.

    Su gobierno incluirá, como mínimo:

    - esquemas;
    - Auth;
    - tablas y relaciones;
    - vistas y vistas materializadas;
    - funciones, RPC y triggers;
    - RLS y grants;
    - Storage;
    - Realtime;
    - Edge Functions;
    - webhooks;
    - cron, colas y automatizaciones;
    - extensiones;
    - secretos y configuración;
    - migraciones;
    - tipos generados;
    - auditoría, rendimiento, retención y recuperación.

27. La organización física de Supabase se definirá en el BLOQUE E3 y se
    implementará en el BLOQUE R.

    El BLOQUE E3 auditará el estado real, definirá la arquitectura objetivo
    y aprobará el plan de transición.

    El BLOQUE R aplicará las migraciones, protecciones, pruebas y retiro
    controlado de estructuras legacy.

28. Ninguna tabla, función, política, trigger, bucket, canal Realtime,
    Edge Function, webhook, tarea programada o secreto podrá reorganizarse,
    renombrarse, trasladarse o retirarse sin:

    - inventario previo;
    - propietario funcional;
    - análisis de consumidores;
    - clasificación de exposición;
    - impacto sobre Auth, RLS, RPC y aplicaciones;
    - plan de compatibilidad;
    - migración versionada en `vento-shell`;
    - validación de datos;
    - pruebas;
    - rollback;
    - actualización documental.

29. Los esquemas administrados por Supabase, incluidos `auth`, `storage`,
    `realtime`, `extensions` y `supabase_migrations`, deberán distinguirse
    de los esquemas empresariales de Vento.

    No deberán moverse, renombrarse ni utilizarse como contenedores de
    lógica empresarial salvo mediante mecanismos oficialmente soportados.

30. Los esquemas empresariales de Vento deberán organizarse por dominios
    estables y fuentes de verdad, no por:

    - aplicación;
    - repositorio;
    - ruta;
    - pantalla;
    - componente;
    - necesidad temporal.

    Una aplicación podrá consumir varios dominios y un dominio podrá ser
    consumido por varias aplicaciones sin duplicar sus datos.

31. `public` no deberá asumirse como ubicación predeterminada de todo objeto.

    Cada objeto deberá declarar expresamente:

    - dominio;
    - esquema;
    - propietario funcional;
    - propietario técnico;
    - exposición por Data API;
    - roles con acceso;
    - política RLS;
    - consumidores;
    - clasificación de sensibilidad;
    - estrategia de auditoría;
    - ciclo de vida.

32. El estado desplegado de Supabase deberá ser reproducible desde
    `vento-shell`.

    Los cambios directos realizados desde Dashboard, Table Editor,
    SQL Editor u otra herramienta deberán limitarse a diagnóstico o
    emergencia controlada y convertirse después en una migración
    versionada, verificable y documentada.

33. La autenticación técnica, la identidad empresarial y la autorización
    deberán permanecer separadas.

    `auth.users`
    → identidad autenticada

    trabajador, cliente o dispositivo
    → identidad empresarial vinculada

    catálogo, matrices, contexto y recurso
    → autorización efectiva

34. Toda arquitectura de Supabase deberá conservar compatibilidad temporal
    con las aplicaciones existentes.

    No se moverán objetos entre esquemas ni se retirarán nombres legacy
    mediante un cambio único si existen consumidores activos.

35. La normalización de datos deberá definirse por dominio, entidad y campo.

    No existirá una transformación universal aplicada indiscriminadamente
    a todo valor textual.

    Toda regla deberá distinguir, como mínimo:

    - nombre comercial;
    - nombre de producto;
    - nombre de categoría;
    - nombre de presentación;
    - nombre de marca;
    - razón social o nombre legal de proveedor;
    - descripción libre;
    - identificador técnico;
    - código;
    - dato de búsqueda.

    La normalización automática deberá ser:

    - determinista;
    - idempotente;
    - versionada;
    - auditable;
    - reversible cuando afecte datos existentes;
    - compatible con excepciones aprobadas.

    Las correcciones ortográficas ambiguas no se aplicarán silenciosamente.
    Deberán enviarse a revisión o aprobación humana.

36. Las claves de permisos, credenciales de integración y secretos técnicos
    deberán mantenerse como conceptos separados.

    `PermissionKey`
    → identifica una capacidad empresarial

    API key, client secret o token
    → autentica un sistema técnico frente a otro sistema

    Supabase publishable key
    → identifica el proyecto ante un cliente público con acceso limitado

    Supabase secret o service role
    → credencial privilegiada exclusivamente de backend

    Ninguna credencial externa deberá:

    - almacenarse dentro del catálogo de permisos;
    - enviarse al frontend;
    - utilizarse como permiso empresarial;
    - incluirse en una variable pública;
    - registrarse completa en logs o auditorías;
    - compartirse entre producción, staging y desarrollo;
    - entregarse a un proveedor para escribir directamente en Supabase.

37. Toda integración externa deberá operar mediante un adaptador y un
    contrato empresarial canónico.

    Un sistema externo no deberá:

    - escribir directamente en tablas internas de una aplicación;
    - conocer la estructura privada de los dominios;
    - recibir una credencial `service_role`;
    - producir efectos duplicados por reintentos;
    - convertirse automáticamente en propietario permanente del proceso.

    El adaptador deberá validar, transformar, mapear, deduplicar, auditar
    y emitir eventos canónicos antes de afectar otros dominios.

38. Ninguna tarea podrá cerrarse dejando un pendiente, brecha, riesgo,
    decisión diferida, supuesto por verificar o elemento fuera de alcance
    sin destino documental explícito.

    Todo elemento pendiente deberá cumplir una de estas dos condiciones:

    - estar vinculado con una tarea existente mediante su identificador
      exacto y declarar en qué momento deberá resolverse;
    - generar inmediatamente una nueva tarea con identificador, bloque,
      propósito, dependencias y puerta de ejecución definidos.

    No se considerarán destinos válidos expresiones genéricas como:

    - después;
    - posteriormente;
    - en una fase futura;
    - en implementación;
    - en el bloque funcional;
    - en Supabase;
    - en el roadmap de la aplicación;
    - corresponde a E1, E2, E3, E4, E5 o R;

    salvo que también se indique la tarea exacta responsable.

    `GAP-CTRL-001` deberá consolidar retrospectivamente todos los pendientes
    y todas las brechas detectados hasta el momento de su ejecución,
    incluidos los producidos por las tareas anteriores de BLOQUE E1.

    `GAP-CTRL-001` se ejecutará dentro de BLOQUE E1 y antes de
    `GAP-CTRL-002`.

    `GAP-CTRL-006` deberá vincular cada brecha consolidada con una tarea
    documental concreta y con su paquete de implementación cuando
    corresponda.

    Una tarea no podrá aprobarse cuando contenga un pendiente sin destino
    o cuando cite una tarea que no exista formalmente en el roadmap.

---

## Regla canónica de granularidad documental

La unidad física del plan será la **sección o bloque lógico**, no cada tarea individual.

Reglas obligatorias:

- un archivo puede contener múltiples tareas con encabezado `###`;
- una tarea no deberá tener archivo propio cuando pertenece a una sección lógica común;
- los archivos se nombrarán por la responsabilidad documental que agrupan;
- el estado de cada tarea seguirá derivándose exclusivamente de su marcador;
- el compilador y el registro global deberán detectar todas las tareas dentro de cada archivo;
- una sección monolítica podrá dividirse cuando contenga responsabilidades documentales distintas;
- no se dividirá una tarea internamente entre varios archivos;
- toda reorganización deberá preservar orden, contenido e inventario de identificadores.
