-- cohorts (id, name, start_date, end_date)
-- students (id, name, email, phone, github, start_date, end_date, cohort_id) 
-- assignments (id, name, content, duration, day, chapter)
-- assignment_submissions (id, assignment_id, student_id, submission_date, duration) 
-- teachers (id, name, is_active, start_date, end_date)
-- assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)

-- Get the average time of an assistance request.

-- Select just a single row here and name it average_assistance_request_duration
-- In Postgres, we can subtract two timestamps to find the duration between them. (timestamp1 - timestamp2)
-- Expected Result:

--  average_assistance_request_duration 
-- -------------------------------------
--  00:14:21.556903
-- (1 row)

SELECT AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_request_duration
FROM assistance_requests;
