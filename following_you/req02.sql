SELECT id, street_id, created_at, person_id FROM
backup.street_logs
WHERE id NOT IN(SELECT id FROM public.street_logs);
