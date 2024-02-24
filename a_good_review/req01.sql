INSERT INTO public.scrooge_eats_reviews (account_id, order_id, rating, review)
VALUES
    ((SELECT t.id FROM public.scrooge_eats_accounts AS t, public.companies
WHERE name = 'DTF' AND t.company_id = public.companies.id), 10001, 5, 'Very good');
