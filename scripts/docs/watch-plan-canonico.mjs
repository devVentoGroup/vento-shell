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

let debounceTimer = null;
let buildRunning = false;
let buildPending = false;
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

async function rebuild() {
  if (buildRunning) {
    buildPending = true;
    return;
  }

  buildRunning = true;
  buildPending = false;

  try {
    await runNodeScript(
      [safeBuildScript],
      "Generando documento compilado..."
    );

    await runNodeScript(
      [checkScript, "--check"],
      "Validando documento compilado..."
    );

    console.log(
      "\n[PLAN CANÓNICO] ✅ Compilado actualizado y validado."
    );
  } catch (error) {
    console.error(
      "\n[PLAN CANÓNICO] ❌ Error durante la compilación:"
    );
    console.error(error instanceof Error ? error.message : error);
  } finally {
    buildRunning = false;

    if (buildPending) {
      rebuild();
    }
  }
}

function scheduleRebuild(filename) {
  clearTimeout(debounceTimer);
  pendingChanges.add(normalizeRelativePath(filename));

  console.log(
    `[PLAN CANÓNICO] Cambio detectado: ${normalizeRelativePath(filename)}`
  );

  debounceTimer = setTimeout(() => {
    console.log(
      `[PLAN CANÓNICO] Aplicando lote estable de ${pendingChanges.size} archivo(s).`
    );
    pendingChanges.clear();
    rebuild();
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
rebuild();
