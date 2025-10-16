select
    lower("MSOA code") as msoa,
    lower("MSOA name") as msoa_name,
    case when "All properties" = '[x]' then null
    else cast("All properties" as double) end as all_properties_ratio,
    case when "Detached" = '[x]' then null
    else cast("Detached" as double) end as detached_ratio,
    case when "Semi-Detached" = '[x]' then null
    else cast("Semi-Detached" as double) end as semi_detached_ratio,
    case when "Terraced" = '[x]' then null
    else cast("Terraced" as double) end as terraced_ratio,
    case when "Flats/Maisonettes" = '[x]' then null
    else cast("Flats/Maisonettes" as double) end as flats_maisonettes_ratio
from {{ source("ons_housing", "housingaffordabilityratiosformiddlelayersuperoutputareas140624_table3.xlsx") }}
