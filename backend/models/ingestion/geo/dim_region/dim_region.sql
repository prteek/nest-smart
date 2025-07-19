select
    region,
    region_name,
    ST_AsText(geometry) AS region_polygon_wkt,
    ST_AsText(ST_Centroid(geometry)) AS region_centroid_wkt
from (
    select
        lower(RGN24CD) AS region,
        lower(RGN24NM) AS region_name,
        ST_Transform(geom, 'EPSG:4326', 'EPSG:4326') AS geometry  -- Source CRS is already correct
    from {{ source('geo', 'Regions_December_2024_Boundaries_EN_BFC_1195854647342073399.geojson') }}
)