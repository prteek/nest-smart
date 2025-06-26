select *
from ukre.combined_indices_long
where area_name = 'united kingdom'
and asset_class in ('flat', 'terraced', 'all')