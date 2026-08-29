# VENTO Supabase Migration Manifest

> Generated inventory for `AUTH-DB-015::GLOBAL`. Do not edit migration rows manually.

`supabase/migrations/` is the executable canonical source. This manifest inventories versioned files; it does not assert whether a migration is applied in local, staging, or production.

Environment state: NOT_TRACKED_HERE.

Regenerate with `npm run supabase:migrations:manifest:build` and validate with `npm run supabase:migrations:manifest:check`.

<!-- prettier-ignore -->
| version | filename | sha256 | bytes | kind | findings | lineage | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 00000000000000 | 00000000000000_baseline.sql | b8437e5d0e767566f1021d22781e23d8956cd7383f986298562a562c24b913d3 | 1995900 | BASELINE |  |  | SIN_HALLAZGO |
| 20260826191458 | 20260826191458_auth_db_001_enable_rls_containment.sql | e334ae3c90e0b512b90fee1fde5a65c52117c3e3e62636536651da5bd5a0334e | 6812 | STANDARD |  |  | SIN_HALLAZGO |
| 20260826213609 | 20260826213609_auth_db_002_rls_hardening.sql | aca1a4b69e8f9c483b25a88a2c0ffc18a1a9f507fc5b3bcdb72dec7cdf0320b7 | 15542 | STANDARD |  |  | SIN_HALLAZGO |
| 20260827000725 | 20260827000725_auth_db_003_security_definer_hardening.sql | aae47b8c3f60501c175e03cecaee44d87a814d9281fdbe4f44daa2e1bf5113eb | 21208 | STANDARD |  |  | SIN_HALLAZGO |
| 20260827143711 | 20260827143711_auth_db_004_authenticated_grant_containment.sql | d8336666b50345aa1eb206f6aaf985e9a35a957d6c4d2470b4499a3de1683bf3 | 19535 | STANDARD |  |  | SIN_HALLAZGO |
| 20260827153413 | 20260827153413_auth_db_005_anon_grant_containment.sql | 5f3c471e303e7d9aa492b4b3a5dbf145b31c6c6ea4c2a2bb2ba877e7e7575f63 | 32663 | STANDARD |  |  | SIN_HALLAZGO |
| 20260828023253 | 20260828023253_auth_db_016_canonical_schema_foundation.sql | 0156b717c6a9ae43ab72c9eadedb6113c993aa227eda8a9d041fe8203aaa9174 | 23652 | STANDARD |  |  | SIN_HALLAZGO |
| 20260828152129 | 20260828152129_auth_db_018_contract_separation.sql | 7e4a0e1e9097376b815af1e39704993d1d53088634339006aa438a27a174dc3c | 32517 | STANDARD |  |  | SIN_HALLAZGO |
| 20260829152739 | 20260829152739_auth_db_017_data_api_privileges.sql | 1b53721a5ab95c01943584db0ee9fa358a54f71d0851e5452d09537a35162990 | 47187 | STANDARD |  |  | SIN_HALLAZGO |

## Inventory summary

- Physical files: 9
- Empty files: 0
- Content-duplicate groups: 0
- Same-logical-family groups: 0
- Repeated-version groups: 0
- Legacy-naming files: 0

## Binding rules

- Every regular file under `supabase/migrations/` appears exactly once above.
- `sha256` and `bytes` describe repository-canonical content; CRLF introduced by checkout is normalized to LF and no other bytes are rewritten.
- Historical files are preserved; duplicate content, empty files and legacy names are findings, not deletion instructions.
- New migration filenames must match `^[0-9]{14}_[a-z0-9][a-z0-9_]*\.sql$`.
- `00000000000000_baseline.sql` remains the reserved baseline.
- New `.manual.sql` and `.fixed.sql` suffixes are forbidden; historical instances remain classified as legacy.
- Environment application state is outside this manifest and belongs to `AUTH-DB-028`.
- Schema/integrity/RLS/RPC/migration testing belongs to `AUTH-DB-027`.
- Backup, restore and rollback validation belongs to `AUTH-DB-029`.
