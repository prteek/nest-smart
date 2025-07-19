select lower("Middle layer Super Output Areas Code") as msoa
, lower("Middle layer Super Output Areas") as msoa_name
, lower("Age (101 categories)") as category
, cast("Age (101 categories) Code" as int) as age
, cast("Observation" as int) as number_of_people
from {{ source("ons_census2021", "TS007-2021-1-filtered-2025-06-28T09_43_09Z.csv") }}
