SELECT 
Salary_Range,
AVG(CASE
WHEN Burnout_Level = 'High' THEN 3
WHEN Burnout_Level = 'Medium' THEN 2
WHEN Burnout_Level = 'Low' THEN 1
ELSE NULL END) AS Avg_Burnout_Score,
AVG(CASE WHEN Mental_Health_Status != 'None' THEN 1 ELSE 0 END) * 100 AS Any_Mental_Health_Condition_PCT,
ROUND(SUM(CASE WHEN Mental_Health_Status LIKE '%Anxiety%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Anxiety_PCT,
ROUND(SUM(CASE WHEN Mental_Health_Status LIKE '%Depression%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Depression_PCT,
ROUND(SUM(CASE WHEN Mental_Health_Status LIKE '%PTSD%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS PTSD_PCT,
ROUND(SUM(CASE WHEN Mental_Health_Status LIKE '%ADHD%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS ADHD_PCT,
ROUND(SUM(CASE WHEN Mental_Health_Status LIKE '%Burnout%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Burnout_PCT,
ROUND(SUM(CASE WHEN Mental_Health_Status LIKE '%Stress Disorder%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Stress_Disorder_PCT,
COUNT(*) AS Count
FROM sakila.remote_work
GROUP BY Salary_Range
ORDER BY 
CASE 
WHEN Salary_Range LIKE 'Under%' THEN 0
WHEN Salary_Range LIKE '%+' THEN 999
ELSE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(Salary_Range, '$', ''), '-', 1),' ', -1) AS UNSIGNED)
END;