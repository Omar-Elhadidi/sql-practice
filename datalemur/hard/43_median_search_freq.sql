-- Problem: Median Google Search Frequency (DataLemur - Hard)
-- URL: https://datalemur.com/questions/median-search-freq
-- Notes: Uses GENERATE_SERIES to unpack pre-aggregated frequency table into individual rows for PERCENTILE_CONT.
-- Caution: GENERATE_SERIES row-explosion causes OOM on massive datasets; production alternative uses running cumulative sums.

WITH searches_expanded AS (
  SELECT searches
  FROM search_frequency
  GROUP BY searches, GENERATE_SERIES(1, num_users)
)

SELECT ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY searches)::DECIMAL, 1) AS median
FROM searches_expanded;
