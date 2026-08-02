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

4. Formato obligatorio de entrega, revisión y aprobación documental

   Esta regla aplica a toda tarea documental, independientemente de su prefijo
   (`AUTH-*`, `OPS-*`, `CAP-*`, `CODE-*`, `GAP-*`, `PROC-*`, `UX-*` u otro
   identificador canónico).

   #### 4.1. Artefacto de tarea entregado por defecto

   Cada tarea deberá entregarse como un archivo Markdown descargable,
   independiente y codificado en UTF-8, que contenga exclusivamente el bloque
   completo de la tarea solicitada.

   El archivo deberá estar listo para reemplazar el marcador o bloque
   correspondiente dentro del archivo modular propietario.

   Convención obligatoria de nombre:

   `<ID-DE-TAREA>_APROBADA_PARA_REEMPLAZAR.md`

   Para una instancia de carril `<task_id>::<package_id>`, el nombre físico
   reemplazará `::` por `__`:

   `<task_id>__<package_id>_APROBADA_PARA_REEMPLAZAR.md`

   Ejemplo:

   `PROC-SCREEN-018_APROBADA_PARA_REEMPLAZAR.md`

   El contenido se entregará preformateado con:

   `### ✅ <ID-DE-TAREA> — <TÍTULO>`

   y:

   `**Estado:** APROBADA`

   Este estado preformateado permite insertar el archivo y ejecutar los
   validadores documentales que reconocen tareas materializadas mediante el
   marcador `### ✅`.

   Sin embargo, el archivo no se considerará canónicamente aprobado hasta que
   el usuario lo revise y responda explícitamente:

   **APROBADO**

   Por tanto:

   - el archivo llega listo para reemplazo y validación;
   - la decisión no se vuelve canónica antes de la aprobación expresa;
   - no será necesario generar una segunda versión únicamente para cambiar
     `PROPUESTA` por `APROBADA`;
   - si el usuario solicita correcciones sustantivas, se regenerará el mismo
     archivo `*_APROBADA_PARA_REEMPLAZAR.md` con las correcciones;
   - una aprobación expresa no autoriza avanzar automáticamente a la tarea
     siguiente.

   #### 4.2. Alcance exacto del archivo de tarea

   El archivo de tarea deberá incluir únicamente:

   - la tarea solicitada completa;
   - sus artefactos, matrices, reglas, validaciones y carryovers;
   - sus requisitos de prueba derivados o la declaración expresa de que no
     genera requisitos;
   - la continuidad inmediata hacia la siguiente tarea reservada.

   No deberá incluir:

   - otras tareas anteriores o posteriores;
   - la página o sección modular completa;
   - el plan canónico completo;
   - el archivo compilado;
   - el encabezado global;
   - el registro global de tareas;
   - un archivo adicional de resumen;
   - filas `TREQ-*` sueltas;
   - un archivo paralelo `TREQ_NUEVOS_*`;
   - cambios silenciosos en decisiones ya aprobadas.

   La unidad transitoria entregada para revisión es la tarea. La unidad física
   canónica del repositorio continúa siendo el bloque o sección lógica
   propietaria.

   #### 4.3. Contenido obligatorio de la respuesta en el chat

   La respuesta del chat deberá incluir únicamente:

   1. enlace de descarga del archivo de tarea `.md`;
   2. marcador exacto que debe reemplazarse;
   3. enlace de descarga del registro `04A` completo cuando corresponda;
   4. indicación de que `04A` debe reemplazarse completamente;
   5. resumen final breve de las decisiones y cifras de la tarea;
   6. requisitos `TREQ-*` creados, modificados, diferidos u obsoletos;
   7. validaciones realmente ejecutadas y su resultado;
   8. validaciones pendientes de ejecutar localmente, cuando no hayan podido
      ejecutarse;
   9. siguiente tarea reservada.

   El resumen final se presentará en el chat y no dentro de un archivo
   adicional.

   No deberá pegarse en el chat el contenido completo de la tarea ni el
   contenido completo de `04A`.

   #### 4.4. Registro Canónico de Requisitos de Prueba

   Cuando una tarea genere, modifique, difiera, descarte u obsolete uno o más
   requisitos `TREQ-*`, deberá entregarse también el archivo completo:

   `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`

   El usuario reemplazará el archivo completo. No deberá localizar puntos de
   inserción, copiar filas sueltas ni combinar tablas manualmente.

   El archivo `04A` entregado deberá:

   - partir de la última versión canónica disponible;
   - preservar todas las filas históricas válidas;
   - incorporar exclusivamente los cambios autorizados;
   - conservar el orden de dominios declarado en el propio documento;
   - ordenar cada dominio por número ascendente;
   - actualizar cifras globales y por dominio;
   - actualizar la última tarea incorporada;
   - conservar exactamente catorce columnas por fila;
   - usar identificadores únicos;
   - mantener secuencias coherentes;
   - usar dominios, estados, tipos y propietarios permitidos;
   - resolver todas las relaciones `TREQ-*`;
   - impedir autorreferencias;
   - impedir pérdida, reemplazo o degradación de requisitos históricos.

   Queda prohibido depender de la reconciliación automática del compilador para
   reparar deliberadamente un archivo `04A` incompleto. La entrega deberá ser
   completa y válida antes de reemplazarse.

   Si el compilador restaura o corrige filas desde
   `.generated/.state/` o genera una copia en `.generated/.recovery/`, deberá
   declararse que el archivo entrante necesitó reconciliación y revisarse la
   diferencia antes de considerar correcta la actualización.

   Cuando la tarea no genere ni modifique requisitos `TREQ-*`:

   - no se entregará una copia innecesaria de `04A`;
   - la tarea deberá declarar `NO GENERA REQUISITOS DE PRUEBA`;
   - deberá incluir una justificación concreta.

   #### 4.5. Consulta obligatoria del remoto antes de desarrollar

   Antes de desarrollar cada tarea se deberá consultar la rama canónica vigente
   del repositorio y revisar, como mínimo:

   - `docs/plan-canonico/modular/01_PROTOCOLO.md`;
   - `docs/plan-canonico/modular/continuity-route.json`;
   - `docs/plan-canonico/modular/execution-route.json`;
   - `docs/plan-canonico/modular/priority-route-progress.json` cuando la ruta
     seleccionada sea prioritaria;
   - `docs/plan-canonico/modular/active-sequence.json`;
   - el archivo modular propietario de la tarea;
   - las tareas aprobadas que constituyen su base;
   - `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
   - `package.json`;
   - los validadores documentales aplicables;
   - los contratos, catálogos, procesos, pasos, actores, dispositivos, acciones,
     estados y decisiones que la tarea consume.

   Los nombres, identificadores, cantidades, aplicaciones, procesos, pasos,
   estados y títulos documentados se conservarán exactamente. No se
   renombrarán, resumirán, normalizarán ni mejorarán por inferencia.

   Cuando el remoto esté detrás de una tarea local ya aprobada:

   - se declarará expresamente el desfase;
   - el remoto seguirá siendo fuente para identidades y contratos ya
     materializados;
   - el último artefacto local aprobado será la base inmediata para la
     continuidad todavía no subida;
   - no se sobrescribirá ni descartará trabajo aprobado por usar una versión
     remota anterior.

   No se realizará ninguna escritura en GitHub sin autorización explícita del
   usuario.

   #### 4.6. Validación obligatoria contra los scripts del repositorio

   Los archivos deberán diseñarse respetando los scripts reales del repositorio.
   Desde la raíz de `vento-shell`, la validación global esperada será:

   ```bash
   npm run docs:plan:build
   npm run docs:plan:check
   npm run docs:plan:test
   npm run docs:treq:check
   npm run docs:treq:test
   git diff --check
   ```

   Cuando la tarea afecte sus dominios, se ejecutarán además de forma directa
   los validadores aplicables para obtener un diagnóstico específico:

   ```bash
   npm run docs:process-apps:check
   npm run docs:screens:check
   npm run docs:screen-processes:check
   npm run docs:screen-matrices:check
   ```

   Reglas de validación:

   - `docs:plan:build` deberá ejecutarse antes de `docs:plan:check`;
   - no se editarán manualmente `00_CABECERA_Y_ESTADO.md` ni archivos bajo
     `.generated/` para forzar continuidad;
   - `manifest.json` controla el orden físico de compilación;
   - `continuity-route.json` controla la ruta normal completa, el orden de sus
     etapas y la ubicación única de todas las tareas canónicas;
   - `active-sequence.json` es una proyección derivada de esa ruta y no se
     edita manualmente;
   - `04A` es la única fuente canónica del registro de pruebas;
   - el build deberá validar `04A` antes de compilar;
   - una tarea de pantallas deberá conservar la cobertura, nombres,
     aplicaciones, procesos, pasos, vocabularios, resúmenes y carryover que
     exigen sus validadores;
   - una tarea nueva deberá existir una sola vez en el bloque propietario; si
     su prefijo pertenece a una etapa de `continuity-route.json`, el build la
     incorporará automáticamente sin actualizar rangos manuales;
   - si una familia nueva no tiene etapa propietaria, el build fallará por
     cobertura incompleta en vez de colocarla por inferencia en una fase
     incorrecta;
   - no se declarará `compilación correcta`, `pruebas aprobadas` o
     `validación final correcta` si los comandos reales no fueron ejecutados.

   La respuesta distinguirá siempre entre:

   - **VALIDACIÓN ESTRUCTURAL DEL ARTEFACTO:** comprobaciones realizadas sobre
     los archivos generados;
   - **VALIDACIÓN REAL DEL REPOSITORIO:** comandos ejecutados contra un checkout
     actualizado de `vento-shell`.

   Si no existe acceso a un checkout actualizado, deberá indicarse:

   `VALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL`

   #### 4.7. Revisión y aprobación por el usuario

   El flujo obligatorio será:

   ```text
   ARCHIVO PREPARADO COMO APROBADO PARA REEMPLAZO
           ↓
   REVISIÓN DEL USUARIO
           ↓
   CORRECCIÓN, SI FUE SOLICITADA
           ↓
   APROBADO EXPLÍCITO DEL USUARIO
           ↓
   APROBACIÓN CANÓNICA CONCEPTUAL
           ↓
   CONTINUACIÓN SOLO CUANDO EL USUARIO LA SOLICITE
   ```

   Antes de que el usuario diga **APROBADO**:

   - no se tratarán las decisiones como canónicas;
   - no se actualizará conceptualmente la última tarea aprobada;
   - no se avanzará a la tarea siguiente;
   - no se implementará código;
   - no se escribirá en GitHub.

   Después de **APROBADO**:

   - no será obligatorio regenerar el archivo si no hubo correcciones;
   - la tarea quedará aprobada para su incorporación local o remota;
   - las actualizaciones administrativas podrán consolidarse posteriormente
     mediante los scripts;
   - solo se continuará cuando el usuario solicite expresamente la siguiente
     tarea.

   #### 4.8. Integridad y prohibiciones

   Ninguna respuesta deberá:

   - usar una versión antigua de `04A` sin declararlo;
   - reducir silenciosamente la cobertura de una matriz;
   - cambiar nombres o identificadores canónicos;
   - omitir pantallas, procesos, pasos, acciones o requisitos;
   - inventar resultados de scripts;
   - entregar un archivo completo de la sección cuando solo se pidió una tarea;
   - entregar una tarea sin el `04A` completo cuando cambien requisitos;
   - crear archivos paralelos para evitar reemplazar `04A`;
   - editar derivados para ocultar inconsistencias de las fuentes;
   - continuar automáticamente después de una aprobación.

   La entrega se considerará completa únicamente cuando el usuario pueda:

   1. descargar el archivo de tarea;
   2. reemplazar exactamente su marcador;
   3. reemplazar `04A` completo cuando corresponda;
   4. ejecutar los scripts sin reconstrucciones manuales;
   5. revisar el resumen final;
   6. aprobar o solicitar correcciones.


5. Toda tarea nueva se entregará por defecto como:

   **APROBADA PARA REEMPLAZAR — PENDIENTE DE CONFIRMACIÓN DEL USUARIO**

   Desde su primera entrega deberá utilizar dentro del archivo:

   `### ✅ <ID-DE-TAREA> — <TÍTULO>`

   y:

   `**Estado:** APROBADA`

   El nombre del archivo será:

   `<ID-DE-TAREA>_APROBADA_PARA_REEMPLAZAR.md`

   El archivo deberá contener toda la definición sustantiva necesaria
   para evaluar y confirmar la tarea, sin depender de explicaciones
   complementarias del chat.

   El marcador `✅`, el estado `APROBADA` y el nombre
   `*_APROBADA_PARA_REEMPLAZAR.md` expresan que el artefacto está completo y
   listo para reemplazo. No sustituyen la confirmación canónica del usuario.

