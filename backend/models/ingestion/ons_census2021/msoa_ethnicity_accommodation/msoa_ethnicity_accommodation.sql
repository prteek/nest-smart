select lower("Middle layer Super Output Areas Code") as msoa
, lower("Middle layer Super Output Areas") as msoa_name
, lower("Accommodation type (5 categories)") as accommodation_type
, lower("Ethnic group (8 categories)") as ethnicity
, Observation as number_of_people
from {{ source("ons_census2021", "RM026-2021-1-filtered-2025-06-28T23_14_26Z.csv") }}
where (lower(accommodation_type) <> 'does not apply')
and (lower(ethnicity) <> 'does not apply')
