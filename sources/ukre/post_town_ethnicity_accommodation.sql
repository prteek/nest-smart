select post_town
, case when accommodation_type=lower('Whole house or bungalow: Detached') then 'Detached'
    when accommodation_type=lower('Whole house or bungalow: Semi-detached') then 'Semi-detached'
    when accommodation_type=lower('Whole house or bungalow: Terraced') then 'Terraced'
    when accommodation_type=lower('Flat, maisonette or apartment') then 'Flat'
    when accommodation_type=lower('A caravan or other mobile or temporary structure') then 'Caravan'
    else null
end as accommodation_type
, case when ethnicity=lower('Asian, Asian British or Asian Welsh') then 'Asian'
        when ethnicity=lower('Black, Black British, Black Welsh, Caribbean or African') then 'Black'
        when ethnicity=lower('Mixed or Multiple ethnic groups') then 'Mixed'
        when ethnicity in (lower('White: English, Welsh, Scottish, Northern Irish or British'), lower('White: Irish')) then 'White'
        when ethnicity=lower('White: Gypsy or Irish Traveller, Roma or Other White') then 'Gypsy/Roma'
        when ethnicity=lower('Other ethnic group') then 'Other'
        else null
    end as ethnicity
, sum(number_of_people) as number_of_people
from ukre.msoa_ethnicity_accommodation a
    inner join geo.post_town_geo_mapping b on a.msoa = b.msoa
group by post_town, accommodation_type, ethnicity