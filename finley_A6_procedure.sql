-- Partial script for the 'classes_for_student' stored procedure
-- Feel free to remove/edit the comments once you have finished the code (in fact, please do)
USE ischool_v2;

DROP PROCEDURE IF EXISTS classes_for_student;

DELIMITER //
-- The CREATE statement is below, be sure to create the varchar parameters!
CREATE PROCEDURE  classes_for_student (
	student_fname VARCHAR(50),
    student_lname VARCHAR(50)
	)

BEGIN
SELECT CONCAT(fname,' ',lname) AS student_name, department, CONCAT(course_code,' ', course_number) AS course_name, credits,
CONCAT(semester,' ',section_number) AS 'section',
course_description, start_time, building_code, room_number
FROM enrollments
JOIN course_sections USING (section_id)
JOIN courses USING (course_id)
JOIN people USING (person_id)
JOIN locations USING (location_id)
WHERE fname = student_fname AND lname = student_lname
ORDER BY course_name;



-- --> The procedure is made up of a select statement with the following columns:
-- --- student_name - full name; combination of student's first name and last name
-- --- department
-- --- course_name - combination of the course_code and course_number,
-- --- section - combination of semester and the section_number,
-- --- credits, course_description, start_time, building_code and room_number.

-- --> Only include courses that the student is taking 
-- --- Order results by course_name

		

END //

DELIMITER ;

-- --> Run the statement below to test your code: 
CALL classes_for_student('Dustin', 'Nguyen')

-- --> Do you see the rows with the following values? Column names should match the names outlined above. 
	-- 		Dustin Nguyen	BSIS	INST 101	1	Fall 0101	Bits and Bytes of Computer and Information Sciences	13:00:00	IRB	1207
	-- 		Dustin Nguyen	BSIS	INST 314	3	Fall 0201	Statistics for Information Science	14:00:00	HBK	109
	-- 		Dustin Nguyen	BSIS	INST 327	3	Fall 01xx	Database Design and Modeling	11:00:00	ATL	2324
	-- 		Dustin Nguyen	BSIS	INST 362	3	Fall 0103	User-Centered Design	14:00:00	ESJ	2208
-- --> If "Yes", you have built the stored procedure as required; 
-- --- if "No", continue working on it.

-- --> If you would like to test the output with different output you simply need to replace 'Dustin' and 'Nguyen' 
-- --> with any other student in the database. Please note some may return 0 which means they are not students!
-- --- SELECT DISTINCT fname, lname FROM people;

