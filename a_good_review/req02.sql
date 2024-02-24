INSERT INTO public.scrooge_eats_reviews (account_id, rating, review)
VALUES
    ((SELECT t.id FROM public.scrooge_eats_accounts AS t, public.companies
WHERE name = 'DTF' AND t.company_id = public.companies.id), 5, 'Very good service');
