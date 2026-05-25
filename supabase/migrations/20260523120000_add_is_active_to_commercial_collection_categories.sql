begin;

alter table pass.commercial_collection_categories
  add column if not exists is_active boolean not null default true;

comment on column pass.commercial_collection_categories.is_active is
  'Controla si una categoria comercial esta activa dentro de una coleccion. Permite desactivar secciones sin borrar historico ni romper items comerciales existentes.';

commit;