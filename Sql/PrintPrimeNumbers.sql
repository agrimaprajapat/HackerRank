--https://www.hackerrank.com/challenges/print-prime-numbers/problem


WITH RECURSIVE numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 1000
)
SELECT GROUP_CONCAT(num SEPARATOR '&')
FROM numbers n
WHERE NOT EXISTS (
    SELECT 1
    FROM numbers d
    WHERE d.num < n.num
      AND d.num > 1
      AND n.num % d.num = 0
);
