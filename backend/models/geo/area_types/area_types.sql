select lad_name as area_name
, lad as area_code
, 'lad' as type
from {{ source('geo', 'dim_lad') }}
union
select lsoa_name as area_name
, lsoa as area_code
, 'lsoa' as type
from {{ source('geo', 'dim_lsoa') }}
union
select msoa_name as area_name
, msoa as area_code
, 'msoa' as type
from {{ source('geo', 'dim_msoa') }}
union
select post_town as area_name
, null as area_code
, 'post_town' as type
from {{ source('geo', 'dim_post_town') }}
union
select area_name
, area_code
, 'country' as type
from {{ source('ons_housing', 'hpi') }}
where area_name in ('england', 'wales', 'scotland', 'northern ireland')
union
select area_name
, area_code
, 'region' as type
from {{ source('ons_housing', 'hpi') }}
where area_name in ('north east', 'north west', 'yorkshire and the humber', 'east midlands', 'west midlands', 'east of england', 'london', 'south east', 'south west')