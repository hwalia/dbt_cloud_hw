WITH TRIPS as (
    SELECT 
        BIKEID AS RIDE_ID,
        DATE(TO_TIMESTAMP(STARTTIME)) AS TRIP_DATE,
        START_STATION_ID AS START_STATION_ID,
        END_STATION_ID,
        USERTYPE AS MEMBER_CASUAL,
        TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTTIME),TO_TIMESTAMP(STOPTIME)) AS TRIP_DURATION_SECONDS
    from {{ source('snowflake_first_project', 'bike') }}
    where BIKEID != 'bikeid'
)
select *
from TRIPS
