SELECT id, filename,
CASE
        WHEN decrypted THEN 'File was successfully decrypted.'
        ELSE (
            CASE
                WHEN ( SELECT decrypted from dtf.madelines_files_results WHERE t.parent_id = id)
                    THEN 'File was successfully decrypted because its containing folder was successfully decrypted.'
                ELSE
                    'File remains encrypted.'
                END
               )
END AS decryption_status
FROM dtf.madelines_files_results as t
ORDER BY id;
