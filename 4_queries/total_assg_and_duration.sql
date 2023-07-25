-- cohorts (id, name, start_date, end_date)
-- students (id, name, email, phone, github, start_date, end_date, cohort_id) 
-- assignments (id, name, content, duration, day, chapter)
-- assignment_submissions (id, assignment_id, student_id, submission_date, duration) 
-- teachers (id, name, is_active, start_date, end_date)
-- assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)Get the average duration of assistance requests for each cohort.



-- Get each day with the total number of assignments and the total duration of the assignments.

-- Select the day, number of assignments, and the total duration of assignments.
-- Order the results by the day.
-- Expected Result:

--  day | number_of_assignments | duration 
-- -----+-----------------------+----------
--    1 |                    11 |      590
--    2 |                     9 |      585
--    3 |                     9 |      425
--    4 |                     9 |      380
--    5 |                     7 |      405
-- ...
-- (51 rows)

SELECT assignments.day, COUNT(assignments.id) AS number_of_assignments, SUM(assignments.duration) AS duration
FROM assignments
GROUP BY assignments.day
ORDER BY assignments.day;
