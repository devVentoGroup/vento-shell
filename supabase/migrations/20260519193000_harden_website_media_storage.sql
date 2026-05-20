begin;

-- There is no public website surface attached to this database today. Keep the
-- CMS media bucket private and readable only by signed-in users.
update storage.buckets
set public = false
where id = 'website-media';

drop policy if exists "website_media_read" on storage.objects;

create policy "website_media_authenticated_read"
on storage.objects
for select
to authenticated
using (bucket_id = 'website-media');

commit;
