WITH date_range AS (
  SELECT
    area_name
    , area_code
    , asset_class
    , type
    , MAX(time_period) AS current_date
    , MAX(time_period) - INTERVAL 12 MONTH AS lag_date
  FROM ukre.lad_long_indices
  group by area_name
    , area_code
    , asset_class
    , type
)
SELECT
  a.area_name
  , a.area_code
  , a.asset_class
  , a.type
  , AVG(CASE WHEN time_period = current_date THEN average_price END) AS price_current
FROM ukre.lad_long_indices a inner join date_range b
            on a.type = b.type and
                a.asset_class = b.asset_class and
                a.area_name = b.area_name and
                a.area_code = b.area_code
GROUP BY a.area_name
  , a.area_code
  , a.asset_class
  , a.type
