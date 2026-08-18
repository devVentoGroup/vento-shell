import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
  actionResponseContract,
  buildChatgptWorkStarter,
} from './chatgpt-work-starter.mjs';

test('genera un único iniciador desde la acción operativa vigente', () => {
  const result = buildChatgptWorkStarter();
  assert.match(result.source, /^VENTO OS — INICIADOR CANÓNICO DE TRABAJO/u);
  assert.match(result.source, /ACCIÓN PRINCIPAL OBLIGATORIA/u);
  assert.match(result.source, new RegExp(`Objetivo exacto: ${result.control.primaryAction.target}`, 'u'));
  assert.match(result.source, /CONTRATO OBLIGATORIO DE LA RESPUESTA Y DEL PASO MANUAL/u);
  assert.match(result.source, /PASOS EXACTOS PARA EL USUARIO/u);
  assert.match(result.source, /Operador que realiza los cambios: USUARIO HUMANO/u);
  assert.match(result.source, /Interacción: TRANSACCIÓN CONTINUA \+ UNA SOLA BATERÍA FINAL/u);
  assert.match(result.source, /Watcher durante implementación física: APAGADO/u);
  assert.match(result.source, /Preflight físico: UNA VEZ/u);
  assert.match(result.source, /Preflight PASS: CONTINUAR LOCALMENTE SIN VOLVER AL CHAT/u);
  assert.match(result.source, /Batería final PASS: CONTINUAR LOCALMENTE HASTA VERIFIED SIN VOLVER AL CHAT/u);
  assert.match(result.source, /Gates intermedios rutinarios: PROHIBIDOS/u);
  assert.match(result.source, /Raíz local exacta del repositorio: .+vento-shell/u);
  assert.match(result.source, /HISTORIAL FÍSICO ACUMULATIVO/u);
  assert.match(result.source, /Modo de almacenamiento: UN ARCHIVO POR INSTANCIA/u);
  assert.match(result.source, /CONTENIDO LOCAL EXACTO DEL REGISTRO ACTIVO/u);
  assert.match(result.source, /Escrituras del asistente en archivos o repositorios: NO AUTORIZADAS/u);
  assert.match(result.source, /AUTORIZO EJECUCION ASISTIDA DEL PASO N/u);
  assert.match(result.source, /Regeneración ligera de control: npm run docs:implementation:status/u);
  assert.match(result.source, /Regeneración ligera del Iniciador: npm run docs:chatgpt:starter/u);
  assert.match(result.source, /Contrato propietario SHA-256: [a-f0-9]{64}/u);
  assert.doesNotMatch(result.source, /\{\{CURRENT_WORK\}\}/u);
  assert.equal(result.outputPath.endsWith('INICIADOR_VENTO_ACTUAL.txt'), true);
});

test('ejecutar implementación entrega una transacción continua hasta VERIFIED', () => {
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
  assert.match(source, /AUTHORIZED a IN_PROGRESS/u);
  assert.match(source, /--instance-id SHELL-CI-001::GLOBAL --json --strict/u);
  assert.match(source, /Si es 0, continúa sin volver al chat/u);
  assert.match(source, /todos los cambios físicos deterministas/u);
  assert.match(source, /contenido completo sin elipsis/u);
  assert.match(source, /a IMPLEMENTED/u);
  assert.match(source, /una sola batería final/u);
  assert.match(source, /mismo bloque continúa hasta VERIFIED/u);
  assert.match(source, /No vuelvas a ejecutar la batería después de PASS completo/u);
});

test('IN_PROGRESS con preflight vigente no obliga a repetirlo', () => {
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

  assert.match(source, /Si la evidencia vigente confirma que el preflight estricto/u);
  assert.match(source, /no lo repitas/u);
  assert.match(source, /una sola batería final/u);
});

test('IMPLEMENTED salta preflight y entra directamente a batería final', () => {
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

test('la autorización conserva ledger y entrega también el lote físico condicionado', () => {
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
  assert.match(source, /un único commit\/sync del lote completo/u);
  assert.doesNotMatch(source, /comprobar el cambio a INICIAR_IMPLEMENTACION/u);
});

test('las acciones conservan guía humana y prohíben micro-gates', () => {
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
    assert.match(source, /AUTORIZO EJECUCION ASISTIDA DEL PASO N/u);
  }
});

test('la plantilla global conserva modo humano, watcher apagado y validación final única', () => {
  const template = fs.readFileSync(
    'docs/plan-canonico/modular/chatgpt-work-starter-template.txt',
    'utf8',
  );
  assert.match(template, /MODO PREDETERMINADO DE IMPLEMENTACIÓN HUMANA/u);
  assert.match(template, /el usuario humano crea, modifica, reemplaza y elimina archivos/u);
  assert.match(template, /ChatGPT entrega seguidos todos los pasos/u);
  assert.match(template, /no se pausa entre pasos por rutina ni para pedir `HECHO`/u);
  assert.match(template, /RESULTADO DEL PASO N/u);
  assert.match(template, /un archivo por instancia/u);
  assert.match(template, /watcher crea automáticamente su archivo exacto/u);
  assert.match(template, /usuario nunca crea manualmente el archivo/u);
  assert.match(template, /nunca se reemplaza un arreglo global `instances`/u);
  assert.match(template, /FLUJO RÁPIDO DE IMPLEMENTACIÓN FÍSICA/u);
  assert.match(template, /watcher debe permanecer apagado/u);
  assert.match(template, /una sola batería final/u);
  assert.match(template, /npm run docs:implementation:status/u);
  assert.match(template, /npm run docs:chatgpt:starter/u);
  assert.match(template, /Push Protection/u);
  assert.match(template, /AUTORIZO EJECUCION ASISTIDA DEL PASO 3/u);
  assert.match(template, /“haz la acción principal” no autorizan escrituras automáticas/u);
});

test('el build, check y watcher mantienen conectado el iniciador', () => {
  const build = fs.readFileSync('scripts/docs/build-plan-canonico.mjs', 'utf8');
  const watcher = fs.readFileSync('scripts/docs/watch-plan-canonico.mjs', 'utf8');
  const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  assert.match(build, /writeChatgptWorkStarter/u);
  assert.match(watcher, /writeChatgptWorkStarter/u);
  assert.match(watcher, /endsWith\("\.txt"\)/u);
  assert.match(packageJson.scripts['docs:plan:check'], /chatgpt-work-starter\.mjs --check/u);
  assert.equal(packageJson.scripts['docs:chatgpt:starter'], 'node scripts/docs/chatgpt-work-starter.mjs');
});
