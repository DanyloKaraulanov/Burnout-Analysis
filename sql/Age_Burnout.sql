SELECT 
FLOOR(Age/10)*10 AS Age_Group,
AVG(CASE
WHEN Burnout_Level = 'High' THEN 3
WHEN Burnout_Level = 'Medium' THEN 2
WHEN Burnout_Level = 'Low' THEN 1
ELSE NULL END) AS Avg_Burnout_Score,
SUM(CASE WHEN Burnout_Level = 'High' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PCT_High,
SUM(CASE WHEN Burnout_Level = 'Medium' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PCT_Medium,
SUM(CASE WHEN Burnout_Level = 'Low' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PCT_Low,
COUNT(*) AS Total_Count
FROM sakila.remote_work
GROUP BY Age_Group
ORDER BY Age_Group;