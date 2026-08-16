# Reglas de trabajo en vento-shell

- Todo trabajo de Supabase para VENTO se crea, versiona y ejecuta desde este repositorio.
- Antes de preparar un commit, inspeccionar `git status --short` y separar cambios ajenos al alcance activo.
- No usar `git add -A`, `git add .` ni staging global cuando existan cambios concurrentes.
- Para una tarea canónica, añadir únicamente su fragmento propietario y los derivados sincronizados que le correspondan.
- Los cambios transversales de `scripts/docs`, políticas, plantillas, CI o configuración deben quedar en un commit distinto del desarrollo de una tarea canónica.
- No aprobar tareas, cambiar marcadores ni avanzar continuidad sin `APROBADO` explícito del usuario.
- El formato automático, el build, una prueba local o un commit no constituyen aprobación.
- Ejecutar `npm run docs:commit-scope:check -- --staged` antes de confirmar cambios del plan.
