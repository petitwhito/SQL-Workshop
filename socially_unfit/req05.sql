SELECT id, person_id, credits_change, action_description
FROM public.social_credit_history
WHERE date >= '2059-12-03 17:00' AND date <= '2059-12-03 22:00'
ORDER BY credits_change ASC, id ASC
limit 10;
