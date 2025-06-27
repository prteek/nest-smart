select
    lsoa,
    lsoa_name,
    st_astext(geometry) AS lsoa_polygon_wkt,
    st_astext(st_centroid(geometry)) AS lsoa_centroid_wkt
from (
    select
        lower(LSOA21CD) AS lsoa,
        lower(LSOA21NM) AS lsoa_name,
        st_transform(geom, 'EPSG:27700', 'EPSG:4326') AS geometry  -- Source CRS needs conversion
    from {{ source('geojsons', 'Lower_layer_Super_Output_Areas_2021_EW_BFC_V8_-8407643096148449625.geojson') }}
)