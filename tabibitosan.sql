WITH base AS (
    SELECT [FEEDER_11] as feeder
        ,COALESCE(Power_ON, Power_Off) AS timestamp
        ,[Power_Off]
        ,[Power_ON]
        , case when Power_ON is null then 'Power_OFF' else 'Power_ON' end as status
    FROM [DataCleaningProjects].[dbo].[PowerState]
)
-- the Tabibitosan technique lets you group consecutive rows easily
SELECT feeder
    , MIN(timestamp) AS start_time, MAX(timestamp) AS end_time
    , DATEDIFF(MINUTE, MIN(timestamp), MAX(timestamp)) AS outage_duration_minutes
FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY feeder ORDER BY timestamp) -
         ROW_NUMBER() OVER (PARTITION BY feeder, status ORDER BY timestamp) AS grp
  FROM base
) AS subquery
WHERE status = 'Power_OFF'
GROUP BY feeder, grp
ORDER BY 1, 2 ASC;