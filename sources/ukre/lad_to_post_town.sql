-- Active: 1750798289222@@127.0.0.1@3306@default
select lad
, lad_name
, post_town
from geo.dim_lad a inner join geo.dim_post_town b on st_within(st_geometryfromtext(b.post_town_centroid_wkt), st_geometryfromtext(a.lad_polygon_wkt))