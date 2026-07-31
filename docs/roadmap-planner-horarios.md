# Roadmap: planner de horarios VISO

Este documento es la lista viva para llevar la programación laboral y la sugerencia de horarios a un nivel confiable para operación real.

## Estado

- Responsable técnico: Codex
- Repo de aplicación: `vento-viso`
- Repo rector de Supabase: `vento-shell`
- Fecha de inicio: 2026-07-01
- Estado general: en desarrollo
- Delta activo: `DELTA-VISO-SCHEDULE-20260731-001`
- Package futuro: `VISO-SCHEDULE-MONTHLY-001`

## Frontera

- Proceso: `VPROC-0007`.
- Propietaria: VISO.
- Consumidoras directas: ANIMA y SHELL.
- Fuente actual: `public.employee_shifts`.
- Semanal: edición detallada principal.
- Mensual: planificación masiva complementaria.

## Principios

- Generar borradores, no publicar automáticamente.
- Reglas duras se validan en servidor.
- Rol operativo por sede manda sobre cargo base.
- No hardcodear nombres de sedes, personas o roles.
- Un límite hardcodeado no es política canónica.
- Marcar una tarea como hecha solo después de validación real.

## Congelación mensual

Incluye Semana/Mes, ruta mensual, multibloque, preview, borradores, publicación, total entre sedes, límite provisional, trigger, borrado de borradores y notificación ANIMA.

Excluye legalidad de jornada, extras/recargos, ausencias, turnos partidos/overnight aprobados, límites por contrato, excepciones, nómina, versionado completo, piloto y producción.

## Fase 0: auditoría

- [x] Confirmar tablas base del planner.
- [x] Confirmar heurística local.
- [x] Confirmar dependencia de cobertura.
- [x] Confirmar dependencia histórica de `employees.role`.
- [ ] Ejecutar `CODE-AUD-021`.
- [ ] Ejecutar `AUTH-UI-061`.

## Fase 1: rol y área

- [x] Extender tipos con roles por sede.
- [x] Validar candidatos contra roles operativos.
- [x] Priorizar coincidencia exacta.
- [x] Usar rol default cuando aplique.
- [x] Persistir área sugerida.
- [ ] Mostrar explicación humana.

## Fase 2: configuración por sede

- [ ] Presets de cobertura.
- [ ] Aplicar preset con confirmación.
- [ ] Cobertura faltante compacta.
- [ ] Nombres legibles.
- [ ] Mínimo vs ideal.

## Fase 3: rotación

- [ ] Penalizar repetición.
- [ ] Alternar apertura/cierre.
- [ ] Repartir fines de semana.
- [ ] Evitar mismo bloque.
- [ ] Explicar penalizaciones.

## Fase 4: restricciones

- [ ] Máximo semanal.
- [ ] Alertar cobertura imposible.
- [ ] Descanso mínimo.
- [ ] Días continuos.
- [ ] Turnos partidos solo con permiso.
- [x] Máximo simultáneo por rol.
- [x] Límite global o por sede.
- [x] Motor respeta máximo simultáneo.
- [ ] Aprobar `VISO-SCH-001` a `008`.
- [ ] Definir límite mensual, vigencia y excepción.
- [ ] Validar total entre sedes.
- [ ] Validar preview reactivo.
- [ ] Validar 12 bloques.
- [ ] Validar exclusividad de fecha.
- [ ] Validar overnight/partidos fuera del modo rápido.
- [ ] Resolver `break_minutes = 0`.
- [ ] Validar borradores en exceso.
- [ ] Validar bloqueo semanal y mensual.
- [ ] Validar concurrencia.
- [ ] Validar eliminación de borradores.

## Fase 5: aprobación

- [ ] Múltiples candidatos.
- [ ] Score.
- [ ] Ajustes puntuales.
- [ ] Explicación por turno.
- [ ] Comparación histórica.
- [ ] Revisión y publicación separadas.
- [ ] Versionado/corrección publicada.

## Fase 6: IA controlada

- [ ] IA solo recibe candidatos válidos.
- [ ] Recomendación, no inserción.
- [ ] Revalidación del motor.
- [ ] Auditoría de prompt/respuesta.

## Fase 7: pruebas por sede

- [ ] Saudo.
- [ ] Molka.
- [ ] Vento Café.
- [ ] Centro de Producción.
- [ ] Vento Group.
- [ ] Trabajador rotado.
- [ ] Trabajador compartido entre sedes.
- [ ] Febrero.
- [ ] Mes de 30 días.
- [ ] Mes de 31 días.

## Fase 8: cierre

- [ ] Build.
- [ ] Typecheck.
- [ ] Pruebas cálculo.
- [ ] Pruebas Server Actions.
- [ ] Pruebas migración/rollback.
- [ ] `04A` completo.
- [ ] Package E5 aprobado.
- [ ] Piloto.
- [ ] Cerrar delta.

## Log

- 2026-07-01: Documento creado.
- 2026-07-01: Ajustado motor por rol operativo y área.
- 2026-07-01: Ajustado fallback histórico.
- 2026-07-02: Migración de límites simultáneos por rol.
- 2026-07-31: Abierto delta mensual y reservado package; producción no autorizada.
