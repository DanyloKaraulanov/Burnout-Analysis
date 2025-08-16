SELECT
CASE 
WHEN Hours_Per_Week < 35 THEN 'Low'
WHEN Hours_Per_Week BETWEEN 35 AND 45 THEN 'Medium'
ELSE 'High'
END AS Hour_Category,
ROUND(SUM(CASE WHEN Physical_Health_Issues = 'None' THEN 0 ELSE 1 END) * 100.0 / COUNT(*), 1) AS PCT_With_Issues,
SUM(CASE WHEN Physical_Health_Issues = 'None' THEN 1 ELSE 0 END) AS No_Issues_Count,
SUM(CASE WHEN Physical_Health_Issues != 'None' THEN 1 ELSE 0 END) AS Issues_Count,
COUNT(*) AS Total_Count
FROM sakila.remote_work
GROUP BY Hour_Category
ORDER BY 
CASE Hour_Category
WHEN 'Low' THEN 1
WHEN 'Medium' THEN 2
WHEN 'High' THEN 3
END;