## Hello Evidence

### Orders Table

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
  geoJsonUrl="https://stg-arcgisazurecdataprod1.az.arcgis.com/exportfiles-1559-24069/Local_Authority_Districts_December_2024_Boundaries_UK_BFC_-8514277369542505193.geojson?sv=2018-03-28&sr=b&sig=53XkEsu6Zx%2BeJmzCCk7ZArEWGQJ23WuBEUtGDRuZjs4%3D&se=2025-06-25T23%3A22%3A48Z&sp=r"
  geoId="LAD24CD"
  value="average_price"
  min=1000
  max=2000
  tooltip={[
    {id: 'area_name', showColumnName: false},
    {id: 'average_price', fmt: 'gbp', valueClass: 'text-[green]', showColumnName: false}
]}
/>
