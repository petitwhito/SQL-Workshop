SELECT trial_id, case_id, classification, description
INTO public.definitive_trials
FROM justice.defendants, justice.trials, justice.cases
WHERE justice.trials.status = 'FINISHED' and justice.defendants.trial_id = justice.trials.id
and justice.trials.case_id =  justice.cases.id
ORDER BY classification,  justice.cases.id;
