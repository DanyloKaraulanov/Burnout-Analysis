SELECT 
Job_Role,
Work_Arrangement,
AVG(CASE
WHEN Burnout_Level = 'High' THEN 3
WHEN Burnout_Level = 'Medium' THEN 2
WHEN Burnout_Level = 'Low' THEN 1
ELSE NULL END) AS Avg_Burnout,
SUM(CASE WHEN Burnout_Level = 'High' THEN 1 ELSE 0 END) * 100.0  / COUNT(*) AS PCT_High,
SUM(CASE WHEN Burnout_Level = 'Medium' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PCT_Medium,
SUM(CASE WHEN Burnout_Level = 'Low' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PCT_Low,
COUNT(*) AS Total_Count
FROM sakila.remote_work
GROUP BY Job_Role, Work_Arrangement
ORDER BY Job_Role, 
CASE Work_Arrangement
WHEN 'Onsite' THEN 1
WHEN 'Hybrid' THEN 2
WHEN 'Remote' Then 3
ELSE 4
END,
Avg_Burnout DESC; 