CREATE TABLE rr_times.translated_headlines
(
    id serial PRIMARY KEY,
    title text not null,
    subtitle text
);

CREATE TABLE rr_times.issues
(
    id serial PRIMARY KEY,
    issued_at date not null,
    language char(2),
    country char(2),
    translated_headline_id integer REFERENCES rr_times.translated_headlines (id) ON DELETE RESTRICT,
    FOREIGN KEY (
        language, country
    ) REFERENCES rr_times.locales(language_code, country_code) ON DELETE SET NULL
);
