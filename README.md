dbt project for modeling open-meteo data ingested by the [open-meteo-pipeline](https://github.com/jlee1028/open-meteo-pipeline)

#### Models
- weather__daily_temp_summary creates a view that gets the min, max, and avg temp per day by location and unit of measurement
- weather__daily_temp_summary_fahrenheit converts all the daily tempuratures in weather__daily_temp_summary to fahrenheit

#### Macros
- unit_converters has macros for converting the measurements of weather variables from one unit to another (e.g. celsius to fahrenheit, inches to centimeters)

#### Seeds
- weather codes from [meteomatics.com](https://www.meteomatics.com/en/api/available-parameters/weather-parameter/general-weather-state/)
