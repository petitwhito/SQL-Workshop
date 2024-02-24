SELECT * FROM public.traffic_violations
WHERE license_plate LIKE '%AZ__36_%'
AND violation_date <= '2059-12-03 22:00:00'
AND violation_date >= '2059-12-03 20:00:00';
