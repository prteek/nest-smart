---
queries:
   - lad_details: lad_details.sql
---

# {params.lad_name}

```lad_post_town
select *
from ukre.lad_to_post_town
where lad_name = '${params.lad_name}'

```

<AreaMap
  data={lad_post_town}
  areaCol="post_town"
  geoJsonUrl="https://public-geoms.s3-eu-west-1.amazonaws.com/post_town_simple.geojson"
  geoId="post_town"
  value="post_town"
  tooltip={[
    {id: 'lad_name', showColumnName: false},
    {id: 'post_town', showColumnName: false}
    ]}
  startingZoom=8
  opacity=0.4
/>
