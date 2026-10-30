-- Problem: Average Deal Size (DataLemur - Easy)
-- URL: https://datalemur.com/questions/sql-average-deal-size

SELECT ROUND(AVG(num_seats * yearly_seat_cost), 2) AS average_deal_size
FROM contracts;
