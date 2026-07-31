from __future__ import annotations

from pathlib import Path
import subprocess
import sys
import textwrap

ROOT = Path(__file__).resolve().parents[2]
WORKFLOW = ROOT / ".github/workflows/apply-viso-schedule-plan-delta.yml"
TEMP_FILES = [
    ROOT / ".github/workflows/apply-viso-schedule-plan-delta.yml",
    ROOT / ".github/workflows/trigger-viso-schedule-plan-delta.yml",
    Path(__file__).resolve(),
]


def run(command: str) -> None:
    print(f"\n> {command}", flush=True)
    completed = subprocess.run(command, cwd=ROOT, shell=True)
    if completed.returncode != 0:
        raise SystemExit(completed.returncode)


def main() -> None:
    if not WORKFLOW.exists():
        raise SystemExit("No existe el archivo temporal con el parche embebido.")

    status = subprocess.run(
        "git status --porcelain",
        cwd=ROOT,
        shell=True,
        check=True,
        capture_output=True,
        text=True,
    ).stdout.strip()
    if status:
        raise SystemExit(
            "El repositorio tiene cambios locales sin guardar. Haz commit o descártalos antes de ejecutar este script."
        )

    source = WORKFLOW.read_text(encoding="utf-8")
    marker_start = "          python3 <<'PY'\n"
    marker_end = "\n          PY\n"
    start = source.index(marker_start) + len(marker_start)
    end = source.index(marker_end, start)
    patch_code = textwrap.dedent(source[start:end])

    print("Aplicando cambios restantes del delta VISO Schedule...", flush=True)
    exec(compile(patch_code, "apply-viso-schedule-plan-delta.py", "exec"), {})

    validations = [
        "npm run docs:plan:build",
        "npm run docs:plan:check",
        "npm run docs:plan:test",
        "npm run docs:treq:check",
        "npm run docs:treq:test",
        "npm run docs:process-apps:check",
        "npm run docs:screens:check",
        "npm run docs:screen-processes:check",
        "npm run docs:screen-matrices:check",
        "git diff --check",
    ]
    for command in validations:
        run(command)

    for path in TEMP_FILES:
        if path.exists():
            path.unlink()

    run("git add -A")

    staged = subprocess.run(
        "git diff --cached --quiet",
        cwd=ROOT,
        shell=True,
    )
    if staged.returncode == 0:
        print("No había cambios restantes por confirmar.")
        return
    if staged.returncode != 1:
        raise SystemExit(staged.returncode)

    run('git commit -m "docs: complete VISO schedule plan cascade"')
    run("git push origin main")

    print("\nLISTO: cambios aplicados, validados, confirmados y enviados a main.")


if __name__ == "__main__":
    main()
