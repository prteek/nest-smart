select country
, region
, cua
, lad
, post_town
, msoa
, lsoa
from {{ source('geo', 'dim_post_town') }} a
        inner join {{ source('geo', 'dim_msoa') }} b
                on st_within(st_geomfromtext(b.msoa_centroid_wkt), st_geomfromtext(a.post_town_polygon_wkt))
        inner join {{ source('geo', 'dim_lsoa') }} c
                on st_within(st_geomfromtext(c.lsoa_centroid_wkt), st_geomfromtext(b.msoa_polygon_wkt))
        inner join {{ source('geo', 'dim_lad') }} d
                on st_within(st_geomfromtext(a.post_town_centroid_wkt), st_geomfromtext(d.lad_polygon_wkt))
        inner join {{ source('geo', 'dim_cua') }} e
                on st_within(st_geomfromtext(d.lad_centroid_wkt), st_geomfromtext(e.cua_polygon_wkt))
        inner join {{ source('geo', 'dim_region') }} f
                on st_within(st_geomfromtext(e.cua_centroid_wkt), st_geomfromtext(f.region_polygon_wkt))
        inner join {{ source('geo', 'dim_country') }} g
                on st_within(st_geomfromtext(f.region_centroid_wkt), st_geomfromtext(g.country_polygon_wkt))
