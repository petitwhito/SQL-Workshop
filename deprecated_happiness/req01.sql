CREATE SCHEMA migration;

CREATE TABLE migration.companies ( like public.companies INCLUDING ALL);
INSERT INTO migration.companies SELECT * FROM public.companies;

CREATE TABLE migration.jobs
(
    like public.jobs INCLUDING ALL,
    FOREIGN KEY (company_id) REFERENCES migration.companies(id)
);
INSERT INTO migration.jobs SELECT * FROM public.jobs;


CREATE TABLE migration.patients_records ( LIKE public.patients_records INCLUDING ALL);
INSERT INTO migration.patients_records SELECT * FROM public.patients_records;

CREATE TABLE migration.medical_record_entries
(
    LIKE public.medical_record_entries INCLUDING ALL,
    FOREIGN KEY (patient_id) REFERENCES migration.patients_records(id)
);
INSERT INTO migration.medical_record_entries SELECT * FROM public.medical_record_entries;
