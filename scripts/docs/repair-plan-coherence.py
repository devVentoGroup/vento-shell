#!/usr/bin/env python3
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
MODULAR = ROOT / "docs" / "plan-canonico" / "modular"


def replace_required(text: str, old: str, new: str, *, minimum: int = 1) -> str:
    count = text.count(old)
    if count < minimum:
        raise RuntimeError(f"No se encontró el patrón requerido ({minimum}+): {old!r}")
    return text.replace(old, new)


def patch_coverage() -> None:
    path = MODULAR / "bloques" / "E1_DESCUBRIMIENTO_OPERATIVO" / "05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md"
    text = path.read_text(encoding="utf-8")

    text = replace_required(
        text,
        "BLOQUE Y — Tecnología y soporte",
        "BLOQUE Z — Tecnología y soporte",
        minimum=20,
    )
    text = replace_required(
        text,
        "docs/plan-canonico/modular/bloques/Y_TECNOLOGIA_Y_SOPORTE/00_BLOQUE_Y.md",
        "docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/00_BLOQUE_Z.md",
    )
    text = replace_required(
        text,
        "el BLOQUE Y los referenciará como dependencias",
        "el BLOQUE Z los referenciará como dependencias",
    )
    text = replace_required(
        text,
        "NEXO-DOM-034; CAP-SCOPE-003; VISO-UX-032 a VISO-UX-039",
        "NEXO-DOM-034; CAP-SCOPE-003; PROC-CAT-009 a PROC-CAT-018; PROC-ACTOR-003; UX-ADMIN-001 a UX-ADMIN-005",
    )
    text = replace_required(
        text,
        "CAP-COVER-001 a CAP-COVER-013",
        "CAP-COVER-001 a CAP-COVER-012",
    )
    text = replace_required(
        text,
        "CAP-SCOPE-018 — Evaluar continuidad operativa, respaldo y recuperación",
        "CAP-SCOPE-018 — Evaluar continuidad operativa, contingencia, incidentes, respaldo y recuperación",
    )

    # Estados internos obsoletos de tareas ya aprobadas.
    if text.count("**Estado:** PROPUESTA PARA APROBACIÓN") != 4:
        raise RuntimeError("Se esperaban cuatro estados obsoletos en CAP-SCOPE-004 a CAP-SCOPE-007")
    text = text.replace("**Estado:** PROPUESTA PARA APROBACIÓN", "**Estado:** APROBADA")
    text = text.replace("PROPUESTA PARA APROBACIÓN — NO APROBADA", "APROBADA")
    text = text.replace("PROPUESTA PARA APROBACIÓN — APROBADA", "APROBADA")
    text = text.replace(
        "\nNo deberá marcarse como aprobada hasta que el usuario responda expresamente `APROBADO`.\n",
        "\n",
    )
    text = text.replace(
        "\nNo marcar como aprobada hasta recibir confirmación explícita del usuario.\n",
        "\n",
    )

    path.write_text(text, encoding="utf-8")


def patch_map() -> None:
    path = MODULAR / "bloques" / "E1_DESCUBRIMIENTO_OPERATIVO" / "03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md"
    text = path.read_text(encoding="utf-8")
    text = replace_required(
        text,
        "| Estado | PROPUESTA PARA APROBACIÓN |",
        "| Estado | APROBADA |",
    )
    path.write_text(text, encoding="utf-8")


def patch_protocol() -> None:
    path = MODULAR / "01_PROTOCOLO.md"
    text = path.read_text(encoding="utf-8")
    duplicated = (
        "Una tarea no podrá aprobarse cuando contenga un pendiente sin destino\n"
        "o cuando cite una tarea que no exista formalmente en el roadmap.\n\n"
        "Una tarea no podrá aprobarse cuando contenga un pendiente sin destino\n"
        "o cuando cite una tarea que no exista formalmente en el roadmap."
    )
    if duplicated in text:
        text = text.replace(
            duplicated,
            "Una tarea no podrá aprobarse cuando contenga un pendiente sin destino\n"
            "o cuando cite una tarea que no exista formalmente en el roadmap.",
        )
    path.write_text(text, encoding="utf-8")


def normalize_test_headings_and_examples() -> None:
    changed_markers = 0
    for path in MODULAR.rglob("*.md"):
        if ".generated" in path.parts or "respaldo" in path.parts:
            continue
        text = path.read_text(encoding="utf-8")
        original = text
        text = text.replace("#### Requisito de prueba generado", "#### Requisitos de prueba derivados")
        text = text.replace("#### Requisitos de prueba generados", "#### Requisitos de prueba derivados")

        lines = text.splitlines(keepends=True)
        in_fence = False
        for index, line in enumerate(lines):
            if re.match(r"^\s*```", line):
                in_fence = not in_fence
                continue
            if in_fence and re.match(r"^###\s+(?:\[ \]|✅|🟡)\s+[A-Z][A-Z0-9-]*-\d+\s+—", line):
                lines[index] = re.sub(r"^###\s+(?:\[ \]|✅|🟡)\s+", "", line)
                changed_markers += 1
        text = "".join(lines)
        if text != original:
            path.write_text(text, encoding="utf-8")

    if changed_markers < 7:
        raise RuntimeError(f"Se esperaban al menos siete marcadores de ejemplo; se corrigieron {changed_markers}")


def main() -> None:
    patch_coverage()
    patch_map()
    patch_protocol()
    normalize_test_headings_and_examples()
    print("Reparación documental aplicada correctamente")


if __name__ == "__main__":
    main()
