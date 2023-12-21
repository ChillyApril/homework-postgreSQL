insert into specialization (
    spec_id,
    title
)
SELECT
    i:: int,
    md5(random()::text)
from generate_series(1, 100) s(i);

with generated_data(vacancy_id, employer, area, spec, title, clock, salary) as (SELECT
    i as vacancy_id,
    (random() * 1000)::int as employer,
    (random() * 1000)::int as area,
    (1 + random() * 99)::int as spec,
    md5(random()::text) as title,
    timestamp '2023-01-01 00:00:00' + random() * (timestamp '2024-01-01 00:00:00' - timestamp '2023-01-01 00:00:00') as clock,
    round(15000 + (random() * 85000)::int, -3) as salary
from generate_series(1,10000) s(i))
insert into vacancy (
    vacancy_id,
    employer_id,
    area_id,
    spec_id,
    title,
    created_at,
    compensation_from,
    compensation_to
)
select vacancy_id, employer, area, spec, title, clock, salary, salary + round((salary * random()):: int, -3)
from generated_data;

insert into resumes (resume_id, user_id, spec_id, area_id,created_at)
select 
    i,
    (random() * 50000)::int,
    (1 + random() * 99)::int,
    (random() * 1000)::int,
    timestamp '2023-01-01 00:00:00' + random() * (timestamp '2024-01-01 00:00:00' - timestamp '2023-01-01 00:00:00') as clock
from generate_series(1,100000) s(i);
with generated_data(app, vacancy_id, resume_id) as (SELECT 
    i::int as app,
    (1 + random() * 9999)::int as vacancy_id,
    (1 + random() * 99999)::int as resume_id
from generate_series(1,10000) s(i))
insert into applications (app_id, vacancy_id, created_at, resume_id)
select app,
    vacancy.vacancy_id, 
    CASE 
        WHEN vacancy.created_at > resumes.created_at 
            THEN vacancy.created_at + (timestamp '2024-01-01 00:00:00' - vacancy.created_at) * random()
        ELSE resumes.created_at + (timestamp '2024-01-01 00:00:00' - resumes.created_at) * random()
        END,
    resumes.resume_id
from vacancy, resumes, generated_data
where vacancy.vacancy_id = generated_data.vacancy_id and generated_data.resume_id = resumes.resume_id;

select * from vacancy;
delete from vacancy;
delete from resumes;

delete from applications;

select max(vacancy_id) from vacancy; 
 DROP table vacancy;

