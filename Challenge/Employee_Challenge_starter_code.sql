

-- Deliverable 1: The Number of Retiring Employees by Title
-- Use Dictinct with Orderby to remove duplicate rows

-- Create Retirement Titles Table 
-- all the titles of current employees 
-- who were born between January 1, 1952 and December 31, 1955
-- Some employees may have multiple titles in the database
-- most recent title of each employee
-- Use COUNT() function to create a final table that has 
-- the number of retirement-age employees by most recent job title.


SELECT * FROM employees;
SELECT * FROM titles;

SELECT 
-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
	e.emp_no,
	e.first_name,
	e.last_name,
-- Retrieve the title, from_date, and to_date columns from the Titles table
	ti.title,
	ti.from_date,
	ti.to_date
-- Create a new table using the INTO clause.
INTO retirement_titles
-- Join both tables on the primary key.
	FROM employees AS e
	INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
-- Filter the data on the birth_date
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY emp_no;


-- There are duplicate entries for some employees 
-- because they have switched titles over the years.
-- remove these duplicates and keep only the most recent title of each employee.


SELECT DISTINCT ON (emp_no )
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;


-- First, retrieve the number of titles from the Unique Titles table.
-- Then, create a Retiring Titles table to hold the required information.
-- INTO retiring_titles
-- Group the table by title, then sort the count column in descending order.
-- Retrieve the number of employees by their most recent job title who are about to retire.

SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;
	


-- Deliverable 2: The Employees Eligible for the Mentorship Program
-- create a mentorship-eligibility table that holds the current employees 
-- who were born between January 1, 1965 and December 31, 1965.
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM titles;
SELECT * FROM current_emp;

-- Retrieve the first occurrence of the employee number for each set of rows 
SELECT DISTINCT ON (emp_no )
-- Retrieve columns from the Employees table
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
-- Retrieve columns from the Department Employee table.	
	de.from_date,
	de.to_date,
-- Retrieve the column from the Titles table
	ti.title
-- Create a new table
INTO mentorship_eligibility
-- Join the Employees and the Department Employee tables on the primary key.
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
-- Join the Employees and the Titles tables on the primary key.
INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
WHERE (ti.to_date = '9999-01-01') 
AND(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY (emp_no);
