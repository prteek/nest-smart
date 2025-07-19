select
    cua,
    cua_name,
    st_astext(geometry) AS cua_polygon_wkt,
    st_astext(st_centroid(geometry)) AS cua_centroid_wkt
from (
    select
        lower(CTYUA24CD) AS cua,
        lower(CTYUA24NM) AS cua_name,
        st_transform(geom, 'EPSG:4326', 'EPSG:4326') AS geometry  -- Source CRS already correct
    from {{ source('geo', 'Counties_and_Unitary_Authorities_December_2024_Boundaries_UK_BFC_3348038940373313033.geojson') }}
)