CREATE TYPE rr_times.rubric_theme AS ENUM
(
    'TECHNOLOGY',
    'ECONOMY',
    'HEALTH',
    'SPORT',
    'CULTURE',
    'POLITICS',
    'SCIENCE',
    'TRAVEL',
    'SOCIETY',
    'ENVIRONMENT',
    'EDUCATION',
    'MEDIA',
    'FASHION',
    'ARCHITECTURE',
    'BUSINESS',
    'SPACE'
);

CREATE TABLE rr_times.rubrics
(
    id serial PRIMARY KEY,
    theme rr_times.rubric_theme not null,
    nb_columns integer not null,
    issue_id integer REFERENCES rr_times.issues (id) ON DELETE CASCADE,
    UNIQUE(issue_id, theme)
);
