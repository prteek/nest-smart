select cast("Date" as date) as time_period
, lower("RegionName") as area_name
, lower("AreaCode") as area_code
, "AveragePrice" as average_price
, "SalesVolume" as sales_volume
, "DetachedPrice" as detached_price
, "SemiDetachedPrice" as semi_detached_price
, "TerracedPrice" as terraced_price
, "FlatPrice" as flat_price
, "NewPrice" as new_build_price
, "OldPrice" as non_new_build_price
from {{ source("house-price-index-data", "UK-HPI-full-file-2025-04.csv") }}
where time_period is not null