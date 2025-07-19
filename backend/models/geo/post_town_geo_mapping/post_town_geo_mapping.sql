select country
, region
, cua
, lad
, post_town
, msoa
, lsoa
from {{ source('geo', 'dim_post_town') }} a
        inner join {{ source('geo', 'dim_msoa') }} b
                on st_within(st_geometryfromtext(b.msoa_centroid_wkt), st_geometryfromtext(a.post_town_polygon_wkt))
        inner join {{ source('geo', 'dim_lsoa') }} c
                on st_within(st_geometryfromtext(c.lsoa_centroid_wkt), st_geometryfromtext(b.msoa_polygon_wkt))
        inner join {{ source('geo', 'dim_lad') }} d
                on st_within(st_geometryfromtext(a.post_town_centroid_wkt), st_geometryfromtext(d.lad_polygon_wkt))
        inner join {{ source('geo', 'dim_cua') }} e
                on st_within(st_geometryfromtext(d.lad_centroid_wkt), st_geometryfromtext(e.cua_polygon_wkt))
        inner join {{ source('geo', 'dim_region') }} f
                on st_within(st_geometryfromtext(e.cua_centroid_wkt), st_geometryfromtext(f.region_polygon_wkt))
        inner join {{ source('geo', 'dim_country') }} g
                on st_within(st_geometryfromtext(f.region_centroid_wkt), st_geometryfromtext(g.country_polygon_wkt))
