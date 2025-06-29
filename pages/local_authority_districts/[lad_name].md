---
queries:
    - lad_list.sql
---


```params_lad_name
select upper('${params.lad_name}') as lad_name
```

# {params_lad_name[0].lad_name}

<Dropdown
    data={lad_list}
    name=selected_local_authority
    value=lad_name
    title="Select a Local Authority"
    defaultValue={params.lad_name}
/>

```lad_post_town_filtered
select distinct lad_name
, post_town
from ukre.post_town_geo_mapping
where lad_name = '${inputs.selected_local_authority.value}'
```

```post_town_ethnicity_accommodation
with base as (
select a.post_town
, accommodation_type
, ethnicity
, number_of_people
from ukre.post_town_ethnicity_accommodation a
    inner join ${lad_post_town_filtered} b on a.post_town = b.post_town
)
,
post_town_totals as (
    select post_town
    , sum(number_of_people) as total_number_post_town
    from base
    group by post_town
)
select a.post_town
, accommodation_type
, ethnicity
, number_of_people/total_number_post_town as proportion_of_people
from base a inner join post_town_totals b on a.post_town = b.post_town
```

```post_town_ethnicity
select post_town
, ethnicity
, sum(proportion_of_people) as proportion_of_people
from ${post_town_ethnicity_accommodation}
group by post_town, ethnicity
```

```post_town_accommodation_type
select post_town
, accommodation_type
, round(sum(proportion_of_people),2) as proportion_of_people
from ${post_town_ethnicity_accommodation}
group by post_town, accommodation_type
```

<Grid cols=2>
<AreaMap
  data={lad_post_town_filtered}
  areaCol="post_town"
  geoJsonUrl="https://public-geoms.s3-eu-west-1.amazonaws.com/post_town_simple.geojson"
  geoId="post_town"
  value="post_town"
  tooltip={[
    {id: 'lad_name', showColumnName: false},
    {id: 'post_town', showColumnName: false}
    ]}
  startingZoom=8
  opacity=0.5
/>

</Grid>

<Grid cols=2>
<Heatmap
data={post_town_ethnicity}
y=post_town
x=ethnicity
value=proportion_of_people
valueFmt=pct
xLabelRotation=-45
/>

<Heatmap
data={post_town_accommodation_type}
y=post_town
x=accommodation_type
value=proportion_of_people
valueFmt=pct
xLabelRotation=-45
/>
</Grid>