

set linesize 200;
--set page size (no of rows to be printed before header appears)
set pagesize 120;

--We want to create a table named employee 
-- first drop the table employee if it already exists -- if not an error message appears -- ignore
drop table Employee cascade constraints;

--creata a table Employee with various listed relationships and formats

CREATE TABLE Employee     
(Fname           VARCHAR2(15) NOT NULL,      
 Minit           CHAR,      
 Lname           VARCHAR2(15) NOT NULL,  
 Ssn			 CHAR(9) NOT NULL, 
 Bdate           DATE,      
 Address         VARCHAR2(30),      
 Sex             CHAR,      
 Salary          DECIMAL(10,2),      
 Super_ssn       CHAR(9),      
 Dno             INT NOT NULL,
 PRIMARY KEY (Ssn)) ;


--To insert new data into the Employee table, we use the INSERT statement:
--Note: We are using Oracle's To_Date function to enter date value --converts the string to Oracle date format

INSERT INTO Employee  
VALUES ('John', 'B', 'Smith', '123456789',         
        TO_DATE('1965-01-09', 'YYYY-MM-DD'), '731 Fondren, Houston, TX',        
        'M', 30000, '333445555', 5);  

INSERT INTO Employee
VALUES ('Franklin', 'T', 'Wong', '333445555',        
        TO_DATE('1955-12-08', 'YYYY-MM-DD'), '638 Voss, Houston, TX',         
        'M', 40000, '888665555', 5);

INSERT INTO Employee
VALUES ('Alicia', 'J', 'Zelaya', '999887777',        
        TO_DATE('1968-01-19', 'YYYY-MM-DD'), '3321 Castle, Spring, TX',         
        'F', 25000, '987654321', 4);

INSERT INTO Employee
VALUES ('Jennifer', 'S', 'Wallace', '987654321',         
        TO_DATE('1941-06-20', 'YYYY-MM-DD'), '291 Berry, Bellaire, TX',         
        'F', 43000, '888665555', 4);

INSERT INTO Employee
VALUES ('Ramesh', 'K', 'Narayan', '666884444',        
        TO_DATE('1962-09-15', 'YYYY-MM-DD'), '975 Fire Oak, Humble, TX',         
        'M', 38000, '333445555', 5);
		
INSERT INTO Employee
VALUES ('Joyce', 'A', 'English', '453453453',        
        TO_DATE('1972-07-31', 'YYYY-MM-DD'), '5631 Rice, Houston, TX',         
        'F', 25000, '333445555', 5);

INSERT INTO Employee
VALUES ('Ahmad', 'V', 'Jabbar', '987987987',        
        TO_DATE('1969-03-29', 'YYYY-MM-DD'), '980 Dallas, Houston, TX',         
        'M', 25000, '987654321', 4);
	
INSERT INTO Employee
VALUES ('James', 'E', 'Borg', '888665555',        
        TO_DATE('1937-11-10','YYYY-MM-DD'), '450 Stone, Houston, TX',         
        'M', 55000, NULL, 1);	
		
--Dropping the next two commands during the refresh COMPANY Schema run
--DESCRIBE Employee;

--SELECT * from Employee; 

-- first drop the table Department if it already exists -- if not an error message appears -- ignore
drop table Department cascade constraints;

--creata a table Department with various listed relationships and formats

CREATE TABLE Department     
(Dname           VARCHAR2(15) NOT NULL,       
 Dnumber		 INT NOT NULL, 
 Mgr_ssn         CHAR(9), 
 Mgr_start_date  DATE,
 PRIMARY KEY(Dnumber),
 UNIQUE(Dname),
 FOREIGN KEY(Mgr_ssn) REFERENCES EMPLOYEE(Ssn)) ;
 
 --To insert new data into the Department table, we use the INSERT statement:

INSERT INTO Department 
VALUES ('Research', 5, '333445555', TO_DATE('1988-05-22','YYYY-MM-DD'));

INSERT INTO Department 
VALUES ('Administration', 4, '987654321', TO_DATE('1995-01-01','YYYY-MM-DD'));

INSERT INTO Department 
VALUES ('Headquarters', 1, '888665555', TO_DATE('1981-06-19','YYYY-MM-DD'));

DESCRIBE Department;

SELECT * from Department; 

-- first drop the table Dept_Locations if it already exists -- if not an error message appears -- ignore
drop table Dept_Locations cascade constraints;

--creata a table Dept_Locations with various listed relationships and formats

CREATE TABLE Dept_Locations     
(Dnumber		 INT NOT NULL,
 Dlocation       VARCHAR2(15) NOT NULL,
PRIMARY KEY(Dnumber, Dlocation),
FOREIGN KEY(Dnumber) REFERENCES DEPARTMENT(Dnumber)) ;
 
 --To insert new data into the Dept_Locations table, we use the INSERT statement:

INSERT INTO Dept_Locations
VALUES (1, 'Houston');

INSERT INTO Dept_Locations
VALUES (4, 'Stafford');

INSERT INTO Dept_Locations
VALUES (5, 'Bellaire');

INSERT INTO Dept_Locations
VALUES (5, 'Sugarland');

INSERT INTO Dept_Locations
VALUES (5, 'Houston');

--Dropping the next two commands during the refresh COMPANY Schema run
--DESCRIBE Dept_Locations;

--SELECT * from Dept_Locations; 

-- first drop the table Project if it already exists -- if not an error message appears -- ignore
drop table Project cascade constraints;

--creata a table Project with various listed relationships and formats

