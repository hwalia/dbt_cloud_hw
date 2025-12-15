WITH CTE AS
(
    SELECT CAST(START_STATION_ID AS INT) AS STATION_ID
        ,START_STATION_NAME AS STATION_NAME
        ,START_STATION_LATITUDE AS STATION_NAME 
        ,START_STATION_LONGITUDE AS STATION_NAME
    FROM {{ source('snowflake_first_project', 'bike') }}
    WHERE TRIPDURATION != 'tripduration'
    UNION
    SELECT CAST(END_STATION_ID AS INT) AS STATION_ID
        ,END_STATION_NAME  AS STATION_NAME
        ,END_STATION_LATITUDE  AS STATION_NAME
        ,END_STATION_LONGITUDE AS STATION_NAME
    FROM {{ source('snowflake_first_project', 'bike') }}
    WHERE TRIPDURATION != 'tripduration'    
) 
SELECT * 
FROM CTE --WHERE STATION_ID IN (433,530,3395,3669,253,3040) 
WHERE STATION_NAME NOT IN (
    'W 13 St & 5 Ave -moved to 5947.04'
    ,'old - E 13 St & Avenue A'
    ,'GOW Tech Shop'
    ,'Henry St & W 9 St [old]'
    ,'Henry St & W 9 St (OLD)'
) AND STATION_LATITUDE NOT IN ('40.77149671054441')
