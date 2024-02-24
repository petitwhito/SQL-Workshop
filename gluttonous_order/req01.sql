SELECT t.id
FROM public.scrooge_eats_accounts AS t, public.companies
WHERE name = 'DTF' AND t.company_id = public.companies.id;
