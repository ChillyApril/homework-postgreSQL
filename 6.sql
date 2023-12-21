/* Создал два индекса для группировки мерджа. Выглдяти так что индекс для ECTRACT создавать не имеет смысла.
*/
create index compensation on vacancy area_id;
create index index_v_id on vacancy (vacancy_id);
create index index_apv_id on applications (vacancy_id)
