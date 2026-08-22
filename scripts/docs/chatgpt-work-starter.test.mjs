import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
  actionResponseContract,
  buildChatgptWorkStarter,
} from './chatgpt-work-starter.mjs';

test('genera un unico iniciador desde la accion operativa vigente', () => {
  const result = buildChatgptWorkStarter();
  assert.match(result.source, /^VENTO OS — INICIADOR CANÓNICO DE TRABAJO/u);
  assert.match(result.source, /ACCIÓN PRINCIPAL OBLIGATORIA/u);
  assert.match(result.source, new RegExp(`Objetivo exacto: ${result.control.primaryAction.target}`, 'u'));
  assert.match(result.source, /CONTRATO OBLIGATORIO DE LA RESPUESTA Y DEL PASO MANUAL/u);
  assert.match(result.source, /PASOS EXACTOS PARA EL USUARIO/u);
  assert.match(result.source, /Operador que realiza los cambios: USUARIO HUMANO/u);
  assert.match(result.source, /Interacción: TRANSACCIÓN CONTINUA \+ UNA SOLA BATERÍA FINAL/u);
  assert.match(result.source, /Watcher durante implementación física: APAGADO/u);
  assert.match(result.source, /Apertura física: docs:implementation:start/u);
  assert.match(result.source, /Carril documental durante implementación física: ACTIVO_EN_PARALELO/u);
  assert.match(result.source, /CONTROLLED_DUAL_LANE/u);
  assert.match(result.source, /Checkouts independientes: OBLIGATORIOS/u);
  assert.match(result.source, /Cierre entre carriles: SERIALIZADO/u);
  assert.match(result.source, /CONGELADO POR source_contract_sha256/u);
  assert.match(result.source, /Preflight físico: UNA VEZ/u);
  assert.match(result.source, /Reconciliación de apertura: docs:plan:build UNA VEZ \+ docs:plan:check/u);
  assert.match(result.source, /Batería física final: SOLO validation_commands AUTORIZADAS/u);
  assert.match(result.source, /Batería final PASS: CONTINUAR EN LA MISMA TRANSACCIÓN; EVIDENCIA REMOTA, SI APLICA, ANTES DE VERIFIED/u);
  assert.match(result.source, /Cierre físico: docs:implementation:finish/u);
  assert.match(result.source, /=== RESULTADO PARA CHATGPT ===/u);
  assert.match(result.source, /SOLO EL BLOQUE FINAL/u);
  assert.match(result.source, /Copia manual de salidas extensas: PROHIBIDA/u);
  assert.match(result.source, /Terminal interactiva: SIEMPRE DEBE QUEDAR ABIERTA/u);
  assert.match(result.source, /COMANDO exit: PROHIBIDO EN BLOQUES MANUALES/u);
  assert.match(result.source, /Salida operativa de terminal: ASCII SEGURO/u);
  assert.match(result.source, /Reactivación del watcher: SOLO DESPUÉS DE READY_TO_RESTART_WATCHER: SI/u);
  assert.match(result.source, /Gates intermedios rutinarios: PROHIBIDOS/u);
  assert.match(result.source, /Raíz local exacta del repositorio: .+vento-shell/u);
  assert.match(result.source, /HISTORIAL FÍSICO ACUMULATIVO/u);
  assert.match(result.source, /Modo de almacenamiento: UN ARCHIVO POR INSTANCIA/u);
  assert.match(result.source, /CONTENIDO LOCAL EXACTO DEL REGISTRO ACTIVO/u);
  assert.match(result.source, /Escrituras del asistente en archivos o repositorios: NO AUTORIZADAS/u);
  assert.match(result.source, /AUTORIZO EJECUCION ASISTIDA DEL PASO N/u);
  assert.match(result.source, /Batería física: exclusivamente validation_commands de la instancia/u);
  assert.match(result.source, /Apertura física: docs:implementation:start incluye preflight y docs:plan:build \+ docs:plan:check de IN_PROGRESS/u);
  assert.match(result.source, /Cierre físico: docs:implementation:finish incluye docs:plan:build final/u);
  assert.doesNotMatch(result.source, /Regeneración ligera de control:/u);
  assert.doesNotMatch(result.source, /Regeneración ligera del Iniciador:/u);
  assert.match(result.source, /Contrato propietario SHA-256: [a-f0-9]{64}/u);
  assert.doesNotMatch(result.source, /\{\{CURRENT_WORK\}\}/u);
  assert.equal(result.outputPath.endsWith('INICIADOR_VENTO_ACTUAL.txt'), true);
});

