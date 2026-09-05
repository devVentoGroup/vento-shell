import test from 'node:test';
import assert from 'node:assert/strict';
import { checkManifest } from './migration-manifest.mjs';
import { buildPlan, renderRepairSql, PREFIX_VERSION } from './staging-acl-reconciliation.mjs';

function fixture() {
  const history = checkManifest({ root: process.cwd() }).rows.filter(r => r.version <= PREFIX_VERSION)
    .map(r => ({version:r.version,name:r.filename.slice(15,-4)}));
  const grant = privilege => ({grantor:'postgres',privilege,grantable:false});
  const reference = {current_user:'postgres',history,protected_digest:'protected',public_anon_column_grants:0,
    objects:[{kind:'TABLE',schema:'public',name:'fixture',identity:'public.fixture',owner:'postgres',extension_member:false,anon:[grant('SELECT')]}],
    defaults:[{...grant('TRIGGER'),type:'r'}]};
  const observed = structuredClone(reference);
  observed.objects[0].anon.push(grant('INSERT'));
  observed.defaults.push({...grant('INSERT'),type:'r'});
  return {reference,observed,projectRef:'rcrxixmqhrndcervbllp',owner:'SUPA-TRANS-015'};
}

test('repara solo exceso y conserva grants y defaults canonicos', () => {
  const f=fixture(); const plan=buildPlan(f);
  assert.deepEqual(plan.revokes,[{kind:'TABLE',identity:'public.fixture',privilege:'INSERT'}]);
  assert.equal(plan.defaults_to_revoke.length,1);
  assert.deepEqual(plan.expected_after.defaults,f.reference.defaults);
  const sql=renderRepairSql(plan);
  assert.match(sql,/revoke INSERT on TABLE public.fixture from anon restrict;/u);
  assert.doesNotMatch(sql,/\b(?:drop|truncate|delete|insert into|grant|security definer)\b/iu);
  assert.match(sql,/STAGING_PROTECTED_STATE_CHANGED/u);
  assert.match(sql,/STAGING_ACL_PRECONDITION_CHANGED/u);
});

test('rechaza produccion, huecos de historial y grants canonicos ausentes', () => {
  const f=fixture();
  assert.throws(()=>buildPlan({...f,projectRef:'clzdpinthhtknkmefsxx'}),/PRODUCTION_TARGET_FORBIDDEN/u);
  const gap=structuredClone(f); gap.observed.history.pop();
  assert.throws(()=>buildPlan(gap),/EXACT_FIVE_MIGRATION_PREFIX_REQUIRED/u);
  const missing=structuredClone(f); missing.observed.objects[0].anon.shift();
  assert.throws(()=>buildPlan(missing),/MISSING_CANONICAL_GRANT/u);
});

test('rechaza mutaciones de extensiones, otros grantors, columnas y objetos desconocidos', () => {
  for (const mutate of [
    f=>{f.observed.objects[0].extension_member=true;},
    f=>{f.observed.objects[0].anon[1].grantor='supabase_admin';},
    f=>{f.observed.objects[0].anon[1].grantable=true;},
    f=>{f.observed.public_anon_column_grants=1;},
    f=>{f.observed.objects[0].schema='vital';},
    f=>{f.observed.objects[0].identity='public.other';},
  ]) { const f=fixture(); mutate(f); assert.throws(()=>buildPlan(f)); }
});

test('repeticion sobre ACL canonicos produce cero revokes', () => {
  const f=fixture(); f.observed=structuredClone(f.reference);
  const plan=buildPlan(f);
  assert.equal(plan.revokes.length,0);
  assert.equal(plan.defaults_to_revoke.length,0);
});
