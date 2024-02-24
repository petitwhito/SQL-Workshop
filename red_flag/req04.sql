UPDATE public.epix_hashtags
SET deleted_at = default
WHERE name ILIKE '%EndSurveillance%';
