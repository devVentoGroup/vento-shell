import { existsSync, readFileSync, watch } from "node:fs";
import { spawn } from "node:child_process";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { derivePreflight } from "./canonical-task-preflight.mjs";
import { deriveImplementationControl } from "./implementation-control.mjs";
import {
  acquireWatcherLock,
  registerPendingChange,
  releaseWatcherLock,
  writePlanWatchStatus,
} from "./plan-watch-runtime.mjs";

function terminalSafeText(value) {
  const replacements = new Map([
    ['\u279c', '->'],
    ['\u2192', '->'],
    ['\u2705', 'PASS'],
    ['\u274c', 'FAIL'],
    ['\u23f3', 'WAIT'],
    ['\u21bb', 'RETRY'],
    ['\u25b6', '>'],
    ['\u2014', '-'],
    ['\u2013', '-'],
    ['\u201c', '"'],
    ['\u201d', '"'],
    ['\u2018', "'"],
    ['\u2019', "'"],
  ]);
  let source = String(value ?? '');
  for (const [symbol, replacement] of replacements) {
    source = source.replaceAll(symbol, replacement);
  }
  return source
    .normalize('NFKD')
    .replace(/\p{M}/gu, '')
    .replace(/[^\x09\x0A\x0D\x20-\x7E]/gu, '?');
}

function installTerminalSafeConsole() {
  for (const level of ['log', 'warn', 'error']) {
    const original = console[level].bind(console);
    console[level] = (...args) => original(
      ...args.map((value) => typeof value === 'string' ? terminalSafeText(value) : value),
    );
  }
}

installTerminalSafeConsole();

const currentFile = fileURLToPath(import.meta.url);
const currentDirectory = path.dirname(currentFile);

const repositoryRoot = path.resolve(currentDirectory, "../..");
const watchedDirectory = path.join(
  repositoryRoot,
  "docs",
  "plan-canonico",
  "modular"
);

const fullBuildScript = path.join(
  repositoryRoot,
  "scripts",
  "docs",
  "build-plan-canonico.mjs"
);

const checkScript = path.join(
  repositoryRoot,
  "scripts",
  "docs",
  "build-plan-canonico-core.mjs"
);

const pendingTaskContextCheckScript = path.join(
  repositoryRoot,
  "scripts",
  "docs",
  "sync-pending-task-context.mjs"
);

const retiredPriorityRouteCheckScript = path.join(
  repositoryRoot,
  "scripts",
  "docs",
  "normalize-retired-priority-route.mjs"
);

const repositoryDriftScript = path.join(
  repositoryRoot,
  "scripts",
  "docs",
  "repository-drift.mjs"
);

const repositoryDriftBaseline = path.join(
  repositoryRoot,
  ".delivery",
  "repository-drift-baseline.json"
);

const watcherLockPath = path.join(
  repositoryRoot,
  ".delivery",
  "plan-watch.lock.json"
);

const watcherStatusPath = path.join(
  repositoryRoot,
  ".delivery",
  "plan-status.md"
);

const watcherStartedAt = new Date().toISOString();
const watcherLock = acquireWatcherLock({
  lockPath: watcherLockPath,
  startedAt: watcherStartedAt,
});

if (!watcherLock.acquired) {
  console.log(
    `[PLAN CANÓNICO] Watcher ya activo con PID ${watcherLock.lock.pid}; `
    + "esta instancia finaliza sin duplicarlo."
  );
  process.exit(0);
}

if (watcherLock.reclaimed) {
  console.log("[PLAN CANÓNICO] Lock obsoleto recuperado de forma segura.");
}

const driftIntervalMs = 30 * 60 * 1000;
let lastDriftAt = 0;

const ignoredDirectories = new Set([
  ".generated",
  "respaldo",
  ".git",
  "node_modules",
]);

const synchronizedBuildOutputs = new Set([
  "00_CABECERA_Y_ESTADO.md",
  "active-sequence.json",
  "90_ORDEN_DE_IMPLEMENTACION.md",
]);

function isSynchronizedBuildOutput(relativePath) {
  return synchronizedBuildOutputs.has(relativePath)
    || /^bloques\/E1_DESCUBRIMIENTO_OPERATIVO\/04A_\d{2}_.+\.md$/u.test(relativePath);
}

