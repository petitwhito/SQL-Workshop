SELECT
    person_id,
    people.first_name as person_first_name,
    people.last_name as person_last_name,
    created_at,
    'metro' as place,
    station_id as place_id
FROM transport.metro_usage_logs as ml, people
WHERE people.id = person_id AND created_at >= '2059-12-03 17:00:00' AND created_at <= '2059-12-03 22:00:00'
GROUP BY station_id, person_id, people.first_name, people.last_name, created_at

UNION

SELECT
    person_id,
    people.first_name as person_first_name,
    people.last_name as person_last_name,
    created_at,
    'shop' as place,
    shop_id as place_id
FROM public.shop_entrance_logs as el, people
WHERE people.id = person_id AND created_at >= '2059-12-03 17:00:00' AND created_at <= '2059-12-03 22:00:00'
GROUP BY shop_id, person_id, people.first_name, people.last_name, created_at

UNION

SELECT
    person_id,
    people.first_name as person_first_name,
    people.last_name as person_last_name,
    created_at,
    'street' as place,
    street_id as place_id
FROM public.street_logs as sl, people
WHERE people.id = person_id AND created_at >= '2059-12-03 17:00:00' AND created_at <= '2059-12-03 22:00:00'
GROUP BY street_id, person_id, people.first_name, people.last_name, created_at

ORDER BY
created_at ASC, person_id ASC
