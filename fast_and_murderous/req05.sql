SELECT receipt_id, name, quantity, price
FROM nexus_stores.receipt_items, nexus_stores.products
WHERE nexus_stores.receipt_items.product_id = nexus_stores.products.id
AND name ~* 'apple'
AND quantity > 10;

