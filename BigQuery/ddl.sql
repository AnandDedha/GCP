CREATE TABLE SQLdemo.DEPARTMENT
(
   DEPTCODE   INT64,
   DeptName   STRING,
   LOCATION   STRING
);

CREATE TABLE SQLdemo.EMPLOYEE
(
   EmpCode      INT64,
   EmpFName     STRING,
   EmpLName     STRING,
   Job          STRING,
   Manager      STRING,
   HireDate     DATE,
   Salary       INT64,
   Commission   INT64,
   DEPTCODE     INT64,
);



INSERT INTO SQLdemo.DEPARTMENT VALUES (10, 'FINANCE', 'New York'),
                              (20,'SOFTWARE','Toronto'),
                              (30, 'SALES', 'LA'),
                              (40,'MARKETING', 'Sydney'),
                              (50,'ADMIN', 'BIRMINGHAM');



INSERT INTO SQLdemo.EMPLOYEE  
VALUES (9369, 'TONY', 'STARK', 'SOFTWARE ENGINEER', 'John', '1980-12-17', 2800,0,20),
       (9499, 'TIM', 'ADOLF', 'SALESMAN', 'John', '1981-02-20', 1600, 300,30),    
       (9566, 'KIM', 'JARVIS', 'MANAGER', 'Mike', '1981-04-02', 3570,0,20),
       (9654, 'SAM', 'MILES', 'SALESMAN', 'Andy', '1981-09-28', 1250, 1400, 30),
       (9782, 'KEVIN', 'HILL', 'MANAGER', 'Andy', '1981-06-09', 2940,0,10),
       (9788, 'Will', 'SMITH', 'ANALYST', 'Andy', '1982-12-09', 3000,0,20),
       (9839, 'ALFRED', 'KINSLEY', 'PRESIDENT', 'Andy', '1981-11-17', 5000,0, 10),
       (9844, 'PAUL', 'TIMOTHY', 'SALESMAN', 'Mike', '1981-09-08', 1500,0,30),
       (9876, 'JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', 'John', '1983-01-12',3100,0,20),
       (9900, 'ROSE', 'SUMMERS', 'TECHNICAL LEAD', 'John', '1981-12-03', 2950,0, 20),
       (9902, 'ANDREW', 'FAULKNER', 'ANAYLYST', 'Andy', '1981-12-03', 3000,0, 10),
       (9934, 'KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', 'Mike', '1982-01-23', 3300,0,20),
       (9591, 'WENDY', 'SHAWN', 'SALESMAN', 'John', '1981-02-22', 500,0,30),
       (9698, 'BELLA', 'SWAN', 'MANAGER', 'John', '1981-05-01', 3420, 0,30),
       (9777, 'Steve', 'Rogers', 'ANALYST', 'John', '1981-05-01', 2000, 200, NULL),
       (9860, 'ATHENA', 'WILSON', 'ANALYST', 'John', '1992-06-21', 7000, 100, 50),
       (9861, 'JENNIFER', 'HUETTE', 'ANALYST', 'John', '1996-07-01', 5000, 100, 50);
