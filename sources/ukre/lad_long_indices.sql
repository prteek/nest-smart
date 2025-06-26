select a.area_name
, b.area_code
, 'all' as asset_class
, 'rent' as type
, time_period
, average_price
from ukre.pipr a inner join geo.area_types b on a.area_name = b.area_name
where b.type = 'lad'
union
select a.area_name
, b.area_code
, 'all' as asset_class
, 'buy' as type
, time_period
, average_price
from ukre.hpi a inner join geo.area_types b on a.area_name = b.area_name
where b.type = 'lad'