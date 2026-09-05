import test from 'node:test';
import assert from 'node:assert/strict';
import { checkManifest } from './migration-manifest.mjs';
import {
  AUTHENTICATED_EXPECTED_REVOKES,
  AUTHENTICATED_SERVER_ONLY_TARGETS,
  AUTHENTICATED_PREFIX_VERSION,
  PREFIX_VERSION,
  buildAuthenticatedPlan,
  buildPlan,
  renderAuthenticatedRepairSql,
  renderRepairSql,
} from './staging-acl-reconciliation.mjs';

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

function authenticatedFixture() {
  const history = checkManifest({ root: process.cwd() }).rows.filter(r => r.version <= AUTHENTICATED_PREFIX_VERSION)
    .map(r => ({version:r.version,name:r.filename.slice(15,-4)}));
  const grant = privilege => ({grantor:'postgres',privilege,grantable:false});
  const objects = AUTHENTICATED_SERVER_ONLY_TARGETS.map((target) => ({
    kind: 'FUNCTION',
    schema: 'public',
    name: target.identity.slice('public.'.length).split('(')[0],
    identity: target.identity,
    owner: target.owner,
    extension_member: false,
    anon: [],
    authenticated: [],
    authenticated_effective: false,
    anon_effective: false,
    service_role_effective: true,
    security_definer: target.security_definer,
    function_config: structuredClone(target.function_config),
    function_md5: target.function_md5,
  }));
  const reference = {
    current_user: 'postgres',
    history,
    protected_digest: 'protected-before-authenticated-repair',
    authenticated_function_protected_digest: 'protected-authenticated-scope',
    public_anon_column_grants: 0,
    objects,
    defaults: [{...grant('TRIGGER'),type:'r'}],
  };
  const observed = structuredClone(reference);
  for (const object of observed.objects) {
    object.authenticated = [grant('EXECUTE')];
    object.authenticated_effective = true;
  }
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

test('authenticated repara exactamente diez EXECUTE excedentes sobre prefijo de siete migraciones', () => {
  const f = authenticatedFixture();
  const plan = buildAuthenticatedPlan(f);
  assert.equal(plan.revokes.length, AUTHENTICATED_EXPECTED_REVOKES);
  assert.equal(plan.defaults_to_revoke.length, 0);
  assert.ok(plan.expected_after.objects.every((entry) => entry.authenticated.length === 0));
  assert.ok(plan.expected_after.objects.every((entry) => entry.authenticated_effective === false));
  const sql = renderAuthenticatedRepairSql(plan);
  assert.equal((sql.match(/from authenticated restrict;/gu) ?? []).length, AUTHENTICATED_EXPECTED_REVOKES);
  assert.doesNotMatch(sql,/\b(?:drop|truncate|delete|insert into|grant|security definer)\b/iu);
  assert.match(sql,/STAGING_AUTHENTICATED_ACL_PRECONDITION_CHANGED/u);
  assert.match(sql,/STAGING_AUTHENTICATED_PROTECTED_STATE_CHANGED/u);
  assert.match(sql,/STAGING_NON_TARGET_ACL_CHANGED/u);
});

test('authenticated rechaza produccion, prefijo incorrecto y drift dentro de los diez targets', () => {
  const f = authenticatedFixture();
  assert.throws(() => buildAuthenticatedPlan({...f,projectRef:'clzdpinthhtknkmefsxx'}), /PRODUCTION_TARGET_FORBIDDEN/u);
  const gap = structuredClone(f); gap.observed.history.pop();
  assert.throws(() => buildAuthenticatedPlan(gap), /EXACT_SEVEN_MIGRATION_PREFIX_REQUIRED/u);
  const definitionDrift = structuredClone(f); definitionDrift.observed.objects[0].function_md5 = 'changed';
  assert.throws(() => buildAuthenticatedPlan(definitionDrift), /STAGING_TARGET_DEFINITION_DRIFT/u);
  const anonDrift = structuredClone(f); anonDrift.observed.objects[0].anon_effective = true;
  assert.throws(() => buildAuthenticatedPlan(anonDrift), /STAGING_TARGET_NON_AUTH_PRIVILEGE_DRIFT/u);
  const serviceDrift = structuredClone(f); serviceDrift.observed.objects[0].service_role_effective = false;
  assert.throws(() => buildAuthenticatedPlan(serviceDrift), /STAGING_TARGET_NON_AUTH_PRIVILEGE_DRIFT/u);
});

test('authenticated rechaza ACL inseguro, target ausente y cardinalidad parcial', () => {
  const grantor = authenticatedFixture(); grantor.observed.objects[0].authenticated[0].grantor = 'supabase_admin';
  assert.throws(() => buildAuthenticatedPlan(grantor), /STAGING_TARGET_AUTHENTICATED_ACL_UNSAFE/u);

  const grantable = authenticatedFixture(); grantable.observed.objects[0].authenticated[0].grantable = true;
  assert.throws(() => buildAuthenticatedPlan(grantable), /STAGING_TARGET_AUTHENTICATED_ACL_UNSAFE/u);

  const missing = authenticatedFixture(); missing.observed.objects.shift();
  assert.throws(() => buildAuthenticatedPlan(missing), /STAGING_TARGET_MISSING/u);

  const partial = authenticatedFixture(); partial.observed.objects[0] = structuredClone(partial.reference.objects[0]);
  assert.throws(() => buildAuthenticatedPlan(partial), /AUTHENTICATED_REVOKE_COUNT_INVALID:9/u);
});

test('authenticated no usa ACL authenticated del replay local como target de reparacion', () => {
  const f = authenticatedFixture();
  for (const object of f.reference.objects) {
    object.authenticated = [{grantor:'postgres',privilege:'EXECUTE',grantable:false}];
    object.authenticated_effective = true;
  }
  const plan = buildAuthenticatedPlan(f);
  assert.equal(plan.revokes.length, AUTHENTICATED_EXPECTED_REVOKES);
});

test('authenticated ignora diferencias no objetivo entre replay local y hosted', () => {
  const f = authenticatedFixture();
  f.reference.objects.push({
    kind:'TABLE', schema:'public', name:'local_only', identity:'public.local_only', owner:'postgres', extension_member:false,
    anon:[], authenticated:[], authenticated_effective:null, anon_effective:null, service_role_effective:null,
    security_definer:null, function_config:null, function_md5:null,
  });
  f.observed.objects.push({
    kind:'TABLE', schema:'public', name:'hosted_only', identity:'public.hosted_only', owner:'postgres', extension_member:false,
    anon:[{grantor:'postgres',privilege:'SELECT',grantable:false}], authenticated:[{grantor:'postgres',privilege:'SELECT',grantable:false}], authenticated_effective:null, anon_effective:null, service_role_effective:null,
    security_definer:null, function_config:null, function_md5:null,
  });
  f.reference.defaults = [{type:'r',grantor:'postgres',privilege:'TRIGGER',grantable:false}];
  f.observed.defaults = [{type:'f',grantor:'postgres',privilege:'EXECUTE',grantable:false}];
  const plan = buildAuthenticatedPlan(f);
  assert.equal(plan.revokes.length, AUTHENTICATED_EXPECTED_REVOKES);
});

test('authenticated es idempotente cuando el prefijo de siete ya coincide con el canonico', () => {
  const f = authenticatedFixture();
  f.observed = structuredClone(f.reference);
  const plan = buildAuthenticatedPlan(f);
  assert.equal(plan.revokes.length, 0);
  const sql = renderAuthenticatedRepairSql(plan);
  assert.doesNotMatch(sql,/from authenticated restrict;/u);
  assert.match(sql,/STAGING_AUTHENTICATED_ACL_TARGET_NOT_REACHED/u);
});