do $$
declare
  target record;
begin
  for target in
    select *
    from (values
      ('public', 'app_content_blocks', 'app_content_blocks_write_admin'),
      ('public', 'document_types', 'document_types_write_admin'),
      ('public', 'employee_devices', 'employee_devices_insert'),
      ('public', 'employee_devices', 'employee_devices_select'),
      ('public', 'employee_devices', 'employee_devices_update'),
      ('public', 'employee_push_tokens', 'employee_push_tokens_delete_self'),
      ('public', 'employee_push_tokens', 'employee_push_tokens_insert_self'),
      ('public', 'employee_push_tokens', 'employee_push_tokens_select_self'),
      ('public', 'employee_push_tokens', 'employee_push_tokens_update_self'),
      ('public', 'employee_sites', 'employee_sites_select_owner'),
      ('public', 'employee_sites', 'employee_sites_select_self'),
      ('public', 'employee_sites', 'employee_sites_write_admin'),
      ('public', 'employee_sites', 'employee_sites_write_owner'),
      ('public', 'employees', 'employees_select_area'),
      ('public', 'employees', 'employees_select_self'),
      ('public', 'inventory_lpn_items', 'Employees can view LPN items of their sites'),
      ('public', 'inventory_lpn_items', 'Staff can manage LPN items'),
      ('public', 'support_messages', 'support_messages_insert'),
      ('public', 'support_messages', 'support_messages_select'),
      ('public', 'support_tickets', 'support_tickets_insert'),
      ('public', 'support_tickets', 'support_tickets_select'),
      ('public', 'support_tickets', 'support_tickets_update')
    ) as policies(schema_name, table_name, policy_name)
  loop
    if exists (
      select 1
      from pg_policies p
      where p.schemaname = target.schema_name
        and p.tablename = target.table_name
        and p.policyname = target.policy_name
    ) then
      execute format(
        'alter policy %I on %I.%I to authenticated',
        target.policy_name,
        target.schema_name,
        target.table_name
      );
    else
      raise notice 'Policy %.%.% does not exist; role restriction skipped.',
        target.schema_name,
        target.table_name,
        target.policy_name;
    end if;
  end loop;
end
$$;
