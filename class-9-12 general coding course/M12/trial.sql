CREATE TABLE EMPLOYEES (
employee_id int,
na_me TEXT,
department_id int,
salary int);

INSERT INTO EMPLOYEES (employee_id, name, department_id, salary) VALUES
(1, "Alice", 101, 60000),
(2, "Bob", 101, 55000),
(3, "Charlie", 102, 80000),
(4, "David", 102, 85000),
(5, "Eva", 103, 70000),
(6, "Frank", 103, 72000),
(7, "Grace", 104, 50000);

CREATE TABLE INFO (
employee_id int,
age int);

INSERT INTO INFO (employee_id, age) VALUES
(1, 23),
(2, 43),
(3, 24),
(5, 29),
(6, 44);

SELECT * FROM INFO;

SELECT * FROM EMPLOYEES;

SELECT EMPLOYEES.name, INFO.age FROM EMPLOYEES
INNER JOIN INFO
ON EMPLOYEES.employee_id == INFO.employee_id;


SELECT name, age
FROM (
    SELECT EMPLOYEES.name, INFO.age, 
           ROW_NUMBER() OVER () AS row_num
    FROM EMPLOYEES
    INNER JOIN INFO
    ON EMPLOYEES.employee_id = INFO.employee_id
) AS temp
WHERE row_num % 2 = 1;  -- This selects only odd-numbered rows (1st, 3rd, 5th, etc.)


SELECT department_id, AVG(SALARY) AS avg_salary FROM EMPLOYEES
GROUP BY department_id;
HAVING avg_salary > (SELECT AVG(salary) FROM EMPLOYEES);

SELECT employee_id, name, salary FROM EMPLOYEES
WHERE salary > (SELECT AVG(salary) FROM EMPLOYEES);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert departments
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

-- Insert employees
INSERT INTO employees (employee_id, employee_name, salary, department_id) VALUES
(1, 'Alice', 50000, 1),
(2, 'Bob', 70000, 1),
(3, 'Charlie', 120000, 2),
(4, 'David', 130000, 2),
(5, 'Eve', 200000, 3),
(6, 'Frank', 250000, 3),
(7, 'Grace', 300000, 3),
(8, 'Hank', 80000, 4),
(9, 'Ivy', 85000, 4);



SELECT employees.employee_id, employees.salary, departments.department_name FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;

SELECT departments.department_name, SUM(salary) AS TOTAL_DEPT_SALARY FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name
HAVING TOTAL_DEPT_SALARY>500000;

SELECT employee_name, MAX(SALARY) AS SECOND_HIGHEST_SALARY FROM employees
WHERE salary < (SELECT MAX(SALARY) FROM employees);

SELECT employee_name, salary FROM employees
WHERE SALARY > (SELECT MAX(salary) FROM employees
LEFT JOIN departments
ON departments.department_id = EMPLOYEES.department_id
WHERE departments.department_name = 'Marketing'
)
;

SELECT * FROM DEPARTMENTS;
SELECT * FROM employees;

