with cte as
(
    SELECT
        DATE(TIME) AS RECORD_DATE
        ,WEATHER
        ,ROUND(AVG(CLOUDS),2) AVG_CLOUDS
        ,ROUND(AVG(HUMIDITY),2) AVG_HUMIDITY
        ,ROUND(AVG(PRESSURE),2) AVG_PRESSURE
        ,ROUND(AVG(TEMP),2) AVG_TEMP
    from {{ source("snowflake_first_project", "weather") }} 
    GROUP BY RECORD_DATE
        ,WEATHER
    QUALIFY(ROW_NUMBER() OVER (PARTITION BY RECORD_DATE ORDER BY COUNT(WEATHER) DESC)) = 1
) SELECT * FROM CTE

