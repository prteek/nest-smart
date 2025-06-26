select *
from ukre.combined_indices_long
where area_type = 'region'
and asset_class in ('flat', 'terraced', 'all')