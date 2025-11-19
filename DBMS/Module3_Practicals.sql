-- ========== SCHEMA: Tables from Database tables.docx ==========
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  cust_name VARCHAR(100),
  city VARCHAR(50),
  grade INT,
  salesman_id INT
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  ord_no INT PRIMARY KEY,
  purch_amt DECIMAL(10,2),
  ord_date DATE,
  customer_id INT,
  salesman_id INT
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001,150.50,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.50,'2012-08-17',3009,5003),
(70007,948.50,'2012-09-10',3005,5002),
(70005,2400.60,'2012-07-27',3007,5001),
(70008,5760.00,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.40,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.60,'2012-04-25',3002,5001);

DROP TABLE IF EXISTS salesman;
CREATE TABLE salesman (
  salesman_id INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(50),
  commission DECIMAL(5,2)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

DROP TABLE IF EXISTS item_mast;
CREATE TABLE item_mast (
  pro_id INT PRIMARY KEY,
  pro_name VARCHAR(100),
  pro_price DECIMAL(10,2),
  pro_com INT
);

INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUES
(101, 'Motherboard', 3200.00, 15),
(102, 'Keyboard', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);

DROP TABLE IF EXISTS emp_details;
CREATE TABLE emp_details (
  emp_idno INT PRIMARY KEY,
  emp_fname VARCHAR(50),
  emp_lname VARCHAR(50),
  emp_dept INT
);

INSERT INTO emp_details (emp_idno, emp_fname, emp_lname, emp_dept) VALUES
(127323,'Michale','Robbin',57),
(526689,'Carlos','Snares',63),
(843795,'Enric','Dosio',57),
(328717,'Jhon','Snares',63),
(444527,'Joseph','Dosni',47),
(659831,'Zanifer','Emily',47),
(847674,'Kuleswar','Sitaraman',57),
(748681,'Henrey','Gabriel',47),
(555935,'Alex','Manuel',57),
(539569,'George','Mardy',27),
(733843,'Mario','Saule',63),
(631548,'Alan','Snappy',27),
(839139,'Maria','Foster',57);

-- ========== HRDB schema (tables + selected inserts) ==========

DROP TABLE IF EXISTS job_history;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS regions;

CREATE TABLE regions (
  region_id INT UNSIGNED NOT NULL PRIMARY KEY,
  region_name VARCHAR(25)
);

CREATE TABLE countries (
  country_id CHAR(2) NOT NULL PRIMARY KEY,
  country_name VARCHAR(40),
  region_id INT UNSIGNED NOT NULL
);

CREATE TABLE locations (
  location_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  street_address VARCHAR(40),
  postal_code VARCHAR(12),
  city VARCHAR(30) NOT NULL,
  state_province VARCHAR(25),
  country_id CHAR(2) NOT NULL
);

CREATE TABLE departments (
  department_id INT UNSIGNED NOT NULL PRIMARY KEY,
  department_name VARCHAR(30) NOT NULL,
  manager_id INT,
  location_id INT UNSIGNED
);

CREATE TABLE jobs (
  job_id VARCHAR(10) NOT NULL PRIMARY KEY,
  job_title VARCHAR(35) NOT NULL,
  min_salary DECIMAL(8,0) UNSIGNED,
  max_salary DECIMAL(8,0) UNSIGNED
);

CREATE TABLE employees (
  employee_id INT UNSIGNED NOT NULL PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(25) NOT NULL,
  email VARCHAR(25) NOT NULL,
  phone_number VARCHAR(20),
  hire_date DATE NOT NULL,
  job_id VARCHAR(10) NOT NULL,
  salary DECIMAL(8,2) NOT NULL,
  commission_pct DECIMAL(4,2),
  manager_id INT,
  department_id INT UNSIGNED
);

CREATE TABLE job_history (
  employee_id INT UNSIGNED NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  job_id VARCHAR(10) NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  UNIQUE KEY (employee_id, start_date)
);

INSERT INTO regions VALUES (1,'Europe'), (2,'Americas'), (3,'Asia'), (4,'Middle East and Africa');

INSERT INTO countries VALUES ('IT','Italy',1), ('JP','Japan',3), ('US','United States of America',2), ('CA','Canada',2), ('IN','India',3), ('UK','United Kingdom',1), ('FR','France',1), ('DE','Germany',1);

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES
(1000,'1297 Via Cola di Rie','00989','Roma',NULL,'IT'),
(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),
(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),
(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),
(2400,'8204 Arthur St',NULL,'London',NULL,'UK');

INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES
(10,'Administration',200,1700),
(20,'Marketing',201,1800),
(30,'Purchasing',114,1700),
(40,'Human Resources',203,2400),
(50,'Shipping',121,1500),
(60,'IT',103,1400),
(80,'Sales',145,2500),
(100,'Finance',108,1700),
(110,'Accounting',205,1700);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
('AD_PRES','President',20000,40000),
('AD_VP','Administration Vice President',15000,30000),
('IT_PROG','Programmer',4000,10000),
('MK_MAN','Marketing Manager',9000,15000),
('SA_REP','Sales Representative',6000,12000),
('FI_ACCOUNT','Accountant',4200,9000),
('SH_CLERK','Shipping Clerk',2500,5500);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES
(100,'Steven','King','SKING','515.123.4567','1987-06-17','AD_PRES',24000,NULL,NULL,90),
(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1989-09-21','AD_VP',17000,NULL,100,90),
(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1990-01-03','IT_PROG',9000,NULL,102,60),
(108,'Nancy','Greenberg','NGREENBE','515.124.4569','1994-08-17','FI_MGR',12000,NULL,101,100),
(145,'John','Russell','JRUSSEL','011.44.1344.429268','1996-10-01','SA_MAN',14000,0.4,100,80),
(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','1998-03-23','SA_REP',10000,0.20,148,80),
(182,'Martha','Sullivan','MSULLIVA','1999-06-21','SH_CLERK',2500,NULL,120,50),
(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1987-09-17','AD_ASST',4400,NULL,101,10);

-- ========== PRACTICAL TASKS: SQL QUERIES ==========

-- Task 1:
-- find customers who are either from the city 'New York' or who do not have a grade greater than 100.
-- Return customer_id, cust_name, city, grade, and salesman_id.
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city = 'New York' OR NOT (grade > 100);

-- Task 2:
-- find all the customers in ‘New York’ city who have a grade value above 100.
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city = 'New York' AND grade > 100;

-- Task 3:
-- display order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.
-- Interpreting: target = 6000, check orders where purch_amt > 0.5 * 6000 = 3000. Show achieved% = (purch_amt/6000)*100, unachieved% = 100 - achieved%.
SELECT ord_no,
       purch_amt,
       ROUND((purch_amt / 6000.0) * 100,2) AS achieved_percent,
       ROUND(100 - ((purch_amt / 6000.0) * 100),2) AS unachieved_percent
FROM orders
WHERE purch_amt > 0.5 * 6000;

-- Task 4:
-- calculate the total purchase amount of all orders.
SELECT SUM(purch_amt) AS total_purchase_amount FROM orders;

-- Task 5:
-- find the highest purchase amount ordered by each customer.
SELECT customer_id, MAX(purch_amt) AS max_purchase_amount
FROM orders
GROUP BY customer_id;

-- Task 6:
-- calculate the average product price.
SELECT ROUND(AVG(pro_price),2) AS average_product_price FROM item_mast;

-- Task 7:
-- find those employees whose department is located at 'Toronto'. Return first name, last name, employee ID, job ID.
-- Using HR schema: join employees -> departments -> locations
SELECT e.first_name, e.last_name, e.employee_id, e.job_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

-- Task 8:
-- find those employees whose salary is lower than that of employees whose job title is "MK_MAN". Exclude employees of the Job title ‘MK_MAN’.
-- Approach: find average or min? The wording: "salary is lower than that of employees whose job title is MK_MAN" -> compare to salaries of MK_MAN employees.
SELECT e.employee_id, e.first_name, e.last_name, e.job_id
FROM employees e
WHERE e.job_id <> 'MK_MAN'
  AND e.salary < (SELECT MIN(salary) FROM employees WHERE job_id = 'MK_MAN');

-- Task 9:
-- find all those employees who work in department ID 80 or 40. Return first name, last name, department number and department name.
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (80,40);

-- Task 10:
-- calculate the average salary, the number of employees receiving commissions in that department. Return department name, average salary and number of employees.
-- Interpret: per department aggregate average salary and count of employees who have commission_pct IS NOT NULL.
SELECT d.department_name,
       ROUND(AVG(e.salary),2) AS avg_salary,
       SUM(CASE WHEN e.commission_pct IS NOT NULL THEN 1 ELSE 0 END) AS num_employees_with_commission
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Task 11:
-- find out which employees have the same designation as the employee whose ID is 169.
SELECT e2.first_name, e2.last_name, e2.department_id, e2.job_id
FROM employees e1
JOIN employees e2 ON e1.job_id = e2.job_id
WHERE e1.employee_id = 169
  AND e2.employee_id <> 169;

-- Task 12:
-- find those employees who earn more than the average salary.
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Task 13:
-- find all those employees who work in the Finance department. Return department ID, name (first), job ID and department name.
-- "name (first)" interpreted as first_name
SELECT e.department_id, e.first_name, e.job_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

-- Task 14:
-- From employees, find the employees who earn less than the employee of ID 182. Return first name, last name and salary.
SELECT first_name, last_name, salary
FROM employees
WHERE salary < (SELECT salary FROM employees WHERE employee_id = 182);


-- Task 15: Create a stored procedure CountEmployeesByDept that returns the number of employees in each department
DROP PROCEDURE IF EXISTS CountEmployeesByDept;
DELIMITER $$
CREATE PROCEDURE CountEmployeesByDept()
BEGIN
  SELECT d.department_name, COUNT(e.employee_id) AS num_employees
  FROM departments d
  LEFT JOIN employees e ON d.department_id = e.department_id
  GROUP BY d.department_name;
END $$
DELIMITER ;

-- Task 16: Create AddNewEmployee that adds a new employee to the database.
DROP PROCEDURE IF EXISTS AddNewEmployee;
DELIMITER $$
CREATE PROCEDURE AddNewEmployee(
  IN p_employee_id INT,
  IN p_first_name VARCHAR(50),
  IN p_last_name VARCHAR(50),
  IN p_email VARCHAR(50),
  IN p_phone VARCHAR(20),
  IN p_hire_date DATE,
  IN p_job_id VARCHAR(10),
  IN p_salary DECIMAL(8,2),
  IN p_commission DECIMAL(4,2),
  IN p_manager_id INT,
  IN p_department_id INT
)
BEGIN
  INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
  VALUES (p_employee_id, p_first_name, p_last_name, p_email, p_phone, p_hire_date, p_job_id, p_salary, p_commission, p_manager_id, p_department_id);
END $$
DELIMITER ;

-- Task 17: Create DeleteEmployeesByDept that removes all employees from a specific department
DROP PROCEDURE IF EXISTS DeleteEmployeesByDept;
DELIMITER $$
CREATE PROCEDURE DeleteEmployeesByDept(IN p_department_id INT)
BEGIN
  DELETE FROM employees WHERE department_id = p_department_id;
END $$
DELIMITER ;

-- Task 18: Create GetTopPaidEmployees that retrieves the highest-paid employee in each department.
DROP PROCEDURE IF EXISTS GetTopPaidEmployees;
DELIMITER $$
CREATE PROCEDURE GetTopPaidEmployees()
BEGIN
  SELECT e.department_id, e.employee_id, e.first_name, e.last_name, e.salary
  FROM employees e
  JOIN (
    SELECT department_id, MAX(salary) AS max_sal
    FROM employees
    GROUP BY department_id
  ) m ON e.department_id = m.department_id AND e.salary = m.max_sal;
END $$
DELIMITER ;

-- Task 19: Create PromoteEmployee that increases an employee’s salary and changes their job role.
DROP PROCEDURE IF EXISTS PromoteEmployee;
DELIMITER $$
CREATE PROCEDURE PromoteEmployee(IN p_employee_id INT, IN p_new_job_id VARCHAR(10), IN p_salary_increase DECIMAL(8,2))
BEGIN
  UPDATE employees
  SET job_id = p_new_job_id,
      salary = salary + p_salary_increase
  WHERE employee_id = p_employee_id;
END $$
DELIMITER ;

-- Task 20: Create AssignManagerToDepartment that assigns a new manager to all employees in a specific department.
DROP PROCEDURE IF EXISTS AssignManagerToDepartment;
DELIMITER $$
CREATE PROCEDURE AssignManagerToDepartment(IN p_department_id INT, IN p_new_manager_id INT)
BEGIN
  UPDATE employees
  SET manager_id = p_new_manager_id
  WHERE department_id = p_department_id;
END $$
DELIMITER ;


