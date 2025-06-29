---
hideHeader: true
queries:
   - local_authority_districts.sql
sidebar_link: false
---

## Local Authority Districts

```sql lad_links
select concat('local_authority_districts/', lad_name) as link
, lad_name
from ${local_authority_districts}
```

<DataTable data={lad_links} link=link search=true showLinkCol=false />
