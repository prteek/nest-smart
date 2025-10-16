select *
from {{ ref('affordability_median_price') }} mp
inner join {{ ref('affordability_gross_income') }} gi on mp.msoa = gi.msoa and mp.msoa_name = gi.msoa_name
inner join {{ ref('affordability_ratio') }} ar on mp.msoa = ar.msoa and mp.msoa_name = ar.msoa_name