let debounceTimer = null;
let buildRunning = false;
let buildPending = false;
let initialVerificationRunning = true;
let buildSequence = 0;
let changeVersion = 0;
const pendingChanges = new Set();
let waitingJsonSignature = null;
let lastObservedPreflight = null;
let lastImplementationControl = null;
let lastBuild = {
  buildId: null,
  reason: "arranque de solo lectura",
  result: "PENDIENTE",
  message: "El watcher todavía no ha completado su comprobación inicial de solo lectura.",
};

function publishStatus(state, overrides = {}) {
  try {
    lastObservedPreflight = derivePreflight({ root: repositoryRoot });
    lastImplementationControl = deriveImplementationControl({
      root: repositoryRoot,
      preflight: lastObservedPreflight,
    });
  } catch {
    // Conserva la última continuidad legible si la fuente está transitoriamente incompleta.
  }
  writePlanWatchStatus(watcherStatusPath, {
    state,
    pid: process.pid,
    startedAt: watcherStartedAt,
    pendingChanges: pendingChanges.size,
    preflight: lastObservedPreflight,
    implementationControl: lastImplementationControl,
    ...lastBuild,
    ...overrides,
  });
}

function normalizeRelativePath(filename) {
  return String(filename ?? "").replaceAll("\\", "/");
}

function shouldProcess(filename) {
  const relativePath = normalizeRelativePath(filename);

  if (!relativePath) {
    return false;
  }

  const pathParts = relativePath.split("/");

  if (pathParts.some((part) => ignoredDirectories.has(part))) {
    return false;
  }

  return (
    relativePath.endsWith(".md") ||
    relativePath.endsWith(".txt") ||
    relativePath.endsWith(".json")
  );
}

function runNodeScript(args, label) {
  return new Promise((resolve, reject) => {
    console.log(`\n[PLAN CANÓNICO] ${label}`);

    const child = spawn(process.execPath, args, {
      cwd: repositoryRoot,
      stdio: "inherit",
      windowsHide: true,
    });

    child.on("error", (error) => {
      reject(error);
    });

    child.on("exit", (exitCode) => {
      if (exitCode === 0) {
        resolve();
        return;
      }

      reject(
        new Error(
          `${label} terminó con código de salida ${exitCode}.`
        )
      );
    });
  });
}

async function runRepositoryDriftIfDue() {
  const now = Date.now();
  if (now - lastDriftAt < driftIntervalMs) {
    return;
  }
  const driftArgs = [repositoryDriftScript];
  if (!existsSync(repositoryDriftBaseline)) {
    driftArgs.push("--write-baseline");
  }
  await runNodeScript(
    driftArgs,
    "Inventariando deriva multi-repositorio de solo lectura..."
  );
  lastDriftAt = now;
}

async function verifyInitialState() {
  console.log("\n[PLAN CANÓNICO] Verificación inicial de solo lectura.");
  lastBuild = {
    buildId: null,
    reason: "arranque de solo lectura",
    result: "EN CURSO",
    message: "Comprobando fuentes canónicas sin reconstruir artefactos.",
  };
  publishStatus("VERIFICANDO");

  try {
    await runNodeScript(
      [checkScript, "--check"],
      "Comprobando fuentes y compilado sin escribir..."
    );
    await runNodeScript(
      [pendingTaskContextCheckScript, "--check"],
      "Comprobando guía derivada de tareas pendientes sin escribir..."
    );
    await runNodeScript(
      [retiredPriorityRouteCheckScript, "--check"],
      "Comprobando rutas y destinos de implementación sin escribir..."
    );

    if (existsSync(repositoryDriftBaseline)) {
      await runNodeScript(
        [repositoryDriftScript],
        "Comprobando deriva multi-repositorio sin alterar baseline..."
      );
      lastDriftAt = Date.now();
    } else {
      console.log(
        "[PLAN CANÓNICO] Deriva multi-repositorio omitida al arrancar: no existe baseline y el modo inicial no crea archivos."
      );
    }

    lastBuild = {
      buildId: null,
      reason: "arranque de solo lectura",
      result: "OK",
      message: "Fuentes comprobadas sin rebuild ni cambios versionados.",
    };
    publishStatus("VIGILANDO");
    console.log("[PLAN CANÓNICO] ✅ Arranque verificado en modo solo lectura.");
  } catch (error) {
    console.error("\n[PLAN CANÓNICO] ❌ Verificación inicial fallida:");
    console.error(error instanceof Error ? error.message : error);
    lastBuild = {
      buildId: null,
      reason: "arranque de solo lectura",
      result: "ERROR",
      message: error instanceof Error ? error.message : String(error),
    };
    publishStatus("VIGILANDO");
  } finally {
    initialVerificationRunning = false;
    if (buildPending) {
      buildPending = false;
      console.log(
        "[PLAN CANÓNICO] ↻ Se detectaron cambios durante la verificación inicial; se procesarán ahora."
      );
      void rebuild("cambios guardados durante verificación inicial");
      return;
    }
    console.log("[PLAN CANÓNICO] Esperando cambios...");
  }
}

