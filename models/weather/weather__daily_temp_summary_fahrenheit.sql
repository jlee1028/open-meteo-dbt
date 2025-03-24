
{{ config(materialized='view') }}

select date
    ,location_name
    ,case
        when temp_unit = '°C'
            then {{ celsius_to_fahrenheit('min_temp') }}
            else min_temp
        end as min_temp
    ,case
        when temp_unit = '°C'
            then {{ celsius_to_fahrenheit('max_temp') }}
            else max_temp
        end as max_temp
    ,case
        when temp_unit = '°C'
            then {{ celsius_to_fahrenheit('avg_temp') }}
            else avg_temp
        end as avg_temp
from {{ ref('weather__daily_temp_summary') }}
