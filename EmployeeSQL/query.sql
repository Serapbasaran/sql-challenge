--Create table schemas for each of the six CSV file 
--Specify data types, primary keys,foreign keys, and other constraints. 

DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments(
    Dept_No VARCHAR(30) NOT NULL PRIMARY KEY,
	Dept_Name VARCHAR(30) NOT NULL
);

SELECT * FROM Departments;

CREATE TABLE Titles(
   Title_ID VARCHAR(30) PRIMARY KEY,
   Title VARCHAR(30)
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
	PRIMARY KEY(Emp_no)
	FOREIGN KEY(Title_ID) REFERENCES Titles (Title_ID);
);

SELECT * FROM Employees;


