PLAN CANÓNICO MODULAR

Comandos desde la raíz de vento-shell:

1. Regenerar continuidad, registro global y compilado:

   node scripts/docs/build-plan-canonico.mjs

2. Verificar que las fuentes y los derivados están sincronizados:

   node scripts/docs/build-plan-canonico.mjs --check

3. Ejecutar las pruebas de continuidad y del registro TREQ:

   npm run docs:plan:test
   npm run docs:treq:test

4. Validar directamente el registro canónico TREQ:

   npm run docs:treq:check

Organización:

- manifest.json controla únicamente el orden físico de compilación.
- active-sequence.json controla el orden documental de ejecución.
- active-sequence.json puede declarar varios segmentos y prefijos; el script
  encuentra la primera tarea no aprobada y avanza automáticamente entre ellos.
- si toda la secuencia queda aprobada, el script informa
  SECUENCIA DOCUMENTAL COMPLETA en vez de fallar.
- 00_CABECERA_Y_ESTADO.md y los archivos bajo .generated/ no deben ajustarse
  manualmente para corregir continuidad.
- 04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md es la única fuente del
  registro TREQ y se reemplaza completo cuando cambia; no se mantienen filas
  sueltas ni registros paralelos.
- el build ejecuta el validador TREQ antes de compilar y bloquea dominios,
  secuencias, columnas, estados, tipos, propietarios, relaciones, cifras o
  evidencia obsoleta.
- la última tarea incorporada y las cifras del resumen se contrastan con las
  fuentes canónicas y active-sequence.json; el validador no fija 781, 19 ni
  UX-BASE-015 como constantes.
- CI ejecuta las pruebas de continuidad, las diez regresiones del validador,
  la validación del registro y el check del compilado.

Al agregar una tarea futura:

- crear su marcador en el fragmento modular propietario;
- incluir su ID una sola vez en active-sequence.json si forma parte de la
  continuidad vigente;
- regenerar 04A completo cuando la tarea cree o modifique requisitos TREQ;
- ejecutar el build y después el check.
