drop policy if exists document_types_select on public.document_types;
create policy document_types_select
on public.document_types
for select
to authenticated
using (true);
