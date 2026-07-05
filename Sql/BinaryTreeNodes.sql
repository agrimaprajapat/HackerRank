--https://www.hackerrank.com/challenges/binary-search-tree-1/problem


SELECT 
    N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS node_type
FROM BST
ORDER BY N;
