SELECT
m.id,
m.checkout_id,
m.employee_id,
m.store_id AS shift_store_id,
t.store_id AS checkout_store_id,
m.start_timestamp,
m.end_timestamp
FROM nexus_stores.cashier_shifts AS m JOIN nexus_stores.checkouts AS t ON t.id = m.checkout_id;
