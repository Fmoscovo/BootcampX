SELECT id,
       NAME
from students
where cohort_id = 1
order by NAME;


SELECT count(id)
FROM students
WHERE cohort_id IN (1,
                    2,
                    3);


SELECT id,
       name,
       cohort_id
FROM students
WHERE email IS NULL
  or phone IS NULL
ORDER BY name ASC;


SELECT id,
       name,
       email,
       cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com'
  and phone is NULL
ORDER BY name ASC;


SELECT name,
       cohort_id,
       id
from students
where end_date is NULL
order by cohort_id;


SELECT name,
       email,
       phone
from students
where end_date is not NULL
  and github is null;