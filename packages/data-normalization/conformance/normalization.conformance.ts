/**
 * Pure conformance corpus and A/B/C certification oracle for SHELL-NORM-009::GLOBAL.
 *
 * This module contains no I/O, persistence, clock, randomness, network, authorization,
 * identity, uniqueness, merge or commit authority. It materializes only the inherited
 * canonical corpus and pure comparison rules needed to certify deterministic evaluation.
 */

export const NORMALIZATION_CONFORMANCE_SUITE_ID =
  'VENTO_NORMALIZATION_IDEMPOTENCY_AND_SEMANTIC_PRESERVATION_CONFORMANCE@1.0.0' as const;

export const INHERITED_CONFORMANCE_CORPUS_SOURCE = 'DATA-NORM-TRANS-002' as const;

export const CONFORMANCE_CORPUS_FAMILIES = [
  "CAPITALIZATION",
  "CONNECTORS",
  "OFFICIAL_EXCEPTIONS",
  "ORTHOGRAPHIC_DICTIONARY",
  "SEARCH_COMPARISON"
] as const;

export const CONFORMANCE_TEST_DIMENSIONS = [
  "DETERMINISM",
  "EVALUATION_IDEMPOTENCY",
  "SEMANTIC_PRESERVATION",
  "NO_UNAUTHORIZED_SIDE_EFFECTS"
] as const;

export const SEMANTIC_PRESERVATION_DIMENSIONS = [
  "COORDINATE",
  "SEMANTIC_CLASS",
  "REPRESENTATION",
  "SOURCE_ROLE",
  "STRUCTURE",
  "PROTECTED_FORM",
  "PROVENANCE",
  "IDENTITY",
  "HISTORY",
  "PRODUCT_BOUNDARY"
] as const;

export const CONFORMANCE_OPERATION_KINDS = [
  "UNICODE_CANONICALIZATION",
  "EDGE_WHITESPACE_TRIM",
  "INTERNAL_WHITESPACE_COMPACTION",
  "PROSE_PUNCTUATION_SPACING",
  "COMMERCIAL_CAPITALIZATION",
  "CONNECTOR_CASE_POLICY",
  "APPROVED_DICTIONARY_CORRECTION",
  "OFFICIAL_EXCEPTION_APPLICATION",
  "TECHNICAL_CANONICALIZATION",
  "SEARCH_KEY_DERIVATION",
  "STRUCTURED_PARSE_OR_RENDER",
  "SOURCE_PROPAGATION_OR_RESYNC",
  "IDENTITY_OR_RECORD_ACTION"
] as const;

export const CONFORMANCE_SEMANTIC_CLASSES = [
  "COMMERCIAL_NAME",
  "STRUCTURED_PRESENTATION_NAME",
  "HUMAN_LABEL",
  "OFFICIAL_LEGAL_NAME",
  "OFFICIAL_BRAND_FORM",
  "PERSON_OR_ACTOR_NAME",
  "ADDRESS_OR_LOCATION_TEXT",
  "FREE_TEXT",
  "CONTROLLED_VOCABULARY_CODE",
  "MEASUREMENT_OR_UNIT_CODE",
  "TECHNICAL_IDENTIFIER",
  "CONTACT_IDENTIFIER",
  "SECRET_OR_SIGNATURE_MATERIAL",
  "UNCLASSIFIED_PRESERVE"
] as const;

export const CONFORMANCE_REPRESENTATION_ROLES = [
  "PRIMARY_VALUE",
  "DISPLAY_OVERRIDE",
  "SEARCH_DERIVATION",
  "EXTERNAL_ORIGINAL",
  "HISTORICAL_SNAPSHOT",
  "OUTPUT_PROJECTION",
  "AUDIT_EVIDENCE"
] as const;

export const CONFORMANCE_SOURCE_ROLES = [
  "AUTHORITATIVE_SOURCE",
  "APPROVED_OVERRIDE",
  "SYNCHRONIZED_COPY",
  "IMMUTABLE_SNAPSHOT",
  "EXTERNAL_EVIDENCE",
  "OUTPUT_ONLY"
] as const;

export const CONFORMANCE_TREATMENT_MODES = [
  "DETERMINISTIC_MUTATION_ALLOWED",
  "DICTIONARY_MUTATION_ALLOWED",
  "DERIVATION_ONLY",
  "VALIDATION_ONLY",
  "HUMAN_REVIEW_REQUIRED",
  "PRESERVE_EXACT",
  "STRUCTURAL_RESOLUTION_REQUIRED",
  "PROHIBITED"
] as const;

