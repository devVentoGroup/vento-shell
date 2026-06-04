-- FOGO: Storage bucket for recipe step photos.
-- Creates the bucket used by src/app/recipes/new/page.tsx when uploading step photos.
-- Bucket: recipe-step-photos
-- Max file size: 8 MB
-- Allowed mime types: JPG, PNG, WEBP

insert into storage.buckets (
  id,
  name,
  public,
  file_size_limit,
  allowed_mime_types
)
values (
  'recipe-step-photos',
  'recipe-step-photos',
  true,
  8388608,
  array['image/jpeg', 'image/png', 'image/webp']
)
on conflict (id) do update set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types,
  updated_at = now();

-- Public read for recipe step photos.
do $$
begin
  if not exists (
    select 1
    from pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname = 'fogo_recipe_step_photos_public_read'
  ) then
    create policy "fogo_recipe_step_photos_public_read"
    on storage.objects
    for select
    using (bucket_id = 'recipe-step-photos');
  end if;
end $$;

-- Authenticated users can upload recipe step photos.
do $$
begin
  if not exists (
    select 1
    from pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname = 'fogo_recipe_step_photos_authenticated_insert'
  ) then
    create policy "fogo_recipe_step_photos_authenticated_insert"
    on storage.objects
    for insert
    to authenticated
    with check (bucket_id = 'recipe-step-photos');
  end if;
end $$;

-- Authenticated users can replace recipe step photos.
do $$
begin
  if not exists (
    select 1
    from pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname = 'fogo_recipe_step_photos_authenticated_update'
  ) then
    create policy "fogo_recipe_step_photos_authenticated_update"
    on storage.objects
    for update
    to authenticated
    using (bucket_id = 'recipe-step-photos')
    with check (bucket_id = 'recipe-step-photos');
  end if;
end $$;

-- Authenticated users can delete obsolete recipe step photos.
do $$
begin
  if not exists (
    select 1
    from pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname = 'fogo_recipe_step_photos_authenticated_delete'
  ) then
    create policy "fogo_recipe_step_photos_authenticated_delete"
    on storage.objects
    for delete
    to authenticated
    using (bucket_id = 'recipe-step-photos');
  end if;
end $$;
