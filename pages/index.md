---
title: Welcome to Evidence
---
## Hello Evidence


```regions
select * from ukre.pipr_regions
```

<DataTable data={regions} />

```latest
select area_name
, average_price
, upper(area_code) as area_code
, "type"
from ukre.pipr_regions
where time_period = (select max(time_period) from ukre.pipr_regions)
```

<AreaMap
  data={latest}
  areaCol="area_code"
  geoJsonUrl="https://public-geoms.s3-eu-west-1.amazonaws.com/Local_Authority_Districts_May_2024_Boundaries_UK_BFC_-6788913184658251542.geojson"
  geoId="LAD24CD"
  value="average_price"
  min=1000
  max=2000
  tooltip={[
    {id: 'area_name', showColumnName: false},
    {id: 'average_price', fmt: 'gbp', valueClass: 'text-[green]', showColumnName: false}
]}
/>
