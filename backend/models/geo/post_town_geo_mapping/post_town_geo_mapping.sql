select country
, region
, cua
, lad
, post_town
, msoa
, lsoa
from {{ source('geo', 'dim_post_town') }} a
        inner join {{ source('geo', 'dim_msoa') }} b
                on st_within(ST_GeomFromText(b.msoa_centroid_wkt), ST_GeomFromText(a.post_town_polygon_wkt))
        inner join {{ source('geo', 'dim_lsoa') }} c
                on st_within(ST_GeomFromText(c.lsoa_centroid_wkt), ST_GeomFromText(b.msoa_polygon_wkt))
        inner join {{ source('geo', 'dim_lad') }} d
                on st_within(ST_GeomFromText(a.post_town_centroid_wkt), ST_GeomFromText(d.lad_polygon_wkt))
        inner join {{ source('geo', 'dim_cua') }} e
                on st_within(ST_GeomFromText(d.lad_centroid_wkt), ST_GeomFromText(e.cua_polygon_wkt))
        inner join {{ source('geo', 'dim_region') }} f
                on st_within(ST_GeomFromText(e.cua_centroid_wkt), ST_GeomFromText(f.region_polygon_wkt))
        inner join {{ source('geo', 'dim_country') }} g
                on st_within(ST_GeomFromText(f.region_centroid_wkt), ST_GeomFromText(g.country_polygon_wkt))
