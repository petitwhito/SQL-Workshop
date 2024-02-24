SELECT person_id, justice.cases.id, content, description
FROM justice.testimonies, justice.cases
WHERE content LIKE '%Nexus N3%'
AND justice.testimonies.case_id = justice.cases.id
AND description SIMILAR TO '%(speeding|speed|fast|reckless)%';
