{%macro get_season(var_date)  %}
CASE WHEN MONTH(TO_TIMESTAMP({{var_date}})) IN (12,1,2)
            THEN 'WINTER'
            WHEN MONTH(TO_TIMESTAMP({{var_date}})) IN (3,4,5)
            THEN 'SPRING'
            WHEN MONTH(TO_TIMESTAMP({{var_date}})) IN (6,7,8)
            THEN 'SUMMER'
            ELSE 'FALL' END
{%endmacro %}


{%macro get_day_type(var_date) %}
    CASE WHEN DAYNAME(TO_TIMESTAMP({{var_date}})) IN ('Sat','Sun')
        THEN 'WEEKEND'
    ELSE 'WEEKDAY' END
{% endmacro %}