#1.Count the number of Non NULL rating fields in the Customers table (including repeats)
 
 SELECT COUNT(*) FROM CUSTOMER WHERE RATING IS NOT NULL 
 
 
#2 Write a query that gives the names of both the salesperson and the customer for each order after the order number
  
SELECT O.ONUM, S.SNAME, C.CNAME FROM ORDERS O
INNER JOIN  SALESPEOPLE S ON O.SNUM = S.SNUM
INNER JOIN CUSTOMER C ON O.CNUM = C.CNUM

#3. Count the number of Salespeople registering orders for each day. (If a salespersons has more than one order on given day, he or she should be counted only once).

SELECT odate , COUNT(DISTINCT( snum )) AS salesPersonCount FROM orders GROUP BY  odate


#4. Find all orders attributed to salespeople in London.

SELECT * FROM orders WHERE snum IN (SELECT snum FROM salespeople WHERE city = "london")



#5.Find all salespeople who have customers with more than one current order

SELECT * FROM salespeople WHERE snum IN ( SELECT snum  FROM orders GROUP BY snum HAVING COUNT(snum ) >1); 


#6.Write a query that selects all customers whose names begins with ‘C’.

SELECT * FROM customer WHERE cname LIKE 'c%';


#7.  Write a query on the Customers table that will find the highest rating in each city. Put the output in this form: for the City (city) the highest rating is: (rating)


SELECT CONCAT( 'For the City', city, 'the highest rating is:',  MAX(rating)) AS label FROM customer GROUP BY city



#8  Write a query that selects each customer’s smallest order.

SELECT cnum,  MIN(amt) FROM orders GROUP BY cnum


#9 Write a query that selects the first customer in alphabetical order whose name begins with G

SELECT cname FROM customer WHERE cname LIKE 'G%' ORDER BY cname 


#10. Write a query that counts the number of different non NULL city values in the Customers table

SELECT COUNT(DISTINCT(snum)) FROM customer



#11.   Find the average amount from the Orders table.

SELECT AVG(amt) FROM orders


#12 Find all customers who are not located in San Jose and whose rating is above 200.

SELECT cname, city, RATING FROM customer WHERE city != 'SANJOSE' AND RATING > 200



#13   Does the customer who has placed the maximum number of orders have the maximum rating?



#14 Find all records in the Customer table with NULL values in the city column

SELECT * FROM customer WHERE city IS NULL



#15 Arrange the Orders table by descending customer number.

SELECT * FROM orders ORDER BY cnum DESC



#16 Find which salespeople currently have orders in the Orders table.

SELECT sname FROM salespeople WHERE snum IN ( SELECT DISTINCT(snum) FROM orders);



#17 Find the names and numbers of all salespeople who had more the one customer.

SELECT snum, sname FROM salespeople WHERE snum IN ( SELECT snum FROM orders GROUP BY snum HAVING COUNT(*) > 1 );



#18 Count the orders of each of the salespeople and output the results in descending order.

SELECT snum , COUNT(snum) AS ordercount FROM orders GROUP BY snum ORDER BY ordercount DESC



#19 List the Customer table if and only if one or more of the Customers in the Customer table are located in San Jose.

SELECT * FROM customer WHERE city = "SANJOSE"

SELECT 
 SELECT IF(( SELECT COUNT(cnum) AS customercount FROM customer WHERE  city = 'SANJOSE')>1, * ) END FROM customer 
 WHERE 1 < ( SELECT COUNT(cnum) AS customercount FROM customer WHERE  city = 'SANJOSE')


# 20 Find the largest order taken by each salesperson.

SELECT onum, amt FROM orders GROUP BY  snum HAVING  MAX(amt) ;



# 21 Find customers in San Jose who have a rating above 200.

 SELECT * FROM customer WHERE city = "SANJOSE" AND rating > 200

 

# 22 List all the orders of salesperson Motika from the Orders table.

 SELECT * FROM ORDERS WHERE SNUM = (SELECT SNUM FROM SALESPEOPLE WHERE SNAME = 'MOTIKA')
 

 #23 Find salespeople who have multiple customers.

SELECT * FROM SALESPEOPLE WHERE SNUM IN ( SELECT SNUM FROM ORDERS GROUP BY SNUM HAVING COUNT(SNUM) > 1 ) 


# 24 Find salespeople with customers located in their city.

SELECT s.sname, c.cname , s.city FROM salespeople s 
INNER JOIN customer c 
ON s.snum = c.snum   
WHERE s.city = c.city


# 25 Find the largest orders for serres and Rifkin.

SELECT * FROM orders  WHERE snum IN (SELECT snum FROM salespeople WHERE sname IN  ( 'serres', 'Rifkin') )   GROUP BY snum HAVING MAX(amt)



# 26 Find all salespeople that are located in either Barcelona or London.

SELECT * FROM salespeople WHERE city IN ( 'Barcelona', 'London')



#27 Find all salespeople with only one customer.

SELECT sname FROM salespeople WHERE snum IN (SELECT snum FROM customer GROUP BY snum HAVING COUNT(snum) = 1)


#28 Find salespeople whose sales is greater the avg sales

SELECT * FROM salespeople WHERE snum IN (SELECT snum FROM orders WHERE amt > (SELECT AVG(amt) FROM orders)) 			


                 