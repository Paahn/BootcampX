SELECT COUNT(content) as total_assignments FROM assignments
GROUP BY assignments.day
HAVING total_assignments >= 10

ORDER BY assignments.day;