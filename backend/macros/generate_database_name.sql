{% macro generate_database_name(custom_database_name=none, node=none) -%}
    {%- if target.name in ['ds_staging', 'ds_prd', 'ds_dev', 'ds_geo', 'address', 'census_2011', 'census_2021', 'listing', 'valuation', 'mandate', 'sa', 'pp'] -%}
        AwsDataCatalog
    {%- elif custom_database_name is none -%}
        {{ target.database }}
    {%- else -%}
        {{ custom_database_name | trim }}
    {%- endif -%}
{%- endmacro %}
