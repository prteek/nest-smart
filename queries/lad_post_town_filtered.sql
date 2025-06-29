select distinct lad_name as local_authority
, post_town
from ukre.post_town_geo_mapping
where lad_name = '${inputs.selected_local_authority.value}'