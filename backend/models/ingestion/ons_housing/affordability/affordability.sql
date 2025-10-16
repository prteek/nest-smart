select mp.msoa
, mp.msoa_name
, all_properties_median_price
, detached_median_price
, semi_detached_median_price
, terraced_median_price
, flats_maisonettes_median_price
, gross_annual_household_income
, all_properties_ratio
, detached_ratio
, semi_detached_ratio
, terraced_ratio
, flats_maisonettes_ratio
from {{ ref('affordability_median_price') }} mp
inner join {{ ref('affordability_gross_income') }} gi on mp.msoa = gi.msoa and mp.msoa_name = gi.msoa_name
inner join {{ ref('affordability_ratio') }} ar on mp.msoa = ar.msoa and mp.msoa_name = ar.msoa_name
