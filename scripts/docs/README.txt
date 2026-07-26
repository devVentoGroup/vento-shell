PLAN CANÓNICO MODULAR

Comandos desde la raíz de vento-shell:

1. Regenerar continuidad, registro global y compilado:

   node scripts/docs/build-plan-canonico.mjs

2. Verificar que las fuentes y los derivados están sincronizados:

   node scripts/docs/build-plan-canonico.mjs --check

Organización:

- manifest.json controla únicamente el orden físico de compilación.
- active-sequence.json controla el orden documental de ejecución.
- active-sequence.json puede declarar varios segmentos y prefijos; el script
  encuentra la primera tarea no aprobada y avanza automáticamente entre ellos.
- si toda la secuencia queda aprobada, el script informa
  SECUENCIA DOCUMENTAL COMPLETA en vez de fallar.
- 00_CABECERA_Y_ESTADO.md y los archivos bajo .generated/ no deben ajustarse
  manualmente para corregir continuidad.

Al agregar una tarea futura:

- crear su marcador en el fragmento modular propietario;
- incluir su ID una sola vez en active-sequence.json si forma parte de la
  continuidad vigente;
- ejecutar el build y después el check.
