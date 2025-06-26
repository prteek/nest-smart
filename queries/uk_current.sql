WITH date_range AS (
  SELECT
    asset_class
    , type
    , MAX(time_period) AS current_date
    , MAX(time_period) - INTERVAL 12 MONTH AS lag_date
  FROM ukre.uk_long_indices
  group by asset_class, type
)
SELECT
  a.asset_class
  , a.type
  , AVG(CASE WHEN time_period = current_date THEN price END) AS price_current
  , AVG(CASE WHEN time_period = lag_date THEN price END) AS price_1yr_lag
  -- Calculate growth rate (handle division by zero)
  , (price_current / NULLIF(price_1yr_lag, 0) - 1) AS growth_1yr
FROM ukre.uk_long_indices a inner join date_range b
        on a.type = b.type and
            a.asset_class = b.asset_class
GROUP BY a.asset_class, a.type
