-- Problem: Top 5 Artists (DataLemur - Medium)
-- URL: https://datalemur.com/questions/top-fans-rank

WITH songs_no AS (
  SELECT artist_name, COUNT(name) AS songs_count
  FROM artists a
  JOIN songs s
    ON a.artist_id = s.artist_id
  JOIN global_song_rank r
    ON s.song_id = r.song_id AND rank <= 10
  GROUP BY artist_name
),
rankings AS (
  SELECT *, DENSE_RANK() OVER(ORDER BY songs_count DESC) AS artist_rank
  FROM songs_no
)

SELECT artist_name, artist_rank
FROM rankings
WHERE artist_rank <= 5;