async function rebuild(reason) {
  if (initialVerificationRunning) {
    buildPending = true;
    console.log(
      "[PLAN CANÓNICO] ⏳ Cambio recibido durante la verificación inicial; quedó en cola."
    );
    return;
  }

  if (buildRunning) {
    buildPending = true;
    console.log(
      "[PLAN CANÓNICO] ⏳ Ya hay una compilación en curso; este lote quedó en cola."
    );
    return;
  }

  buildRunning = true;
  buildPending = false;
  const buildId = ++buildSequence;
  const buildVersion = changeVersion;

  console.log(
    `\n[PLAN CANÓNICO] ▶ Compilación #${buildId} iniciada (${reason}).`
  );
  lastBuild = {
    buildId,
    reason,
    result: "EN CURSO",
    message: "Compilando y validando fuentes canónicas.",
  };
  publishStatus("COMPILANDO");

  try {
    await runNodeScript(
      [fullBuildScript],
      "Sincronizando continuidad, cabecera, registros global/TREQ, guía pendiente y documento compilado..."
    );

    if (changeVersion !== buildVersion) {
      console.log(
        `[PLAN CANÓNICO] ↻ Compilación #${buildId}: hubo nuevos guardados durante la generación; `
        + "se omite la validación intermedia y se procesará el lote más reciente."
      );
      return;
    }

    await runNodeScript(
      [checkScript, "--check"],
      "Validando documento compilado..."
    );

    await runNodeScript(
      [pendingTaskContextCheckScript, "--check"],
      "Validando guía derivada de tareas pendientes..."
    );

    await runNodeScript(
      [retiredPriorityRouteCheckScript, "--check"],
      "Validando rutas y destinos de implementación..."
    );

    await runRepositoryDriftIfDue();

    if (changeVersion !== buildVersion) {
      console.log(
        `[PLAN CANÓNICO] ↻ Compilación #${buildId}: llegó un nuevo guardado durante la validación; `
        + "el resultado final se confirmará con el siguiente lote."
      );
      return;
    }

    console.log(
      `\n[PLAN CANÓNICO] ✅ Compilación #${buildId}: compilado actualizado y validado.`
    );
    lastBuild = {
      buildId,
      reason,
      result: "OK",
      message: "Compilado actualizado y validado por el build único.",
    };
    publishStatus("VIGILANDO");
    if (lastImplementationControl) {
      console.log(
        `[PLAN CANÓNICO] ➜ ACCIÓN PRINCIPAL: ${lastImplementationControl.primaryAction.type} `
        + `${lastImplementationControl.primaryAction.target}`
      );
      console.log(
        `[PLAN CANÓNICO]   Carril documental: ${lastImplementationControl.documentary.state} `
        + `${lastImplementationControl.documentary.taskId}`
      );
      console.log("[PLAN CANÓNICO]   Iniciador ChatGPT: INICIADOR_VENTO_ACTUAL.txt");
    }
  } catch (error) {
    if (changeVersion !== buildVersion) {
      console.log(
        `[PLAN CANÓNICO] ↻ Compilación #${buildId} sustituida por un guardado más reciente; `
        + "el resultado se evaluará cuando el nuevo lote esté completo."
      );
      return;
    }
    console.error(
      `\n[PLAN CANÓNICO] ❌ Compilación #${buildId} fallida:`
    );
    console.error(error instanceof Error ? error.message : error);
    lastBuild = {
      buildId,
      reason,
      result: "ERROR",
      message: error instanceof Error ? error.message : String(error),
    };
    publishStatus("VIGILANDO");
  } finally {
    buildRunning = false;

    if (buildPending) {
      console.log(
        "[PLAN CANÓNICO] ↻ Procesando ahora el lote que estaba en cola."
      );
      void rebuild("lote pendiente");
      return;
    }

    console.log("[PLAN CANÓNICO] Esperando cambios...");
  }
}

