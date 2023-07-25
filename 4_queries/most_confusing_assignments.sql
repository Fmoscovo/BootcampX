-- cohorts (id, name, start_date, end_date)
-- students (id, name, email, phone, github, start_date, end_date, cohort_id) 
-- assignments (id, name, content, duration, day, chapter)
-- assignment_submissions (id, assignment_id, student_id, submission_date, duration) 
-- teachers (id, name, is_active, start_date, end_date)
-- assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)Get the average duration of assistance requests for each cohort.


-- List each assignment with the total number of assistance requests with it.

-- Select the assignment's id, day, chapter, name and the total assistances.
-- Order by total assistances in order of most to least.
-- Expected Result:

--  id  |       name       | day | chapter |total_requests 
-- -----+------------------+-----+---------+------------------
--  424 | Ullam cumque     |  51 |      12 |           143
--  423 | Culpa esse sint  |  51 |      11 |           113
--   45 | Quia quasi       |   5 |       7 |            86
--   50 | A rerum          |   6 |       5 |            83
--  141 | Illo error dolor |  17 |       9 |            82
--  ...
-- (424 rows)

SELECT assignments.id, assignments.name, assignments.day, assignments.chapter, COUNT(assistance_requests.id) AS total_requests
FROM assistance_requests
JOIN assignments ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;