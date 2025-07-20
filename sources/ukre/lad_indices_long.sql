select *
from ukre.house_price_indices
where area_type = 'lad'
and time_period >= cast('2020-01-01' as date)
