import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const ROOT = process.cwd();
const BASE = path.resolve(ROOT, 'docs/plan-canonico/modular');
const APPLY = process.argv.includes('--apply');

const PATHS = {
  manifest: path.join(BASE, 'manifest.json'),
  header: path.join(BASE, '00_CABECERA_Y_ESTADO.md'),
  protocol: path.join(BASE, '01_PROTOCOLO.md'),
  catalogApps: path.join(
    BASE,
    'bloques/C_CATALOGO/01_APLICACIONES_Y_CON