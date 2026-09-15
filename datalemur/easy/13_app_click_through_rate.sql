-- Problem: App Click-Through Rate (CTR)
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/click-through-rate-app

WITH total_events AS (
  SELECT 
    app_id, 
    SUM(CASE WHEN event_type = 'click' THEN 1 END) AS clicks,
    SUM(CASE WHEN event_type = 'impression' THEN 1 END) AS impressions
  FROM events
  WHERE timestamp >= '2022-01-01' AND timestamp < '2023-01-01'
  GROUP BY app_id
)
SELECT 
  app_id, 
  ROUND(100.0 * clicks / impressions, 2) AS ctr
FROM total_events;