test('ejecutar implementacion usa lifecycle de apertura y cierre sin pasos documentales manuales', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'EJECUTAR_IMPLEMENTACION',
      target: 'SHELL-CI-001::GLOBAL',
    },
    physical: {
      active: { status: 'AUTHORIZED' },
      recordedInstances: [],
    },
  }, 'b'.repeat(64));

  assert.match(source, /TRANSACCIÓN COMPLETA DE IMPLEMENTACIÓN/u);
  assert.match(source, /docs:implementation:start -- --instance-id SHELL-CI-001::GLOBAL/u);
  assert.match(source, /AUTHORIZED -> IN_PROGRESS/u);
  assert.match(source, /preflight y reconciliación documental de apertura/u);
  assert.match(source, /docs:plan:build una vez seguido de docs:plan:check/u);
  assert.match(source, /READY_TO_IMPLEMENT: SI/u);
  assert.match(source, /todos los cambios físicos deterministas/u);
  assert.match(source, /contenido completo sin elipsis/u);
  assert.match(source, /a IMPLEMENTED/u);
  assert.match(source, /una sola batería final/u);
  assert.match(source, /exclusivamente las validation_commands autorizadas/u);
  assert.match(source, /commit\/push mínimo de materialización/u);
  assert.match(source, /tramo remoto/u);
  assert.match(source, /solo con PASS remoto/u);
  assert.match(source, /docs:implementation:finish -- --instance-id SHELL-CI-001::GLOBAL/u);
  assert.match(source, /No vuelvas a ejecutar la batería después de PASS completo/u);
  assert.doesNotMatch(source, /cambiando únicamente .* de AUTHORIZED a IN_PROGRESS/u);
  assert.doesNotMatch(source, /ejecutando inmediatamente el preflight estricto/u);
});

test('IN_PROGRESS con apertura vigente no obliga a repetir lifecycle', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'EJECUTAR_IMPLEMENTACION',
      target: 'SHELL-CI-001::GLOBAL',
    },
    physical: {
      active: { status: 'IN_PROGRESS' },
      recordedInstances: [],
    },
  }, 'c'.repeat(64));

  assert.match(source, /Si existe evidencia vigente de READY_TO_IMPLEMENT: SI/u);
  assert.match(source, /sin repetir preflight ni build/u);
  assert.match(source, /una sola batería final/u);
});

test('IMPLEMENTED salta apertura y entra directamente a bateria final', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'EJECUTAR_IMPLEMENTACION',
      target: 'SHELL-CI-002::GLOBAL',
    },
    physical: {
      active: { status: 'IMPLEMENTED' },
      recordedInstances: [],
    },
  }, 'd'.repeat(64));

  assert.match(source, /ya está IMPLEMENTED/u);
  assert.match(source, /No repitas preflight/u);
  assert.match(source, /batería final completa/u);
});

test('la autorizacion conserva ledger y delega apertura al lifecycle', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'AUTORIZAR_IMPLEMENTACION',
      target: 'SHELL-CI-002::GLOBAL',
    },
    physical: {
      active: { status: 'PENDING_AUTHORIZATION' },
      recordedInstances: [{ instance_id: 'SHELL-CI-001::GLOBAL', status: 'VERIFIED' }],
    },
  }, 'a'.repeat(64));

  assert.match(source, /exactamente sus ocho secciones/u);
  assert.match(source, /implementation-control\.json/u);
  assert.match(source, /implementation-instances\/SHELL-CI-002__GLOBAL\.json/u);
  assert.match(source, /El historial anterior contiene 1 instancia/u);
  assert.match(source, /SHELL-CI-001::GLOBAL=VERIFIED/u);
  assert.match(source, /PENDING_AUTHORIZATION/u);
  assert.match(source, /status AUTHORIZED/u);
  assert.match(source, /authorization y evidence: \[\]/u);
  assert.match(source, /decision: APPROVED/u);
  assert.match(source, /source_contract_sha256/u);
  assert.match(source, new RegExp(`source_contract_sha256 debe ser exactamente ${'a'.repeat(64)}`, 'u'));
  assert.match(source, /En la misma respuesta/u);
  assert.match(source, /todos los archivos y cambios físicos deterministas/u);
  assert.match(source, /No obligues a regenerar el Iniciador/u);
  assert.match(source, /detener primero el watcher/u);
  assert.match(source, /main limpio, actualizado y sincronizado 0\/0/u);
  assert.match(source, /guardar después el registro AUTHORIZED/u);
  assert.doesNotMatch(source, /guardar primero el registro AUTHORIZED; detener el watcher/u);
  assert.match(source, /docs:implementation:start -- --instance-id SHELL-CI-002::GLOBAL/u);
  assert.match(source, /START_DOCS_PLAN_BUILD: PASS_ONCE/u);
  assert.match(source, /docs:implementation:finish -- --instance-id SHELL-CI-002::GLOBAL/u);
  assert.match(source, /commit\/push mínimo de materialización/u);
  assert.doesNotMatch(source, /cambiar únicamente ese registro a IN_PROGRESS/u);
  assert.doesNotMatch(source, /ejecutar el preflight estricto de SHELL-CI-002::GLOBAL/u);
});

