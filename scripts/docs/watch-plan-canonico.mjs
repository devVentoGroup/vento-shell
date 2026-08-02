import { watch } from "node:fs";
import { spawn } from "node:child_process";
import path from "node:path";
import { fileURLToPath } from "node:url";

const currentFile = fileURLToPath(import.meta.url);
const currentDirectory = path.dirname(currentFile);

const repositoryRoot = path.resolve(currentDirectory, "../..");
const watchedDirectory = path.join(
  repositoryRoot,
  "docs",
  "plan-canonico",
  "modular"
);

const safeBuildScript = path.join(
  repositoryRoot,
  "scripts",
  "docs",
  "safe-build-plan-canonico.mjs"
);

const checkScript = path.join(
  repositoryRoot,
  "scripts",
  "docs",
  "build-plan-canonico-core.mjs"
);

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
  "bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md",
]);

let debounceTimer = null;
let buildRunning = false;
let buildPending = false;
let buildSequence = 0;
let changeVersion = 0;
const pendingChanges = new Set();

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

async function rebuild(reason) {
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

  try {
    await runNodeScript(
      [safeBuildScript],
      "Sincronizando cabecera, registro global, TREQ y documento compilado..."
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
  } catch (error) {
    console.error(
      `\n[PLAN CANÓNICO] ❌ Compilación #${buildId} fallida:`
    );
    console.error(error instanceof Error ? error.message : error);
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

function scheduleRebuild(filename) {
  const relativePath = normalizeRelativePath(filename);

  if (buildRunning && synchronizedBuildOutputs.has(relativePath)) {
    console.log(
      `[PLAN CANÓNICO] Cambio interno ignorado durante la compilación: ${relativePath}`
    );
    return;
  }

  clearTimeout(debounceTimer);
  changeVersion += 1;
  pendingChanges.add(relativePath);

  console.log(
    `[PLAN CANÓNICO] Cambio detectado: ${relativePath}`
  );

  debounceTimer = setTimeout(() => {
    console.log(
      `[PLAN CANÓNICO] Aplicando lote estable de ${pendingChanges.size} archivo(s).`
    );
    pendingChanges.clear();
    void rebuild("cambios guardados");
  }, 2000);
}

console.log("[PLAN CANÓNICO] Vigilancia automática iniciada.");
console.log(`[PLAN CANÓNICO] Carpeta: ${watchedDirectory}`);
console.log("[PLAN CANÓNICO] Esperando cambios...");

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
  process.exitCode = 1;
});

process.on("SIGINT", () => {
  console.log("\n[PLAN CANÓNICO] Vigilancia finalizada.");
  watcher.close();
  process.exit(0);
});

// Garantiza que el compilado esté vigente al iniciar VS Code.
void rebuild("verificación inicial");
