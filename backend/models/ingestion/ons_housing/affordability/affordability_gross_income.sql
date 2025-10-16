select
    lower("MSOA code") as msoa,
    lower("MSOA name") as msoa_name,
    case when "Gross annual household income (£)" = '[x]' then null
    else cast("Gross annual household income (£)" as double) end as gross_annual_household_income
from {{ source("ons_housing", "housingaffordabilityratiosformiddlelayersuperoutputareas140624_table2.xlsx") }}
