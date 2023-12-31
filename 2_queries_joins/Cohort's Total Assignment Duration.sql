-- SELECT
--   SUM(duration) AS total_duration
-- FROM
--   assignments
-- JOIN
--   assignment_submissions ON assignments.id = assignment_submissions.assignment_id
-- JOIN
--   students ON assignment_submissions.student_id = students.id
-- JOIN
--   cohorts ON students.cohort_id = cohorts.id
-- WHERE
--   cohorts.name = 'FEB12';

SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';