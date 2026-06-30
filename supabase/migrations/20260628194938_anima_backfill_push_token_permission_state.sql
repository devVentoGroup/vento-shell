update public.employee_push_tokens
set
  notifications_enabled = true,
  permission_status = coalesce(permission_status, 'granted'),
  permission_updated_at = coalesce(permission_updated_at, now())
where is_active = true
  and notifications_enabled is null;
