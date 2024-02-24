CREATE TYPE public.prefix AS ENUM
(
    'MRS',
    'MS',
    'MR',
    'DR'
);

CREATE TABLE dtf.madelines_contacts
(
    id integer PRIMARY KEY,
    title public.prefix,
    first_name text,
    last_name text,
    phone text,
    email text,
    favorite boolean,
    created_at timestamp
);
