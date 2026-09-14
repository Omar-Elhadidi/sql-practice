-- Problem: Duplicate Job Listings
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/duplicate-job-listings

WITH duplicate_listings AS (
  SELECT company_id, title, description, COUNT(job_id) 
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(job_id) > 1
)
SELECT COUNT(*) AS duplicate_companies
FROM duplicate_listings;
