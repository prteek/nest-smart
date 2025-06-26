select *
from ukre.combined_indices_long
where area_type = 'region'
and asset_class in ('flat', 'terraced', 'all')
and time_period >= cast('2024-01-01' as date)