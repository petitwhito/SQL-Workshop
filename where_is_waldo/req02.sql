SELECT
count(*) FILTER (WHERE m.employee_id is NULL) AS null_employee_id_rows_count,
count(*) FILTER (WHERE m.store_id is NULL) AS null_store_id_rows_count
FROM nexus_stores.cashier_shifts AS m join nexus_stores.cashier_shifts AS t
ON t.id = m.id;

