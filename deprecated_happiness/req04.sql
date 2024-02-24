ALTER TABLE migration.patients_records
ADD person_id integer;

UPDATE migration.patients_records
SET person_id = f.peo
FROM
(SELECT
    p.id as peo,
    pi.patient_id as patient
FROM medical_confidential.patients_ids as pi, people as p
WHERE p.id = pi.person_id) AS f
WHERE f.patient = id;


ALTER TABLE migration.patients_records
ADD CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES people(id);