6. La aprobación canónica conceptual solo ocurrirá cuando el usuario diga
   explícitamente:

   **APROBADO**

   Antes de esa instrucción:

   - se conservarán el marcador `✅` y el estado `APROBADA` del artefacto
     preparado;
   - no se registrará la tarea como última tarea canónicamente aprobada;
   - no se actualizará la continuidad por inferencia;
   - no se presentarán sus decisiones como canónicamente confirmadas;
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

     `<ID-DE-TAREA>_APROBADA_PARA_REEMPLAZAR.md`

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

39. Toda tarea documental, funcional, técnica o de implementación deberá
    incluir, antes de sus criterios de aceptación, una sección denominada:

    `#### Requisitos de prueba derivados`

    La sección deberá usar uno de los siguientes formatos.

    Cuando la tarea genere requisitos de prueba:

    ```md
    #### Requisitos de prueba derivados

    **Resultado:** GENERA REQUISITOS DE PRUEBA

    | ID              | Regla protegida                                              | Tipo        | Prioridad | Momento de implementación      | Destino                    |
    | --------------- | ------------------------------------------------------------ | ----------- | --------- | ------------------------------ | -------------------------- |
    | `TREQ-NEXO-001` | Un retiro parcial descuenta unidades y no paquetes completos | integración | crítica   | paquete que implemente retiros | paquete E5 correspondiente |
    ```

    Cuando la tarea no genere requisitos de prueba:

    ```md
    #### Requisitos de prueba derivados

    **Resultado:** NO GENERA REQUISITOS DE PRUEBA

    **Justificación:** cambio exclusivamente documental, sin comportamiento
    ejecutable nuevo o modificado.
    ```

    No se permitirá omitir esta sección.

