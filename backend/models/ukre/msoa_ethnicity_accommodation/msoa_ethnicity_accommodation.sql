select lower("Middle layer Super Output Areas Code") as msoa
, lower("Middle layer Super Output Areas") as msoa_name
, lower("Accommodation type (5 categories)") as accommodation_type
, lower("Ethnic group (8 categories)") as ethnicity
, Observation as number_of_people
from {{ source("population", "msoa-ethnicity-accommodation") }}
where (lower(accommodation_type) <> 'does not apply')
and (lower(ethnicity) <> 'does not apply')
