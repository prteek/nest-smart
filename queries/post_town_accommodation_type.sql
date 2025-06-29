select post_town
, accommodation_type
, accommodation_type_order
, round(sum(proportion_of_people),2) as proportion_of_people
from ${post_town_ethnicity_accommodation}
group by post_town, accommodation_type, accommodation_type_order