test('las acciones conservan guia humana y prohiben micro-gates', () => {
  for (const type of [
    'EJECUTAR_IMPLEMENTACION',
    'RESOLVER_BLOQUEO',
    'DESARROLLAR_TAREA_DOCUMENTAL',
  ]) {
    const source = actionResponseContract({
      primaryAction: { type, target: 'TASK-001' },
      physical: { active: { status: type === 'EJECUTAR_IMPLEMENTACION' ? 'IN_PROGRESS' : null }, recordedInstances: [] },
    }, 'b'.repeat(64));
    assert.match(source, /PASOS EXACTOS PARA EL USUARIO/u);
    assert.match(source, /No te limites a informar qué sigue/u);
    assert.match(source, /El operador es el usuario humano/u);
    assert.match(source, /No escribas archivos/u);
    assert.match(source, /No pauses por rutina/u);
    assert.match(source, /=== RESULTADO PARA CHATGPT ===/u);
    assert.match(source, /No pidas al usuario buscar, recortar ni copiar manualmente/u);
    assert.match(source, /No incluyas `exit` como comando/u);
    assert.match(source, /terminal abierta/u);
    assert.match(source, /AUTORIZO EJECUCION ASISTIDA DEL PASO N/u);
    assert.match(source, /consulta el remoto y el repositorio vigente/u);
    assert.match(source, /revisa todas sus aserciones restantes/u);
    assert.match(source, /PowerShell manual debe ser parser-safe/u);
    assert.match(source, /ANCHOR_COUNT:\$\{Path\}:\$count/u);
    assert.match(source, /ANCHOR_COUNT:\$Path:\$count/u);
    assert.match(source, /git apply --check/u);
  }
});

