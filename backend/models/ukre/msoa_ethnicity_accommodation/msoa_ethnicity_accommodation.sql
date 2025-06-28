select lower(GEOGRAPHY_CODE) as msoa
, lower(GEOGRAPHY_NAME) as msoa_name
, lower(C2021_ACCTYPE_6_NAME) as accommodation_type
, lower(C2021_ETH_8_NAME) as ethnicity
, OBS_VALUE as number_of_people
from {{ source("population", "msoa-ethnicity-accommodation") }}
where (accommodation_type <> 'total')
and (ethnicity <> 'total')
