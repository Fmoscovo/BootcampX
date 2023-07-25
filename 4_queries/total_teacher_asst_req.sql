-- cohorts (id, name, start_date, end_date)
-- students (id, name, email, phone, github, start_date, end_date, cohort_id) 
-- assignments (id, name, content, duration, day, chapter)
-- assignment_submissions (id, assignment_id, student_id, submission_date, duration) 
-- teachers (id, name, is_active, start_date, end_date)
-- assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)


-- Get the total number of assistance_requests for a teacher.

-- Select the teacher's name and the total assistance requests.
-- Since this query needs to work with any specific teacher name, use 'Waylon Boehm' for the teacher's name here.
-- Expected Result:

--  total_assistances |     name     
-- -------------------+--------------
--               4227 | Waylon Boehm
-- (1 row)

SELECT COUNT(assistance_requests.id) AS total_assistances, teachers.name
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;
