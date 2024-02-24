SELECT first_name, last_name, death_date, social_credit_balance FROM
public.people
WHERE  death_date is not null
ORDER BY death_date DESC, social_credit_balance DESC
LIMIT 100
