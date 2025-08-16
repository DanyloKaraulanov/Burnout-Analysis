SELECT 
Mental_Health_Status,
AVG(Hours_Per_Week) AS Avg_Hours,
COUNT(*) AS Count
FROM sakila.remote_work
GROUP BY Mental_Health_Status
ORDER BY Avg_Hours DESC;