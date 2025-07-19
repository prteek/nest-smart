select lower("Lower layer Super Output Areas Code") as lsoa
, lower("Lower layer Super Output Areas") as lsoa_name
, lower("Household deprivation (6 categories)") as category
, cast("Observation" as int) as number_of_households
from {{ source("ons_census2021", "TS011-2021-6-filtered-2025-06-28T09_28_22Z.csv") }}
where lower("Household deprivation (6 categories)") <> 'does not apply'