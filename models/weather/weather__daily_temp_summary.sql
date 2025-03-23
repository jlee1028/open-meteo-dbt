
{{ config(materialized='view') }}

with loc as (
    select *
    from {{ source('open_meteo_api_data', 'weather__location') }}
)

,unit as (
    select *
    from {{ source('open_meteo_api_data', 'weather__hourly_unit_config') }}
)

,hf as (
    select *
    from {{ source('open_meteo_api_data', 'weather__hourly_forecast') }}
)


select cast(hf.time as date) date
,concat(loc.name, ', ', loc.admin1) location_name
,unit.temperature_2m temp_unit
,min(hf.temperature_2m) min_temp
,max(hf.temperature_2m) max_temp
,avg(hf.temperature_2m) avg_temp
from hf
inner join loc on loc.id = hf.location_id
inner join unit on unit.unit_config_id = hf.unit_config_id
group by date, location_name, temp_unit
