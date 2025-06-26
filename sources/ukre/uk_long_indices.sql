with hpi_long as (
select time_period
, area_name
, average_price as price
, 'all' as asset_class
from ukre.hpi
where area_name = 'united kingdom'
union
select time_period
, area_name
, detached_price as price
, 'detached' as asset_class
from ukre.hpi
where area_name = 'united kingdom'
union
select time_period
, area_name
, semi_detached_price as price
, 'semi_detached' as asset_class
from ukre.hpi
where area_name = 'united kingdom'
union
select time_period
, area_name
, terraced_price as price
, 'terraced' as asset_class
from ukre.hpi
where area_name = 'united kingdom'
union
select time_period
, area_name
, flat_price as price
, 'flat' as asset_class
from ukre.hpi
where area_name = 'united kingdom'
)
,
pipr_long as (
select time_period
, area_name
, average_price as price
, 'all' as asset_class
from ukre.pipr
where area_name = 'united kingdom'
union
select time_period
, area_name
, detached_price as price
, 'detached' as asset_class
from ukre.pipr
where area_name = 'united kingdom'
union
select time_period
, area_name
, semi_detached_price as price
, 'semi_detached' as asset_class
from ukre.pipr
where area_name = 'united kingdom'
union
select time_period
, area_name
, terraced_price as price
, 'terraced' as asset_class
from ukre.pipr
where area_name = 'united kingdom'
union
select time_period
, area_name
, flat_price as price
, 'flat' as asset_class
from ukre.pipr
where area_name = 'united kingdom'
)
select *
, 'buy' as type
from hpi_long
where price is not null
union
select *
, 'rent' as type
from pipr_long
where price is not null