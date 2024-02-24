INSERT INTO scrooge_eats_basket_items (order_id, item_id, quantity)
SELECT
    10000 as order_id,
    t.id as item_id,
    1 as quantity
FROM scrooge_eats_items as t
WHERE t.name = 'Kinder Bueno White';
