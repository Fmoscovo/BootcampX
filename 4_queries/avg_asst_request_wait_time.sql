-- cohorts (id, name, start_date, end_date)
-- students (id, name, email, phone, github, start_date, end_date, cohort_id) 
-- assignments (id, name, content, duration, day, chapter)
-- assignment_submissions (id, assignment_id, student_id, submission_date, duration) 
-- teachers (id, name, is_active, start_date, end_date)
-- assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)Get the average duration of assistance requests for each cohort.

-- Calculate the average time it takes to start an assistance request.

-- Return just a single column here.
-- Expected Result:

--  average_wait_time 
-- -------------------
--  00:08:46.258793
-- (1 row)

SELECT AVG(assistance_requests.started_at - assistance_requests.created_at) AS average_wait_time
FROM assistance_requests;
