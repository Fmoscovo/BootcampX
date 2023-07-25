-- cohorts (id, name, start_date, end_date)
-- students (id, name, email, phone, github, start_date, end_date, cohort_id) 
-- assignments (id, name, content, duration, day, chapter)
-- assignment_submissions (id, assignment_id, student_id, submission_date, duration) 
-- teachers (id, name, is_active, start_date, end_date)
-- assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)Get the average duration of assistance requests for each cohort.

-- Calculate the average total duration of assistance requests for each cohort.

-- Use the previous query as a sub query to determine the duration per cohort.
-- Return a single row average_total_duration
-- Expected Result:

--  average_total_duration 
-- ------------------------
--  555:22:25.909091
-- (1 row)


SELECT AVG(total_duration) AS average_total_duration
FROM (
  SELECT cohorts.name, SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration
) AS total_duration;


