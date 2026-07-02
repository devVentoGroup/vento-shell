# Roadmap: planner de horarios VISO

Este documento es la lista viva para llevar la sugerencia semanal de horarios a un nivel confiable para operacion real.

## Estado

- Responsable tecnico: Codex
- Repo de aplicacion: `vento-viso`
- Repo rector de Supabase: `vento-shell`
- Fecha de inicio: 2026-07-01
- Estado general: en desarrollo

## Principios

- La tabla semanal sigue siendo la vista principal de trabajo.
- El planner debe generar borradores explicables, no publicar automaticamente.
- Las reglas duras no se pueden violar: sede, turno publicado/check-in operativo, disponibilidad bloqueada, cruces, rol operativo y maximos.
- La IA puede revisar, explicar y proponer ajustes, pero no debe saltarse reglas duras.
- El rol operativo por sede manda sobre el cargo base del trabajador.
- No hardcodear nombres de sedes, trabajadores ni roles.
- Cada cambio realizado debe marcarse aqui como hecho.

## Fase 0: auditoria del estado actual

- [x] Confirmar que ya existen tablas base del planner: cobertura, disponibilidad, preferencias, limites y auditoria de sugerencias.
- [x] Confirmar que la sugerencia actual es heuristica local, no IA generativa.
- [x] Confirmar que la calidad depende de tener cobertura configurada por sede.
- [x] Confirmar que el motor aun dependia demasiado de `employees.role`.

## Fase 1: rol operativo y area en la sugerencia

- [x] Extender tipos del planner para trabajador con roles operativos por sede.
- [x] Validar candidatos contra roles operativos, no solo contra cargo base.
- [x] Priorizar coincidencia exacta con perfil operativo del trabajador.
- [x] Cuando la franja no exige rol, usar el rol operativo default del trabajador.
- [x] Persistir area sugerida en el turno borrador cuando se puede derivar del rol operativo.
- [ ] Mostrar explicacion humana de rol/area en la UI de resultados.

## Fase 2: configuracion usable por sede

- [ ] Crear presets de cobertura por tipo de sede.
- [ ] Permitir aplicar preset sin tocar datos existentes hasta confirmar.
- [ ] Mostrar cobertura faltante por dia de forma compacta.
- [ ] Usar nombres legibles de roles operativos en vez de codigos.
- [ ] Separar "minimo requerido" de "ideal si hay personal".

## Fase 3: rotacion semanal robusta

- [ ] Penalizar repetir manana/tarde/noche respecto a la semana anterior.
- [ ] Alternar apertura y cierre.
- [ ] Repartir fines de semana.
- [ ] Evitar asignar siempre el mismo bloque al mismo trabajador.
- [ ] Explicar cada penalizacion importante.

## Fase 4: restricciones laborales y operativas

- [ ] Respetar maximo semanal antes de preferencias.
- [ ] Alertar cuando no se puede cubrir sin exceder maximos.
- [ ] Configurar descanso minimo entre salida y entrada.
- [ ] Configurar maximo de dias continuos.
- [ ] Evitar turnos partidos salvo permiso explicito.

## Fase 5: candidatos y aprobacion

- [ ] Generar mas de un candidato semanal cuando haya alternativas.
- [ ] Mostrar score por cobertura, balance, rotacion y preferencias.
- [ ] Permitir aceptar/rechazar ajustes puntuales.
- [ ] Guardar explicacion por turno sugerido.
- [ ] Comparar sugerencia contra semana anterior.

## Fase 6: capa IA controlada

- [ ] Enviar a IA solo resumen de candidatos validos, no acceso directo a escritura.
- [ ] Pedir recomendaciones y explicaciones, no inserciones.
- [ ] Validar de nuevo cualquier ajuste propuesto por IA con el motor de reglas.
- [ ] Registrar prompt, resumen y respuesta para auditoria.

## Fase 7: pruebas obligatorias por sede

- [ ] Saudo: una sola area operativa, sugerencia cubre la semana sin roles manuales innecesarios.
- [ ] Molka: operador integral puede cubrir bloques amplios sin romper rotacion.
- [ ] Vento Cafe: barra, cocina y mostrador quedan separados por rol/area.
- [ ] Centro de Produccion: bodega/produccion/logistica no se mezclan.
- [ ] Vento Group: administrativo usa reglas propias si se programa personal.
- [ ] Trabajador rotado cambia rol sugerido segun sede.

## Log de cambios

- 2026-07-01: Documento creado.
- 2026-07-01: Ajustado motor de sugerencias en VISO para usar perfil operativo por sede, roles operativos del trabajador y area derivada del rol al generar borradores.
- 2026-07-01: Ajustado fallback historico del planner para convertir cargo base a rol operativo cuando no existe `operational_role` en turnos anteriores; la sugerencia ahora muestra error si fallan las consultas de roles o perfiles operativos.
