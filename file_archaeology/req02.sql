SELECT
    filename,
    size
FROM dtf.madelines_files WHERE size in
(SELECT
    max(size)
FROM
    dtf.madelines_files
WHERE created_at <= '2059-12-03' AND created_at >= '2059-11-25')
AND created_at <= '2059-12-03' AND created_at >= '2059-11-27'
ORDER BY filename
