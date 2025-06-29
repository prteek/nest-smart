---
title: Nest Smart
hide_title: true
queries:
    - local_authority_districts.sql
    - post_town_ethnicity_accommodation.sql
    - post_town_ethnicity.sql
    - post_town_accommodation_type.sql
    - lad_post_town_filtered.sql
    - post_town_age_groups.sql

---


```params_lad_name
select '${params.lad_name}' as lad_name
```

## {params_lad_name[0].lad_name}

<Dropdown
    data={local_authority_districts}
    name=selected_local_authority
    value=lad_name
    title="Select a Local Authority"
    defaultValue={params.lad_name}
/>

<Grid cols=2>
<AreaMap
  data={lad_post_town_filtered}
  areaCol="post_town"
  geoJsonUrl="https://public-geoms.s3-eu-west-1.amazonaws.com/post_town_simple.geojson"
  geoId="post_town"
  value="post_town"
  tooltip={[
    {id: 'local_authority', valueClass: 'text-l font-semibold'},
    {id: 'post_town', valueClass: 'font mt-1'}
    ]}
  startingZoom=8
  opacity=0.5
  height=450
  title='Post towns in Local Authority'
/>

<Heatmap
data={post_town_age_groups}
y=post_town
x=age_group
value=proportion_of_people
valueFmt=pct
xLabelRotation=-45
title='Age'
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
title='Ethnicity'
/>

<Heatmap
data={post_town_accommodation_type}
y=post_town
x=accommodation_type
value=proportion_of_people
valueFmt=pct
xLabelRotation=-45
title='Accommodation type'
/>
</Grid>