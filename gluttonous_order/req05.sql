INSERT INTO scrooge_eats_orders (id, account_id, ordered_at)
SELECT
    10001 as id,
    t.id as account_id,
    now() as ordered_at
FROM public.scrooge_eats_accounts AS t, public.companies
WHERE name = 'DTF' AND t.company_id = public.companies.id;


INSERT INTO scrooge_eats_basket_items (order_id, item_id, quantity)
VALUES
    (10001, (SELECT t.id as item_id FROM scrooge_eats_items as t WHERE t.name = 'Tacos'), 1),
    (10001, (SELECT t.id as item_id FROM scrooge_eats_items as t WHERE t.name = 'Coca-Cola'), 1),
    (10001, (SELECT t.id as item_id FROM scrooge_eats_items as t WHERE t.name = 'Kinder Bueno White'), 1);

