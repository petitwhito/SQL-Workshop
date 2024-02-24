SELECT
id,
regexp_replace(full_name,'[^\x00-\x7F]+', '', 'g') AS full_name,
regexp_replace(phone,'[^\x00-\x7F]+', '', 'g') AS phone,
regexp_replace(email,'[^\x00-\x7F]+', '', 'g') AS email,
regexp_replace(favorite,'[^\x00-\x7F]+', '', 'g') AS favorite,
regexp_replace(created_at,'[^\x00-\x7F]+', '', 'g') AS created_at
INTO TEMPORARY TABLE TABLE1
FROM dtf.madelines_contacts_corrupted;

SELECT
id,
regexp_replace(full_name,'[^a-zA-Z ]*', '', 'g') AS full_name,
regexp_replace(phone,'[^0-9.-]*', '', 'g') AS phone,
trim(trailing ' ' from email) as email,
regexp_replace(favorite,'[^01]*', '', 'g') AS favorite,
regexp_replace(created_at,'[^0-9:-]*', '', 'g') AS created_at
INTO TEMPORARY TABLE TABLE2
FROM TABLE1;

INSERT INTO dtf.madelines_contacts (id, title, first_name, last_name, phone, email, favorite, created_at)
SELECT
id,
upper(regexp_replace(full_name,'([a-zA-Z]+) ([a-zA-Z]+) ([a-zA-Z]+)',  '\1'))::prefix AS title,
initcap(regexp_replace(full_name,'([a-zA-Z]+) ([a-zA-Z]+) ([a-zA-Z]+)',  '\2')) AS first_name,
initcap(regexp_replace(full_name,'([a-zA-Z]+) ([a-zA-Z]+) ([a-zA-Z]+)',  '\3')) AS last_name,
( lpad(regexp_replace(phone,'([0-9]{0,3})[.-]([0-9]{0,3})[.-]([0-9]{0,3})', '\1'), 3, '0') || '.'
    || lpad(regexp_replace(phone,'([0-9]{0,3})[.-]([0-9]{0,3})[.-]([0-9]{0,3})', '\2'), 3, '0') || '.'  || lpad(regexp_replace(phone,'([0-9]{0,3})[.-]([0-9]{0,3})[.-]([0-9]{0,3})', '\3'), 3, '0')) as phone,
email,
favorite::boolean,
created_at::timestamp
FROM TABLE2;
