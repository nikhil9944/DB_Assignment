#1.List out resource name ,date_of_joining,location  od resource whose years_of_exp is more than 2 years
SELECT  r.name, r.date_of_joining , l.location_name FROM resource r INNER JOIN location  l ON r.location_id = l.location_id WHERE year_of_experience > 2;

#2.Find the employee which maximum experience

SELECT * FROM resource WHERE year_of_experience = (SELECT  MAX(year_of_experience) FROM resource) ;

#3.Find the resource with Indore location 

SELECT * FROM  resource r INNER JOIN  location l ON r.location_id = l.location_id WHERE l.location_name = "Indore";

#4.Find the resource name,hours ,location ,week_end_date

SELECT r.name , h.hours , h.week_end_date , l.location_name FROM resource r 
LEFT OUTER JOIN resource_hours h ON r.id = h.resource_hrs_id
LEFT OUTER JOIN location l ON r.location_id = l.location_id;


#5.Delete record from location table with location name as Mumbai

ALTER TABLE resource
ADD
FOREIGN KEY (location_id)
REFERENCES location (location_id)
ON DELETE SET NULL;
    
ALTER TABLE project
ADD
FOREIGN KEY (location_id)
REFERENCES location (location_id)
ON DELETE SET NULL;
 
DELETE FROM location WHERE location_name = "Mumbai"


#6.Make listing of all the records from all the tables using inner join 
 SELECT * FROM resource r
 INNER JOIN location l ON r.location_id = l.location_id
 INNER JOIN project p ON l.location_id = p.location_id
 INNER JOIN resource_hours h ON r.id = h.resource_id 
 
#7.Drop primary key  and foreign key constraint from project table (Drop constraint not the columns)
 
ALTER TABLE project 
DROP FOREIGN KEY project_ibfk_1

