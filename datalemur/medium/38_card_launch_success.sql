-- Problem: Card Launch Success (DataLemur - Medium)
-- URL: https://datalemur.com/questions/card-launch-success

WITH date_ranking AS (
  SELECT 
    card_name, 
    issued_amount, 
    ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS ranking
  FROM monthly_cards_issued
)

SELECT card_name, issued_amount
FROM date_ranking
WHERE ranking = 1
ORDER BY issued_amount DESC;
