--https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem


WITH daily_submissions AS (
    SELECT
        submission_date,
        hacker_id,
        COUNT(*) AS cnt
    FROM Submissions
    GROUP BY submission_date, hacker_id
),

continuous_hackers AS (
    SELECT
        submission_date,
        hacker_id
    FROM (
        SELECT
            submission_date,
            hacker_id,
            DENSE_RANK() OVER (
                PARTITION BY hacker_id
                ORDER BY submission_date
            ) AS dr,
            DATEDIFF(submission_date, '2016-03-01') + 1 AS day_no
        FROM (
            SELECT DISTINCT submission_date, hacker_id
            FROM Submissions
        ) t
    ) x
    WHERE dr = day_no
),

daily_count AS (
    SELECT
        submission_date,
        COUNT(DISTINCT hacker_id) AS total_hackers
    FROM continuous_hackers
    GROUP BY submission_date
),

winner AS (
    SELECT
        submission_date,
        hacker_id,
        cnt,
        ROW_NUMBER() OVER (
            PARTITION BY submission_date
            ORDER BY cnt DESC, hacker_id
        ) AS rn
    FROM daily_submissions
)

SELECT
    dc.submission_date,
    dc.total_hackers,
    w.hacker_id,
    h.name
FROM daily_count dc
JOIN winner w
    ON dc.submission_date = w.submission_date
   AND w.rn = 1
JOIN Hackers h
    ON w.hacker_id = h.hacker_id
ORDER BY dc.submission_date;
