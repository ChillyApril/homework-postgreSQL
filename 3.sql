select  area_id,
    avg(compensation_to) as avg_max,
    avg(compensation_from) as avg_min,
    avg((compensation_to + compensation_from) / 2) as avg_avg
from vacancy
group by area_id;