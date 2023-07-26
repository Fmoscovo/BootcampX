const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// const { Client } = require('pg');

// const client = new Client({
//   user: 'vagrant',
//   password: '123',
//   host: 'localhost',
//   database: 'bootcampx'
// });
//------------------------------------------------------------------------------
//my db
// - cohorts (id, name, start_date, end_date)
// -- students (id, name, email, phone, github, start_date, end_date, cohort_id) 
// -- assignments (id, name, content, duration, day, chapter)
// -- assignment_submissions (id, assignment_id, student_id, submission_date, duration) 
// -- teachers (id, name, is_active, start_date, end_date)
// -- assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)
//------------------------------------------------------------------------------

pool.query(`
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
LIMIT ${process.argv[3] || 5};
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
}).catch(err => console.error('query error', err.stack));