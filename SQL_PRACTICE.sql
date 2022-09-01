-- CREATING A DATABASE

CREATE DATABASE sql_study;

USE sql_study;

-- DROPPING A TABLE

DROP TABLE students;
-- CREATING A TABLE
CREATE TABLE students (first_name VARCHAR(10) NOT NULL, 
					  last_name VARCHAR(10) NOT NULL, 
                      student_id tinyint(3) NOT NULL AUTO_INCREMENT, 
                      age INT, 
                      birth_date DATE, 
                      PRIMARY KEY (student_id));
SELECT * 
FROM students;

-- INSERTING VALUES INTO THE TABLE
INSERT INTO students
VALUES ('Johnson', 'Kyle', DEFAULT, 13, '2008-08-20'), 
	   ('Stela', 'Simons', DEFAULT, 14, '2008-12-02'), 
       ('Hector', 'Mendel', DEFAULT, 14, '2008-02-01');
       
  -- CREATING A RANDOM CONSTRAINT   
  
ALTER TABLE students
ADD CONSTRAINT uniques UNIQUE(age, birth_date);

-- CHECKING IF IT IS WORKING

INSERT INTO students
VALUES ('Hector', 'Mendel', DEFAULT, 14, '2008-02-01');

-- DROP CONSTRAINT

ALTER TABLE students
DROP CONSTRAINT uniques;

-- USING FOREIGN KEY

CREATE TABLE classes (
					class_name VARCHAR(10) NOT NULL, 
                    class_id TINYINT(3) AUTO_INCREMENT, 
                    student_id TINYINT(3),
                    PRIMARY KEY (class_id), 
                    FOREIGN KEY (student_id) REFERENCES students (student_id));

SELECT *  
FROM classes;


INSERT INTO classes
VALUES ('Math', DEFAULT, 1), 
	   ('Geography', DEFAULT, 2),
       ('Chemical', DEFAULT, 3),
       ('Portuguese', DEFAULT, 1), 
	   ('Biology', DEFAULT, 2),
       ('Arts', DEFAULT, 3);
       
-- DROPPING A FOREIGN KEY
ALTER TABLE classes
DROP FOREIGN KEY classes_ibfk_1;

-- INSERTING AGAIN A FOREIGN KEY

ALTER TABLE classes
ADD FOREIGN KEY (student_id) REFERENCES students(student_id);


-- USING AN EXISTING DATABASE 

USE sql_store;

-- SELECTING THE CLIENT'S NAME, ID, ORDER ID AND PRODUCT NAME 

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS full_name, o.order_id, p.name
FROM customers c
	JOIN orders o
		ON 	c.customer_id = o.customer_id
	JOIN order_items oi
		ON	 o.order_id = oi.order_id
	JOIN products P
		ON	 oi.product_id = p.product_id;
        
-- FINDING HOW MANY ORDERS HAS ON EACH PRODUCT
SELECT p.product_id, p.name, COUNT(o.order_id) AS order_quantity
FROM order_items o
	RIGHT JOIN products p
		ON o.product_id = p.product_id
GROUP BY p.product_id
ORDER BY COUNT(o.order_id) DESC;

-- IN 
SELECT *
FROM order_items
WHERE quantity IN (7,10);

-- BETWEEN
SELECT * 
FROM order_items
WHERE quantity BETWEEN 7 AND 10;

-- LIKE
SELECT *
FROM order_items
WHERE product_id LIKE 10;