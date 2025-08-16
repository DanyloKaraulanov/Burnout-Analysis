SELECT 
Burnout_Level, 
Mental_Health_Status,
COUNT(*) AS Count,
COUNT(*)*100.0/SUM(COUNT(*)) OVER(PARTITION BY Burnout_Level) AS Percentage
FROM sakila.remote_work
GROUP BY Burnout_Level, Mental_Health_Status
ORDER BY Burnout_Level, Mental_Health_Status DESC; 