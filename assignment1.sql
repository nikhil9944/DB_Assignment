
#Update Years of exp Kartik  to 8 from 10

UPDATE resource SET year_of_experience = 10 WHERE id = 6


#Delete record of Vishal

DELETE FROM resource WHERE id = 9


#Alter  table to add location column 

ALTER TABLE resource ADD COLUMN location VARCHAR(500)


#Make id as primary key

ALTER TABLE resource ADD PRIMARY KEY (id)

#Alter  table to drop column years_of_exp 

ALTER TABLE resource DROP COLUMN year_of_experience


#Alter table to change the datatype of primary key column to Bigint

ALTER TABLE resource MODIFY COLUMN id BIGINT 

#Write a select statement to view all the from the table created

SELECT * FROM resource


#Write a select statement to view data in the increasing and decreasing order of date_of_joining	

SELECT * FROM resource ORDER BY date_of_joining 

SELECT * FROM resource ORDER BY date_of_joining DESC			



