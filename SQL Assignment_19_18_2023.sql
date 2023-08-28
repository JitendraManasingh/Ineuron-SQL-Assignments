## SQL Assignment - 19th Aug 2023
CREATE DATABASE ATS;
USE ATS;

CREATE TABLE technology(
id int, 
technology varchar(15) NOT NULL);

INSERT INTO technology VALUES
(1,'DS'),
(1,'PowerBI'),
(1,'Python'),
(1,'SQL'),
(2,'Python'),
(3,'PowerBI'),
(3,'Python'),
(3,'SQL');

### Q1. Do list the condidates which possess any of the required skills (Skills - DS, PowerBI, Python & SQL)?
### Ans: Return all the id's the candidate which possess the requied skills.

## --- SQL Query Starts Here ---

SELECT id, technology FROM technology
WHERE technology IN ("DS","PowerBI","Python","SQL");

## --- SQL Query Ends Here ---


### Q2. Do list the condidates which possess all of the required skills (Skills - DS, PowerBI, Python & SQL)?
### Ans: Return all the id's the candidate which possess all the requied skills.

## --- SQL Query Starts Here ---
SELECT id FROM technology
WHERE technology IN ("DS","PowerBI","Python","SQL")
GROUP BY id
HAVING COUNT(DISTINCT(technology))=4;

## ---SQL Query Ends Here --- ##



########### Ecommerce Webiste ###########
## Q2. Query to return id's of the product info that have '0' likes.
### Ans: Return the Product_id (1002) where product have '0' likes.

## --- SQL Query Starts Here --- ##

CREATE DATABASE ecom;

USE ecom;

CREATE TABLE Product_info(
product_id INT,
product_name VARCHAR(50) NOT NULL
);
INSERT INTO product_info VALUES
(1001,"Blog"),
(1002,"YouTube"),
(1003,"Education");

CREATE TABLE Product_info_likes(
user_id int,
product_id int,
liked_date date); 

INSERT INTO Product_info_likes VALUES
(1,1001,"2023-08-19"),
(2,1003,"2023-08-18");

SELECT product_id FROM Product_info
WHERE product_id NOT IN (SELECT DISTINCT(product_id)
FROM Product_info_likes);

## ---SQL Query Ends Here --- ##