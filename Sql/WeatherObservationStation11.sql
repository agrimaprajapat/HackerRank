--https://www.hackerrank.com/challenges/weather-observation-station-11/problem


select distinct(city) from station 
WHERE city not regexp '^[aeiou]' or city not regexp '[aeiou]$';