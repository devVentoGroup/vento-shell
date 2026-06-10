-- =====================================================================================
-- VENTO OS / NUMERA
-- Economic foundation: periods, operating expenses, budgets and read models.
--
-- This is not formal accounting. It is the operational-economic layer used by
-- Numera to read cost centers, expenses, budgets and break-even assumptions.
-- =====================================================================================

begin;

create table if not exists public.numera_periods (
  id uuid primary key default gen_random_uuid(),
  period_month date not null,
  label text not null,
  status text not null default 'open',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint numera_periods_month_start_check check (period_month = date_trunc('month', period_month)::date),
  constraint numera_periods_label_not_blank check (btrim(label) <> ''),
  constraint numera_periods_status_check check (status in ('open', 'closed', 'locked')),
  constraint numera_periods_month_unique unique (period_month)
);

create table if not exists public.numera_expense_categories (
  id uuid primary key default gen_random_uuid(),
  code text not null,
  name text not null,
  expense_kind text not null default 'fixed',
  is_active boolean not null default true,
  sort_order integer not null default 100,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint numera_expense_categories_code_not_blank check (btrim(code) <> ''),
  constraint numera_expense_categories_name_not_blank check (btrim(name) <> ''),
  constraint numera_expense_categories_kind_check check (expense_kind in ('fixed', 'variable', 'one_time')),
  constraint numera_expense_categories_code_unique unique (code)
);

create table if not exists public.numera_expenses (
  id uuid primary key default gen_random_uuid(),
  period_id uuid not null references public.numera_periods(id),
  cost_center_id uuid null references public.cost_centers(id),
  site_id uuid null references public.sites(id),
  category_id uuid not null references public.numera_expense_categories(id),
  expense_date date not null default current_date,
  description text not null,
  amount numeric not null,
  currency text not null default 'COP',
  source_app text null,
  source_table text null,
  source_id uuid null,
  metadata jsonb not null default '{}'::jsonb,
  created_by uuid null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint numera_expenses_description_not_blank check (btrim(description) <> ''),
  constraint numera_expenses_amount_non_negative check (amount >= 0),
  constraint numera_expenses_currency_not_blank check (btrim(currency) <> ''),
  constraint numera_expenses_center_or_site_check check (cost_center_id is not null or site_id is not null)
);

create table if not exists public.numera_cost_center_budgets (
  id uuid primary key default gen_random_uuid(),
  period_id uuid not null references public.numera_periods(id),
  cost_center_id uuid not null references public.cost_centers(id),
  budget_amount numeric not null default 0,
  expected_revenue numeric not null default 0,
  target_gross_margin_pct numeric null,
  notes text null,
  created_by uuid null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint numera_budgets_amount_non_negative check (budget_amount >= 0),
  constraint numera_budgets_expected_revenue_non_negative check (expected_revenue >= 0),
  constraint numera_budgets_margin_pct_check check (target_gross_margin_pct is null or (target_gross_margin_pct > 0 and target_gross_margin_pct <= 100)),
  constraint numera_budgets_period_center_unique unique (period_id, cost_center_id)
);

create index if not exists numera_expenses_period_idx
  on public.numera_expenses (period_id, expense_date desc);

create index if not exists numera_expenses_cost_center_idx
  on public.numera_expenses (cost_center_id, period_id)
  where cost_center_id is not null;

create index if not exists numera_expenses_site_idx
  on public.numera_expenses (site_id, period_id)
  where site_id is not null;

create index if not exists numera_expenses_category_idx
  on public.numera_expenses (category_id, period_id);

create index if not exists numera_budgets_period_idx
  on public.numera_cost_center_budgets (period_id, cost_center_id);

create or replace function public.set_numera_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_numera_periods_updated_at on public.numera_periods;
create trigger trg_numera_periods_updated_at
before update on public.numera_periods
for each row execute function public.set_numera_updated_at();

drop trigger if exists trg_numera_expense_categories_updated_at on public.numera_expense_categories;
create trigger trg_numera_expense_categories_updated_at
before update on public.numera_expense_categories
for each row execute function public.set_numera_updated_at();

