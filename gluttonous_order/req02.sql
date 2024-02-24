INSERT INTO scrooge_eats_orders (id, account_id, ordered_at)
SELECT
    10000 as id,
    t.id as account_id,
    now() as ordered_at
FROM public.scrooge_eats_accounts AS t, public.companies
WHERE name = 'DTF' AND t.company_id = public.companies.id;
