SELECT
    person_id,
    validation,
    created_at
FROM transport.metro_usage_logs
WHERE created_at >= '2059-12-03 12:00:00' AND created_at <= '2059-12-03 14:00:00'

UNION
(
SELECT
    person_id,
    validation,
    created_at
FROM transport.metro_usage_logs
WHERE created_at >= '2059-12-03 20:00:00' AND created_at <= '2059-12-03 22:00:00'
ORDER BY created_at ASC
LIMIT 10
)

ORDER BY created_at DESC;
