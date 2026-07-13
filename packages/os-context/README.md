# @vento/os-context

Contrato compartido para las aplicaciones web internas de Vento OS.

## Responsabilidad

- Resolver un único contexto efectivo por aplicación.
- Mantener separadas la identidad real, el rol administrativo y el rol operativo.
- Priorizar dispositivo compartido, simulación autorizada y contexto real de ANIMA.
- Evaluar permisos con el mismo contexto que usa el shell.

## Consumo

```ts
import {
  getEffectiveContext,
  hasEffectivePermission,
  startContextSimulation,
  stopContextSimulation,
} from "@vento/os-context";
```

## Fuentes

1. `shared_device`: configuración del dispositivo compartido.
2. `simulation`: sesión temporal creada por propietario o gerente general.
3. `anima`: turno o check-in real.
4. `administrative_bypass` / `real`: acceso administrativo o sesión sin contexto operativo.

ANIMA continúa siendo la fuente de verdad del contexto laboral real. PASS no consume este paquete.
