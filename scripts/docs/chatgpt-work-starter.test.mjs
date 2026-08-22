import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
  actionResponseContract,
  buildChatgptWorkStarter,
  CHATGPT_STARTER_PATHS,
} from './chatgpt-work-starter.mjs';

test('genera dos iniciadores separados por intención y un selector legacy mínimo', () => {
  const result = buildChatgptWorkStarter();

  assert.equal(CHATGPT_STARTER_PATHS.documentation, '.delivery/INICIADOR_VENTO_DOCUMENTACION.txt');
  assert.equal(CHATGPT_STARTER_PATHS.implementation, '.delivery/INICIADOR_VENTO_IMPLEMENTACION.txt');
  assert.equal(CHATGPT_STARTER_PATHS.selector, 'INICIADOR_VENTO_ACTUAL.txt');

  assert.match(result.source, /^VENTO OS — SELECTOR DE INICIADOR POR INTENCIÓN/u);
  assert.match(result.source, /INICIADOR_VENTO_DOCUMENTACION\.txt/u);
  assert.match(result.source, /INICIADOR_VENTO_IMPLEMENTACION\.txt/u);
  assert.match(result.source, /Nunca cargues ambos/u);
  assert.doesNotMatch(result.source, /CONTENIDO CANÓNICO DE LA TAREA OBJETIVO/u);

  assert.match(result.documentationSource, /INTENT_LOCK: DOCUMENTATION/u);
  assert.match(result.documentationSource, /CONVERSATION_LANE: DOCUMENTARY/u);
  assert.match(result.documentationSource, /DO_NOT_SWITCH_LANES: TRUE/u);
  assert.match(
    result.documentationSource,
    new RegExp(`ID: ${result.control.documentary.taskId}`, 'u'),
  );
  assert.match(result.documentationSource, /CONTENIDO CANÓNICO DE LA TAREA OBJETIVO/u);
  assert.match(result.documentationSource, /FORMATO_ENTREGA_VENTO_V1/u);
  assert.match(result.documentationSource, /exactamente estas ocho secciones/u);
  assert.match(result.documentationSource, /NO autorices implementaciones/u);
  assert.match(result.documentationSource, /NO ejecutes implementaciones/u);
  assert.doesNotMatch(result.documentationSource, /REGISTRO ACTIVO EXACTO/u);
  assert.doesNotMatch(result.documentationSource, /HISTORIAL FÍSICO RESUMIDO/u);
  assert.doesNotMatch(result.documentationSource, /quality:repair/u);
  assert.doesNotMatch(result.documentationSource, /docs:implementation:start/u);
  assert.match(result.documentationSource, /ENTREGA DOCUMENTAL AUTOCONTENIDA OBLIGATORIA/u);
  assert.match(result.documentationSource, /FUENTES OBLIGATORIAS ANTES DE TRABAJAR UNA TAREA/u);
  assert.match(result.documentationSource, /PREENTREGA OBLIGATORIA Y POWERSHELL SEGURO/u);
  assert.match(result.documentationSource, /FORMATO DE TAREAS DOCUMENTALES/u);
  assert.match(result.documentationSource, /REGISTRO 04A/u);
  assert.match(result.documentationSource, /docs:task:quality/u);
  assert.match(result.documentationSource, /docs:delivery:check/u);
  assert.match(result.documentationSource, /docs:plan:build/u);
  assert.match(result.documentationSource, /docs:task:finish -- --task-id/u);
  assert.match(result.documentationSource, /NEXT_TASK_ALLOWED: SI/u);
  assert.doesNotMatch(result.documentationSource, /DOCUMENTATION_ONLY/u);

  assert.match(result.implementationSource, /INTENT_LOCK: PHYSICAL_IMPLEMENTATION/u);
  assert.match(result.implementationSource, /CONVERSATION_LANE: PHYSICAL/u);
  assert.match(result.implementationSource, /DO_NOT_SWITCH_LANES: TRUE/u);
  assert.match(result.implementationSource, /CARRIL DOCUMENTAL — SOLO ESTADO INFORMATIVO|NO EXISTE UNA INSTANCIA FÍSICA ACTIVA/u);

  if (result.control.physical.active) {
    assert.match(
      result.implementationSource,
      new RegExp(result.control.physical.active.instanceId.replace(/[.*+?^${}()|[\]\\]/gu, '\\$&'), 'u'),
    );
    assert.match(result.implementationSource, /REGISTRO ACTIVO EXACTO/u);
    assert.match(result.implementationSource, /HISTORIAL FÍSICO RESUMIDO/u);
    assert.match(result.implementationSource, /docs:implementation:start/u);
    assert.match(result.implementationSource, /quality:repair/u);
    assert.match(result.implementationSource, /docs:implementation:finish/u);
    assert.match(result.implementationSource, /ENTREGA FÍSICA AUTOCONTENIDA OBLIGATORIA/u);
    assert.match(result.implementationSource, /MODO PREDETERMINADO DE IMPLEMENTACIÓN HUMANA/u);
    assert.match(result.implementationSource, /FLUJO RÁPIDO DE IMPLEMENTACIÓN FÍSICA/u);
    assert.match(result.implementationSource, /READY_TO_RESTART_WATCHER: SI/u);
    assert.match(result.implementationSource, /RESULTADO PARA CHATGPT/u);
    assert.doesNotMatch(result.implementationSource, /FORMATO DE TAREAS DOCUMENTALES/u);
    assert.doesNotMatch(result.implementationSource, /La fuente física canónica actual del registro/u);
    assert.doesNotMatch(result.implementationSource, /docs:task:quality/u);
    assert.doesNotMatch(result.implementationSource, /docs:delivery:check/u);
    assert.doesNotMatch(result.implementationSource, /DOCUMENTATION_ONLY/u);
  } else {
    assert.match(result.implementationSource, /NO EXISTE UNA INSTANCIA FÍSICA ACTIVA/u);
    assert.doesNotMatch(result.implementationSource, /REGISTRO ACTIVO EXACTO/u);
  }
});

