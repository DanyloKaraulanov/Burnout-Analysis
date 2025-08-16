
SELECT 
	Gender,
	FLOOR(Age/10) * 10 AS Age_Group, Work_Arrangement,
	COUNT(*) AS Count
FROM sakila.remote_work
GROUP BY Gender, Age_Group, Work_Arrangement
ORDER BY Gender, Age_Group, Count DESC;