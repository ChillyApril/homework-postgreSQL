select extract(MONTH from created_at) as mon
from resumes
group by mon
order by count(resume_id) DESC
limit 1;