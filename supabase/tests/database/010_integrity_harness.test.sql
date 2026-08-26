-- VENTO_DB_TEST_CATEGORY: INTEGRITY
begin;

create extension if not exists pgtap with schema extensions;
create schema vento_harness_integrity;

create table vento_harness_integrity.parent_fixture (
  id integer primary key
);

create table vento_harness_integrity.integrity_fixture (
  id integer primary key,
  parent_id integer not null references vento_harness_integrity.parent_fixture(id),
  code text not null unique,
  quantity integer not null check (quantity > 0)
);

create function vento_harness_integrity.rejects_invalid_quantity()
returns boolean
language plpgsql
as $$
begin
  insert into vento_harness_integrity.integrity_fixture (id, parent_id, code, quantity)
  values (2, 1, 'invalid-quantity', -1);
  return false;
exception when check_violation then
  return true;
end;
$$;

create function vento_harness_integrity.rejects_duplicate_code()
returns boolean
language plpgsql
as $$
begin
  insert into vento_harness_integrity.integrity_fixture (id, parent_id, code, quantity)
  values (3, 1, 'valid', 2);
  return false;
exception when unique_violation then
  return true;
end;
$$;

select plan(4);
insert into vento_harness_integrity.parent_fixture (id) values (1);

select lives_ok(
  $$insert into vento_harness_integrity.integrity_fixture (id, parent_id, code, quantity) values (1, 1, 'valid', 1)$$,
  'valid input is accepted'
);
select ok(vento_harness_integrity.rejects_invalid_quantity(), 'invalid CHECK input is rejected');
select ok(vento_harness_integrity.rejects_duplicate_code(), 'duplicate UNIQUE input is rejected');
select ok(
  exists (
    select 1
    from pg_constraint
    where conrelid = 'vento_harness_integrity.integrity_fixture'::regclass
      and contype = 'f'
  ),
  'foreign key is present'
);

select * from finish();
rollback;