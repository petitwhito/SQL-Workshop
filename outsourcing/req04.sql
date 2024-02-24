SELECT
    people.id AS person_id,
    people.first_name,
    people.last_name,
    out.created_at,
    out.serving_time,
    out.created_at
    + (out.serving_time || 'month')::interval
    - (COALESCE(amount,0) || 'month')::interval
    AS release_date
INTO public.release_dates
FROM
    justice.defendants AS defendants,
    justice.outcomes AS out
    LEFT JOIN justice.sentence_reductions ON out.id = sentence_reductions.outcome_id,
    justice.trials AS trials,
    justice.cases AS cases,
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
ORDER BY
    release_date DESC,
    out.serving_time DESC
;
