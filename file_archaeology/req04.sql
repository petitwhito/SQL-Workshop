SELECT
    parent_id AS folder_id,
    count(*) as nb_executables
FROM
    dtf.madelines_files
WHERE permissions ilike '%x%'
GROUP BY parent_id
HAVING count(*) >= 3
ORDER BY
parent_id NULLS FIRST;

