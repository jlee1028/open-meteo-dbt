{% macro celsius_to_fahrenheit(temp_c, scale=1) %}
    ({{ temp_c }} * (9/5) + 32)::numeric(16, {{ scale }})
{% endmacro %}

{% macro fahrenheit_to_celsius(temp_f, scale=1) %}
    ( ({{ temp_f }} - 32) * (5/9) )
{% endmacro %}