function invalidPendingJsonFiles() {
  const invalid = [];
  for (const relativePath of pendingChanges) {
    if (!relativePath.endsWith(".json")) continue;
    const filePath = path.join(watchedDirectory, relativePath);
    if (!existsSync(filePath)) continue;
    try {
      JSON.parse(readFileSync(filePath, "utf8"));
    } catch (error) {
      invalid.push({
        relativePath,
        message: error instanceof Error ? error.message : String(error),
      });
    }
  }
  return invalid;
}

function flushStableBatch() {
  const invalidJson = invalidPendingJsonFiles();
  if (invalidJson.length > 0) {
    const signature = invalidJson.map(({ relativePath, message }) => (
      `${relativePath}: ${message}`
    )).join(" | ");
    if (signature !== waitingJsonSignature) {
      console.log(
        `[PLAN CANÓNICO] ⏳ JSON todavía guardándose; compilación pospuesta: ${signature}`
      );
      waitingJsonSignature = signature;
    }
    publishStatus("ESPERANDO_JSON_COMPLETO");
    debounceTimer = setTimeout(flushStableBatch, 1000);
    return;
  }

  waitingJsonSignature = null;
  console.log(
    `[PLAN CANÓNICO] Aplicando lote estable de ${pendingChanges.size} archivo(s).`
  );
  pendingChanges.clear();
  void rebuild("cambios guardados");
}

function scheduleRebuild(filename) {
  const relativePath = normalizeRelativePath(filename);

  if (buildRunning && isSynchronizedBuildOutput(relativePath)) {
    console.log(
      `[PLAN CANÓNICO] Cambio interno ignorado durante la compilación: ${relativePath}`
    );
    return;
  }

  clearTimeout(debounceTimer);
  changeVersion += 1;
  const firstInBatch = registerPendingChange(pendingChanges, relativePath);
  publishStatus(buildRunning ? "COMPILANDO" : "VIGILANDO");

  if (firstInBatch) {
    console.log(
      `[PLAN CANÓNICO] Cambio detectado: ${relativePath}`
    );
  }

  debounceTimer = setTimeout(flushStableBatch, 2000);
}

console.log("[PLAN CANÓNICO] Vigilancia automática iniciada.");
console.log(`[PLAN CANÓNICO] Carpeta: ${watchedDirectory}`);
console.log("[PLAN CANÓNICO] Arranque: comprobación de solo lectura; no se ejecutará build hasta detectar un cambio documental real.");
publishStatus("VERIFICANDO");

const watcher = watch(
  watchedDirectory,
  {
    recursive: true,
    persistent: true,
  },
  (eventType, filename) => {
    if (!shouldProcess(filename)) {
      return;
    }

    scheduleRebuild(filename);
  }
);

watcher.on("error", (error) => {
  console.error("[PLAN CANÓNICO] Error del watcher:", error);
  lastBuild = {
    ...lastBuild,
    result: "ERROR",
    message: error instanceof Error ? error.message : String(error),
  };
  publishStatus("ERROR");
  process.exitCode = 1;
});

let shuttingDown = false;

function shutdown(signal) {
  if (shuttingDown) return;
  shuttingDown = true;
  console.log(`\n[PLAN CANÓNICO] Vigilancia finalizada (${signal}).`);
  publishStatus("DETENIDO", {
    message: `Watcher detenido por ${signal}.`,
  });
  watcher.close();
  releaseWatcherLock({ lockPath: watcherLockPath });
  process.exit(0);
}

process.on("SIGINT", () => shutdown("SIGINT"));
process.on("SIGTERM", () => shutdown("SIGTERM"));
process.on("exit", () => {
  releaseWatcherLock({ lockPath: watcherLockPath });
});

void verifyInitialState();