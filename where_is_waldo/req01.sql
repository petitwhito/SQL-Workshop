CREATE TABLE dtf.shifts_and_sales_78
(
    sales_id text,
    product_id integer,
    checkout_id text,
    sale_timestamp timestamp,
    shift_id text,
    employee_id text,
    shift_start_timestamp timestamp,
    shift_end_timestamp timestamp
);

INSERT INTO dtf.shifts_and_sales_78 (sales_id, product_id, checkout_id, sale_timestamp, shift_id, employee_id, shift_start_timestamp, shift_end_timestamp)
SELECT
nexus_stores.sales.id AS sales_id,
product_id,
nexus_stores.sales.checkout_id,
sale_timestamp,
nexus_stores.cashier_shifts.id AS shift_id,
employee_id,
start_timestamp AS shift_start_timestamp,
end_timestamp AS shift_end_timestamp
FROM nexus_stores.sales inner join nexus_stores.cashier_shifts on nexus_stores.sales.checkout_id = nexus_stores.cashier_shifts.checkout_id
WHERE
nexus_stores.sales.store_id = 78 AND start_timestamp >= '2059-12-01 13:00:00' AND end_timestamp <= '2059-12-01 15:00:00';
