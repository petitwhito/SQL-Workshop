SELECT
emp.id as employee_id,
p.id as person_id,
p.first_name,
p.last_name
FROM public.people AS p
    JOIN
        nexus_stores.employees as emp on p.id = emp.person_id
    JOIN
        nexus_stores.cashier_shifts as shf on shf.employee_id = emp.id
WHERE shf.store_id = 78 AND emp.position = 'CASHIER'
EXCEPT
(SELECT
emp.id as employee_id,
p.id as person_id,
p.first_name,
p.last_name
FROM
    public.people AS p
    JOIN
        nexus_stores.employees as emp on p.id = emp.person_id
    JOIN
        nexus_stores.cashier_shifts as shf on shf.employee_id = emp.id
WHERE shf.store_id = 78 AND start_timestamp >= '2059-12-01 13:00:00' AND end_timestamp <= '2059-12-01 15:00:00');