CREATE TABLE Project     
(Pname		 VARCHAR2(15) NOT NULL,
 Pnumber	 INT NOT NULL PRIMARY KEY,
 Plocation   VARCHAR2(15),
 Dnum		 INT NOT NULL,
 UNIQUE(Pname),
 FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber));
 
--To insert new data into the Project table, we use the INSERT statement:

INSERT INTO Project 
VALUES ('ProductX', 1, 'Bellaire', 5);

INSERT INTO Project 
VALUES ('ProductY', 2, 'Sugarland', 5);

INSERT INTO Project 
VALUES ('ProductZ', 3, 'Houston', 5);

INSERT INTO Project 
VALUES ('Computerization', 10, 'Stafford', 4);

INSERT INTO Project 
VALUES ('Reorganization', 20, 'Houston', 1);

INSERT INTO Project 
VALUES ('Newbenefits', 30, 'Stafford', 4);

--Dropping the next two commands during the refresh COMPANY Schema run
--DESCRIBE Project;

--SELECT * from Project; 

-- first drop the table Works_on if it already exists -- if not an error message appears -- ignore
drop table Works_on cascade constraints;

--creata a table Works_on with various listed relationships and formats

CREATE TABLE Works_on     
(Essn         CHAR(9) NOT NULL,
 Pno		  INT NOT NULL,
 Hours		  DECIMAL(3,1) NOT NULL,
PRIMARY KEY (Essn, Pno),
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)) ;
 
 --To insert new data into the Works_on table, we use the INSERT statement:

INSERT INTO Works_on
VALUES ('123456789', 1, 32.5);

INSERT INTO Works_on
VALUES ('123456789', 2, 7.5);

INSERT INTO Works_on
VALUES ('666884444', 3, 40.0);

INSERT INTO Works_on
VALUES ('453453453', 1, 20.0);

INSERT INTO Works_on
VALUES ('453453453', 2, 20.0);

INSERT INTO Works_on
VALUES ('333445555', 2, 10.0);

INSERT INTO Works_on
VALUES ('333445555', 3, 10.0);

INSERT INTO Works_on
VALUES ('333445555', 10, 10.0);

INSERT INTO Works_on
VALUES ('333445555', 20, 10.0);

INSERT INTO Works_on
VALUES ('999887777', 30, 30.0);

INSERT INTO Works_on
VALUES ('999887777', 10, 10.0);

INSERT INTO Works_on
VALUES ('987987987', 10, 35.0);

INSERT INTO Works_on
VALUES ('987987987', 30, 5.0);

INSERT INTO Works_on
VALUES ('987654321', 30, 20.0);

INSERT INTO Works_on
VALUES ('987654321', 20, 15.0);

--INSERT INTO Works_on
--VALUES ('888665555', 20, NULL);

--Dropping the next two commands during the refresh COMPANY Schema run
--DESCRIBE Works_on;

--SELECT * from Works_on; 

-- first drop the table Dependent if it already exists -- if not an error message appears -- ignore
drop table Dependent cascade constraints;

--creata a table Dependent with various listed relationships and formats

CREATE TABLE Dependent    
(Essn		     CHAR(9) NOT NULL,
 Dependent_name	 VARCHAR2(15) NOT NULL,
 Sex   			 CHAR,
 Bdate 			 DATE,
 Relationship    VARCHAR2(8),
 PRIMARY KEY (Essn, Dependent_name),
 FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)); 

 
--To insert new data into the Dependent table, we use the INSERT statement:

INSERT INTO Dependent
VALUES ('333445555', 'Alice', 'F', TO_DATE('1986-04-05','YYYY-MM-DD'), 
		'Daughter');

INSERT INTO Dependent
VALUES ('333445555', 'Theodore', 'M', TO_DATE('1983-10-25','YYYY-MM-DD'), 
		'Son');

INSERT INTO Dependent
VALUES ('333445555', 'Joy', 'F', TO_DATE('1958-05-03','YYYY-MM-DD'), 
		'Spouse');
		
INSERT INTO Dependent
VALUES ('987654321', 'Abner', 'M', TO_DATE('1942-02-28','YYYY-MM-DD'), 
		'Spouse');	

INSERT INTO Dependent
VALUES ('123456789', 'Michael', 'M', TO_DATE('1988-01-04','YYYY-MM-DD'), 
		'Son');

INSERT INTO Dependent
VALUES ('123456789', 'Alice', 'F', TO_DATE('1988-12-30','YYYY-MM-DD'), 
		'Daughter');
		
INSERT INTO Dependent
VALUES ('123456789', 'Elizabeth', 'F', TO_DATE('1967-05-05','YYYY-MM-DD'), 
		'Spouse');			

--Dropping the next two commands during the refresh COMPANY Schema run		
--DESCRIBE Dependent;

--SELECT * from Dependent; 
 -- SELECT D.DNAME, D.DNUMBER,E.FNAME||' '||E.LNAME AS FULL_NAME FROM DEPARTMENT D INNER JOIN EMPLOYEE E ON D.MGR_SSN = E.SSN;
 
   --SELECT FNAME||' '||MINIT||' '||LNAME AS EMP_NAME,E.ADDRESS,SEX, SALARY, DNAME AS DEPARTMENT, DLOCATION AS WORK_LOCATION FROM EMPLOYEE E LEFT JOIN DEPARTMENT D ON E.SSN = D.MGR_SSN JOIN DEPT_LOCATIONS DL ON E.DNO = DL.DNUMBER;