export const EXPECTED_CONFORMANCE_FAMILY_COUNTS = {
  "CAPITALIZATION": 16,
  "CONNECTORS": 20,
  "OFFICIAL_EXCEPTIONS": 21,
  "ORTHOGRAPHIC_DICTIONARY": 15,
  "SEARCH_COMPARISON": 17
} as const;


export type ConformanceCorpusFamily = typeof CONFORMANCE_CORPUS_FAMILIES[number];
export type ConformanceTestDimension = typeof CONFORMANCE_TEST_DIMENSIONS[number];
export type SemanticPreservationDimension = typeof SEMANTIC_PRESERVATION_DIMENSIONS[number];

export interface NormalizationConformanceScenario {
  readonly scenario_key: string;
  readonly family: ConformanceCorpusFamily;
  readonly source_task: string;
  readonly source_section: string;
  readonly source_ordinal: number;
  readonly source_cells: readonly [string, string, string];
}


export const NORMALIZATION_CONFORMANCE_CORPUS = [
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::001",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 1,
    "source_cells": [
      "`americano` como `COMMERCIAL_NAME`",
      "`Americano`",
      "sin cambio ortográfico adicional"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::002",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 2,
    "source_cells": [
      "`pan masa madre clasico`",
      "`Pan Masa Madre Clasico`",
      "`Clásico` solo mediante diccionario aprobado"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::003",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 3,
    "source_cells": [
      "`harina de maiz`",
      "`Harina de Maiz`",
      "`Maíz` solo mediante diccionario aprobado"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::004",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 4,
    "source_cells": [
      "`jugo de naranja y mango`",
      "`Jugo de Naranja y Mango`",
      "conectores según catálogo vigente"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::005",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 5,
    "source_cells": [
      "`LATTE FRIO`",
      "`Latte Frio`",
      "`Frío` solo mediante diccionario aprobado"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::006",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 6,
    "source_cells": [
      "`Bebidas calientes`",
      "`Bebidas Calientes`",
      "mantener si ya satisface la regla"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::007",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 7,
    "source_cells": [
      "`3M` dentro de nombre",
      "`3M`",
      "excepción oficial"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::008",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 8,
    "source_cells": [
      "`iPhone` dentro de nombre",
      "`iPhone`",
      "excepción oficial"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::009",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 9,
    "source_cells": [
      "`Coca-Cola` dentro de nombre",
      "`Coca-Cola`",
      "excepción oficial de token o frase"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::010",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 10,
    "source_cells": [
      "`BBQ` dentro de nombre",
      "preservar o revisar",
      "no producir `Bbq` sin catálogo"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::011",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 11,
    "source_cells": [
      "`expresso` con ambigüedad activa",
      "conservar `expresso`",
      "revisión humana; no corregir ortografía"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::012",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 12,
    "source_cells": [
      "`500 g` como presentación",
      "conservar",
      "clase excluida y estructura preservada"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::013",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 13,
    "source_cells": [
      "`COMERCIALIZADORA ABC S.A.S.`",
      "conservar",
      "`OFFICIAL_LEGAL_NAME` excluido"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::014",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 14,
    "source_cells": [
      "`Carlos Ibarra`",
      "conservar",
      "`PERSON_OR_ACTOR_NAME` excluido"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::015",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 15,
    "source_cells": [
      "`NEXO`",
      "conservar",
      "vocabulario o identificador controlado excluido"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-003::CORPUS::016",
    "family": "CAPITALIZATION",
    "source_task": "DATA-NORM-ARC-003",
    "source_section": "25. Corpus mínimo de conformidad",
    "source_ordinal": 16,
    "source_cells": [
      "`Choco Bites` y `Chocobites`",
      "capitalizar cada forma solo si es elegible",
      "no unir, dividir ni fusionar registros"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::001",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 1,
    "source_cells": [
      "`jugo de naranja y mango`",
      "`Jugo de Naranja y Mango`",
      "conectores internos"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::002",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 2,
    "source_cells": [
      "`de la casa`",
      "`De la Casa`",
      "conector en `NAME_START`"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::003",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 3,
    "source_cells": [
      "`el sabor de la casa`",
      "`El Sabor de la Casa`",
      "inicio e internos consecutivos"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::004",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 4,
    "source_cells": [
      "`para el día`",
      "`Para el Día`",
      "primer conector capitalizado, segundo interno"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::005",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 5,
    "source_cells": [
      "`café: de la casa` con reinicio declarado",
      "`Café: De la Casa`",
      "`DECLARED_SEGMENT_START`"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::006",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 6,
    "source_cells": [
      "`café, de la casa`",
      "`Café, de la Casa`",
      "coma sin reinicio"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::007",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 7,
    "source_cells": [
      "`\"de la casa\"`",
      "`\"De la Casa\"`",
      "signo inicial no consume posición"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::008",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 8,
    "source_cells": [
      "`pan del campo`",
      "`Pan del Campo`",
      "`del` atómico interno"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::009",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 9,
    "source_cells": [
      "`al horno`",
      "`Al Horno`",
      "`al` atómico al inicio"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::010",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 10,
    "source_cells": [
      "`pan de el campo`",
      "`Pan de el Campo`",
      "no contracción automática"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::011",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 11,
    "source_cells": [
      "`pan y higos`",
      "`Pan y Higos`",
      "sin sustitución `y` → `e`"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::012",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 12,
    "source_cells": [
      "`pan e higos`",
      "`Pan e Higos`",
      "forma recibida preservada"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::013",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 13,
    "source_cells": [
      "`café o uvas`",
      "`Café o Uvas`",
      "sin sustitución `o` → `u`"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::014",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 14,
    "source_cells": [
      "`café u uvas`",
      "`Café u Uvas`",
      "forma recibida preservada"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::015",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 15,
    "source_cells": [
      "`deluxe`",
      "`Deluxe`",
      "`del` no coincide como subcadena"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::016",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 16,
    "source_cells": [
      "`paraíso de café`",
      "`Paraíso de Café`",
      "`para` no coincide como subcadena"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::017",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 17,
    "source_cells": [
      "`pan y/o queso`",
      "conservar y revisar",
      "forma compuesta no catalogada"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::018",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 18,
    "source_cells": [
      "`3M de Colombia`",
      "`3M de Colombia`",
      "protección previa al conector"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::019",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 19,
    "source_cells": [
      "`Coca-Cola de Café` con excepción",
      "preservar `Coca-Cola`; emitir `de`",
      "excepción oficial y conector interno"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-004::CORPUS::020",
    "family": "CONNECTORS",
    "source_task": "DATA-NORM-ARC-004",
    "source_section": "24. Corpus mínimo de conformidad",
    "source_ordinal": 20,
    "source_cells": [
      "`500 g de Café`",
      "preservar cantidad y unidad; emitir `de`",
      "tokens protegidos y conector"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::001",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 1,
    "source_cells": [
      "`3m` en campo compatible con la excepción `3M`",
      "`3M`",
      "emisión de forma canónica por caja"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::002",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 2,
    "source_cells": [
      "`iPHONE` en campo compatible",
      "`iPhone`",
      "capitalización interna oficial"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::003",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 3,
    "source_cells": [
      "`Coca-Cola`",
      "`Coca-Cola`",
      "preservación exacta"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::004",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 4,
    "source_cells": [
      "`Coca Cola`",
      "conservar y revisar",
      "el guion no se elimina ni se infiere alias"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::005",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 5,
    "source_cells": [
      "`NEXO`",
      "`NEXO`",
      "sigla contractual"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::006",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 6,
    "source_cells": [
      "`nexo` en coordenada autorizada",
      "`NEXO`",
      "`CASEFOLD_EXACT` contextual"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::007",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 7,
    "source_cells": [
      "`BOLSA` sin entrada de sigla",
      "no clasificar como sigla",
      "mayúsculas no demuestran acrónimo"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::008",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 8,
    "source_cells": [
      "`BBQ` sin alcance aprobado",
      "conservar y revisar",
      "candidato contextual"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::009",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 9,
    "source_cells": [
      "`KG` en campo unitario mutable con `EMIT_CANONICAL_FORM`",
      "`kg`",
      "emisión de código unitario contextual"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::010",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 10,
    "source_cells": [
      "`KG` en campo unitario con `VALIDATE_ONLY`",
      "validar sin reescritura",
      "separación entre validación y emisión"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::011",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 11,
    "source_cells": [
      "`kg` dentro de un modelo o texto no estructurado",
      "no aplicar",
      "protección por clase y alcance"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::012",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 12,
    "source_cells": [
      "`Bolsa 1 kg` estructurada",
      "preservar cantidad; resolver `kg` como componente",
      "unidad separada de etiqueta"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::013",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 13,
    "source_cells": [
      "`Six Pack` / `six_pack`",
      "no mapear automáticamente",
      "etiqueta y código no equivalentes"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::014",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 14,
    "source_cells": [
      "`COMERCIALIZADORA EL NOVILLON S.A.S.` desde fuente autorizada",
      "preservar exactamente",
      "nombre legal completo"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::015",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 15,
    "source_cells": [
      "el mismo nombre sin evidencia autorizada",
      "preservar como original y revisar",
      "fuente insuficiente"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::016",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 16,
    "source_cells": [
      "`SAS` y `S.A.S.`",
      "no declarar equivalencia",
      "sufijos exactos y contextuales"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::017",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 17,
    "source_cells": [
      "`Oster` / `oster` sin fuente",
      "conservar y revisar",
      "variante de marca no activada"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::018",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 18,
    "source_cells": [
      "`Wellmix` / `Welmix`",
      "conservar y revisar",
      "diferencia ortográfica ambigua"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::019",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 19,
    "source_cells": [
      "dos entradas activas incompatibles",
      "conservar y bloquear",
      "conflicto fail closed"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::020",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 20,
    "source_cells": [
      "forma suspendida o retirada",
      "no aplicar a decisión nueva",
      "ciclo de vida"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-005::CORPUS::021",
    "family": "OFFICIAL_EXCEPTIONS",
    "source_task": "DATA-NORM-ARC-005",
    "source_section": "29. Corpus mínimo de conformidad",
    "source_ordinal": 21,
    "source_cells": [
      "valor en VITAL",
      "no aplicar catálogo transversal",
      "frontera de producto"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::001",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 1,
    "source_cells": [
      "`harina de maiz` después de capitalización",
      "`Harina de Maíz`",
      "corrección token y preservación de caja resuelta"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::002",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 2,
    "source_cells": [
      "`pan masa madre clasico` después de capitalización",
      "`Pan Masa Madre Clásico`",
      "corrección exacta de token"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::003",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 3,
    "source_cells": [
      "`latte frio` después de capitalización",
      "`Latte Frío`",
      "corrección de tilde sin cambiar palabras"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::004",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 4,
    "source_cells": [
      "`MAIZ` en token elegible",
      "`MAÍZ`",
      "proyección de caja estable"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::005",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 5,
    "source_cells": [
      "`Maíz`",
      "sin cambio con `DICTIONARY_ALREADY_CANONICAL`",
      "idempotencia"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::006",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 6,
    "source_cells": [
      "`expresso` sin decisión contextual",
      "conservar y revisar",
      "ambigüedad no automática"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::007",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 7,
    "source_cells": [
      "`Coca-Cola`",
      "conservar",
      "precedencia de marca oficial"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::008",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 8,
    "source_cells": [
      "`COMERCIALIZADORA ABC S.A.S.`",
      "conservar",
      "nombre legal excluido"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::009",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 9,
    "source_cells": [
      "`500 g`",
      "conservar",
      "cantidad y unidad protegidas"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::010",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 10,
    "source_cells": [
      "`product_sku=FRIO`",
      "conservar",
      "identificador técnico excluido"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::011",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 11,
    "source_cells": [
      "`EXTERNAL_ORIGINAL=maiz`",
      "conservar exactamente",
      "representación externa protegida"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::012",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 12,
    "source_cells": [
      "`maizena`",
      "no aplicar",
      "token parcial prohibido"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::013",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 13,
    "source_cells": [
      "entrada duplicada con dos destinos",
      "conservar y bloquear",
      "conflicto de misma especificidad"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::014",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 14,
    "source_cells": [
      "entrada de campo y entrada transversal compatibles",
      "aplicar la de campo",
      "precedencia de alcance"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-006::CORPUS::015",
    "family": "ORTHOGRAPHIC_DICTIONARY",
    "source_task": "DATA-NORM-ARC-006",
    "source_section": "28. Corpus mínimo de conformidad",
    "source_ordinal": 15,
    "source_cells": [
      "versión retirada en caché",
      "bloquear",
      "no fallback a versión no activa"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::001",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 1,
    "source_cells": [
      "valor `Harina de Maíz`, consulta `harina de maiz`",
      "`ACCENT_TOLERANT_MATCH`; mostrar `Harina de Maíz`",
      "sobrescribir el nombre o declarar identidad por la clave"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::002",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 2,
    "source_cells": [
      "valor `Maiz Dulce`, consulta `maíz dulce`",
      "candidato tolerante con motivo y scope",
      "corregir o fusionar automáticamente el registro"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::003",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 3,
    "source_cells": [
      "valor `año`, consulta `ano`",
      "no coincidir mediante `SEARCH_ACCENT_KEY`",
      "plegar `ñ` a `n`"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::004",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 4,
    "source_cells": [
      "valor `Coca-Cola`, consulta `coca-cola`",
      "`FORM_EQUIVALENT_MATCH` si la forma oficial autoriza casefold",
      "emitir `Coca Cola` o eliminar el guion"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::005",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 5,
    "source_cells": [
      "valor `Coca-Cola`, consulta `coca cola`",
      "posible `ALL_TOKEN_MATCH` de menor nivel si el perfil de marca lo autoriza expresamente",
      "crear alias implícito o declarar igualdad oficial"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::006",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 6,
    "source_cells": [
      "valor `S.A.S.`, consulta `sas`",
      "no coincidir salvo alias legal explícito",
      "eliminar puntos por tolerancia general"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::007",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 7,
    "source_cells": [
      "valor `iPhone`, consulta `iphone`",
      "coincidencia oficial casefold cuando la excepción activa lo permita; mostrar `iPhone`",
      "convertir el valor a `Iphone`"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::008",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 8,
    "source_cells": [
      "valor `expresso`, consulta `espresso`",
      "no coincidencia estándar; candidato difuso solo si el perfil futuro lo habilita",
      "autocorrección, alias o diccionario implícito"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::009",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 9,
    "source_cells": [
      "valores `Wellmix` y `Welmix`",
      "resultados separados; posible candidato difuso de baja confianza",
      "seleccionar uno como oficial por frecuencia"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::010",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 10,
    "source_cells": [
      "valores `Choco Bites` y `Chocobites`",
      "resultados separados; no son equivalentes por tokenización",
      "unir o dividir palabras"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::011",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 11,
    "source_cells": [
      "presentación `500 g`",
      "cantidad `500` y unidad `g` como componentes; etiqueta visible preservada",
      "comparar únicamente la cadena sin contexto"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::012",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 12,
    "source_cells": [
      "`Bolsa de 1.100 ml` y `Bolsa de 1100 ml`",
      "candidatos separados hasta resolver convención y estructura",
      "retirar el punto y declarar equivalencia"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::013",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 13,
    "source_cells": [
      "nombre personal `Carlos Ibarra`",
      "búsqueda restringida por finalidad y scope; retornar identificador estable autorizado",
      "identificar o fusionar personas por nombre"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::014",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 14,
    "source_cells": [
      "SKU `FRIO` y palabra comercial `frío`",
      "búsquedas independientes por campo y perfil",
      "hacer coincidir código y palabra mediante tildes o casefold comercial"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::015",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 15,
    "source_cells": [
      "original externo `MAIZ` y forma interna `Maíz`",
      "conservar original; buscar la entidad interna mediante su derivación y mostrar la representación autorizada",
      "sobrescribir el original externo"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::016",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 16,
    "source_cells": [
      "dos registros exactos `VÍVERES & BODEGA PRINCIPAL` en el mismo scope",
      "dos resultados con identificadores distintos y señal para análisis de duplicidad",
      "devolver uno solo por orden físico"
    ]
  },
  {
    "scenario_key": "DATA-NORM-ARC-008::CORPUS::017",
    "family": "SEARCH_COMPARISON",
    "source_task": "DATA-NORM-ARC-008",
    "source_section": "28. Ejemplos normativos",
    "source_ordinal": 17,
    "source_cells": [
      "doce posiciones llamadas `Nivel 1` bajo padres distintos",
      "filtrar por jerarquía y devolver únicamente el scope solicitado",
      "colapsar resultados por nombre"
    ]
  }
] as const satisfies readonly NormalizationConformanceScenario[];


export type SemanticPreservationSnapshot =
  Readonly<Record<SemanticPreservationDimension, string>>;

export interface ConformanceObservation {
  readonly logical_result_fingerprint: string;
  readonly output_fingerprint: string;
  readonly semantic_change_performed: boolean;
  readonly protected_dimensions: SemanticPreservationSnapshot;
  readonly unauthorized_side_effects: readonly string[];
}

export interface ABCConformanceCertification {
  readonly conformant: boolean;
  readonly blockers: readonly string[];
  readonly dimensions: Readonly<Record<ConformanceTestDimension, boolean>>;
  readonly production_mutation_authority: false;
  readonly identity_authority: false;
  readonly uniqueness_authority: false;
  readonly merge_authority: false;
}

function nonEmpty(value: string): boolean {
  return value.trim().length > 0;
}

function sameSnapshot(
  left: SemanticPreservationSnapshot,
  right: SemanticPreservationSnapshot,
): boolean {
  return SEMANTIC_PRESERVATION_DIMENSIONS.every(
    (dimension) => left[dimension] === right[dimension],
  );
}

function validObservation(observation: ConformanceObservation): boolean {
  return nonEmpty(observation.logical_result_fingerprint)
    && nonEmpty(observation.output_fingerprint)
    && SEMANTIC_PRESERVATION_DIMENSIONS.every(
      (dimension) => nonEmpty(observation.protected_dimensions[dimension]),
    );
}

export function certifyABCConformance(
  sourceSnapshot: SemanticPreservationSnapshot,
  a: ConformanceObservation,
  b: ConformanceObservation,
  c: ConformanceObservation,
): ABCConformanceCertification {
  const blockers: string[] = [];

  if (![a, b, c].every(validObservation)) {
    blockers.push('INVALID_CONFORMANCE_OBSERVATION');
  }

  const deterministic = a.logical_result_fingerprint === b.logical_result_fingerprint
    && a.output_fingerprint === b.output_fingerprint
    && a.semantic_change_performed === b.semantic_change_performed
    && sameSnapshot(a.protected_dimensions, b.protected_dimensions);

  if (!deterministic) blockers.push('DETERMINISM_MISMATCH');

  const idempotent = c.semantic_change_performed === false;
  if (!idempotent) blockers.push('SECOND_SEMANTIC_CHANGE');

  const semanticPreservation = [a, b, c].every(
    (observation) => sameSnapshot(sourceSnapshot, observation.protected_dimensions),
  );
  if (!semanticPreservation) blockers.push('PROTECTED_DIMENSION_CHANGED');

  const noUnauthorizedSideEffects = [a, b, c].every(
    (observation) => observation.unauthorized_side_effects.length === 0,
  );
  if (!noUnauthorizedSideEffects) blockers.push('UNAUTHORIZED_SIDE_EFFECT');

  return {
    conformant: blockers.length === 0,
    blockers: [...new Set(blockers)],
    dimensions: {
      DETERMINISM: deterministic,
      EVALUATION_IDEMPOTENCY: idempotent,
      SEMANTIC_PRESERVATION: semanticPreservation,
      NO_UNAUTHORIZED_SIDE_EFFECTS: noUnauthorizedSideEffects,
    },
    production_mutation_authority: false,
    identity_authority: false,
    uniqueness_authority: false,
    merge_authority: false,
  };
}

export function classifyVersionCut(
  leftVersionSetDigest: string,
  rightVersionSetDigest: string,
): 'SAME_CONTRACT_CUT' | 'DIFFERENT_CONTRACT_CUT' | 'INVALID_VERSION_SET_DIGEST' {
  if (!nonEmpty(leftVersionSetDigest) || !nonEmpty(rightVersionSetDigest)) {
    return 'INVALID_VERSION_SET_DIGEST';
  }
  if (leftVersionSetDigest.toLowerCase() === 'latest'
    || rightVersionSetDigest.toLowerCase() === 'latest') {
    return 'INVALID_VERSION_SET_DIGEST';
  }
  return leftVersionSetDigest === rightVersionSetDigest
    ? 'SAME_CONTRACT_CUT'
    : 'DIFFERENT_CONTRACT_CUT';
}

export function conformanceProductBoundaryDisposition(
  productBoundary: 'VENTO_OS' | 'VITAL',
): 'ALLOWED' | 'BLOCKED_VITAL' {
  return productBoundary === 'VENTO_OS' ? 'ALLOWED' : 'BLOCKED_VITAL';
}
