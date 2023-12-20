CREATE TABLE specialization (
    spec_id serial primary key,
    title text not null
);
CREATE TABLE vacancy (
    vacancy_id serial primary key,
    employer_id serial not null,
    area_id serial not null,
    spec_id serial not null REFERENCES specialization (spec_id),
    title text not null,
    created_at timestamp not null,
    compensation_from integer,
    compensation_to integer
);
CREATE TABLE resumes (
    resume_id serial primary key,
    user_id serial not null,
    spec_id serial not null REFERENCES specialization (spec_id),
    area_id serial not null,
    employment text,
    skills text,
    created_at timestamp not null
);
CREATE TABLE applications (
    app_id serial primary key,
    vacancy_id serial not null REFERENCES vacancy (vacancy_id),
    created_at timestamp not null,
    resume_id serial not null REFERENCES resumes (resume_id),
    ps text
);