40. Toda regla de negocio, autorización, cálculo, transformación, transición
    de estado, restricción de integridad, contrato de integración, incidente,
    regresión o comportamiento técnicamente verificable que requiera protección
    deberá generar inmediatamente un requisito de prueba identificable.

    Los requisitos utilizarán la convención:

    `TREQ-<DOMINIO>-<NNN>`

    Ejemplos:

    - `TREQ-AUTH-001`;
    - `TREQ-NEXO-001`;
    - `TREQ-SUPABASE-001`;
    - `TREQ-PASS-001`.

    Detectar una necesidad de prueba no obliga a implementarla durante una
    tarea documental. Sí obliga a:

    - asignarle identificador;
    - describir la regla protegida;
    - indicar el riesgo que evita;
    - clasificar el tipo de prueba;
    - registrar su origen;
    - vincularla con una tarea o paquete de implementación;
    - definir el momento en que deberá implementarse;
    - incorporarla al Registro Canónico de Requisitos de Prueba.

    No se considerarán requisitos materializados expresiones como:

    - probar después;
    - revisar en QA;
    - validar durante implementación;
    - comprobar posteriormente;
    - agregar pruebas cuando exista infraestructura.

    Ninguna tarea podrá aprobarse cuando identifique una necesidad de prueba y:

    - no genere el requisito `TREQ-*`;
    - no lo vincule con el registro canónico;
    - no declare su tarea o paquete destino;
    - no declare expresamente por qué la prueba no aplica.

    Cuando se detecte un defecto o regresión, deberá generarse un requisito de
    prueba de regresión antes o conjuntamente con su corrección.

    Las pruebas unitarias, contractuales, de integración, seguridad y
    migraciones deberán implementarse junto con el paquete que modifica el
    comportamiento protegido.

    El BLOQUE U no deberá utilizarse para aplazar pruebas que debieron
    implementarse junto con el código. El BLOQUE U ejecutará regresión integral,
    escenarios de extremo a extremo, seguridad, experiencia y pilotos.

