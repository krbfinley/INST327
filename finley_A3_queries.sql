USE ischool_v2;
/* Answer 1*/
DROP TABLE IF EXISTS `courses_copy`
CREATE TABLE `courses_copy` LIKE `courses`
SELECT * FROM `courses_copy`
SELECT COUNT(*) FROM `courses`;

DROP TABLE IF EXISTS `course_sections_copy`
CREATE TABLE `course_sections_copy` LIKE `course_sections`
INSERT INTO `course_sections_copy` SELECT * FROM `course_sections`
SELECT COUNT(*) FROM `course_sections_copy`;

INSERT INTO courses_copy VALUES (83, "INST", "408M", "Data Analytics and Decision Making Methods", NULL, NULL, 3);
INSERT INTO course_sections_copy VALUES (179, "0101", "Fall", "2022", "Th", "15:30:00","16:45:00", 83, 132466096,1,1,34);

/*Answer 2*/
UPDATE course_sections_copy 
SET delivery_id = (SELECT delivery_id 
FROM delivery 
WHERE delivery_type = 'Blended Learning' LIMIT 1)
WHERE section_id = 179;

SELECT CONCAT(crs.course_code,course_number) AS course_name, cs.section_id, delivery_type
FROM courses_copy crs
LEFT JOIN course_sections_copy cs
ON crs.course_id = cs.course_id
INNER JOIN delivery d 
ON cs.delivery_id = d.delivery_id
WHERE d.delivery_type = 'Blended Learning'
ORDER BY course_name;

/*Answer 3*/
DELETE FROM course_sections_copy
WHERE section_id IN (164,165,166,167,168,169);