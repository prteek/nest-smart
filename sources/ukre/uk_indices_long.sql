select *
from ukre.house_price_indices
where area_name = 'united kingdom'
-- and asset_class in ('flat', 'terraced', 'all')
and time_period >= cast('2020-01-01' as date)