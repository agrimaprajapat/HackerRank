--https://www.hackerrank.com/challenges/weather-observation-station-10/problem


select distinct(city) from station WHERE
city not regexp '[aeiou]$' 