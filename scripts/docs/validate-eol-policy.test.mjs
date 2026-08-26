import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';
import { fileURLToPath } from 'node:url';

import {
  inspectTextBuffer,
  validateEolPolicy,
} from './validate-eol-policy.mjs';

const repositoryRoot = path.resolve(
  path.dirname(fileURLToPath(import.meta.url)),
  '..',
  '..',
);

test('detects LF text without CR or UTF8 BOM', () => {
  assert.deepEqual(inspectTextBuffer(Buffer.from('a\nb\n', 'utf8')), {
    hasCr: false,
    hasUtf8Bom: false,
  });
});

test('detects CRLF and UTF8 BOM independently', () => {
  assert.equal(inspectTextBuffer(Buffer.from('a\r\nb\r\n', 'utf8')).hasCr, true);
  assert.equal(
    inspectTextBuffer(Buffer.from([0xef, 0xbb, 0xbf, 0x61, 0x0a])).hasUtf8Bom,
    true,
  );
});

test('repository governed surfaces are LF and BOM free', () => {
  const report = validateEolPolicy({ root: repositoryRoot });
  assert.equal(report.violations.length, 0);
  assert.ok(report.governedFiles.length > 0);
});

test('editor and git policy are wired to LF without BOM', () => {
  const attributes = fs.readFileSync(path.join(repositoryRoot, '.gitattributes'), 'utf8');
  assert.match(attributes, /^\* text=auto eol=lf$/mu);
  assert.match(attributes, /^\.gitattributes text eol=lf$/mu);
  assert.match(attributes, /^\.editorconfig text eol=lf$/mu);
  assert.match(attributes, /^\.vscode\/\*\.json text eol=lf$/mu);

  const editorConfig = fs.readFileSync(path.join(repositoryRoot, '.editorconfig'), 'utf8');
  assert.match(editorConfig, /^root = true$/mu);
  assert.match(editorConfig, /^charset = utf-8$/mu);
  assert.match(editorConfig, /^end_of_line = lf$/mu);
  assert.match(editorConfig, /^insert_final_newline = true$/mu);

  const vscode = JSON.parse(
    fs.readFileSync(path.join(repositoryRoot, '.vscode', 'settings.json'), 'utf8'),
  );
  assert.equal(vscode['files.eol'], '\n');
  assert.equal(vscode['files.encoding'], 'utf8');

  const manifest = JSON.parse(fs.readFileSync(path.join(repositoryRoot, 'package.json'), 'utf8'));
  assert.equal(manifest.scripts['docs:eol:check'], 'node scripts/docs/validate-eol-policy.mjs');
  assert.match(manifest.scripts['docs:plan:check'], /^node scripts\/docs\/sync-local-derived-artifacts\.mjs && node scripts\/docs\/validate-eol-policy\.mjs && /u);
  assert.match(manifest.scripts['docs:plan:test'], /scripts\/docs\/validate-eol-policy\.test\.mjs/u);
});
