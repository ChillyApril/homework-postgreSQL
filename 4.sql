select extract(MONTH from created_at) as mon
from vacancy
group by mon
order by count(vacancy_id) DESC
limit 1;