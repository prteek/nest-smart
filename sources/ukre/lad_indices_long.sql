select *
from ukre.combined_indices_long
where area_type = 'lad'
-- and asset_class in ('flat', 'terraced', 'all')
and time_period >= cast('2020-01-01' as date)
