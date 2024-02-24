SELECT 'metro' as place_type, count(*) as entries, station_id as place_id
FROM transport.metro_usage_logs as ml
GROUP BY station_id
UNION
SELECT 'shop' as place_type, count(*) as entries, shop_id as place_id
FROM public.shop_entrance_logs as sl
WHERE transit_type = 'ENTER'
GROUP BY shop_id
ORDER BY
entries DESC, place_id ASC, place_type DESC
