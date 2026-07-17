--https://www.hackerrank.com/challenges/weather-observation-station-20/problem


WITH Numbered AS (
    SELECT LAT_N, 
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn, 
           COUNT(*) OVER () AS total 
    FROM STATION
)
SELECT ROUND(AVG(LAT_N), 4) AS median 
FROM Numbered 
WHERE rn IN (FLOOR((total + 1) / 2.0), CEIL((total + 1) / 2.0));

