--https://www.hackerrank.com/challenges/weather-observation-station-17/problem


select round(LONG_W,4) from station where LAT_N>38.7780 order by LAT_N ASC limit 1;

