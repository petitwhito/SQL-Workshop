SELECT
    people.id AS person_id,
    people.first_name,
    people.last_name,
    people.birth_date,
    classification,
    description
INTO TEMPORARY not_guilty
FROM
    justice.defendants AS defendants,
    justice.trials AS trials,
    justice.cases AS cases,
    justice.outcomes AS out,
    people
WHERE
    defendants.person_id = people.id
    AND
    defendants.trial_id = out.trial_id
    AND
    out.trial_id = trials.id
    AND
    trials.case_id = cases.id
    AND out.outcome = 'NOT_GUILTY'
;
