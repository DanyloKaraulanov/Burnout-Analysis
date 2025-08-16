SELECT 
Work_Arrangement, 
AVG(Hours_Per_Week) AS Avg_Hours,
COUNT(*) AS Count
FROM sakila.remote_work
GROUP BY Work_Arrangement
ORDER BY Avg_Hours DESC;