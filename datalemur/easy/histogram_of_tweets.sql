-- Problem: Histogram of Tweets [Twitter SQL Interview Question]
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/sql-histogram-tweets

WITH tweets_per_user AS 
(
  SELECT COUNT(tweet_id) AS tweet_bucket, user_id 
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = 2022
  GROUP BY user_id
)

SELECT tweet_bucket, COUNT(user_id) AS users_num
FROM tweets_per_user
GROUP BY tweet_bucket;
