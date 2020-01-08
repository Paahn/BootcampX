-- initially calculated all assignments completed by all students for each day, which is not what the exercise asked for.
--SELECT assignments.day,
--COUNT(assignments.*) AS number_of_assignments,
--SUM(assistance_requests.completed_at - assistance_requests.started_at) as duration
--FROM assistance_requests
--JOIN assignments ON assignment_id = assignments.id -- remember, its supposed to be assistance_requests.assignment_id but we are trying to use the shortcut like a clouder of hippy cats would.
--GROUP BY assignments.day
--ORDER BY assignments.day;

SELECT day, COUNT(*) AS number_of_assignments, SUM(duration) AS duration
FROM assignments
GROUP BY day
ORDER BY day;