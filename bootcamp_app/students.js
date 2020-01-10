const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
const values = [`%${cohortName}%`, limit];

pool.query(`
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
}).catch(err => console.error('query error', err.stack));




// pool.query(`
// SELECT id, name, cohort_id
// FROM students
// LIMIT 5;
// `)
// .then(res => {
//   console.log(res.rows); // if we logged just res, it would print the whole object
// })
// .catch(err => console.error('query error', err.stack));

// pool.query(`
// SELECT students.id AS student_id, students.name AS name, cohorts.name AS cohort
// FROM students
// JOIN cohorts ON cohort_id = cohorts.id
// LIMIT 5;
// `)
// .then(res => {
//   res.rows.forEach(user => {
//     console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
//   })
// })
// .catch(err => console.error('query error', err.stack));
