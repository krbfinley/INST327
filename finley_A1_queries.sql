
/*ANSWER 1*/
SELECT CONCAT(course_code," ",course_number) AS "iSchool courses", course_description AS description, course_prereq AS "prerequisites", credits
FROM courses 
WHERE course_number >= 300 AND course_number <= 377 
ORDER BY course_number;

/*ANSWER 2*/
SELECT RIGHT(person_id, 4) AS ID, CONCAT(fname," ",LEFT(lname, 1),".") AS "name", LEFT(start_date, 10) AS start_date, department,title
FROM people
WHERE title IS NOT NULL
ORDER BY name ASC;