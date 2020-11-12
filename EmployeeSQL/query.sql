--Create table schemas for each of the six CSV file 
--Specify data types, primary keys,foreign keys, and other constraints. 


CREATE TABLE Departments(
    Dept_No VARCHAR(30) NOT NULL PRIMARY KEY,
	Dept_Name VARCHAR(30) NOT NULL
);

SELECT * FROM Departments;

CREATE TABLE Titles(
   Title_ID VARCHAR(30) NOT NULL,
   Title VARCHAR(30) NOT NULL,
   PRIMARY KEY (Title_ID)
);

SELECT * FROM Titles;


CREATE TABLE Employees(
    Emp_no INT NOT NULL,
	Title_ID VARCHAR(30) NOT NULL,
	Birth_date DATE NOT NULL,
	First_name VARCHAR(30) NOT NULL,
	Last_name VARCHAR(30) NOT NULL,
	Sex VARCHAR(30) NOT NULL,
	Hire_date DATE NOT NULL,
	PRIMARY KEY(Emp_no),
	FOREIGN KEY (Title_ID) REFERENCES Titles(Title_ID)
);

SELECT * FROM Employees;


CREATE TABLE Dept_Manager(
   Dept_No VARCHAR(30) NOT NULL,
   Emp_No INTEGER NOT NULL,
   PRIMARY KEY (Dept_No,Emp_No),
   FOREIGN KEY (Dept_No) REFERENCES Departments (Dept_No) ON DELETE CASCADE,
   FOREIGN KEY (Emp_No) REFERENCES Employees (Emp_No) ON DELETE CASCADE
);

SELECT * FROM Dept_Manager;


CREATE TABLE Dept_Employee (
   Emp_No INTEGER NOT NULL,
   Dept_No VARCHAR NOT NULL,
   PRIMARY KEY (Emp_No, Dept_No),
   FOREIGN KEY (Emp_No) REFERENCES Employees (Emp_No) ON DELETE CASCADE,
   FOREIGN KEY (Dept_No) REFERENCES Departments (Dept_No) ON DELETE CASCADE
);

SELECT * FROM Dept_Employee;



CREATE TABLE Salaries(
   Emp_No INTEGER NOT NULL,
   Salary INTEGER NOT NULL,
   PRIMARY KEY (Emp_No),
   FOREIGN KEY (Emp_No) REFERENCES Employees (Emp_No)
);

SELECT * FROM Salaries;

--DATA ANALYSIS

-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT Employees.emp_no, Employees.Last_name, Employees.First_name, Employees.Sex, Salaries.Salary
FROM Salaries
INNER JOIN Employees ON 
Employees.Emp_no = Salaries.Emp_no;

-- 2.List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'; 

-- 3.List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager ON
departments.dept_no=dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no=employees.emp_no

-- 4.List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_employee ON
employees.emp_no=dept_employee.emp_no
INNER JOIN departments ON
dept_employee.dept_no=departments.dept_no

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT last_name, first_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
INNER JOIN dept_employee ON
dept_employee.emp_no=employees.emp_no
INNER JOIN departments ON
dept_employee.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales' ;

-- 7.List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_employee ON
dept_employee.emp_no=employees.emp_no
INNER JOIN departments ON
dept_employee.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name='Development';

-- 8.In descending order, list the frequency count of employee last names, i.e., 
--  how many employees share each last name.

SELECT last_name,
Count(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

















	
