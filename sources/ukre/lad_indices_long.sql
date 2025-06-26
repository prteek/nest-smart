select *
from ukre.combined_indices_long
where area_type = 'lad'
and ((type='rent' and asset_class in ('flat', 'terraced', 'all')) or (type='buy' and asset_class in ('flat', 'terraced', 'all')))