---

<!-- TASK-MATERIALIZATION-RULE:START -->
## Regla canónica de materialización inmediata de tareas nuevas

Cuando una tarea aprobada detecte una brecha y cree un identificador nuevo, la nueva tarea deberá quedar físicamente registrada antes de avanzar a la tarea siguiente.

La materialización obligatoria incluye:

1. insertar el encabezado con marcador en el bloque lógico propietario;
2. registrar su dependencia en el orden de implementación cuando afecte secuencia o puertas;
3. comprobar que el identificador aparece exactamente una vez en el plan modular;
4. ejecutar el compilador y el verificador;
5. cerrar la respuesta de aprobación con una orden explícita cuando quede una acción manual pendiente.

Una mención narrativa dentro de otra tarea no equivale a crear la tarea nueva.
<!-- TASK-MATERIALIZATION-RULE:END -->

<!-- TASK-ID-UNIQUENESS:START -->
## Regla canónica de unicidad y evolución de identificadores

Antes de proponer o materializar una tarea nueva se deberá buscar su
identificador exacto en todos los archivos de `manifest.json`.

- un identificador existente no podrá reutilizarse con otro significado;
- cuando una decisión posterior refine una tarea no iniciada, deberá conservar
  el identificador y declarar expresamente la sustitución de responsabilidad;
