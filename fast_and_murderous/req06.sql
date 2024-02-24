SELECT DISTINCT purchase_date,first_name,last_name,email,name,price,category
FROM nexus_stores.receipts AS r, nexus_stores.products AS p,
nexus_stores.receipt_items AS ri
WHERE email SIMILAR TO 's[a|e]m[a-z]{3,6}_w[a-z]{6}[0-9]*@roger_[a-z]+.[a-z]{3}'
AND ri.receipt_id = r.id AND ri.product_id = p.id AND name ~* 'apple';
