UPDATE dtf.madelines_contacts
SET
email = lower(dtf.madelines_contacts.first_name || '.' || dtf.madelines_contacts.last_name || '@roger_roger.com');

