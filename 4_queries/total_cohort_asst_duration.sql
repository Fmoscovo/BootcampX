-- cohorts (id, name, start_date, end_date)
-- students (id, name, email, phone, github, start_date, end_date, cohort_id) 
-- assignments (id, name, content, duration, day, chapter)
-- assignment_submissions (id, assignment_id, student_id, submission_date, duration) 
-- teachers (id, name, is_active, start_date, end_date)
-- assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)Get the average duration of assistance requests for each cohort.

-- Select the cohort's name and the total duration the assistance requests.
-- Order by total_duration.
-- Look at the ERD to see how to join the tables.
-- Expected Result:

--  cohort | total_duration 
-- --------+----------------
--  JUL30  | 390:35:20
--  AUG27  | 398:19:00
--  JUL02  | 453:50:30
--  NOV19  | 462:34:40
--  MAY07  | 480:10:55
--  ...
--  (11 rows)

SELECT cohorts.name, SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;
