---
title: Nest Smart
queries:
    - uk_current.sql
    - lad_current.sql
    - region_current.sql
---

## The UK

<ButtonGroup name=selected_type>
    <ButtonGroupItem valueLabel="Buy" value="buy" default/>
    <ButtonGroupItem valueLabel="Rent" value="rent" />
</ButtonGroup>

---

```uk_current_filtered
select *
FROM ${uk_current}
WHERE type = '${inputs.selected_type}'

```

<BigValue
data={uk_current_filtered.filter(d => d.asset_class === 'all')}
value=price_current
comparison=growth_1yr
comparisonFmt=pct1
comparisonTitle="YoY"
title="Latest price (All)"
/>

<BigValue
data={uk_current_filtered.filter(d => d.asset_class === 'semi_detached')}
value=price_current
comparison=growth_1yr
comparisonFmt=pct1
comparisonTitle="YoY"
title="Latest price (Semi Detached)"
/>

<BigValue
data={uk_current_filtered.filter(d => d.asset_class === 'terraced')}
value=price_current
comparison=growth_1yr
comparisonFmt=pct1
comparisonTitle="YoY"
title="Latest price (Terraced)"
/>

<BigValue
  data={uk_current_filtered.filter(d => d.asset_class === 'flat')}
  value=price_current
  comparison=growth_1yr
  comparisonFmt=pct1
  comparisonTitle="YoY"
  title="Latest price (Flats)"
/>


```region_current_filtered
select *
FROM ${region_current}
WHERE type = '${inputs.selected_type}'
```

```uk_indices_long
select *
FROM ukre.uk_indices_long
WHERE type = '${inputs.selected_type}'
and time_period >= cast('2020-01-01' as date)
```


<Grid cols=2>
    <LineChart
    data={uk_indices_long}
    x=time_period
    y=price
    yAxisTitle="Price (£)"
    series=asset_class
    width=200
    title="UK price index"
    />
    <Heatmap
    data={region_current_filtered}
    y=area_name
    x=asset_class
    value=price_current
    xLabelRotation=-45
    xSortOrder=asc
    ySortOrder=desc
    valueFmt=gbp
    />
</Grid>


```asset_classes
select distinct(asset_class) as asset_class
from ${lad_current}
```

<Dropdown
    data={asset_classes}
    name=selected_asset_class_lad
    value=asset_class
    title="Select an asset class"
    defaultValue="all"
/>

```lad_current_filtered
select upper(area_name) as area_name
, upper(area_code) as area_code
, asset_class
, type
, price_current
FROM ${lad_current}
WHERE asset_class='${inputs.selected_asset_class_lad.value}'
    and type = '${inputs.selected_type}'
    and not area_name in ('kensington and chelsea', 'westminster')
```

```lad_indices_long_filtered
select upper(area_name) as area_name
, type
, asset_class
, time_period
, price
FROM ukre.lad_indices_long
WHERE type = '${inputs.selected_type}'
    and time_period >= cast('2020-01-01' as date)
    and upper(area_name)='${inputs.lad_current_map.area_name}'
    and asset_class='${inputs.selected_asset_class_lad.value}'
union
select 'UK' as area_name
, type
, asset_class
, time_period
, price
FROM ukre.uk_indices_long
WHERE type = '${inputs.selected_type}'
    and time_period >= cast('2020-01-01' as date)
    and asset_class='${inputs.selected_asset_class_lad.value}'
```

## Local Authorities

Asset class: {inputs.selected_asset_class_lad.value}
<Grid cols=2>
<Group>
<p class="text-sm text-gray-500">Click an area on map to view series</p>
<AreaMap
  data={lad_current_filtered}
  areaCol="area_code"
  geoJsonUrl="https://public-geoms.s3-eu-west-1.amazonaws.com/lad_simple.geojson"
  geoId="LAD24CD"
  value="price_current"
  tooltip={[
    {id: 'area_name', showColumnName: false},
    {id: 'price_current', fmt: 'gbp', valueClass: 'text-[green]', showColumnName: false}
    ]}
  startingZoom=5
  startingLat=52.23967
  startingLong=0.0
  name=lad_current_map
/>
</Group>

<LineChart
data={lad_indices_long_filtered}
x=time_period
y=price
yAxisTitle="Price (£)"
series=area_name
legend=true
/>
</Grid>
