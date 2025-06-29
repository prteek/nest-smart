with base as (
select a.post_town
, accommodation_type
, accommodation_type_order
, ethnicity
, ethnicity_order
, number_of_people
from ukre.post_town_ethnicity_accommodation a
    inner join ${lad_post_town_filtered} b on a.post_town = b.post_town
)
,
post_town_totals as (
    select post_town
    , sum(number_of_people) as total_number_post_town
    from base
    group by post_town
)
select a.post_town
, accommodation_type
, accommodation_type_order
, ethnicity
, ethnicity_order
, number_of_people/total_number_post_town as proportion_of_people
from base a inner join post_town_totals b on a.post_town = b.post_town