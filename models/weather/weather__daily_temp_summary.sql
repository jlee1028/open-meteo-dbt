
{{ config(materialized='view') }}

with loc as (
    select *
    from {{ source('open_meteo_api_data', 'weather__location') }}
)

,unit as (
    select *
    from {{ source('open_meteo_api_data', 'weather__current_unit_config') }}
)

,cw as (
    select *
    from {{ source('open_meteo_api_data', 'weather__current_weather') }}
)


select cast(cw.time as date) date
,concat(loc.name, ', ', loc.admin1) location_name
,unit.temperature_2m temp_unit
,min(cw.temperature_2m) min_temp
,max(cw.temperature_2m) max_temp
,avg(cw.temperature_2m)::numeric(16, 1) avg_temp
from cw
inner join loc on loc.id = cw.location_id
inner join unit on unit.unit_config_id = cw.unit_config_id
group by date, location_name, temp_unit
