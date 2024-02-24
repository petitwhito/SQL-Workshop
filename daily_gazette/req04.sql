CREATE TABLE rr_times.articles
(
    id serial PRIMARY KEY,
    translated_article_id integer REFERENCES rr_times.translated_articles (id) ON DELETE CASCADE,
    rubric_id integer REFERENCES rr_times.rubrics (id) ON DELETE CASCADE,
    language char(2),
    country char(2),
    FOREIGN KEY (
        language, country
    ) REFERENCES rr_times.locales(language_code, country_code) ON DELETE CASCADE
);
