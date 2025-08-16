SELECT 
Burnout_Level,
AVG(Hours_Per_Week) AS Avg_Hours,
COUNT(*) AS Count
FROM sakila.remote_work
GROUP BY Burnout_Level
ORDER BY Burnout_Level;