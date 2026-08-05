--https://www.hackerrank.com/challenges/draw-the-triangle-2/problem


WITH RECURSIVE cte AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM cte
    WHERE n < 20
)
SELECT REPEAT('* ', n)
FROM cte;


