select
    lad,
    lad_name,
    ST_AsText(geometry) AS lad_polygon_wkt,
    ST_AsText(ST_Centroid(geometry)) AS lad_centroid_wkt
from (
    select
        lower(LAD24CD) AS lad,
        lower(LAD24NM) AS lad_name,
        ST_Transform(geom, 'EPSG:4326', 'EPSG:4326') AS geometry  -- Source CRS is already correct
    from {{ source('geojsons', 'Local_Authority_Districts_May_2024_Boundaries_UK_BFC_-6788913184658251542.geojson') }}
)