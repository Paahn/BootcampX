SELECT cohorts.name AS cohort, COUNT(students.*) AS total_students 
FROM cohorts
JOIN students
ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.*)>= 18
ORDER BY COUNT(students.*);