CREATE SCHEMA rr_times;

CREATE TABLE rr_times.locales
(
    language_code char(2) not null,
    country_code char(2) not null,
    name varchar(50) not null unique,

    PRIMARY KEY (language_code, country_code)
);

CREATE TABLE rr_times.translated_articles
(
    id serial PRIMARY KEY,
    title text not null,
    body text not null
);


