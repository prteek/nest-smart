select post_town
, case when age < 25 then '<25'
when age between 25 and 44 then '25-44'
when age between 45 and 64 then '45-64'
else '>64' end as age_group
, sum(number_of_people) as number_of_people
from ukre.msoa_age a inner join geo.post_town_geo_mapping b on a.msoa = b.msoa
group by 1,2
