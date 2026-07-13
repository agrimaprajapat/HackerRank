--https://www.hackerrank.com/challenges/earnings-of-employees/problem


SELECT
    salary * months AS max_earnings,
    COUNT(*)
FROM Employee
GROUP BY salary * months
ORDER BY max_earnings DESC
LIMIT 1;