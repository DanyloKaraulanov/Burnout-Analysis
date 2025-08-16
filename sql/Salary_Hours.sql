SELECT 
Salary_Range, 
AVG(Hours_Per_Week) AS Avg_Hours,
COUNT(*) AS Count,
CASE 
WHEN Salary_Range = '$40K-60K' THEN 1
WHEN Salary_Range = '$60K-80K' THEN 2
WHEN Salary_Range = '$80K-100K' THEN 3
WHEN Salary_Range = '$100K-120K' THEN 4
WHEN Salary_Range = '$120K+' THEN 5
END AS Salary_Order
FROM sakila.remote_work
GROUP BY Salary_Range, Salary_Order
ORDER BY Salary_Order;