- una tarea aprobada o ejecutada no podrá cambiar de significado; deberá
  crearse un identificador nuevo y registrar la relación;
- el compilador deberá rechazar identificadores duplicados;
- la materialización deberá validar también coherencia de bloque, dependencias
  y orden de implementación, no solo existencia física.
<!-- TASK-ID-UNIQUENESS:END -->

<!-- PRIORITY-PACKAGE-PROTOCOL:START -->
## Protocolo de carriles verticales prioritarios

Un carril vertical prioritario modifica prioridad de ejecución, no identidad,
alcance final ni estado de las tareas canónicas.

Invariantes estructurales:

```text
canonical_sequence_unchanged = true
global_task_partial_approval_forbidden = true
supabase_repository = vento-shell
```

Reglas obligatorias:

1. la fuente estructurada será `priority-delivery-lanes.json`;
2. `execution-route.json` registrará exactamente una ruta seleccionada y
   `priority-route-progress.json` conservará controles e instancias por
   `package_id`; antes de iniciar trabajo deberá declararse una sola ruta:
   si la prioridad activa es remisiones NEXO se seguirá
   `NEXO-REMISSIONS-001`; en cualquier otro caso se seguirá
   `NORMAL_CANONICAL_FLOW`;
3. el flujo normal se deriva de `continuity-route.json`; el build descubre las
   tareas de cada familia, selecciona la primera etapa incompleta y regenera
   `active-sequence.json`;
   el flujo prioritario se deriva exclusivamente de
   `ordered_execution_stages`, en orden ascendente y sin mezclar etapas;
