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

```uk_current_filtered
select *
FROM ${uk_current}
WHERE asset_class = 'all' and type = '${inputs.selected_type_uk}'
```
<Grid cols=2>
    <BigValue
    data={uk_current_filtered}
    value=price_current
    comparison=growth_1yr
    comparisonFmt=pct1
    comparisonTitle="YoY"
    />
</Grid>


```lad_current_filtered
select area_name
, upper(area_code) as area_code
, asset_class
, type
, price_current
FROM ${lad_current}
WHERE asset_class = 'all' and type = '${inputs.selected_type_uk}'
```

<AreaMap
  data={lad_current_filtered}
  areaCol="area_code"
  geoJsonUrl="https://public-geoms.s3-eu-west-1.amazonaws.com/Local_Authority_Districts_May_2024_Boundaries_UK_BFC_-6788913184658251542.geojson"
  geoId="LAD24CD"
  value="price_current"
  tooltip={[
    {id: 'area_name', showColumnName: false},
    {id: 'price_current', fmt: 'gbp', valueClass: 'text-[green]', showColumnName: false}
]}
/>
