begin;

revoke all on function public.set_attendance_log_shift_context() from public;
revoke all on function public.set_attendance_log_shift_context() from anon;
revoke all on function public.set_attendance_log_shift_context() from authenticated;

notify pgrst, 'reload schema';

commit;
