select post_town
, case when accommodation_type=lower('Whole house or bungalow: Detached') then 'Detached'
    when accommodation_type=lower('Whole house or bungalow: Semi-detached') then 'Semi-detached'
    when accommodation_type=lower('Whole house or bungalow: Terraced') then 'Terraced'
    when accommodation_type=lower('Flat, maisonette or apartment') then 'Flat'
    when accommodation_type=lower('A caravan or other mobile or temporary structure') then 'Caravan'
    else null
end as accommodation_type
, case when accommodation_type=lower('Whole house or bungalow: Detached') then 2
    when accommodation_type=lower('Whole house or bungalow: Semi-detached') then 1
    when accommodation_type=lower('Whole house or bungalow: Terraced') then 0
    when accommodation_type=lower('Flat, maisonette or apartment') then 3
    when accommodation_type=lower('A caravan or other mobile or temporary structure') then 4
    else 5
end as accommodation_type_order
, case when ethnicity=lower('Asian, Asian British or Asian Welsh') then 'Asian'
        when ethnicity=lower('Black, Black British, Black Welsh, Caribbean or African') then 'Black'
        when ethnicity=lower('Mixed or Multiple ethnic groups') then 'Mixed'
        when ethnicity in (lower('White: English, Welsh, Scottish, Northern Irish or British'), lower('White: Irish')) then 'White'
        when ethnicity=lower('White: Gypsy or Irish Traveller, Roma or Other White') then 'Gypsy/Roma'
        when ethnicity=lower('Other ethnic group') then 'Other'
        else null
    end as ethnicity
, case when ethnicity=lower('Asian, Asian British or Asian Welsh') then 1
        when ethnicity=lower('Black, Black British, Black Welsh, Caribbean or African') then 2
        when ethnicity=lower('Mixed or Multiple ethnic groups') then 3
        when ethnicity in (lower('White: English, Welsh, Scottish, Northern Irish or British'), lower('White: Irish')) then 0
        when ethnicity=lower('White: Gypsy or Irish Traveller, Roma or Other White') then 4
        when ethnicity=lower('Other ethnic group') then 5
        else 6
    end as ethnicity_order
, sum(number_of_people) as number_of_people
from ons_census2021.msoa_ethnicity_accommodation a
    inner join geo.post_town_geo_mapping b on a.msoa = b.msoa
group by 1,2,3,4,5