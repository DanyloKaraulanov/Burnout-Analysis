SELECT 
Work_Arrangement,
AVG (CASE WHEN Burnout_Level = 'High' THEN 3
WHEN Burnout_Level = 'Medium' THEN 2
WHEN Burnout_Level = 'Low' THEN 1
ELSE NULL END) AS Avg_Burnout_Score,
ROUND(SUM(CASE WHEN Mental_Health_Status != 'None' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Any_Mental_Health_PCT,
ROUND(SUM(CASE WHEN Mental_Health_Status LIKE '%Anxiety%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Anxiety_PCT,
ROUND(SUM(CASE WHEN Mental_Health_Status LIKE '%Stress%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Stress_PCT,
ROUND(SUM(CASE WHEN Burnout_Level = 'High' AND Mental_Health_Status != 'None' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN Burnout_Level = 'High' THEN 1 ELSE 0 END), 1) AS PCT_High_Burnout_With_Mental_Health,
COUNT(*) AS Count
FROM sakila.remote_work
GROUP BY Work_Arrangement
ORDER BY Any_Mental_Health_PCT DESC;