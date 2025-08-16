SELECT
Work_Arrangement,
AVG(CASE WHEN Burnout_Level = 'High' THEN 3
WHEN Burnout_Level = 'Medium' THEN 2
WHEN Burnout_Level = 'Low' THEN 1 
ELSE NULL END) AS Avg_Burnout_Score,
ROUND(SUM(CASE WHEN Burnout_Level = 'High' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS PCT_High_Burnout,
AVG(Hours_Per_Week) AS Avg_Hours,
COUNT(*) AS Count
FROM sakila.remote_work
GROUP BY Work_Arrangement
ORDER BY Avg_Burnout_Score DESC;