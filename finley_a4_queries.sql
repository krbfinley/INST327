USE ischool_v2;
/* Answer 1 */
SELECT CONCAT(lname, ", ", fname) AS 'student_name', COUNT(section_id) AS 'enrollments', SUM(credits) AS 'credit_count', 
TIME_FORMAT(MAX(start_time), '%r') AS 'latest_start' 
FROM course_sections csec
JOIN courses c 
USING(course_id)
JOIN enrollments e
USING(section_id)
JOIN people p
USING(person_id)
GROUP BY student_name WITH ROLLUP
HAVING credit_count >= 9;


/* Answer 2 */

/*I choose a subquery over a CTE because I wanted to be able to use the GROUP BY and HAVING function but I can't use those functions with a CTE.
I had to use the GROUP BY for the course_id and HAVING for only displaying courses with 2 or more sections. */ 

SELECT CONCAT(course_code, course_number) AS course, course_description, 
COUNT(*) AS section_count, enrollment_count
FROM courses 
JOIN course_sections 
USING(course_id)
JOIN
(SELECT course_id, COUNT(*) AS enrollment_count
	FROM enrollments 
	JOIN people 
	USING(person_id)
	JOIN course_sections
	USING(section_id)
	JOIN courses 
	USING(course_id)
	GROUP BY course_id
	)
    AS subquery_table
    USING(course_id)
GROUP BY course_id
HAVING section_count >= 2
ORDER BY course;