test('la plantilla compartida contiene solo reglas comunes y una ranura', () => {
  const template = fs.readFileSync(
    'docs/plan-canonico/modular/chatgpt-work-starter-template.txt',
    'utf8',
  );

  assert.equal(template.split('{{CURRENT_WORK}}').length, 2);
  assert.match(template, /SELECCIÓN DE CARRIL/u);
  assert.match(template, /INTENT_LOCK/u);
  assert.match(template, /Nunca combines ambos payloads/u);
  assert.match(template, /FORMATO_ENTREGA_VENTO_V1/u);
  assert.match(template, /FUENTES OBLIGATORIAS ANTES DE TRABAJAR UNA TAREA/u);
  assert.match(template, /PREENTREGA OBLIGATORIA Y POWERSHELL SEGURO/u);
  assert.match(template, /LECTURA DE ARCHIVOS GRANDES Y RESPUESTAS TRUNCADAS/u);
  assert.match(template, /REGLA DE SALIDA COMPACTA DE BATERÍAS Y COMPROBACIONES/u);
  assert.match(template, /REGLA DE SEGURIDAD DE TERMINAL INTERACTIVA/u);
  assert.match(template, /REGLA DE SALIDA ASCII SEGURA EN TERMINAL/u);
  assert.doesNotMatch(template, /FLUJO RÁPIDO DE IMPLEMENTACIÓN FÍSICA/u);
  assert.doesNotMatch(template, /docs:implementation:start/u);
  assert.doesNotMatch(template, /docs:implementation:finish/u);

  // Compatibilidad con el lifecycle documental histórico:
  // la plantilla compartida conserva únicamente la regla de apertura/cierre
  // documental exigida por task-branch-lifecycle, sin incorporar payload físico.
  assert.match(template, /REGLA OBLIGATORIA DE RAMA POR TAREA Y CIERRE EN MAIN/u);
  assert.match(template, /docs:task:start/u);
  assert.match(template, /docs:task:finish/u);
  assert.match(template, /NEXT_TASK_ALLOWED: SI/u);
});

test('el contrato físico conserva lifecycle, reparación y autorización explícita', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'AUTORIZAR_IMPLEMENTACION',
      target: 'SHELL-CI-001::GLOBAL',
    },
    physical: {
      active: {
        instanceId: 'SHELL-CI-001::GLOBAL',
        status: 'PENDING_AUTHORIZATION',
        recordPath: 'docs/plan-canonico/modular/implementation-instances/SHELL-CI-001__GLOBAL.json',
      },
    },
  }, 'a'.repeat(64));

  assert.match(source, /FORMATO_ENTREGA_VENTO_V1/u);
  assert.match(source, /usuario humano/u);
  assert.match(source, /AUTORIZO EJECUCION ASISTIDA DEL PASO N/u);
  assert.match(source, /docs:implementation:start -- --instance-id SHELL-CI-001::GLOBAL/u);
  assert.match(source, /quality:repair/u);
  assert.match(source, /READY_FOR_VALIDATION: SI/u);
  assert.match(source, /validation_commands/u);
  assert.match(source, /docs:implementation:finish -- --instance-id SHELL-CI-001::GLOBAL/u);
  assert.match(source, /status AUTHORIZED/u);
  assert.match(source, /source_contract_sha256/u);
  assert.match(source, new RegExp('a{64}', 'u'));
  assert.match(source, /evidence permanece \[\]/u);
});