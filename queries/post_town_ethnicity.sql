select post_town
, ethnicity
, sum(proportion_of_people) as proportion_of_people
from ${post_town_ethnicity_accommodation}
group by post_town, ethnicity