test('la plantilla global desacopla el carril fisico de la continuidad documental', () => {
  const template = fs.readFileSync(
    'docs/plan-canonico/modular/chatgpt-work-starter-template.txt',
    'utf8',
  );
  assert.match(template, /MODO PREDETERMINADO DE IMPLEMENTACIÓN HUMANA/u);
  assert.match(template, /el usuario humano crea, modifica, reemplaza y elimina archivos/u);
  assert.match(template, /ChatGPT entrega seguidos todos los pasos/u);
  assert.match(template, /no se pausa entre pasos por rutina ni para pedir `HECHO`/u);
  assert.match(template, /RESULTADO DEL PASO N/u);
  assert.match(template, /REGLA DE SALIDA COMPACTA DE BATERÍAS Y COMPROBACIONES/u);
  assert.match(template, /=== RESULTADO PARA CHATGPT ===/u);
  assert.match(template, /por defecto debe devolver únicamente el bloque final/u);
  assert.match(template, /nunca sustituye ni altera el código de salida real/u);
  assert.match(template, /REGLA DE SEGURIDAD DE TERMINAL INTERACTIVA/u);
  assert.match(template, /está prohibido incluir `exit` como comando/u);
  assert.match(template, /dejar la terminal abierta/u);
  assert.match(template, /uso interno de `process\.exit/u);
  assert.match(template, /REGLA DE SALIDA ASCII SEGURA EN TERMINAL/u);
  assert.match(template, /\[PLAN CANONICO\]/u);
  assert.match(template, /sin tildes, emojis, flechas Unicode/u);
  assert.match(template, /un archivo por instancia/u);
  assert.match(template, /watcher crea automáticamente su archivo exacto/u);
  assert.match(template, /usuario nunca crea manualmente el archivo/u);
  assert.match(template, /nunca se reemplaza un arreglo global `instances`/u);
  assert.match(template, /FLUJO RÁPIDO DE IMPLEMENTACIÓN FÍSICA/u);
  assert.match(template, /watcher debe permanecer apagado/u);
  assert.match(template, /detén primero el watcher/u);
  assert.match(template, /guarda después el registro de instancia en `AUTHORIZED`/u);
  assert.doesNotMatch(template, /guarde el registro `AUTHORIZED`, detén el watcher/u);
  const attributes = fs.readFileSync('.gitattributes', 'utf8');
  assert.match(attributes, /packages\/contracts\/authorization\/\*\*\/\*\.ts text eol=lf/u);
  assert.match(attributes, /packages\/contracts\/authorization\/\*\*\/\*\.mjs text eol=lf/u);
  assert.match(attributes, /packages\/contracts\/authorization\/\*\*\/\*\.jsonl text eol=lf/u);
  assert.match(template, /commit\/push final de cierre/u);
  assert.match(template, /una sola transacción final fail-fast/u);
  assert.match(template, /exclusivamente las `validation_commands`/u);
  assert.match(template, /commit\/push mínimo de materialización/u);
  assert.match(template, /evidencia remota/u);
  assert.match(template, /`npm run docs:plan:build` una sola vez/u);
  assert.match(template, /no se reformatea ni se reabre una tarea histórica/u);
  assert.match(template, /START_DOCS_PLAN_BUILD: PASS_ONCE/u);
  assert.match(template, /START_DOCS_PLAN_CHECK: PASS/u);
  assert.match(template, /DOCUMENTARY_LANE_FOR_PHYSICAL: ADVISORY_ONLY/u);
  assert.match(template, /PARALELISMO CONTROLADO DE CARRILES/u);
  assert.match(template, /un checkout o clon independiente por carril/u);
  assert.match(template, /solo un carril puede cerrar y mergear a la vez/u);
  assert.match(template, /source_contract_sha256/u);
  assert.doesNotMatch(template, /después de `VERIFIED`, deriva el control y regenera el Iniciador mediante `npm run docs:implementation:status`/u);
  assert.match(template, /al arrancar debe comprobar estado y fuentes en modo de solo lectura/u);
  assert.match(template, /Push Protection/u);
  assert.match(template, /AUTORIZO EJECUCION ASISTIDA DEL PASO 3/u);
  assert.match(template, /“haz la acción principal” no autorizan escrituras automáticas/u);
  assert.match(template, /PREENTREGA OBLIGATORIA Y POWERSHELL SEGURO/u);
  assert.match(template, /INICIADOR_VENTO_ACTUAL\.txt.*proyección generada/u);
  assert.match(template, /revisa todas las aserciones restantes del mismo validador/u);
  assert.match(template, /PowerShell manual debe ser parser-safe/u);
  assert.match(template, /ANCHOR_COUNT:\$\{Path\}:\$count/u);
  assert.match(template, /comillas tipográficas/u);
  assert.match(template, /guiones Unicode/u);
  assert.match(template, /Generated artifact is stale/u);
});

test('el build mantiene conectado el iniciador y el watcher no lo regenera directamente', () => {
  const build = fs.readFileSync('scripts/docs/build-plan-canonico.mjs', 'utf8');
  const watcher = fs.readFileSync('scripts/docs/watch-plan-canonico.mjs', 'utf8');
  const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  assert.match(build, /writeChatgptWorkStarter/u);
  assert.doesNotMatch(watcher, /writeChatgptWorkStarter/u);
  assert.doesNotMatch(watcher, /writeImplementationControlArtifacts/u);
  assert.doesNotMatch(watcher, /writeCurrentTaskDevelopmentArtifacts/u);
  assert.doesNotMatch(watcher, /rebuild\("verificación inicial"\)/u);
  assert.match(watcher, /verifyInitialState/u);
  assert.match(watcher, /endsWith\("\.txt"\)/u);
  assert.match(packageJson.scripts['docs:plan:check'], /chatgpt-work-starter\.mjs --check/u);
  assert.equal(packageJson.scripts['docs:chatgpt:starter'], 'node scripts/docs/chatgpt-work-starter.mjs');
});
