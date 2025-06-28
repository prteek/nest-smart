select cua
, lad
, post_town
, msoa
, lsoa
from {{ ref('dim_post_town') }} a
        inner join {{ ref('dim_msoa') }} b
                on st_within(ST_GeomFromText(b.msoa_centroid_wkt), ST_GeomFromText(a.post_town_polygon_wkt))
        inner join {{ ref('dim_lsoa') }} c
                on st_within(ST_GeomFromText(c.lsoa_centroid_wkt), ST_GeomFromText(b.msoa_polygon_wkt))
        inner join {{ ref('dim_lad') }} d
                on st_within(ST_GeomFromText(a.post_town_centroid_wkt), ST_GeomFromText(d.lad_polygon_wkt))
        inner join {{ ref('dim_cua') }} e
                on st_within(ST_GeomFromText(d.lad_centroid_wkt), ST_GeomFromText(e.cua_polygon_wkt))