WITH CTE AS (
    select t.*
        ,w.*
    from {{ ref('fact_trip') }} t
    left join {{ ref('daily_weather') }} w
    on t.TRIP_DATE = w.RECORD_DATE
)
select *
from CTE