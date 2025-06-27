select
    msoa,
    msoa_name,
    st_astext(geometry) AS msoa_polygon_wkt,
    st_astext(st_centroid(geometry)) AS msoa_centroid_wkt
from (
    select
        lower(MSOA21CD) AS msoa,
        lower(MSOA21NM) AS msoa_name,
        st_transform(geom, 'EPSG:27700', 'EPSG:4326') AS geometry  -- Source CRS needs conversion
    from {{ source('geojsons', 'MOSA_2021_EW_BFC_V6_8073017919673588333.geojson') }}
)