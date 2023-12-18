CREATE TABLE employer (
      employer_id serial primary key,
      employer_name text not null,
      area_id integer not null
);
CREATE TABLE vacancy (
     vacancy_id serial primary key,
     employer_id integer not null references employer (employer_id),
     position_name text not null,
     compensation_from integer,
     compensation_to integer
);
CREATE TABLE specialization (
    spec_id integer primary key,
    spec_name text not null
);
CREATE TABLE employee (
    employee_id integer primary key,
    employee_name text not null,
    area_id integer not null
);
