select lower(Postcode) as post_code
, st_astext(st_point(Longitude, Latitude)) as post_code_centroid_wkt
from {{ source('doogal', 'postcodes.csv') }}
where "In Use?"