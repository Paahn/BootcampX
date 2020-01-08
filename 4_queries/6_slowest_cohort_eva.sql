SELECT cohorts.name AS cohort,
AVG(assistance_requests.completed_at - assistance_requests.started_at) AS maximum_assistance_time
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
JOIN assistance_requests ON assistance_requests.student_id = students.id
GROUP BY cohorts.name
ORDER BY AVG(assistance_requests.completed_at - assistance_requests.started_at) DESC
LIMIT 1;