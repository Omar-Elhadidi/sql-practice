-- Problem: Odd and Even Measurements
-- Platform: DataLemur (Medium - Google)
-- URL: https://datalemur.com/questions/odd-even-measurements

WITH ranked_measurements AS (
  SELECT 
    measurement_time,
    measurement_value,
    ROW_NUMBER() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time) AS measurement_num  
  FROM measurements
)
SELECT 
  DATE(measurement_time) AS measurement_day,
  SUM(CASE WHEN measurement_num % 2 = 1 THEN measurement_value ELSE 0 END) AS odd_sum, 
  SUM(CASE WHEN measurement_num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM ranked_measurements
GROUP BY DATE(measurement_time)
ORDER BY measurement_day;
