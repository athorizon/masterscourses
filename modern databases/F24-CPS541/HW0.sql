-- Comments start with two hyphens as shown 
-- Use these comment lines to identify name, hw#, class, due date etc.
-- Example shown in next three lines -- Replace them with your info
--=============================================
-- Name: Kunal Maheshwari (please change this to your name)
-- GlobalId : Mahes1k
-- Class/ HW 0 : CPS541 - HW0- Due Sep 7
-- ============================================

-- this command is needed for including the commands and results in output file
set echo on; 

--specify the path for the file name to save the log of this session
spool U:\F24-CPS541\HW0log.txt

--define the width of the display (example: 150 columns)
set linesize 150;

--define the page size -- no of rows to be printed before header appears
set pagesize 120;

--Let us create a table named Grocer
--As a precaution, let us drop the table if Grocer already exists 
--It may result in an error if you are doing it for the first time --ignore it

drop table GROCER cascade constraints; 

--now we are sure Grocer table does not exist -- let us create one

CREATE TABLE GROCER
(ID   NUMBER(3) NOT NULL UNIQUE,
NAME  VARCHAR2(20),
PRICE NUMBER(5,2),
QTY   NUMBER(5)
); 

--To insert new data into Grocer table, we use INSERT statement
INSERT INTO GROCER VALUES(1, 'Apple', 1.20, 1200);
INSERT INTO GROCER VALUES(2, 'Orange', 2.25, 900);
INSERT INTO GROCER VALUES(3, 'Cucumber', 0.65, 3760);
INSERT INTO GROCER VALUES(4, 'Pineapple', 1.75, 670);
INSERT ALL INTO GROCER VALUES (5,'Peace',3.75,450) INTO GROCER VALUES (6,'Capsicum',0.90,200) INTO GROCER VALUES (7,'Coffee',1.30,300) INTO GROCER VALUES (8,'Potato',2.40,550) INTO GROCER VALUES (9,'Milk',1.50,300) SELECT * FROM DUAL;

--Retrieval of information

DESCRIBE GROCER;


SELECT * FROM GROCER ;

SELECT NAME, PRICE*QTY AS AMOUNT FROM GROCER ORDER BY AMOUNT DESC;

SELECT NAME LIKE 'A%' FROM GROCER;

--stop spooling
spool off;
