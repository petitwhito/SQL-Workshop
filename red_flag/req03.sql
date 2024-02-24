DELETE FROM public.epix_posts as ps
USING public.epix_hashtags as hs, people, public.epix_accounts as acc
WHERE
hs.id = ps.hashtag_id
AND
people.id = person_id
AND
acc.id = ps.author_id
AND
hs.name ILIKE '%EndSurveillance%'
RETURNING first_name, last_name, username, ps.body as post_content;
