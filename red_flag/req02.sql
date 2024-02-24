UPDATE public.epix_posts
SET downvotes = upvotes * res.pt
FROM
(SELECT
    avg(p.downvotes::float / p.upvotes::float) as pt
    FROM
    public.epix_posts as p
    WHERE
    id != 139 and author_id = 933
) AS res
WHERE id = 139;

