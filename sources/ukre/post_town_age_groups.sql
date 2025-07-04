select post_town
, case when age < 25 then '<25'
when age between 25 and 44 then '25-44'
when age between 45 and 64 then '45-64'
else '>64' end as age_group
, case when age < 25 then 12.5
when age between 25 and 44 then 34.5
when age between 45 and 64 then 54.5
else 82.5 end as age_mean
, sum(number_of_people) as number_of_people
from census.msoa_age a inner join geo.post_town_geo_mapping b on a.msoa = b.msoa
group by 1,2,3
