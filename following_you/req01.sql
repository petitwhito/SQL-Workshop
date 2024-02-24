SELECT id, first_name, last_name FROM public.people as p

WHERE EXISTS (
    SELECT 1 from transport.metro_stations as s, transport.metro_usage_logs as l
    WHERE name ILIKE '%Morgane Abeille%' AND s.id = l.station_id AND p.id = l.person_id
);
