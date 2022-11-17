## Partial script for question 2 of assignment 7
# Please remove the comments once finished

USE ischool_v2;

DROP FUNCTION IF EXISTS get_person_pronouns;

DELIMITER //

CREATE FUNCTION get_person_pronouns (fname_param VARCHAR(20),lname_param VARCHAR(20))
	# (first name and last name parameters)

RETURNS VARCHAR(20) 
# (datatype that is being returned here)
DETERMINISTIC READS SQL DATA 
BEGIN 
	DECLARE pronouns_var VARCHAR(20);
    SELECT pronoun
    INTO pronouns_var
    FROM people
    JOIN person_pronoun USING(person_id)
    JOIN pronouns USING (pronoun_id)
    WHERE fname = fname_param AND lname = lname_param;
	
    ## Declare a new variable named "pronouns"
    # Write a select query that fetches the pronouns of a student given their first name and last name
    # Assign the result of the query to the new pronouns variable
    
    RETURN(pronouns_var); 
    # (Return the pronouns variable)
END //
DELIMITER ;

## Test your code:
# Run this query:
# SELECT get_person_pronouns("Kamala","Khan");

# Does it return "she/her"?