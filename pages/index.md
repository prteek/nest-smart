---
title: Nest Smart
queries:
    - uk_current.sql
    - lad_current.sql
---

## The UK

<ButtonGroup name=selected_type_uk>
    <ButtonGroupItem valueLabel="Buy" value="buy" default/>
    <ButtonGroupItem valueLabel="Rent" value="rent" />
</ButtonGroup>

```uk_indices_long
select *
FROM ukre.uk_indices_long
WHERE type = '${inputs.selected_type_uk}'
and time_period >= cast('2020-01-01' as date)
```

```uk_current_filtered
select *
FROM ${uk_current}
WHERE asset_class = 'all' and type = '${inputs.selected_type_uk}'
```

<BigValue
data={uk_current_filtered}
value=price_current
comparison=growth_1yr
comparisonFmt=pct1
comparisonTitle="YoY"
/>

<LineChart
data={uk_indices_long}
x=time_period
y=price
yAxisTitle="Price (£)"
series=asset_class
width=200
title="UK price index"
/>


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
    and type = '${inputs.selected_type_uk}'
    and not area_name in ('kensington and chelsea', 'westminster')
```

```lad_indices_long_filtered
select upper(area_name) as area_name
, type
, asset_class
, time_period
, price
FROM ukre.lad_indices_long
WHERE type = '${inputs.selected_type_uk}'
    and time_period >= cast('2020-01-01' as date)
    and upper(area_name)='${inputs.lad_current_map.area_name}'
    and asset_class='${inputs.selected_asset_class_lad.value}'
```

<Grid cols=2>
<AreaMap
  data={lad_current_filtered}
  areaCol="area_code"
  geoJsonUrl="https://public-geoms.s3-eu-west-1.amazonaws.com/Local_Authority_Districts_May_2024_Boundaries_UK_BFC_-6788913184658251542.geojson"
  geoId="LAD24CD"
  value="price_current"
  title={inputs.selected_asset_class_lad.value}
  tooltip={[
    {id: 'area_name', showColumnName: false},
    {id: 'price_current', fmt: 'gbp', valueClass: 'text-[green]', showColumnName: false}
]}
  colorPalette={[
        ['#82e0aa', '#82e0aa'],
        ['#f7dc6f', '#f7dc6f'],
        ['#e59866', '#e59866'],
        ['#d35400', '#d35400'],
    ]}
  name=lad_current_map
/>

<LineChart
data={lad_indices_long_filtered}
x=time_period
y=price
yAxisTitle="Price (£)"
series=asset_class
title={`${inputs.lad_current_map.area_name}, ${inputs.selected_asset_class_lad.value}`}
/>
</Grid>