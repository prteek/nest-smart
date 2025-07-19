select
    country,
    country_name,
    ST_AsText(geometry) AS country_polygon_wkt,
    ST_AsText(ST_Centroid(geometry)) AS country_centroid_wkt
from (
    select
        lower(CTRY24CD) AS country,
        lower(CTRY24NM) AS country_name,
        ST_Transform(geom, 'EPSG:4326', 'EPSG:4326') AS geometry  -- Source CRS is already correct
    from {{ source('geojsons', 'Countries_December_2024_Boundaries_UK_BFC_-7061626699629882825.geojson') }}
)