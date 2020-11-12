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
JOIN Employees ON 
Employees.Emp_no = Salaries.Emp_no;





	
