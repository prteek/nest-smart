SELECT DATE '1899-12-30' + CAST("Time period" AS INTEGER) AS time_period
, lower("Area name") as area_name
, case when "Rental price" = '[x]' then null
else cast("Rental price" as double) end as average_price
, case when "Rental price detached" = '[x]' then null
else cast("Rental price detached" as double) end as detached_price
, case when "Rental price semidetached" = '[x]' then null
else cast("Rental price semidetached" as double) end as semi_detached_price
, case when "Rental price terraced" = '[x]' then null
else cast("Rental price terraced" as double) end as terraced_price
, case when "Rental price flat / maisonette" = '[x]' then null
else cast("Rental price flat / maisonette" as double) end as flat_price
FROM {{ source("priceindexofprivaterentsukmonthlypricestatistics", "priceindexofprivaterentsukmonthlypricestatistics.xlsx") }}
where time_period is not null