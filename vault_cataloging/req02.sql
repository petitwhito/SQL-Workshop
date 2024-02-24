SELECT
    id,
    size as stored_size,
    decrypted,
    CASE
        WHEN size is null and decrypted then CAST(AVG(CASE WHEN decrypted then size END) OVER() AS BIGINT)
        WHEN size is null then CAST(AVG(CASE WHEN not decrypted then size END) OVER() AS BIGINT)

        ELSE size
    END AS calculated_size
FROM dtf.madelines_files_results
WHERE parent_id is not null
ORDER BY id;
