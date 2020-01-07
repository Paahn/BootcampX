SELECT day, COUNT(content) AS total_assignments
FROM assignments
GROUP BY assignments.day
HAVING COUNT(content) >= 10
ORDER BY assignments.day;