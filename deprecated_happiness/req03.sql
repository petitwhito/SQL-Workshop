ALTER TABLE migration.companies
ADD growth numeric(6,2) not null default 0;

ALTER TABLE migration.companies
ADD CONSTRAINT growth CHECK (growth >= 0 AND abs(growth) <= 1000);
