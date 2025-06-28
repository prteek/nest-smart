-- Active: 1750798289222@@127.0.0.1@3306@default
select a.lad
, b.lad_name
, a.post_town
, a.msoa
from geo.post_town_geo_mapping a inner join geo.dim_lad b on a.lad=b.lad