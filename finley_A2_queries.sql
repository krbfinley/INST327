
/*ANSWER 1*/
SELECT CONCAT(crs.course_code, " ", crs.course_number) AS course_name, csect.section_number, CONCAT(semester, " ",year) AS semester, 
crs.course_description, dlr.delivery_type AS delivery_type
FROM courses crs
LEFT JOIN course_sections csect
ON crs.course_id = csect.course_id
LEFT JOIN delivery dlr 
ON csect.delivery_id = dlr.delivery_id
WHERE course_number >= 101 AND course_number <= 888
ORDER BY course_name;


/*ANSWER 2*/
SELECT CONCAT(fname, " ", lname) AS name, rce.race AS race, prns.pronoun AS pronoun
FROM people ppl
LEFT JOIN person_race pplr 
ON ppl.person_id = pplr.person_id
LEFT JOIN race rce 
ON pplr.race_id = rce.race_id
LEFT JOIN person_pronoun ppro 
ON ppl.person_id = ppro.person_id
LEFT JOIN pronouns prns 
ON ppro.pronoun_id = prns.pronoun_id
ORDER BY name;
