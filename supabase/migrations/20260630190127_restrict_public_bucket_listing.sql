begin;

drop policy if exists commercial_menu_images_select_public on storage.objects;
drop policy if exists employee_photos_read on storage.objects;
drop policy if exists nexo_catalog_images_public_read on storage.objects;
drop policy if exists pass_satellite_logos_read on storage.objects;
drop policy if exists product_images_public_read on storage.objects;
drop policy if exists product_images_read on storage.objects;
drop policy if exists fogo_recipe_step_photos_public_read on storage.objects;

commit;
