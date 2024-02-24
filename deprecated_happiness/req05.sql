UPDATE migration.medical_record_entries
SET description = LEFT(description, 97) || '...'
WHERE LENGTH(description) > 100;

ALTER TABLE migration.medical_record_entries
ALTER COLUMN description type VARCHAR(100);