4. elegir el flujo prioritario cambia la continuidad de trabajo visible, pero
   no cambia el orden físico del plan ni elimina trabajo futuro;
5. la tarea actual se publicará en `active-sequence.json`, siempre como
   proyección de `execution-route.json`, la ruta seleccionada, los marcadores
   canónicos y, cuando aplique, los estados `task_id::package_id`;
   esta proyección solo reserva continuidad y jamás cambia marcadores, aprueba
   tareas ni autoriza iniciar la siguiente;
6. un artefacto producido para una aplicación podrá ser consumido por un
   paquete, pero la tarea transversal permanecerá no iniciada o en su estado
   real hasta completar su alcance y recibir aprobación explícita;
7. ninguna ejecución de paquete podrá insertar un marcador aprobado en una
   tarea global;
8. cada gate y cada paso de entrega se registrará como
   `<task_id>::<package_id>` sin crear un nuevo identificador de tarea;
   su estado se actualizará exclusivamente en `priority-route-progress.json`
   después de la aprobación explícita del usuario y nunca modificará por
   inferencia el marcador global de `<task_id>`;
   los controles virtuales `route_id::stage_id` seguirán la misma regla;
9. `E5-GATE-008::<package_id>` deberá verificar solo el paquete indicado y no
   se interpretará como cierre completo de E5;
10. `SHELL-CI-020::<package_id>` a `SHELL-CI-024::<package_id>` conservarán
   commit, versión, ambiente, migraciones, pruebas, decisiones, incidentes,
   conciliación y evidencia propios;
11. cerrar un paquete no aprobará automáticamente otros paquetes, bloques,
   dominios o aplicaciones;
12. una dependencia se podrá excluir únicamente con fundamento verificable,
   tarea propietaria y reevaluación antes de ampliar alcance;
13. toda migración de Supabase para VENTO se creará, versionará y ejecutará
    desde `vento-shell`;
14. los contratos compartidos se implementarán en su repositorio propietario y
    NEXO solo consumirá versiones publicadas o una transición explícita;
15. el compilador deberá rechazar un carril que altere la secuencia, permita
    aprobación parcial, omita el ciclo de cierre o declare otro repositorio
    propietario de Supabase;
16. `NEXO-REMISSIONS-001` deberá completar todo BLOQUE H en su orden interno;
    no podrá declarar que un subconjunto de H equivale a su cierre;
17. cada dependencia identificada deberá quedar en una de tres categorías
    exhaustivas: obligatoria, condicional con criterio verificable o posterior
    preservada con fase propietaria;
18. la tabla visible del orden de implementación se generará automáticamente
    desde la fuente estructurada y el compilador rechazará cualquier deriva;
19. una condición se evaluará de forma explícita antes de E5; el silencio no
    equivale a “no aplica”.
20. al certificar la última etapa de un carril, la continuidad volverá
    automáticamente a `NORMAL-CANONICAL-FLOW-001` y escogerá la primera tarea
    canónica todavía pendiente según `90_ORDEN_DE_IMPLEMENTACION.md`;
21. una tarea global adelantada y aprobada legítimamente por el carril se
    omitirá en esa proyección posterior; las tareas de instancia no aprobarán
    ni ocultarán su tarea global y seguirán pendientes hasta cerrar su alcance
    canónico completo;
22. `continuity-route.json` deberá cubrir exactamente una vez el inventario
    completo de tareas. Una omisión o asignación duplicada hará fallar el
    build.

La ejecución de un carril nunca sustituye la aprobación del plan completo. Su
propósito es validar una capacidad vertical reutilizable y devolver evidencia,
defectos y contratos comprobados al desarrollo normal.
<!-- PRIORITY-PACKAGE-PROTOCOL:END -->

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
