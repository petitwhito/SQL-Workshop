SELECT
    f.owner,
    count(*) as num_files
FROM dtf.madelines_files as f

GROUP BY f.owner

HAVING
(
    SELECT min(subquery.nb)
    FROM
    (
    SELECT
        count(*) as nb
    FROM
        dtf.madelines_files
    GROUP BY
        owner
    ) AS subquery
) = count(*)
ORDER BY f.owner;
