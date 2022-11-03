
/* Question #1 */

USE ischool_v2;

CREATE OR REPLACE VIEW student_addresses AS 
SELECT CONCAT(lname,',',fname) AS person, pronoun, department, CONCAT(street,',', city,',', state) AS 'Location Address', classification
FROM people
JOIN person_addresses USING(person_id)
JOIN addresses USING(address_id)
JOIN person_classifications USING(person_id)
JOIN classification USING(classification_id)
JOIN person_pronoun USING(person_id)
JOIN pronouns USING(pronoun_id)
WHERE classification = 'Student' AND state IS NOT NULL
ORDER BY department, person; 