drop trigger if exists trg_numera_expenses_updated_at on public.numera_expenses;
create trigger trg_numera_expenses_updated_at
before update on public.numera_expenses
for each row execute function public.set_numera_updated_at();

drop trigger if exists trg_numera_budgets_updated_at on public.numera_cost_center_budgets;
create trigger trg_numera_budgets_updated_at
before update on public.numera_cost_center_budgets
for each row execute function public.set_numera_updated_at();

alter table public.numera_periods enable row level security;
alter table public.numera_expense_categories enable row level security;
alter table public.numera_expenses enable row level security;
alter table public.numera_cost_center_budgets enable row level security;

drop policy if exists numera_periods_select on public.numera_periods;
create policy numera_periods_select
on public.numera_periods for select to authenticated
using (has_permission('numera.access'));

drop policy if exists numera_periods_manage on public.numera_periods;
create policy numera_periods_manage
on public.numera_periods for all to authenticated
using (has_permission('numera.expenses.manage') or has_permission('numera.cost_centers.manage'))
with check (has_permission('numera.expenses.manage') or has_permission('numera.cost_centers.manage'));

drop policy if exists numera_categories_select on public.numera_expense_categories;
create policy numera_categories_select
on public.numera_expense_categories for select to authenticated
using (has_permission('numera.access'));

drop policy if exists numera_categories_manage on public.numera_expense_categories;
create policy numera_categories_manage
on public.numera_expense_categories for all to authenticated
using (has_permission('numera.expenses.manage'))
with check (has_permission('numera.expenses.manage'));

drop policy if exists numera_expenses_select on public.numera_expenses;
create policy numera_expenses_select
on public.numera_expenses for select to authenticated
using (has_permission('numera.expenses.view') or has_permission('numera.expenses.manage'));

drop policy if exists numera_expenses_manage on public.numera_expenses;
create policy numera_expenses_manage
on public.numera_expenses for all to authenticated
using (has_permission('numera.expenses.manage'))
with check (has_permission('numera.expenses.manage'));

drop policy if exists numera_budgets_select on public.numera_cost_center_budgets;
create policy numera_budgets_select
on public.numera_cost_center_budgets for select to authenticated
using (has_permission('numera.cost_centers.view') or has_permission('numera.cost_centers.manage'));

drop policy if exists numera_budgets_manage on public.numera_cost_center_budgets;
create policy numera_budgets_manage
on public.numera_cost_center_budgets for all to authenticated
using (has_permission('numera.cost_centers.manage'))
with check (has_permission('numera.cost_centers.manage'));

grant select, insert, update, delete on public.numera_periods to authenticated;
grant select, insert, update, delete on public.numera_expense_categories to authenticated;
grant select, insert, update, delete on public.numera_expenses to authenticated;
grant select, insert, update, delete on public.numera_cost_center_budgets to authenticated;
grant all on public.numera_periods to service_role;
grant all on public.numera_expense_categories to service_role;
grant all on public.numera_expenses to service_role;
grant all on public.numera_cost_center_budgets to service_role;

insert into public.numera_expense_categories (code, name, expense_kind, sort_order)
values
  ('rent', 'Arriendo', 'fixed', 10),
  ('payroll', 'Nomina', 'fixed', 20),
  ('utilities', 'Servicios publicos', 'fixed', 30),
  ('maintenance', 'Mantenimiento', 'variable', 40),
  ('marketing', 'Mercadeo', 'variable', 50),
  ('supplies', 'Insumos no inventariables', 'variable', 60),
  ('other', 'Otros gastos', 'one_time', 100)
on conflict (code)
do update set
  name = excluded.name,
  expense_kind = excluded.expense_kind,
  sort_order = excluded.sort_order,
  is_active = true,
  updated_at = now();

