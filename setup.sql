-- Run once in Supabase: SQL Editor > New query > paste > Run.
create table if not exists public.regimen_days (
  user_id    uuid not null references auth.users (id) on delete cascade,
  day        date not null,
  tasks      jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, day)
);

alter table public.regimen_days enable row level security;

-- Each person can only see and change their own days.
create policy "read own days"   on public.regimen_days for select using (auth.uid() = user_id);
create policy "insert own days" on public.regimen_days for insert with check (auth.uid() = user_id);
create policy "update own days" on public.regimen_days for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete own days" on public.regimen_days for delete using (auth.uid() = user_id);
