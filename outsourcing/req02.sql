SELECT
    people.id AS person_id,
    people.first_name,
    people.last_name,
    people.birth_date,
    out.created_at AS conviction_date,
    out.serving_time,
    CASE
        WHEN out.created_at + (out.serving_time || 'month')::interval <= timestamp '2059-12-03' THEN 't'
        ELSE 'f'
    END AS could_be_released
INTO outcome_status
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
    AND out.outcome = 'GUILTY'
    AND cases.classification = 'CRIME'
;
