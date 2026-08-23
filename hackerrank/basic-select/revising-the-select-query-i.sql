-- Problem: Revising the Select Query I
-- Difficulty: Easy
-- Link: https://www.hackerrank.com/challenges/revising-the-select-query
--
-- Query all columns for all American cities in the CITY table
-- with populations larger than 100000. CountryCode for America is USA.

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA'
  AND POPULATION > 100000;
