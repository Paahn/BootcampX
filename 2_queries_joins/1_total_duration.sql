SELECT SUM(duration) 
FROM students JOIN assignments_submissions
ON students.id = assignments_submissions.student_id
WHERE students.name = 'Ibrahim Schimmel';