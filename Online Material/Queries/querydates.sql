



SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Check the table
SELECT * FROM retirement_info;


SELECT first_name, last_name, title
FROM employees as e
LEFT JOIN titles as t ON e.emp_no = t.emp_no

-- Inner Join
SELECT d.dept_no, dept_name, emp_no, from_date, to_date
FROM Departments as d
INNER JOIN dept_manager as m ON d.dept_no = m.dept_no


-- Left Join
SELECT d.dept_no, dept_name, emp_no, from_date, to_date
FROM Departments as d
LEFT JOIN dept_manager as m ON d.dept_no = m.dept_no


-- Right Join
SELECT d.dept_no, dept_name, emp_no, from_date, to_date
FROM Departments as d
RIGHT JOIN dept_manager as m ON d.dept_no = m.dept_no

-- Full Outer Join
SELECT d.dept_no, dept_name, emp_no, from_date, to_date
FROM Departments as d
FULL JOIN dept_manager as m ON d.dept_no = m.dept_no



SELECT * FROM departments

INSERT INTO Departments (dept_no, dept_name )
VALUES ('d010', 'CEO')

DELETE FROM Departments WHERE dept_no='d010';

-- Use Inner Join for Departments and dept-manager Tables
-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;


-- Use Left Join to Capture retirement-info Table
-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;




-- Use Aliases for Code Readability
-- Use Left Join for retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no 
-- Joining retirement_info and dept_emp tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;




-- Use Left Join for retirement_info and dept_emp tables 
-- Create a new table to hold the information. Let's name it "current_emp."
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no WHERE de.to_date = ('9999-01-01');



-- Use Count, Group By, and Order By
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
-- SKILL DRILL: create a new table
INTO emp_count_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
-- there is one additional clause we can add to the query to keep everything in order: ORDER BY.
ORDER BY de.dept_no;


-- 7.3.5 Create Additional Lists

-- List 1: Employee Information
SELECT * FROM salaries
-- the most recent date, so sort that column in descending order.
ORDER BY to_date DESC;

-- code to filter the Employees table to show only employes born and hired at the correct time
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- format it to fit within the best practices guidelines.
SELECT emp_no,
    first_name,
	last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- (emp_info), join it to the salaries table to add the to_date and Salary columns
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
-- Adding a third join
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
-- The last filter we need is the to_date of 999-01-01 from the dept_emp table
AND (de.to_date = '9999-01-01');






-- List 2: Management
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);




-- List 3: Department Retirees
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);



-- What's going on with the salaries?
-- Why are there only five active managers for nine departments?
-- Why are some employees appearing twice?
-- To help Bobby find these answers, we're going to create tailored lists.


-- Skill Driill 1
-- SELECT * FROM departments;
-- SELECT * FROM dept_emp;
SELECT * FROM retirement_info;
SELECT * FROM dept_info;

-- Create a Tailored List 
-- Sales team requested list includes: Sales team retirement list
SELECT
-- Employee numbers
ri.emp_no,
-- Employee first name
ri.first_name,
-- Employee last name
ri.last_name,
-- Employee department name
di.dept_name
INTO sales_retirement
FROM retirement_info as ri
	INNER JOIN dept_info AS di
	ON (ri.emp_no = di.emp_no)
	WHERE (dept_name = 'Sales');



-- Skill Driill 2
-- Create a Tailored List 
-- Sales and Development managers requested a list of peoplo soon to retire
SELECT
-- Employee numbers
ri.emp_no,
-- Employee first name
ri.first_name,
-- Employee last name
ri.last_name,
-- Employee department name
di.dept_name
INTO dev_n_sales_retirement
FROM retirement_info as ri
	INNER JOIN dept_info AS di
	ON (ri.emp_no = di.emp_no)
	-- WHERE (dept_name = 'Sales') OR (dept_name = 'Development');
	WHERE dept_name in ('Sales', 'Development');


