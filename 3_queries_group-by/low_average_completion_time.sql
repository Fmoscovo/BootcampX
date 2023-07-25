-- cohorts (id, name, start_date, end_date)
-- students (id, name, email, phone, github, start_date, end_date, cohort_id)
-- assignments (id, name, content, duration, day, chapter)
-- assignment_submissions (id, assignment_id, student_id, submission_date, duration)
-- Low Average Completion Time
-- Instruction
-- Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.
 -- Select the name of the student, their average completion time, and the average suggested completion time.
-- Order by average completion time from smallest to largest.
-- Only get currently enrolled students.
-- This will require data from students, assignment_submissions, and assignments.
 -- Expected Result:
-- student       | average_assignment_duration | average_assignment_duration
-- ---------------------+-------------------------------+-------------------------------

SELECT students.name AS student,
       AVG(assignment_submissions.duration) AS average_completion_time,
       AVG(assignments.duration) AS average_suggested_time
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING COUNT(assignment_submissions.id) > 0
AND AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_completion_time ASC;