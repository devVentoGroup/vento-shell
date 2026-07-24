PROCESO TO-BE DE TALENTO Y VINCULACIÓN

Las tareas siguientes fueron reubicadas desde E1 porque diseñan el proceso,
los actores, estados, pantallas, contratos e integraciones objetivo de una
aplicación futura. Conservan sus identificadores y no autorizan implementación.

### [ ] CAP-TAL-001 — Diseñar alcance y responsabilidades de TALENTO, VISO y ANIMA
### [ ] CAP-TAL-002 — Diseñar publicación de vacantes, consulta y postulación en TALENTO
### [ ] CAP-TAL-003 — Diseñar expediente progresivo de datos, documentos, consentimiento y conservación
### [ ] CAP-TAL-004 — Diseñar evaluación, entrevista, decisión, oferta y pre-registro de candidato
### [ ] CAP-TAL-005 — Diseñar traspaso trazable e idempotente de TALENTO hacia ANIMA y VISO
### [ ] CAP-TAL-006 — Diseñar período de prueba, permisos provisionales, continuidad definitiva y cierre

Reglas preservadas:

1. la persona postulada continúa siendo candidata hasta la vinculación autorizada;
2. TALENTO conserva postulación y expediente de selección;
3. VISO conserva vacantes, decisiones laborales y permisos administrativos;
4. ANIMA recibe al trabajador vinculado y su experiencia operativa;
5. candidato y trabajador comparten identidad enlazada, sin duplicación;
6. el período de prueba es un estado del vínculo laboral;
7. el rechazo, retiro o cierre conserva trazabilidad y retira accesos cuando corresponda;
8. cualquier migración o cambio de Supabase se creará y ejecutará desde `vento-shell`;
9. `CAP-TAL-006` deberá definir la puerta para materializar el roadmap propio del BLOQUE Y.

