SELECT
    filename,
    size
FROM dtf.madelines_files WHERE size > 0.75*
(SELECT
    avg(size)
FROM
    dtf.madelines_files
)
ORDER BY size DESC
