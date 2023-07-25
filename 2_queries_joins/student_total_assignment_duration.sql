-- SELECT
--   SUM(duration) AS total_assignment_duration
-- FROM
--   assignments
-- JOIN
--   assignment_submissions ON assignments.id = assignment_submissions.assignment_id
-- JOIN
--   students ON assignment_submissions.student_id = students.id
-- WHERE
--   students.name = 'Ibrahim Schimmel';

SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';