create or replace view public.numera_cost_center_monthly_summary
with (security_invoker = true)
as
select
  p.id as period_id,
  p.period_month,
  p.label as period_label,
  cc.id as cost_center_id,
  cc.site_id,
  cc.name as cost_center_name,
  cc.code as cost_center_code,
  cc.type as cost_center_type,
  coalesce(b.budget_amount, 0) as budget_amount,
  coalesce(b.expected_revenue, 0) as expected_revenue,
  b.target_gross_margin_pct,
  coalesce(sum(e.amount), 0) as actual_expenses,
  coalesce(sum(e.amount) filter (where ec.expense_kind = 'fixed'), 0) as fixed_expenses,
  coalesce(sum(e.amount) filter (where ec.expense_kind = 'variable'), 0) as variable_expenses,
  coalesce(sum(e.amount) filter (where ec.expense_kind = 'one_time'), 0) as one_time_expenses,
  coalesce(b.budget_amount, 0) - coalesce(sum(e.amount), 0) as budget_variance,
  case
    when b.target_gross_margin_pct is null or b.target_gross_margin_pct <= 0 then null
    else round((coalesce(sum(e.amount) filter (where ec.expense_kind = 'fixed'), 0) / (b.target_gross_margin_pct / 100.0))::numeric, 2)
  end as break_even_revenue
from public.numera_periods p
cross join public.cost_centers cc
left join public.numera_cost_center_budgets b
  on b.period_id = p.id
 and b.cost_center_id = cc.id
left join public.numera_expenses e
  on e.period_id = p.id
 and (
   e.cost_center_id = cc.id
   or (e.cost_center_id is null and e.site_id is not null and e.site_id = cc.site_id)
 )
left join public.numera_expense_categories ec
  on ec.id = e.category_id
where cc.is_active is not false
group by
  p.id,
  p.period_month,
  p.label,
  cc.id,
  cc.site_id,
  cc.name,
  cc.code,
  cc.type,
  b.budget_amount,
  b.expected_revenue,
  b.target_gross_margin_pct;

grant select on public.numera_cost_center_monthly_summary to authenticated;
grant select on public.numera_cost_center_monthly_summary to service_role;

create or replace function public.numera_current_period_summary()
returns table (
  period_id uuid,
  period_month date,
  period_label text,
  cost_centers bigint,
  budget_amount numeric,
  expected_revenue numeric,
  actual_expenses numeric,
  fixed_expenses numeric,
  variable_expenses numeric,
  one_time_expenses numeric,
  break_even_revenue numeric
)
language sql
stable
security invoker
as $$
  with current_period as (
    select id
    from public.numera_periods
    where period_month = date_trunc('month', current_date)::date
    order by period_month desc
    limit 1
  )
  select
    s.period_id,
    s.period_month,
    s.period_label,
    count(s.cost_center_id) as cost_centers,
    coalesce(sum(s.budget_amount), 0) as budget_amount,
    coalesce(sum(s.expected_revenue), 0) as expected_revenue,
    coalesce(sum(s.actual_expenses), 0) as actual_expenses,
    coalesce(sum(s.fixed_expenses), 0) as fixed_expenses,
    coalesce(sum(s.variable_expenses), 0) as variable_expenses,
    coalesce(sum(s.one_time_expenses), 0) as one_time_expenses,
    coalesce(sum(s.break_even_revenue), 0) as break_even_revenue
  from public.numera_cost_center_monthly_summary s
  join current_period cp on cp.id = s.period_id
  group by s.period_id, s.period_month, s.period_label;
$$;

grant execute on function public.numera_current_period_summary() to authenticated;
grant execute on function public.numera_current_period_summary() to service_role;

insert into public.numera_periods (period_month, label, status)
values (date_trunc('month', current_date)::date, to_char(current_date, 'YYYY-MM'), 'open')
on conflict (period_month)
do nothing;

commit;

select 'numera_periods' as check_name, count(*) as rows from public.numera_periods;
select 'numera_expense_categories' as check_name, count(*) as rows from public.numera_expense_categories;
select 'numera_summary_view' as check_name, count(*) as rows from public.numera_cost_center_monthly_summary;