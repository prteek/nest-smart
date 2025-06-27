select
    post_town,
    st_astext(geometry) AS post_town_polygon_wkt,
    st_astext(st_centroid(geometry)) AS post_town_centroid_wkt
from (
    select
        post_town,
        geom AS geometry  -- Source CRS needs conversion
    from {{ source('geojsons', 'dim_post_town.geojson') }}
)