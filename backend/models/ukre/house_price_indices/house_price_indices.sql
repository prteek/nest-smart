with hpi_long as (
select time_period
, area_name
, average_price as price
, 'all' as asset_class
from {{ source('ons_housing', 'hpi') }}
union
select time_period
, area_name
, detached_price as price
, 'detached' as asset_class
from {{ source('ons_housing', 'hpi') }}
union
select time_period
, area_name
, semi_detached_price as price
, 'semi_detached' as asset_class
from {{ source('ons_housing', 'hpi') }}
union
select time_period
, area_name
, terraced_price as price
, 'terraced' as asset_class
from {{ source('ons_housing', 'hpi') }}
union
select time_period
, area_name
, flat_price as price
, 'flat' as asset_class
from {{ source('ons_housing', 'hpi') }}
)
,
pipr_long as (
select time_period
, area_name
, average_price as price
, 'all' as asset_class
from {{ source('ons_housing', 'pipr') }}
union
select time_period
, area_name
, detached_price as price
, 'detached' as asset_class
from {{ source('ons_housing', 'pipr') }}
union
select time_period
, area_name
, semi_detached_price as price
, 'semi_detached' as asset_class
from {{ source('ons_housing', 'pipr') }}
union
select time_period
, area_name
, terraced_price as price
, 'terraced' as asset_class
from {{ source('ons_housing', 'pipr') }}
union
select time_period
, area_name
, flat_price as price
, 'flat' as asset_class
from {{ source('ons_housing', 'pipr') }}
)
,
combined as (
select *
, 'buy' as type
from hpi_long
where price is not null
union
select *
, 'rent' as type
from pipr_long
where price is not null
)
select a.*
, b.area_code
, b.type as area_type
from combined a inner join {{ source('geo', 'area_types') }} b on a.area_name = b.area_name
where a.area_name <> 'united kingdom'
union all
select *
, null as area_code
, 'country' as area_type
from combined
where area_name = 'united kingdom'
