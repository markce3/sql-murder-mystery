
-- Project Title: SQL Murder Mystery by Knightlab
-- Author: Mark C. Emenyonu


-- Write a query that identifies the witnesses

-- Identifying the first witness
-- Explore the relevant tables to pinpoint columns you need for the context of the problem

SELECT *
FROM crime_scene_report
LIMIT 10;

-- Now I filter further for exact details based on the scenario

SELECT * 
FROM crime_scene_report
WHERE type = 'murder' AND date = '20180115' AND city = 'SQL City';

-- Now lets get a profile of who this witness really is. To do this, I refer to the table containing that information.

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_num DESC
LIMIT 1; -- this is key to narrowing down the first wtiness

-- Identifying the second witness
-- First, I refer to the initial query i ran to show details about the crime scene report for the day of the crime.

SELECT * 
FROM crime_scene_report
WHERE type = 'murder' AND date = '20180115' AND city = 'SQL City';

-- Now I get more details on the witness

SELECT *
FROM person
WHERE name LIKE 'Annab%' AND address_street_name = 'Franklin Ave'; 

-- Reviewing interview transcripts

SELECT *
FROM interview
WHERE person_id IN (14887, 16371);

-- Now we have enough information to pinpoint the killer

SELECT g1.name, g1.person_id
FROM get_fit_now_member g1
JOIN get_fit_now_check_in g2
ON g1.id = g2.membership_id
WHERE g1.id LIKE '48Z%'
	AND LOWER(membership_status) = 'gold'
	AND g2.check_in_date = '20180109';

-- The query I just ran produced two records so i will nest it in another query to produce more detail

SELECT p.id, p.name
FROM person p
JOIN (
	  SELECT g1.name, g1.person_id
	  FROM get_fit_now_member g1
	  JOIN get_fit_now_check_in g2
	  ON g1.id = g2.membership_id
	  WHERE g1.id LIKE '48Z%'
		  AND LOWER(membership_status) = 'gold'
		  AND g2.check_in_date = '20180109') as sus
ON sus.person_id = p.id
JOIN drivers_license dl
ON p.license_id = dl.id
WHERE plate_number LIKE '%H42W%';

-- Ladies and Gentlemen... we got him!
-- But let's review his interview transcripts for information on the motive

SELECT *
FROM interview
WHERE person_id = 67318;

/**

I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67").
She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

 **/

-- Now I build a suspect pool with the information available and nest that pool into a larger query to find the mystery contractor.

SELECT sus2.name, COUNT(person_id)
FROM facebook_event_checkin f
JOIN (
	SELECT p.id, name
	FROM person p
	JOIN drivers_license dl
	ON p.license_id = dl.id
	WHERE hair_color = 'red' AND gender = 'female' AND car_model = 'Model S') as sus2
ON sus2.id = f.person_id
WHERE event_name LIKE 'SQL Symphony%'
	AND date BETWEEN '20171201' AND '20171231'
GROUP BY sus2.name
HAVING COUNT(person_id) = 3;

-- And there we have it.