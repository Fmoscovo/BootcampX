-- cohorts (id, name, start_date, end_date)
-- students (id, name, email, phone, github, start_date, end_date, cohort_id) 
-- assignments (id, name, content, duration, day, chapter)
-- assignment_submissions (id, assignment_id, student_id, submission_date, duration) 
-- teachers (id, name, is_active, start_date, end_date)
-- assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)Get the average duration of assistance requests for each cohort.

-- Get the cohort with the longest average duration of assistance requests.

-- The same requirements as the previous query, but only return the single row with the longest average.
-- Expected Result:

--  name  | average_assistance_time 
-- -------+-------------------------
--  MAR12 | 00:15:44.556041
-- (1 row)

SELECT cohorts.name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_time
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;
