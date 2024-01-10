-- 25092023-08102023

-- sys alt?nda bunu yapal?m
/*

Create User UserName identified by Password;
Grant connect, resource to UserName;
Grant All Privileges to UserName;

*/

Create User Ali1 identified by Ali1;

Grant connect, resource to Ali1;

Grant All Privileges to Ali1;

--
Create User SQLDATA identified by SQLDATA;

Grant connect, resource to SQLDATA;

Grant All Privileges to SQLDATA;

Create User OracleData identified by OracleData;

Grant connect, resource to OracleData;

Grant All Privileges to OracleData;

Create User OracleDataA identified by OracleDataA;

Grant connect, resource to OracleDataA;

Grant All Privileges to OracleDataA;

--


-- simdi istedigimiz user icin gidebiliriz

Create Table Personel
( id int,
 FullName varchar2(100)
 );
 
 Select *
 From Personel;
 
insert into Personel Values(1,'Ali TOPACIK');
insert into Personel Values('Bedir GUNES',4);-- Bu kod calismayacakt?r

Select *
From Personel;

insert into Personel(id, fullname) Values(2,'Ali BULUT');
insert into Personel(fullname,id) Values('Ali GUNES',3);

Select *
From Personel;

Create Table employees as
Select *
From hr.employees;


SELECT *
FROM employees;
    
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees;
    
-- employees tablosunda job_id ' si IT_PROG olan verileri getiriniz

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    job_id
FROM
    employees
Where job_id = 'IT_PROG';

-- Yukar?daki sorguda ayr?ca salary > 5000 olan kay?tlar? bulunuz

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    job_id
FROM
    employees
Where job_id = 'IT_PROG' and Salary > 5000;

Select *
From employees;

-- EMPLOYEES tablosunda her bir job_id icin odenen maas toplamlar?n? bulal?m

Select
        job_id,
        sum(Salary) as ToplamSalary
From employees
Group By job_id;

-- Yukar?daki sorguda ToplamSalary > 10000 olan kay?tlar? bulunuz
Select
        job_id,
        sum(Salary) as ToplamSalary
From employees
Group By job_id
Having sum(Salary) > 10000;

-- Yukar?daki sorguda ToplamSalary buyukten kucuge dogru s?ralay?n?z
Select
        job_id,
        sum(Salary) as ToplamSalary
From employees
Group By job_id
Having sum(Salary) > 10000
Order By ToplamSalary desc;

-- ToplamSalary kucukten buyuge dogru s?ralay?n?z

Select
        job_id,
        sum(Salary) as ToplamSalary
From employees
Group By job_id
Having sum(Salary) > 10000
Order By ToplamSalary;

Select
        job_id,
        sum(Salary) as ToplamSalary
From employees
Group By job_id
Having sum(Salary) > 10000
Order By ToplamSalary asc;

-- Employees tablosunda department_id'si 60,80,90 olanlar?n
-- herbir job_id'si icin ToplamSalary'leri 30000'den buyuk
-- olanlar icin bulunuz ve buyukten kucuge dogru s?ralay?n?z

Select
        job_id,
        Sum(Salary) as TotalSalary
From 
        Employees
Where 
        department_id in(60,80,90)
Group By
        job_id
Having 
        Sum(Salary) > 30000
Order By
        TotalSalary desc;
        
-- employees tablosunda department_id'si 60 olan kay?tlar? bulunuz

Select *
From employees
Where department_id = 60;

-- employees tablosunda department_id'si 60,70,80 olan kay?tlar? bulunuz

Select *
From employees
Where department_id = 60 or department_id = 70 or department_id = 80;

-- Yukar?daki kullan?m yerine in komutu ile bulal?m

Select employee_id, first_name, last_name, Salary
From employees
Where department_id in(60, 70, 80);

-- Yukar?daki sorguda Salary buyukten kucuge dogru olsun

Select employee_id, first_name, last_name, Salary
From employees
Where department_id in(60, 70, 80)
Order By Salary desc;

Select employee_id, Salary, first_name, last_name
From employees
Where department_id in(60, 70, 80)
Order By Salary desc;

-- veya

Select employee_id, first_name, last_name, Salary
From employees
Where department_id in(60, 70, 80)
Order By 4 desc;

Select employee_id, Salary, first_name, last_name
From employees
Where department_id in(60, 70, 80)
Order By 4 desc;

Create Table departments as
Select *
From hr.departments;

Create Table locations as
Select *
From hr.locations;

Create Table countries as
Select *
From hr.countries;

-- Drop Table regions;
Create Table regions as
Select *
From hr.regions;

-- employees tablosu ile departments tablolar?n? birlestirelim

Select *
From employees
join departments on departments.department_id = employees.department_id;

-- Yukar?daki kullan?m? Alias ile yapal?m

Select *
From employees   e
join departments d on d.department_id = e.department_id;

Select
        e.employee_id,
        e.first_name,
        e.last_name,
        d.department_name
From employees   e
join departments d on d.department_id = e.department_id;

Select
        e.employee_id,
        e.first_name,
        e.last_name,
        d.department_name
From employees e,departments d
Where d.department_id = e.department_id;

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_id,
    e.salary,
    d.department_name,
    l.postal_code,
    l.city,
    l.state_province,
    c.country_name,
    r.region_name
FROM
     employees   e    
join departments d on e.department_id = d.department_id
join locations   l on d.location_id   = l.location_id
join countries   c on c.country_id    = l.country_id
join regions     r on r.region_id     = c.region_id;

-- yukaridaki sorguda region_name'e gore toplamsalary bulunuz

SELECT
        r.region_name, sum(salary) as TotalSalary
FROM
     employees   e    
join departments d on e.department_id = d.department_id
join locations   l on d.location_id   = l.location_id
join countries   c on c.country_id    = l.country_id
join regions     r on r.region_id     = c.region_id
Group By r.region_name;

SELECT
        region_name, sum(salary) as TotalSalary
FROM
     employees   e    
join departments d on e.department_id = d.department_id
join locations   l on d.location_id   = l.location_id
join countries   c on c.country_id    = l.country_id
join regions     r on r.region_id     = c.region_id
Group By region_name;

-- Yukar?daki sorguda region_name'lerin ulkelere gore toplam salary bilgilerini bulunuz

SELECT
        region_name,
        country_name,
        sum(salary) as TotalSalary
FROM
     employees   e    
join departments d on e.department_id = d.department_id
join locations   l on d.location_id   = l.location_id
join countries   c on c.country_id    = l.country_id
join regions     r on r.region_id     = c.region_id
Group By region_name,country_name
Order By 1;

-- Yukar?daki sorguda region_name'lerin ulkeler ve state_province'e gore
-- toplam salary bilgilerini bulunuz

SELECT
    r.region_name,
    c.country_name,
    l.state_province,
    sum(e.salary) as TotalSalary
FROM
     employees   e    
join departments d on e.department_id = d.department_id
join locations   l on d.location_id   = l.location_id
join countries   c on c.country_id    = l.country_id
join regions     r on r.region_id     = c.region_id
Group By
        r.region_name,c.country_name,l.state_province
Order By 1,2,3;

--

SELECT
    r.region_name,
    c.country_name,
    l.state_province,
    l.city,
    d.department_name,
    sum(e.salary) as TotalSalary
FROM
     employees   e    
join departments d on e.department_id = d.department_id
join locations   l on d.location_id   = l.location_id
join countries   c on c.country_id    = l.country_id
join regions     r on r.region_id     = c.region_id
Group By
        r.region_name,c.country_name,l.state_province, l.city, d.department_name
Order By 1,2,3;

--

Create Table employee1
(
    employee_id Number Primary Key,
    firstname varchar2(30),
    lastname varchar2(30),
    salary Number,
    hiredate date
);

Create Table employee2
(
    employee_id Number Constraint pk_employee2_empid Primary Key,
    firstname varchar2(30),
    lastname varchar2(30),
    salary Number,
    hiredate date
);

--
-- Drop Table employee3;

Create Table employee3
(
    employee_id Number,
    firstname varchar2(30),
    lastname varchar2(30),
    salary Number,
    hiredate date,
    Constraint pk_employee3_empid Primary Key(employee_id)   
);

Create Table employee4
(
    employee_id Number,
    firstname varchar2(30),
    lastname varchar2(30),
    salary Number,
    hiredate date    
);

Alter Table employee4
Add Constraint pk_employee4_empid Primary Key(employee_id);

-- Composite Primary Key

-- Asagidaki sorgu ornek amacl?d?r

Create Table employee5
(
    employee_id Number,
    firstname varchar2(30) Constraint pk_employee5_firstname Primary Key,
    lastname varchar2(30)
    
);

insert into employee5 Values(1,'Ali','TOPACIK');
insert into employee5 Values(2,'Ali','TOPACIK'); -- ayn? isim 2 veya fazlas?na giri? izni vermez
insert into employee5 Values(3,'Ali','BULUT'); -- ayn? isim 2 veya fazlas?na giri? izni vermez

-- Asagidaki sorgu ornek amacl?d?r

Create Table employee6
(
    employee_id Number,
    firstname varchar2(30),
    lastname varchar2(30),
    Constraint pk_employee6_firlastname Primary Key(firstname,lastname)
);

insert into employee6 Values(1,'Ali','TOPACIK');
insert into employee6 Values(2,'Ali','TOPACIK'); -- ayn? isim 2 veya fazlas?na giri? izni vermez
insert into employee6 Values(3,'Ali','BULUT');

--

Create Table DepartmenstA1
(
    dept_id Number Primary Key,
    dept_name Varchar2(50)
);

insert into DepartmenstA1 values(1,'IT');

Select *
From DepartmenstA1;

Create Table employeeA1
(
    employee_id Number not null,
    firstname varchar2(30),
    lastname varchar2(30),
    dept_id Number
);

insert into employeeA1 Values(100,'Ali','TOPACIK',1);
insert into employeeA1 Values(101,'Ali','BULUT',2);

Select *
From employeeA1;

-- simdi foreign key k?s?tlamas? yapal?m

Create Table employeeA2
(
    employee_id Number not null,
    firstname varchar2(30),
    lastname varchar2(30),
    dept_id Number,
    constraint fk_emp_dept_deptid
        foreign key(dept_id) References DEPARTMENSTA1(dept_id)
);

Select *
From DEPARTMENSTA1;

insert into employeeA2 Values(100,'Ali','TOPACIK',1);
insert into employeeA2 Values(101,'Ali','BULUT',2); -- 2 nolu dept_id DEPARTMENSTA1 tablosunda olmad??? icin eklemez

Select *
From employeeA2;

-- unique constraint

Create Table employeeA3
(
    employee_id Number not null,
    firstname varchar2(30),
    telephone Number unique
);

insert into employeeA3 Values(100,'Ali','5559988876');
insert into employeeA3 Values(101,'Veli','5559988876'); -- unique constraint'ten dolay? girise izin vermez
insert into employeeA3 Values(102,'Anil',5343848767);
insert into employeeA3 Values(104,'Anil',5343848767); -- unique constraint'ten dolay? girise izin vermez

--

Select *
From employeeA3;

-- Check Constraint

Create Table employeeA4
(
    employee_id Number,
    firstname varchar2(30),
    lastname varchar2(30),
    salary Number constraint chk_salaryaA4 Check(Salary Between 10000 and 100000) 
);

insert into employeeA4 Values(100,'Ali','TOPACIK', 50000);

insert into employeeA4 Values(101,'Saadet','BOZKAN', 101000);
insert into employeeA4 Values(102,'Saadet','BOZKAN', 9000);
insert into employeeA4 Values(103,'Saadet','BOZKAN', 30000);

insert into employeeA4 Values(100,'Seyda','Akgul', -15000);
insert into employeeA4 Values(100,'Seyda','Akgul', 15000);

Select *
From employeeA4;

--

Create Table employeeA5
(
    employee_id Number,
    firstname varchar2(30),
    lastname varchar2(30),
    salary Number,
    dept_id Number
);

Alter Table employeeA5
Add constraint chk_dept_id Check(Length(dept_id)>=3);

--

Create Table employeeA6
(
    employee_id Number,
    firstname varchar2(30),
    lastname varchar2(30),
    salary Number,
    dept_id Number
);

Alter Table employeeA6
Add constraint chk_dept_id6 Check(dept_id>=100);

--

-- Default Constraint

Create Table Order1
(
    order_id Number,
    order_date date default(sysdate),    
    country Varchar2(30),
    Amount Number
);

insert into Order1 Values(1,'USA',10000); -- Bu calismaz

insert into Order1(order_id, country, Amount) Values(1,'USA',10000);

Select *
From Order1;

Select sysdate From Dual;

Select 'SQL Egitimine Hos Geldiniz' From Dual;

Select 4 + 5 + 20 From Dual;

--

-- SQLDATA olarak olusturulan User secelim

-- sys'ye baglanal?m ve asag?daki komutlar? calistiral?m

Create User OracleData identified by OracleData;

Grant connect, resource to OracleData;

Grant All Privileges to OracleData;

-- OracleData'ya baglanal?m

-- Gerekli olan dosyalar? buraya yukleyelim
-- C:\SQLDATATABLES klasoru alt?nda dosyalar var

/*

DROP TABLE CITYJOIN;
DROP TABLE CUSTOMERSJOIN;

DROP TABLE SALES_ORDERDETAILS;
DROP TABLE SALES_ORDERS;
DROP TABLE SALES_SHIPPERS;
DROP TABLE PRODUCTION_PRODUCTS;
DROP TABLE PRODUCTION_CATEGORIES;
DROP TABLE PRODUCTION_SUPPLIERS;
DROP TABLE HR_EMPLOYEES;
DROP TABLE SALES_CUSTOMERS;

*/

/*

@"C:\SQLDATATABLES\1- CityJoin.sql";
@"C:\SQLDATATABLES\2- CustomerJoin.sql";
@"C:\SQLDATATABLES\3- Customers.sql";
@"C:\SQLDATATABLES\4- HR_Employees.sql";
@"C:\SQLDATATABLES\5- Production_Supliers.sql";
@"C:\SQLDATATABLES\6- Production_Category.sql";
@"C:\SQLDATATABLES\7- Production_Products.sql";
@"C:\SQLDATATABLES\8- Sales_Shippers.sql";
@"C:\SQLDATATABLES\9- Sales_Orders.sql";
@"C:\SQLDATATABLES\10- Sales_OrderDetails.sql";

*/


Select * From CITYJOIN;
Select * From CUSTOMERSJOIN;

Select * From SALES_CUSTOMERS;
Select * From HR_EMPLOYEES;
Select * From SALES_ORDERS;
Select * From SALES_ORDERDETAILS;
Select * From PRODUCTION_PRODUCTS;
Select * From PRODUCTION_CATEGORIES;
Select * From PRODUCTION_SUPPLIERS;
Select * From SALES_SHIPPERS;

-- Yukar?daki tablolar? join edelim
Select
        --c.custid,
        c.companyname,
        --e.empid,
        e.firstname,
        e.lastname,
        --o.orderid,
        o.orderdate,
        o.freight,
        --o.shipperid,
        --od.productid,
        od.unitprice,
        od.qty,
        pp.productname,
        --pp.supplierid,
        --pp.categoryid,
        pc.categoryname,
        ps.companyname,
        ss.companyname
From SALES_ORDERS           o
join SALES_CUSTOMERS        c   on c.custid     = o.custid
join HR_EMPLOYEES           e   on e.empid      = o.empid
join SALES_ORDERDETAILS     od  on od.orderid   = o.orderid
join PRODUCTION_PRODUCTS    pp  on pp.productid = od.productid
join PRODUCTION_CATEGORIES  pc  on pc.categoryid= pp.categoryid
join PRODUCTION_SUPPLIERS   ps  on ps.supplierid= pp.supplierid
join SALES_SHIPPERS         ss  on ss.shipperid = o.shipperid;

-- Yukar?daki sorguda companyname'lere Alias verelim

Select
        --c.custid,
        c.companyname as cust_companyname,
        --e.empid,
        e.firstname,
        e.lastname,
        --o.orderid,
        o.orderdate,
        o.freight,
        --o.shipperid,
        --od.productid,
        od.unitprice,
        od.qty,
        pp.productname,
        --pp.supplierid,
        --pp.categoryid,
        pc.categoryname,
        ps.companyname as supp_companyname,
        ss.companyname as ship_companyname
From SALES_ORDERS           o
join SALES_CUSTOMERS        c   on c.custid     = o.custid
join HR_EMPLOYEES           e   on e.empid      = o.empid
join SALES_ORDERDETAILS     od  on od.orderid   = o.orderid
join PRODUCTION_PRODUCTS    pp  on pp.productid = od.productid
join PRODUCTION_CATEGORIES  pc  on pc.categoryid= pp.categoryid
join PRODUCTION_SUPPLIERS   ps  on ps.supplierid= pp.supplierid
join SALES_SHIPPERS         ss  on ss.shipperid = o.shipperid;


Select
        c.companyname as cust_companyname,
        e.firstname,
        e.lastname,
        o.orderdate,
        o.freight,
        od.unitprice,
        od.qty,
        pp.productname,
        pc.categoryname,
        ps.companyname as supp_companyname,
        ss.companyname as ship_companyname
From SALES_ORDERS           o
join SALES_CUSTOMERS        c   on c.custid     = o.custid
join HR_EMPLOYEES           e   on e.empid      = o.empid
join SALES_ORDERDETAILS     od  on od.orderid   = o.orderid
join PRODUCTION_PRODUCTS    pp  on pp.productid = od.productid
join PRODUCTION_CATEGORIES  pc  on pc.categoryid= pp.categoryid
join PRODUCTION_SUPPLIERS   ps  on ps.supplierid= pp.supplierid
join SALES_SHIPPERS         ss  on ss.shipperid = o.shipperid;

--30092023

Select * From hr.employees;

Create Table employees as
Select * From hr.employees;

Select *
From employees;

Select *
From employees
Where job_id = 'AD_VP';


Select
        c.companyname as cust_CompanyName,
        e.firstname,
        e.lastname,
        o.orderdate,
        o.freight,
        od.qty,
        od.unitprice,
        pp.productname,
        pc.categoryname,
        ps.companyname as supp_CompanyName,
        ss.companyname as ship_CompanyName
        
From SALES_ORDERS               o
join   SALES_CUSTOMERS           c    on o.custid       = c.custid
join   HR_EMPLOYEES                 e    on e.empid       = o.empid
join  SALES_ORDERDETAILS        od   on od.orderid    = o.orderid
join  PRODUCTION_PRODUCTS     pp   on pp.productid = od.productid
join  PRODUCTION_CATEGORIES  pc    on pc.categoryid = pp.categoryid
join  PRODUCTION_SUPPLIERS     ps    on ps.supplierid = pp.supplierid
join  SALES_SHIPPERS                 ss    on ss.shipperid   = o.shipperid;
/

-- sorguyu view haline getirelim
-- Drop View vw_Rapor;


Create View vw_Rapor as
Select
        c.companyname as cust_companyname,
        e.firstname,
        e.lastname,
        o.orderdate,
        o.freight,
        od.unitprice,
        od.qty,
        pp.productname,
        pc.categoryname,
        ps.companyname as supp_companyname,
        ss.companyname as ship_companyname
From SALES_ORDERS           o
join SALES_CUSTOMERS        c   on c.custid     = o.custid
join HR_EMPLOYEES           e   on e.empid      = o.empid
join SALES_ORDERDETAILS     od  on od.orderid   = o.orderid
join PRODUCTION_PRODUCTS    pp  on pp.productid = od.productid
join PRODUCTION_CATEGORIES  pc  on pc.categoryid= pp.categoryid
join PRODUCTION_SUPPLIERS   ps  on ps.supplierid= pp.supplierid
join SALES_SHIPPERS         ss  on ss.shipperid = o.shipperid;

--

Select *
From vw_Rapor;

--

-- view haline gelen sorgudan ve beslendigi sorgudan sorgular?m?z? ayr? ayr? yazal?m ve inceleyelim

-- vw_Rapor view'den firstame'ler icin toplamfreight'lar� bulunuz

Select
        firstname,
        sum(Freight) as Totalfreight
From vw_Rapor
Group By firstname;

-- her bir categoryname icin toplam freightlar? bulan sorguyu yaz?n?z

Select
        categoryname,
        sum(Freight) as Totalfreight
From vw_Rapor
Group By categoryname;


-- her bir categoryname icin productname'e gore toplam freightlar? bulan sorguyu yaz?n?z

Select
        categoryname,
        productname,
        sum(Freight) as Totalfreight
From vw_Rapor
Group By categoryname, productname
Order By categoryname,productname;

Select
        categoryname,
        productname,
        sum(Freight) as Totalfreight
From vw_Rapor
Group By categoryname, productname
Order By 1,2;

Select
        categoryname,
        productname,
        sum(Freight) as Totalfreight
From vw_Rapor
Group By categoryname, productname
Order By 1 desc,2;

Select
        categoryname,
        productname,
        sum(Freight) as Totalfreight
From vw_Rapor
Group By categoryname, productname
Order By 1 desc,2 desc;

Select
        categoryname,
        productname,
        sum(Freight) as Totalfreight
From vw_Rapor
Group By categoryname, productname
Order By 3 desc;

/

Select
        pc.categoryname,
        Sum(o.freight) as TotalFreight
From SALES_ORDERS           o
join SALES_CUSTOMERS        c  on c.custid       = o.custid
join HR_EMPLOYEES           e  on e.empid        = o.empid
join SALES_ORDERDETAILS     od on od.orderid     = o.orderid
join PRODUCTION_PRODUCTS    pp on pp.productid   = od.productid
join PRODUCTION_CATEGORIES  pc on pc.categoryid  = pp.categoryid
join PRODUCTION_SUPPLIERS   ps on ps.supplierid  = pp.supplierid
join SALES_SHIPPERS         ss on ss.shipperid   = o.shipperid
Group By pc.categoryname;

--

Select
        categoryname,
        Sum(freight) as TotalFreight
From vw_Rapor
Group By categoryname;

-- yillara gore toplamfreightlar? bulunuz

Select
        orderdate,
        firstname,
        lastname,
        to_char(orderdate, 'YYYY') as Yillar,
        freight 
From vw_Rapor;

Select
        to_char(orderdate, 'YYYY') as Yillar,
        Sum(freight) as TotalFreight 
From vw_Rapor
Group By to_char(orderdate, 'YYYY')
Order By Yillar;

-- Yukar�daki sorguyu derived table ile yapal�m

Select
        Yillar,
        Sum(freight) as TotalFreight
From (
            Select
                    to_char(orderdate, 'YYYY') as Yillar,
                    freight 
            From vw_Rapor            
        ) A
Group By Yillar;

-- CTEs ile yapal�m

With A as
(
      Select
              to_char(orderdate, 'YYYY') as Yillar,
              freight 
      From vw_Rapor            
)
Select
        Yillar,
        Sum(freight) as TotalFreight
From A
Group By Yillar
Order By Yillar;

/*

YILLAR	TOTALFREIGHT
2006	      32071,53
2007	    106792,07
2008	      68442,5

*/
--

Select
        to_char(orderdate, 'YYYY') as Yillar,
        Sum(freight) as TotalFreight 
From vw_Rapor
Where SHIP_COMPANYNAME = 'Shipper ETYNR'
Group By to_char(orderdate, 'YYYY')
Order By Yillar;


/*

YILLAR	TOTALFREIGHT
2006	    12385,99
2007	    42285,13
2008	    36898,69

*/

-- Yukar�daki sorguda TotalFreight > 20000 olan kay�tlar� bulunuz

Select
        to_char(orderdate, 'YYYY') as Yillar,
        Sum(freight) as TotalFreight 
From vw_Rapor
Where SHIP_COMPANYNAME = 'Shipper ETYNR'
Group By to_char(orderdate, 'YYYY')
Having Sum(freight) > 20000
Order By Yillar;

-- employees tablosunda ayn� maas� alanlar�n say�s�n� bulunuz

Select *
From employees;

Select
          Salary, 
          Count(*) as Sayisi
From employees
Group By Salary;

-- Yukar�daki sorguda Sayisi  >= 3 olanlar� bulunuz

Select
          Salary, 
          Count(*) as Sayisi
From employees
Group By Salary
Having Count(*) >= 3;

--Distinct komutu

Select *
From Sales_Customers;


Select
        Country
From Sales_Customers
Order By 1;

Select Distinct Country
From Sales_Customers
Order By 1;


Select *
From Sales_Customers
Where Country = 'USA';

Select region
From Sales_Customers
Where Country = 'USA';

Select Distinct region
From Sales_Customers
Where Country = 'USA';


Select Distinct
        Country
From Sales_Customers
Order By 1;

Select Count(Country) as Sayisi
From Sales_Customers;


Select Count(Distinct Country) as Sayisi
From Sales_Customers;



Select
        orderid,
        TO_CHAR(orderdate,'YYYY') as orderyear,
        orderyear + 1 as nextyear        
From Sales_Orders;

-- Yukar�daki kod calismaz
-- dogrusu beslendigi yeri yazmam�z gerekir

Select
        orderid,
        TO_CHAR(orderdate,'YYYY') as orderyear,
        TO_CHAR(orderdate,'YYYY') + 1 as nextyear        
From Sales_Orders;

-- derived table ile yapal�m

Select
          orderid,
          orderyear,
          orderyear + 1 as nextyear
From (
          Select
                  orderid,
                  TO_CHAR(orderdate,'YYYY') as orderyear
          From Sales_Orders
        ) A;


-- Yukar?daki sorguyu CTEs ile yazal?m

/*
With TabloAdi as
(
    ... Calisan kod
)
Select *
From TabloAdi;
*/

With A as
(
         Select
                  orderid,
                  TO_CHAR(orderdate,'YYYY') as orderyear
          From Sales_Orders
)
Select
          orderid,
          orderyear,
          orderyear + 1 as nextyear
From A;

--

/*
With 
TabloAdiA as
(
    ... Calisan kod
),
TabloAdiB as
(
    ... Calisan kod
),
TabloAdiC as
(
    ... Calisan kod
)
...
...
...
Select *
From TabloAdi;
*/


With
personeller as
(
    Select empid, firstname || ' ' || lastname as FullName
    From HR_EMPLOYEES
),
siparisler as
(
    Select orderid, custid, empid, orderdate, freight
    From Sales_Orders
)
Select *
From personeller p
join siparisler s on p.empid = s.empid;

--

With Rapor as
(
  Select
          c.companyname as cust_companyname,
          e.firstname,
          e.lastname,
          o.orderdate,
          o.freight,
          od.unitprice,
          od.qty,
          pp.productname,
          pc.categoryname,
          ps.companyname as supp_companyname,
          ss.companyname as ship_companyname
  From SALES_ORDERS           o
  join SALES_CUSTOMERS        c   on c.custid     = o.custid
  join HR_EMPLOYEES           e   on e.empid      = o.empid
  join SALES_ORDERDETAILS     od  on od.orderid   = o.orderid
  join PRODUCTION_PRODUCTS    pp  on pp.productid = od.productid
  join PRODUCTION_CATEGORIES  pc  on pc.categoryid= pp.categoryid
  join PRODUCTION_SUPPLIERS   ps  on ps.supplierid= pp.supplierid
  join SALES_SHIPPERS         ss  on ss.shipperid = o.shipperid
)
Select *
From Rapor
Where....
Order ....;

--

With
TumSiparisler as
(
    Select orderid, custid, empid, orderdate, freight, shipcity, shipcountry
    From Sales_Orders
),
UsaSiparisleri as 
(
    Select *
    From TumSiparisler
    Where shipcountry = 'USA'
),
CityToplamlari as
(
    Select shipcity, sum(freight) as ToplamFreight
    From UsaSiparisleri
    Group By shipcity
)
Select *
From CityToplamlari
Order By ToplamFreight desc;

With
TumSiparisler as
(
    Select orderid, custid, empid, orderdate, freight, shipcity, shipcountry
    From Sales_Orders
),
UsaSiparisleri as 
(
    Select *
    From TumSiparisler
    Where shipcountry = 'USA'
),
CityToplamlari as
(
    Select shipcity, sum(freight) as ToplamFreight
    From UsaSiparisleri
    Group By shipcity
)
Select *
From TumSiparisler
Order By 1 desc;

With
TumSiparisler as
(
    Select orderid, custid, empid, orderdate, freight, shipcity, shipcountry
    From Sales_Orders
),
UsaSiparisleri as 
(
    Select *
    From TumSiparisler
    Where shipcountry = 'USA'
),
CityToplamlari as
(
    Select shipcity, sum(freight) as ToplamFreight
    From UsaSiparisleri
    Group By shipcity
)
Select *
From UsaSiparisleri
Order By 1 desc;



--

Select
        e.lastname,
        Count(o.orderid) as SiparisSayisi

From    
        (       Sales_Orders o
          join  HR_Employees e  on e.empid = o.empid
        )
Group By e.lastname
Having Count(o.orderid) > 50
Order By SiparisSayisi desc;



-- Case

/*

Case kontroledilecekbilgi
    When .... then .....
    When .... then .....
    When .... then .....
    ...
    ...
    Else .....
    
End as SutunAdi
*/

Select
        orderid,
        orderdate,        
        To_Char(orderdate, 'YYYY') as Yillar,
        To_Char(orderdate, 'MM') as Aylar,
        Case To_Char(orderdate, 'MM')
                When '01' Then 'Ocak'
                When '02' Then 'Subat'
                When '03' Then 'Mart'
                When '04' Then 'Nisan'
                When '05' Then 'Mayis'
                When '06' Then 'Haziran'
                When '07' Then 'Temmuz'
                When '08' Then 'Agustos'
                When '09' Then 'Eylul'
                When '10' Then 'Ekim'
                When '11' Then 'Kasim'
                When '12' Then 'Aralik'        
        End as AylarStr,
        freight        
From Sales_Orders;

--

Select
        orderid,
        orderdate,        
        To_Char(orderdate, 'YYYY') as Yillar,
        To_Char(orderdate, 'MM') as Aylar,
        Case 
                When To_Char(orderdate, 'MM') = '01' Then 'Ocak'
                When To_Char(orderdate, 'MM') = '02' Then 'Subat'
                When To_Char(orderdate, 'MM') = '03' Then 'Mart'
                When To_Char(orderdate, 'MM') = '04' Then 'Nisan'
                When To_Char(orderdate, 'MM') = '05' Then 'Mayis'
                When To_Char(orderdate, 'MM') = '06' Then 'Haziran'
                When To_Char(orderdate, 'MM') = '07' Then 'Temmuz'
                When To_Char(orderdate, 'MM') = '08' Then 'Agustos'
                When To_Char(orderdate, 'MM') = '09' Then 'Eylul'
                When To_Char(orderdate, 'MM') = '10' Then 'Ekim'
                When To_Char(orderdate, 'MM') = '11' Then 'Kasim'
                When To_Char(orderdate, 'MM') = '12' Then 'Aralik'        
        End as AylarStr,
        freight        
From Sales_Orders;

 
        
--

Select
        orderid,
        orderdate,        
        To_Char(orderdate, 'YYYY') as Yillar,
        To_Char(orderdate, 'MM') as Aylar,
        Case 
                When To_Char(orderdate, 'MM') = '01' Then 'Ocak'
                When To_Char(orderdate, 'MM') = '02' Then 'Subat'
                When To_Char(orderdate, 'MM') = '03' Then 'Mart'
                When To_Char(orderdate, 'MM') = '04' Then 'Nisan'
                When To_Char(orderdate, 'MM') = '05' Then 'Mayis'
                When To_Char(orderdate, 'MM') = '06' Then 'Haziran'
                When To_Char(orderdate, 'MM') = '07' Then 'Temmuz'
                When To_Char(orderdate, 'MM') = '08' Then 'Agustos'
                When To_Char(orderdate, 'MM') = '09' Then 'Eylul'
                When To_Char(orderdate, 'MM') = '10' Then 'Ekim'
                When To_Char(orderdate, 'MM') = '11' Then 'Kasim'
                When To_Char(orderdate, 'MM') = '12' Then 'Aralik'        
        End as AylarStr,
         Case 
                When freight Between 0 and 100 Then '0-100 Arasi'
                When freight Between 100 and 200 Then '100-200 Arasi'
                When freight Between 200 and 500 Then '200-500 Arasi'
                
            Else
                '500 den buyuk'
        End as FreightGrubu,
        freight        
From Sales_Orders;

--

-- Custid = 20 olan musterinin empid baz?nda y?llara gore toplam siparis say?s?n? bulunuz

Select
        orderid,
        custid,
        empid,
        To_Char(orderdate,'YYYY') as Yillar,
        freight
From Sales_Orders
Where custid = 20;

Select
        empid,
        Count(*) as SiparisSayisi
From Sales_Orders
Where custid = 20
Group By empid
Order By 1,2;

Select
        empid,
        To_Char(orderdate,'YYYY') as Yillar,
        Count(*) as SiparisSayisi
From Sales_Orders
Where custid = 20
Group By empid, To_Char(orderdate,'YYYY')
Order By 1,2;

-- hr_employees tablosundan firstname ve lastname sutunlar�n� birlest�rerek
-- FullName elde ediniz

Select firstname ||  lastname as FullName
From hr_employees;

Select firstname || ' ' || lastname as FullName
From hr_employees;

-- Her bir personelin FullName'ine gore
-- ToplamFreight'lar�n� bulunuz
-- Tablolar Sales_Orders, hr_employees

Select
         firstname || ' ' || lastname as FullName,
         Sum(Freight) as TotalFreight
From Sales_Orders o
join hr_employees  e on e.empid = o.empid
Group By firstname || ' ' || lastname
Order By FullName;

Select
         firstname || ' ' || lastname as FullName,
         Sum(Freight) as TotalFreight
From Sales_Orders o
join hr_employees  e on e.empid = o.empid
Group By firstname, lastname
Order By FullName;

Select
        firstname || ' ' || lastname as FullName,
        To_Char(orderdate,'YYYY') as Yillar,
        Count(*) as SiparisSayisi
From Sales_Orders o
join HR_Employees e on e.empid = o.empid
Where custid = 20
Group By firstname || ' ' || lastname, To_Char(orderdate,'YYYY')
Order By 1,2;

--

Select
        firstname || ' ' || lastname as FullName,
        To_Char(orderdate,'YYYY') as Yillar,
        Count(*) as SiparisSayisi
From Sales_Orders o
join HR_Employees e on e.empid = o.empid
Where custid = 20
Group By firstname, lastname, To_Char(orderdate,'YYYY')
Order By 1,2;

--

Select *
From HR.Employees;

Create Table Ora_Employees as
Select *
From HR.Employees;

--

Select *
From Ora_Employees;

-- Ora_Employees tablosunda ayn? maas? alanlar?n say?s?n? bulunuz

Select
        Salary,
        Count(*) as Sayisi
From Ora_Employees
Group By Salary
Order By 2 desc;

Select
        companyname,
        region,
        city,
        country
From Sales_Customers
Order By Region desc;

Select
        companyname,
        region,
        city,
        country,
        Case
            When region is not null Then 1 Else 0
        End as Sonuc
From Sales_Customers;
         
Select
        companyname,
        region,
        city,
        country
From Sales_Customers
Order By (
            Case When region is not null Then 1 Else 0 End
              ), city;
         
Select
        companyname,
        region,
        city,
        country
From Sales_Customers
Order By (
            Case When region is not null Then 1 Else 0 End
         ) desc;
         
--

With A as
(
  Select
          companyname,
          region,
          city,
          country,
          Case
              When region is not null Then 1 Else 0
          End as Sonuc
  From Sales_Customers
)
Select *
From A
Order By Sonuc desc, region;


Select
        companyname,
        region,
        city,
        country,
        Case When region is not null Then 1 End as RegionDurumu
From Sales_Customers
Order By Case When region is not null Then 1 End ,region;

Select
        companyname,
        region,
        city,
        country,
        Case When region is not null Then 1 End as RegionDurumu
From Sales_Customers
Order By Case When region is not null Then 1 End ,4,3;

-- En son verilen ilk 5 siparisi bulunuz
-- S?ralamay? orderdate alan?na gore yap?n?z

Select *
From Sales_Orders;

Select *
From Sales_Orders
Order By orderdate desc;

With
A as
(
    Select *
    From Sales_Orders
    Order By orderdate desc
)
Select *
From A
Where rownum <= 5;

With a as
(
    Select  orderid, custid, empid, freight, orderdate
    From Sales_Orders
    Order By orderdate desc, orderid desc
)
Select *
From a
Where rownum <=6;

--

Select  orderid, custid, empid, orderdate,
        NTILE(100) Over ( Order By orderdate) as NtileOrnek
From Sales_Orders;

--

With Top_Ntile as
(
    Select  orderid, custid, empid, orderdate,
            NTILE(100) Over ( Order By orderdate desc) as NtileOrnek
    From Sales_Orders
)
Select *
From Top_Ntile
Where NtileOrnek = 1;

--

With Top_Ntile as
(
    Select  orderid, custid, empid, orderdate,
            NTILE(100) Over ( Order By orderdate desc) as NtileOrnek
    From Sales_Orders
)
Select orderid, custid, empid, orderdate
From Top_Ntile
Where NtileOrnek = 1;
    

With Top_Ntile as
(
    Select  orderid, custid, empid, orderdate,
            NTILE(100) Over ( Order By orderdate desc) as NtileOrnek
    From Sales_Orders
)
Select orderid, custid, empid, orderdate,NtileOrnek
From Top_Ntile
Where NtileOrnek in(1,2);

With Top_Ntile as
(
    Select  orderid, custid, empid, orderdate,
            NTILE(100) Over ( Order By orderdate desc) as NtileOrnek
    From Sales_Orders
)
Select orderid, custid, empid, orderdate,NtileOrnek
From Top_Ntile
Where NtileOrnek <=2;

Select *
From Sales_Orders
Order By orderdate desc;
    
-- 01102023

-- Kosullar ve Operatorler

-- IN

    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where orderid = 10248 or orderid = 10250 or orderid = 10299;
    
    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where orderid IN(10248,10250,10299);    

--
  
    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where orderdate = '06-MAY-08';    

    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where orderdate = '06-05-08';  
    
    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where orderdate = '06-05-2008';       

    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where orderdate = '30-01-2008';       
    
        
-- Between

    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where orderid Between 10300 and 10310;
    
    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where orderid >= 10300 and orderid <=10310;
    
-- Like
        
Select *
From HR_Employees
Where lastname like 'D%';

Select *
From HR_Employees
Where lastname like '%d';

Select *
From HR_Employees
Where lastname like '%e%';

/*

Create Table Ora_Employees as
Select *
From hr.employees;

*/

Select *
From Ora_Employees
Where first_name like 'A%';

Select *
From Ora_Employees
Where first_name like '%a';

Select *
From Ora_Employees
Where first_name like '%a%';


Select *
From Ora_Employees
Where Upper(first_name) like '%A%';

Select *
From Ora_Employees
Where first_name like 'alber%';

Select *
From Ora_Employees
Where first_name = 'Alberto';

Select *
From Ora_Employees
Where Upper(first_name) like 'AL%';
    
With A as
(
  Select first_name, Upper(first_name) as BuyukHarf
  From Ora_Employees
  Order By 1
)
Select *
From A
Where Buyukharf = 'ALBERTO';

With A as
(
  Select first_name, Upper(first_name) as BuyukHarf
  From Ora_Employees
  Order By 1
)
Select *
From A
Where Buyukharf  Like 'ALB%';

With A as
(
  Select first_name, Upper(first_name) as BuyukHarf
  From Ora_Employees
  Order By 1
)
Select *
From A
Where first_name  Like 'ALB%';




-- Ora_Employees tablosunda
-- job_id 'si SA_REP olan,
-- first_name icerisinde e harfi gecen ve
-- Salary > 8000 olan kay?tlar? bulunuz

Select *
From Ora_Employees
Where job_id = 'SA_REP' and Upper(first_name) like '%E%' and salary > 8000;

--

Select *
From Ora_Employees
Where job_id = 'SA_REP' and first_name like '%a%' and salary > 8000;

Select *
From Ora_Employees
Where job_id = 'SA_REP' and Upper(first_name) like '%A%' and salary > 8000;
    



Select *
From Ora_Employees
Where job_id = 'SA_REP' and first_name like '%a%' and salary > 5000;

Select *
From Ora_Employees
Where job_id = 'SA_REP' and Upper(first_name) like '%A%' and salary > 5000;

--    
Select *
From Ora_Employees
Where job_id = 'SA_REP' and Upper(first_name) like '%A%' and salary > 5000
minus
Select *
From Ora_Employees
Where job_id = 'SA_REP' and first_name like '%a%' and salary > 5000;

--

    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where  custid = 1  and empid in(1,3,5) or custid = 85 and empid in(2,4,6);
    
    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where  custid = 1  and empid in(1,3,5)
        or custid = 85 and empid in(2,4,6);    

    Select  orderid, custid, empid, orderdate
    From Sales_Orders
    Where  (custid = 1  and empid in(1,3,5))
        or (custid = 85 and empid in(2,4,6));
    
     Select
            orderid,
            custid,
            empid,
            orderdate,
            freight,
            Case
                When freight <= 100 Then 'birinci grup'
                When freight <= 200 Then 'ikinci grup'                
                Else 'ucuncu grup'                      
            End as FreightCategory
    From Sales_Orders;
    
    
--

    Select
            orderid,
            custid,
            empid,
            orderdate,
            freight,
            Case
                When freight < 100 Then '100 den kucuk'
                When freight Between 100 and 200 Then '100-200 arasinda'
                Else '200 den buyuk'
            end as FreightCategory    
    From Sales_Orders;

-- Decode ifadesi

Select 
        first_name,
        department_id,
        Decode(department_id,
                                         10,'Yazilim',
                                         30,'Uretim',
                                         50,'Pazarlama',
                                         'Diger'        
              ) as Departments
From Ora_Employees
Order By department_id;

Select 
        first_name,
        Decode(department_id,
                                         10,'Yazilim',
                                         30,'Uretim',
                                         50,'Pazarlama',
                                         'Diger'        
              ) as Departments
From Ora_Employees
Order By department_id;

-- Case ile

Select 
        first_name,
        department_id,
        Case department_id
            When 10 Then 'Yazilim'
            When 30 Then 'Uretim'
            When 50 Then 'Pazarlama'
            Else 'Diger'        
        End as Departments
From Ora_Employees
Order By department_id;
    
Select 
        first_name,
        Case department_id
            When 10 Then 'Yazilim'
            When 30 Then 'Uretim'
            When 50 Then 'Pazarlama'
            Else 'Diger'        
        End as Departments
From Ora_Employees
Order By department_id;  
  
Select 
        first_name,
        Case 
            When department_id = 10 Then 'Yazilim'
            When department_id = 30 Then 'Uretim'
            When department_id = 50 Then 'Pazarlama'
            Else 'Diger'        
        End as Departments
From Ora_Employees
Order By department_id;     
    
 --

Select
        orderid,
        orderdate,        
        To_Char(orderdate, 'MM') as Aylar,
        Decode(To_Char(orderdate, 'MM'),
                                        1,'Ocak',
                                        2,'Subat',
                                        3,'Mart',
                                        4,'Nisan',
                                        5,'Mayis',
                                        6,'Haziran',
                                        7,'Temmuz',
                                        8,'Agustos',
                                        9,'Eylul',
                                        10,'Ekim',
                                        11,'Kasim',
                                        12,'Aralik'    
              ) as AyAdlari,
        freight        
From Sales_Orders;


--

Select
        orderid,
        orderdate,
        Decode(To_Char(orderdate, 'MM'),
                                        1,'Ocak',
                                        2,'Subat',
                                        3,'Mart',
                                        4,'Nisan',
                                        5,'Mayis',
                                        6,'Haziran',
                                        7,'Temmuz',
                                        8,'Agustos',
                                        9,'Eylul',
                                        10,'Ekim',
                                        11,'Kasim',
                                        12,'Aralik'    
              ) as AyAdlari,
        freight        
From Sales_Orders;
    
Select *
From User_Constraints;

--

Select *
From User_Constraints
Where Table_Name = 'SALES_ORDERS';

Desc SALES_ORDERS;

Desc HR_EMPLOYEES;   
    
 -- Commit;
-- Rollback;

-- Drop Table oraemployeestest;

Create table oraemployeestest as
Select * From ora_employees;


Select * From oraemployeestest;

Delete From oraemployeestest;

Select * From oraemployeestest;

Commit;
rollback;

/*

Commit;
Rollback;
..
...
...
...
..
...
...
...
DDL
Create, Alter, Drop

..
...
...
...
..
...
...
...
Commit;
Rollback;

*/

Select * From oraemployeestest;

Select * From all_users;

Select * From all_tables;

Select Distinct OWNER
From all_tables;

Select *
From all_tables
Where owner = 'HR';

Select * From all_cons_columns;

Select *
From all_cons_columns
Where owner = 'HR' and Table_Name = 'REGIONS';


Select *
From all_cons_columns
Where Table_Name = 'REGIONS';


Select *
From all_cons_columns
Where owner = 'HR' ;

Select *
From all_constraints;

Select *
From all_constraints
Where owner = 'HR';

Select *
From all_constraints
Where Table_Name = 'REGIONS';


--

Create Table cityjoincopyTEST as
Select *
From oracledataa.cityjoin
Where 1=2;

Select *
From cityjoincopyTEST;


Create Table cityjoincopy as
Select *
From cityjoin;

desc cityjoincopy;

Select * From cityjoincopy;

Alter Table cityjoincopy Add Populate Number(10);

desc cityjoincopy;

Alter Table cityjoincopy
Modify Populate Varchar2(30);

desc cityjoincopy;

--

Alter Table cityjoincopy Add TelNo Number(10);

desc cityjoincopy;

Alter Table cityjoincopy
Rename Column TelNo to MobileNumber;

desc cityjoincopy;   
    
Select *
From cityjoincopy;

-- SavePoint

Create Table OrnekTablo
(
    Ad VarChar2(30),
    Soyad VarChar2(50),
    MobileNo VarChar2(15)
);

Desc OrnekTablo;

Rename OrnekTablo To SampleTablo;

Desc SampleTablo;

Select *
From SampleTablo;

insert into SampleTablo Values('Ali','TOPACIK','05559988876');
Commit;

Select *
From SampleTablo;

insert into SampleTablo Values('Saadet','Bozkan','121212122');
insert into SampleTablo Values('Seyda','Akgul','3365656');
SavePoint A;

insert into SampleTablo Values('Yusuf','Uluocak','6659979');
SavePoint B;

insert into SampleTablo Values('Erkut','Ates','4123569');
SavePoint C;

insert into SampleTablo Values('Firat','Tosun','23995644');
SavePoint D;

Select *
From SampleTablo;

RollBack To C;

Select *
From SampleTablo;

RollBack To B;

Select *
From SampleTablo;

Commit;

Select *
From SampleTablo;

RollBack To A;

Select *
From SampleTablo;

--

Select *
From all_cons_columns cc;

Select *
From all_constraints co;


Select
        cc.owner, cc.CONSTRAINT_NAME, cc.Table_Name, cc.Column_Name,
       co.*
From all_cons_columns cc
join all_constraints  co on co.CONSTRAINT_NAME = cc.CONSTRAINT_NAME
Where cc.Owner = 'HR';

--

Select *
from all_tab_columns;

--

Select *
from all_tab_columns
Where Owner = 'HR';

Select 'Select * From ' || Table_Name || ';' as Sorgu
from all_tab_columns
Where Owner = 'HR';

Select Distinct 'Select * From ' || Table_Name || ';' as Sorgu
from all_tab_columns
Where Owner = 'HR';

Select *
From all_tables
Where owner = 'HR' and TABLESPACE_NAME = 'USERS' ;

Select 'Select * From ' || Table_Name || ';' as Sorgu
From all_tables
Where owner = 'HR' and TABLESPACE_NAME = 'USERS' ;

--
Select 
            e1.EMPLOYEE_ID,
            e1.FIRST_NAME,
            e1.LAST_NAME,
            e1.MANAGER_ID,
            e2.first_name || ' ' || e2.last_name as ManagerFullName
From Ora_Employees e1
join Ora_Employees e2 on e1.manager_id = e2.employee_id
Order By 1;

--

Select EMPLOYEE_ID,	FIRST_NAME,	LAST_NAME,	MANAGER_ID
From Ora_Employees;

--

Select EMPLOYEE_ID,	FIRST_NAME,	LAST_NAME,	MANAGER_ID
From Ora_Employees
Connect By EMPLOYEE_ID = Prior MANAGER_ID;

Create Table ora_employees_Copy as
Select *
From ora_employees;

Select *
From ora_employees_Copy;

Select *
From ora_employees_Copy
Where employee_id <> 100;

Select *
From ora_employees_Copy
Where employee_id != 100;

Select *
From cityjoin;

Select *
From cityjoin
Where cityid = 2;

Select *
From cityjoin
Where cityid <> 2;

Select *
From cityjoin
Where cityid != 2;

Select *
From ora_employees_Copy
Where employee_id <> 100;


Update ora_employees_Copy
Set Salary = Salary * 1.20,
      COMMISSION_PCT = 0.25
Where employee_id <> 100;


Commit;

Select *
From ora_employees_Copy
Where employee_id <> 100;

-- 101 ve 102 nolu calisanlar?n maaslar?n? 400$ dusurelim
-- Tablo : ora_employees_Copy

Select *
From ora_employees_Copy
Where employee_id in(101,102);

--

Update ora_employees_Copy
Set Salary = Salary - 400
Where employee_id in(101,102);

Commit;

Create Table Regions_copy as
Select *
From hr.Regions;

-- sys ile asag?daki yetkileri verelim

Create User PersonelA identified by PersonelA;

Grant connect, resource to PersonelA;

Grant connect, resource, unlimited TableSpace to PersonelA;

Grant Select on HR.Employees to PersonelA;
Grant insert on HR.Employees to PersonelA;
Grant delete on HR.Employees to PersonelA;
Grant Update on HR.Employees to PersonelA;

Grant Select,insert,update,delete on HR.Employees to PersonelA;

Grant Select,insert,update,delete on HR.LOCATIONS to PersonelA;


-- PersonelA adl? kullanc?n?n baskas?na yetki vermesi icin Grant Option ile yetki verelim

Grant Select on HR.Employees to PersonelA With Grant Option;
Grant insert on HR.Employees to PersonelA With Grant Option;
Grant delete on HR.Employees to PersonelA With Grant Option;
Grant Update on HR.Employees to PersonelA With Grant Option;

Grant Select,insert,update,delete on HR.Employees to PersonelA With Grant Option;

-- Yetkileri geri alal?m

Revoke delete on HR.Employees From PersonelA;

Revoke insert, update on HR.Employees From PersonelA;

Revoke Select on HR.Employees From PersonelA;

-- sys ile baglanal�m

Grant Select on HR.Employees to PersonelA;

Revoke Select on HR.Employees From PersonelA;

-- Yukar?da bir user icin yetki verdik
-- Public olarak haz?r bir role var
-- Yetkileri bu role uzerinede verebiliriz
-- Bu durumda veritaban?na baglanma yetkisi olan tum userlar yetkilendirilmis olur

Grant Select on HR.Employees to Public;

Grant Select on OracleData.Regions_Copy to PersonelA;
Revoke Select on OracleData.Regions_Copy From PersonelA;


-- sys Admini olarak connect olal?m

Grant Create Role to OracleData;

-- OracleData user olarak baglanal?m

Create Role R_SEL1;
Create Role R_INS1;

Create Role R_SELUPD1;
Create Role R_INSDEL1;

--Drop Table Regions_Copy;

/*
Create Table Regions_Copy as
Select *
From hrA.Ora_Regions;
*/

Select *
From Regions_Copy;

insert into Regions_Copy Values(5,'Africa');

Select *
From OracleData.Regions_Copy;

Grant Select on OracleData.Regions_Copy to R_SEL1;
Grant insert on OracleData.Regions_Copy to R_INS1;

-- sys ile baglan�p yetkiyi geri alabiliriz
-- Revoke Select on OracleDataA.Regions_Copy From R_SEL1;

/* Buradan itibaren rolleri ad?m ad?m yap?n?z */
--------------------------------------------------

-- BIR ORNEK ILE PEKISTIRELIM

-- Sys olarak baglanal�m

Create User ATT1 identified by ATT1;
Grant connect, resource, unlimited TableSpace to ATT1;

Grant Create Role to ATT1;

Create User ATT2 identified by ATT2;
Grant connect, resource, unlimited TableSpace to ATT2;

Create User ATT3 identified by ATT3;
Grant connect, resource, unlimited TableSpace to ATT3;

-- ATT1, ATT2, ATT3 icin yesil Art�'dan ekleyelim

-- ATT1 ile connect olal�m

Create Table Personel(
  id number,
  Sehir Varchar(2)
);
Alter Table Personel Modify (Sehir Varchar(50));

insert into ATT1.Personel Values(1,'istanbul');

Select * From Personel;

Create Role R_Sel_Upd1;
Create Role R_Ins_Del1;

Grant Select, Update on ATT1.Personel to R_Sel_Upd1;
Grant Select, Insert, Delete on ATT1.Personel to R_Ins_Del1;

Grant R_Sel_Upd1 To ATT2;
Grant R_Ins_Del1 To ATT3;

Select * From User_Tab_Privs_Made;

Select * From Personel;

-- ATT2 ile connect olal�m

Set Role R_Sel_Upd1;
Select * From ATT1.Personel;

-- ATT3 ile connect olal�m

Set Role R_Ins_Del1;
insert into ATT1.Personel Values(2,'Bursa');
Commit;

insert into ATT1.Personel Values(3,'izmir');
Commit;

-- ATT2 ile connect olal�m
Select * From ATT1.Personel;

Update ATT1.Personel
Set SEHIR = 'Adana'
Where id = 3;
Commit;

-- ATT1 ile connect olal�m

-- R_Sel_Upd1 rolunden Update Yetkisini alal�m

Revoke Update on ATT1.Personel From R_Sel_Upd1;
-- R_Sel_Upd rolunun Update yetkisi al�nd�

-- ATT2 ile connect olal�m
Select * From ATT1.Personel;

-- ATT2 kullan�c�nda Yukar�daki islem Update yapmayacakt�r

Update ATT1.Personel
Set SEHIR = 'Adana'
Where id = 3;
Commit;

-- ATT2 kullan�c�nda Yukar�daki islem Update yapmayacakt�r
-- Select yapabilir

-- ATT3 kullan�c�s�n�n R_Ins_Del role yetkisini Revoke edelim

-- ATT1 ile connect olal�m
Revoke R_Ins_Del1 From ATT3;

-- Rolu Drop edelim

-- Drop Role R_Ins_Del1;

-- Select * From User_Tab_Privs_Made;

-- ATT3 ile connect olal�m

insert into ATT1.Personel Values(9,'Bursa');
Commit;

-- Set(Kume) Operatorleri
-- Union
-- Union All
-- Intersect
-- Minus

-- OracleData ile connect olal�m

-- Departments tablosundan 2 tane tablo olustural�m

-- Drop Table Dept1;
-- Drop Table Dept2;

Create Table Departments as
Select *
From HR.Departments;

Create Table Dept1 as
Select *
  From Departments 
  Where Department_id <= 50;

Create Table Dept2 as
Select *
  From Departments
  Where Department_id <= 30 or Department_id in(90,100,110);
  
--------------------------------------------------

Select department_id,department_name,manager_id,location_id From Dept1;

Select department_id,department_name,manager_id,location_id From Dept2;


Select department_id,department_name,manager_id,location_id From Dept1
Union
Select department_id,department_name,manager_id,location_id From Dept2;

Select department_id,department_name,manager_id,location_id From Dept1
Union All
Select department_id,department_name,manager_id,location_id From Dept2;

Select department_id,department_name,manager_id,location_id From Dept1
intersect
Select department_id,department_name,manager_id,location_id From Dept2;


Select department_id,department_name,manager_id,location_id From Dept1
minus
Select department_id,department_name,manager_id,location_id From Dept2;

Select department_id,department_name,manager_id,location_id From Dept2
minus
Select department_id,department_name,manager_id,location_id From Dept1;


Select distinct COUNTRY From HR_Employees;

Select distinct COUNTRY From Sales_Customers;

Select COUNTRY From HR_Employees
Union
Select COUNTRY From Sales_Customers;

Select COUNTRY From HR_Employees
Union All
Select COUNTRY From Sales_Customers;

Select CITY, COUNTRY From HR_Employees

Select CITY, COUNTRY From Sales_Customers;


Select CITY, COUNTRY From HR_Employees
Union
Select CITY, COUNTRY From Sales_Customers;

Select CITY, COUNTRY From HR_Employees
Union All
Select CITY, COUNTRY From Sales_Customers;

Select CITY, COUNTRY From HR_Employees
Minus
Select CITY, COUNTRY From Sales_Customers;

Select CITY, COUNTRY From Sales_Customers
Minus
Select CITY, COUNTRY From HR_Employees;

Select CITY, COUNTRY From HR_Employees
intersect
Select CITY, COUNTRY From Sales_Customers;

Select CITY, REGION, COUNTRY From HR_Employees;

Select CITY, REGION, COUNTRY From Sales_Customers;

Select CITY, REGION, COUNTRY From HR_Employees
Union
Select CITY, REGION, COUNTRY From Sales_Customers;

Select CITY, REGION, COUNTRY From HR_Employees
Union All
Select CITY, REGION, COUNTRY From Sales_Customers;

-- Oncelik Sirasi
-- once Minus calisir sonra intersect calisir

Select CITY, REGION, COUNTRY From PRODUCTION_SUPPLIERS
Minus
Select CITY, REGION, COUNTRY From HR_Employees
intersect
Select CITY, REGION, COUNTRY From Sales_Customers;

(Select CITY, REGION, COUNTRY From PRODUCTION_SUPPLIERS
Minus
Select CITY, REGION, COUNTRY From HR_Employees)
intersect
Select CITY, REGION, COUNTRY From Sales_Customers;

Select CITY, REGION, COUNTRY From PRODUCTION_SUPPLIERS
Minus
(Select CITY, REGION, COUNTRY From HR_Employees
intersect
Select CITY, REGION, COUNTRY From Sales_Customers);

--

-- Soru 1
-- Ocak 2008 'de aktivitesi olup Subat 2008'de aktivitesi olmayan Customer ve Employee
-- ciftini bulunuz
-- Tarih alan� olarak orderdate kullan�n�z

-- Tables : Sales_Orders

Select *
From Sales_Orders;

Select custid, empid
From Sales_Orders
Where orderdate>= '01-01-2008' and orderdate< '01-02-2008';


Select custid, empid
From Sales_Orders
Where orderdate>= '01-02-2008' and orderdate< '01-03-2008';

Select custid, empid
From Sales_Orders
Where orderdate>= '01-01-2008' and orderdate< '01-02-2008'

Minus

Select custid, empid
From Sales_Orders
Where orderdate>= '01-02-2008' and orderdate< '01-03-2008';


--

Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')='2008' and To_Char(orderdate,'MM')='01'
Minus
Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')='2008' and To_Char(orderdate,'MM')='02';

Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2008 and To_Char(orderdate,'MM')= 1
Minus
Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2008 and To_Char(orderdate,'MM')= 2;

--

-- Soru 2
-- Ocak 2008 'de ve Subat 2008'de aktivitesi olan Customer ve Employee
-- ciftini bulunuz

-- Tables : Sales_Orders



Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2008 and To_Char(orderdate,'MM')= 1
intersect
Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2008 and To_Char(orderdate,'MM')= 2;

-- Soru 3
-- Ocak 2008 'de ve Subat 2008'de aktivitesi olan 
-- ancak 2007'de aktivitesi olmayan Customer ve Employee
-- ciftini bulunuz

-- Tables : Sales_Orders

Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2008 and To_Char(orderdate,'MM')= 1
intersect
Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2008 and To_Char(orderdate,'MM')= 2
Minus
Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2007;

--

(Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2008 and To_Char(orderdate,'MM')= 1
intersect
Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2008 and To_Char(orderdate,'MM')= 2)
Minus
Select custid, empid 
From Sales_Orders 
Where To_Char(orderdate,'YYYY')= 2007;

-- Soru 4
-- Asagidaki sorguya sahibiz
-- HR_EMPLOYEES tablosundaki bilgilerin PRODUCTION_SUPPLIERS tablosundan once gelmesini
-- garanti ediniz
-- Tables : HR_EMPLOYEES, PRODUCTION_SUPPLIERS

Select CITY, REGION, COUNTRY From HR_EMPLOYEES;

Select CITY, REGION, COUNTRY From PRODUCTION_SUPPLIERS;

Select CITY, REGION, COUNTRY From HR_EMPLOYEES
Union
Select CITY, REGION, COUNTRY From PRODUCTION_SUPPLIERS;


(Select CITY, REGION, COUNTRY From HR_EMPLOYEES)
Union All
Select CITY, REGION, COUNTRY From PRODUCTION_SUPPLIERS;

-- CTEs ile yapal?m

Select CITY, REGION, COUNTRY,1 as TabloNo From HR_EMPLOYEES
Union All
Select CITY, REGION, COUNTRY,2 as TabloNo From PRODUCTION_SUPPLIERS;

With A as
(
  Select CITY, REGION, COUNTRY,1 as TabloNo From HR_EMPLOYEES
  Union All
  Select CITY, REGION, COUNTRY,2 as TabloNo From PRODUCTION_SUPPLIERS
)
Select CITY, REGION, COUNTRY
From A
Order By TabloNo;

-- Fonksiyonlar

-- Say�sal Fonksiyonlar,
-- Karakter Fonksiyonlar,
-- Tekil Sonuc Fonksiyonlar�,
-- istatistik Fonksiyonlar,
-- Tarih ve Zaman Fonksiyonlar�

-- Say�sal Fonksiyonlar;

-- Sign : Bir ifadenin/de�erin/fonksiyonun i�aretini bulur
-- Abs  : Mutlak deger Fonksiyonu

-- Ceil   : Ald��� Say�sal degeri Yukar� tam say�ya cevirir
-- Floor  : Ald��� Say�sal degeri Asagi tam say�ya cevirir

-- Mod    : Moduler aritmetik, ozellikle bir say�n�n ciftmi tekmi olduguna bakar�z

-- Power  : ussel fonksiyon
-- SQRT   : Say�n�n karekokunu bulur
-- Round  : Yuvarlama fonksiyonu, ald��� say�sal degeri yuvarlar

-- Ornekler

Select Sign(-3), Sign(3) From Dual;

Select Salary, Sign(Salary) From Employees;

Select Abs(-10), Abs(10), Abs(123.45),Abs(-123.45) From Dual;

Select Sign(-3) * 15 + 5 From Dual;

Select
    Sign(-3 * 15 + 5),
    Abs(-3 * 15 + 5),
    Abs(3 * 15 + 5),
    Sign(-3 * 15 + 5 -Abs(-3 * 15 + 5)),
    Sign(-3 * 15 + 5 -Abs(-3 * 15)),
    -3 * 15 + 5, -Abs(-3 * 15)
From Dual;

Select
    -3 * 15, -Abs(-3 * 15),
    Sign(-3 * 15 -Abs(-3 * 15)),
    Sign(-3 * 15 +Abs(-3 * 15))
From Dual;

Select
    3 * 15,
    Sign(3 * 15 +Abs(-3 * 15))
From Dual;

--


-- Ceil, Floor


Select Ceil(123.456), Ceil(-5.6) From Dual;
Select Ceil(123.006), Ceil(-5.6) From Dual;

Select Floor(123.456), Floor(-5.6) From Dual;
Select Floor(123.856), Floor(-5.6) From Dual;


-- Mod, Power, Sqrt
Select Mod(5,2) From Dual;
-- 5 say�s�n�n 2 ye bolumunden kalan� verir

Select Mod(100,9) From Dual;

-- 1 den 11 e kadar olan bir say� elde edelim
Select Level
From Dual connect by Level < 12;

Select Level*-1 From Dual connect by Level < 12;

Select Level From Dual connect by Level < 12;

Select Level*-1 From Dual connect by Level < 12
Union
Select Level From Dual connect by Level < 12;

Select Level*-1 From Dual connect by Level < 12
Union
Select 0 From Dual
Union
Select Level From Dual connect by Level < 12;


------------------------------------------------------


Select
    Level,
    Mod(100, Level) -- 100 say�s�n�n Level'a bolumunden kalan say�y� verir
From Dual connect by Level < 12;

-- Power
Select Power(3,2) From Dual; -- 3 say�s�n�n karesini verir
Select Power(2,3) From Dual; -- 2 say�s�n�n kupunu verir
Select Power(3,4) From Dual; -- 3 say�s�n�n 4. kuvvetini verir

-- SQRT -- karekok verir

Select
      SQRT(25),
      SQRT(625),
      SQRT(100)
From Dual;

Select
      Power(3,4),
      SQRT(Power(3,4))
From Dual;

-- Round

Select
      Round(1234.456789),  -- 0 yaz�lmasada olabilir
      Round(1234.456789,0),
      Round(1234.56789,0),
      Round(1234.456789,1),
      Round(1234.456789,2),
      Round(1234.456789,3),
      Round(1234.456789,4),
      Round(1234.4599,5)
From Dual;

Select
      Round(1234.456789),  -- 0 yaz�lmasada olabilir
      Round(1234.456789,0),
      Round(1234.456789,-1),
      Round(1234.456789,-2),
      Round(1234.456789,-3)
From Dual;

Select
      Round(1236.456789,-1),
      Round(1284.456789,-2),
      Round(1934.456789,-3)
From Dual;

Select
      Round(1234.56789),  -- 0 yaz�lmasada olabilir
      Round(1234.56789,0),
      Round(1234.56789,-1),
      Round(1234.56789,-2),
      Round(1234.56789,-3),
      Round(1234.56789,-4),
      Round(1234.56789,-5)
From Dual;

Select
      Round(5679.56789) Result_A,  -- 0 yaz�lmasada olabilir
      Round(5679.56789,0) Result_0,
      Round(5679.56789,-1) Result_1,
      Round(5679.56789,-2) Result_2,
      Round(5679.56789,-3) Result_3,
      Round(5679.56789,-4) Result_4,
      Round(5679.56789,-5) Result_5
From Dual;

--

Select rownum, rowid,first_name, last_name
From Employees;

Select rownum, rowid,first_name, last_name
From Employees
Order By Salary desc;

/*

Create Table Employees as
Select *
From EmployeesCopy;

*/

-- TOP n kullanimi icin RowNumber kullan?l?r
-- Employees tablosunda en yuksek maas alan 5 kisinin bilgilerini bulunuz
/
Select rownum, rowid,first_name, last_name, Salary
From Employees
Order By Salary desc;
/

With A as
(
    Select rownum, first_name, last_name, Salary
    From Employees
    Order By Salary desc
)
Select first_name, last_name, Salary
From A
Where rownum <= 5;

/

With A as
(
    Select first_name, last_name, Salary
    From Employees
    Order By Salary desc
)
Select first_name, last_name, Salary
From A
Where rownum <= 3;
/
--Derived Table ile yapal?m

Select first_name, last_name, Salary
From (
            Select first_name, last_name, Salary
            From Employees
            Order By Salary desc
     ) A
Where rownum <= 5;

/
Select rownum, rowid,firstname, lastname
From HR_Employees
Order By empid desc;
/


Select *
From (
      Select *
      From Employees
      Order By Salary desc
      ) A
Where RowNum <= 3;

-- TOP n kullan�m�
-- RowNumber
-- Employees tablosunda en dusuk maas alan 3 kisinin bilgilerini bulunuz

Select *
From (
      Select *
      From Employees
      Order By Salary
      ) A
Where
        RowNum <= 3
Order By
        Salary desc;
        
/

DROP TABLE rownum_order_test;

CREATE TABLE rownum_order_test
(
  val  NUMBER
);

INSERT ALL
  INTO rownum_order_test
  INTO rownum_order_test
  INTO rownum_order_test
SELECT level
FROM   dual
CONNECT BY level <= 10;

COMMIT;

Select * From rownum_order_test;

/

-- Employees tablosunda ki
-- Department_id'lere gore maas toplamlari En Yuksek olan
-- ilk 3 Department_id bulunuz

Select
        department_id,
        Sum(Salary) as TotalSalary
From employees
Group By department_id
Order By TotalSalary desc;

With A as
(
    Select
            department_id,
            Sum(Salary) as TotalSalary
    From employees
    Group By department_id
    Order By TotalSalary desc
)
Select *
From A
Where rownum <= 3;

Select
        department_id,
        Sum(Salary) as TotalSalary
From Employees
Group By department_id
Order By TotalSalary desc;

With Rapor as
(
    Select
            department_id,
            Sum(Salary) as TotalSalary
    From Employees
    Group By department_id
    Order By TotalSalary desc
)
Select *
From Rapor
Where rownum <= 3;

/

-- Employees Tablosunda job_id'si 'SA_REP', 'AD_PRES'
-- ve salary >15000'den buyuk olan kay�tlar� bulunuz

Select *
From Employees
Where Job_id in('SA_REP', 'AD_PRES') and Salary > 15000;

-- Employees Tablosunda
-- salary 1900-2100 aras� olan kay�tlar� bulunuz

SELECT last_name, first_name, salary
FROM employees
WHERE salary BETWEEN 1900 AND 2100;

-- ANY and ALL
-- Burada Any ve All icin parantez i�erisinde bir altsorgudan gelen bilgileri kullanabiliriz

Select *
From Employees;

Create Table EmployeesB as
Select *
From Employees
Where department_id in(10,40,70,110);

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id > ANY (10);

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id > ANY (10,40);

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id > ANY (10,40,70); -- Herhangi birinden buyuk olanlar gelir



Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id < ANY (110);

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id < ANY (110,70);

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id < ANY (110,70,40); -- Herhangi birinden kucuk olanlar gelir

-- ALL

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id > ALL (10);

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id > ALL (10,40);

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id > ALL (10,40,70); -- Hepsinden buyuk olanlar gelir

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id < ALL (110);

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id < ALL (110,70);

Select employee_id, first_name, last_name, department_id
From EmployeesB
Where department_id < ALL (110,70,40); -- Hepsinden kucuk olanlar gelir

--

Commit;

-- Delete Komutu
-- Verileri silme amac�yla kullan�r�z

Create Table Employees_Copy as
Select *
From employees;


Select *
From Employees_Copy;

Delete
From Employees_Copy;
commit;

Select *
From Employees_Copy;

insert into Employees_Copy
Select *
From Employees;

Select *
From Employees_Copy;

Delete
From Employees_Copy
Where department_id = 100;

commit;

Select *
From Employees_Copy
Where department_id = 100;

Delete
From Employees_Copy
Where department_id > 101;

Commit;

Select *
From Employees_Copy
Where department_id > 101;

Select *
From Employees_Copy;

-- DCL
-- Grant ve Revoke

Create User Ali2 identified by Ali2;
-- yukar�daki komutu Ali1 user'� uzerinde cal�st�rmak istersek
-- calismayacakt�r. Cunku yetki olmas� laz�m
-- user yetkilendirilirken (With Grant Options) ile yetkilendirilirse
-- bu durumda yetki verebilir

-- yetkiler DBA'ler taraf�ndan verilir
-- veya (With Grant Options) ile yetkilendirdikleri kisiler verebilir

Select Table_Name From Tabs;

Select * From Tabs;

Select * From Ali1.Employees;

-- SYS veya SYSTEM yetkisi ile asag�daki komutlar� calistiral�m

--system privileges --DBA olan kisinin verdigi yetkiler

Create User Ali2 identified by Ali2;
Create User Ali3 identified by Ali3;
Create User Ali4 identified by Ali4;

Grant connect, resource to Ali2;
Grant connect, resource to Ali3;
Grant connect, resource to Ali4;

-- Ali2 ile connect olal�m ve Ali1'deki employees tablosundan veri cekelim

Select * From Ali1.Employees;

/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*/

-- Ali2 user'�n�n Select yetkisi olmad�g� icin Select yapamad�

-- Ya sys ile veya Ali1 ile Select yetkisi verelim

--object privileges --Kullan�c� bazl� yap�lan nesne yetkileri
Grant Select on Employees to Ali2;
--Grant succeeded dedi
-- simdi Ali2 ile select edelim

Select * From Ali1.Employees;
-- Sorgu cal�s�r

Grant Select on REGIONS to Ali2;
Select * From Ali1.REGIONS;

-- Ali2 kullan�c�s�na gecelim
insert into Ali1.REGIONS VALUES(6,'Antartika');
-- Yetki-privileges hatas� gelecek

-- Ali1 kullan�c�s�na gecelim
Grant Insert on REGIONS to Ali2;

-- Ali2 kullan�c�s�na gecelim
insert into Ali1.REGIONS VALUES(6,'Antartika');
-- Yetki-privileges gelmeyecek ve basarili bir sekilde insert edilecek

Commit;

Select * From Ali1.REGIONS;

-- Ali1 kullan�c�s�na gecelim
Grant Update, Delete on REGIONS to Ali2;


-- Ali2 kullan�c�s�na gecelim
Update Ali1.REGIONS
Set Region_Name = 'Antartica'
Where Region_id = 6;

Commit;

Select * From Ali1.REGIONS;

Delete Ali1.REGIONS
Where Region_id = 6;

Delete From Ali1.REGIONS
Where Region_id = 6;

Commit;

-- Ali1 kullan�c�s�na gecelim ve Ali2 kullan�c�s�na baskas�na yetki vermesi icinde yetki verelim
-- parametremiz With Grant Option

Grant insert, Update, Delete on Ali1.REGIONS to Ali2 With Grant Option; 
-- Bu sekilde olunca Ali2 kullan�c�s� baskas�na Update ve Delete yetkisi verebilir

-- Ali2 kullan�c�s�na gecelim
Grant insert, Update, Delete on Ali1.REGIONS to Ali3;

insert into Ali1.REGIONS VALUES(6,'Antartika');

Select * From Ali1.REGIONS;

Update Ali1.REGIONS
Set Region_Name = 'Antartica'
Where Region_id = 6;



Commit;

Select * From Ali1.REGIONS;

Delete Ali1.REGIONS
Where Region_id = 6;

-- Ali1 kullan�c�s�na gecelim
Grant Select, insert, Update, Delete on Ali1.REGIONS to Ali2 With Grant Option;
--Grant Select, insert, Update, Delete on Ali1.REGIONS to Ali3 With Grant Option;
-- Ali2 kullan�c�s�na gecelim
Grant Select, insert, Update, Delete on Ali1.REGIONS to Ali3;


-- Ali2 kullan�c�s�na gecelim
Create Table Regions_Copy as
Select * From Ali1.Regions;

Grant Select, insert, Update, Delete on Ali2.Regions_Copy to Ali3 With Grant Option;

-- Ali3 kullan�c�s�na gecelim
Select * From Ali1.REGIONS;

Select * From Ali2.Regions_Copy;

-- Revoke  -- Yetkileri Geri al�r

-- Ali1 Kullan�c�s� kimlere ne yetki vermis listelemek icin sunu yapar�z

Select * From User_Tab_Privs_Made;

-- Ali2 Kullan�c�s� kimlere ne yetki vermis listelemek icin sunu yapar�z
Select * From User_Tab_Privs_Made;

-- Ali1 Kullan�c�s�na gecelim

Revoke Delete on Regions from Ali2;
Revoke Update on Regions from Ali2;
Revoke insert on Regions from Ali2;

Select * From User_Tab_Privs_Made;

Grant Select, insert, Update, Delete on Ali1.Regions to Ali3 With Grant Option;
Select * From User_Tab_Privs_Made;

Revoke insert, Update, Delete on Ali1.Regions from Ali3;
Select * From User_Tab_Privs_Made;

-- Yukar�da bir user icin yetki vermistik
-- Public olarak haz�r bir role var
-- Yetkileri bu role uzerine verebiliriz
-- Bu durumda veritaban�na baglanma yetkisi olan tum userlar yetkilendirilmis olur
Grant Select on Ali1.REGIONS to Public;


-- System Adminine baglanal�m

-- Ali5 kullan�c�s� olustural�m ve Ali5 kullan�c�s�na connect olal�m
Create User Ali5 identified by Ali5;
Grant connect, resource, unlimited TableSpace to Ali5;

-- Ali5 kullan�c�s�na gecelim

Select * From Ali1.Regions; -- Public yetkisi verildigi icin Select yapabiliriz

-- Ancak Public vermek dogru bir hareket degildir
-- Kullan�c�lara tek tek yetki vermekte dogru degildir
-- Yetkiler roller uzerinden verilmeli ve al�nmal�d�r
--Ornek Roller
-- Select yapabilen Roller
-- Insert yapabilen Roller
-- Update yapabilen Roller
-- Select ve Update yapabilen Roller
-- Insert ve Delete yapabilen Roller
-- Select, insert ve Update yapabilen Roller gibi...

Grant connect, resource, unlimited TableSpace to Ali1;
--Grant Select, Insert, Update, Delete to Ali1;
-- ROLES

Create User Ali6 identified by Ali6;
Grant connect, resource, unlimited TableSpace to Ali6;

Create User AliT1 identified by AliT1;
Grant connect, resource, unlimited TableSpace to AliT1;

Create User AliT2 identified by AliT2;
Grant connect, resource, unlimited TableSpace to AliT2;


-- System Admini olarak connect olal�m
Grant Create Role to Ali1;

-- Ali1 user�na baglanal�m

Create Table Regions_Copy as
Select * From Ali1.Regions;

Select * From Ali1.Regions_Copy;

Create Role R_SEL;
Create Role R_INS;

Create Role R_SELUPD;
Create Role R_INSDEL;
--role R_SELUPD created
--role R_INSDEL created

Grant Select On ALI1.REGIONS_COPY to R_SEL;
Grant Insert On ALI1.REGIONS_COPY to R_INS;

Grant Select, Update On ALI1.REGIONS_COPY to R_SELUPD;
Grant Insert, Delete On ALI1.REGIONS_COPY to R_INSDEL;

-- Simdi bu rolleri atayal�m

-- Grant R_SEL to AliT1;
Grant R_SELUPD to AliT1;
Grant R_INSDEL to AliT2;


-- AliT1 ile baglanal�m

Select * From ALI1.REGIONS_COPY;
-- Privileges meydana gelecektir,
-- Bununda Set Role edilmesi gerekiyor


-- Oncelikle AliT1 user'�n�n bu rolleri kullanabilmesi icin Set Role yapmas� gerekir
Set Role R_SELUPD;
Select * From ALI1.REGIONS_COPY;

-- AliT2 ile baglanal�m
-- Oncelikle AliT1 user'�n�n bu rolleri kullanabilmesi icin Set Role yapmas� gerekir
Set Role R_INSDEL;

-- Simdi insert yapal�m
insert into ALI1.REGIONS_COPY Values(7,'A_Antartika');
commit;

-- AliT1 ile baglanal�m
Select * From ALI1.REGIONS_COPY;

-- Update yapal�m
Update Ali1.Regions_Copy
Set Region_Name = 'Antartica'
Where Region_id = 7;
commit;

insert into ALI1.REGIONS_COPY Values(8,'A_Antartika');
commit;

Select * From ALI1.REGIONS_COPY;

-- 7 numaral� kayd� silelim
Delete From ALI1.REGIONS_COPY
Where Region_id = 7;

-- Privileges meydana gelecektir,

-- AliT2 ile baglanal�m
Delete From ALI1.REGIONS_COPY
Where Region_id = 8;
commit;

--Ali1 ile baglanal�m
Grant R_InsDel to AliT1;
Commit;

-- AliT1 ile baglanal�m
Select * From ALI1.REGIONS_COPY;

Select Level From Dual Connect By Level < 6;

Select Level-1 From Dual Connect By Level < 6;

Select 
      Level-1,
      Round(1234.56789,Level-1)
From Dual Connect By Level < 6;

Select 
      Level-1,
      Round(56789.56789,Level-1)
From Dual Connect By Level < 9;

Select 
      Level-1,
      'Round(56789.56789,' || To_Char(Level-1) || ')',
      Round(56789.56789,Level-1)      
From Dual Connect By Level < 9;

Select 
      -Level+1,
      'Round(56789.56789,' || To_Char(-Level+1) || ')',
      Round(56789.56789,-Level+1)      
From Dual Connect By Level < 9;

Select 
      -(Level-1),
      'Round(56789.56789,' || To_Char(-(Level-1)) || ')',
      Round(56789.56789,-(Level-1))      
From Dual Connect By Level < 9;


Select 
      -Level+1,
      'Round(56789.56789,' || To_Char(-Level+1) || ')',
      Round(56789.56789,-Level+1)      
From Dual Connect By Level < 9
union all
Select 
      -(Level-1),
      'Round(56789.56789,' || To_Char(-(Level-1)) || ')',
      Round(56789.56789,-(Level-1))      
From Dual Connect By Level < 9
Order By 1 desc;

--

/*
Database Programming with SQL 4-1: Case and Character Manipulation Practice Activities
Objectives
  � Select and apply single-row functions that perform case conversion and/or character
    manipulation
  � Select and apply character case-manipulation functions LOWER, UPPER, and
    INITCAP in a SQL query
  � Select and apply character-manipulation functions CONCAT, SUBSTR, LENGTH,
    INSTR, LPAD, RPAD, TRIM, and REPLACE in a SQL query
  � Write flexible queries using substitution variables

Vocabulary
Identify the vocabulary word for each definition below.

DUAL      Dummy table used to view results from functions and calculations
FORMAT    The arrangement of data for storage or display.
INITCAP   Converts alpha character values to uppercase for the first letter of
          each word, all other letters in lowercase.

CHARACTER FUNCTION Functions that accept character data as input and can return both
character and numeric values.

TRIM    Removes all specified characters from either the beginning or the
        ending of a string.
EXPRESSION A symbol that represents a quantity or a relationship between
        quantities
SINGLE ROW FUNCTION Functions that operate on single rows only and return one result
        per row
UPPER   Converts alpha characters to upper case
INPUT   Raw data entered into the computer
CONCAT  Concatenates the first character value to the second character
        value; equivalent to concatenation operator (||).
OUTPUT  Data that is processed into information

LOWER   Converts alpha character values to lowercase.

LPAD    Pads the left side of a character, resulting in a right-justified value
SUBSTR  Returns specific characters from character value starting at a
        specific character position and going specified character positions
        long
REPLACE Replaces a sequence of characters in a string with another set of
        characters.
INSTR   Returns the numeric position of a named string.
LENGTH  Returns the number of characters in the expression
RPAD    Pads the right-hand side of a character, resulting in a left- justified
        value
*/

-- String Fonksiyonlar

-- Lower
-- Upper
-- initcap
-- Length
-- Substr(string,m,n)
-- instr(string,?)
-- Replace(string, old_string, new_string)
-- Translate(string, old_character(s), new_character(s))
-- Rpad
-- Lpad
-- Ltrim
-- Rtrim
-- Trim
-- Concat (veya ||)

-- simdi bunlar� inceleyelim

-- Lower

Select Lower('Ali TOPACIK') From Dual;

Select
    first_name,
    Lower(first_name)
From Employees;

--

Select *
From Employees;

SELECT LOWER(email) || '@institutedomain.com' as "Email Address", hire_date,commission_pct
FROM employees
WHERE salary > 3000 AND
      (commission_pct = 0 OR commission_pct IS NULL) AND
      hire_date >= '01-01-2002' AND
      hire_date <= '31-03-2003';
      
-- Upper

Select Upper('Ali TOPACIK') From Dual;

Select
    first_name,
    Upper(first_name)
From Employees;

-- initcap  -- Her Kelimenin ilk harfini buyuk harfe cevirir

Select initcap('merhaba arkadaslar, nasilsiniz') From Dual;


Select
      Lower(Department_Name),
      initcap(Lower(Department_Name))      
From Departments;

-- Length

Select Length('Ali TOPACIK') From Dual;

Select
      Department_Name,
      Length(Department_Name)
From Departments;


-- Substr(string,m,n)

-- Burada
-- m pozitif olursa soldan ba�lar sa�a do�ru al�r
-- m negatif olursa sa�dan sola do�ru gider buldu�u yerden itibaren sa�a dogru n kadar karakter al�r

-- eger n yaz�lmaz ise m'den baslay�p sonuna kadar al�r

Select Substr('oracle_egitimi@gmail.com',5,7) From Dual;
Select Substr('oracle_egitimi@gmail.com',5) From Dual;

Select Substr('oracle_egitimi@gmail.com',-9,6) From Dual;
Select Substr('oracle_egitimi@gmail.com',-9) From Dual;


--

Select 
      instr('oracle_egitimi@gmail.com','@') Result_A,
      Length('oracle_egitimi@gmail.com') Result_B,
      Length('oracle_egitimi@gmail.com') - instr('oracle_egitimi@gmail.com','@') Result_C,
      Substr('oracle_egitimi@gmail.com',1) Result_D,
      Substr('oracle_egitimi@gmail.com',instr('oracle_egitimi@gmail.com','@')+ 1) Result_E,
      Substr('oracle_egitimi@gmail.com',-(Length('oracle_egitimi@gmail.com') - instr('oracle_egitimi@gmail.com','@'))) Result_G 
From Dual;

--

Select 
      'oracle_egitimi@gmail.com' as email,
      instr('oracle_egitimi@gmail.com','@') Result_A
From Dual;

--

With A as
(
  Select 
        'oracle_egitimi@gmail.com' as email,
        instr('oracle_egitimi@gmail.com','@') Result_A
  From Dual
),
B As
(
  Select
            email,
            instr(email,'@') as et_uzunluk
  From A
)
Select
          email,
          substr(email,et_uzunluk+1) emailturu
From B;

--

Select
      Department_Name,
      Substr(Department_Name,3,5)
From Departments;


-- instr(string,?)
-- instr(string,?,[m],[n])
-- Buradaki m ve n tercihe bagl�d�r
-- m'den basla n. tekrar edeni bul anlam�ndad�r
-- m pozitif olursa soldan saga dogru konumlan�r
-- m negatif olursa sagdan sola dogru konumlan�r
-- verilmez ise her ikisi 1 kabul edilir

Select instr('oracle_egitimi@gmail.com','@') From Dual;

Select
      instr('oracle_egitimi@gmail.com','a') Result_A,
      instr('oracle_egitimi@gmail.com','a',1,1) Result_B,
      instr('oracle_egitimi@gmail.com','a',5,1) Result_C,
      instr('oracle_egitimi@gmail.com','a',5,2) Result_D,
      instr('oracle_egitimi@gmail.com','a',5,3) Result_E
From Dual;

Select
      instr('oracle_egitimi@gmail.com','a') Result_A,
      instr('oracle_egitimi@gmail.com','a',-5,1) Result_B1,
      instr('oracle_egitimi@gmail.com','a',-5,2) Result_B2,
      instr('oracle_egitimi@gmail.com','a',-10,1) Result_C,
      instr('oracle_egitimi@gmail.com','a',-10,2) Result_D,
      instr('oracle_egitimi@gmail.com','a',-10,3) Result_E,
      instr('oracle_egitimi@gmail.com','a',-10,4) Result_F,
      instr('oracle_egitimi@gmail.com','a',-20,3) Result_G
From Dual;

Select
      length('oracle.egitim@gmail.com') as uzunluk,
      instr('oracle.egitim@gmail.com','o') Result_A1,
      instr('oracle.egitim@gmail.com','o',1,1) Result_A2,
      instr('oracle.egitim@gmail.com','o',-1,1) Result_A3,
       instr('oracle.egitim@gmail.com','o',-1,2) Result_A4
From Dual;

Select
      instr('SQL Veri Sorgulama ve Raporlama ogreniyorum','lama') Result_A,
      instr('SQL Veri Sorgulama ve Raporlama ogreniyorum','lama',1,1) S_1denbasla_birinciyi_bul,
      instr('SQL Veri Sorgulama ve Raporlama ogreniyorum','lama',1,2) S_1denbasla_ikinciyi_bul
From Dual;


Select
      Substr('oracle.egitim@gmail.com',14,1) as Sonuc
From Dual;

Select
      Substr('oracle.egitim@gmail.com',14+1,5) as Sonuc1,
      Substr('oracle.egitim@gmail.com',15,5) as Sonuc2,
      instr('oracle.egitim@gmail.com','@') as Pozisyon      
From Dual;

Select
      length('oracle.egitim@gmail.com') as uzunluk,
      Substr('oracle.egitim@gmail.com',15) as Sonuc        
From Dual;

Select
      length('oracle.egitim@gmail.com') as uzunluk,
      instr('oracle.egitim@gmail.com','@') as Pozisyon,
      Substr('oracle.egitim@gmail.com',instr('oracle.egitim@gmail.com','@')+1) as Sonuc        
From Dual;

Select
          email,
          substr(email,Pozisyon+1) as Sonuc
          
From (
            Select
                  'oracle.egitim@gmail.com' as email,
                  instr('oracle.egitim@gmail.com','@') as Pozisyon        
            From Dual
        ) A;
        
--

Select
      Department_Name
From Departments;

-- Departments tablosunda Department_Name icerisinde ikinci kelimeden itibaren olanlar? bulunuz

Select
      Department_Name,
      instr(Department_Name,' '),
      Substr(Department_Name,instr(Department_Name,' ') + 1) ResultA
From Departments;

Select
      Department_Name,
      instr(Department_Name,' ') as Pozisyon,
      Substr(Department_Name,instr(Department_Name,' ') + 1) ResultB
From Departments
Where instr(Department_Name,' ') > 0;


WITH
A AS
(
    SELECT
        department_name
    FROM
        departments
    WHERE
        department_name LIKE '% %'
),
B AS
(
  SELECT
      department_name,
      Instr(department_name,' ') as sec
  FROM
      A
)
Select
        SUBSTR(department_name,sec+1) as sonuc
From B;

--

Select * From Departments;

INSERT INTO DEPARTMENTS(DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID)
  VALUES(999,'Ulusal Arastir ve Gelistir',200,1900);

Commit;

Select * From Departments;

-- Departments tablosunda en az 3 kelimeden olusan Department_Name'leri bulunuz

Select
      Department_Name,
      instr(Department_Name,' ') Konum_1,
      instr(Department_Name,' ',instr(Department_Name,' ')+1) Konum_2,
      Substr(Department_Name,instr(Department_Name,' ') + 1) Result_A,
      Substr(Department_Name,instr(Department_Name,' ',instr(Department_Name,' ')+1) + 1) Result_B
From Departments
Where instr(Department_Name,' ',instr(Department_Name,' ')+1) > instr(Department_Name,' ');

Select
      Department_Name,
      instr(Department_Name,' ') Konum_1,
      instr(Department_Name,' ',1,2) Konum_2,
      Substr(Department_Name,instr(Department_Name,' ') + 1) Result_A,
      Substr(Department_Name, instr(Department_Name,' ',1,2) + 1) Result_B
From Departments
Where instr(Department_Name,' ',1,2) > instr(Department_Name,' ');

--

--******************************************
-- Replace(string, old_string, new_string)
--******************************************
Select Replace('SQL Veri Yonetimi, Veri Analizi','Veri', 'Data') From Dual;

Select Replace('SQL Veri Yonetimi','veri', 'Data') From Dual;

Select
    first_name,
    Replace(first_name,'e','') ResultA
From Employees;

-- firstname icerisinde gecen e'lerin say�s�n� bulal�m

Select
    first_name,
    Lower(first_name) as isimufak,
    Replace(Lower(first_name),'e','') ResultA,
    (Length(first_name) - Length(Replace(Lower(first_name),'e',''))) e_Sayisi
From Employees;

With A as
(
    Select
        first_name,
        Lower(first_name) as isimufak,
        Length(first_name) as Uzunluk,
        Replace(Lower(first_name),'e','') as isim_E,
        Length(Replace(Lower(first_name),'e','')) as uzunlukE
    From Employees
)
Select
       first_name,
       Uzunluk - uzunlukE as E_lerinSayisi
       
From A;

--02102023

-- Departments tablosundaki Department_Name kac kelimeden olusuyor

Create Table departments as
Select *
From hr.departments;

Select
      Department_Name,
      Replace(Department_Name,' ','') "BosluklariSil"
From Departments;

Select
      Department_Name,
      Replace(Department_Name,' ','') "BosluklariSil",
      (Length(Department_Name) - Length(Replace(Department_Name,' ',''))) +  1 KelimeSayisi
From Departments;

Select
      first_name,
      Job_id,
      Replace(Job_id,'IT','BT') Result_A,
      Replace(Job_id,'IT','BIL') Result_B                
From Employees;

Select
      first_name,
      Job_id,
      Replace(Job_id,'IT','BT') Result_A,
      Replace(Job_id,'IT','BIL') Result_B                
From Employees
Where Job_id Like '%IT%';

--******************************************
-- Translate(string, old_character(s), new_character(s))
-- Select Translate('SQL Veri Yonetimi','ei', 'x.') From Dual;
-- burada e harfini x ile i harfini ise . ile replace eder
-- Replace gibi calisir daha gelismisidir
--******************************************

Select Translate('SQL Veri Yonetimi','e', 'x') From Dual;

Select Translate('SQL Veri Yonetimi','ei', 'x') From Dual;
Select Translate('SQL Veri Yonetimi','ei', 'x.') From Dual;

Select Translate('Super bulus ile super sonuc','upe', 'x') From Dual;
-- Burada u harfini x ile
-- p ve e harfini ise hicbirsey ile replace eder
-- Result : Sxr bxlxs il sxr sonxc
Select Translate('SQL Veri Yonetimi, Veri Analizi','Veri', 'Data')
From Dual;

Select Replace('SQL Veri ve Yonetimi','Veri', 'Data') From Dual;
-- Replace ile veri kelimesi Data ile degistirilir
/

Select Translate('SQL Veri ve Yonetimi','Veri', 'Data') From Dual;
-- Translate ile ise V-e-r-i harfleri ayr� ayr� D-a-t-a harfleri ile degisgirilir
-- Yani harf harf degistirilir
-- Buyuk ve kucuk harfleri ayr� ayr� gorur
-- Yani A harfi a'dan farkl�d�r

-- Select Translate('SQL Veri ve Yonetimi','Verii', 'Dataz') From Dual;
-- Select Translate('SQL Veri ve Yonetimi','Verii', 'Data') From Dual;

Select Translate('SQL Veri ve Yonetimi','veri', 'Data') From Dual;

Select Translate('Elek Nedir nedendir','eN', 'x*') From Dual;

-- Translate ile bir mesaj� sifreleyelim ve geri cozelim
-- Algoritma olarak sunu kullanal�m
-- Her harf kendinden sonra gelen harf ile degissin

Select
      'SQL Veri Yonetimi' Orjinal_Mesaj,
      Translate('SQL Veri Yonetimi',
      'ABCDEFGHIJKLMNOPQRSTUVYZ abcdefgh�jklmnopqrstuvyz',
      'BCDEFGHIJKLMNOPQRSTUVYZA%bcdefgh�jklmnopqrstuvyza') Sifreli_Mesaj
From Dual;

-- simdide sifreli mesaj� cozelim
Select
      'TRM%Yfsi%Zpofuini' Sifreli_Mesaj,
      Translate('TRM%Yfsi%Zpofuini',
      'BCDEFGHIJKLMNOPQRSTUVYZA%bcdefgh�jklmnopqrstuvyza',
      'ABCDEFGHIJKLMNOPQRSTUVYZ abcdefgh�jklmnopqrstuvyz') Orjinal_Mesaj
From Dual;


--******************************************
-- Lpad
--******************************************
Select Lpad('SQL',12, '*') From Dual;

Select
      first_name,
      LPad(first_name,20,'*') LPad_Ornek,
      RPad(first_name,20,'*') RPad_Ornek
From Employees;

Select
      first_name,
      LPad(first_name,10,'*-') LPad_Ornek,
      RPad(first_name,10,'*-') RPad_Ornek
From Employees;

-- Rpad
Select Rpad('SQL',12, '*') From Dual;

SELECT REPLACE(RPAD(LPAD('Oracle PL SQL', 18, '*'),23,'*'),' ', '*****') AS "Result"
FROM DUAL;

SELECT
      LPAD('Oracle PL SQL', 18, '*') AS "ResultA",
      RPAD(LPAD('Oracle PL SQL', 18, '*'),23,'*') AS "ResultB",
      REPLACE(RPAD(LPAD('Oracle PL SQL', 18, '*'),23,'*'),' ', '*****') AS "ResultC"
FROM DUAL;

-- Ltrim

Select Ltrim('  SQL   Veri   Yonetimi ve Veri Sorgulama    ')
From Dual;

-- sonuc #SQL   Veri   Yonetimi ve Veri Sorgulama    #

-- Rtrim
Select RTrim('  SQL   Veri   Yonetimi ve Veri Sorgulama    ')
From Dual;

-- sonuc #  SQL   Veri   Yonetimi ve Veri Sorgulama#

Select LTrim(RTrim('  SQL   Veri   Yonetimi ve Veri Sorgulama    '))
From Dual;

-- sonuc #SQL   Veri   Yonetimi ve Veri Sorgulama#

-- Trim
Select Trim('  SQL   Veri   Yonetimi ve Veri Sorgulama    ')
From Dual;
--*SQL   Veri   Yonetimi ve Veri Sorgulama*

Select Trim(' ' From  'SQL   Veri   Yonetimi ve Veri Sorgulama    ')
From Dual;
--*SQL   Veri   Yonetimi ve Veri Sorgulama*

Select LTrim(RTrim('  SQL   Veri   Yonetimi ve Veri Sorgulama    '))
From Dual;

-- Concat (veya ||)

Select 'SQL' || ' ' || 'Ogreniyorum' From Dual;

Select Concat('SQL','Ogreniyorum') From Dual;

Select Concat(Concat('SQL',' '),'Ogreniyorum') From Dual;

Select
      first_name,
      last_name,
      Concat(first_name,last_name) FullNameA,
      Concat(Concat(first_name,' '), last_name) FullNameB,
      first_name || ' ' || last_name FullNameC
From Employees;

Select
      first_name,
      Job_id
From Employees;

Select
      Concat(Concat(first_name,' is a '),Job_id) as Result_A,
      first_name || ' is a ' || Job_id as Result_B
From Employees;


-- Tekil Sonuc Fonksiyonlar�
-- Say�sal fonksiyonlarda Return degeri Say�sal
-- Karakter fonksiyonlarda Return degeri Karakter
-- Tekil Sonuc fonksiyonlarda ise Say�salda olabilir, Karakterde olabilir
-- Bu nedenle Tekil sonuc fonksiyonlar� denmektedir

-- NVL, NVL2, NULLIF

-- GREATEST, LEAST

-- DECODE, CASE

-- UID, USER, SYS_CONTEXT

-- Simdi bunlari inceleyelim
-- NVL  -- Null Value kontrolu yapar
-- NVL(A,B) -- A null degilse A doner, A null ise B doner



Select
      first_name,
      Commission_pct,
      NVL(Commission_pct,0) as SonucA,
      NVL(Commission_pct,'9') as SonucB
      --,NVL(Commission_pct,'Komisyon')
      -- Komisyon yazarsak olmaz cunku A'n�n Tipi ne ise B'ninde ayn� olmas� gerekir
From Employees;

Select
      Region,
      NVL(Region,'Kontrol')
      ,NVL(Region,0)
      -- 0 yazarsak hata vermez ama mant?k olarak dogru degildir
      -- cunku A'n�n Tipi ne ise B'ninde ayn� olmas� gerekir
From HR_Employees;

-- NVL2(A,B,C) 
-- A null degilse B
-- A null ise C gelir

Select
      first_name,
      Commission_pct,
      NVL2(Commission_pct, Commission_pct, 0) as SonucA,
      NVL2(Commission_pct, Commission_pct, '9') as SonucB
      --,NVL2(Commission_pct,Commission_pct,'Komisyon')
      -- Komisyon yazarsak olmaz cunku A'n�n Tipi ne ise B ve C'ninde ayn� olmas� gerekir
From Employees;

Select
      first_name,
      Commission_pct,
      NVL2(Commission_pct, Salary, 0) as SonucA
From Employees;


Select
      first_name,
      Salary,
      Commission_pct,
      1+ commission_pct,
      NVL2(Commission_pct,Salary * (1+ commission_pct),Salary) Result_A
From Employees;

Select
      Region,
      NVL2(Region,Region,'Kontrol')
      -- 0 yazarsak olmaz cunku A'n�n Tipi ne ise B ve C'ninde ayn� olmas� gerekir
From HR_Employees;

-- NULLIF(A,B)
-- Eger A=B ise  null donderir
-- Eger A<>B ise A'yi donderir 

Select
      Nullif('Elma','Elma'),
      Nullif('Elma','Armut')
From Dual;

Select
      Nullif(9999,9999),
      Nullif(9999,1234)
From Dual;

Select
      first_name,      
      Commission_pct,
      NVL(Commission_pct,0),
      Salary,
      Salary - NVL(Commission_pct,0) Salary_C,
      Nullif(Salary, Salary - NVL(Commission_pct,0)) Result_A
From Employees;

Select
      first_name,      
      Salary,
      Salary - NVL(Commission_pct,0) Salary_C,
      To_Char(Salary) || ' = ' || To_Char(Salary - NVL(Commission_pct,0)) || ' esit ise null degilse:' || To_Char(Salary),
      Nullif(Salary, Salary - NVL(Commission_pct,0)) Result_A
From Employees;

-- GREATEST(Parametre1,Parametre2,Parametre3,Parametre4,Parametre5...)
-- Parametre s�n�rlamas� yok
-- Ald�g� parametrelerin en buyugunu verir

Select
      Greatest(100,110,99,10,1000,-50,300)
From Dual;

Select
      Greatest('Elma','Armut','Muz','Kiraz','Ananas') as Sonuc1,
      Greatest('Elma','Armut','Muz','Kiraz','Zeytin','Ananas') as Sonuc2,
      Greatest('Elma','Armut','Muz','Kiraz','Zeytin','Ananas', 'ananas') as Sonuc3,
      Greatest('Elma','Armut','Muz',100,'Zeytin',300) as Sonuc4,
      Greatest('E','A','Muz',999,'Ananas') as Sonuc5
From Dual;

-- LEAST(Parametre1,Parametre2,Parametre3,Parametre4,Parametre5...)
-- Parametre s�n�rlamas� yok
-- Ald�g� parametrelerin en Kucugunu verir

Select
      LEAST(100,110,99,10,1000,-50,300)
From Dual;

Select
      LEAST(100,110,99,1000,300)
From Dual;

Select
      LEAST('Elma','Armut','Muz','Kiraz'),
      LEAST('Elma','Armut','Muz','Kiraz','Zeytin','Ananas'),
      LEAST('Elma','Armut','Muz',100,'Zeytin',300),
      LEAST('E','A','Muz',999,'Ananas')
From Dual;


-- DECODE ile Case aras�nda amac bak�m�ndan bir fark yoktur
-- her ikiside kullan�labilir

-- DECODE

Select
      first_name,
      department_id,
      Decode(department_id,
                            10,'Yaz�l�m',
                            30,'Uretim',
                            50,'Pazarlama',
                            'Diger'
            ) Department
From Employees
Order By 2;

-- CASE

Select
      first_name,
      department_id,
      Case department_id
           When 10 Then 'Yaz�l�m'
           When 30 Then 'Uretim'
           When 50 Then 'Pazarlama'
           Else 'Diger'
      End Department
From Employees
Order By 2;

-- UID  -- Parametre almaz
-- Her bir kullan�c� icin unique bir kimlik numaras� atan�r,
-- Bu numara UID ile ogrenilir

Select UID From Dual;

-- USER  -- Parametre almaz

Select USER From Dual;

Show User;

Select UID, User From Dual;

-- SYS_CONTEXT  -- ald�g� paramatrelere gore sonuc donderir

-- log'lama yapmak istersek (audit dosyas� gibi),
-- kullan�c�lara ait log'lar� takip etmek amac�yla bu fonksiyonlardan faydalanabiliriz


Select SYS_CONTEXT('userenv','Session_User') as UserName From Dual;

Select
      SYS_CONTEXT('USERENV','SESSION_USER') as UserName1,
      SYS_CONTEXT('USERENV','session_user') as UserName2,
      SYS_CONTEXT('userenv','session_user') as UserName3
From Dual;

Select
      SYS_CONTEXT('USERENV','SESSION_USER') as UserName,
      SYS_CONTEXT('USERENV','ISDBA') as ISDBA,           -- DBA yetkisi varm� diye kontrol ediyoruz
      SYS_CONTEXT('USERENV','HOST') as HOST,
      SYS_CONTEXT('USERENV','INSTANCE') as INSTANCE,
      SYS_CONTEXT('USERENV','IP_ADDRESS') as IP_ADRESSES,
      SYS_CONTEXT('USERENV','DB_NAME') as DB_NAME         -- Kurulumda SID olarak XE vermistim
From Dual;

Select
      SYS_CONTEXT('USERENV','SESSION_USER') as UserName,
      SYS_CONTEXT('USERENV','ISDBA') as ISDBA,
      SYS_CONTEXT('USERENV','HOST') as HOST,
      SYS_CONTEXT('USERENV','INSTANCE') as INSTANCE,
      SYS_CONTEXT('USERENV','INSTANCE_NAME"') as INSTANCE_NAME,
      SYS_CONTEXT('USERENV','IP_ADDRESS') as IP_ADRESSES,
      SYS_CONTEXT('USERENV','DB_NAME') as DB_NAME,
      SYS_CONTEXT('USERENV','OS_USER') as OS_USER,
      SYS_CONTEXT('USERENV','SERVICE_NAME') as SERVICE_NAME,
      SYS_CONTEXT('USERENV','SESSION_EDITION_NAME') as SESSION_EDITION_NAME
From Dual;

Select
      SYS_CONTEXT('USERENV','ACTION') as ACTION,
      SYS_CONTEXT('USERENV','CLIENT_INFO') as CLIENT_INFO,
      SYS_CONTEXT('USERENV','CURRENT_SCHEMAID') as CURRENT_SCHEMAID,
      SYS_CONTEXT('USERENV','CURRENT_SCHEMA') as CURRENT_SCHEMA,
      SYS_CONTEXT('USERENV','CURRENT_SQL') as CURRENT_SQL,
      SYS_CONTEXT('USERENV','CURRENT_USER') as CURRENT_USER,
      SYS_CONTEXT('USERENV','DB_DOMAIN') as DB_DOMAIN,
      SYS_CONTEXT('USERENV','GLOBAL_UID') as GLOBAL_UID,
      SYS_CONTEXT('USERENV','LANGUAGE') as LANGUAGE
From Dual;

Select
      SYS_CONTEXT('USERENV','NLS_CALENDAR') as NLS_CALENDAR,
      SYS_CONTEXT('USERENV','NLS_CURRENCY') as NLS_CURRENCY,
      SYS_CONTEXT('USERENV','NLS_DATE_FORMAT') as NLS_DATE_FORMAT,
      SYS_CONTEXT('USERENV','NLS_DATE_LANGUAGE') as NLS_DATE_LANGUAGE,
      SYS_CONTEXT('USERENV','NLS_SORT') as NLS_SORT,
      SYS_CONTEXT('USERENV','NLS_TERRITORY') as NLS_TERRITORY,
      SYS_CONTEXT('USERENV','SERVER_HOST') as SERVER_HOST,
      SYS_CONTEXT('USERENV','SERVICE_NAME') as SERVICE_NAME
From Dual;

--

select *
from   nls_session_parameters;

select *
from   nls_session_parameters
where  PARAMETER = 'NLS_TERRITORY';

select t.value,
       case 
          when t.value != 'DENMARK' then to_char(sysdate-1, 'd') || ' A'
          else to_char(sysdate, 'd') || ' B'
       end as Sonuc
from   nls_session_parameters t
where  t.parameter = 'NLS_TERRITORY';

/

select 
      to_char (sysdate, 'FmDay', 'nls_date_language=english'),
      case to_char (sysdate, 'FmDay', 'nls_date_language=english')
          when 'Monday' then 1
          when 'Tuesday' then 2
          when 'Wednesday' then 3
          when 'Thursday' then 4
          when 'Friday' then 5
          when 'Saturday' then 6
          when 'sunday' then 7
      end d
  from dual;
  
/

select 
      first_name, last_name, hire_date,
      to_char (HIRE_DATE, 'FmDay', 'nls_date_language=english'),
      case to_char (HIRE_DATE, 'FmDay', 'nls_date_language=english')
          when 'Monday' then 1
          when 'Tuesday' then 2
          when 'Wednesday' then 3
          when 'Thursday' then 4
          when 'Friday' then 5
          when 'Saturday' then 6
          when 'Sunday' then 7
      end d
  from employees;

/

select 
      first_name, last_name, hire_date,
      to_char (HIRE_DATE, 'FmDay', 'nls_date_language=english') as Gunler,
      to_char (HIRE_DATE, 'FmMonth', 'nls_date_language=english') as Aylar
from employees;

/

-- Employees tablosunda ayn? gun ise al?nanlar?n?n say?s?n? bulunuz
select 
      first_name, last_name, hire_date,
      to_char (HIRE_DATE, 'FmDay') as Gunler
from employees;

With A as
(
    select 
          first_name, last_name, hire_date,
          to_char (HIRE_DATE, 'FmDay') as Gunler
    from employees
)
Select Gunler, Count(*) as Sayisi
From A
Group By Gunler;


-- Employees tablosunda ayn? tarihte ise al?nanlar?n?n say?s?n? bulunuz
select 
      first_name, last_name, hire_date,
      to_char (HIRE_DATE, 'FmDay') as Gunler
from employees;

With A as
(
    select 
          first_name, last_name, hire_date,
          to_char (HIRE_DATE, 'FmDay') as Gunler
    from employees
)
Select hire_date, Count(*) as Sayisi
From A
Group By hire_date
Order By Sayisi desc;

select 
      first_name, last_name, hire_date,
      to_char (HIRE_DATE, 'FmDay') as GunlerA,
      to_char (HIRE_DATE, 'FmDay', 'nls_date_language=english') as GunlerB,
      to_char (HIRE_DATE, 'FmMonth', 'nls_date_language=english') as Aylar
from employees;

select 
      first_name, last_name, hire_date,
      to_char (HIRE_DATE, 'FmDay') as GunlerA,
      to_char (HIRE_DATE, 'FmDay', 'nls_date_language=turkish') as GunlerB,
      to_char (HIRE_DATE, 'FmDay', 'nls_date_language=German') as GunlerC,
      to_char (HIRE_DATE, 'FmMonth', 'nls_date_language=turkish') as Aylar
from employees;

With A as
(
    select 
          first_name, last_name, hire_date,
          to_char (HIRE_DATE, 'FmDay', 'nls_date_language=english') as Gunler
    from employees
)
Select Gunler, Count(*) as Sayisi
From A
Group By Gunler;

/

select 
      to_char (sysdate, 'FmDay', 'nls_date_language=turkish'),
      to_char (to_date('12-05-2023','DD/MM/YYYY'), 'FmDay', 'nls_date_language=turkish'),
      case to_char (to_date('12-05-2023','DD/MM/YYYY'), 'FmDay', 'nls_date_language=turkish')
      --case to_char (sysdate, 'FmDay', 'nls_date_language=turkish')
          when 'Pazartesi' then 1
          when 'Sal?' then 2
          when '�ar?amba' then 3
          when 'Per?embe' then 4
          when 'Cuma' then 5
          when 'Cumartesi' then 6
          when 'Pazar' then 7
      end d
  from dual;

select 
      to_date('08/05/2023','DD/MM/YYYY') AA,
      to_char (to_date('08-05-2023','DD/MM/YYYY'), 'FmDay', 'nls_date_language=turkish') Pazartesi,
      to_char (to_date('09-05-2023','DD/MM/YYYY'), 'FmDay', 'nls_date_language=turkish') Sali,
      to_char (to_date('10-05-2023','DD/MM/YYYY'), 'FmDay', 'nls_date_language=turkish') �arsamba,
      to_char (to_date('11-05-2023','DD/MM/YYYY'), 'FmDay', 'nls_date_language=turkish') Persembe,
      to_char (to_date('12-05-2023','DD/MM/YYYY'), 'FmDay', 'nls_date_language=turkish') Cuma,
      to_char (to_date('06-05-2023','DD/MM/YYYY'), 'FmDay', 'nls_date_language=turkish') Cumartesi,
      to_char (to_date('07-05-2023','DD/MM/YYYY'), 'FmDay', 'nls_date_language=turkish') Pazar
  from dual;
/

select 
      to_date('08/05/2023','DD/MM/YYYY') AA,
      to_char (to_date('07-05-2023','DD/MM/YYYY'), 'd') Pazar,
      to_char (to_date('08-05-2023','DD/MM/YYYY'), 'd') Pazartesi,
      to_char (to_date('09-05-2023','DD/MM/YYYY'), 'd') Sali,
      to_char (to_date('10-05-2023','DD/MM/YYYY'), 'd') �arsamba,
      to_char (to_date('11-05-2023','DD/MM/YYYY'), 'd') Persembe,
      to_char (to_date('12-05-2023','DD/MM/YYYY'), 'd') Cuma,
      to_char (to_date('06-05-2023','DD/MM/YYYY'), 'd') Cumartesi            
  from dual;
/
Select *
From nls_session_parameters;
/
Select *
From nls_session_parameters
Where parameter = 'NLS_DATE_LANGUAGE';
/
--
Select
      SYS_CONTEXT('USERENV','SESSION_EDITION_ID') as SESSION_EDITION_ID,
      SYS_CONTEXT('USERENV','SESSION_EDITION_NAME') as SESSION_EDITION_NAME,
      SYS_CONTEXT('USERENV','SESSION_USER') as SESSION_USER,
      SYS_CONTEXT('USERENV','SESSION_USERID') as SESSION_USERID,
      UID
From Dual;
/

-- cmd'yi Administrator olarak acal?m
-- Gelen ekranda sqlplus sys/sys as sysdba;
-- yaz?p baglanal?m ve asagidaki kodu �al??t?ral?m

Select SYS_CONTEXT('USERENV','TERMINAL') as TERMINAL From Dual;

/
-- Yukar�daki sorguda TERMINAL icin cmd>sqlplus ile kullan ve sonucu incele

--******************************************************
-- istatistik fonksiyonlar
--******************************************************

-- Sum, AVG, Max, Min, Count, STDDEV(Standart Sapma), VARIANCE(Standart Sapmaya gore ortalama)

-- Bu fonksiyonlar hem geleneksel kumeleme(Aggregate)   -- Group By(ve Having)
-- hemde Analitik sorgulamalarda kullan�l�r             -- Over




--******************************************************
-- Sum
--******************************************************
Select * From Employees;

Select Sum(Salary) From Employees;

    Select
            job_id,
            Sum(Salary) as ToplamMaas
    From Employees
    Group By job_id;
    
-- Yukar?daki sorguda job_id'ye gore toplam maaslar?n en alt?na genel toplam yazd?ral?m 
    

With A as
(
    Select job_id, Sum(Salary) as ToplamMaas,'1' as TabloNo
    From Employees
    Group By job_id
    Union
    Select 'Genel Toplam', Sum(Salary) as ToplamMaas,'2' as TabloNo
    From Employees
)
Select job_id, ToplamMaas
From A
Order By TabloNo;

--


With
A as
(
    Select job_id, Sum(Salary) as ToplamMaas,'1' as TabloNo
    From Employees
    Group By job_id       
),
B as
(
    Select 'Genel Toplam' job_id, Sum(Salary) as ToplamMaas,'2' as TabloNo
    From Employees
)
Select job_id, ToplamMaas From A
union
Select job_id, ToplamMaas From B
Order By ToplamMaas;

--

With A as
(
    Select job_id, Sum(Salary) as ToplamMaas
    From Employees
    Group By job_id
    Union
    Select 'Genel Toplam', Sum(Salary) as ToplamMaas
    From Employees
)
Select job_id, ToplamMaas
From A
Order By ToplamMaas;

--

    Select job_id, Sum(Salary) as ToplamMaas
    From Employees
    Group By job_id
    Union
    Select 'Genel Toplam', Sum(Salary) as ToplamMaas
    From Employees
    Order By ToplamMaas;
    
--

With A as
(
    Select job_id, Sum(Salary) as ToplamMaas, '1' as "TabloNo"
    From Employees
    Group By job_id
),
B as
(
  Select 'Genel Toplam' as job_id, Sum(Salary) as ToplamMaas,'2' as "TabloNo"
  From Employees
)
Select job_id, ToplamMaas  From A
union
Select job_id, ToplamMaas From B
Order By ToplamMaas;

--******************************************************
--AVG
--******************************************************
Select Avg(Salary) From Employees;

Select Round(Avg(Salary),2) From Employees; -- Round ile 2 hane duyarl� yapt�k

Select length('831775700934579439252336448598130841') from Dual;
-- virgulden sonraki hane uzunlugunu bulduk

--******************************************************
--Max, Min
--******************************************************

Select Max(Salary) From Employees;

Select Min(Salary) From Employees;

--******************************************************
--Count
--******************************************************

Select Count(*) From Employees;

Select Count(Salary) From Employees;

Select Count(commission_pct) From Employees;
-- count sayma isi yapar ve bunu yaparken Count icerisindeki null olanlar� saymaz
-- ancak null'lar�n say�s� laz�mda su sekilde yapabiliriz

-- Null Kontrolu nas?l yap?l?r bakal?m

Select City, Region, Country
From Sales_Customers
Where region = 'WA';

Select City, Region, Country
From Sales_Customers
Where region != 'WA';

Create Table Sales_CustomersB as
Select *
From Sales_Customers;


Select *
From Sales_CustomersB
Where custid in(39,40);

Update Sales_CustomersB
Set region = 'Test'
Where custid in(39,40);

Select *
From Sales_CustomersB
Where custid in(39,40);

Update Sales_CustomersB
Set region = ''
Where custid in(39,40);

Select *
From Sales_CustomersB
Where custid in(39,40);

Update Sales_CustomersB
Set region = 'Test'
Where custid in(39,40);

Select *
From Sales_CustomersB
Where custid in(39,40);

Update Sales_CustomersB
Set region = null
Where custid in(39,40);

Select *
From Sales_CustomersB
Where custid in(39,40);

Update Sales_CustomersB
Set region = 'Test'
Where custid in(39,40);

Select *
From Sales_CustomersB
Where custid in(39,40);

Update Sales_CustomersB
Set region = 'null'         -- null haline dondermez 'null' bilgisini text/karakter olarak yazar
Where custid in(39,40);     -- null olmas? icin Set region = null dememiz laz?m

Update Sales_CustomersB
Set region = null
Where custid in(39,40);

Select *
From Sales_CustomersB
Where custid in(39,40);

Select *
From Sales_CustomersB
Where region = '';

Select *
From Sales_Customers
Where region is Null;

Select *
From Sales_Customers
Where region is Not Null;

Select Count(*)
From Employees
Where commission_pct is null;


Select Count(*)
From Employees
Where commission_pct is not null;

--******************************************************
--STDDEV(Standart Sapma), VARIANCE(Standart Sapmaya gore ortalama)
--******************************************************

Select STDDEV(Salary) From Employees;
Select Length('3909,579730552481921059198878167256201202') From Dual;


Select VARIANCE(Salary) From Employees;
Select Length('15284813,66954681713983424440134015164874') From Dual;

--******************************************************
-- Hepsini bir arada gorelim
--******************************************************

Select
      Sum(Salary),
      Round(Avg(Salary),2) as AVG_,
      Min(Salary),
      Max(Salary),
      Count(Salary),
      Count(*),
      Count(commission_pct),  -- dolu olan komisyonlar�n say�s�n� verir
      Round(STDDEV(Salary),2) STDDEV_,
      Round(VARIANCE(Salary),2) VARIANCE_
From Employees;

--******************************************************
-- Group By (Department_id baz�nda bulal�m)
--******************************************************

Select
      Sum(Salary),
      Round(Avg(Salary),2) as AVG_,
      Min(Salary),
      Max(Salary),
      Count(Salary),
      Count(*),
      Count(commission_pct),  -- dolu olan komisyonlar�n say�s�n� verir
      Round(STDDEV(Salary),2) STDDEV_,
      Round(VARIANCE(Salary),2) VARIANCE_
From Employees
Where Department_id = 10;

-- veya tum department_id ler icin Group By ile bulal�m
-- sorgularda sutun adlar?n? degistirmek isterseniz Alias kullanabilirsiniz
-- uretilen sutunlar icin kesinlikle Alias kullanmay? unutmay?n?z

Select
      Department_id as BolumNo,
      Sum(Salary) as ToplamMaas,
      Round(Avg(Salary),2) as AVG_,
      Min(Salary) as Min_,
      Max(Salary) as Max_,
      Count(Salary) as Sayisi1,
      Count(*) as Sayisi2,
      Count(commission_pct) as Commission,  -- dolu olan komisyonlar�n say�s�n� verir
      Round(STDDEV(Salary),2) STDDEV_ ,
      Round(VARIANCE(Salary),2) VARIANCE_
From Employees
Group By Department_id
Order By 1;

Select *
From Employees
Where Department_id is null;

--******************************************************
-- Having
--******************************************************

Select
      Department_id as BolumNo,
      Sum(Salary) as ToplamMaas,
      Round(Avg(Salary),2) as AVG_,
      Min(Salary) as Min_,
      Max(Salary) as Max_,
      Count(Salary) as Sayisi1,
      Count(*) as Sayisi2,
      Count(commission_pct) as Commission,  -- dolu olan komisyonlar�n say�s�n� verir
      Round(STDDEV(Salary),2) STDDEV_ ,
      Round(VARIANCE(Salary),2) VARIANCE_
From Employees
Group By Department_id
Having Count(*) > 5
Order By 1;

--******************************************************
-- Analitik Sorgular
--******************************************************
-- Calisan Adi, Maasi, Kumulatif Toplam(Calisan ad�na gore s�ralans�n)

Select
      first_name,
      Salary,
      Sum(Salary) Over(Order By first_name) as TotalSalary      
From Employees;

-- Ancak yukar�daki sorguda ayn� isme sahip olanlar ayn� kumulatif toplam� al�r
-- Bunu su sekilde cozeriz

Select
      first_name,
      Salary,
      Sum(Salary) Over(Order By first_name, Employee_id) as TotalSalary      
From Employees;

--

Select
      first_name,
     -- employee_id,
      Salary,
      Sum(Salary) Over(Order By first_name, employee_id) as TotalSalary      
From Employees;


Select
      first_name || ' ' || last_name as FullName,
     -- employee_id,
      Salary,
      Sum(Salary) Over() as GenelToplam      
From Employees;

--******************************************************
-- Calisanin Adi, Maasi, Bolumu, Kumulatif Toplam
-- Bolume gore gruplas�n, maasa gore s�ralas�n
--******************************************************

Select
      Department_id,
      first_name,
      Salary      
From Employees
Order By department_id;

Select
      Department_id,
      first_name,
      Salary,
      Sum(Salary) Over(Partition By Department_id Order By Salary) as TotalSalary      
From Employees;

Select
      Department_id,
      first_name,
      Salary,
      Sum(Salary) Over(Partition By Department_id Order By Salary, Employee_id) as TotalSalary      
From Employees;

Select
      Department_id,
      first_name,
      Salary,
      Sum(Salary) Over(Partition By Department_id Order By Department_id, first_name, Employee_id) as TotalSalary      
From Employees;

-- Sales_Orders tablosunda shipcountry sutununa gore ilerleye freight toplamlar?n? bulunuz
-- orderid, orderdate, freight, shipcountry, RunFreight

Select
        shipcountry, 
        orderid,
        orderdate, 
        freight,
        Sum(freight) Over(Partition By shipcountry) as SumShipcountryTotalFreight
From Sales_Orders;

--

Select
        shipcountry, 
        orderid,
        orderdate, 
        freight,
        Sum(freight) Over(Partition By shipcountry Order By shipcountry,Freight) as RunFreight
From Sales_Orders;

--

Select
        shipcountry, 
        orderid,
        orderdate, 
        freight,
        Sum(freight) Over(Partition By shipcountry Order By shipcountry,freight,orderdate) as RunFreight
From Sales_Orders;

--

Select
        shipcountry, 
        orderid,
        orderdate, 
        freight,
        Sum(freight) Over(Partition By shipcountry Order By shipcountry, freight, orderdate, orderid) as RunFreight
From Sales_Orders;

Select
        shipcountry,
        orderid,
        orderdate,
        freight,
        Sum(Freight) Over(Partition By shipcountry) as RunFreight,
        Sum(Freight) Over() as GenelToplamFreight
From Sales_Orders;

-- Yukar?daki sorguda ulketoplamfreightlar?n?n geneltoplamdaki oran?n? bulunuz

Select distinct
        shipcountry,
        --orderid,
        Sum(Freight) Over(Partition By shipcountry) as RunFreight,
        Sum(Freight) Over() as GenelToplamFreight
From Sales_Orders;

With A as
(
    Select distinct
            shipcountry,
            --orderid,
            Sum(Freight) Over(Partition By shipcountry) as RunFreight,
            Sum(Freight) Over() as GenelToplamFreight
    From Sales_Orders
)
Select
        shipcountry,
        Runfreight,
        GenelToplamFreight,
        Runfreight / GenelToplamFreight * 100 as Oran
From A;

With 
A as
(
    select 
        job_id,
        Sum(Salary) as SalarySum,
        1 "AA"
    from employees
    group by job_id
),
B as
(
    select 
        'Genel Toplam' as GenelToplam,
        Sum(Salary) as SalarySum,
        2 "AA"
    from employees
)
    Select JOB_ID,SALARYSUM,AA from A
    union
    Select GenelToplam,SALARYSUM,AA from B
    Order By AA;

With 
A as
(
    select 
        job_id,
        Sum(Salary) as SalarySum,
        1 "AA"
    from employees
    group by job_id
),
B as
(
    select 
        'Genel Toplam' as GenelToplam,
        Sum(Salary) as SalarySum,
        2 "AA"
    from employees
),
C as
(
    Select JOB_ID,SALARYSUM,AA from A
    union
    Select GenelToplam,SALARYSUM,AA from B
)
Select JOB_ID,SALARYSUM,AA
From C
Order By AA;

--


Select Distinct
        shipcountry,
        Sum(Freight) Over(Partition By shipcountry) as ToplamFreight,
        Sum(Freight) Over() as GenelToplamFreight
From Sales_Orders
Order By 1;

-- Yukar?daki sorguda her shipcountry'nin ToplamFreight'?n?n GenelToplamFreight icerisindeki
-- oran?n? bulunuz

Select Distinct
        shipcountry,
        Sum(Freight) Over(Partition By shipcountry) as ToplamFreight,
        Sum(Freight) Over() as GenelToplamFreight,
        (Sum(Freight) Over(Partition By shipcountry)  / Sum(Freight) Over()) * 100 as Oran
From Sales_Orders
Order By 1;

-- Yukar?daki kullan?m yerine CTEs ile ve derived table ile yapal?m

With A as
(
    Select Distinct
            shipcountry,
            Sum(Freight) Over(Partition By shipcountry) as ToplamFreight,
            Sum(Freight) Over() as GenelToplamFreight
    From Sales_Orders
)
Select
        shipcountry,
        ToplamFreight,
        GenelToplamFreight,
        ToplamFreight / GenelToplamFreight * 100 as Oran
From A
Order By 1;

-- derived ile yapal?m

Select
        shipcountry,
        ToplamFreight,
        GenelToplamFreight,
        ToplamFreight / GenelToplamFreight * 100 as Oran
From    (
           Select Distinct
                    shipcountry,
                    Sum(Freight) Over(Partition By shipcountry) as ToplamFreight,
                    Sum(Freight) Over() as GenelToplamFreight
            From Sales_Orders
        ) A
Order By 1;

-- AVG ile yapal?m

Select Distinct
        shipcountry,
        Avg(Freight) Over(Partition By shipcountry) as AVGFreight
From Sales_Orders
Order By 1;


-- Count ile yapal?m
Select Distinct
        shipcountry,
        Count(Freight) Over(Partition By shipcountry) as Sayisi
From Sales_Orders
Order By 1;

-- Min ile yapal?m

Select Distinct
        shipcountry,
        Min(Freight) Over(Partition By shipcountry) as MinFreight
From Sales_Orders
Order By 1;

-- Max ile yapal?m

Select Distinct
        shipcountry,
        Max(Freight) Over(Partition By shipcountry) as MaxFreight
From Sales_Orders
Order By 1;

Select
      Department_id,
      first_name,
      Salary,
      Avg(Salary) Over(Partition By Department_id Order By Department_id) as AvgSalary      
From Employees;

-- employees tablosunda her bir job_id icin ToplamSalary Bulunuz

Select
        job_id,
        Sum(Salary) as TotalSalary
From employees
Group By job_id
Order By 1;

Select Distinct
        job_id,
        Sum(Salary) Over(Partition By job_id) as TotalSalary
From employees
Order By 1;
Select
        job_id,
        to_char(hire_date, 'YYYY') as Yillar,
        Sum(Salary) as TotalSalary
From employees
Group By job_id,to_char(hire_date, 'YYYY')
Order By 1;

Select distinct
        job_id,
        to_char(hire_date, 'YYYY') as Yillar,
        Sum(Salary) Over(Partition By job_id,to_char(hire_date, 'YYYY')) as TotalSalary
From employees
Order By 1;

Select distinct
        job_id,
        --to_char(hire_date, 'YYYY') as Yillar,
        Sum(Salary) Over(Partition By job_id,to_char(hire_date, 'YYYY')) as TotalSalary
From employees
Order By 1;

--******************************************************
-- Tarih ve Zaman Fonksiyonlar�
--******************************************************

-- Current_Date     -- Session  TimeZone'a gore Tarih ve Saati verir(Yani oturuma gore verecektir)
-- SysDate          -- Database TimeZone'a gore Tarih ve Saati verir
-- SysTimeStamp     -- Zaman Damgas�
                    -- (Efatura, Elektronik imza, Kep,v.s.)
                    -- (tum elektronik islemler izin Zaman Damgas�na ihtiyac vard�r)
-- Tarih Formatlar�
-- Tools > Prefences > Database > NLS alt�nda formatlar� gorebiliriz

--******************************************************
-- CurrentDate, SysDate, localtimestamp
--******************************************************


Select Current_Date, SysDate, localtimestamp
From Dual;

Select SessionTimeZone From Dual;

Alter Session Set Time_Zone = '+2:0';

Select Current_Date, SysDate, localtimestamp
From Dual;

Alter Session Set Time_Zone = '+14:0';

Select Current_Date, SysDate, localtimestamp
From Dual;

Alter Session Set Time_Zone = '+3:0';

Select Current_Date, SysDate, localtimestamp
From Dual;

--******************************************************
-- SysTimeStamp
--******************************************************

Select SysTimeStamp
From Dual;

Select SysTimeStamp, localtimestamp
From Dual;

--******************************************************
-- Tarih Formatlar�
--******************************************************

Select
        SysDate,
        To_Char(SysDate,'D') HaftaninKacinciGunu,
        To_Char(SysDate,'DD') AyinKacinciGunu,
        To_Char(SysDate,'DDD') YilinKacinciGunu,
        To_Char(SysDate,'D DD DDD') Result_A,
        To_Char(SysDate,'DAY') GunAdi,
        To_Char(SysDate,'DY') GunAdiKisa,
        To_Char(SysDate,'DD MM YYYY MON') Result_C1,
        To_Char(SysDate,'DD MM YYYY MONTH') Result_C2,
        To_Char(SysDate,'DD-MM-YYYY MONTH') Result_C3,
        To_Char(SysDate,'D') Result_D,
        To_Char(SysDate,'D') Result_E
From Dual;


Select
        SysDate,
        To_Char(SysDate,'W') AyinKacinciHaftasi,
        To_Char(SysDate,'WW') YilinKacinciHaftasi,
        To_Char(SysDate,'IW') IsoYilinKacinciHaftasi,
        To_Char(SysDate,'mm') AyNumarasiA,
        To_Char(SysDate,'MM') AyNumarasiB,
        To_Char(SysDate,'MON') AyAdiA,
        To_Char(SysDate,'MONTH') AyAdiB
From Dual;


Select
        SysDate,
        To_Char(SysDate,'Y') Yil_Kisa_Y,
        To_Char(SysDate,'YY') Yil_Kisa_YY,
        To_Char(SysDate,'YYY') Yil_Kisa_YYY,
        To_Char(SysDate,'YYYY') Yil_Uzun,
        To_Char(SysDate,'YEAR') Yil_ingilizce ,
        To_Char(SysDate,'RR') Asir_Yuzyil
From Dual;
/*
The RR datetime format element
lets you store 20th century dates in the 21st century by specifying only the last two digits of the year
If you use the TO_DATE function with the YY datetime format element,
then the year returned always has the same first 2 digits as the current year

*/

Select
        SysDate,
        To_Char(SysDate,'HH') HH_,
        To_Char(SysDate,'HH12') HH12_,
        To_Char(SysDate,'HH24') HH24_
From Dual;

Select
        LocalTimeStamp,
        SysDate,
        To_Char(SysDate,'HH24') HH_,
        To_Char(SysDate,'MI') MI_,
        To_Char(SysDate,'SS') SS_,
        To_Char(SysDate,'SSSSS') SSSSS_,
        To_Char(LocalTimeStamp,'FF') FF_
From Dual;


Select
        SysDate,
        To_Char(SysDate,'Q') Q_,
        To_Char(SysDate,'MM') MM_,
        To_Char(SysDate,'MON') MON_,
        To_Char(SysDate,'MONTH') MONTH_,
        To_Char(SysDate,'RM') RM_         -- RM roma rakam� ile kac�nc� ay oldugunu verir
From Dual;

-- Yillar?n Ceyreklere gore Toplam Freight'lar?n?n bulunuz
-- Tablo:Sales_Orders

Select
        To_Char(orderdate,'YYYY') as Yillar,
        To_Char(orderdate,'Q') as Ceyrekler,
        Sum(Freight) as TotalFreight
From Sales_Orders
Group By To_Char(orderdate,'YYYY'), To_Char(orderdate,'Q')
Order By 1,2;

-- Yillar?n, Ceyreklere ve Aylara gore Toplam Freight'lar?n?n bulunuz
-- Tablo:Sales_Orders

Select
        To_Char(orderdate,'YYYY') as Yillar,
        To_Char(orderdate,'Q') as Ceyrekler,
        To_Char(orderdate,'MONTH') as Aylar,
        Sum(Freight) as TotalFreight
From Sales_Orders
Group By To_Char(orderdate,'YYYY'), To_Char(orderdate,'Q'), To_Char(orderdate,'MONTH')
Order By 1,2,3;

-- Yukar?daki ornegi Over ile yapal?m

Select distinct
        to_char(orderdate, 'YYYY') as Yillar,
        Sum(Freight) Over(Partition By to_char(orderdate, 'YYYY')) as TotalFreight
From Sales_Orders
Order By 1;

--

Select distinct
        to_char(orderdate, 'YYYY') as Yillar,
        To_Char(orderdate,'Q') as Ceyrekler,
        Sum(Freight) Over(Partition By to_char(orderdate, 'YYYY'), To_Char(orderdate,'Q')) as TotalFreight
From Sales_Orders
Order By 1, 2;

--

Select distinct
        to_char(orderdate, 'YYYY') as Yillar,
        To_Char(orderdate,'Q') as Ceyrekler,
        To_Char(orderdate,'MONTH') as Aylar,
        Sum(Freight) Over(Partition By to_char(orderdate, 'YYYY'), To_Char(orderdate,'Q'), To_Char(orderdate,'MONTH')) as TotalFreight
From Sales_Orders
Order By 1, 2, 3;

--

Select
        SysDate,
        To_Char(SysDate,'J') J_ -- Milattan once 1 Ocak 4721 tarihinden itibaren kac gun gectigini verir
From Dual;

Select
      To_Char(Current_Date,'DD/MM/YYYY HH24:MI:SS') Current_Date_,
      To_Char(SysDate,'DD/MM/YYYY HH24:MI:SS') SysDate_
From Dual;

/

Alter Session Set Time_Zone = '+2:0';

/
alter session set nls_language = german;
/
select to_char(sysdate, 'DAY') from dual;
select to_char(sysdate, 'MONTH') from dual;
select to_char(sysdate, 'd') from dual;
/
select to_char(sysdate, 'DAY', 'NLS_DATE_LANGUAGE = danish') from dual;
select to_char(sysdate, 'MONTH', 'NLS_DATE_LANGUAGE = danish') from dual;
select to_char(sysdate, 'd', 'NLS_DATE_LANGUAGE = danish') from dual;
/

alter session set nls_language = turkish;
/
select to_char(sysdate, 'DAY') from dual;
select to_char(sysdate, 'MONTH') from dual;
select to_char(sysdate, 'd') from dual;
/
select to_char(sysdate, 'DAY', 'NLS_DATE_LANGUAGE = danish') from dual;
select to_char(sysdate, 'MONTH', 'NLS_DATE_LANGUAGE = danish') from dual;
select to_char(sysdate, 'd', 'NLS_DATE_LANGUAGE = danish') from dual;
/

alter session set nls_language = english;

alter session set nls_territory = 'DENMARK';
/
select *
from   nls_session_parameters t
where  t.parameter = 'NLS_TERRITORY';
/
select to_char(sysdate, 'd') from dual;

select to_char(sysdate, 'DAY') from dual;

/

alter session set nls_territory = TURKEY;

/
select *
from   nls_session_parameters t
where  t.parameter = 'NLS_TERRITORY';
/

alter session set nls_language = turkish;
select to_char(sysdate, 'DAY') from dual;

Select
      To_Char(Current_Date,'DD/MM/YYYY HH24:MI:SS') Current_Date_,
      To_Char(SysDate,'DD/MM/YYYY HH24:MI:SS') SysDate_
From Dual;


Select Current_Date, SysDate
From Dual;

alter session set nls_language = english;
select to_char(sysdate, 'DAY') from dual;

SELECT SYSDATE AS SYSDATE_,
       SYSDATE + 1 AS plus_1_day,
       SYSDATE + 1/24 AS plus_1_hours,
       SYSDATE + 1/24/60 AS plus_1_minutes,
       SYSDATE + 1/24/60/60 AS plus_1_seconds
FROM   dual;

-- ADD_MONTHS
-- ADD_MONTHS(date_expression, month)

SELECT
  ADD_MONTHS( DATE '2016-02-29', 1 )
FROM
  dual;

--
SELECT
  ADD_MONTHS( DATE '2016-02-24', 1 )
FROM
  dual;

--

SELECT
  ADD_MONTHS( DATE '2016-03-31', -1 )
FROM
  dual; 

--

SELECT
  LAST_DAY( ADD_MONTHS(SYSDATE , - 1 ) )
FROM
  dual;

--

Select Trunc(sysdate,'MM') From Dual; -- Ay�n ilk gununu bulur

--

Select ADD_MONTHS( SYSDATE, +6 ) From Dual;
Select ADD_MONTHS( SYSDATE, -6 ) From Dual;
Select ADD_MONTHS( SYSDATE, 8 ) From Dual;

--ORACLE SQL EXAMPLE
SELECT
     SYSDATE,
     ADD_MONTHS(SYSDATE, 1) as Sonuc1,
     LAST_DAY(ADD_MONTHS(SYSDATE, 1)) as Sonuc2,
     SUBStr(LAST_DAY(ADD_MONTHS(SYSDATE, -1)),1,5) as Sonuc3,
     SUBStr(LAST_DAY(ADD_MONTHS(SYSDATE, -1)),1,10) as Sonuc4,
     To_Date(SUBStr(LAST_DAY(ADD_MONTHS(SYSDATE, -1)),1,10),'DD-MM-YYYY') Tarih
FROM DUAL;

-- ADD_MONTHS

Select SYSDATE + interval '8' Month From Dual;

-- Gun, Ay, Y�l, Saat, Dakika,Saniye ekleme i�lemleri
-- Syntax
-- Tarih + interval 'Eklenecek say�� Eklemeturu(DAY,MONTH,YEAR,HOUR,MINUTE,SECOND)

Select sysdate + interval  '1' DAY From Dual;
Select sysdate + interval  '1' MONTH From Dual;
Select sysdate + interval  '1' YEAR From Dual;

Select TO_CHAR(sysdate + interval  '1' HOUR,'DD/MM/YYYY HH24:MI.SS') AS RESULTA
From Dual;

Select TO_CHAR(sysdate + interval  '10' MINUTE,'DD/MM/YYYY HH24:MI.SS') AS RESULTA
From Dual;

Select
      TO_CHAR(sysdate,'DD/MM/YYYY HH24:MI.SS') AS RESULTA,
      TO_CHAR(sysdate + interval  '30' SECOND,'DD/MM/YYYY HH24:MI.SS') AS RESULTB      
From Dual;

--

Select sysdate + interval  '-1' DAY From Dual;
Select sysdate + interval  '-1' MONTH From Dual;
Select sysdate + interval  '-1' YEAR From Dual;

Select TO_CHAR(sysdate + interval  '-1' HOUR,'DD/MM/YYYY HH24:MI.SS') AS RESULTA
From Dual;

Select TO_CHAR(sysdate + interval  '-10' MINUTE,'DD/MM/YYYY HH24:MI.SS') AS RESULTA
From Dual;

Select
      TO_CHAR(sysdate,'DD/MM/YYYY HH24:MI.SS') AS RESULTA,
      TO_CHAR(sysdate + interval  '-30' SECOND,'DD/MM/YYYY HH24:MI.SS') AS RESULTB      
From Dual;

Select sysdate + interval  '1' YEAR From Dual;



-- Sales_Orders tablosundan shippeddate alan? siparisin sevk edildi?i tarihi gostermektedir
-- sevk edilmemi? ise null deger sahiptir
-- sevk edilen ve bekleyen sipari?lerin say?s?n? bulunuz

Select
        shippeddate,
        Case
            When shippeddate is not null Then 'Sevk Edildi'
            Else 'Bekleyen'        
        End as SiparisDurumu
From Sales_Orders;

With A as
(
    Select
            shippeddate,
            Case
                When shippeddate is not null Then 'Sevk Edildi'
                Else 'Bekleyen'        
            End as SiparisDurumu
    From Sales_Orders
)
Select
        SiparisDurumu,
        Count(*) as Sayisi
From A
Group By SiparisDurumu;

-- Yukar?daki sorguyu derived table ile yapal?m

Select
        SiparisDurumu,
        Count(*) as Sayisi
From (
        Select
                shippeddate,
                Case
                    When shippeddate is not null Then 'Sevk Edildi'
                    Else 'Bekleyen'        
                End as SiparisDurumu
        From Sales_Orders
     ) A
Group By SiparisDurumu;

Select
        shipcountry,
        To_Char(orderdate,'YYYY') as Yillar,
        Case
            When shippeddate is not null Then 'Siparis Gonderildi'
            Else 'Siparis Bekliyor'        
        End as SiparisDurumu
From Sales_Orders;

With A as
(
    Select
            shipcountry,
            To_Char(orderdate,'YYYY') as Yillar,
            Case
                When shippeddate is not null Then 'Siparis Gonderildi'
                Else 'Siparis Bekliyor'        
            End as SiparisDurumu
    From Sales_Orders
)
Select SiparisDurumu, Count(*) as SiparisSayisi
From A
Group By SiparisDurumu;

With A as
(
    Select
            shipcountry,
            To_Char(orderdate,'YYYY') as Yillar,
            Case
                When shippeddate is not null Then 'Siparis Gonderildi'
                Else 'Siparis Bekliyor'        
            End as SiparisDurumu
    From Sales_Orders
)
Select SiparisDurumu,shipcountry, Count(*) as SiparisSayisi
From A
Group By SiparisDurumu,shipcountry
Order By 1;

    Select
        NVL2(To_Char(shippeddate,'YYYY'),1,0) as Sonuc,
        Count(*) as Sayisi
    From Sales_Orders
    Group By NVL2(To_Char(shippeddate,'YYYY'),1,0);
    
    Select
        To_Char(shippeddate,'YYYY'),
        NVL2(To_Char(shippeddate,'YYYY'),'Sevkedildi','Bekliyor') as Sonuc        
    From Sales_Orders;
    
    Select        
        NVL2(To_Char(shippeddate,'YYYY'),'Sevkedildi','Bekliyor') as Sonuc,
        Count(*) as Sayisi
    From Sales_Orders
    Group By NVL2(To_Char(shippeddate,'YYYY'),'Sevkedildi','Bekliyor');



With A as
(
    Select
            shipcountry,
            To_Char(orderdate,'YYYY') as Yillar,
            Case
                When shippeddate is not null Then 'Gonderildi'
                Else 'Bekliyor'        
            End as SiparisDurumu
    From Sales_Orders
)
Select shipcountry, SiparisDurumu, Count(*) as SiparisSayisi
From A
Group By SiparisDurumu,shipcountry
Order By 1, 2 desc;

--03102023

Select
        SysDate,
        To_Char(SysDate,'Y') Yil_Kisa_Y,
        To_Char(SysDate,'YY') Yil_Kisa_YY,
        To_Char(SysDate,'YYY') Yil_Kisa_YYY,
        To_Char(SysDate,'YYYY') Yil_Uzun,
        To_Char(SysDate,'YEAR') Yil_ingilizce ,
        To_Char(SysDate,'RR') icinde_bulundugumuz_Asir_Yuzyil_son_iki_hanesi
		--RR Like YY, but the two digits are ``rounded'' to a year in the range 1950 to 2049. Thus, 06 is considered 2006 instead of 1906
From Dual;

/*
Oracle Dates and Times 
Overview
DATE Format
The Current Time
Operations on DATE
Further Information
Overview
Oracle supports both date and time, albeit differently from the SQL2 standard. Rather than using two separate entities, date and time, Oracle only uses one, DATE. The DATE type is stored in a special internal format that includes not just the month, day, and year, but also
the hour, minute, and second.
The DATE type is used in the same way as other built-in types such as INT. For example, the following SQL statement creates a relation with an attribute of type DATE:

create table x(a int, b date);
DATE Format
When a DATE value is displayed, Oracle must first convert that value from the special internal format to a printable string. The conversion is done by a function TO_CHAR, according to a DATE format. Oracle's default format for DATE is "DD-MON-YY". Therefore, when you issue the query
select b from x;
you will see something like:
B
---------
01-APR-98
Whenever a DATE value is displayed, Oracle will call TO_CHAR automatically with the default DATE format. However, you may override the default behavior by calling TO_CHAR explicitly with your own DATE format. For example,
SELECT TO_CHAR(b, 'YYYY/MM/DD') AS b
FROM x;
returns the result:
B
---------------------------------------------------------------------------
1998/04/01
The general usage of TO_CHAR is:
TO_CHAR(<date>, '<format>')
where the <format> string can be formed from over 40 options. Some of the more popular ones include:
  , for example.
MM	Numeric month (e.g., 07)
MON	Abbreviated month name (e.g., JUL)
MONTH	Full month name (e.g., JULY)
DD	Day of month (e.g., 24)
DY	Abbreviated name of day (e.g., FRI)
YYYY	4-digit year (e.g., 1998)
YY	Last 2 digits of the year (e.g., 98)
RR	Like YY, but the two digits are ``rounded'' to a year in the range 1950 to 2049. Thus, 06 is considered 2006 instead of 1906
AM (or PM)	Meridian indicator
HH	Hour of day (1-12)
HH24	Hour of day (0-23)
MI	Minute (0-59)
SS	Second (0-59)
You have just learned how to output a DATE value using TO_CHAR. Now what about inputting a DATE value? This is done through a function called TO_DATE, which converts a string to a DATE value, again according to the DATE format. Normally, you do not have to call TO_DATE explicitly: Whenever Oracle expects a DATE value, it will automatically convert your input string using TO_DATE according to the default DATE format "DD-MON-YY". For example, to insert a tuple with a DATE attribute, you can simply type:

insert into x values(99, '31-may-98');
Alternatively, you may use TO_DATE explicitly:
insert into x
values(99, to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'));
The general usage of TO_DATE is:
TO_DATE(<string>, '<format>')
where the <format> string has the same options as in TO_CHAR.
Finally, you can change the default DATE format of Oracle from "DD-MON-YY" to something you like by issuing the following command in sqlplus:

alter session set NLS_DATE_FORMAT='<my_format>';
The change is only valid for the current sqlplus session.
The Current Time
The built-in function SYSDATE returns a DATE value containing the current date and time on your system. For example,
select to_char(sysdate, 'Dy DD-Mon-YYYY HH24:MI:SS') as "Current Time"
from dual;
returns
Current Time
---------------------------------------------------------------------------
Tue 21-Apr-1998 21:18:27
which is the time when I was preparing this document :-) Two interesting things to note here:
You can use double quotes to make names case sensitive (by default, SQL is case insensitive), or to force spaces into names. Oracle will treat everything inside the double quotes literally as a single name. In this example, if "Current Time" is not quoted, it would have been interpreted as two case insensitive names CURRENT and TIME, which would actually cause a syntax error.
DUAL is built-in relation in Oracle which serves as a dummy relation to put in the FROM clause when nothing else is appropriate. For example, try "select 1+2 from dual;".
Another name for the built-in function SYSDATE is CURRENT_DATE. Be aware of these special names to avoid name conflicts.
Operations on DATE
You can compare DATE values using the standard comparison operators such as =, !=, >, etc.
You can subtract two DATE values, and the result is a FLOAT which is the number of days between the two DATE values. In general, the result may contain a fraction because DATE also has a time component. For obvious reasons, adding, multiplying, and dividing two DATE values are not allowed.

You can add and subtract constants to and from a DATE value, and these numbers will be interpreted as numbers of days. For example, SYSDATE+1 will be tomorrow. You cannot multiply or divide DATE values.

With the help of TO_CHAR, string operations can be used on DATE values as well. For example, to_char(<date>, 'DD-MON-YY') like '%JUN%' evaluates to true if <date> is in June
*/


Select
        SysDate,
        To_Char(SysDate,'HH') HH_,
        To_Char(SysDate,'HH12') HH12_,
        To_Char(SysDate,'HH24') HH24_
From Dual;

Select
        LocalTimeStamp,
        SysDate,
        To_Char(SysDate,'MI') MI_,
        To_Char(SysDate,'SS') SS_,
        To_Char(SysDate,'SSSSS') SSSSS_,
        To_Char(LocalTimeStamp,'FF') FF_
From Dual;

Select
        SysDate,
        To_Char(SysDate,'Q') Q_,
        To_Char(SysDate,'MM') MM_,
        To_Char(SysDate,'MON') MON_,
        To_Char(SysDate,'MONTH') MONTH_,
        To_Char(SysDate,'RM') RM_         -- RM roma rakam� ile kac�nc� ay oldugunu verir
From Dual

Select
        SysDate,
        To_Char(SysDate,'J') J_ -- Milattan once 1 Ocak 4721 tarihinden itibaren kac gun gectigini verir
From Dual;

Select
      To_Char(Current_Date,'DD/MM/YYYY HH24:MI:SS') Current_Date_,
      To_Char(SysDate,'DD/MM/YYYY HH24:MI:SS') SysDate_
From Dual;

/

Alter Session Set Time_Zone = '+2:0';

/
alter session set nls_language = german;
/
select to_char(sysdate, 'd') from dual;
/
select to_char(sysdate, 'd', 'NLS_DATE_LANGUAGE = danish') from dual;
/

alter session set nls_territory = 'DENMARK';
/
select *
from   nls_session_parameters t
where  t.parameter = 'NLS_TERRITORY';
/
select to_char(sysdate, 'd') from dual;

/

alter session set nls_territory = TURKEY;

/
select *
from   nls_session_parameters t
where  t.parameter = 'NLS_TERRITORY';
/
Select
      To_Char(Current_Date,'DD/MM/YYYY HH24:MI:SS') Current_Date_,
      To_Char(SysDate,'DD/MM/YYYY HH24:MI:SS') SysDate_
From Dual;

Select Current_Date, SysDate
From Dual;

--******************************************************
-- JOINS
--******************************************************

-- Natural Join
-- Inner Join
-- Outer Join
  --  Left  Outer Join
  --  Right Outer Join
  --  Full  Outer Join
-- Self Join
-- Cross Join

Select *
From CityJoin;

Select *
From CustomersJoin;


-- natural join
Select *
From CityJoin
natural join CustomersJoin;

-- join(inner join)
Select *
From CityJoin ci
join CustomersJoin cu on cu.cityid = ci.cityid;

-- Left join(Left Outer join)
Select *
From CityJoin ci
left join CustomersJoin cu on cu.cityid = ci.cityid;

Select *
From CityJoin ci
left outer join CustomersJoin cu on cu.cityid = ci.cityid;

-- Right join(Right Outer join)
Select *
From CityJoin ci
Right join CustomersJoin cu on cu.cityid = ci.cityid;

Select *
From CityJoin ci
Right outer join CustomersJoin cu on cu.cityid = ci.cityid;

-- Full join(Full Outer join)
Select *
From CityJoin ci
Full Join CustomersJoin cu on cu.cityid = ci.cityid;

Select *
From CityJoin ci
Full Outer join CustomersJoin cu on cu.cityid = ci.cityid;

Select
        cityname, customername
From CityJoin ci
Full Outer join CustomersJoin cu on cu.cityid = ci.cityid;

Select
        ci.cityname, cu.customername
From CityJoin ci
Full Outer join CustomersJoin cu on cu.cityid = ci.cityid;


-- Cross join
Select *
From CityJoin
Cross Join CustomersJoin;

-- Self Join

Select *
From employees e1
join employees e2 on e1.manager_id = e2.employee_id;

Select
        e1.employee_id,
        e1.first_name || ' ' || e1.last_name as EmployeeName,
        e2.employee_id,
        e2.first_name || ' ' || e2.last_name as ManagerName        
From employees e1
join employees e2 on e1.manager_id = e2.employee_id
Order By e1.employee_id;

Select
        e1.employee_id,
        e1.first_name || ' ' || e1.last_name as EmployeeName,
        e2.employee_id,
        e2.first_name || ' ' || e2.last_name as ManagerName        
From employees e1
Left join employees e2 on e1.manager_id = e2.employee_id
Order By e1.employee_id;

--******************************************************
-- Natural Join
--******************************************************
-- iki tablo aras�nda AYNI ISME SAHIP KOLONLAR uzerinde yap�l�r
-- her iki kolonda ayn� veri tipinde olmal�d�r
-- farkl� veri tipinde olursa hata verir
-- Bu yaz�m sekli ANSI FORMAT'tad�r

--**********************************************************************
-- Ornek Tablo Olustural�m
/*
-- Drop Table CustomersJoin;
-- Drop Table CityJoin;
-- Drop Table CustomersJoin_Salary;

Create Table CustomersJoin
(
	CustomerID Number,
	CityID Number,
	CustomerName varchar2(100)
)
/
Create Table CityJoin
(
	CityID Number,
	CityName varchar2(100)
)
/

--Dosyaya insert edelim

Insert Into CustomersJoin(CustomerID, cityID, CustomerName) Values (1, 1,	'Bob Smith');
Insert Into CustomersJoin(CustomerID, cityID, CustomerName) Values (2, 1,	'Sally Smith');
Insert Into CustomersJoin(CustomerID, cityID, CustomerName) Values (3, 2,	'Tom Smith');
Insert Into CustomersJoin(CustomerID, cityID, CustomerName) Values (4, Null, 'Mary Smith');
/
Insert Into CityJoin(CityID, CityName)  Values (1, 'Kansas City');
Insert Into CityJoin(CityID, CityName)  Values (2, 'Newyork');
Insert Into CityJoin(CityID, CityName)  Values (3, 'Houston');
/

--Self Join

Create Table CustomersJoin_Salary
(
	CustomerID Number,
	CityID Number,
	CustomerName varchar2(100),
  Salary number
)
/

--Dosyaya insert edelim

Insert Into CustomersJoin_Salary(CustomerID, cityID, CustomerName,Salary) Values (1, 1,	'Bob Smith',2000);
Insert Into CustomersJoin_Salary(CustomerID, cityID, CustomerName,Salary) Values (2, 1,	'Sally Smith',1500);
Insert Into CustomersJoin_Salary(CustomerID, cityID, CustomerName,Salary) Values (3, 2,	'Tom Smith',3000);
Insert Into CustomersJoin_Salary(CustomerID, cityID, CustomerName,Salary) Values (4, Null, 'Mary Smith',4000);
/

Commit;

--**************
*/

Desc Employees;
Desc Departments;

Select *
From Employees;

Select *
From Departments;

Select *
From Employees Natural Join Departments;

Desc Employees;

Create Table jobs as
Select *
From hr.jobs;

Desc Jobs;

Select *
From Employees Natural Join Jobs;

-- ANSI FORMAT

Select
      Employee_id,
      First_Name,
      Job_id,
      Job_Title
From Employees Natural Join Jobs;

-- GELENEKSEL FORMAT

Select
      Employee_id,
      First_Name,
      Employees.Job_id,
      Job_Title
From Employees, Jobs
Where Employees.Job_id = Jobs.Job_id;

Select
      e.Employee_id,
      e.First_Name,
      e.Job_id,
      j.Job_Title
From Employees e, Jobs j
Where e.Job_id = j.Job_id;

-- Sales_Orders, hr_employees, Sales_customers tablolar?n?
-- hem ansi hemde  geleneksel formatta birle?tiriniz
-- custid, companyname, firstname, lastname, orderid, orderdate, freight, shipcountry
-- bilgileri gelsin

-- ansi formatta yapal?m

Select
        c.custid,
        c.companyname,
        e.firstname, 
        e.lastname,
        o.orderid, 
        o.orderdate,
        o.freight,
        o.shipcountry
From Sales_Orders o
join hr_employees e on e.empid = o.empid
join Sales_customers c on c.custid = o.custid;

-- ansi formatta yapal?m

Select
        c.custid,
        c.companyname,
        e.firstname, 
        e.lastname,
        o.orderid, 
        o.orderdate,
        o.freight,
        o.shipcountry
From 
        Sales_Orders o, hr_employees e, Sales_customers c
Where   
        o.custid = c.custid and
        o.empid = e.empid;

Create Table Regions as
Select *
From hr.regions;

Create Table Countries as
Select *
From hr.Countries;

Create Table Locations as
Select *
From hr.Locations;


Select * From Regions r;
Select * From Countries c;
Select * From Locations l;

--

Select * From Regions r;
Select * From Countries c;

Select * 
From Locations
natural join Countries
natural join Regions;

-- Geleneksel Format

Select
      r.Region_id,
      r.Region_Name,
      c.Country_id,
      c.Country_Name,
      l.City
From Regions r, Countries c, Locations l
Where r.Region_id  = c.Region_id(+) and
      c.Country_id = l.Country_id(+)
Order By 1,3;

Select
      r.Region_id,
      r.Region_Name,
      c.Country_id,
      c.Country_Name,
      l.City
From Regions r, Countries c, Locations l
Where r.Region_id  = c.Region_id(+) and
      c.Country_id = l.Country_id(+) and
      l.City is null      
Order By 1,3;

-- Ansi Format
Select
      r.Region_id,
      r.Region_Name,
      c.Country_id,
      c.Country_Name,
      l.City
From
                      Regions r
      Left Outer Join Countries c on r.Region_id  = c.Region_id
      Left Outer Join Locations l on c.Country_id  = l.Country_id
Order By 1,3;

Select
      r.Region_id,
      r.Region_Name,
      c.Country_id,
      c.Country_Name,
      l.City
From
                Regions r
      Left Join Countries c on r.Region_id  = c.Region_id
      Left Join Locations l on c.Country_id  = l.Country_id
Order By 1,3;


Select *
From      Customersjoin  cu
Left join Cityjoin       ci on ci.Cityid = cu.Cityid;


--******************************************************
  --  Right Outer Join(Outer kullan�ma tercihe bagl�d�r)
--******************************************************

-- Geleneksel Format

Select
      r.Region_id,
      r.Region_Name,
      c.Country_id,
      c.Country_Name,
      l.City
From Locations l, Countries c, Regions r
Where c.Region_id(+)  = r.Region_id and
      l.Country_id(+) = c.Country_id
Order By 1,3;

Select
      r.Region_id,
      r.Region_Name,
      c.Country_id,
      c.Country_Name,
      l.City
From Locations l, Countries c, Regions r
Where r.Region_id   = c.Region_id(+)and
      c.Country_id  = l.Country_id(+)
Order By 1,3;

-- Ansi Format

Select
      r.Region_id,
      r.Region_Name,
      c.Country_id,
      c.Country_Name,
      l.City
From
           Locations  l
Right Join Countries  c on c.Country_id   = l.Country_id
Right Join Regions    r on r.Region_id    = c.Region_id
Order By 1,3;

Select *
From       Customersjoin  cu
Right join Cityjoin       ci on ci.Cityid = cu.Cityid;

Create User Ornek1 identified by Ornek1;

Grant connect, resource to Ornek1;

Grant All Privileges to Ornek1;

--******************************************************
  --  Full Outer Join(Outer kullan�ma tercihe bagl�d�r)
--******************************************************

-- Ornek1 ile connect olal�m

-- Departments tablosundan 2 tane tablo olustural�m

-- Drop Table Dept1;
-- Drop Table Dept2;
Create Table Dept1 as
Select *
  From hr.Departments 
  Where Department_id <= 50;

Create Table Dept2 as
Select *
  From hr.Departments
  Where Department_id <= 30 or Department_id in(90,100,110);
  
-- Ansi Format

Select * From Dept1;
Select * From Dept2;

Select
      d1.DEPARTMENT_ID "Dept1_id",
      d1.DEPARTMENT_NAME "Dept1_Name",
      d2.DEPARTMENT_ID "Dept2_id",
      d2.DEPARTMENT_NAME "Dept2_Name"
From Dept1 d1
join Dept2 d2 on d1.Department_id = d2.Department_id;

Select
      d1.DEPARTMENT_ID "Dept1_id",
      d1.DEPARTMENT_NAME "Dept1_Name",
      d2.DEPARTMENT_ID "Dept2_id",
      d2.DEPARTMENT_NAME "Dept2_Name"
From      Dept1 d1
Left join Dept2 d2 on d1.Department_id = d2.Department_id;        

Select
      d1.DEPARTMENT_ID "Dept1_id",
      d1.DEPARTMENT_NAME "Dept1_Name",
      d2.DEPARTMENT_ID "Dept2_id",
      d2.DEPARTMENT_NAME "Dept2_Name"
From       Dept1 d1
Right join Dept2 d2 on d1.Department_id = d2.Department_id; 

Select
      d1.DEPARTMENT_ID "Dept1 id",
      d1.DEPARTMENT_NAME "Dept1 Name",
      d2.DEPARTMENT_ID "Dept2 id",
      d2.DEPARTMENT_NAME "Dept2 Name"
From      Dept1 d1
Full join Dept2 d2 on d1.Department_id = d2.Department_id; 

Select
      d1.DEPARTMENT_ID "Dept1 id",
      d1.DEPARTMENT_NAME "Dept1 Name",
      d2.DEPARTMENT_ID "Dept2 id",
      d2.DEPARTMENT_NAME "Dept2 Name"
From            Dept1 d1
Full Outer join Dept2 d2 on d1.Department_id = d2.Department_id;

Select *
From      Customersjoin  cu
Full join Cityjoin       ci on ci.Cityid = cu.Cityid;


-- Geleneksel Format
-- Geleneksel Left Join ile Geleneksel Right Join sorgular�
-- Union ile birlestirilerek bulunur

Select * From Dept1;
Select * From Dept2;

-- Geleneksel Left Join
Select
      d1.DEPARTMENT_ID "Dept1 id",
      d1.DEPARTMENT_NAME "Dept1 Name",
      d2.DEPARTMENT_ID "Dept2 id",
      d2.DEPARTMENT_NAME "Dept2 Name"
From  Dept1 d1, Dept2 d2 
Where d1.Department_id = d2.Department_id(+)

Union

-- Geleneksel Right Join

Select
      d1.DEPARTMENT_ID "Dept1 id",
      d1.DEPARTMENT_NAME "Dept1 Name",
      d2.DEPARTMENT_ID "Dept2 id",
      d2.DEPARTMENT_NAME "Dept2 Name"
From  Dept1 d1, Dept2 d2
Where d1.Department_id(+) = d2.Department_id;

--******************************************************
-- Self Join
--******************************************************
-- Geneleksel Self Join

Select
      e1.Employee_id,
      e1.First_Name || ' ' || e1.Last_Name "Employee Name",
      e1.Manager_id,
      e2.First_Name || ' ' || e2.Last_Name "Manager Name"
From Employees e1, Employees e2
Where e1.Manager_id = e2.Employee_id
Order By 1;

Select
      e1.Employee_id,
      e1.First_Name || ' ' || e1.Last_Name "Employee Name",
      e1.Manager_id,
      NVL2(e2.First_Name || e2.Last_Name,e2.First_Name || ' ' || e2.Last_Name,'CEO') "Manager Name"
From Employees e1, Employees e2
Where e1.Manager_id = e2.Employee_id(+)
Order By 1;

-- Ansi Self Join
Select
      e1.Employee_id,
      e1.First_Name || ' ' || e1.Last_Name "Employee Name",
      e1.Manager_id,
      e2.First_Name || ' ' || e2.Last_Name "Manager Name"
From Employees e1
Join Employees e2 on e1.Manager_id = e2.Employee_id
Order By 1;

Select
      e1.Employee_id,
      e1.First_Name || ' ' || e1.Last_Name "Employee Name",
      e1.Manager_id,
      e2.First_Name || ' ' || e2.Last_Name "Manager Name"
From      Employees e1
Left Join Employees e2 on e1.Manager_id = e2.Employee_id
Order By 1;

/*
Select
      e1.Employee_id,
      e1.First_Name || ' ' || e1.Last_Name "Employee Name",
      e1.Manager_id,
      e2.First_Name || ' ' || e2.Last_Name "Manager Name"
From      Employees e1
Full Join Employees e2 on e1.Manager_id = e2.Employee_id
Order By 1;
*/

--***********************************************************
-- Cross Join
--***********************************************************

-- Geleneksel Format
Select * From Dept1 d1;
Select * From Dept2 d2;

Select *
From Dept1 d1, Dept2 d2;

Select * From CustomersJoin;
Select * From CityJoin;

Select *
From CustomersJoin cu, CityJoin ci;

-- Ansi Format

Select *
From Dept1 d1 Cross Join Dept2 d2;

Select *
From CustomersJoin cu Cross Join CityJoin ci;

-- herbir personel'in toplam qty miktarlar?n? ve qty * unitprice toplamlar?n? bulunuz
-- Tablolar: Sales_Orders, hr_employees, sales_orderdetails

Select
        o.orderid,
        e.firstname,
        e.lastname,
        od.qty,
        od.unitprice,
        od.qty * od.unitprice as SatirBazliTotalQtyUnitprice
From Sales_Orders       o
join hr_employees       e   on  e.empid     = o.empid
join Sales_orderdetails od on   od.orderid  = o.orderid;

--

Select
        e.firstname || ' ' || e.lastname as FullName,
        Sum(od.qty) as TotalQty,
        Sum(od.qty * od.unitprice) as TotalQtyPrice
From Sales_Orders       o
join hr_employees       e   on  e.empid     = o.empid
join Sales_orderdetails od on   od.orderid  = o.orderid
Group By
        e.firstname,
        e.lastname;
        
-- natural join ile Using Kullan?m?
-- 2 tablo birle?tirelim yapal?m

Select *
From Sales_Orders o
join hr_employees e using(empid);


-- 3 tablo birle?tirelim yapal?m

Select *
From Sales_Orders o
join hr_employees e using(empid)
join Sales_customers c using(custid);

--******************************************************
-- SubQueries ( Alt Sorgular)
--******************************************************
-- Kolon Seviyesinde SubQuery
-- Table Seviyesinde SubQuery
-- Where Conditions icerisinde SubQuery

-- Kolon Seviyesinde SubQuery

Select
      e.employee_id,
      e.first_name,
      e.last_name,
      Department_id
From Employees e;

Select *
From  Departments d;

            Select department_name
            From  Departments d
            Where department_id = 10;

Select
      e.employee_id,
      e.first_name,
      e.last_name,
      e.Department_id,
      (
            Select department_name
            From  Departments d
            Where department_id = e.Department_id
      ) as BolumAdi
From Employees e;

       
Select
      e.employee_id,
      e.first_name,
      e.last_name,
      (Select Department_Name
        From  Departments d
        Where d.department_id = e.department_id
       ) Department_Name
From Employees e;

-- Yukar�daki sorguyu join ilede alabiliriz
-- Join performans olarak daha iyi, SubQuery performans� etkiler,
-- SubQuery ile okunan page say�s� artmaktad�r, bu nedenle performans icin join daha iyi

Select
      e.employee_id,
      e.first_name,
      e.last_name,
      Department_Name
From Employees e
Join Departments d on d.department_id = e.department_id;

-- herbir personelin toplamfreight?n? bulunuz

Select
        e.empid,
        e.firstname,
        e.lastname,
        ('aaaa') as TotalEmployeeFreight
From hr_employees e;

        Select sum(o.freight) as TotalFreight
        From Sales_Orders o
        Where o.empid = 1;

Select
        e.empid,
        e.firstname,
        e.lastname,
        (
            Select sum(o.freight) as TotalFreight
            From Sales_Orders o
            Where o.empid = e.empid
        ) as TotalEmployeeFreight,
        (
            Select sum(o.freight) as GenelToplam
            From Sales_Orders o
        ) as TotalAllFreight        
From hr_employees e;

-- Yukar?daki SubQuery sorgusu i�erindeki
-- Asagidaki ornekte oldugu gibi
-- Aliaslar? yazmayabiliriz

Select
        e.empid,
        e.firstname,
        e.lastname,
        (
            Select sum(o.freight)
            From Sales_Orders o
            Where o.empid = e.empid
        ) as TotalEmployeeFreight,
        (
            Select sum(o.freight)
            From Sales_Orders o
        ) as TotalAllFreight        
From hr_employees e;

Select
        e.empid,
        e.firstname,
        e.lastname,
        (
            Select sum(o.freight)
            From Sales_Orders o
            Where o.empid = e.empid
        ) as TotalEmployeeFreight
From hr_employees e
Order By 2;

-- Yukar?daki sorguyu join ilede yapabiliriz

Select
        e.firstname,
        e.lastname,
        Sum(o.freight) as TotalEmployeeFreight
From hr_employees e
join Sales_Orders o on o.empid = e.empid
Group By
        e.firstname,
        e.lastname
Order By 1;

Select * From Departments;
Select * From employees;

-- Table Seviyesinde SubQuery

Select *
From (
        Select
              r.Region_id,
              r.Region_Name,
              c.country_id,
              c.Country_Name
        From Regions    r
        join Countries  c on c.region_id = r.region_id
     ) BU
Where BU.Region_Name = 'Europe';

-- Yukar�daki sorguyu join ile Locations tablosuna baglayal�m

Select
      b.Region_id,
      b.Region_Name,
      b.Country_Name,
      l.City
From (
        Select
              r.Region_id,
              r.Region_Name,
              c.country_id,
              c.Country_Name
        From Regions    r
        join Countries  c on c.region_id = r.region_id
     ) b
join Locations l on l.Country_id = b.Country_id;

-- Where Conditions icerisinde SubQuery

-- Ornek 1
-- Employees tablosunda David Lee isimli kisiden sonra ise girenleri listeleyelim
Select *
From Employees
Where Hire_Date >  (
                    Select Hire_Date
                    From Employees
                    Where first_name = 'David' and Last_Name = 'Lee'
                   );


Select *
From Employees
Where Hire_Date > '23/02/2008';


Select *
From Employees
Where Hire_Date > '23-02-2008';

Select *
From Employees
Where Hire_Date > TO_DATE('23-02-2008','DD/MM/YYYY');

Select
        employee_id,
        first_name,
        TO_CHAR(Hire_Date,'DD/MM/YYYY') as IseGirisTarihi1,
        TO_CHAR(Hire_Date,'DD MON YYYY') as IseGirisTarihi2,
        TO_CHAR(Hire_Date,'DD MONTH YYYY') as IseGirisTarihi3
From Employees
Where Hire_Date > TO_DATE('23/02/2008','DD/MM/YYYY');

-- Ornek 2
-- Ad� Jonathon ve Soyad� Taylor olan kisinin
-- Unvan� ile ayn� olup Taylor'dan daha fazla maas alanlar� listeleyelim
-- Tablo: employees
Select
      Employee_id,
      First_Name,
      Last_Name,
      Job_id,
      Salary
From Employees
Where First_Name = 'Jonathon' And Last_Name = 'Taylor';

Select
      Employee_id,
      First_Name,
      Last_Name,
      Job_id,
      Salary
From Employees
Where Job_id = 'SA_REP' and Salary > '8600';

-- Kosulu simdi SubQuery ile yazal�m

Select
      Employee_id,
      First_Name,
      Last_Name,
      Job_id,
      Salary
From Employees
Where Job_id = (
                  Select Job_id
                  From Employees
                  Where First_Name = 'Jonathon' And Last_Name = 'Taylor'
                ) and
      Salary > (
                  Select Salary
                  From Employees
                  Where First_Name = 'Jonathon' And Last_Name = 'Taylor'                
                );
                
-- Ornek 3
-- Employees tablosunda en dusuk maas alan kisiyi/kisileri bulan sorguyu yaz�n�z

Select
      Employee_id,
      First_Name,
      Last_Name,
      Job_id,
      Salary
From Employees
Where Salary in (
                  Select Min(Salary)
                  From Employees
                );

Select
      Employee_id,
      First_Name,
      Last_Name,
      Job_id,
      Salary,
      department_id
From Employees
Where Salary = (
                  Select Min(Salary)
                  From Employees
                );
                

-- Ornek 4
-- Yukar�daki sorguda Department_Name alan�n� SubQuery ile bulal�m

Select
      Employee_id,
      First_Name,
      Last_Name,
      Job_id,
      Salary,
      ( Select Department_Name
        From Departments d 
        Where d.department_id = e.Department_id
       ) Dept_Name
From Employees e
Where Salary in (
                  Select Min(Salary)
                  From Employees
                );                
                
-- Having seviyesinde SubQuery

-- Ornek 5
-- Minimum maa?? 50 nolu departman?n minimum maasindan
-- yuksek olan tum departmanlar? getiriniz


Select
      Department_id,
      Min(Salary) as MinSalary 
From Employees e
Group By Department_id
Having Min(Salary) >  (
                        Select Min(Salary)
                        From Employees
                        Where department_id = 50
                      )
Order By 1;
                

-- Yukar�daki sorguyu Where ile cozmek baska bir anlam tas�maktad�r
-- 50 numara yeniden gelmektedir
-- Asl�nda Where kosulu ile Having kosulu farkl� calismaktad�r
-- Tabi ki once soruyu anlamam�z gerekiyor

Select
      Department_id,
      Min(Salary) as MinSalary 
From Employees e
Where Salary > (
                  Select Min(Salary)
                  From Employees
                  Where department_id = 50
                )
Group By Department_id
Order By 1;


-- USA ulkesinde calisanlar?n siparislerini
-- Sales_orders tablosundan listeleyiniz

Select *
From Sales_Orders
Where empid in(1,2,3,4,8);

Select *
From Sales_Orders
Where empid in(
                    Select empid
                    From hr_employees
                    Where country = 'USA'                
              );

-- Update ile SubQuery Kullan�m�
-- Ornek 6
-- 60 nolu bolumde calisanlarin maaslarini
-- 50 nolu bolumde calisanlarin EN BUYUK maasi ile esitleyelim
-- Once Employee tablosunun bir kopyas�n� olustural�m

Create Table Employee_Update as
Select * From Employees;


Select * From Employee_Update;

Select
      Department_id,
      First_Name,
      Last_Name,
      Salary
From Employee_Update
Where Department_id = 60;

Select Max(Salary)
From Employee_Update
Where Department_id = 50;

Update Employee_Update
Set Salary = (Select Max(Salary)
              From Employee_Update
              Where Department_id = 50
             )
Where Department_id = 60;

Commit;

Select
      Department_id,
      First_Name,
      Last_Name,
      Salary
From Employee_Update
Where Department_id = 60;

-- Delete ile SubQuery Kullan�m�
-- Ornek 7
-- Soyad�(Last__Name) tekrar eden kay�tlardan
-- sadece bir tanesi kals�n, digerlerini silelim
-- Once foreign keylere tak�lmamak icin
-- Employee tablosunun bir kopyas�n� olustural�m

Create Table Employee_Delete as
Select * From Employees;

Select * From Employee_Delete;

-- Rowid  : Veri taban� icerisinde tutulan verilerin/datalar�n
-- fiziksel adresleri vard�r
-- Rowid verilerin/datalar�n fiziksel adreslerini tutar ve 10 Byte alan tutar
-- Tablolar� Select ettigimizde Rowid kolonu normalde gozukmez

Select
      Last_Name,
      Salary,
      Rowid
From Employee_Delete
Order By Last_Name;

-- Rowid ile bir kayda en h�zl� erisim saglan�r

Select
      Last_Name,
      Count(*)
From Employee_Delete
Group By Last_Name
Having Count(*) > 1;

Select
      Rowid,
      Last_Name      
From Employee_Delete
Where Rowid not in (
                      Select Max(Rowid)
                      From Employee_Delete
                      Group By Last_Name                      
                    );

-- Yani yukaridaki kay�tlar�n silinmesi gerekiyor
Delete From Employee_Delete
Where Rowid not in (
                      Select Max(Rowid)
                      From Employee_Delete
                      Group By Last_Name                      
                    );


-- Tekrar bakal�m tekrar eden var m�?

Select
      Rowid,
      Last_Name      
From Employee_Delete
Where Rowid not in (
                      Select Max(Rowid)
                      From Employee_Delete
                      Group By Last_Name                      
                    );

-- Evet Last_Name ayn� olan birden fazla tekrar eden kay�tlar� sildik                    
-- baska bir ornek ile ac?klayalam

Create Table PersonelEkim
(
    id number,
    isim Varchar2(30)
);

insert into PersonelEkim(id,isim) Values(1,'Yusuf');
insert into PersonelEkim(id,isim) Values(2,'Erkut');
insert into PersonelEkim(id,isim) Values(3,'Eren');
insert into PersonelEkim(id,isim) Values(4,'Berk');
insert into PersonelEkim(id,isim) Values(5,'Seyda');
insert into PersonelEkim(id,isim) Values(6,'Yusuf');
insert into PersonelEkim(id,isim) Values(7,'Berk');
Commit;

Select * From personelekim;

Select Rowid, isim
From PersonelEkim;

Select Max(Rowid)
From PersonelEkim
Group By isim;


Select Rowid, isim
From PersonelEkim
Where rowid not in
                    (
                        Select Max(Rowid)
                        From PersonelEkim
                        Group By isim
                    );

-- ?imdi yukar?daki sorguya delete yapal?m

Delete PersonelEkim
Where rowid not in
                    (
                        Select Max(Rowid)
                        From PersonelEkim
                        Group By isim
                    );
Commit;

Select *
From PersonelEkim;

-- Yani yukaridaki kay�tlar�n silinmesi gerekiyor
Delete From Employee_Delete
Where Rowid not in (
                      Select Max(Rowid)
                      From Employee_Delete
                      Group By Last_Name                      
                    );
                    
-- Tekrar yapal?m

insert into PersonelEkim(id,isim) Values(1,'Yusuf');
insert into PersonelEkim(id,isim) Values(6,'Yusuf');
insert into PersonelEkim(id,isim) Values(7,'Berk');
Commit;

Select * From personelekim;

Select Rowid, isim
From PersonelEkim;

Select Max(Rowid)
From PersonelEkim
Group By isim;


Select Rowid, isim
From PersonelEkim
Where rowid not in
                    (
                        Select Max(Rowid)
                        From PersonelEkim
                        Group By isim
                    );

-- ?imdi yukar?daki sorguya delete yapal?m

Delete PersonelEkim
Where rowid not in
                    (
                        Select Max(Rowid)
                        From PersonelEkim
                        Group By isim
                    );
Commit;

Select *
From PersonelEkim;

-- PL/SQL
-- OOP (Object Oriented Programmind) => Nesne Tabanl� Programlamay� destekler

-- Terminoloji

-- PL /SQL (Oracle Database)
-- TSQL (SQL Database)
-- PL/pgSQL (PostgreSQL Database)

-- ** Oracle PL/SQL
--** Calisma ortam�n�n haz�rlanmas�
-- Oncelikle on kontrollerin yap�lmas� gerekir

-- Min 2 GB free RAM (%40 of Total RAM) olmas� gerekiyor
-- Dolay�s�yla 5 GB olursa bunun %40'� 'GB yapar
-- Yani en az 5 GB RAM ihtiyac�m�z var
-- 10 GB Hard Disk'te yer olmas� gerekir

-- Egitimlerde Oracle19c kullanacagimiz icin
-- CPU mimarisi EM64T veya AMD64 gerekli

-- Ekran kart� minimum 1024*768 olmal�d�r

-- Bilgisayar ismi ve kullan�c� isminde bosluk ve Turkce karakterler olmamal�d�r
-- Setup Local Administrator grubunda olmal�d�r
-- Bilgisayar ismine ve Kullan�c� ismine bakal�m

-- cmd> hostname ile bilgisayar ad�n� ogreniriz
-- cmd> whoami ile kullan�c� ad�n� ogreniriz

/*

-- PL /SQL (Oracle Database)
-- -- PL /SQL Kod Yap�s�

/*
DECLARE (istege bagl�)
...
BEGIN (zorunlu)
  ...Calisabilir kod
    EXCEPTION (istege bagl�) hata kontrolu icin kullan�l�r
      ...
END (zorunlu)
*/

-- Types of PL /SQL Block
-- PL /SQL Block Turleri
    -- A) Unnamed Block : Veritaban�nda saklanmaz, calisma s�ras�nda derlenir ve cal�st�r�l�r
    -- B) Named Block   : Veritaban�nda saklan�r, Derlenmis hali cal�st�r�l�r
    --                    (Stored Procedure, Function)
    


-- PL / SQL ile ilk program�m�z yazal�m
-- cmd'ye baglanal?m
-- >sqlplus ile baglanal�m    
-- sqlplus / as sysdba;
-- veya
-- sqlplus sys/sys as sysdba;

-- sqlplus i�erisinde
-- conn hr/HR; diyerekte hr'a baglan?r?z
-- yani conn username/password; girilecektir

/*
yazacag�m�z kod Unnamed Block - Anonymous Block tipindedir
buradan c�kt�g�m�zda saklanmaz

SQL>Begin
SQL>DBMS_OUTPUT.PUT_LINE('Merhaba Dunya');
SQL>End;
SQL>/ veya r harfine basar�z sonra Enter

SERVEROUTPUT parametresi off durumundad�r bunu oncelikle acalim
SQL>Set SERVEROUTPUT ON; -- Acar
-- SQL>Set SERVEROUTPUT OFF; -- Kapatir

SQL>Set SERVEROUTPUT ON; -- Bu parametre ile c�kt�n�n gozukmesi icin parametreyi acalim



SQL>ed ile en son calisan bufferdeki sorguyu acabiliriz
SQL>Begin
DBMS_OUTPUT.PUT_LINE('Merhaba Dunya! Ben Geldim');
End;
seklinde kaydedelim ve

SQL>/ ile calistiralim


-- simdi degisken ile ayn� kodu yazal�m

SQL>Declare
SQL>WMessage Varchar2(100);

SQL>Begin
SQL>WMessage:='Merhaba Dunya,Hello World'; 
SQL>DBMS_OUTPUT.PUT_LINE(WMessage);
SQL>End;
SQL>/ veya r harfine basar�z sonra Enter

-- simdi ayn� islemi SQL Developer ile yapal�m

*/

Set SERVEROUTPUT On;

Begin
    DBMS_OUTPUT.PUT_LINE('Merhaba Dunya,Hello World');
End;

Declare
Begin
    DBMS_OUTPUT.PUT_LINE('Merhaba Dunya,Hello World');
End;


Declare
WMessage Varchar2(100);

Begin
WMessage:='Merhaba Dunya,Hello World'; 
DBMS_OUTPUT.PUT_LINE(WMessage);
End;


-- Cikti sonucunu gormemiz icin SERVEROUTPUT parametresini ON yapal�m/ON/OFF)

Set SERVEROUTPUT ON;
----- GELINEN Yer
--
Declare
WMessage Varchar2(100);

Begin
WMessage:='Merhaba Dunya,Hello World'; 
DBMS_OUTPUT.PUT_LINE(WMessage);
End;

-- SQL Kurulumu esnas�nda Sample Schemas tab�nda Add Sample Schemas to the database'i secmistik
-- Bu bize HR isimli kullan�c� alt�nda ornekleri yukleyecektir
-- Normalde HR kullan�c�s� kilitlidir buna baglant� yapmak istersek hata al�r�z
-- Kilitli olan bir kullan�c�y� acmak icin Alter komutunu kullanacagiz
-- sqlplus ile SYS veya SYSTEM olarak baglanal�m

--SQL>sqlplus sys/sys as sysdba;
-- Show user
-- Alter User KullaniciAdi IDENTITY BY KullaniciSifresi ACCOUNT Lock;--(veya Unlock)
-- Alter User HR IDENTITY BY HR ACCOUNT LOCK;   -- Veya
-- Alter User HR IDENTITY BY HR ACCOUNT UNLOCK; -- burada identity yerine identified yazal�m

-- Bu komutla hem hesab�n sifresini HR olarak degistiriyoruz hemde unlock yap�yoruz
-- Alter User hr identified by hr account lock; -- bu hesab� kilitler
-- Alter User hr identified by hr account unlock; -- bu hesab�n kilidini acar


-- SYS kullan�c�s� ile baglan�rsak

Alter User hr identified by hr account lock; -- bu ise hesab� kilitler
Alter User hr identified by hr account unlock; -- bu hesab�n kilidini acar

-- ornek
-- icinde bulundugumuz gunun ismini ekrana yazan bir program yazal�m

Set SERVEROUTPUT ON;
-- ya bu sekilde acar�z veya
-- View > DBMS OUTPUT secerek acariz
-- View > DBMS OUTPUT secerek acarsak gelen ekranda Yesil Art�'ya t�klayal�m
-- ve HR icin ekran� acmas�n� saglayal�m



-- ornek
-- icinde bulundugumuz gunun ismini ekrana yazan bir program yazal�m

Set SERVEROUTPUT ON;
-- ya bu sekilde acar�z veya
-- View > DBMS OUTPUT secerek acariz
-- View > DBMS OUTPUT secerek acarsak gelen ekranda Yesil Art�'ya t�klayal�m
-- ve HR icin ekran� acmas�n� saglayal�m

Declare
    WGun Varchar2(50);
Begin
    WGun:= To_Char(Sysdate,'DAY');
    DBMS_OUTPUT.PUT_LINE('Bugun ' || WGun);
End;


Begin
    DBMS_OUTPUT.PUT_LINE('Bugun ' || To_Char(Sysdate,'DAY'));
End;
-- Bilginin farkli dillerde gelmesi icin Tools>Preferences>Database>NLS>Date Languages alt�nda dillerden ayarlan�r
-- Named Block icin ornek yapal�m

-- ornek
-- icinde bulundugumuz gunun ismini ekrana yazan bir program yazal�m

-- Set SERVEROUTPUT ON;



Create or Replace Function fnc_Get_Day_Name(P_Tarih Date)
Return Varchar2
is

Begin
   Return(To_Char(P_Tarih,'DAY'));    
End;

/

Select fnc_Get_Day_Name(SYSDATE)
From Dual;

Select 'Bugun '  || fnc_Get_Day_Name(SYSDATE)
From Dual;

-- veya su sekilde de cal�st�rabiliriz

Declare
    WGun Varchar2(50);
Begin
    WGun:= fnc_Get_Day_Name(SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Bugun: ' || WGun);
End;

--04102023

Set ServerOutput ON;

Begin
    DBMS_OUTPUT.Put_Line('Merhaba, PL/SQL egitimine hos geldiniz!!!');
End;
/
Declare
Begin
    DBMS_OUTPUT.Put_Line('Merhaba, PL/SQL egitimine hos geldiniz!!!');
End;
/
Declare
    Elma Varchar2(100);
Begin
    Elma:= 'Merhaba, PL/SQL egitimine hos geldiniz!';
    DBMS_OUTPUT.Put_Line(Elma);
End;
/
Begin
    DBMS_OUTPUT.PUT_LINE('Bugun ' || To_Char(Sysdate,'DAY'));
End;
/
Declare
 GunBilgisi Varchar2(100);
Begin
    GunBilgisi:= 'Bugun Gunlerden: ' || To_Char(Sysdate,'DAY');
    DBMS_OUTPUT.PUT_LINE(GunBilgisi);
End;
/
Set ServerOutPut ON;
/
Declare
 AyBilgisi Varchar2(100);
Begin
    AyBilgisi:= 'Bugun Aylardan: ' || To_Char(Sysdate,'MONTH');
    DBMS_OUTPUT.PUT_LINE(AyBilgisi);
End;
/
Declare
 AyBilgisi Varchar2(100);
 GunBilgisi Varchar2(100);
 
Begin
    AyBilgisi:= 'Bugun Aylardan: ' || To_Char(Sysdate,'MONTH');
    GunBilgisi:= 'Bugun Gunlerden: ' || To_Char(Sysdate,'DAY');
    DBMS_OUTPUT.PUT_LINE(AyBilgisi);
    DBMS_OUTPUT.PUT_LINE(GunBilgisi);
    
    DBMS_OUTPUT.PUT_LINE(AyBilgisi || GunBilgisi);
    
End;
/
/*

    Create or Replace Function FoknsiyonAdi(Parametre ve  Turu)
    Return DonecekTipi
    is
    
    Begin
            Return(DonecekBilgi);    
    End;

*/
/
    Create or Replace Function Fn_AyBilgisi(P_Tarih Date)
    Return Varchar2
    is
    
    Begin
            Return(To_Char(P_Tarih,'Month'));    
    End;
/

Select
        sysdate,
        Fn_AyBilgisi(sysdate)
From Dual;
/
    Create or Replace Function Fn_GunBilgisi(P_Tarih Date)
    Return Varchar2
    is
    
    Begin
            Return(To_Char(P_Tarih,'Day'));    
    End;
/

Select
        sysdate,
        Fn_AyBilgisi(sysdate),
        Fn_GunBilgisi(sysdate)
From Dual;
/

-- Exception Handler Section
-- (Hata Yakalama Bolumu)

-- Hata Turleri
  --1) Compile Error(Derleme Esnas�nda)
  --2) Runtime Error(Calisma Esnas�nda)

-- Exception Handler Section ile calisma yapacagiz
-- Bu nedenle Runtime Error(Calisma Esnas�nda) ile ilgilenecegiz


-- Exception Block
/
Create or Replace Function fnc_Bolme( A in Number, B in Number)
Return Number
is
C Number; -- C degiskeni Declare ediyoruz
Begin
      C:= A/B;
      Return(C);
End;
/
Select fnc_Bolme(10,2) From Dual;
/

-- Anonymous Block ile yapal�m

Declare
  D Number;
Begin

    D:= fnc_Bolme(10,2);
    DBMS_OUTPUT.PUT_Line(D);
End;

-- simdi hata meydana getirelim
/
Select fnc_Bolme(10,0) From Dual;
/
-- Anonymous Block ile yapal�m

Declare
  D Number;
Begin

    D:= fnc_Bolme(10,0);
    DBMS_OUTPUT.PUT_Line(D);
End;
/
-- Burada hatadan dolay� sonucu gormek icin Exception ile hata kontrolu yapal�m

Declare
  D Number;
Begin

    D:= fnc_Bolme(10,0);
    DBMS_OUTPUT.PUT_Line(D);
    Exception When Zero_Divide Then
      DBMS_OUTPUT.PUT_Line('0 ile bolme yap�lamaz'); -- veya hata kodunu yazd�ral�m
      DBMS_OUTPUT.PUT_Line('Hata turu: ' || SQLERRM);
End;
/
Declare
  D Number;
Begin

    D:= fnc_Bolme(10,2);
    DBMS_OUTPUT.PUT_Line(D);
    Exception When Zero_Divide Then
      DBMS_OUTPUT.PUT_Line('0 ile bolme yap�lamaz'); -- veya hata kodunu yazd�ral�m
      DBMS_OUTPUT.PUT_Line('Hata turu: ' || SQLERRM);
End;
/

-- Simdi Exception Block ile ilgili bir ornek daha yapal�m
-- Departments tablosunda department_id gonderelim ve department_name alal�m

Select DEPARTMENT_NAME From Departments Where Department_id = 10;

-- Bunu bir function ile yazal�m


/
Create or Replace Function fnc_BolumAdi(P_Bolum_id in Number)
Return Varchar2
is
  wBolumAdi Varchar2(100);
Begin

  Select DEPARTMENT_NAME into wBolumAdi
  From Departments
  Where Department_id = P_Bolum_id;
  
  Return(wBolumAdi);
End;
/
Select fnc_BolumAdi(10) From Dual;
/
Select fnc_BolumAdi(20) From Dual;
/
Select fnc_BolumAdi(1000) From Dual;
/

/
Create or Replace Function fnc_Department_Name(P_Department_id in Number)
Return Varchar2
is
  wDepartName Varchar2(100);
Begin
  Select DEPARTMENT_NAME into wDepartName From Departments Where Department_id = P_Department_id;
    Return(wDepartName);
End;
/
-- 
Select fnc_Department_Name(10) From Dual;
Select fnc_Department_Name(20) From Dual;


-- Unnamed Block yani Anonymous olarak yapal�m

Set SERVEROUTPUT ON;

Declare
  wMessage Varchar2(100);
Begin
  wMessage:= fnc_Department_Name(10);
  DBMS_OUTPUT.PUT_LINE(wMessage);
End;
/
-- simdide yukar�daki function icin Exception meydana getirelim
-- olmayan bir bolumu sorgulayal�m
Set SERVEROUTPUT ON;
/
Declare
  wMessage Varchar2(100);
Begin
  wMessage:= fnc_Department_Name(2);
  DBMS_OUTPUT.PUT_LINE(wMessage);
End;

-- Exception yazmadigimiz icin hata kontrol edilmemis oluyor
-- Simdi Exception ile kontrol altina alalim
-- Bunu function icinde yapal�m

Create or Replace Function fnc_Department_Name(P_Department_id in Number)
Return Varchar2
is
  wDepartName Varchar2(100);
Begin
  Select DEPARTMENT_NAME into wDepartName From Departments Where Department_id = P_Department_id;
    Return(wDepartName);
    Exception When NO_DATA_FOUND Then
      Return(P_Department_id || ' Nolu Bolum Bulunamadi');
End;

--

Declare
  wMessage Varchar2(100);
Begin
  wMessage:= fnc_Department_Name(2);
  DBMS_OUTPUT.PUT_LINE(wMessage);
    
End;
/
Select fnc_Department_Name(30) From Dual;
Select fnc_Department_Name(2) From Dual;

Select fnc_Department_Name(100) From Dual;
/
-- SQL Developer icerisinde Turkce sorun ile karsilasirsak
-- Regedit icerisinde NLS_LANG arattiralim

-- Karsimiza gelen yerde ayarlardaki data degerin P9 ile bitmesi gerekiyor
-- Bende AMERICAN_AMERICA.WE8MSWIN1252 kay�tl� c�k�yor
-- Sizde su sekilde de olabilir
-- AMERICAN_AMERICA.WE8ISO8859P9
-- TURKISH_TURKISH.WE8ISO8859P9 gibi

-- PL / SQL Data Types
  -- A) Scalar Data Types(Char, Varchar2, Number, Boolean, PLS_Integer, Binary_Integer,...)
  -- B) Large Object Data Types(BLOB, CLOB, LONG)
  -- C) Reference Data Types(%TYPE, %ROWTYPE) 
  -- D) Composite(Collections)
        -- (Defined(User-Defined) veri tipleridir,
        -- Diger veri tiplerinden faydalan�larak, yeni ver tipleri ya da veri tip kolleksiyonu olu�turabiliriz)


--*********************************************************************************************
-- A) Scalar Data Types(Char, Varchar2, Number, Boolean, PLS_Integer, Binary_Integer,...)
--*********************************************************************************************

Set ServerOutput ON;


-- Char, Varchar2

Declare
  wAdi    Char(15);
  wSoyadi Varchar2(15);
Begin
  wAdi    := 'Ali';
  wSoyadi := 'TOPACIK';
  
  
  DBMS_OUTPUT.PUT_LINE(wAdi);
  DBMS_OUTPUT.PUT_LINE(wSoyadi);
  DBMS_OUTPUT.PUT_LINE(wAdi || ' ' || wSoyadi);
  
  DBMS_OUTPUT.PUT_LINE('*' || wAdi || '*');
  DBMS_OUTPUT.PUT_LINE('*' || wSoyadi || '*');
  DBMS_OUTPUT.PUT_LINE('*' || wAdi || '#' || '*' || wSoyadi || '*');
  
  DBMS_OUTPUT.PUT_LINE('*' || wAdi || '* Uzunluk:' || Length(wAdi));
  DBMS_OUTPUT.PUT_LINE('*' || wSoyadi || '* Uzunluk:' || Length(wSoyadi));

End;

-- PLS_Integer, Binary_Integer, Number

-- PLS_Integer, Binary_Integer, OverFlow(Asiri Yuklenme)
-- PLS_Integer Max alabilecegi deger 2147483647

Set SERVEROUTPUT ON;

Declare
  p1  PLS_INTEGER:= 120;  -- Baslang�c atamalar� Declare k�sm�nda yap�labilir
  p2  PLS_INTEGER:= 99;
  
  n1 NUMBER;
Begin
  n1:= p1 + p2;
  
  DBMS_OUTPUT.PUT_LINE(n1);
  DBMS_OUTPUT.PUT_LINE(To_Char(n1,'999,999,999,999.99'));
 
End;

--

Declare
  p1  PLS_INTEGER;  -- Baslang�c atamalar� Declare k�sm�nda yap�labilir
  p2  PLS_INTEGER;
  
  n1 NUMBER;
Begin
  p1:= 222;
  p2:= 100;
  
  n1:= p1 + p2; -- Toplama isi yaparken toplamay� once p1 ve p2 aras�nda yapar
                -- Bunlardan hangisi uygunsa onun uzerine ekler ve sonra n'ye atar                  
  
  DBMS_OUTPUT.PUT_LINE(n1);
  DBMS_OUTPUT.PUT_LINE(To_Char(n1,'999,999,999,999.99'));
 
End;
/
-- simdi Overflow yapal�m

Declare
  p1  PLS_INTEGER;  -- Baslang�c atamalar� Declare k�sm�nda yap�labilir
  p2  PLS_INTEGER;
  
  n1 NUMBER;
Begin
  p1:= 2147483647;  -- PLS_Integer Max alabilecegi deger 2147483647
  p2:= 1;
  n1:= p1 + p2; -- Toplama isi yaparken toplamay� once p1 ve p2 aras�nda yapar
                -- Bunlardan hangisi uygunsa onun uzerine ekler ve sonra n'ye atar                  
                -- Burada PLS_Integer Max alabilecegi deger 2147483647 oldugu icin
                -- buna 1 eklerse max s�n�r� asiyor ve overflow meydana geliyor
  DBMS_OUTPUT.PUT_LINE(n1);
  DBMS_OUTPUT.PUT_LINE(To_Char(n1,'999,999,999,999.99'));
 
End;

-- p2 degiskenini number yapal�m ve sonucu gorelim
-- number degiskeni daha fazla deger alabildigi icin
-- p1(PLS_INTEGER) icerigini p2(NUMBER) icinde toplar ve overflow olmadan sonuc verir

Declare
  p1  PLS_INTEGER;  -- Baslang�c atamalar� Declare k�sm�nda yap�labilir
  p2  NUMBER;
  
  n1 NUMBER;
Begin
  p1:= 2147483647;  -- PLS_Integer Max alabilecegi deger 2147483647
  p2:= 1;
  n1:= p1 + p2; -- Toplama isi yaparken toplamay� once p1 ve p2 aras�nda yapar
                -- Bunlardan hangisi uygunsa onun uzerine ekler ve sonra n'ye atar                  
                -- Burada PLS_Integer Max alabilecegi deger 2147483647 oldugu icin
                -- buna 1 eklerse max s�n�r� asiyor ve overflow meydana geliyor
  DBMS_OUTPUT.PUT_LINE(n1);
  DBMS_OUTPUT.PUT_LINE(To_Char(n1,'999,999,999,999.99'));
 
End;

-- Simdi de BINARY_INTEGER inceleyelim
-- BINARY_INTEGER Max alabilecegi deger 2147483647
-- PLS_INTEGER; BINARY_INTEGER'e gore daha guclu bir yap�ya sahiptir
-- p1(BINARY_INTEGER) icerigini p2(BINARY_INTEGER) kendi icinde
-- uygun olanda toplar

Declare
  p1  BINARY_INTEGER;  -- Baslang�c atamalar� Declare k�sm�nda yap�labilir
  p2  BINARY_INTEGER;
  
  n1 NUMBER;
Begin
  p1:= 2147483646;  -- BINARY_INTEGER Max alabilecegi deger 2147483647
  p2:= 1;
  n1:= p1 + p2; -- Toplama isi yaparken toplamay� once p1 ve p2 aras�nda yapar
                -- Bunlardan hangisi uygunsa onun uzerine ekler ve sonra n'ye atar                  
  
  DBMS_OUTPUT.PUT_LINE(n1);
  DBMS_OUTPUT.PUT_LINE(To_Char(n1,'999,999,999,999.99'));
 
End;

-- Simdi de BINARY_INTEGER'da Overflow yapal�m
-- p1(BINARY_INTEGER) icerigini p2(BINARY_INTEGER) kendi icinde
-- uygun olanda toplar ve overflow meydana verir

Declare
  p1  BINARY_INTEGER;  -- Baslang�c atamalar� Declare k�sm�nda yap�labilir
  p2  BINARY_INTEGER;
  
  n1 NUMBER;
Begin
  p1:= 2147483647;  -- BINARY_INTEGER Max alabilecegi deger 2147483647
  p2:= 1;
  n1:= p1 + p2; -- Toplama isi yaparken toplamay� once p1 ve p2 aras�nda yapar
                -- Bunlardan hangisi uygunsa onun uzerine ekler ve sonra n'ye atar                  
                -- Burada BINARY_INTEGER Max alabilecegi deger 2147483647 oldugu icin
                -- buna 1 eklerse max s�n�r� asiyor ve overflow meydana geliyor
  DBMS_OUTPUT.PUT_LINE(n1);
  DBMS_OUTPUT.PUT_LINE(To_Char(n1,'999,999,999,999.99'));
 
End;

-- Simdi de p2 degiskenini Number yapal�m ve bakal�m
-- p1(BINARY_INTEGER) icerigini p2(MUMBER) kendi icinde
-- uygun olanda toplar ve overflow hatas� olmadan sonuc verir

Declare
  p1  BINARY_INTEGER;  -- Baslang�c atamalar� Declare k�sm�nda yap�labilir
  p2  NUMBER;
  
  n1 NUMBER;
Begin
  p1:= 2147483647;  -- BINARY_INTEGER Max alabilecegi deger 2147483647
  p2:= 1;
  n1:= p1 + p2; -- Toplama isi yaparken toplamay� once p1 ve p2 aras�nda yapar
                -- Bunlardan hangisi uygunsa onun uzerine ekler ve sonra n'ye atar                  
                -- Burada BINARY_INTEGER Max alabilecegi deger 2147483647 oldugu icin
                -- buna 1 eklerse max s�n�r� asiyor ve overflow meydana geliyor
  DBMS_OUTPUT.PUT_LINE(n1);
  DBMS_OUTPUT.PUT_LINE(To_Char(n1,'999,999,999,999.99'));
 
End;
/
--*********************************************************************************************
-- C) Reference Data Types(%TYPE, %ROWTYPE) 
--*********************************************************************************************

--*********************Reference Data Types****************************************************
-- %TYPE      -- Referans al�nan tablonun kolonuyla dinamik olarak ayn� olmas�n� saglar
-- %ROWTYPE   -- Referans al�nan tablo veya View ile dinamik olarak ayn� olmas�n� saglar
-- Sorgunun her ikisinide de tek sat�r veri vermesi gerekir


-- %TYPE      -- Referans al�nan tablonun kolonuyla dinamik olarak ayn� olmas�n� saglar

-- Departments tablosundan Department_id'si 10 olan kay�tlar� listeleyelim

Desc Departments;

Declare
    wDEPARTMENT_ID   NUMBER(4);
    wDEPARTMENT_NAME VARCHAR2(30);
    wMANAGER_ID      NUMBER(6);
    wLOCATION_ID     NUMBER(4);
Begin
  Select * into wDEPARTMENT_ID, wDEPARTMENT_NAME, wMANAGER_ID, wLOCATION_ID
  From Departments
  Where Department_id = 10;
  
  DBMS_OUTPUT.PUT_LINE(wDEPARTMENT_ID || ' ' || wDEPARTMENT_NAME || ' ' || wMANAGER_ID || ' ' || wLOCATION_ID);

End;

-- Yukar�daki kod blogu calisacakt�r
-- Ancak departments tablosundaki herhangi bir kolonun
-- veritipi veya uzunlugu degistiginde hata meydana gelir
-- yani departments tablosundaki Department_name(30) alan�n ihtiyac halinde 
-- uzunlugu  Department_name(35) oldu diyelim
-- Bu durumda Yukar�daki Declare icerisinde Department_name(30) oldugu icin
-- Program interrupt olacakt�r
-- Bu tur hatalar�n olmamas� icin %TYPE kullanabiliriz

Declare
    wDEPARTMENT_ID   Departments.DEPARTMENT_ID%TYPE;
    wDEPARTMENT_NAME Departments.DEPARTMENT_NAME%TYPE;
    wMANAGER_ID      Departments.MANAGER_ID%TYPE;
    wLOCATION_ID     Departments.LOCATION_ID%TYPE;
Begin
  Select * into wDEPARTMENT_ID, wDEPARTMENT_NAME, wMANAGER_ID, wLOCATION_ID
  From Departments
  Where Department_id = 10;
  
  DBMS_OUTPUT.PUT_LINE(wDEPARTMENT_ID || ' ' || wDEPARTMENT_NAME || ' ' || wMANAGER_ID || ' ' || wLOCATION_ID);

End;


-- %ROWTYPE   -- Referans al�nan tablo veya View ile dinamik olarak ayn� olmas�n� saglar

Declare
    r_Dept Departments%ROWTYPE;
Begin
  Select * into r_Dept
  From Departments
  Where Department_id = 10;
  
  DBMS_OUTPUT.PUT_LINE( r_Dept.DEPARTMENT_ID || ' ' ||
                        r_Dept.DEPARTMENT_NAME || ' ' ||
                        r_Dept.MANAGER_ID || ' ' ||
                        r_Dept.LOCATION_ID
                      );
End;
/

/*
  wDEPARTMENT_ID   NUMBER(4);                       -- Klasik Yontem
  wDEPARTMENT_ID   Departments.DEPARTMENT_ID%TYPE;  -- %TYPE Yontemi
  r_Dept Departments%ROWTYPE;                       -- %ROWTYPE Yontemi

-- Klasik Yontem %TYPE ve %ROWTYPE yontemlerine gore daha performansl�d�r

-- %TYPE yontemi %ROWTYPE yontemine gore daha iyidir
-- sebebi ise referans al�nan tabloda yeni bir kolon eklendiginde
-- %ROWTYPE tum kolonlar� donderdiginden bu durum hataya sebep olabilir

*/

--*********************************************************************************************
-- D) Composite(Collections)
--*********************************************************************************************

-- COMPOSITE(Collection) Data Types
-- Developer Defined veya User Defined Veri Tipleri olarak bilinir
-- Record Type ile ilgilenecegiz

-- Asagidaki sorguda *not enough values* hatas� al�r�z
-- Cunku Select * ile 4 kolon geliyor biz ise 3 kolon yazd�k
-- Bunun icin sutun adlar�n� teker teker yazmam?z gerekir
-- Select * yerine sutun adlar?n? belirtmek birinci tercihimiz olmal?d?r

Declare
    Type t_dept is Record(
                          DEPT_ID    NUMBER(4),
                          DEPT_NAME  Departments.Department_name%Type,
                          MANAGER_ID Departments.Manager_id%Type Not Null Default 0 -- Constraint eklenebilir
                         );
    r_dept2 t_dept;
Begin
  Select * into r_dept2
  From Departments
  Where Department_id = 10;
  
  DBMS_OUTPUT.PUT_LINE( r_dept2.DEPT_ID || ' ' ||
                        r_dept2.DEPT_NAME || ' ' ||
                        r_dept2.MANAGER_ID
                      );
End;

-- Bunun icin sutun adlar�n� teker teker yazmam?z gerekir
-- Select * yerine sutun adlar?n? belirtmek birinci tercihimiz olmal?d?r

/

Declare
    Type t_dept is Record(
                          DEPT_ID    NUMBER(4),
                          DEPT_NAME  Departments.Department_name%Type,
                          MANAGER_ID Departments.Manager_id%Type Not Null Default 0 -- Constraint eklenebilir
                         );
    r_dept2 t_dept;
Begin
  Select DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID into r_Dept2
  From Departments
  Where Department_id = 10;
  
  DBMS_OUTPUT.PUT_LINE( r_Dept2.DEPT_ID || ' ' ||
                        r_Dept2.DEPT_NAME || ' ' ||
                        r_Dept2.MANAGER_ID
                      );
End;

-- Simdi yukaridaki sorgu calisacaktir
--*********************************************************************************************
-- SQL Language Statements
-- PL/SQL icinde kullan�mlar�

--*********************************************************************************************
-- DDL(Create, Alter ve Drop) ve DCL(Grant, Revoke) komutlar�
    -- DYNAMIC SQL(Execute Immediate) oldugundan PL/SQL icerisinde direk/Dogrudan kullan�lamazlar
    -- Bu komutlar� Execute Immediate komutu ile kullabiliriz
    
-- DML(Select, Insert, Update ve Delete) ve TCL(Commit ve Rollback) komutlar� ise
    -- STATIC SQL oldugu icin PL/SQL icerisinde kullan�labilirler



-- STATIC SQL Kullan�m�
  -- (DML, TCL, Savepoint)

-- Dynamic SQL Kullan�m�(DDL, DCL)
  -- (Execute Immediate)
  
-- Pseudocolumns Kullan�m�  -- Takma Ad anlam�ndad�r
  -- (Currval, Nextval) (Sequence)
  
--*********************************************************************************************
-- STATIC SQL Kullan�m�
  -- (DML, TCL, Savepoint)
--*********************************************************************************************
Desc Employees;
/

Create Table Employees2 as
Select * From Employees;
/
Select * From Employees2;
/
Declare
    emp_id            employees2.employee_id%TYPE;
    emp_first_Name    employees2.first_Name%TYPE  := 'Ali';
    emp_Last_Name     employees2.Last_Name%TYPE   := 'TOPACIK';
    emp_email         employees2.email%TYPE   := 'alitopacik@gmail.com';
    emp_Hire_Date     employees2.Hire_Date%TYPE   := '21-11-1973';
    emp_job_id        employees2.job_id%TYPE      := 'PL/SQL';
Begin

  Select NVL(Max(employee_id),0) + 1 into emp_id
  From Employees2;
  
  insert into Employees2(employee_id, first_Name, Last_Name, email, Hire_Date, job_id)
               Values(emp_id, emp_first_Name, emp_Last_Name, emp_email, emp_Hire_Date, emp_job_id);

  Update Employees2
  Set job_id = 'DBA'
  Where Employee_id = emp_id;

/*
  Delete Employees2
  Where Employee_id = emp_id
  Returning employee_id, first_Name, Last_Name, email, Hire_Date, job_id
       into emp_id, emp_first_Name, emp_Last_Name, emp_email, emp_Hire_Date, emp_job_id;
*/


  -- Rollback;
  Commit;
       
  dbms_OUTPUT.PUT_LINE(emp_id || ' ' ||
                       emp_first_Name || ' ' ||
                       emp_Last_Name || ' ' ||
                       emp_email || ' ' ||
                       emp_Hire_Date || ' ' ||
                       emp_job_id);
  
End;
/
Select * From Employees2 Order By 1 Desc;
/
/
Declare
    emp_id            employees2.employee_id%TYPE;
    emp_first_Name    employees2.first_Name%TYPE  := 'Ali';
    emp_Last_Name     employees2.Last_Name%TYPE   := 'TOPACIK';
    emp_email         employees2.email%TYPE   := 'alitopacik@gmail.com';
    emp_Hire_Date     employees2.Hire_Date%TYPE   := '21-11-1973';
    emp_job_id        employees2.job_id%TYPE      := 'PL/SQL';
Begin

  Select NVL(Max(employee_id),0) + 1 into emp_id
  From Employees2;
  
  insert into Employees2(employee_id, first_Name, Last_Name, email, Hire_Date, job_id)
               Values(emp_id, emp_first_Name, emp_Last_Name, emp_email, emp_Hire_Date, emp_job_id);


  -- Rollback;
  Commit;
       
  dbms_OUTPUT.PUT_LINE(emp_id || ' ' ||
                       emp_first_Name || ' ' ||
                       emp_Last_Name || ' ' ||
                       emp_email || ' ' ||
                       emp_Hire_Date || ' ' ||
                       emp_job_id);
  
End;
/
Select * From employees2 Order By 1 desc;
/
Declare
    emp_id            employees2.employee_id%TYPE;
    emp_first_Name    employees2.first_Name%TYPE  := 'Ali';
    emp_Last_Name     employees2.Last_Name%TYPE   := 'TOPACIK';
    emp_email         employees2.email%TYPE   := 'alitopacik@gmail.com';
    emp_Hire_Date     employees2.Hire_Date%TYPE   := '21-11-1973';
    emp_job_id        employees2.job_id%TYPE      := 'ETL';
Begin

  Select NVL(Max(employee_id),0) + 1 into emp_id
  From Employees2;
  
  insert into Employees2(employee_id, first_Name, Last_Name, email, Hire_Date, job_id)
               Values(emp_id, emp_first_Name, emp_Last_Name, emp_email, emp_Hire_Date, emp_job_id);


   Rollback;
  --Commit;
       
  dbms_OUTPUT.PUT_LINE(emp_id || ' ' ||
                       emp_first_Name || ' ' ||
                       emp_Last_Name || ' ' ||
                       emp_email || ' ' ||
                       emp_Hire_Date || ' ' ||
                       emp_job_id);
  
End;
/
Select * From employees2 Order By 1 desc;
/
--*** SavePoint ===> istenilen noktaya RollBack yapmak icin kullan�l�r *********************

Desc Regions;

-- Regions tablosunun bos bir kopyas�n� olustural�m
/
Create Table RegionsB as
Select *
From Regions
Where 1=2;
/
--

Select * From RegionsB;
/
-- simdi kodumuzu yazal�m ve Savepoint inceleyelim

Begin
    insert into RegionsB(Region_id, Region_Name) Values(1, 'Avrupa');
    SavePoint A;

    insert into RegionsB(Region_id, Region_Name) Values(2, 'Asya');
    SavePoint B;

    Update RegionsB
    Set Region_Name = 'Asia'
    Where Region_id = 2;
    SavePoint C;

    Delete From RegionsB Where Region_id = 2;
    
    -- RollBack;       -- Tum islemleri iptal eder    
    -- "  -- A noktas�ndan sonra olan tum islemleri iptal eder
    -- RollBack To B;  -- B noktas�ndan sonra olan tum islemleri iptal eder
    -- RollBack To C;  -- C noktas�ndan sonra olan tum islemleri iptal eder
    --Commit;
end;
/
-- RollBack;
/
Select * From RegionsB;
/
Delete From RegionsB;
Commit;
/
--*********************************************************************************************
-- Dynamic SQL Kullan�m�(DDL, DCL)
  -- (Execute Immediate)
--*********************************************************************************************


-- Drop Table OrnekTablo;
/
Set ServerOutPut On;
/
Declare

Begin
  
    Execute Immediate 'Create Table OrnekTablo(Urun_id Number(10), Urun_Adi Varchar2(50))';
    
    dbms_output.put_line('Tablo olusturuldu');

End;
/
Desc OrnekTablo;
/
-- Yukar�da Create islemi yapt�k
-- Simdi yukar�daki sorguyu parametrik yapal�m

-- Drop Table OrnekTablo;

Declare
    ddl_komut Varchar2(2000);
Begin
    ddl_komut:= 'Create Table OrnekTablo(Urun_id Number(10), Urun_Adi Varchar2(50))';
    Execute Immediate ddl_komut;
    
    dbms_output.put_line('Tablo olusturuldu');

End;
/
Desc OrnekTablo;
/

-- Yukar�da Create islemi yapt�k, Simde de Alter Yapal�m

Declare
    ddl_komut Varchar2(2000);
Begin
    ddl_komut:= 'Alter Table OrnekTablo Add Miktar Number(10,2)';
    Execute Immediate ddl_komut;
    
    dbms_output.put_line('Tablo Alter Edildi');

End;
/
Desc OrnekTablo;
/

-- System ile baglanal�m
-- AliT3 User olustural�m ve buna yetki verelim

Declare
    ddl_Create Varchar2(2000);
    ddl_Grant Varchar2(2000);
Begin
    ddl_Create:= 'Create User Yaren1 identified by Yaren1';
    Execute Immediate ddl_Create;

    ddl_Grant:= 'Grant Connect, Resource, Unlimited TABLESPACE To Yaren1';
    Execute Immediate ddl_Grant;
    
    dbms_output.put_line('Yaren1 User olusturuldu ve yetki verildi');
End;
/
-- Simdi Yaren1 User?na sol ust taraftaki yesil Art? ile baglanalim

-- OracleData user?na baglanal?m

-- Yaren1 user icin OrnekTablo'ya Select yetkisi verelim

Declare
    ddl_komut Varchar2(2000);
Begin
    ddl_komut:= 'Grant Select On OrnekTablo To Yaren1';
    Execute Immediate ddl_komut;

    dbms_output.put_line('OrnekTablo icin Yaren1 user''ina SELECT yetkisi verildi');
End;

-- Yaren1 user'�na Employees tablosu icin Select yetkisi verelim

Declare
    ddl_komut Varchar2(2000);
Begin
    ddl_komut:= 'Grant Select On Employees To Yaren1';
    Execute Immediate ddl_komut;

    dbms_output.put_line('Employees icin Yaren1 user''ina SELECT yetkisi verildi');

End;

-- Simdi Yaren1 User ile baglanal�m

Select * From OracleData.OrnekTablo;
Select * From OracleData.Employees;

-- Simdi de Yaren1 kullan�c�s�na verile OrnekTablo yetkisini geri alal�m
-- Simdi OracleData User ile baglanal�m

Declare
    ddl_komut Varchar2(2000);
Begin
    ddl_komut:= 'Revoke Select On OrnekTablo From Yaren1';
    Execute Immediate ddl_komut;

    dbms_output.put_line('Yaren1 user''�n�n OrnekTablo''daki Select yetkisi al�nd�');
End;

-- Simdi Yaren1 User ile baglanal�m

Select * From OracleData.OrnekTablo;
Select * From OracleData.Employees;

-- Simdi OracleData User ile baglanal�m
-- OrnekTablo tablosunu drop edelim

Declare
    ddl_komut Varchar2(2000);

Begin
    ddl_komut:= 'Drop Table OrnekTablo';
    Execute Immediate ddl_komut;

    dbms_output.put_line('OrnekTablo Tablosu drop edildi');
End;
/
Desc OracleData.OrnekTablo;
/
Desc OracleData.Employees;
/
-- OracleData userina baglanal?m

--*********************************************************************************************
-- Pseudocolumns Kullan�m�  -- Takma Ad anlam�ndad�r
  -- (Currval, Nextval) (Sequence)
  -- Sequence===> Say� uretecleri
--*********************************************************************************************

Desc Regions;
/

Select * From Regions;

Create Sequence test_seqA Start With 6 increment by 1;
/
--

Declare

Begin
      insert into Regions(Region_id, Region_Name) Values(test_seqA.NextVal, 'Antartica');
      --RollBack;
      Commit;

End;
/
Select test_seqA.CurrVal From Dual;
/
Select * From Regions;

-- Sequenceleri yukar�daki gibi kullanmak performansl� degildir
-- su sekilde kullan�rsak daha iyi
-- Bir degisken tan�mlar�z. bu sekilde kullan�m tum versiyonlarda gecerlidir
-- Direk olaran values icerisinde veya esitligin saginda test_seqA.NextVal kullanmak
-- hem performansl� degil hem tum versiyonlarda kullan�lmaz

-- ornek seq_num ve buna deger atar�z(seq_num:= test_seqA.NextVal) 
-- Degiskene atama ile kullanmak hem performansl� hemde tum versiyonlarda kullan�labilir
/
Declare
    seq_num Number;

Begin
      seq_num:= test_seqA.NextVal;
      insert into Regions(Region_id, Region_Name) Values(seq_num, 'Amerika');
      
      
      seq_num:= test_seqA.CurrVal;
      Update Regions
      Set Region_Name = 'America'
      Where Region_id = seq_num;    
      
      --RollBack;
      Commit;

End;
/
Select test_seqA.CurrVal From Dual;
/
Select * From Regions;
/
--*********************************************************************************************
-- Conditional Control Statements
-- (Kosullu Akis Kontrolleri)
--*********************************************************************************************

--  IF
-- CASE


--  IF
    -- If Then
    -- If Then Else
    -- If ThenIf

-- CASE
    -- Simple Case
    -- Searched Case    
/*
If Condition_1 Then
                  Statements_1;
End if;                  

--

If Condition_1 Then
                  Statements_1;
Else
                  Statements_2;
End if;

--

If Condition_1 Then
                  Statements_1;
ElsIf Condition_2 Then
                  Statements_2;
ElsIf Condition_3 Then
                  Statements_3;
Else
                  Statements_4;
End if;

--

-- CASE
-- Simple Case

Case Selector
    When Selector_Value_1 Then Statements_1
    When Selector_Value_2 Then Statements_2
    ...
    When Selector_Value_n Then Statements_n
    [Else else_Statements]
End Case;


Searched Case   

Case 
    When Condition_1 Then Statements_1
    When Condition_2 Then Statements_2
    ...
    When Condition_n Then Statements_n
    [Else else_Statements]
End Case;

*/

-- Kosullu Akis Kontrolleri If


Declare
    DogumTarihi   Date;
    Yasi          Number(3);
Begin
    DogumTarihi:= To_Date('21/11/2010','dd/mm/yyyy');
    Yasi:= (SysDate - DogumTarihi)/365;
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz
    if Yasi < 15 Then
        dbms_output.put_line('Ben 15 yas�ndan kucugum, Yasim: ' || Yasi);
    End if;
End;

/

Declare
    DogumTarihi   Date;
    Yasi1          Number;
    Yasi2          Number(3);
Begin
    DogumTarihi:= To_Date('21/11/2010','dd/mm/yyyy');
    Yasi1:= SysDate - DogumTarihi;
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz
    dbms_output.put_line(Yasi1);
    
    --DogumTarihi:= To_Date('21/11/1999','dd/mm/yyyy');
    Yasi1:= (SysDate - DogumTarihi)/365;
    
    --DogumTarihi:= To_Date('21/11/1999','dd/mm/yyyy');
    Yasi2:= (SysDate - DogumTarihi)/365;
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz

    dbms_output.put_line(Yasi1);
    dbms_output.put_line(Yasi2);    
    
    
    if Yasi2 < 15 Then
        dbms_output.put_line('Ben 15 yas�ndan kucugum, Yasim: ' || Yasi2);
    End if;
End;
/
-- Kosullu Ak�� Kontrolleri if-then-else

Declare
    DogumTarihi   Date;
    Yasi          Number(3);
Begin
    DogumTarihi:= To_Date('21/11/1999','dd/mm/yyyy');
    Yasi:= (SysDate - DogumTarihi)/365;
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz
    if Yasi < 15 Then
        dbms_output.put_line('Ben 15 yas�ndan kucugum, Yasim: ' || Yasi);
    Else
        dbms_output.put_line('Ben 15 yas�ndan Buyugum, Yasim: ' || Yasi);
    End if;
End;

/
-- Kosullu Ak�� Kontrolleri if-then-elseif

Declare
    DogumTarihi   Date;
    Yasi          Number(3);
    
Begin

    DogumTarihi:= To_Date('21/11/2002','dd/mm/yyyy');
    Yasi:= (SysDate - DogumTarihi)/365;
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz
    if Yasi < 15 Then
        dbms_output.put_line('Ben 15 yas�ndan kucugum, Yasim: ' || Yasi);
        dbms_output.put_line('Bayramlar� Severim');
        dbms_output.put_line('Begin-End Blogu zorunlu degildir');
    Elsif Yasi < 30 Then
    Begin
        dbms_output.put_line('Ben 16-30 yas� aras�nday�m, Yasim: ' || Yasi);
        dbms_output.put_line('Begin-End Blogu zorunlu degildir');
    End;
    Elsif Yasi < 50 Then
        dbms_output.put_line('Ben 31-50 yas� aras�nday�m, Yasim: ' || Yasi);
    Else
        dbms_output.put_line('Ben 50 Yasindan Buyugum, Sayg? Beklerim, Yasim: ' || Yasi);
    
    End if;

End;

/

/
-- Kosullu Ak�� Kontrolleri if Nested (i� i�e if kullan�m�)

Declare
    DogumTarihi   Date;
    Yasi          Number(3);  
Begin
    DogumTarihi:= To_Date('21/11/1996','dd/mm/yyyy');
    Yasi:= (SysDate - DogumTarihi)/365;
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz
    if Yasi < 15 Then
        dbms_output.put_line('Ben 15 yas�ndan kucugum, Yasim: ' || Yasi);
    Elsif Yasi < 30 Then
          dbms_output.put_line('Ben 16-30 yas� aras�nday�m, Yasim: ' || Yasi);
        
        if Yasi >= 23 Then
          dbms_output.put_line('Ve Nested if icin ornek, 23-30 yas� aras�nday�m, Yasim: ' || Yasi);        
        End if;
    Elsif Yasi < 50 Then
        dbms_output.put_line('Ben 31-50 yas� aras�nday�m, Yasim: ' || Yasi);
    Else
        dbms_output.put_line('Ben 50 Yasindan Buyugum, Yasim: ' || Yasi);  
    End if;
End;
/

--*********************************************************************************************
-- Kosullu Ak�� Kontrolleri *** CASE(Simple Case - Searched Case)
--*********************************************************************************************
Set SERVEROUTPUT ON;
-- Simple Case:
-- Bir say�n�n tek mi yoksa cift mi oldugunu bulan kod yazal�m

Declare
      Sayi    Number:= 12;
      Mesaj   Varchar2(2000);
Begin
   Case Mod(Sayi,2)
        When 1 Then Mesaj:= 'Tek Say�, Sayimiz: ' || Sayi;
        Else Mesaj:= 'Cift Say�, Sayimiz: ' || Sayi;
        -- Sayinin 2 ye bolumunden kalan 1 degilse 0-S�f�rd�r Else ile kontrol ediyoruz
   End Case;
   
   dbms_output.put_line(Mesaj);    
End;
/
-- Yukar�daki ornekte say�y� Ekrandan girelim
-- Ekrandan kullan�c�n�n say� girmesi icin &(ampersant) isareti kullan�l�r
/
Declare
      Sayi    Number:= &Sayi_Giriniz;
      Mesaj   Varchar2(2000);
Begin
   Case Mod(Sayi,2)
        When 1 Then Mesaj:= 'Tek Say�, Sayimiz: ' || Sayi;
        Else Mesaj:= 'Cift Say�, Sayimiz: ' || Sayi;
        -- Sayinin 2 ye bolumunden kalan 1 degilse 0-S�f�rd�r Else ile kontrol ediyoruz
   End Case;
   
   dbms_output.put_line(Mesaj);    
End;
/
-- Yukaridaki Simple Case ornegini Searched Case ile de yazalim
-- Simple Case icerisinde Nested Case yapabiliriz
-- Ayr�ca Simple Case icerisinde Search Case kullan�labilir

Declare
      Sayi    Number:= &Sayi_Giriniz;
      Mesaj   Varchar2(2000);
Begin
   Case 
        When Mod(Sayi,2) = 1 Then Mesaj:= 'Tek Say�, Sayimiz: ' || Sayi;
        Else Mesaj:= 'Cift Say�, Sayimiz: ' || Sayi;
        -- Sayinin 2 ye bolumunden kalan 1 degilse 0-S�f�rd�r Else ile kontrol ediyoruz
   End Case;
   
   dbms_output.put_line(Mesaj);    
End;
/
Declare
      Sayi    Number(5);
      Mesaj   Varchar2(2000);
Begin
    Sayi:= &Sayi_Giriniz;
   Case 
        When Mod(Sayi,2) = 1 Then Mesaj:= 'Tek Say�, Sayimiz: ' || Sayi;
        Else Mesaj:= 'Cift Say�, Sayimiz: ' || Sayi;
        -- Sayinin 2 ye bolumunden kalan 1 degilse 0-S�f�rd�r Else ile kontrol ediyoruz
   End Case;
   
   dbms_output.put_line(Mesaj);    
End;
/
-- Baska bir ornek yapal�m

Declare
    DogumTarihi   Date;
    Yasi          Number(3);
Begin
    DogumTarihi:= To_Date('21/11/2012','dd/mm/yyyy');
    Yasi:= (SysDate - DogumTarihi)/365;   
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz

    Case Yasi
          When 15 Then dbms_output.put_line('Ben 15 yas�nday�m, Yasim: ' || Yasi);
          When 30 Then dbms_output.put_line('Ben 30 yas�nday�m, Yasim: ' || Yasi);
          When 50 Then dbms_output.put_line('Ben 50 yas�nday�m, Yasim: ' || Yasi);
          Else dbms_output.put_line('Yasim 15,30 ve 50 den farkl�d�r, Yasim: ' || Yasi);
    End Case;    
End;
/
-- Searched Case:

Declare
    DogumTarihi   Date;
    Yasi          Number(3);
Begin
    DogumTarihi:= To_Date('21/11/2012','dd/mm/yyyy');
    Yasi:= (SysDate - DogumTarihi)/365;   
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz

    Case 
          When Yasi < 15 Then dbms_output.put_line('Ben 15 yas�ndan kucugum, Yasim: ' || Yasi);
          When Yasi < 30 Then dbms_output.put_line('Ben 16-30 yas� aras�nday�m, Yasim: ' || Yasi);
          When Yasi < 50 Then dbms_output.put_line('Ben 31-50 yas� aras�nday�m, Yasim: ' || Yasi);
          Else dbms_output.put_line('Ben 50 Yasindan Buyugum, Yasim: ' || Yasi);
    End Case;    
End;

/

-- Yukar�daki sonucu degisken ile kullanal�m

Declare
    DogumTarihi   Date;
    Yasi          Number(3);
    Mesaj         Varchar2(2000);
Begin
    DogumTarihi:= To_Date('21/11/2012','dd/mm/yyyy');
    Yasi:= (SysDate - DogumTarihi)/365;   
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz

    Case 
          When Yasi < 15 Then Mesaj := 'Ben 15 yas�ndan kucugum';
          When Yasi < 30 Then Mesaj := 'Ben 16-30 yas� aras�nday�m';
          When Yasi < 50 Then Mesaj := 'Ben 31-50 yas� aras�nday�m';
          Else                Mesaj := 'Ben 50 Yasindan Buyugum';
    End Case;
    dbms_output.put_line(Mesaj || ', Yasim: ' || Yasi);   
End;
/
-- Simdi Case icerisinde Case kullanal�m
-- Case Nested Case ornegi yapal�m

Declare
    DogumTarihi   Date;
    Yasi          Number(3);
    Mesaj         Varchar2(2000);
Begin
    DogumTarihi:= To_Date('21/11/2002','dd/mm/yyyy');
    Yasi:= (SysDate - DogumTarihi)/365;   
    -- bu bize gun cinsinden deger donderir, Bunu 365'e Bolersek Yil buluruz

    Case 
          When Yasi < 15 Then Mesaj := 'Ben 15 yas�ndan kucugum';
          When Yasi < 30 Then Mesaj := 'Ben 16-30 yas� aras�nday�m';
              Case
                    When yasi < 24 Then Mesaj:= Mesaj || ' ve 24 yasindan da kucugum!';
                    Else Mesaj := Mesaj || ' ve 24''ten Buyugum';
              End Case;
          When Yasi < 50 Then Mesaj := 'Ben 31-50 yas� aras�nday�m';
          Else                Mesaj := 'Ben 50 Yasindan Buyugum';
    End Case;
    dbms_output.put_line(Mesaj || ', Yasim: ' || Yasi);   
End;
/

--*********************************************************************************************
-- Iterative Control Statements : Loops
-- (Tekrarl� ifadeler: Donguler)
--*********************************************************************************************
/*

  Basic Loop
  For Loop
  While Loop
  
*/

  -- ***** Basic Loop *****
/*
LOOP
    STATEMENT 1;
    STATEMENT 2;
    [if condition then
      Exit; Continue
    end if;]
    
    [Exit When Exit_Condition]
    [Continue When Continue_Condition]  
    
    STATEMENT N;
END LOOP;

*/
-- Basic Loop ile For Loop aras�ndaki fark
-- Basic Loop'ta if kosulu koymak zorunday�z yoksa sonsuz donguye girer
-- For Loop'ta ise belirli bir sayac oldugu icin koymak zorunda degiliz


  -- ***** For Loop *****
/*
FOR loop_Counter IN
            [REVERSE] lower_limit... upper_limit
LOOP
    STATEMENT 1;
    STATEMENT 2;
    [if condition then
      Exit; Continue
    end if;]
    
    [Exit When Exit_Condition]
    [Continue When Continue_Condition]  
    
    STATEMENT N;
END LOOP;
*/  

  -- ***** While Loop *****

/*

WHILE Condition LOOP
    STATEMENT 1;
    STATEMENT 2;
    [if condition then
      Exit; Continue
    end if;]
    
    [Exit When Exit_Condition]
    [Continue When Continue_Condition]  
    
    STATEMENT N;
END LOOP;
*/   
  
  -- ***** Cursors *****  
/* BUNU AYRICA INCELEYECEGIZ */  
  
--*********************************************************************************************
-- Iterative Control Statements : Basic Loops
--*********************************************************************************************

/

Declare
    Sayac integer;
Begin
    LOOP
      Sayac := NVL(Sayac,0) + 1;
      dbms_output.put_line('Sayac : ' || Sayac);
      
        if Sayac = 5 then
            Exit;
        end if;        
    END LOOP;  
End;

/

Declare
    Sayac integer;
Begin
    LOOP
      Sayac := NVL(Sayac,0) + 1;
      dbms_output.put_line('Sayac : ' || Sayac);
      
        Exit When Sayac = 5;
    END LOOP;  
End;       

/

-- Tek say�lar� yazd�ran bir kod yazal�m

Declare
    Sayac integer;
Begin
    LOOP
      Sayac := NVL(Sayac,0) + 1;
      
        if mod(Sayac,2) = 0 then
            Continue;
        -- Anlam� su; Eger Say� cift say� ise Loop'un baslad�g� yere geri don ve devam et
        end if;        

      dbms_output.put_line('Sayac : ' || Sayac);

        if Sayac = 5 then
            Exit;
        end if; 
        
    END LOOP;  
End;

/
-- Yukar�daki ornegi Continue When Continue_Condition ile yapal�m

Declare
    Sayac integer;
Begin
    LOOP
      Sayac := NVL(Sayac,0) + 1;
      
        Continue When mod(Sayac,2) = 0;
        -- Anlam� su; Eger Say� cift say� ise Loop'un baslad�g� yere geri don ve devam et        

      dbms_output.put_line('Sayac : ' || Sayac);

        if Sayac = 5 then
            Exit;
        end if;         
    END LOOP;  
End;
/
-- veya soyle yazal�m

Declare
    Sayac integer;
Begin
    LOOP
      Sayac := NVL(Sayac,0) + 1;      
        Continue When mod(Sayac,2) = 0;
        -- Anlam� su; Eger Say� cift say� ise Loop'un baslad�g� yere geri don ve devam et
      dbms_output.put_line('Sayac : ' || Sayac);

        Exit When Sayac = 5;        
    END LOOP;  
End;
/
-- Basic Loop ===> Ornek
-- Kurslar isimli Bir Tablo Olustural�m
-- ve icerisine 6 Adet kay�t girelim

-- Drop Table Kurslar;

Create Table Kurslar
(
  Kurs_id         Number(3),
  Kurs_Adi        Varchar2(30),
  Egitmen_Adi     Varchar2(30),
  BaslangicTarihi Date,
  BitisTarihi     Date  
);

/

Declare
    Rec_Kurs  Kurslar%RowType;
Begin    
    Rec_Kurs.Egitmen_Adi := 'Ali TOPACIK';
    Rec_Kurs.BaslangicTarihi  := Trunc(SysDate);
    Rec_Kurs.BitisTarihi  := Rec_Kurs.BaslangicTarihi + 5;

    LOOP
              Rec_Kurs.Kurs_id := NVL(Rec_Kurs.Kurs_id,0) + 1;
              
              Select Decode(Rec_Kurs.Kurs_id,1,'Oracle SQL',
                                             2,'PL/SQL',
                                             3,'MS SQL',
                                             4,'TRANSACT SQL',
                                             5,'Google Big Query',
                                             6,'Power BI',
                                             7, 'Excel',
                                             8, 'Excel VBA',
                                             9, 'LOGO TIGER3 ENTERPRISE'
                           )
                into Rec_Kurs.Kurs_Adi
              From Dual;
          
          insert into Kurslar(Kurs_id, Kurs_Adi, Egitmen_Adi, BaslangicTarihi, BitisTarihi)
                 Values(Rec_Kurs.Kurs_id, Rec_Kurs.Kurs_Adi, Rec_Kurs.Egitmen_Adi, Rec_Kurs.BaslangicTarihi, Rec_Kurs.BitisTarihi);
      
          Rec_Kurs.BaslangicTarihi  := Rec_Kurs.BitisTarihi + 1;
          Rec_Kurs.BitisTarihi  := Rec_Kurs.BaslangicTarihi + 5;
          Exit When Rec_Kurs.Kurs_id = 9;        
        
    END LOOP;
    Commit;
End;
/

Select *
From Kurslar;
/
-- Sales_Orders Tablosunda
-- 2007(orderdate alan? kullan?n?z) y?l?ndaki USA ulkesinin sipari?lerini
-- bulan sorguyu yaz?n?z

Select *
From Sales_Orders
Where To_Char(orderdate,'YYYY')= 2007 and shipcountry = 'USA';

-- Sales_Orders Tablosunda
-- 2007(orderdate alan? kullan?n?z) y?l?ndaki USA ulkesinin sipari?lerini veren
-- 1,2,4,6,9 nolu empid'lerin sipari?lerini bulunuz

Select *
From Sales_Orders
Where   To_Char(orderdate,'YYYY')= 2007 and 
        shipcountry = 'USA' and
        empid in(1,2,4,6,9);

/        

-- Ornek
-- Sales_Orders tablosunda
-- 2007 y?l?nda Toplam Freight degeri en yuksek olan
-- ilk 3 eleman?n 2008 y?l? verilerini bulunuz
        
With
A as
(
    Select empid
    From Sales_Orders
    Where To_Char(orderdate,'YYYY') = 2007
    Group By empid
    Order By sum(Freight) desc
)
Select *
From Sales_Orders
Where   To_Char(orderdate,'YYYY') = 2008 and
        empid in(
                    Select *
                    From A
                    Where ROWNUM <= 3
               );

/

Select *
From Sales_Orders
Where   To_Char(orderdate,'YYYY') = 2008 and
        empid in(1,3,4); 

--05102023

-- Yukar?daki sorguyu SubQuery ve derived ile inceleyelim

Select *
From Sales_Orders
Where   To_Char(orderdate,'YYYY') = 2008 and
        empid in(
                    Select empid
                    From (
                            Select empid
                            From Sales_Orders
                            Where To_Char(orderdate,'YYYY') = 2007
                            Group By empid
                            Order By sum(Freight) desc
                         ) A
                    Where rownum <= 3        
                );
/

Set ServerOutPut ON;
/
-- Continue icin ornek yapal�m

Declare
    Rec_Kurs  Kurslar%RowType;
Begin    
    Rec_Kurs.Egitmen_Adi := 'Ali TOPACIK';
    Rec_Kurs.BaslangicTarihi  := Trunc(SysDate);
    Rec_Kurs.BitisTarihi  := Rec_Kurs.BaslangicTarihi + 5;

    LOOP
              Rec_Kurs.Kurs_id := NVL(Rec_Kurs.Kurs_id,0) + 1;
              if Rec_Kurs.Kurs_id = 6 Then
                Continue; -- 6 Numaral� kursu eklemeyecek ve Loop'a gidecek
              End if;
              Select Decode(Rec_Kurs.Kurs_id,1,'Oracle SQL',
                                             2,'PL/SQL',
                                             3,'MS SQL',
                                             4,'TRANSACT SQL',
                                             5,'Google Big Query',
                                             6,'LOGO TIGER3 ENTERPRISE',
                                             7, 'Excel',
                                             8, 'Excel VBA',
                                             9, 'Power BI'
                           )
                into Rec_Kurs.Kurs_Adi
              From Dual;
          
          insert into Kurslar(Kurs_id, Kurs_Adi, Egitmen_Adi, BaslangicTarihi, BitisTarihi)
                 Values(Rec_Kurs.Kurs_id, Rec_Kurs.Kurs_Adi, Rec_Kurs.Egitmen_Adi, Rec_Kurs.BaslangicTarihi, Rec_Kurs.BitisTarihi);
      
          Rec_Kurs.BaslangicTarihi  := Rec_Kurs.BitisTarihi + 1;
          Rec_Kurs.BitisTarihi  := Rec_Kurs.BaslangicTarihi + 5;
          Exit When Rec_Kurs.Kurs_id = 9;                
    END LOOP;
    Commit;
End;
/
Select * From Kurslar;
/
-- Yukar�daki ornegi Decode yerine Simple Case ile yazal�m

Declare
    Rec_Kurs  Kurslar%RowType;
Begin    
    Rec_Kurs.Egitmen_Adi := 'Ali TOPACIK';
    Rec_Kurs.BaslangicTarihi  := Trunc(SysDate);
    Rec_Kurs.BitisTarihi  := Rec_Kurs.BaslangicTarihi + 5;

    LOOP
              Rec_Kurs.Kurs_id := NVL(Rec_Kurs.Kurs_id,0) + 1;
              
              Case  Rec_Kurs.Kurs_id
                    When 1 Then Rec_Kurs.Kurs_Adi := 'Oracle SQL';
                    When 2 Then Rec_Kurs.Kurs_Adi := 'PL/SQL';
                    When 3 Then Rec_Kurs.Kurs_Adi := 'MS SQL';
                    When 4 Then Rec_Kurs.Kurs_Adi := 'TRANSACT SQL';
                    When 5 Then Rec_Kurs.Kurs_Adi := 'Google Big Query';
                    When 6 Then Rec_Kurs.Kurs_Adi := 'LOGO TIGER3 ENTERPRISE';
                    When 7 Then Rec_Kurs.Kurs_Adi := 'Excel';
                    When 8 Then Rec_Kurs.Kurs_Adi := 'Excel VBA';
                    When 9 Then Rec_Kurs.Kurs_Adi := 'Power BI';
              End Case;
          
          insert into Kurslar(Kurs_id, Kurs_Adi, Egitmen_Adi, BaslangicTarihi, BitisTarihi)
                 Values(Rec_Kurs.Kurs_id, Rec_Kurs.Kurs_Adi, Rec_Kurs.Egitmen_Adi, Rec_Kurs.BaslangicTarihi, Rec_Kurs.BitisTarihi);
      
          Rec_Kurs.BaslangicTarihi  := Rec_Kurs.BitisTarihi + 1;
          Rec_Kurs.BitisTarihi  := Rec_Kurs.BaslangicTarihi + 5;
          Exit When Rec_Kurs.Kurs_id = 9;                
    END LOOP;
    Commit;
End;
/
Select * From Kurslar;
/

--*********************************************************************************************
-- Iterative Control Statements : For Loop
--*********************************************************************************************
-- Declare    -- Degisken tan�mlamayacak isek Declare yazmam�za gerek yok
              -- Sadece Begin End; blogu yeterlidir

-- Set ServerOutPut On;
/
Begin
      For Sayac IN 1..5 Loop
        dbms_output.put_line('Sayac = ' || Sayac);      
      End Loop;  
End;
/
-- Reverse Anahtar kelimesi ile sayac isleyici degistirilebilir

Begin
      For Sayac IN Reverse 1..5 Loop
        dbms_output.put_line('Sayac = ' || Sayac);      
      End Loop;  
End;
/
--

Begin
      For Sayac IN 1..5 Loop
        Exit When Sayac = 3;
        dbms_output.put_line('Sayac = ' || Sayac);      
      End Loop;  
End;

/
Begin
      For Sayac IN 1..5 Loop        
        dbms_output.put_line('Sayac = ' || Sayac);
        Exit When Sayac = 3;
      End Loop;  
End;
/
Begin
      For Sayac IN 1..5 Loop
        Continue When Sayac = 3;
        -- Sayac = 3 oldugunda Kod asagi gitmeyip For-Loop'a geri doner
        
        dbms_output.put_line('Sayac = ' || Sayac);      
      End Loop;  
End;
/
-- Continue ifadesini if ile yapal�m

Begin
      For Sayac IN 1..5 Loop
        if Sayac = 3 Then
        -- if Sayac = 3 or Sayac = 4 Then
           Continue;
        End if;
        -- Sayac = 3 oldugunda Kod asagi gitmeyip For-Loop'a geri doner
        
        dbms_output.put_line('Sayac = ' || Sayac);      
      End Loop;  
End;
/

Begin
      For Sayac IN 1..5 Loop
        if Sayac = 3 Then
            Exit;
            -- Exit komutunu burada yazmak zorunda degiliz,
            -- Cunku burada For dongusu var, yani dongunun alt ve ust limiti var
            -- Basic Loop'ta ise limit olmad�g� icin sayac kontrol edilmeli
            -- ve kosullar sagland�g�nda Exit yap�lmal�d�r(if Sayac = 3 Then Exit; End if;)
        End if;
        -- Sayac = 3 oldugunda Kod asagi gitmeyip For-Loop'a geri doner
        
        dbms_output.put_line('Sayac = ' || Sayac);      
      End Loop;  
End;

/

-- Ornek: Faktoriyel hesaplayal�m

Declare
    Faktoriyel Number:= 1;
Begin

    For Sayac In 1..5 Loop
        Faktoriyel := Faktoriyel * Sayac;
    End Loop;
    dbms_output.put_line('Faktoriyel >> 5! ... : ' || Faktoriyel);
End;
/
-- Faktoriyeli istenen say� klavyeden girilebilsin

Declare
    Faktoriyel Number:= 1;
    UstLimit Number:= 1;
Begin
    UstLimit := &FaktoriyeliAlinacak_UstLimitiGiriniz;
    For Sayac In 1..UstLimit Loop
        Faktoriyel := Faktoriyel * Sayac;
    End Loop;
    dbms_output.put_line('Faktoriyel >> ' || UstLimit || '! ... : ' || Faktoriyel);
End;
/

Begin
    For dpt IN (Select Department_id, Department_Name From Departments Order By Department_id)
    Loop
        dbms_output.put_line(' Bolum No:   ' || dpt.Department_id || 
                             ' Bolum Adi:  ' || dpt.Department_Name);           
    End Loop;
End;
/
Begin
    For dpt IN (
                Select Department_id, Department_Name 
                From Departments 
                Order By Department_id
               )
    Loop
        dbms_output.put_line(' Bolum No:   ' || dpt.Department_id || 
                             ' Bolum Adi:  ' || dpt.Department_Name);           
    End Loop;
End;
/
-- Iterative Control Statements : For Loop
-- Nested Loop(i� i�e Loop)
-- Loop'lar ic ice kullan�labildigi gibi
-- bir Loop diger bir Loop icerisinde de kullan�labilir
-- 
-- Ornek Yapal�m, Bolumler ve calisanlar tablomuzdan olusan bir Rapor haz�rlayal�m
--- Once bolum yazs�n sonra cal�sanlar� yazs�n

Begin
    For dpt IN (
                Select Department_id, Department_Name
                From Departments
                Order By Department_id
               )
    Loop
        dbms_output.put_line('Bolum No: ' || dpt.Department_id || ' Bolum Adi: ' || dpt.Department_Name);

            For emp IN (
                        Select Employee_id, first_Name, Last_Name
                        From Employees
                        Where Department_id = dpt.Department_id
                       )
            Loop

                 dbms_output.put_line('      Emp.No: ' || emp.Employee_id || ' Adi: ' || emp.first_Name || ' Soyadi: ' || emp.Last_Name);                        
            End Loop;               
    End Loop;
End;
/

-- Yukar�daki sorguyu gorsel olarak duzenleyelim

Begin
    For dpt IN (Select Department_id, Department_Name From Departments Order By Department_id) Loop
    
        dbms_output.put_line(' '); -- her bir bolumden once bos sat�r yazacag�z
        dbms_output.put_line('Bolum No: ' || dpt.Department_id || ' Bolum Adi: ' || dpt.Department_Name);

            For emp IN (Select Employee_id, first_Name, Last_Name
                        From Employees
                        Where Department_id = dpt.Department_id) Loop

                 dbms_output.put_line('      Emp.No: ' || emp.Employee_id || ' Adi: ' || emp.first_Name || ' Soyadi: ' || emp.Last_Name);                        
            End Loop;               
    End Loop;
End;

/
-- Yukar�daki sorguda her bir calisanin Yoneticisinin Soyad?n?da yazd�ral�m

Declare
    YoneticiSoyadi Employees.last_name%type;
Begin
    For dpt IN (Select Department_id, Department_Name, manager_id From Departments Order By Department_id) Loop
      
        Select last_name into YoneticiSoyadi
        From Employees
        Where Employee_id = dpt.Manager_id;
        
        dbms_output.put_line(' '); -- her bir bolumden once bos sat�r yazacag�z
        dbms_output.put_line(' Bolum No: ' || dpt.Department_id || 
                             ' Bolum Adi: ' || dpt.Department_Name ||
                             'Yonetici Soyadi: ' || YoneticiSoyadi);

            For emp IN (Select Employee_id, first_Name, Last_Name
                        From Employees
                        Where Department_id = dpt.Department_id) Loop

                 dbms_output.put_line('      Emp.No: ' || emp.Employee_id || ' Adi: ' || emp.first_Name || ' Soyadi: ' || emp.Last_Name);                        
            End Loop;               
    End Loop;
End;
/
-- Yukar�daki sorguda Yoneticisini olmayanlar icin hata meydana gelecek
-- Bu hatay� kontrol alt�na alal�m
Declare
    YoneticiSoyadi Employees.last_name%type;
Begin
    For dpt IN (Select Department_id, Department_Name, manager_id From Departments Order By Department_id)
    Loop
        Begin
                Select last_name into YoneticiSoyadi From Employees Where Employee_id = dpt.Manager_id;
                Exception When no_data_found then YoneticiSoyadi:= null;
        End;
        dbms_output.put_line(' '); -- her bir bolumden once bos sat�r yazacag�z
        dbms_output.put_line(' Bolum No: ' || dpt.Department_id || 
                             ' Bolum Adi: ' || dpt.Department_Name ||
                             'Yonetici Soyadi: ' || YoneticiSoyadi);

            For emp IN (Select Employee_id, first_Name, Last_Name
                        From Employees
                        Where Department_id = dpt.Department_id) Loop

                 dbms_output.put_line('      Emp.No: ' || emp.Employee_id || ' Adi: ' || emp.first_Name || ' Soyadi: ' || emp.Last_Name);                        
            End Loop;               
    End Loop;
End;
/
-- Yukar�daki sorguda YoneticiSoyadi = null olanlar� yazd�rmayal�m
Declare
    YoneticiSoyadi Employees.last_name%type;
Begin
    For dpt IN (Select Department_id, Department_Name, manager_id From Departments Order By Department_id)
    Loop
        Begin
                Select last_name into YoneticiSoyadi From Employees Where Employee_id = dpt.Manager_id;
                Exception When no_data_found then YoneticiSoyadi:= null;
        End;
        
            if YoneticiSoyadi is not null then
                dbms_output.put_line(' '); -- her bir bolumden once bos sat�r yazacag�z
                dbms_output.put_line(' Bolum No: ' || dpt.Department_id || 
                                     ' Bolum Adi: ' || dpt.Department_Name ||
                                     'Yonetici Soyadi: ' || YoneticiSoyadi);
    
                For emp IN (Select Employee_id, first_Name, Last_Name
                            From Employees
                            Where Department_id = dpt.Department_id) Loop
    
                     dbms_output.put_line('      Emp.No: ' || emp.Employee_id || ' Adi: ' || emp.first_Name || ' Soyadi: ' || emp.Last_Name);                        
                End Loop;
          end if;
    End Loop;
End; 
/
	--*********************************************************************************************
	-- Iterative Control Statements : While Loop
	--*********************************************************************************************

-- Belirli bir tarihin ve sonraki gunlerin ismini getiren bir sorgu yazal�m
-- Ornegin 24 Nisan 2023 hangi gun ve bu ay�n sonuna kadar olan gunleri bulalim

Declare
    Tarih1  Date;
    Tarih2  Date;
    
Begin
    Tarih1 := To_Date('24/09/2023', 'DD/MM/YYYY');
    Tarih2 := Last_Day(Tarih1);
    
    While Tarih1 <= Tarih2
    Loop
      dbms_output.put_line(To_Char(Tarih1,'day') || ' ' || To_Char(Tarih1, 'DD/MM/YYYY'));
      Tarih1:= Tarih1 + 1;
    End Loop;
End;
/
-- Yukar�daki sorguda exit When yapal�m
Declare
    Tarih1  Date;
    Tarih2  Date;
Begin
    Tarih1 := To_Date('24/04/2023', 'DD/MM/YYYY');
    Tarih2 := Last_Day(Tarih1);
    
    While Tarih1 <= Tarih2
    Loop
      dbms_output.put_line(To_Char(Tarih1,'day') || ' ' || To_Char(Tarih1, 'DD/MM/YYYY'));
      Tarih1:= Tarih1 + 1;
      
      Exit When Tarih1 > To_Date('29/04/2023', 'DD/MM/YYYY');
      -- '29/04/2023' bu tarihten donguden cikar
    End Loop;
End;
/
-- Yukar�daki sorguda Boolean ornegi yapal�m

Declare
    Tarih1  Date;
    Tarih2  Date;
    wbool Boolean;
Begin
    Tarih1 := To_Date('24/04/2023', 'DD/MM/YYYY');
    Tarih2 := Last_Day(Tarih1);
    wbool := Tarih1 <= Tarih2;
    
    While wbool
    Loop
      dbms_output.put_line(To_Char(Tarih1,'day') || ' ' || To_Char(Tarih1, 'DD/MM/YYYY'));
      Tarih1:= Tarih1 + 1;
      
      wbool := Tarih1 <= Tarih2;
      -- Exit When Tarih1 > To_Date('29/04/2023', 'DD/MM/YYYY');
      -- '29/04/2023' bu tarihten donguden cikar
    End Loop;
End;
/

Declare
    sayac number:=1;
Begin

    
    While True
    Loop
      dbms_output.put_line(To_Char(sysdate+sayac,'day') || ' ' || To_Char(sysdate+sayac, 'DD/MM/YYYY'));
      sayac:= sayac + 1;
      
      Exit When sayac = 5;
      -- '29/04/2023' bu tarihten donguden cikar
    End Loop;
End;

/


--*********************************************************************************************
-- CURSORS
-- (imlecler)
--*********************************************************************************************
-- Implicit Cursors(System-Defined Cursors)   -- Sistem taraf�ndan tan�mlananlar
-- Explicit Cursors(Developer-Defined Cursors)-- Kullan�c� taraf�ndan tan�mlananlar


--*********************************************************************************************
-- Implicit Cursors(System-Defined Cursors)   -- Sistem taraf�ndan tan�mlananlar
-- Sistem taraf�ndan haz�r olan Cursor'lard�r
-- SQL%FOUND, SQL%NOTFOUND, SQL%ROWCOUNT
--*********************************************************************************************

-- Update ve Delete islemi yapacagiz ama once
-- DML komutlar�ndan Select isleminde nas�l etki gosteriyor, inceleyelim
-- Gecici bir Tablo olusturalim

-- Drop Table Employees2;
/
Create Table Employees2 as
Select * From Employees;
/
Set serveroutput ON;
/

Declare
    rec_emp employees2%rowtype;
Begin
      Select * into rec_emp
      From Employees2
      Where Employee_id = 100;
      
      if sql%found then
         dbms_output.put_line(' Kay�t Var A - Kay�t Say�s� : ' || sql%rowcount); 
      else
         dbms_output.put_line(' Kay�t Yok A'); 
         -- Yukar�da kay�t bulunamad�g� zaman normalde buraya gelmesini bekleriz
         -- ama exception devreye girer ve buraya gelmez
      end if;
      
      if sql%notfound then
          dbms_output.put_line(' Kay�t Yok B');
      else
          dbms_output.put_line(' Kay�t Var B - Kay�t Say�s� : ' || sql%rowcount);
      end if;      
      
      Exception When no_data_found Then      
          dbms_output.put_line(' exception: no data found exception - Kay�t yok');
      -- Select yap�ld�g�nda kay�t yok ise direk bu exception devreye girer            
end;
/
Declare
    rec_emp employees2%rowtype;
Begin
      Select * into rec_emp
      From Employees2
      Where Employee_id = 1000;
      
      if sql%found then
         dbms_output.put_line(' Kay�t Var A - Kay�t Say�s� : ' || sql%rowcount); 
      else
         dbms_output.put_line(' Kay�t Yok A'); 
         -- Yukar�da kay�t bulunamad�g� zaman normalde buraya gelmesini bekleriz
         -- ama exception devreye girer ve buraya gelmez
      end if;
      
      if sql%notfound then
          dbms_output.put_line(' Kay�t Yok B');
      else
          dbms_output.put_line(' Kay�t Var B - Kay�t Say�s� : ' || sql%rowcount);
      end if;      
      
      Exception When no_data_found Then      
          dbms_output.put_line(' exception: no data found exception - Kay�t yok');
      -- Select yap�ld�g�nda kay�t yok ise direk bu exception devreye girer            
end;
/
-- Yukar�daki sorguda Exception Select isleminden sonra tetiklenir
-- hata var ise Exception devreye girer ve hatay� gosterir.
-- implicit Cursor'lar� Select ifadelerinde kullanmak cok mant�kl� degildir
-- Cunku Select ifadesinden sonra Exception(=>no_data_found exception'�); 
-- SQL%FOUND, SQL%NOTFOUND'tan once tetiklenir

-- **************************************************************************
-- Implicit Cursors(System-Defined Cursors)
-- **************************************************************************

-- SQL%FOUND, SQL%NOTFOUND, SQL%ROWCOUNT
-- Simdi de, DML komutlar�ndan Update ve Delete islemi yapacagiz

-- implicit Cursorlardan SQL%FOUND, SQL%NOTFOUND nadiren kullan�l�r ama
-- SQL%ROWCOUNT cursor'� cok kullan�l�r(if'lerde ve Case'lerde kullan�l�r)
/
Declare
    rec_emp employees2%rowtype;
Begin
      Update Employees2
      Set Salary = Salary * 1.20
      Where Department_id = 50;
      -- Where Department_id = 500; -- Bununlada deneyelim
      
      if sql%found then
         dbms_output.put_line(sql%rowcount || ' Kay�t Update edildi A');
      else
         dbms_output.put_line('Update edilecek Kay�t Yok A');
      end if;
      
      if sql%notfound then
          dbms_output.put_line('Update edilecek Kay�t Yok B');
      else
          dbms_output.put_line(sql%rowcount || ' Kay�t Update edildi B');
      end if;      

      Delete From Employees2      
      Where Department_id = 100;
      
end;
/
-- Yukar�daki sorguyu Delete ile inceleyelim
Declare
    rec_emp employees2%rowtype;
Begin
      Delete From Employees2      
      Where Department_id = 60;
      -- Where Department_id = 1000; -- Bununlada deneyelim
      if sql%found then
         dbms_output.put_line(sql%rowcount || ' Kay�t Delete edildi A');
      else
         dbms_output.put_line('Delete edilecek Kay�t Yok A');
      end if;
      
      if sql%notfound then
          dbms_output.put_line('Delete edilecek Kay�t Yok B');
      else
          dbms_output.put_line(sql%rowcount || ' Kay�t Delete edildi B');
      end if;      

end;
/
-- rollback;


-- Yukar�daki sorguyu SQL%ROWCOUNT Cursor'u ile inceleyelim
Declare
    rec_emp employees2%rowtype;
Begin
      Delete From Employees2      
      Where Department_id = 60;
      
      if sql%rowcount <> 0 then -- Yani kay�t bulundu ise 0-S�f�rdan farkl� bir deger gelir
         dbms_output.put_line(sql%rowcount || ' Kay�t Delete edildi A');
      else
         dbms_output.put_line('Delete edilecek Kay�t Yok A');
      end if;
end;
/
-- rollback;
/
--*********************************************************************************************
-- Explicit Cursors(Developer-Defined Cursors)-- Kullan�c� taraf�ndan tan�mlananlar
--*********************************************************************************************
-- Employees tablosundaki verileri cursor ile ekrana yazan bir program haz�rlayal�m
Declare
      Cursor c_empl is
                        Select Employee_id, first_name, last_name From Employees;
                        
      wemp_id Employees.Employee_id%type;
      wfirst_name Employees.first_name%type;
      wlast_name Employees.last_name%type;
Begin
    Open c_empl;  -- Cursor aciyoruz
        Loop
            Fetch c_empl into wemp_id, wfirst_name, wlast_name;
            Exit When c_empl%notfound;
            
            dbms_output.put_line('Employee_id  : ' || wemp_id ||
                                 ' First Name  : ' || wfirst_name ||
                                 ' Last Name   : ' || wlast_name
                                );
        End Loop;
    Close c_empl; -- islem sonunda Cursor kapat�yoruz
End;
/

-- Yukar�daki en basit haliyle kulland�k
-- Cursor icerisine istedigimiz Select islemini aktarabiliriz
-- Where olabilir, Join olabilir v.s.
-- Ornek

Declare
      Cursor c_empl is Select
                              Rpad(Job_id,10,' ') Job_id,
                              Sum(Salary) TotalSalary
                        From Employees
                        Group By Job_id
                        Order By 2 Desc;

      wJob_id       Varchar2(10);
      wTotalSalary  Employees.Salary%type;
Begin
    Open c_empl;  -- Cursor aciyoruz
        Loop
            Fetch c_empl into wJob_id, wTotalSalary;
            Exit When c_empl%notfound;
            
            dbms_output.put_line(' Job_id : '      || wJob_id     || -- ' || ' ||
                                 ' TotalSalary : ' || wTotalSalary
                                );
        End Loop;
    Close c_empl; -- islem sonunda Cursor kapat�yoruz
End;
/
-- Ornek

Declare
    Cursor c_reg is Select Region_id, Region_Name From Regions;
    wRegion_id    Regions.Region_id%type;
    wRegion_Name  Regions.Region_Name%type;
Begin
  Open c_reg;
    Loop
      Fetch c_reg into wRegion_id, wRegion_Name;
      Exit When c_reg%NotFound;
      
      dbms_output.put_line(' Region ID   : ' || wRegion_id ||
                           ' Region Name : ' || wRegion_Name
                          );    
    End Loop;  
  Close c_reg;
End;
/

-- Yukar�daki sorguya s�ra numaras� ekleyelim
-- s�ra numaras� eklemek icin implicit cursor(haz�r cursor)'lardan olan
-- ...%rowcount kullanal�m, bu ilk baslangicta 1 olur ve her okumada 1'er 1'er artar

Declare
    Cursor c_reg is Select Region_id, Region_Name From Regions;
    wRegion_id    Regions.Region_id%type;
    wRegion_Name  Regions.Region_Name%type;
Begin
  Open c_reg;
    Loop
      Fetch c_reg into wRegion_id, wRegion_Name;
      Exit When c_reg%NotFound;
      
      dbms_output.put_line(' Sira No : '      || c_reg%rowcount  ||
                           ' Region ID : '    || wRegion_id      ||
                           ' Region Name : '  || wRegion_Name
                          );    
    End Loop;  
  Close c_reg;
End;
/
/-- Ornek

Declare
      Cursor c_empl is Select
                              Rpad(Job_id,10,' ') Job_id,
                              Sum(Salary) TotalSalary
                        From Employees
                        Group By Job_id
                        Order By 2 Desc;

      wJob_id       Varchar2(10);
      wTotalSalary  Employees.Salary%type;
Begin
    Open c_empl;  -- Cursor aciyoruz
        Loop
            Fetch c_empl into wJob_id, wTotalSalary;
            Exit When c_empl%notfound;
            
            dbms_output.put_line(' Sira No : '     || c_empl%rowcount ||
                                 ' Job_id : '      || wJob_id         || -- ' || ' ||
                                 ' TotalSalary : ' || wTotalSalary
                                );
        End Loop;
    Close c_empl; -- islem sonunda Cursor kapat�yoruz
End;
/
--*********************************************************************************************
-- Explicit Cursors(Developer-Defined Cursors)-- Kullan�c� taraf�ndan tan�mlananlar
    -- Explicit Cursors Attributes
    -- Developer-Defined Cursors Durum Bilgileri
    --   
--*********************************************************************************************
/*

Explicit Cursorlar�n DURUM bilgilerini veren ozellik imlecleri 4 adettir
  %ISOPEN   Boolean tipindedir, Cursor aciksa degeri TRUE degilse FALSE
  %NOTFOUND Boolean tipindedir, FETCH edilecek kay�t kalmad�ysa degeri TRUE degilse FALSE
  %FOUND    Boolean tipindedir, FETCH edilecek kay�t varsa      degeri TRUE degilse FALSE
  %ROWCOUNT Number  tipindedir, FETCH edilen kay�t say�s�n� verir
  
*/

--*********************************************************************************************
-- Cursors Durum Bilgileri %ISOPEN, %NOTFOUND, %FOUND, %ROWCOUNT
--*********************************************************************************************

-- %ISOPEN: Cursor acik kal�rsa memory �i�er ve performans kayb� meydana gelir
-- o nedenle kontrollu bir sekilde acip kapatalim
-- Set ServerOutPut ON;
Declare
    Cursor c_reg is Select Region_id, Region_Name From Regions;
    wRegion_id    Regions.Region_id%type;
    wRegion_Name  Regions.Region_Name%type;
Begin
  if Not c_reg%ISOPEN Then
    Open c_reg;
  End if;
 
      Loop
              Fetch c_reg into wRegion_id, wRegion_Name;
              -- Exit When c_reg%NotFound; -- veya Exit When Not c_reg%Found;
              -- Yukar�daki her iki yaz�m da ayn� sonucu verir
              
              Exit When c_reg%NotFound or c_reg%rowcount > 3;
              -- Yukar�daki ise kay�t kalmad�g�nda veya
              -- kay�t say�s� 3'un uzerine c�kt�g�nda Loop'tan c�kar
              
              dbms_output.put_line(' Sira No : '      || c_reg%rowcount  ||
                                   ' Region ID : '    || wRegion_id      ||
                                   ' Region Name : '  || wRegion_Name
                                  );    
      End Loop;  
  if c_reg%ISOPEN Then
    Close c_reg;
  End if;
End;

/

Declare
    Cursor c_reg is Select Region_id, Region_Name From Regions;
    wRegion_id    Regions.Region_id%type;
    wRegion_Name  Regions.Region_Name%type;
Begin
    Open c_reg;
      Loop
              Fetch c_reg into wRegion_id, wRegion_Name;
              
              Exit When c_reg%NotFound;
              
              dbms_output.put_line(' Sira No : '      || c_reg%rowcount  ||
                                   ' Region ID : '    || wRegion_id      ||
                                   ' Region Name : '  || wRegion_Name
                                  );    
      End Loop;  
    Close c_reg;
End;
/

Declare
    Cursor c_reg is Select Region_id, Region_Name From Regions;
    wRegion_id    Regions.Region_id%type;
    wRegion_Name  Regions.Region_Name%type;
Begin
  if Not c_reg%ISOPEN Then
    Open c_reg;
  End if;
 
      Loop
              Fetch c_reg into wRegion_id, wRegion_Name;
             
              -- Exit When Not c_reg%Found or c_reg%rowcount > 3;
              
              if Not c_reg%Found or c_reg%rowcount > 3 Then
                dbms_output.put_line('*************************************');
                dbms_output.put_line('Not c_reg%Found or c_reg%rowcount > 3');
                dbms_output.put_line('Yukar�daki 2 kosuldan birisi gerceklesti!');
                Exit;
              end if;
              
              dbms_output.put_line(' Sira No : '      || c_reg%rowcount  ||
                                   ' Region ID : '    || wRegion_id      ||
                                   ' Region Name : '  || wRegion_Name
                                  );    
      End Loop;  
  if c_reg%ISOPEN Then
    Close c_reg;
  End if;
End;
/

--*********************************************************************************************
-- Cursors and Records(Reference Data Type %ROWTYPE)
--*********************************************************************************************

-- Yukar�daki sorguda Select icerisinde cok fazla sutun olabilir
-- Bu durumda her biri icin ayr� ayr� degisken tan�mlamak yerine
-- %ROWTYPE ile tek seferde tan�mlamak daha dogru olur


Declare
    Cursor c_reg is Select Region_id, Region_Name From Regions Order By Region_id;
    r_oku c_reg%ROWTYPE;  -- Daha once tablo tan�mlad�g�m�z gibi Cursorden gelen
                          -- Sutun bilgilerini tek seferde tan�mlayabiliriz
Begin
  if Not c_reg%ISOPEN Then
    Open c_reg;
  End if;
 
      Loop
              Fetch c_reg into r_oku;
             
              Exit When Not c_reg%Found;
              
              dbms_output.put_line(' Sira No : '      || c_reg%rowcount  ||
                                   ' Region ID : '    || r_oku.Region_id      ||
                                   ' Region Name : '  || r_oku.Region_Name
                                  );    
      End Loop;  
  if c_reg%ISOPEN Then
    Close c_reg;
  End if;
End;
/
-- Cursor Ornek A1 Yontem 1;
-- simdi yukar�daki sorguda Select icerisinde * ile verileri getirelim
-- Bu durumda tum sutunlar gelecektir

Declare
    Cursor c_reg is Select * From Regions Order By Region_id;
    -- Bu durumda tum sutunlar gelir
    r_oku c_reg%ROWTYPE;  -- Daha once tablo tan�mlad�g�m�z gibi Cursorden gelen
                          -- Sutun bilgilerini tek seferde tan�mlayabiliriz
Begin
  if Not c_reg%ISOPEN Then
    Open c_reg;
  End if;
 
      Loop
              Fetch c_reg into r_oku;
             
              Exit When Not c_reg%Found;
              
              dbms_output.put_line(' Sira No : '      || c_reg%rowcount  ||
                                   ' Region ID : '    || r_oku.Region_id      ||
                                   ' Region Name : '  || r_oku.Region_Name
                                  );    
      End Loop;  
  if c_reg%ISOPEN Then
    Close c_reg;
  End if;
End;

/
-- Cursor Ornek A1 Yontem 2;
--*********************************************************************************************
-- Cursor and FOR LOOP
--*********************************************************************************************
-- For Loop ile Az onceki ornegi yukar�daki yaz�ma gore biraz daha performansl� yazal�m
-- Cursor acmadan, herhangi bir degisken tan�mlamadan yapal�m
-- For Loop islemi otomatik olarak Cursor'u OPEN eder ve is bittiginde CLOSE eder

Declare
    Cursor c_reg is Select * From Regions Order By Region_id;
Begin
    For r_oku IN c_reg
    Loop
              dbms_output.put_line(' Sira No : '      || c_reg%rowcount  ||
                                   ' Region ID : '    || r_oku.Region_id      ||
                                   ' Region Name : '  || r_oku.Region_Name
                                  );    
    End Loop;  
End;
/
-- Goruldugu gibi daha az kod ile ayn� islemi yapt�k
-- Cursor Ornek A1 Yontem 2 ile yap�lan Cursor Ornek A1 Yontem 1'e gore daha performansl�d�r

-- Cursor Ornek A1 Yontem 3_A

Declare
    
Begin
    For r_oku IN (Select * From Regions Order By Region_id)
    Loop
              dbms_output.put_line(--' Sira No : '      || r_oku%rowcount  ||
                                   ' Region ID : '    || r_oku.Region_id      ||
                                   ' Region Name : '  || r_oku.Region_Name
                                  );    
    End Loop;  
End;
/
-- Cursor Ornek A1 Yontem 3_B
-- Ancak goruldugu gibi s�ra numaras�n� bu sekilde yazd�ramad�k
-- O nedenle degisken ile cozelim
Declare
    i Number:=0;
Begin
    For r_oku IN (Select * From Regions Order By Region_id)
    Loop
              i:= i + 1;
              dbms_output.put_line(' Sira No : '      || i  ||
                                   ' Region ID : '    || r_oku.Region_id      ||
                                   ' Region Name : '  || r_oku.Region_Name
                                  );    
    End Loop;  
End;
/
-- Cursor Ornek A1 Yontem 3 ile yap�lan Yontem 2'ye gore Yontem 2 ise Yontem 1'e gore daha performansl�d�r
-- Cok fazla data'n�n oldugu islemlerde, Cursor Ornek A1 Yontem 3_A ve Yontem 3_B  daha performansl� olacakt�r

-- Yontem 1 ile Cursor icin Memoryde yer ayr�l�yor, sonra Open ediliyor
-- Fetch ile her bir dongude kay�t parse ediliyor is bittiginde de Close ediliyor

-- Yontem 2 de ise Sadece Cursor icin Memory'de yer ayr�l�yor, Cursor otomatik ac�l�p kapat�l�yor
-- Ayr�ca Open, Fetch, Close islemlerine gerek kalm�yor

-- Yontem 3 ise Sorguyu direk Buffer'a(Memory'e al�yor) ve sorgu calisiyor
-- Bu nedenle daha performansl�d�r

-- 3 yontemde ayn� sonucu verecektir
--*********************************************************************************************
-- Cursor - FOR UPDATE ve WHERE CURRENT OF Kullan�m�
--*********************************************************************************************
-- Ornek olarak; Maasi 5000'den az olanlara %20 zam yapal�m
-- Employee tablosunun kopyas�n� olustural�m

-- Drop Table Employees2;

Create Table Employees2 as
Select * From Employees;
/

-- For Update Yontem 1
-- Set ServerOutPut ON;
Declare
    Cursor c_emp IS Select * From Employees2;
Begin
    For r_emp IN c_emp
    LOOP
        if r_emp.Salary < 5000 Then
            
            Update Employees2
            Set Salary = Salary * 1.20
            Where Employee_id = r_emp.Employee_id;
            
        End if;    
    END LOOP;
    Commit;
End;
/
-- Ancak yukar�daki ornekte
-- Biz islem yaparken baska kullanc�lar, Transactionlar veya programlar taraf�ndan
-- kay�t lock edilmis olabilir,
-- Bu nedenle islemi ne icin yapt�g�m�z� belirtip Lock islemini gerceklestirmemiz laz�m
-- Bu amacla FOR UPDATE kullanacagiz

Declare
    Cursor c_emp IS Select * From Employees2 FOR UPDATE;
    -- Ancak bu sekilde tum tabloyu kilitlemis oluruz
Begin
    For r_emp IN c_emp
    LOOP
        if r_emp.Salary < 5000 Then
            
            Update Employees2
            Set Salary = Salary * 1.20
            Where Employee_id = r_emp.Employee_id;
            
        End if;    
    END LOOP;
    Commit;
End;
/
-- Ancak yukar�daki FOR UPDATE ile tum tabloyu kilitlemis oluruz
-- Bunun yerine sadece islem yapacagimiz Salary sutununu kilitleyelim
-- For Update of Salary seklinde yazmam�z laz�m

Declare
    Cursor c_emp IS Select * From Employees2 FOR UPDATE Of Salary;
    -- For Update Of Salary dedigimizde sadece Salary kilitlenmis olacakt�r
Begin
    For r_emp IN c_emp
    LOOP
        if r_emp.Salary < 5000 Then
            
            Update Employees2
            Set Salary = Salary * 1.20
            Where Employee_id = r_emp.Employee_id;
            
        End if;    
    END LOOP;
    Commit;
End;
/
Select * From Employees2 Where Salary < 5000;
/

-- Cursor - FOR UPDATE ve WHERE CURRENT OF Kullan�m�
-- Yukar�daki ornekte
-- Where Employee_id = r_emp.Employee_id; yerine sunu yazabiliriz
-- Where CURRENT OF c_emp; yukaridaki sat�rla ayn� anlamdad�r
-- en son okunan kayd� guncelle demektir
 
Declare
    Cursor c_emp IS Select * From Employees2 FOR UPDATE Of Salary;
Begin
    For r_emp IN c_emp
    LOOP
        if r_emp.Salary < 5500 Then
            
            Update Employees2
            Set Salary = Salary * 1.20
            -- Where Employee_id = r_emp.Employee_id;
            Where CURRENT OF c_emp;
            -- yukaridaki sat�rla ayn� anlamdad�r
            -- en son okunan kayd� guncelle demektir
            dbms_output.put_line(r_emp.Employee_id || ' Update edildi');
        End if;    
    END LOOP;
    Commit;
End;
/
-- DELETE islemi icinde ayn� yontem yapacag�z
-- yani Select * From Employees2 FOR UPDATE; yazacagiz
-- Employee_id >= 204 olan kay�tlar� silelim
Declare
    Cursor c_emp IS Select * From Employees2 Where Employee_id >= 204 FOR UPDATE;
Begin
    For r_emp IN c_emp 
    LOOP
            dbms_output.put_line(r_emp.Employee_id || ' Delete edildi');
            Delete Employees2           
            -- Where Employee_id = r_emp.Employee_id;
            Where CURRENT OF c_emp;
            -- yukaridaki sat�rla ayn� anlamdad�r
            -- en son okunan kayd� guncelle demektir
    END LOOP;
    -- RollBack;
    Commit;
End;
/

Declare
    Cursor c_emp IS Select * From Employees2 Where Employee_id <= 110 FOR UPDATE;
Begin
    For r_emp IN c_emp
    LOOP
            dbms_output.put_line(r_emp.Employee_id || ' Delete edildi');
            Delete Employees2           
             Where Employee_id = r_emp.Employee_id;
            --Where CURRENT OF c_emp;
            -- yukaridaki sat�rla ayn� anlamdad�r
            -- en son okunan kayd� guncelle demektir
    END LOOP;
    -- RollBack;
    Commit;
End;
/

--*********************************************************************************************
-- CURSORS WITH PARAMETERS (imle�lerde Parametre Kullan�m�)
--*********************************************************************************************
-- Once Normal yazal�m, sonra parametrik yapal�m
Declare
      Cursor c_emp IS Select Department_id, Employee_id, Last_name
                      From Employees
                      Where Department_id = 20;                      
      r_emp c_emp%rowtype;      
Begin
      Open c_emp;      
        LOOP
          Fetch c_emp INTO r_emp;
          Exit When c_emp%NotFound;
          
          dbms_output.put_line(' Department_id : '  || r_emp.Department_id ||
                               ' Employee_id : '    || r_emp.Employee_id   ||
                               ' Last_name : '      || r_emp.Last_name
                              );                
        END LOOP;      
      Close c_emp;
End;
/
-- Simdi yukar�daki sorguyu parametrik yazal�m

Declare
      Cursor c_emp(wDept_id Employees.Department_id%type)
      IS
          Select Department_id, Employee_id, Last_name
          From Employees
          Where Department_id = wDept_id;
          -- c_emp parantezinde parametre tan�mlad�k ve Where kosuluna yazd�k                 

      r_emp c_emp%rowtype;      

Begin
      -- Open c_emp;  -- Parametre yazd�g�m�z icin ve
                      -- DEFAULT deger vermedigimiz icin bu sekilde acilmaz
                      -- parametre gondermemiz laz�m
      Open c_emp(20);
      -- Parametrik yazd�k, 20 nolu Department_id bilgisini okuyacagiz
      
        LOOP
          Fetch c_emp INTO r_emp;
          Exit When c_emp%NotFound;
          
          dbms_output.put_line(' Department_id : '  || r_emp.Department_id ||
                               ' Employee_id : '    || r_emp.Employee_id   ||
                               ' Last_name : '      || r_emp.Last_name
                              );                
        END LOOP;      
      Close c_emp;
End;
/

-- Yukar�daki sorguda Cursor icerisine Default deger tan�mlayal�m

Declare
      Cursor c_emp(wDept_id Employees.Department_id%type DEFAULT 30)
      IS
          Select Department_id, Employee_id, Last_name
          From Employees
          Where Department_id = wDept_id;
          -- c_emp parantezinde parametre tan�mlad�k ve Where kosuluna yazd�k                 

      r_emp c_emp%rowtype;      

Begin
      -- Open c_emp;  -- Parametre DEFAULT 30 verdigimiz icin
                      -- bu sekilde yazabiliriz, bu durumda Defaulttaki degere
                      -- gore sorgu cal�s�r, burada 30 nolu departmant bilgileri gelir
                      
         Open c_emp(20); -- Parametre gonderirsek parametreye gore bilgi gelir
      -- Parametrik yazd�k, 20 nolu Department_id bilgisini okuyacagiz
      
      -- Open c_emp();  -- Defaulttaki degere gore sorgu cal�s�r
      -- Open c_emp;    -- Defaulttaki degere gore sorgu cal�s�r
      
        LOOP
          Fetch c_emp INTO r_emp;
          Exit When c_emp%NotFound;
          
          dbms_output.put_line(' Department_id : '  || r_emp.Department_id ||
                               ' Employee_id : '    || r_emp.Employee_id   ||
                               ' Last_name : '      || r_emp.Last_name
                              );                
        END LOOP;      
      Close c_emp;
End;

/


--*********************************************************************************************
-- CURSORS WITH PARAMETERS (imle�lerde Parametre Kullan�m�)(NESTED CURSORS)
--*********************************************************************************************
-- Ornek
-- Lokasyon(Locations) ===> Bolumler(Departments) ===> Calisanlar(Employees)

-- 3 Tablo oldugu icin 3 tane Cursor kullanacagiz,
-- Ad�m Ad�m Yazal�m

Declare
      Cursor c_loc IS Select Location_id, City From Locations Order By City;
      r_loc  c_loc%ROWTYPE;
Begin
      Open c_loc;
        Loop
          Fetch c_loc INTO r_loc;
          Exit When c_loc%NotFound;
          dbms_output.put_line('Lokasyon : ' || r_loc.City || '(' || r_loc.Location_id || ')');
        End Loop;
      
      Close c_loc;
End;
/
-- Yukar�daki programda Location'lar� yazd�rd�k
-- Simdi Departments yazd�ral�m

Declare
      Cursor c_loc IS Select Location_id, City From Locations Order By City;
      r_loc  c_loc%ROWTYPE;
      
      
      Cursor c_dep(p_loc_id Departments.Location_id%type) IS
                  Select Department_id, Department_Name, Location_id
                  From Departments
                  Where Location_id = p_loc_id
                  Order By Department_Name;
      r_dep  c_dep%ROWTYPE;
      
Begin
      Open c_loc;
        Loop
          Fetch c_loc INTO r_loc;
          Exit When c_loc%NotFound;
          dbms_output.put_line('Lokasyon : ' || r_loc.City || '(' || r_loc.Location_id || ')');
      --**************************
      -- Simdi Department icin cursor acalim
              Open c_dep(r_loc.Location_id);
                Loop
                  Fetch c_dep INTO r_dep;
                  Exit When c_dep%NotFound;
                  dbms_output.put_line('        (' || r_loc.Location_id || ')' ||
                                       ' Department : ' || r_dep.Department_Name ||
                                       '(' || r_dep.Department_id || ')'
                                       );
                End Loop;              
              Close c_dep;
        End Loop;      
      Close c_loc;
End;
/
-- Yukar�daki programda Location'lar� ve Department'lar� yazd�rd�k
-- Simdi Employees yazd�ral�m

Declare
      Cursor c_loc IS Select Location_id, City From Locations Order By City;
      r_loc  c_loc%ROWTYPE;     
      
      Cursor c_dep(p_loc_id Departments.Location_id%type) IS
                  Select Department_id, Department_Name, Location_id
                  From Departments
                  Where Location_id = p_loc_id
                  Order By Department_Name;
      r_dep  c_dep%ROWTYPE;

     Cursor c_emp(p_dep_id Employees.Employee_id%type) IS
                  Select Employee_id, First_Name, Last_Name, Department_id
                  From Employees
                  Where Department_id = p_dep_id
                  Order By Employee_id;
      r_emp  c_emp%ROWTYPE;      
Begin
      Open c_loc;
        Loop
          Fetch c_loc INTO r_loc;
          Exit When c_loc%NotFound;
          dbms_output.put_line('Lokasyon : ' || r_loc.City || '(' || r_loc.Location_id || ')');
      --**************************
      -- Simdi Department icin cursor acalim
              Open c_dep(r_loc.Location_id);
                Loop
                  Fetch c_dep INTO r_dep;
                  Exit When c_dep%NotFound;
                  dbms_output.put_line('        (' || r_loc.Location_id || ')' ||
                                       ' Department : ' || r_dep.Department_Name ||
                                       '(' || r_dep.Department_id || ')'
                                       );
                      --**************************
                      -- Simdi Employees icin cursor acalim
                              Open c_emp(r_dep.Department_id);
                                Loop
                                  Fetch c_emp INTO r_emp;
                                  Exit When c_emp%NotFound;
                                  dbms_output.put_line('                '                  ||
                                                       'Employee_Name : ' || r_emp.First_Name  || ' ' ||
                                                                             r_emp.Last_Name   || ' ' ||
                                                       'Employee_id: ' || r_emp.Employee_id ||
                                                       '(' || r_emp.Department_id || ')');
                                End Loop;
                              Close c_emp;
                                  dbms_output.put_line(' ');-- Dongu bittiginde bos satir ekliyorum,
                                                            -- istersen ekleyebilirsin, Tercihe gore
                                  dbms_output.new_line;-- dbms_output.put_line(' ');
                                  -- Yukar�daki 2 komutta ayn� isi yapar, Yeni bir sat�ra gecer
                --**************************
                End Loop;              
              Close c_dep;
      --**************************                    
        End Loop;      
      Close c_loc;
End;
/
-- Simdi Yukar�daki program� sadelestirelim
Declare
      Cursor c_loc IS Select Location_id, City From Locations Order By City;
      r_loc  c_loc%ROWTYPE;
            
      Cursor c_dep(p_loc_id Departments.Location_id%type) IS
                  Select Department_id, Department_Name, Location_id
                  From Departments
                  Where Location_id = p_loc_id
                  Order By Department_Name;
      r_dep  c_dep%ROWTYPE;

     Cursor c_emp(p_dep_id Employees.Department_id%type) IS
                  Select Employee_id, First_Name, Last_Name, Department_id
                  From Employees
                  Where Department_id = p_dep_id
                  Order By Employee_id;
      r_emp  c_emp%ROWTYPE;-- Bu tur tan�mlamalara
                           -- Record veri tipi veya Referans veri tipi denir
      
Begin
      Open c_loc;
        Loop
          Fetch c_loc INTO r_loc;
          Exit When c_loc%NotFound;
          dbms_output.put_line('Lokasyon : ' || r_loc.City || '(' || r_loc.Location_id || ')');
      -- Simdi Department icin cursor acalim
              Open c_dep(r_loc.Location_id);
                Loop
                  Fetch c_dep INTO r_dep;
                  Exit When c_dep%NotFound;
                  dbms_output.put_line('        (' || r_loc.Location_id || ')' ||
                                       ' Department : ' || r_dep.Department_Name
                                       );
                      -- Simdi Employees icin cursor acalim
                              Open c_emp(r_dep.Department_id);
                                Loop
                                  Fetch c_emp INTO r_emp;
                                  Exit When c_emp%NotFound;
                                  dbms_output.put_line('                '                  ||
                                                       r_emp.First_Name  || ' ' || r_emp.Last_Name   ||
                                                       '(' || r_emp.Employee_id || ')');                                                        
                                End Loop;
                              Close c_emp;
                End Loop;              
              Close c_dep;
        End Loop;      
      Close c_loc;
End;
/
-- Yukar�daki ornegi bir - iki degisiklik ile yeniden yapal�m

Declare
      Cursor c_loc IS Select Location_id, City From Locations Order By City;
      r_loc  c_loc%ROWTYPE;
            
      Cursor c_dep(p_loc_id Departments.Location_id%type) IS
                  Select Department_id, Department_Name, Location_id
                  From Departments
                  Where Location_id = p_loc_id
                  Order By Department_Name;
      r_dep  c_dep%ROWTYPE;

     Cursor c_emp(p_dep_id Employees.Employee_id%type) IS
                  Select Employee_id, First_Name || ' ' || Last_Name AdiSoyadi, Department_id, Job_id, Hire_Date
                  From Employees
                  Where Department_id = p_dep_id
                  Order By Employee_id;
      r_emp  c_emp%ROWTYPE;-- Bu tur tan�mlamalara
                           -- Record veri tipi veya Referans veri tipi denir
      
Begin
      Open c_loc;
        Loop
          Fetch c_loc INTO r_loc;
          Exit When c_loc%NotFound;
          dbms_output.put_line('Lokasyon : ' || r_loc.City || '(' || r_loc.Location_id || ')');
      -- Simdi Department icin cursor acalim
              Open c_dep(r_loc.Location_id);
                Loop
                  Fetch c_dep INTO r_dep;
                  Exit When c_dep%NotFound;
                  dbms_output.put_line('        (' || r_loc.Location_id || ')' ||
                                       ' Department : ' || r_dep.Department_Name
                                       );
                      -- Simdi Employees icin cursor acalim
                              Open c_emp(r_dep.Department_id);
                                Loop
                                  Fetch c_emp INTO r_emp;
                                  Exit When c_emp%NotFound;
                                  dbms_output.put_line('                ' || r_emp.AdiSoyadi   ||
                                                       '(' || r_emp.Employee_id || '-'
                                                           || r_emp.Job_id || '-'
                                                           || to_Char(r_emp.hire_date,'dd/mm/yyyy') || ')');                                                        
                                End Loop;
                              Close c_emp;
                End Loop;              
              Close c_dep;
        End Loop;      
      Close c_loc;
End;
/

--Ornek

-- her bir personelin Adi Soyad? yani fullname yazal?m
-- yan?na toplam freight degerlerini yazal?m
-- bu sorguyu hem join ile hemde subquery ile yapal?m
-- Tablolar: hr_employees ve Sales_Orders tablosun

-- join ile cozum

Select 
        firstname || ' ' || lastname as FullName,
        Sum(o.Freight) as TotalFreight
From Sales_Orders o
join hr_employees e on e.empid = o.empid
Group By firstname, lastname
Order By FullName;

-- SubQuery ile cozum

Select
        --e.empid,
        firstname || ' ' || lastname as FullName,
        (
            Select Sum(o.freight) as TotalFreight
            From Sales_Orders o
            Where empid = e.empid
        ) as TotalFreight
From hr_employees e
Order By FullName;

-- Saglamas?n? minus ile yapal?m

Select 
        firstname || ' ' || lastname as FullName,
        Sum(o.Freight) as TotalFreight
From Sales_Orders o
join hr_employees e on e.empid = o.empid
Group By firstname, lastname

minus

Select
        --e.empid,
        firstname || ' ' || lastname as FullName,
        (
            Select Sum(o.freight) as TotalFreight
            From Sales_Orders o
            Where empid = e.empid
        ) as TotalFreight
From hr_employees e
Order By FullName;

-- Sonuc bos kume geldigi icin
-- bilgilerin ayn? oldugunu anl?yoruz

--06102023
Set ServerOutPut ON;
/
--*********************************************************************************************
-- Sys Ref Cursors
-- SYS_REFCURSORS
--*********************************************************************************************
-- Cursorlar� simdiye kadar Cursor anahtar kelimesi ile kulland�k

-- Cursorlar; Cursor anahtar kelimesi kullanmadan da tan�mlanabilir
-- Yani bir degisken tipi(Data Type) gibi tan�myalabiliriz

-- Ornek: Calisanlar�n maaslar�n� %30 zaml� gosteren bir program yaz�n�z

Declare
    w_imlec SYS_REFCURSOR;
    w_eskimaas Employees.Salary%Type;
    w_yenimaas Employees.Salary%Type;
Begin
    
    --Open w_imlec For 'Select Salary, Salary * 1.30 From Employees Where Department_id = 100';
     Open w_imlec For ('Select Salary, Salary * 1.30 From Employees Where Department_id = 100');
      Loop
        Fetch w_imlec into w_eskimaas, w_yenimaas;
        Exit When w_imlec%NotFound;
        dbms_output.put_line('Eski Maas = ' || w_eskimaas || ' Yeni Maas = ' || w_yenimaas);
      End Loop;    
    Close w_imlec;
End;
/
-- veya sorguyu bir w_query gibi bir degisken icine kayabiliriz;
Declare
    w_imlec SYS_REFCURSOR;
    w_query VarChar2(2000);
    w_eskimaas Employees.Salary%Type;
    w_yenimaas Employees.Salary%Type;
Begin
    w_query:= 'Select Salary, Salary * 1.30 From Employees Where Department_id = 100';
    Open w_imlec For w_query;
      Loop
        Fetch w_imlec into w_eskimaas, w_yenimaas;
        Exit When w_imlec%NotFound;
        dbms_output.put_line('Eski Maas = ' || w_eskimaas || ' Yeni Maas = ' || w_yenimaas);
      End Loop;    
    Close w_imlec;
End;
/
-- Simdi yukar�daki sorguya Update islemini ekleyelim

-- Drop Table Employees2;
-- Create Table Employees2 as Select * From Employees;

Declare
    w_imlec SYS_REFCURSOR;
    w_query VarChar2(2000);
    w_eskimaas Employees2.Salary%Type;
    w_yenimaas Employees2.Salary%Type;
    w_empid Employees2.Employee_id%Type;

Begin
    w_query:= 'Select Employee_id, Salary, Salary * 1.30 From Employees2 Where Department_id = 100';
    Open w_imlec For w_query;
    
      Loop
        Fetch w_imlec into w_empid, w_eskimaas, w_yenimaas;
        Exit When w_imlec%NotFound;
        
        Update Employees2
        Set Salary = Salary * 1.30
        Where employee_id = w_empid;
        
                dbms_output.put_line('('||w_empid || ')Eski Maas = ' || w_eskimaas || ' Yeni Maas = ' || w_yenimaas);
        Commit;
      End Loop;    
    Close w_imlec;
End;
/
--*********************************************************************************************
-- Composite Data Types (Karma Veri Tipleri)
--*********************************************************************************************
-- Hazir veri tiplerinden faydalanilarak
-- yeni veri tipleri olusturmaya Composite Data Types denir

-- 2 Turludur
  -- A) Collection Data Types
  -- B) Record Data Types


  -- A) Collection Data Types
      --  1)Associative Array Index By Table  -- PL/SQL Table ismi verilmektedir
      --  2)Nested Table                      -- PL/SQL Table ismi verilmektedir  
      --  3)Varray(Variable Size Array-Degi�ken Uzunluklu Dizi)
      
      --*** Yukar�daki A)===> 1) ve 2) -- PL/SQL Table ismi verilmektedir
      
  -- B) Record Data Types
      -- 1) Table-Bases Records               -- %ROWTYPE ismi verilmektedir
      -- 2) Cursor-Bases Records              -- %ROWTYPE ismi verilmektedir
      -- 3) Developer-Define Records

      --*** Yukar�daki B)===> 1) ve 2) -- %ROWTYPE ismi verilmektedir

-- Simdi Bunlar� inceleyelim

  -- A) Collection Data Types
      --  1)Associative Array Index By Tables  -- PL/SQL Table ismi verilmektedir
 
 
      
-- Syntax su sekildedir;
-- TYPE <Veritipi_ismi> IS TABLE OF <deger_veri_tipi> INDEX BY <index_veri_tipi>

Declare
    Type t_dizi IS TABLE OF Pls_Integer INDEX BY Pls_Integer;
    wdizi t_dizi;
Begin
    wdizi(1):= 15; -- Yani dizi'nin 1.eleman�na 15 say�s�n� at�yoruz
    dbms_output.put_line(wdizi(1));
    
    wdizi(2):= 35; -- Yani dizi'nin 2.eleman�na 35 say�s�n� at�yoruz
    dbms_output.put_line(wdizi(2));

    wdizi(3):= 150; -- Yani dizi'nin 3.eleman�na 150 say�s�n� at�yoruz
    dbms_output.put_line(wdizi(3));
End;
/
-- Simdi bir ornek yapal�m
-- Ornek; Say�lar�n Karesi
/*
  TYPE t_assoc_num IS TABLE OF Pls_Integer INDEX BY Pls_Integer;
  wkare t_assoc_num;
  
  wkare(2)'nin degeri 4 olacakt�r,
  wkare(3)'nin degeri 9 olacakt�r,
*/
Declare
    Type t_assoc_num IS TABLE OF Pls_Integer INDEX BY Pls_Integer;
    wkare t_assoc_num;
Begin
    wkare(2):= 2*2;
    dbms_output.put_line(wkare(2));
    
    wkare(3):= 4*9*2+24; -- Yani dizi'nin 3.eleman�na 96 say�s�n� at�yoruz
    dbms_output.put_line(wkare(3));
End;
/
-- Simdi yukar�y� bir donguye koyal�m

Declare
    Type t_assoc_num IS TABLE OF Pls_Integer INDEX BY Pls_Integer;
    wkare t_assoc_num;
    
Begin
    For i in 1..10
    Loop
      wkare(i):= i*i;
      dbms_output.put_line(i || ' Say�s�n�n Karesi : ' || wkare(i));    
    End Loop;
End;
/
-- Kuvvet alma fonksiyonu Power ile yapal�m      

Declare
    Type t_assoc_num IS TABLE OF Pls_Integer INDEX BY Pls_Integer;
    wkare t_assoc_num;  
    
Begin
    For i in 1..10 
    Loop
      wkare(i):= Power(i,2);
      dbms_output.put_line(i || ' Say�s�n�n Karesi : ' || wkare(i));    
    End Loop;
End;
/
-- Yukar�daki ornekte kup alal�m
Declare
    Type t_assoc_num IS TABLE OF Pls_Integer INDEX BY Pls_Integer;
    wkup t_assoc_num;
    
Begin
    For i in 1..10
    Loop
      wkup(i):= Power(i,3);
      dbms_output.put_line(i || ' Say�s�n�n Kupu : ' || wkup(i));    
    End Loop;
End;
/

-- Simdi once okuyal�m sonra yazd�ral�m
Declare
    Type t_assoc_num IS TABLE OF Pls_Integer INDEX BY Pls_Integer;
    wkup t_assoc_num;
    
Begin
    For i in 1..10 Loop
      wkup(i):= Power(i,3);
    End Loop;

    For j in 1..10 Loop
      dbms_output.put_line(j || ' Say�s�n�n Kupu : ' || wkup(j));    
    End Loop;   
End;
/
-- Associative Array Index By Tables Ornek yapmaya devam edelim
-- While ile yapal�m

Declare
    Type t_assoc_num IS TABLE OF Pls_Integer INDEX BY Pls_Integer;
    wkup t_assoc_num;    
    j Number;
Begin
    For i in 1..10 Loop
      wkup(i):= Power(i,3);
    End Loop;

    j:= wkup.first; -- Dizinin ilk kayd�na konumlan�r
    
    While j is not null
    Loop
      dbms_output.put_line(j || ' Say�s�n�n Kupu : ' || wkup(j));    
      j:= wkup.Next(j); -- Dizinin j. s�ras�ndaki kayd�na konumlan�r
    End Loop;   
End;
/

-- Associative Array Index By Tables Ornek yapmaya devam edelim
-- Yukar�daki Benzer ornegi Say�n�n karesi icin yapal�m
-- Ornek 1 de INDEX VE DEGER, her ikiside say�sal olarak yap�yoruz

Declare
    Type t_assoc_num IS TABLE OF Pls_Integer INDEX BY Pls_Integer;
    wkare t_assoc_num;    
    j Number;
Begin
    For i in 1..10 Loop
      wkare(i):= Power(i,2);
    End Loop;

    j:= wkare.first; -- Dizinin ilk kayd�na konumlan�r
    
    While j is not null Loop
      dbms_output.put_line(j || ' Say�s�n�n Karesi : ' || wkare(j));    
      j:= wkare.Next(j); -- Dizinin j. s�ras�ndaki kayd�na konumlan�r
    End Loop;   
End;
/
-- Associative Array Index By Tables Ornek yapmaya devam edelim
-- Simdi ki ornekte INDEX'i(Tamsay�) ve DEGER'i(Varchar2) olarak yapal�m
-- Ornek 2 olarak Employees tablosundaki ilk 10 kayd� diziye aktaran ve ekrana yazan program yazal�m
-- Ornek 1 de INDEX VE DEGER, her ikiside say�sal olarak yapt�k
-- Ornek 2 de INDEX'i(Tamsay�) ve DEGER'i(Varchar2) olarak yapal�m

Declare
    Type t_assoc_str IS TABLE OF Employees.Last_Name%Type INDEX BY Pls_Integer;
    --veya Type t_assoc_str IS TABLE OF Employees.Last_Name%Type INDEX BY Binary_Integer;
    --veya Type t_assoc_str IS TABLE OF Varchar2(25) INDEX BY Binary_Integer;
    wlast_name t_assoc_str;    
    j Number;
Begin
    j:= 0;
    For i in (Select Last_Name From Employees Where RowNum <= 10) Loop
      j:= j + 1;
      wlast_name(j):= i.Last_Name;
      dbms_output.put_line('wlast_name(' || j || ')=' || wlast_name(j));
    End Loop;
End;
/
-- Associative Array Index By Tables Ornek yapmaya devam edelim
-- Simdi ki ornekte INDEX'i(Varchar2) ve DEGER'i(Varchar2) olarak yapal�m
-- Ornek 3 olarak ..........
-- Ornek 1 de INDEX'i(Tamsay�)  ve DEGER'i (Tamsay�), her ikisinide say�sal olarak yapt�k
-- Ornek 2 de INDEX'i(Tamsay�)  ve DEGER'i(Varchar2) olarak yapt�k
-- Ornek 3 de INDEX'i(Varchar2) ve DEGER'i(Varchar2) olarak yapal�m

-- Cal�smam�z� jobs tablosunda yapal�m
/
Desc Jobs;
/

Declare
    Type t_assoc_str2 IS TABLE OF Varchar2(35) INDEX BY Varchar2(10); -- Veya
    --Type t_assoc_str2 IS TABLE OF Jobs.Job_Title%Type INDEX BY Jobs.Job_id%Type;    
    wjobs t_assoc_str2;
Begin
    For i in (Select Job_id, Job_Title From Jobs) Loop
      wjobs(i.Job_id):= i.Job_Title;
      dbms_output.put_line('wjobs(' || i.Job_id || ')=' || wjobs(i.Job_id));
    End Loop;
End;
/
-- veya once atayal�m sonra yazd�ral�m
Declare
    --Type t_assoc_str2 IS TABLE OF Varchar2(35) INDEX BY Varchar2(10); -- Veya
    Type t_assoc_str2 IS TABLE OF Jobs.Job_Title%Type INDEX BY Jobs.Job_id%Type;    
    wjobs t_assoc_str2;
    --j Varchar2(10);
    j Jobs.Job_id%Type;
Begin
    For i in (Select Job_id, Job_Title From Jobs) Loop
      wjobs(i.Job_id):= i.Job_Title;
      --dbms_output.put_line('wjobs(' || i.Job_id || ')=' || wjobs(i.Job_id));
    End Loop;  
   
   For s in (Select Job_id From Jobs) Loop
      dbms_output.put_line('wjobs(' || s.Job_id || ')=' || wjobs(s.Job_id));
    End Loop;  
End;
/
-- Simdi Collection Data Types'�n Nested Table konusuna gecelim
-- A) Collection Data Types
      --  2)Nested Table                      -- PL/SQL Table ismi verilmektedir  

/*
 Associative Array Index By Tables icerisinde INDEX tipini belirliyebiliyorduk
 integer olabilir, String olabilir
 ama Nested Table'da INDEX belirleyemiyoruz, Cunku daima integer'd�r
 */

-- Ornek 1; Ogrenci ve S�nav puan�n� bir dizide tutacagiz

Set ServerOutPut ON;
/
Declare
    Type ndt_isimler IS TABLE OF Varchar2(10);  -- Goruldugu gibi INDEX belirtmiyoruz
    -- Yukar�daki ndt_isimler herhangi bir isim olabilir
    Type ndt_puanlar IS TABLE OF Integer;
    
    isimler ndt_isimler;
    puanlar ndt_puanlar;
Begin
    isimler := ndt_isimler('Ali', 'Yaren', 'Pinar', 'Ahmet', 'Bedir');
    Puanlar := ndt_puanlar(100, 99, 96, 97, 99);
    -- yukar�daki atama metodu Kurucu(Yap�c�/Constructor) Method olarak adland�r�l�r
    -- COUNT : Dizideki elaman say�s�n� bulan dizi metodudur
    
    dbms_output.put_line('Toplam Ogrenci Sayisi : ' || isimler.count);
    
    For i in 1..isimler.count
    Loop
      dbms_output.put_line('Ogrenci : ' || isimler(i) || ' Puan : ' || Puanlar(i));    
    End Loop;
End;
/
-- Nested Table Veri Tiplerine 2. bir Ornek yapal�m
-- Ornek 2; Personel isimlerini bir dizide tutal�m
-- Cursor tan�mlay�p yapal�m

Declare
    CURSOR c_employees IS SELECT first_name From Employees;
    
    --Type ndt_list IS TABLE OF Varchar2(50);
    Type ndt_list IS TABLE OF Employees.first_name%Type;
    --name_list ndt_list; -- Kurucu metod yontemi atamadan 
                        -- bunu bu sekilde calistirirsak hata aliriz
                        -- "Reference to uninitialized collection" hatas� al�r�z,
                        -- Bu nedenle kurucu metod ile tan�mlamam�z gerekir
    
    name_list ndt_list:= ndt_list();
    counter integer:=0;
Begin
    For n IN c_employees
    Loop
          counter := counter + 1;
          name_list.extend; -- veri girebilmek icin diziyi genisletiyoruz
          name_list(counter) := n.first_name;
          dbms_output.put_line('Employees(' || counter || '):' || name_list(counter));     
    
    End Loop;

End;
/
-- Nested Table Veri Tiplerine 3. bir Ornek yapal�m
-- Ornek 3; Personel isimlerini ve soyisimlerini bir dizide tutal�m 

Declare
    CURSOR c_employees IS SELECT first_name, last_name From Employees;
    
    -- Type ndt_list IS TABLE OF Employees.first_name%Type; -- Bunu degil Cursor'� referans alacag�z
    Type ndt_list IS TABLE OF c_employees%RowType;
    
    name_list ndt_list:= ndt_list();
    counter integer:=0;
Begin
    For n IN c_employees
    Loop
          counter := counter + 1;
          name_list.extend; -- veri girebilmek icin diziyi genisletiyoruz
          name_list(counter).first_name := n.first_name;
          name_list(counter).last_name := n.last_name;
          dbms_output.put_line('Employees(' || counter || '):' || 
                               name_list(counter).first_name || ' ' || 
                               name_list(counter).last_name);    
    End Loop;
End;
/
-- Simdi Collection Data Types'�n Varray konusuna gecelim
  -- A) Collection Data Types
      --  3)Varray(Variable Size Array-Degi�ken Uzunluklu Dizi)
      --  Varray Data Types
-- Varray Data Types-Syntax
TYPE type_name IS VARRAY (Size_Limit) OF element_type;
/
-- Ornek; 10 Boyutlu ve her bir h�cresinde 1 karakter de�er alan VARRAY veri tipi
TYPE puanlar IS VARRAY(10) Char(1);         TYPE tan�m�
-- Yani puanlar dizisi 10 boyutlu ve her bir boyuz 1 karakter uzunlugundad�r
/
TYPE puanlar IS VARRAY(10) Char(1);               -- TYPE tan�m�
puan puanlar:= puanlar('A','L','I','S','Q','L');  -- Constructor
-- Veya atamay� sonrada yapabiliriz yani su sekilde olabilir
puan puanlar:= puanlar();  -- Constructor
-- Bos parantez ile Constructor yap�s�n� kurar�z sonrada atamalar� yapar�z

puan puanlar:= puanlar('A','L','I','S','Q','L');  -- Constructor
-- Bu sekilde yapt���m�zda 10 Boyutlu array'l�k diziye 6 deger atad�k,
-- kalan 4 tanesi(bos degil, null degil) hicbir sey atanmam�s anlam�na gelir
-- kalan yerlere atama yapmak istersek .extend ile diziyi geni�letmemiz gerekir ve
-- atama yapabiliriz

-- Ornek yapal�m;
-- Futbol tak�mlar�n�n isimlerini ve s�ralamalar�n� bir dizide tutal�m
/*
    TYPE takimlar IS ARRAY(10) Varchar2(30);
    -- Varray'da 10 tane ile diziyi s�n�rlad�k, onceki 2 tan�mlamada da yani
    -- Associative Array Index By Tables ve Nested Tables'larda s�n�r yoktu
    -- Ama Varray'de s�n�r var
*/    
-- Nested Table ve Varray'lerde index tamsay� oldugu icin belirtmiyoruz
/
Declare
    TYPE takimlar IS ARRAY(10)OF Varchar2(30);
    -- takim takimlar := takimlar(); -- Constructor ile kurucu yap�y� yapt�k, sonrada atama yapabiliriz
    -- veya su sekilde de yapabiliriz
    takim takimlar := takimlar('GS','FB','BJK','TS');-- 10 Boyutlu dizinin 4 tanesini atad�k
Begin
    dbms_output.put_line('2001');
    dbms_output.put_line('----');
    
    For i IN 1.. takim.count
    Loop
      dbms_output.put_line(i || '.Tak�m ' || takim(i));    
    End Loop;    
End;
/
-- Yukar�daki programda takim.count yerine atanan 4 tane deger icin 4 yazarsakta calisir
-- ama 5 yazarsak hata verir,
-- her ne kadar dizi 10 olsada sadece 4 tane atand� ve extend ile 5. veri girilmeden
-- 5 defa dongu donmez, hata olmamas� icin takim.count ile kullanmak daha dogru olur
-- Yeni bir sayfada bu program� calistiralim

-- Asagidaki sorgu dongunun ust limiti 5 verildigi icin hata verecektir
-- cunku 4 elemanl? oldugu icin ust sinir 4 olabilir veya takim.count olabilir
Declare
    TYPE takimlar IS ARRAY(10)OF Varchar2(30);
    takim takimlar := takimlar('GS','FB','BJK','TS');-- 10 Boyutlu dizinin 4 tanesini atad�k
Begin
    dbms_output.put_line('2001');
    dbms_output.put_line('----');
    
    For i IN 1..5 Loop
      dbms_output.put_line(i || '.Tak�m ' || takim(i));    
    End Loop;    
End;
/
-- "Subscript beyond count" hatas� verecektir
-- Simdi 5 yerine 4 yazal�m, dogru calisacakt�r
Declare
    TYPE takimlar IS ARRAY(10)OF Varchar2(30);
    takim takimlar := takimlar('GS','FB','BJK','TS');-- 10 Boyutlu dizinin 4 tanesini atad�k
Begin
    dbms_output.put_line('2001');
    dbms_output.put_line('----');
    
    For i IN 1..4 Loop
      dbms_output.put_line(i || '.Tak�m ' || takim(i));    
    End Loop;    
End;
/
-- Yukar�daki ornegimizi gelistirelim
-- Ornek 2;

Declare
    TYPE takimlar IS ARRAY(10)OF Varchar2(30);
    takim takimlar := takimlar('GS','FB','BJK','TS');-- 10 Boyutlu dizinin 4 tanesini atad�k
Begin
    dbms_output.put_line('2001');
    dbms_output.put_line('----');
    
    For i IN 1..takim.count
    Loop
      dbms_output.put_line(i || '.Tak�m ' || takim(i));    
    End Loop;
    
    -- diziye 5. eleman ekleyelim ve 4. eleman� guncelleyelim
    takim.extend;
    takim(5):= 'Bursa Spor';
    takim(4):= 'izmir Spor';  -- 4. eleman� guncelledik
    
    dbms_output.new_line;
    
     For i IN 1..takim.count
     Loop
      dbms_output.put_line(i || '.Tak�m ' || takim(i));    
     End Loop;
    
    -- Dizinin elemanlar�n� yeniden tan�mlayal�m
    
    takim := takimlar('BursaSpor','DemirSpor','izmirSpor');
    -- dizi onceki sat�rlarda 5 boyutlu dizi haline gelmisti
    -- ama yukar�daki sat�rla s�f�rdan 3 boyutlu hale getirdik
    
    dbms_output.new_line;
    
     For i IN 1..takim.count
     Loop
      dbms_output.put_line(i || '.Tak�m ' || takim(i));    
    End Loop;    
End;
/
-- Simdi yukar�da gordugumuz 3 yap� icin farkl�l�klara bakal�m
-- Resmi slayt olarak ekleyebiliriz
  -- A) Collection Data Types
    -- 1)Associative Array Index By Table  tan�mlama DB'de olmas� gerekmiyorsa(Esnek ve s�n�rs�z index ise)
    -- 2)Nested Table                      tan�mlama DB'de olmas� gerekiyorsa (Esnek ve s�n�rs�z index ise)
    -- 3)Varray(Variable Size Array)       tan�mlama DB'de olmas� gerekiyorsa (S�n�rl� index ise)
      --(Degi�ken Uzunluklu Dizi)

-- Simdi yukar�daki 3 yap�y� ayn� ornek icerisinde kullanal�m ve konuyu daha iyi kavrayal�m
Declare
    TYPE t_nested IS TABLE OF     Varchar2(30); -- dizi.extend ile s�n�rs�z geni�letilebilir, INDEX integer'd�r
    TYPE t_varray IS VARRAY(5) OF Varchar2(30); -- dizi.extend ile Max 5 e kadar geni�letilebilir, INDEX integer'd�r
                                                -- Cunku Varray(5) olarak tan�mlad�k
    -- TYPE t_varray IS VARRAY(5) OF Number(16,2);    
    
    TYPE t_assoc_array_num  IS TABLE OF Number       INDEX BY Pls_Integer;
    TYPE t_assoc_array_str  IS TABLE OF Varchar2(30) INDEX BY Pls_Integer;
    TYPE t_assoc_array_str2 IS TABLE OF Varchar2(30) INDEX BY Varchar2(100);    
    
    ndt_var t_nested; -- ndt yani nested data types k�saltmas�n� kulland�m, herhangi bir isim olabilir
    varr_var t_varray;
    
    assoc_var1 t_assoc_array_num;
    assoc_var2 t_assoc_array_str;
    assoc_var3 t_assoc_array_str2;
Begin
    ndt_var:= t_nested('SQL','PL/SQL','DBA');
    varr_var:= t_varray(99.5,12,59,96);
    
    assoc_var1(99) := 30;
    assoc_var1(10) := 40;
    
    assoc_var2(20) := 'Elma';
    assoc_var2(29) := 'Muz';
    
    assoc_var3('izmir') := 'Ege Bolgesi';    
End;
/

-- Simdi yukar�dakileri yazd�ral�m

Declare
    TYPE t_nested IS TABLE OF     Varchar2(30); -- dizi.extend ile s�n�rs�z geni�letilebilir, INDEX integer'd�r
    TYPE t_varray IS VARRAY(5) OF Varchar2(30); -- dizi.extend ile Max 5 e kadar geni�letilebilir, INDEX integer'd�r
                                                -- Cunku Varray(5) olarak tan�mlad�k
    -- TYPE t_varray IS VARRAY(5) OF Number(16,2);    
    
    TYPE t_assoc_array_num  IS TABLE OF Number       INDEX BY Pls_Integer;
    TYPE t_assoc_array_str  IS TABLE OF Varchar2(30) INDEX BY Pls_Integer;
    TYPE t_assoc_array_str2 IS TABLE OF Varchar2(30) INDEX BY Varchar2(100);    
    
    ndt_var t_nested; -- ndt yani nested data types k�saltmas�n� kulland�m, herhangi bir isim olabilir
    varr_var t_varray;
    
    assoc_var1 t_assoc_array_num;
    assoc_var2 t_assoc_array_str;
    assoc_var3 t_assoc_array_str2;
Begin
    ndt_var:= t_nested('SQL','PL/SQL','DBA');
    varr_var:= t_varray(99.5,12,59,96);
    
    assoc_var1(99) := 30;
    assoc_var1(10) := 40;
    
    assoc_var2(20) := 'Elma';
    assoc_var2(29) := 'Muz';
    
    assoc_var3('izmir') := 'Ege Bolgesi';

    dbms_output.put_line('*** Nested Table ***');
    For i in 1..ndt_var.count
    Loop
      dbms_output.put_line('Nested Table : ' || ndt_var(i));
    End Loop;
    dbms_output.new_line;    
    
    dbms_output.put_line('*** Varray Table ***');    
    For i in 1..varr_var.count
    Loop
      dbms_output.put_line('Varray Table : ' || varr_var(i));
    End Loop;
    dbms_output.new_line;
    
      dbms_output.put_line('*** Associative Table ***');
      dbms_output.put_line('Associative Table Number ve Integer : ' || assoc_var1(10));
      dbms_output.put_line('Associative Table Number ve Integer :  : ' || assoc_var1(99));

      dbms_output.put_line('Associative Table String ve Integer : ' || assoc_var2(20));
      dbms_output.put_line('Associative Table String ve Integer : ' || assoc_var2(29));

      dbms_output.put_line('Associative Table String ve String : ' || assoc_var3('izmir'));    
End;
/

-- A) Collection Data Types
-- Hangi ortamlarda tan�mlanabilirler?  
    -- 1)Associative Array Index By Tables  Veritaban� icerisinde tan�mlanamaz, Sadece PL/SQL bloklar�nda tan�mlanabilir
    -- 2)Nested Tables                      Veritaban� icerisinde tan�mlanabilir, PL/SQL bloklar�nda tan�mlanabilir
    -- 3)Varrays(Variable Size Array)       Veritaban� icerisinde tan�mlanabilir, PL/SQL bloklar�nda tan�mlanabilir
      --(Degi�ken Uzunluklu Dizi)

-- Veritaban�nda tan�ml� veri tipleri listesini ve kaynak kodlar�n� nas�l gorebiliriz
-- ALL_TYPES, DBA_TYPES, USER_TYPES ( Bunlar VIEW'd�r)

Select * From USER_TYPES;
/
Select * From DBA_TYPES; -- DBA yetkisi ile baglanal�m/SYS veya SYSTEM ile baglanal�m
/
Select * From ALL_TYPES;
/
-- Onceki program uzerinde devam edelim
-- Ve Nested Tables ile Varray Tables tan�mlamalar�n� Database icinde yapal�m
-- Nested Tables ve Varray Tables tan�mlamalar� hem Database icinde hemde PL/SQL icinde yap�labilir
-- Ancak Associative Array Index By Tables tan�mlamalar� sadece PL/SQL icinde yap�labilir

Create or Replace TYPE t_nested IS TABLE OF     Varchar2(30);
/
Create or Replace TYPE t_varray IS VARRAY(5) OF Varchar2(30);
/
Create TYPE t_varrayB IS VARRAY(5) OF Varchar2(30);
/
Create or Replace TYPE t_varrayB IS VARRAY(5) OF Varchar2(30);
-- or Replace zorunlu degildir
/
-- Yukar�dakiler Database icerisinde olustu, kontrol edelim

Select * From User_Types;
/
-- Ancak Associative Array Index By Tables Database icerisinde tan�mlamaya kalkarsak hata verir
-- Derlenir ama hatal� derlenir, yapal�m sonrada Drop edelim
Create or Replace TYPE t_assoc_array_num IS TABLE OF Number INDEX BY Pls_Integer;
/
/*
    TYPE T_ASSOC_ARRAY_NUM compiled
    Errors: check compiler log
    Seklinde hata ald�k
*/

-- Database icerisinde olustu, ama hatal� olustu, kontrol edelim ve silelim
/
Select * From User_Types;
/
Drop Type t_assoc_array_num;
/

Select * From User_Types;
/
-- Peki yapt�g�m�z tan�mlamalar�n hangisinin Nested veya hangisinin Varray oldugunu nas�l gorebiliriz
-- Bunun icin USER_SOURCE view'�ndan faydanalacagiz

Select * From USER_SOURCE WHERE TYPE = 'TYPE';
-- Drop Type Adres_T;
/
Declare
    TYPE t_assoc_array_num  IS TABLE OF Number       INDEX BY Pls_Integer;
    TYPE t_assoc_array_str  IS TABLE OF Varchar2(30) INDEX BY Pls_Integer;
    TYPE t_assoc_array_str2 IS TABLE OF Varchar2(30) INDEX BY Varchar2(100);    
    
    ndt_var t_nested;
    varr_var t_varray;
    
    assoc_var1 t_assoc_array_num;
    assoc_var2 t_assoc_array_str;
    assoc_var3 t_assoc_array_str2;
Begin
    ndt_var:= t_nested('SQL','PL/SQL','DBA');
    varr_var:= t_varray(99.5,12,59,96);
    
    assoc_var1(99) := 30;
    assoc_var1(10) := 40;
    
    assoc_var2(20) := 'Elma';
    assoc_var2(29) := 'Muz';
    
    assoc_var3('izmir') := 'Ege Bolgesi';

    dbms_output.put_line('*** Nested Table ***');
    For i in 1..ndt_var.count Loop
      dbms_output.put_line('Nested Table : ' || ndt_var(i));
    End Loop;
    dbms_output.new_line;    
    
    dbms_output.put_line('*** Varray Table ***');    
    For i in 1..varr_var.count Loop
      dbms_output.put_line('Varray Table : ' || varr_var(i));
    End Loop;
    dbms_output.new_line;
    
      dbms_output.put_line('*** Associative Table ***');
      dbms_output.put_line('Associative Table Number ve Integer : ' || assoc_var1(10));
      dbms_output.put_line('Associative Table Number ve Integer :  : ' || assoc_var1(99));

      dbms_output.put_line('Associative Table String ve Integer : ' || assoc_var2(20));
      dbms_output.put_line('Associative Table String ve Integer : ' || assoc_var2(29));

      dbms_output.put_line('Associative Table String ve String : ' || assoc_var3('izmir'));    
End;
/
-- Collection Data Types'larda kullan�lan metodlar
-- Delete,  (Procedure) Dizi eleman�n� siler
-- Trim,    (Procedure) Dizinin son eleman�n� siler
-- Extend,  (Procedure) Diziye yeni eleman ekler
-- Exists,  (Function ) Eleman�n varl���n� kontrol eder(True/False)
-- First,   (Function ) Dizinin ilk indeksini return eder
-- Last,    (Function ) Dizinin son indeksini return eder
-- Count,   (Function ) Dizinin eleman say�s�n� return eder
-- Limit,   (Function ) Dizinin max. eleman say�s�n� return eder
-- Prior,   (Function ) Belirtilen dizinden �nceki dizini return eder
-- Next,    (Function ) Sonraki indeksi return eder

-- Ornekler

-- Delete,  (Procedure) Dizi eleman�n� siler

-- Delete       Dizinin tum elemanlar�n� siler
-- Delete(n)    Dizinin n. eleman�n� siler
-- Delete(m,n)  Dizinin m.ve n. dahil aradaki t�m elemanlar� siler

Declare
    Type ndt_sayilar IS TABLE OF Integer;
    dizi ndt_sayilar := ndt_sayilar(10,20,29,34,99,101,120,140,160);
Begin
    dbms_output.new_line;
    dbms_output.put_line('Orjinal -----');
    For i in 1..dizi.count Loop
        dbms_output.put_line('Dizi(' || i || ')=' || dizi(i));
    End Loop;
    
    dizi.Delete(2);
    dbms_output.new_line;
    dbms_output.put_line('2. Eleman Silindi -----');
    For i in 1..dizi.count Loop
        if dizi.Exists(i) Then
            dbms_output.put_line('Dizi(' || i || ')=' || dizi(i));
        Else
            dbms_output.put_line('Dizi(' || i || ')= Yok');
        End if;        
    End Loop;
    
    dizi(2):= '499';
    dbms_output.new_line;
    dbms_output.put_line('2. Eleman Eklendi -----');
    For i in 1..dizi.count Loop
        if dizi.Exists(i) Then
            dbms_output.put_line('Dizi(' || i || ')=' || dizi(i));
        Else
            dbms_output.put_line('Dizi(' || i || ')= Yok');
        End if;        
    End Loop;
    
    dizi.Delete(3,5); -- dizinin 3 ile 5 aras�ndaki elemanlar�n� siler
    dbms_output.new_line;
    dbms_output.put_line('3,4,5 aras� Elemanlar Silindi -----');
    dbms_output.put_line('Kalan Kay�t Say�s� = ' || dizi.count);
    For i in 1..dizi.count + 3 Loop -- 3 tane eleman silindigi icin count 3 eksildi hepsini gostermesi icin + 3 yazd�k
        if dizi.Exists(i) Then
            dbms_output.put_line('Dizi(' || i || ')=' || dizi(i));
        Else
            dbms_output.put_line('Dizi(' || i || ')= Yok');
        End if;        
    End Loop;

    dizi.Delete; -- Dizinin Tum elemanlar�n� siler
    dbms_output.new_line;
    dbms_output.put_line('Dizinin Tum elemanlar� Silindi -----');
    dbms_output.put_line('Kalan Kay�t Say�s� = ' || dizi.count);
    For i in 1..dizi.count Loop -- tum elemanlar silindigi icin bu count = 0 d�r ve Loop'a girmez
        if dizi.Exists(i) Then
            dbms_output.put_line('Dizi(' || i || ')=' || dizi(i));
        Else
            dbms_output.put_line('Dizi(' || i || ')= Yok');
        End if;        
    End Loop;
    
end;

/

-- Trim,    (Procedure) Dizinin son eleman�n� siler
-- Trim(n), (Procedure) Dizinin son n tane eleman�n� siler

-- Trim ile delete ayn� isi yap�yor gozuksede
-- Trim dizideki elemanlar� tamamen ortadan kald�r�r
-- Delete ise dizinin silinen hucresini tan�ms�z hale getirir

Declare
    Type varr_type IS VARRAY(10) OF Integer;
    var1 varr_type := varr_type(10,20,29,34,99,101,120,140,160);
Begin
    dbms_output.new_line;
    dbms_output.put_line('Orjinal -----');
    For i in 1..var1.count Loop
        dbms_output.put_line('var1(' || i || ')=' || var1(i));
    End Loop;
    
    var1.Trim;  -- Dizinin son eleman�n� tamamen siler

    dbms_output.new_line;
    dbms_output.put_line('Trim Dizinin son eleman�n� tamamen siler');
    For i in 1..var1.count Loop
        dbms_output.put_line('var1(' || i || ')=' || var1(i));
    End Loop;
    
    var1.Trim(3);  -- Dizinin son 3 eleman�n� tamamen siler

    dbms_output.new_line;
    dbms_output.put_line('Trim(3) Dizinin son 3 eleman�n� tamamen siler');
    For i in 1..var1.count Loop
        dbms_output.put_line('var1(' || i || ')=' || var1(i));
    End Loop;       
End;
/
-- Trim ile Delete aras�ndaki farka bakal�m

Declare
    Type varr_type IS VARRAY(10) OF Integer;
    var1 varr_type := varr_type(10,20,29,34,99,101,120,140,160);
Begin
    dbms_output.new_line;
    dbms_output.put_line('Orjinal -----');
    For i in 1..var1.count Loop
        dbms_output.put_line('var1(' || i || ')=' || var1(i));
    End Loop;
    
    var1.Trim(3);     -- Dizinin son 3 hucresini tamamen siler ama Drop ederek siler
    -- var1.Delete;     Bu ise Dizinin Tum hucrelerinin icerigini siler ama hucre kal�r
    -- Var1.Delete(2)   VARRAY dizi yonteminde  kullan�lamaz, yani parametreli kullan�lamaz
    -- Var1.Delete(2,4) VARRAY dizi yonteminde  kullan�lamaz, yani parametreli kullan�lamaz
    -- Var1.Delete(2)   Nested Table'larda kullan�labilir
    -- Var1.Delete(2,4) Nested Table'larda kullan�labilir
    
    dbms_output.new_line;
    dbms_output.put_line('Trim(3) Dizinin son 3 eleman�n� tamamen siler');
    For i in 1..var1.count Loop
        dbms_output.put_line('var1(' || i || ')=' || var1(i));
    End Loop;
    
    var1.delete;
    
    dbms_output.new_line;
    dbms_output.put_line('Delete Dizinin tum hucrelerinin icerigini siler');
    dbms_output.put_line('Kalan Dizi elemanlar�n�n Say�s� = ' || var1.count);
    For i in 1..6 Loop
        if var1.exists(i) Then
              dbms_output.put_line('var1(' || i || ')=' || var1(i));
        Else
              dbms_output.put_line('var1(' || i || ')= tan�ms�z'); -- yani hucreler duruyor ama tan�ms�z
        End if;
    End Loop;    
End;
/

-- Extend,  (Procedure) Diziye yeni eleman ekler
/*
  Bu Method hem nested hemde varray'de kullan�labilir
  Extend;       Diziye de�eri null olan 1 eleman ekler
  Extend(n);    Diziye de�eri null olan n eleman ekler
  Extend(n,i);  Diziye i.Eleman�n n kopyas�n� ekler(Dizi tan�m�nda Not Null olmas� gerekir) 
*/

Declare
      TYPE ndt_type IS TABLE OF INTEGER;
      var1 ndt_type:=ndt_type(10,20,30);
      i Integer;
Begin
      i:= var1.first;
      While i is not null
      Loop
          dbms_output.put_line('var1(' || i || ')= ' || var1(i));
          i:= var1.next(i);
      End Loop;
End;
/
-- Yukar�daki programa Extend ile 1 s�radaki 10 say�s�n� 2 defa ekleyelim

Declare
      TYPE ndt_type IS TABLE OF INTEGER;
      var1 ndt_type:=ndt_type(10,20,30);
      i Integer;
Begin
      i:= var1.first;
      While i is not null Loop
          dbms_output.put_line('var1(' || i || ')= ' || var1(i));
          i:= var1.next(i);
      End Loop;
     
      dbms_output.put_line('*** simdi Extend(2,1) yapal?m ve sonucu gorelim***'); 
      var1.Extend(2,1); -- 1. eleman olan 10 say�s�ndan 2 tane dizinin sonuna ekler
 
      i:= var1.first;
      While i is not null Loop
          dbms_output.put_line('var1(' || i || ')= ' || var1(i));
          i:= var1.next(i);
      End Loop;
End;
/
-- Yukar�daki programa Extend ile tek veri ekleyelim
Declare
      TYPE ndt_type IS TABLE OF INTEGER;
      var1 ndt_type:=ndt_type(10,20,30);
      i Integer;
Begin
      i:= var1.first;
      While i is not null Loop
          dbms_output.put_line('var1(' || i || ')=' || var1(i));
          i:= var1.next(i);
      End Loop;
      
      dbms_output.put_line('*** simdi Extend(2,1) yapal?m ve sonucu gorelim***'); 
      
      var1.Extend(2,1); -- 1. eleman olan 10 say�s�ndan 2 tane dizinin sonuna ekler
 
      i:= var1.first;
      While i is not null Loop
          dbms_output.put_line('var1(' || i || ')=' || var1(i));
          i:= var1.next(i);
      End Loop;
      
      dbms_output.put_line('*** simdi Extend yapal?m ve sonucu gorelim***'); 
      
      var1.Extend; -- Diziyi 1 hucre genisletir
      var1(6) :=99;-- Genisleyen diziye 99 say�s�n� ekliyoruz
    
      i:= var1.first;
      While i is not null Loop
          dbms_output.put_line('var1(' || i || ')=' || var1(i));
          i:= var1.next(i);
      End Loop;      
End;
/

r-- Simdi Yukar�daki kodu Procedure ile sadelestirelim
-- Yani tekrar tekrar kullan�lan dongu degerini Procedure yapal�m ve cag�ral�m

Declare
      TYPE ndt_type IS TABLE OF INTEGER;
      var1 ndt_type:=ndt_type(10,20,30);
      
      Procedure Yaz IS
            i Integer;
      Begin
            i:= var1.first;
            While i is not null Loop
                dbms_output.put_line('var1(' || i || ')=' || var1(i));
                i:= var1.next(i);
            End Loop;
                dbms_output.put_line('-----------------');
      End Yaz;
Begin
      Yaz;
      
      var1.Extend(2,1); -- 1. eleman olan 10 say�s�ndan 2 tane dizinin sonuna ekler
 
      Yaz;
      
      var1.Extend; -- Diziyi 1 hucre genisletir
      var1(6) :=99;-- Genisleyen diziye 99 say�s�n� ekliyoruz
      
      Yaz;    
End;
/
--
Declare
      TYPE ndt_type IS TABLE OF INTEGER;
      var1 ndt_type:=ndt_type(10,20,30);
      
      Procedure Yaz IS
          i Integer;
      Begin
            i:= var1.first;
            While i is not null Loop
                dbms_output.put_line('var1(' || i || ')=' || var1(i));
                i:= var1.next(i);
            End Loop;
                dbms_output.put_line('-----------------');
      End Yaz;
Begin
      Yaz;
      
      var1.Extend(2,1); -- 1. eleman olan 10 say�s�ndan 2 tane dizinin sonuna ekler
      Yaz;
      
      var1.Extend; -- Diziyi 1 hucre genisletir
      var1(6) :=99;-- Genisleyen diziye 99 say�s�n� ekliyoruz      
      Yaz;
      
      dbms_output.put_line('*** Delete(5) islemi yap?yoruz***');
      var1.Delete(5);
      Yaz;

      dbms_output.put_line('*** Extend(3 islemi yap?yoruz***');     
      var1.Extend(3); -- Diziyi 3 hucre genisletir
      Yaz;
End;
/
-- Type tan�mlamas�n� Nested Table ile not null demeden de kullanabiliriz
-- ama Varray Table ile NOT NULL kullanmak zorunday�z
Declare
      TYPE ndt_type IS TABLE OF INTEGER NOT NULL;
      var1 ndt_type:=ndt_type(10,20,30);
      
      Procedure Yaz IS
          i Integer;
      Begin
            i:= var1.first;
            While i is not null Loop
                dbms_output.put_line('var1(' || i || ')=' || var1(i));
                i:= var1.next(i);
            End Loop;
                dbms_output.put_line('-----------------');
      End Yaz;
Begin
      Yaz;
      
      var1.Extend(2,1); -- 1. eleman olan 10 say�s�ndan 2 tane dizinin sonuna ekler
      Yaz;
      
      var1.Extend; -- Diziyi 1 hucre genisletir
      var1(6) :=99;-- Genisleyen diziye 99 say�s�n� ekliyoruz      
      Yaz;
      
      var1.Delete(5);
      Yaz;
      
      var1.Extend(3); -- Diziyi 3 hucre genisletir
      Yaz;
End;
/
-- Simdi Yukar�daki ornegi VARRAY ile yapal�m

-- Type tan�mlamas�n� Nested Table ile not null demeden de kullanabiliriz
-- ama Varray Table ile NOT NULL kullanmakta fayda var, baz� islemlerde hata ile kars�lasabiliriz
-- ornek olarak bunu var1.Extend(2,1); hata verebilir
Declare
      TYPE varr_type IS VARRAY(10) OF INTEGER NOT NULL;                                                      
      var1 varr_type:=varr_type(10,20,30);
      
      Procedure Yaz IS
          i Integer;
      Begin
            i:= var1.first;
            While i is not null Loop
                dbms_output.put_line('var1(' || i || ')=' || var1(i));
                i:= var1.next(i);
            End Loop;
                dbms_output.put_line('-----------------');
      End Yaz;
Begin
      Yaz;
      
      var1.Extend(2,1); -- 1. eleman olan 10 say�s�ndan 2 tane dizinin sonuna ekler
      Yaz;
      
      var1.Extend; -- Diziyi 1 hucre genisletir
      var1(6) :=99;-- Genisleyen diziye 99 say�s�n� ekliyoruz      
      Yaz;
            
      var1.Extend(3); -- Diziyi 3 hucre genisletir
      Yaz;

      --var1.Delete(5);-- Varray ile Parametre kullan�lmaz
      var1.Delete;-- Varray ile Parametre kullan�lmaz
      dbms_output.put_line('***');
      Yaz;
      dbms_output.put_line('***');
End;

/

-- Exists,  (Function ) Eleman�n varl���n� kontrol eder(True/False)

Declare
      TYPE ndt_type IS TABLE OF Char(1);                                        
      var1 ndt_type:=ndt_type('P','L','/','S','Q','L');
Begin
      For i IN 1..6 Loop
          if var1.exists(i) Then
              dbms_output.put_line('var1(' || i || ')=' || var1(i));
          Else
              dbms_output.put_line('var1(' || i || ')= Eleman yok');
          End if;          
      End Loop;
          dbms_output.put_line('-----------------');
          
      var1.Delete(3);     
      For i IN 1..6
      Loop
          if var1.exists(i) Then
              dbms_output.put_line('var1(' || i || ')=' || var1(i));
          Else
              dbms_output.put_line('var1(' || i || ')= Eleman yok');
          End if;          
      End Loop;
          dbms_output.put_line('-----------------');      
End;
/
-- First,   (Function ) Dizinin ilk indeksini return eder
-- Last,    (Function ) Dizinin son indeksini return eder
-- Count,   (Function ) Dizinin eleman say�s�n� return eder
-- Limit,   (Function ) Dizinin max. eleman say�s�n� return eder

-- First, Last, Count ve Limit metodlar�n� ayn� ornek icerisinde inceleyelim
-- Oncelikle ornegimizi VARRAY ile yapal�m
-- Sonra Nested Table ve Associative Array Index By Table ile yapar�z

Declare
    Type varray_type IS VARRAY(15) OF Number;
    varr varray_type:= varray_type(10,22,35,49,50,99);
    
    Procedure Yaz IS
    
    Begin
        dbms_output.put_line('Varray.Count = ' || varr.Count);  -- Dizinin eleman say�s�n� verir
        dbms_output.put_line('Varray.Limit = ' || varr.Limit);  -- Dizinin boyutunu verir. Sadece VARRAY'lerde calisir
        dbms_output.put_line('Varray.first = ' || varr.first);  -- Dizinin ilk eleman�n�n INDIS'ini verir
        dbms_output.put_line('Varray.Last = ' || varr.Last);    -- Dizinin son eleman�n�n INDIS'ini  verir
    
    End Yaz;
Begin
    dbms_output.put_line('Orjinal Degerler');
    Yaz;
    
    varr.Extend; -- dizinin sonuna 1 tane ekler
    dbms_output.put_line('varr.Extend sonras�');
    Yaz;
    
    varr.Extend(2); -- dizinin sonuna 2 tane ekler
    dbms_output.put_line('varr.Extend(2) sonras�');
    Yaz;

    varr.Extend(5,4); -- dizinin 4 hucresindeki 49 de�erini dizinin sonuna 5 tane ekler
    dbms_output.put_line('varr.Extend(5,4) sonras�');
    Yaz;    

    varr.Trim; -- dizinin sonundaki hucreyi drop eder
    dbms_output.put_line('varr.Trim sonras�');
    Yaz;

   varr.Trim(2); -- dizinin sonundaki 2 hucreyi drop eder
    dbms_output.put_line('varr.Trim(2) sonras�');
    Yaz;
End;
/
-- Yukar�daki ornegimizi Nested Table ile yapal�m

Declare
    Type ndt_type IS TABLE OF Number;
    var1 ndt_type:= ndt_type(10,22,35,49,50,99);
    
    Procedure Yaz IS
    
    Begin
        dbms_output.put_line('var1.Count = ' || var1.Count);  -- Dizinin eleman say�s�n� verir
        dbms_output.put_line('var1.Limit = ' || var1.Limit);  -- Sadece VARRAY'lerde calisir, Burada bos gelir, Cunku limitsizdir, s�n�rs�zd�r
        dbms_output.put_line('var1.first = ' || var1.first);  -- Dizinin ilk eleman�n�n INDIS'ini verir
        dbms_output.put_line('var1.Last = ' || var1.Last);    -- Dizinin son eleman�n�n INDIS'ini  verir
    
    End Yaz;
Begin
    dbms_output.put_line('Orjinal Degerler');
    Yaz;
    
    var1.Extend; -- dizinin sonuna 1 tane ekler
    dbms_output.put_line('var1.Extend sonras�');
    Yaz;
    
    var1.Extend(2); -- dizinin sonuna 2 tane ekler
    dbms_output.put_line('var1.Extend(2) sonras�');
    Yaz;

    var1.Extend(5,4); -- dizinin 4 hucresindeki 49 de�erini dizinin sonuna 5 tane ekler
    dbms_output.put_line('var1.Extend(5,4) sonras�');
    Yaz;    

    var1.Trim; -- dizinin sonundaki hucreyi drop eder
    dbms_output.put_line('var1.Trim sonras�');
    Yaz;

   var1.Trim(2); -- dizinin sonundaki 2 hucreyi drop eder
    dbms_output.put_line('var1.Trim(2) sonras�');
    Yaz;
End;
/
-- Yukar�daki ornegimizi Associative Array Index By Table ile yapal�m

Declare
    Type Assc_type IS TABLE OF Number INDEX BY Pls_Integer; -- Sadece Integer yazarsak Associative'de hata verir
    -- var_assc Assc_type:= Assc_type(10,22,35,49,50,99); -- Associative Array Index By Table'larda Kurucu Method olmaz
                                                          -- Sadece Nested Table ve Varray'lerde kurucu method olur
    var_assc Assc_type;
    Procedure Yaz IS
    
    Begin
        dbms_output.put_line('var_assc.Count = ' || var_assc.Count);  -- Dizinin eleman say�s�n� verir
        dbms_output.put_line('var_assc.Limit = ' || var_assc.Limit);  -- Sadece VARRAY'lerde calisir, Burada bos gelir, Cunku limitsizdir, s�n�rs�zd�r
        dbms_output.put_line('var_assc.first = ' || var_assc.first);  -- Dizinin ilk eleman�n�n INDIS'ini verir
        dbms_output.put_line('var_assc.Last = ' || var_assc.Last);    -- Dizinin son eleman�n�n INDIS'ini  verir
    
    End Yaz;
Begin
    var_assc(1):= 10;
    var_assc(2):= 19;
    var_assc(3):= 20;
    var_assc(4):= 30;
    var_assc(5):= 40;
    var_assc(6):= 49;
    
    dbms_output.put_line('Orjinal Degerler');
    Yaz;
    
    -- var1.Extend; var1.Extend(2); -- Associative Array'lerde calismaz, bunun yerine direk atama yapabiliriz
    var_assc(7):= 59;
    var_assc(8):= 60;
    var_assc(9):= 99;
    dbms_output.put_line('***** var_assc(7) sonras� *****');
    Yaz;
    
    -- var_assc.Trim; -- Associative Array'lerde calismaz, bunun yerine Delete kullan�r�z
    var_assc.Delete(3); -- Dizinin 3. hucresindeki i�eri�i siler
    dbms_output.put_line('***** var_assc.Delete(3) Sonras� *****');
    Yaz;
    
    var_assc.Delete(1); -- Dizinin ilk/first hucresindeki i�eri�i siler
                        -- first metodu bu durumda tan�ms�z olan 1.hucredeki verinin degil,
                        -- ilk dolu olan hucrenin indis degerini verir
    dbms_output.put_line('***** var_assc.Delete(1) Sonras� ***** first metoduna dikkat edelim');
    Yaz;    
End;

/


-- Count, Limit, first, last Bunlar fonksiyon oldugu icin tek bas�na kullan�lmaz, inceleyelim
Declare
    Type Assc_type IS TABLE OF Number INDEX BY Pls_Integer; 
    var_assc Assc_type;
    Sayi Pls_Integer;
    
    Procedure Yaz IS
    
    Begin
        dbms_output.put_line('var_assc.Count = ' || var_assc.Count);  -- Dizinin eleman say�s�n� verir
        dbms_output.put_line('var_assc.Limit = ' || var_assc.Limit);  -- Sadece VARRAY'lerde calisir, Burada bos gelir, Cunku limitsizdir, s�n�rs�zd�r
        dbms_output.put_line('var_assc.first = ' || var_assc.first);  -- Dizinin ilk eleman�n�n INDIS'ini verir
        dbms_output.put_line('var_assc.Last = ' || var_assc.Last);    -- Dizinin son eleman�n�n INDIS'ini  verir    
    End Yaz;
Begin
    var_assc(1):= 10;
    var_assc(2):= 19;
    var_assc(3):= 20;
     
    dbms_output.put_line('Orjinal Degerler');
    Yaz;
    -- var_assc.Count; -- Count, Limit, first, last Bunlar fonksiyon oldugu icin tek bas�na bu sekilde kullan�lmaz
    -- bir degiskene atay�p kullanabiliriz, veya dbms_output.put_line(var_assc.Count); seklinde yazabiliriz
    Sayi:= var_assc.Count;    
    dbms_output.put_line(Sayi);
    dbms_output.put_line(var_assc.Count);


    -- ama var_assc.Delete bir procedure oldugu icin direk kullan�labilir
    var_assc.Delete(3);    
    Yaz;    
End;
/
-- Prior,   (Function ) Belirtilen dizinden �nceki dizini return eder
-- Next,    (Function ) Sonraki indeksi return eder

-- Ornegimizi VARRAY veri tipinde yapal�m
-- Bu islemler Associative Array ve Nested Table'larda kullan�labilir


Declare
    Type varr_type IS VARRAY(10) OF Number; 
    v_sayi varr_type:= varr_type();
Begin
    v_sayi.Extend(4); -- Diziyi 4 hucre olarak genislettik
    v_sayi(1):= 10;
    v_sayi(2):= 19;
    v_sayi(3):= 20;
    v_sayi(4):= 99;
     
    dbms_output.put_line('v_sayi.Prior(3) = ' || v_sayi.Prior(3));  -- 3.indis'ten onceki  indis degerini verir
    dbms_output.put_line('v_sayi.Next(3)  = ' || v_sayi.Next(3));   -- 3.indis'ten sonraki indis degerini verir
    
    dbms_output.put_line('v_sayi.Prior(6) = ' || v_sayi.Prior(6));  -- 6.indis'ten onceki  dolu olan son indis degerini verir
    dbms_output.put_line('v_sayi.Next(6)  = ' || v_sayi.Next(6));   -- 3.indis'ten sonraki indis degerini verir, olmad�g� icin bos gelir

    dbms_output.put_line('v_sayi.Prior(v_sayi.first) = ' || v_sayi.Prior(v_sayi.first));  -- ilk indis'ten onceki indis degerini verir,  olmad�g� icin bos gelir
    dbms_output.put_line('v_sayi.Next(v_sayi.Last)   = ' || v_sayi.Next (v_sayi.Last));   -- son indis'ten sonraki indis degerini verir, olmad�g� icin bos gelir

End;
/
-- Bu islemleri Nested Table ile yapal�m

Declare
    Type ndt_type IS TABLE OF Number; 
    v_sayi ndt_type:= ndt_type();
Begin
    v_sayi.Extend(4); -- Diziyi 4 hucre olarak genislettik
    v_sayi(1):= 10;
    v_sayi(2):= 19;
    v_sayi(3):= 20;
    v_sayi(4):= 99;
     
    dbms_output.put_line('v_sayi.Prior(3) = ' || v_sayi.Prior(3));  -- 3.indis'ten onceki  indis degerini verir
    dbms_output.put_line('v_sayi.Next(3)  = ' || v_sayi.Next(3));   -- 3.indis'ten sonraki indis degerini verir
    
    dbms_output.put_line('v_sayi.Prior(6) = ' || v_sayi.Prior(6));  -- 6.indis'ten onceki  dolu olan son indis degerini verir
    dbms_output.put_line('v_sayi.Next(6)  = ' || v_sayi.Next(6));   -- 3.indis'ten sonraki indis degerini verir, olmad�g� icin bos gelir

    dbms_output.put_line('v_sayi.Prior(v_sayi.first) = ' || v_sayi.Prior(v_sayi.first));  -- ilk indis'ten onceki indis degerini verir,  olmad�g� icin bos gelir
    dbms_output.put_line('v_sayi.Next(v_sayi.Last)   = ' || v_sayi.Next (v_sayi.Last));   -- son indis'ten sonraki indis degerini verir, olmad�g� icin bos gelir

End;
/
-- Bu islemleri Associative Array ile yapal�m

Declare
    Type assc_type IS TABLE OF Number INDEX BY Pls_Integer; 
    --v_sayi assc_type:= assc_type(); -- Associative Array'larda kurucu atama olmaz
    v_sayi assc_type;
Begin
    -- v_sayi.Extend(4); -- Diziyi 4 hucre olarak genisletme islemi Associative Array'larda olmaz
    v_sayi(1):= 10;
    v_sayi(2):= 19;
    v_sayi(3):= 20;
    v_sayi(4):= 99;
     
    dbms_output.put_line('v_sayi.Prior(3) = ' || v_sayi.Prior(3));  -- 3.indis'ten onceki  indis degerini verir
    dbms_output.put_line('v_sayi.Next(3)  = ' || v_sayi.Next(3));   -- 3.indis'ten sonraki indis degerini verir
    
    dbms_output.put_line('v_sayi.Prior(6) = ' || v_sayi.Prior(6));  -- 6.indis'ten onceki  dolu olan son indis degerini verir
    dbms_output.put_line('v_sayi.Next(6)  = ' || v_sayi.Next(6));   -- 3.indis'ten sonraki indis degerini verir, olmad�g� icin bos gelir

    dbms_output.put_line('v_sayi.Prior(v_sayi.first) = ' || v_sayi.Prior(v_sayi.first));  -- ilk indis'ten onceki indis degerini verir,  olmad�g� icin bos gelir
    dbms_output.put_line('v_sayi.Next(v_sayi.Last)   = ' || v_sayi.Next (v_sayi.Last));   -- son indis'ten sonraki indis degerini verir, olmad�g� icin bos gelir
End;
/


--*********************************************************************************************
-- Composite Data Types
--*********************************************************************************************

/*
-- Composite Data Types
-- 2 Turludur
  -- A) Collection Data Types --(Bunlar� inceledik)
  -- B) Record Data Types     --(Bunlar� inceleyelim)

  -- B) Record Data Types
      -- 1) Table-Bases Records               -- %ROWTYPE ismi verilmektedir
      -- 2) Cursor-Bases Records              -- %ROWTYPE ismi verilmektedir
      -- 3) Developer-Define Records

      --*** Yukar�daki B)===> 1) ve 2) -- %ROWTYPE ismi verilmektedir

-- Simdi Bunlar� inceleyelim
*/

--*********************************************************************************************
-- B) Record Data Types(Kay�t Veri Turleri)
    -- 1) Table-Bases Records(Referans Veri Tipleri)      -- %ROWTYPE ismi verilmektedir
--*********************************************************************************************
/*
  Table-Bases Records - SYNTAX
  Declare
        ...
        <degisken_ismi>   <table_name>%rowtype;
        ...
  Begin
  
  End;
  
*/
-- Ornek; En yuksek maas alan kisinin ismini, soy ismini ve maa��n� yazd�ral�m
/
Declare
      calisanlar employees%rowtype;
Begin
    Select * INTO calisanlar
    From Employees
    Where Salary = (Select Max(Salary) From Employees);
    
    dbms_output.put_line('First Name : ' || calisanlar.First_Name);
    dbms_output.put_line('Last Name  : ' || calisanlar.Last_Name);
    dbms_output.put_line('Salary     : ' || calisanlar.Salary);
End;
/

--*********************************************************************************************
-- B) Record Data Types
      -- 2) Cursor-Bases Records              -- %ROWTYPE ismi verilmektedir
--*********************************************************************************************

/*
  Cursor-Bases Records - SYNTAX
  
Declare
    CURSOR <cursor_ismi> IS SELECT ....;
    <degisken_ismi>   <cursor_ismi>%rowtype;
Begin
    ...
End;

*/

-- Ornek; Ortalama maa�tan daha d���k maa� alanlar� listeleyelim

Declare
    CURSOR c_oku IS SELECT employee_id, first_name, last_name, Salary
                    From Employees
                    Where Salary <(Select AVG(Salary) From Employees);
    calisanlar c_oku%rowtype;                    
Begin
    Select AVG(Salary)
        INTO calisanlar.Salary
    From Employees; -- ortalama maas� calisanlar.Salary degiskeni icerisine att�k
    dbms_output.put_line('*** ORTALAMA MAA� : ***' || calisanlar.Salary);
    Open c_oku;
      Loop
        fetch c_oku into calisanlar;
        Exit When c_oku%NotFound;
        dbms_output.put_line(' Employee_id : ' || calisanlar.employee_id || 
                             ', First Name  : ' || calisanlar.first_name ||
                             ', Last Name   : ' || calisanlar.last_name || 
                             ', Salary      : ' || calisanlar.Salary);
      
      End Loop;    
    Close c_oku;
End;
/
-- Yukar�daki Ornekte dbms_output.put_line yerine
-- dbms_output.put kullan�rsak yeni sat�ra gecmez ayn� sat�rda kal�r
-- Yeni sat�ra gecmesi icin dbms_output.new_line yazabiliriz

Declare
    CURSOR c_oku IS SELECT employee_id, first_name, last_name, Salary
                    From Employees
                    Where Salary <(Select AVG(Salary) From Employees);
    calisanlar c_oku%rowtype;                    
Begin
    Select AVG(Salary) INTO calisanlar.Salary From Employees; -- ortalama maas� calisanlar.Salary degiskeni icerisine att�k
    dbms_output.put_line('*** ORTALAMA MAA� : ***' || calisanlar.Salary);
    Open c_oku;
      Loop
        fetch c_oku into calisanlar;
        Exit When c_oku%NotFound;
        dbms_output.put(' Employee_id : ' || calisanlar.employee_id || 
                             ', First Name  : ' || calisanlar.first_name ||
                             ', Last Name   : ' || calisanlar.last_name || 
                             ', Salary      : ' || calisanlar.Salary);
        dbms_output.new_line;
      End Loop;    
    Close c_oku;
End;
/
-- veya su sekilde yazal�m

Declare
    CURSOR c_oku IS SELECT employee_id, first_name, last_name, Salary
                    From Employees
                    Where Salary <(Select AVG(Salary) From Employees);
    calisanlar c_oku%rowtype;                    

Begin
    Select AVG(Salary) INTO calisanlar.Salary From Employees; -- ortalama maas� calisanlar.Salary degiskeni icerisine att�k
    dbms_output.put_line('*** ORTALAMA MAA� : ***' || calisanlar.Salary);

    Open c_oku;
      Loop
        fetch c_oku into calisanlar;
        Exit When c_oku%NotFound;

        dbms_output.put(' Employee_id : ' || calisanlar.employee_id);
        dbms_output.put(',First Name  : ' || calisanlar.first_name);
        dbms_output.put(',Last Name   : ' || calisanlar.last_name);
        dbms_output.put(',Salary      : ' || calisanlar.Salary);
        dbms_output.new_line;

      End Loop;    
    Close c_oku;
End;
/
--*********************************************************************************************
-- B) Record Data Types
      -- 3) Developer-Define Records(User-Define Records olarakta bilinir)
      --(Uygulama Gelistirici Taraf�ndan Gelistirilen Kay�tlard�r)

/*
  Developer-Define Records - SYNTAX

Declare
      TYPE <type_name> IS RECORD
      (
          field_name1 datatype1 [NOT NULL][:= DEFAULT EXPRESSION],
          field_name2 datatype2 [NOT NULL][:= DEFAULT EXPRESSION],
          ...
          field_nameN datatypeN [NOT NULL][:= DEFAULT EXPRESSION]
      );
      
      variable_name TYPE_NAME;
Begin
      ...
End;
*/

-- Ornek; Sistem zaman bilgilerini konsola yazd�ran bir program yazal�m
-- Bilgiler developer-defined records veri tipinde tutulacakt�r

Declare
      TYPE r_zaman_type IS RECORD
                                  (
                                      curr_date Date,
                                      curr_day  VarChar2(12),
                                      curr_time VarChar2(8):= '00:00:00'
                                  );
      
      v_zaman r_zaman_type;
Begin
    Select sysdate INTO v_zaman.curr_date From Dual;
    
    v_zaman.curr_day  := To_Char(v_zaman.curr_date,'DAY');
    v_zaman.curr_time := To_Char(v_zaman.curr_date,'HH24:MI:SS');
    
    dbms_output.put_line('Tarih : ' || To_Char(v_zaman.curr_date,'DD/MM/YYYY'));
    dbms_output.put_line('G�n   : ' || v_zaman.curr_day);
    dbms_output.put_line('Zaman : ' || v_zaman.curr_time);
End;
/

-- Ornekler
-- Ornek1
-- Sales_Orders tablosunda en son verilen siparis
-- bilgilerini getiriniz

Select *
From Sales_Orders
Where orderid = (
                    Select max(orderid)
                    From Sales_Orders
                );

/
-- Ornek2
-- lastname'i D ile baslayanlar?n sipari?lerini bulunuz
-- Tablolar: Sales_Orders, hr_employes
-- join ve subquery ile yap?n?z

Select *
From Sales_Orders
Where empid in(
                Select empid
                From hr_employees
                Where Upper(lastname) like 'D%'              
              );
/             
-- Ornek3
-- Usa musterilerininin siparislerini listeleyen sorguyu yaz?n?z
-- Tablolar Sales_Orders, Sales_Customers
-- join ve subquery ile yap?n?z

Select *
From Sales_Orders
Where custid in(
                Select custid
                From Sales_Customers
                Where country = 'USA'
               );
/

-- 07102023


-- Ornek4
-- Sales_Customers tablosunda olup siparisi olmayan musterilerin bilgilerini bulunuz
-- in ile cozelim

Select *
From Sales_Customers
Where custid not in(
                                  Select distinct custid
                                  From Sales_Orders
                               );
                               
-- Exists ile cozelim

Select *
From Sales_Customers c
Where Not Exists (
                                  Select distinct custid
                                  From Sales_Orders o
                                  Where o.custid = c.custid
                          );

/

Select *
From Sales_Customers c
Where Not Exists (
                                  Select *
                                  From Sales_Orders o
                                  Where o.custid = c.custid
                          );
-- Yukar�daki sorgu siparisi olmayan m�sterileri verdi
-- siparisi olan musteriler icin Not Exists yerine Exists dememiz yeterli
/
Select *
From Sales_Customers c
Where  Exists (
                                  Select *
                                  From Sales_Orders o
                                  Where o.custid = c.custid
                      );
/

Select distinct custid
From Sales_Orders;
/

-- Ornek5
-- Sales_Orders tablosunda en son tarihte  verilen siparis bilgilerini getiriniz

Select *
From Sales_Orders
Where orderdate = (
                              Select Max(orderdate)
                              From Sales_Orders
                            );

/

Select Max(orderdate)
From Sales_Orders;
/

-- Ornek6
-- Sales_Orders tablosunda
-- her bir musterinin en son tarihte  verdigi siparis bilgilerini getiriniz

-- Alt Sorgu ile cozelim

Select *
From Sales_Orders o1
Where o1.orderdate = (
                                  Select Max(o2.orderdate)
                                  From Sales_Orders o2
                                  Where o2.custid = o1.custid
                               )
Order By o1.custid;

-- CTEs ile cozelim

With
A as
(
    select 
        custid,
        max(orderdate) as SonTarih 
    from sales_orders
    group by custid
)
Select *
From A
join sales_customers c on A.custid = c.custid
order by c.custid;

/

With
MaxCustOrderTarih as
(
    select 
        custid,
        max(orderdate) as SonTarih 
    from sales_orders
    group by custid
)
Select *
From sales_orders o1
join   MaxCustOrderTarih o2 on o2.custid = o1.custid
Where o1.orderdate = o2.SonTarih
order by o1.custid;
/

-- Ornek7

-- Yukar�daki soru soyle olsayd�
-- su sekilde bir cozum ilede elde edilebilirdi

-- Sales_Orders tablosunda
-- her bir musterinin en son verdigi siparis bilgisini getiriniz

WITH
LatestOrders AS
(
  SELECT
            custid,
            orderid,
            orderdate,
            ROW_NUMBER() OVER (PARTITION BY custid ORDER BY orderdate DESC, orderid Desc) AS rn
  FROM
            Sales_Orders
)
SELECT
            lo.custid,
            lo.orderid,
            lo.orderdate
FROM
            LatestOrders lo
WHERE
            lo.rn = 1;
/

WITH
LatestOrders AS
(
  SELECT
            custid,
            orderid,
            orderdate,
            ROW_NUMBER() OVER (PARTITION BY custid ORDER BY orderid DESC) AS rn
  FROM
            Sales_Orders
)
SELECT
            lo.custid,
            lo.orderid,
            lo.orderdate
FROM
            LatestOrders lo
WHERE
            lo.rn = 1;
/

-- Ornek8
-- Sales_OrderDetails tablosunda qty'si 90 olanlar?n product bilgilerini ve qty bilgilerini getiriniz
-- Tablolar Sales_OrderDetails ve Production_Products
Select *
From Sales_OrderDetails od
Where od.qty = 90;

Select *
From Production_Products pp;

-- join ile yapal�m

Select
            pp.productname,
            od.orderid,
            od.qty,
            od.unitprice
From Sales_OrderDetails od
join   Production_Products pp on pp.productid = od.productid
Where od.qty = 90;

-- SubQuery ile yapal�m

Select
            od.productid,
            od.orderid,
            od.qty,
            od.unitprice,
            (
              Select pp.productname
              From Production_Products pp
              Where pp.productid =  od.productid
            ) as UrunAdi           
From Sales_OrderDetails od
Where od.qty = 90;
/
Select
            (
              Select pp.productname
              From Production_Products pp
              Where pp.productid =  od.productid
            ) as UrunAdi,
           -- od.productid,
            od.orderid,
            od.qty,
            od.unitprice            
From Sales_OrderDetails od
Where od.qty = 90;
/
Select *
From Production_Products pp
Where pp.productid = 61;
/
-- Sales_Customers tablosunda tekrar eden veriler var ise bunlar� bulal�m ve silelim

Select
      Rowid,
      custid      
From Sales_Customers
Where Rowid not in (
                      Select Max(Rowid)
                      From Sales_Customers
                      Group By custid                      
                    );
/                  
Delete From Sales_Customers
Where Rowid not in (
                      Select Max(Rowid)
                      From Sales_Customers
                      Group By custid                      
                    );
/   

-- Ornek 9
-- ispanyadaki siparisi olan m�sterilerin
-- Custid, CompanyName, country bilgilerini getiriniz
-- Tablolar; Sales_Customers, Sales_Orders

-- Exists ile yapal�m

Select custid, companyname
From Sales_Customers c
Where c.country = 'Spain' and
           Exists
                    (
                      Select *
                      From Sales_Orders o
                      Where o.custid = c.custid
                    );

-- Ornek 10
-- ispanyadaki siparisi olmayan m�sterilerin
-- Custid, CompanyName, country bilgilerini getiriniz
-- Tablolar; Sales_Customers, Sales_Orders

-- Exists ile yapal�m

Select custid, companyname
From Sales_Customers c
Where c.country = 'Spain' and
           Not Exists
                    (
                      Select *
                      From Sales_Orders o
                      Where o.custid = c.custid
                    );
/

-- Ornek; Rehber Uygulamas� yapal�m
-- Developer - Defined Records + Nested Records
-- (Bunlar� bir arada kullanarak yapal�m)

Set ServerOutPut On;
/
Declare
              Type r_kisi IS RECORD(
                                                    ad employees.first_name%type,
                                                    soyad employees.last_name%type
                                                );
              Type contact IS RECORD(
                                                    kisi r_kisi,  -- Bu tur tan�mlamaya Nested Record denir
                                                    telefon employees.phone_number%type
                                                  );
                            
              rehber contact;
Begin
              rehber.kisi.ad:= 'Ali';
              rehber.kisi.soyad:= 'TOPACIK';
              rehber.telefon:= '0555 998 88 76';
              
              dbms_output.put_line('Adi    : ' || rehber.kisi.ad);
              dbms_output.put_line('Soyadi : ' || rehber.kisi.soyad);
              dbms_output.put_line('Telefon: ' || rehber.telefon);

End;
/

-- Ornek; Yukar�daki uygulamay� biraz daha gelistirelim
-- Develeper - Defined Records + Nested Records + ARRAY seklinde gelistirelim

Declare
    Type r_kisi IS RECORD(
                    ad employees.first_name%type,
                    soyad employees.last_name%type
                         );
    Type contact IS RECORD(
                    kisi r_kisi,  -- Bu tur tan�mlamaya Nested Record denis
                    telefon employees.phone_number%type
                          );
    Type dizi IS TABLE OF contact; -- Nested Table Data Types with Record             
    rehber dizi:=dizi();
    j Number:=1;
Begin
    rehber.Extend;
    rehber(j).kisi.ad:= 'Ali';
    rehber(j).kisi.soyad:= 'TOPACIK';
    rehber(j).telefon:= '0555 998 88 76';
        
    dbms_output.put_line('Adi    : ' || rehber(j).kisi.ad);
    dbms_output.put_line('Soyadi : ' || rehber(j).kisi.soyad);
    dbms_output.put_line('Telefon: ' || rehber(j).telefon);

    rehber.Extend;
    j:=j+1;
    rehber(j).kisi.ad:= 'Ali-USA';
    rehber(j).kisi.soyad:= 'TOPACIK-USA';
    rehber(j).telefon:= '00 1 555 998 88 76';
    
    
    dbms_output.put_line('Adi    : ' || rehber(j).kisi.ad);
    dbms_output.put_line('Soyadi : ' || rehber(j).kisi.soyad);
    dbms_output.put_line('Telefon: ' || rehber(j).telefon);
End;
/


-- Simdi yukar�daki uygulamaya employees tablosunda bilgileri dongu ile aktaral�m ve yazd�ral�m
Declare
    Type r_kisi IS RECORD(
                    ad employees.first_name%type,
                    soyad employees.last_name%type
                         );
    Type contact IS RECORD(
                    kisi r_kisi,  -- Bu tur tan�mlamaya Nested Record denis
                    telefon employees.phone_number%type
                          );
    Type dizi IS TABLE OF contact; -- Nested Table Data Types with Record             
    rehber dizi:=dizi();
    j Number:=0;
Begin

   For i IN (Select first_name, last_name, phone_number From Employees Where Department_id = 100)
   Loop
        j:=j+1;
        rehber.Extend;        
        rehber(j).kisi.ad:= i.first_name;
        rehber(j).kisi.soyad:= i.last_name;
        rehber(j).telefon:= i.phone_number;
   End Loop;
   
   j:= rehber.first;
   While j IS NOT NULL
   Loop
        dbms_output.put_line('Adi    : ' || rehber(j).kisi.ad);
        dbms_output.put_line('Soyadi : ' || rehber(j).kisi.soyad);
        dbms_output.put_line('Telefon: ' || rehber(j).telefon); 
        dbms_output.put_line('********************************************'); 
        j:= rehber.next(j);   
   End Loop;
End;
/

--*********************************************************************************************
-- Exceptions - Error Handling (istisnalar - Hata Yonetimi)
--*********************************************************************************************

/*
  Exceptions Nedir; PL/SQL Runtime Errors(program �al��ma esnas�nda olu�an hatalard�r)
  
  Exception Gruplar�
    A) Internally Defined Exceptions(Dahili Tan�ml� istisnalar)
        (Err kodu olan fakat ismi olmayan istisnalard�r)
    B) Predefined Exceptions(Tan�ml� istisnalar)
        (Err kodu ve ismi olan istisnalard�r)
    C) User-Defined Exceptions
        (Programc� taraf�ndan yaz�lan istisnalar)  
*/
-- Simdi Bunlar� incelemeye baslayal�m
--*********************************************************************************************
/*
    Exception Gruplar�
    A) Internally Defined Exceptions(Dahili Tan�ml� istisnalar)
        (Err kodu olan fakat ismi olmayan istisnalard�r)

Bu istisnalar iki farkl� tan�mlamayla yakalan�p yonetilebilir
    PRAGMA_EXCEPTION_INIT veya
    EXCEPTIONS WHEN OTHERS
    
    SYNTAX    ;
    
    Declare
              my_exception exception;
              pragma exception_init(my_exception, -errCode);
    Begin
              ...
              EXCEPTION When my_exception Then
              ...
              EXCEPTION When others Then
    End;
*/
--*********************************************************************************************
-- Ornek; pragma exception_init ile ilgili bir ornek yapal�m

-- hr user'�na baglanal�m

/
Set ServerOutPut On;
/
Select *
From departments;
/
Declare

Begin
            delete From Departments Where department_id = 90;
End;
/
-- Yukar�daki kodu bu haliyle calist�r�rsak hata verecektir
-- simdi verdigi hatadaki hata kodunu alal�m ve programa ekleyelim
Declare
    my_exception exception;
    pragma exception_init(my_exception, -02292); -- Oracle'da 70.000-80.000'e yak�n hata kodu var
Begin
    delete From Departments Where department_id = 90;
    EXCEPTION When my_exception Then
        dbms_output.put_line('Hata Meydane Geldi : -02292: integrity constraint ... child record found');    
End;
/

/
-- Yukar�daki kodu bu haliyle calist�r�rsak hata verecektir
-- simdi verdigi hatadaki hata kodunu alal�m ve programa ekleyelim
Declare
    elma exception;
    pragma exception_init(elma, -02292); -- Oracle'da 70.000-80.000'e yak�n hata kodu var
Begin
    delete From Departments Where department_id = 90;
    EXCEPTION When elma Then
        dbms_output.put_line('Hata Meydane Geldi : -02292: integrity constraint ... child record found');    
End;
/
-- Yukar�da my_exception bir isimdir, herhangi bir isim olabilir
-- �u �ekilde yazal�m

Declare
    my_exception_02292 exception;
    pragma exception_init(my_exception_02292, -02292); -- Oracle'da 70.000-80.000'e yak�n hata kodu var
Begin
    delete From Departments Where department_id = 90;
    EXCEPTION When my_exception_02292 Then
        dbms_output.put_line('Hata Meydane Geldi : -02292: integrity constraint ... child record found');    
End;
/
--
Declare
    exception_integrity_Constraint exception;
    pragma exception_init(exception_integrity_Constraint, -02292); -- Oracle'da 70.000-80.000'e yak�n hata kodu var
Begin
    delete From Departments Where department_id = 90;
    EXCEPTION When exception_integrity_Constraint Then
        dbms_output.put_line('Hata Meydane Geldi : -02292: integrity constraint ... child record found');    
End;
/
-- Ornek; pragma exception_init'e insert ile bir ornek daha yapal�m
-- ve Exception Scope(Exception'lar�n kapsama alan�n� inceleyelim)
-- Regions tablosuna bir kay�t ekleyelim ve ekledigimiz kayd� yeniden ekleyelim

Declare
    my_exception_insert_unique Exception;
    pragma exception_init(my_exception_insert_unique,-00001);
Begin
    insert into Regions Values(10,'Asya'); -- Select * From Regions;
    Exception When my_exception_insert_unique then
        dbms_output.put_line('my_exception_insert_unique Hatas�');
End;
/
Commit;
/
-- Yukar�daki kodu bir kere calistirinca insert gerceklesecek ama
-- ikinci kez calistirinca hata mesaj� gelecek

-- Simdi insert ve delete orneklerini birlestirelim

Declare
    exception_insert_unique Exception;
    pragma exception_init(exception_insert_unique,-00001);
    
    exception_integrity_Constraint exception;
    pragma exception_init(exception_integrity_Constraint, -02292); -- Oracle'da 70.000-80.000'e yak�n hata kodu var
    
Begin
    insert into Regions Values(10,'Asya'); -- Select * From Regions;

    delete From Departments Where department_id = 90;
    EXCEPTION When exception_integrity_Constraint Then
        dbms_output.put_line('Hata Meydane Geldi : -02292: integrity constraint ... child record found');    
        
    Exception When exception_insert_unique then
        dbms_output.put_line('exception_insert_unique Hatas�');        
End;
/
-- Yukar�daki sekilde calistirirsak hata meydana gelir
-- Cunku hangi Exception hangisine ait belli degil, Bunu Scope(kapsama) ile belirleyelim
-- yani Begin ... End; blogu ile Exception'lar�n kapsam�n� belirleyelim

-- Internally Defined Exceptions - PRAGMA_EXCEPTION_INIT, Exception SCOPE(Exception'lar�n Kapsama Alan�)

Declare
    exception_insert_unique Exception;
    pragma exception_init(exception_insert_unique,-00001);
    
    exception_integrity_Constraint exception;
    pragma exception_init(exception_integrity_Constraint, -02292); -- Oracle'da 70.000-80.000'e yak�n hata kodu var
    
Begin
    insert into Regions Values(10,'Asya'); -- Select * From Regions;
    
    Begin
        delete From Departments Where department_id = 90;
        EXCEPTION When exception_integrity_Constraint Then
            dbms_output.put_line('Hata Meydane Geldi : -02292: integrity constraint ... child record found');    
    End;
        
    Exception When exception_insert_unique then
        dbms_output.put_line('exception_insert_unique Hatas�');        
End;
/
-- simdi olmayan bir kayd� ekleyelim ve ne olacag�n� gorelim
Declare
    exception_insert_unique Exception;
    pragma exception_init(exception_insert_unique,-00001);
    
    exception_integrity_Constraint exception;
    pragma exception_init(exception_integrity_Constraint, -02292); -- Oracle'da 70.000-80.000'e yak�n hata kodu var
    
Begin
    insert into Regions Values(11,'Antartica'); -- Select * From Regions;
    
    Begin
        delete From Departments Where department_id = 90;
        EXCEPTION When exception_integrity_Constraint Then
            dbms_output.put_line('Hata Meydane Geldi : -02292: integrity constraint ... child record found');    
    End;
        
    Exception When exception_insert_unique then
        dbms_output.put_line('exception_insert_unique Hatas�');        
End;
/
rollback;
-- Simdi hatalar kontrol alt�na al�nd�
-- Eger insert edilen bilgi yok ise insert eder, var ise hata Exception devreye girer
-- Eger insert edildiyse sonraki bloga gecer ve delete isleminde hata meydana gelirse Exception devreye girer

-- Internally Defined Exceptions - Tam�ml� olan Exceptionlar�n baz�lar�na bir goz atal�m
-- Tan�ml� olan 70.000 - 80.000 civar�nda Exceptionlar vard�r

-- Error mesajlar�n�n oldugu pdf oracle sitesinden download edilebilir
-- https://docs.oracle.com/cd/E96517_01/errmg/error-messages.pdf#page=2019&zoom=100,0,88

-- ORA-00000: normal, successful completion, Cause: Normal exit, Action: None
-- ORA-00001: unique constraint (string.string) violated
-- ORA-00902: invalid datatype
-- ORA-00904: string: invalid identifier 
-- ORA-00909: invalid number of arguments v.s.
/


rollback;
/
-- Internally Defined Exceptions - (Dahili Tan�ml� istisnalar)
-- OTHERS ve Exception SCOPE  olarak inceleyelim
Declare
    
Begin
    insert into Regions Values(11,'Asya'); -- Select * From Regions;
    
    Begin
        delete From Departments Where department_id = 90;
        EXCEPTION When OTHERS Then
            dbms_output.put_line('Delete yaparken Hata Meydane Geldi : ' ||
                                 sqlcode || ' ' || sqlerrm);
        -- Buraya yap�lmas�n� istedigimiz islemleri yazacagiz
    End;
        
    EXCEPTION When OTHERS Then
        dbms_output.put_line('insert yaparken hata meydana geldi : ' ||
                                 sqlcode || ' ' || sqlerrm);
    -- Buraya yap�lmas�n� istedigimiz islemleri yazacagiz                                 
End;
/
-- rollback;

Declare
    
Begin
    insert into Regions Values(11,'Asya'); -- Select * From Regions;
    
    Begin
        delete From Departments Where department_id = 90;
        EXCEPTION When OTHERS Then
            dbms_output.put_line('Delete yaparken Hata Meydane Geldi : ' ||
                                 sqlcode || ' ' || sqlerrm);
        -- Buraya yap�lmas�n� istedigimiz islemleri yazacagiz
    End;
        
    EXCEPTION When OTHERS Then
        dbms_output.put_line('insert yaparken hata meydana geldi : ');
        dbms_output.put_line('sqlcode  : ' || sqlcode);
         dbms_output.put_line('sqlerrm : ' || sqlerrm);
    -- Buraya yap�lmas�n� istedigimiz islemleri yazacagiz                                 
End;
/
--*********************************************************************************************
/*
  Exception Gruplar�
    B) Predefined Exceptions(Tan�ml� istisnalar)
        (Err kodu ve ismi olan istisnalard�r)
        
  Bu istisnalar ismine ozel Exception yaz�larak yakalan�p yonetilebilir
  
  Cok fazla var biz en fazla kullan�lanlar�n baz�lar�na bakal�m
  
Exception Name	  Error Code	Description
--------------    ----------  --------------------------
ACCESS_INTO_NULL  -6530	      Null tan�ml� bir nesneye bir de�er atand���nda olu�ur (Developer- Defined Data Type)
CASE_NOT_FOUND	  -6592	      CASE kullan�ld���nda, se�eneklerden hi�biri sa�lanm�yor ve ELSE ifadesi yoksa olu�ur
DUP_VAL_ON_INDEX	-0001	      UNIQUE INDEX tan�ml� bir kolona, kolonda var olan bir de�eri atamaya �al���ld���nda olu�ur
INVALID_CURSOR	  -01001	    A��k olmayan bir Cursor�dan de�er okunmaya �al���ld���nda olu�ur
INVALID_NUMBER	  -01722	    Say�sal tan�ml� bir kolona ya da de�i�kene String bir de�er atanmaya �al���ld���nda olu�ur
NO_DATA_FOUND	    -01403	    SELECT sonucu herhangi bir kay�t d�nm�yorsa, olu�ur
TOO_MANY_ROWS	    -01422	    SELECT sonucu birden fazla kay�t d�n�yorsa, olu�ur
VALUE_ERROR	      -06502	    Bir kolona ya da de�i�kene, tan�ml� oldu�u uzunluktan fazla de�er atanmaya �al���ld���nda, olu�ur.
  
*/

/*
    SYNTAX

Declare
      ...
Begin
      ...
      ...
      Exception When <exception_name> then
                    ...
                When <exception_name> then
                    ...
                When <exception_name> then
                    ...
End;

*/
--*********************************************************************************************
-- Ornek;
-- NO_DATA_FOUND
-- TOO_MANY_ROWS
-- VALUE_ERROR
-- ZERO_DIVIDE
-- Bu Exception'lara bakal�m

-- Ornek olarak Employees tablosundan veri okuyal�m

-- OracleData user'�na baglanal�m

Declare
    rec_emp Employees%RowType;    
Begin
    Select * INTO rec_emp
    From Employees
    Where Employee_id = 100;
    
    dbms_output.put_line(rec_emp.employee_id || ' ' || rec_emp.first_name);
    
    Exception When No_Data_Found Then
                   dbms_output.put_line('Kay�t Bulunamad�, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
End;
/
-- yukar�da 100 nolu personeli bulduk
-- simdi olmayan personeli bulal�m ve hatay� yakalayal�m
/
Declare
    rec_emp Employees%RowType;    
Begin
    Select * INTO rec_emp
    From Employees
    Where Employee_id = 999;
    
    dbms_output.put_line(rec_emp.employee_id || ' ' || rec_emp.first_name);
    
    Exception When No_Data_Found Then
                   dbms_output.put_line('Kay�t Bulunamad�, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
End;
/
-- Simdi 1 den fazla kay�t okuyal�m

Declare
    rec_emp Employees%RowType;    
Begin
    Select * INTO rec_emp
    From Employees;
    
    dbms_output.put_line(rec_emp.employee_id || ' ' || rec_emp.first_name);
    
    Exception When Too_Many_Rows Then
                   dbms_output.put_line('1den fazla kay�t var, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
End;
/
-- Simdi her ikisini bir arada yazal�m

Declare
    rec_emp Employees%RowType;    
Begin
    Select * INTO rec_emp
    From Employees
    Where Employee_id = 999;
    
    dbms_output.put_line(rec_emp.employee_id || ' ' || rec_emp.first_name);
    
    Exception When No_Data_Found Then
                   dbms_output.put_line('Kay�t Bulunamad�, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
              When Too_Many_Rows Then
                   dbms_output.put_line('1den fazla kay�t var, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
End;
/
-- S�f�ra Bolme Hatas� verdirelim

Declare
    val1  Number(5);
Begin
    val1:= 100/0; -- S�f�ra Bolme hatas� meydana gelir
    
    Exception When Zero_Divide Then
                   dbms_output.put_line('S�f�ra Bolme Hatas�, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);              
End;
/
-- Tan�ml� uzunluktan fazla deger atayal�m

Declare
    val1  Number(5);
Begin
    val1:= 123456;-- Tan�ml� uzunluktan fazla uzun say� girdik, hata meydana gelir

    Exception When Value_Error Then
                   dbms_output.put_line('Fazla buyuk deger girildi, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
End;
/
-- Yukar�da yapt�g�m�z 4 hata mesaj�n� bir arada yazal�m

Declare
    rec_emp Employees%RowType;
    val1  Number(5);
Begin
    val1:= 100/0; -- S�f�ra Bolme hatas� meydana gelir
    val1:= 123456;-- Tan�ml� uzunluktan fazla uzun say� girdik, hata meydana gelir
    Select * INTO rec_emp
    From Employees
    Where Employee_id = 999;
    
    dbms_output.put_line(rec_emp.employee_id || ' ' || rec_emp.first_name);
    
    Exception When No_Data_Found Then
                   dbms_output.put_line('Kay�t Bulunamad�, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
              When Too_Many_Rows Then
                   dbms_output.put_line('1den fazla kay�t var, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
              When Zero_Divide Then
                   dbms_output.put_line('S�f�ra Bolme Hatas�, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
              When Value_Error Then
                   dbms_output.put_line('Fazla buyuk deger girildi, SQL Code: ' || sqlcode || ' Error Mesaj: ' || sqlerrm);
End;
/
--*********************************************************************************************
/*
  Exception Gruplar�
    C) User-Defined Exceptions
        (Programc� taraf�ndan yaz�lan istisnalar)
        
  Tan�ml� istisnalar d���nda, i�leme gore yeni istisnalar olusturulabilir
  
  SYNTAX
  
  Declare
      <exception_name> EXCEPTION; -- Bu sekilde tan�mlama User_Defined Exception'd�r
  Begin
      ...
      IF <contidion> THEN
            RAISE <exception_name>; -- Bir kosul sagland�g�nda exception_name'e biz yonlendiriyoruz
                                    -- Oncekilerde yonlendirmeler tan�ml� oldugu icin otomatik yap�l�yordu
      END IF;
      ...
      EXCEPTION When <exception_name> then
      ...
  End;
*/        
--*********************************************************************************************

-- Ornek;
-- Bolume gore calisan personel say�s�n� bulan PL/SQL program yazal�m
-- Bolum Numaras�n� runtime esnas�nda girecegiz
/
Declare
      v_dept_id     Employees.Department_id%type;
      v_toplam      Number;
      e_invalid_id  Exception;
Begin
      v_dept_id:= 100;
      
      Select Count(*) INTO v_toplam
      From Employees
      Where Department_id = v_dept_id;
      
      dbms_output.put_line(v_dept_id || ' Bolumunde Calisanlar�n Toplam Say�s�: ' || v_toplam);
      
End;
/
-- department_id klavyeden girilecek sekilde yapal�m
-- ve girilen say�y� negatif ve ayr�ca olmayan bir department_id girelim

Declare
      v_dept_id     Employees.Department_id%type;
      v_toplam      Number;
      e_invalid_id  Exception;
Begin
      v_dept_id:= &Department_id_Giriniz;
      
      Select Count(*) INTO v_toplam
      From Employees
      Where Department_id = v_dept_id;
      
      dbms_output.put_line(v_dept_id || ' Bolumunde Calisanlar�n Toplam Say�s�: ' || v_toplam);
      
End;
/
-- Simdi hata kontrolu yapal�m

Declare
      v_dept_id     Employees.Department_id%type;
      v_toplam      Number;
      e_invalid_id  Exception;
Begin
      v_dept_id:= &Department_ID_Giriniz;
      
      if v_dept_id > 0 Then
            Select Count(*) INTO v_toplam From Employees Where Department_id = v_dept_id;
            dbms_output.put_line(v_dept_id || ' Bolumunde Calisanlar�n Toplam Say�s�: ' || v_toplam);
           -- ........
           -- ........
           -- ........           
      Else
          RAISE e_invalid_id; -- Yani bu hatan�n kodland�g� komut sat�r�na gitmesini istiyoruz
      End if;
      
      Exception When e_invalid_id Then
           dbms_output.put_line(v_dept_id || ' Girilen Deger Negatif olamaz'); 
           
           -- ........
           -- ........
           -- ........
           
End;
/
-- Yukar�daki Exception_Name herhangi bir isim olabilir
-- Ornegin

Declare
      v_dept_id           Employees.Department_id%type;
      v_toplam            Number;
      e_hatali_bolum_no   Exception;
Begin
      v_dept_id:= &Department_ID_Giriniz;
      
      if v_dept_id > 0 Then
            Select Count(*) INTO v_toplam From Employees Where Department_id = v_dept_id;
            dbms_output.put_line(v_dept_id || ' Bolumunde Calisanlar�n Toplam Say�s�: ' || v_toplam);
      Else
          RAISE e_hatali_bolum_no; -- Yani bu hatan�n kodland�g� komut sat�r�na gitmesini istiyoruz
      End if;      
      Exception When e_hatali_bolum_no Then
           dbms_output.put_line(v_dept_id || ' Girilen Deger Negatif olamaz'); 
End;
/
--*********************************************************************************************
-- SUBPROGRAMS
-- (Procedure, Function)
--*********************************************************************************************

/*
  Types of PL/SQL Block
  (PL/SQL Block Turleri)
  1- Unnamed Block(Anonymous Blocks)  -- Nested Subprograms
  2- Named Block(Procedure, Function) -- Stored Subprograms
  
  Su ana kadar hep Unnamed Block(Anonymous Blocks) olarak calismalar yapm��t�k
  Simdi Named Block(Procedure, Function) olarak calismalar�m�z� yapacag�z
  
*/

/*
        SUBPROGRAMS
    (Procedure, Function)  
    ikiye sekilde yap�labilir
    1- Nested(Unnamed Block icerisinde)
    
    2- Stored(Veritaban� i�erisinde)
        A- Standalone
        B- Package
    
*/
    
--*********************************************************************************************
/*
        SUBPROGRAMS(Procedure, Function)  
        1- Nested Procedures
    
        2- Stored Procedures(Standalone veya Package icinde yaz�labilir)
*/
--*********************************************************************************************
--*********************************************************************************************
-- 1- Nested Procedures
/*
Nested Procedures
Syntax

DECLARE
  � Declare and define procedure
  PROCEDURE <Proc_name> ( � Subprogram heading begins
                          <parameters>
                        ) � Subprogram heading ends
  IS
    <variables>
    -- Declarative part begins
  BEGIN � Executable part begins
      
      EXCEPTION � Exception-handling part begins

  END <Proc_name>-

BEGIN - Main Block
    <Proc_name>(parameter Values); -- Call Proc
END;

*/

-- Nested Procedures
-- Ornek;
-- Unnamed Block icinde, calisan ismini yazd�ran bir Procedure yazal�m

Declare
    Procedure isim_goster IS
            w_name  Employees.last_name%type; -- Bu local degiskendir, sadece bu procedure icinde gecerlidir
    Begin    
            Select last_name INTO w_name From Employees Where Employee_id = 101;
            dbms_output.put_line('ismi = ' || w_name);
    End;  -- isim_goster  ===>>> buraya End isim_goster; diyerek procedure ismini yazabiliriz, opsiyoneldir,
                                 ----------- program ak�s�n� kontrol ederken faydas� olur

Begin -- Main Block
    isim_goster;
End;
/
Declare
    Procedure isim_goster IS
        w_name  Employees.last_name%type; -- Bu local degiskendir, sadece bu procedure icinde gecerlidir
    Begin    
        Select last_name INTO w_name From Employees Where Employee_id = 101;
        dbms_output.put_line('ismi = ' || w_name);
    End isim_goster;  -- buraya End isim_goster; diyerek procedure ismini yazabiliriz, opsiyoneldir,
                      -- program ak�s�n� kontrol ederken faydas� olur
Begin
    isim_goster;
End;
/
-- Employees2 tablosunu olustural�m
Create Table employees2 as
Select *
From employees;
/
-- Nested Procedures
-- Ornek;
-- Unnamed Block icinde, calisan ismini guncelleyen(Buyuk Harfe Ceviren) bir Procedure yazal�m

Declare
    Procedure isim_goster IS
        w_name  Employees2.last_name%type; -- Bu local degiskendir, sadece bu procedure icinde gecerlidir
    Begin    
        Select last_name INTO w_name From Employees2 Where Employee_id = 101;
        dbms_output.put_line('ismi = ' || w_name);
    End isim_goster;  -- buraya End isim_goster; diyerek procedure ismini yazabiliriz, opsiyoneldir,
                      -- program ak�s�n� kontrol ederken faydas� olur

    Procedure isim_guncelle IS
        w_name2  Employees2.last_name%type; -- Bu local degiskendir, sadece bu procedure icinde gecerlidir
    Begin    
              Update Employees2
              Set last_name = Upper(last_name)
              Where Employee_id = 101;
              
              Select last_name INTO w_name2 From Employees2 Where Employee_id = 101;
              dbms_output.put_line('Guncel ismi = ' || w_name2);
    End isim_guncelle;

Begin
    isim_goster;
    isim_guncelle;
    isim_goster;
    rollback;
End;
/
-- veya Update Employees2 Set last_name = Upper(last_name) Where Employee_id = 101;
-- Select last_name INTO w_name2 From Employees2 Where Employee_id = 101;

-- Bu 2 komutu tek bir komutta birlestirerek ayn� islemi yapt�rabiliriz
-- Yani once Update edecek sonra update edilen yeni veriyi Select edecek
-- Komutumuz RETURNING
-- Update Employees2 Set last_name = Upper(last_name) Where Employee_id = 101
-- RETURNING last_name INTO w_name2;
        
Declare
    Procedure isim_goster IS
        w_name  Employees2.last_name%type; -- Bu local degiskendir, sadece bu procedure icinde gecerlidir
    Begin    
        Select last_name INTO w_name From Employees2 Where Employee_id = 101;
        dbms_output.put_line('ismi = ' || w_name);
    End isim_goster;  -- buraya End isim_goster; diyerek procedure ismini yazabiliriz, opsiyoneldir,
                      -- program ak�s�n� kontrol ederken faydas� olur

    Procedure isim_guncelle IS
        w_name  Employees2.last_name%type; -- Bu local degiskendir, sadece bu procedure icinde gecerlidir
    Begin    
        Update Employees2
        Set last_name = Upper(last_name)
        Where Employee_id = 101
        RETURNING last_name INTO w_name;
        
        dbms_output.put_line('Guncel ismi = ' || w_name);
    End isim_guncelle;

Begin -- MAIN BLOCK
    isim_goster;
    isim_guncelle;
    isim_goster;
    rollback;
End;
/
-- yukar�da Procedure icinde tan�mlanan
-- w_name  Employees2.last_name%type; -- Bu local degiskendir, sadece bu procedure icinde gecerlidir
-- Global olmas�n� istiyorsak Declare'den sonra tan�mlamam�z gerekir
-- Yapal�m
--*********************************************************************************************
Declare
    w_name  Employees2.last_name%type; -- Bu Global degiskendir, bu program icinde her yerde kullan�labilir
    
    Procedure isim_goster IS        
    Begin    
        Select last_name INTO w_name From Employees2 Where Employee_id = 101;
        dbms_output.put_line('ismi = ' || w_name);
    End isim_goster;  -- buraya End isim_goster; diyerek procedure ismini yazabiliriz, opsiyoneldir,
                      -- program ak�s�n� kontrol ederken faydas� olur

    Procedure isim_guncelle IS
    Begin    
        Update Employees2
        Set last_name = Upper(last_name)
        Where Employee_id = 101
        RETURNING last_name INTO w_name;
        
        dbms_output.put_line('Guncel ismi = ' || w_name);
    End isim_guncelle;

Begin -- MAIN BLOCK
    isim_goster;
    isim_guncelle;
    isim_goster;
    rollback;
End;
/
--*********************************************************************************************
-- Nested Procedures With Parameters
-- Nested Procedure'lerde Parametre Kullan�m�
-- 3 tane parametre turu vard�r

/*
Nested Procedures- Parametre T�rleri
IN
    D��ar�dan de�er alan parametreler
OUT
    D��ar�ya de�er d�nd�ren parametreler
INOUT
    D��ar�dan hem de�er alan hem de de�er d�nd�ren parametreler
*/
/*
Nested Procedures - Syntax
PROCEDURE <proc_name>
      (
      paraml IN | OUT | INOUT <data_type>,
      param2 IN | OUT | INOUT <data_type>,
      )
      IS

E�er IN, OUT ya da INOUT ifadelerinden herhangi biri yaz�lmazsa,
tan�mlanan parametre IN tan�mlanm�� kabul edilir. (Default de�er IN)

*/

Declare
    w_name  Employees2.last_name%type; -- Bu Global degiskendir, bu program icinde her yerde kullan�labilir
    
    Procedure isim_goster(p_emp_id Employees.Employee_id%type) IS        
    Begin    
        Select last_name INTO w_name From Employees2 Where Employee_id = p_emp_id;
        dbms_output.put_line('ismi = ' || w_name);
    End isim_goster;  -- buraya End isim_goster; diyerek procedure ismini yazabiliriz, opsiyoneldir,
                      -- program ak�s�n� kontrol ederken faydas� olur

    Procedure isim_guncelle(p_emp_id Employees.Employee_id%type) IS
    Begin    
        Update Employees2
        Set last_name = Upper(last_name)
        Where Employee_id = p_emp_id
        RETURNING last_name INTO w_name;
        
        dbms_output.put_line('Guncel ismi = ' || w_name);
    End isim_guncelle;

Begin -- MAIN BLOCK
    isim_goster(100);
    isim_guncelle(100);
    isim_goster(100);
    rollback;
End;
/

-- IN yazarak bakal�m

Declare
    w_name  Employees2.last_name%type; -- Bu Global degiskendir, bu program icinde her yerde kullan�labilir
    
    Procedure isim_goster(p_emp_id IN Employees.Employee_id%type) IS        
    Begin    
        Select last_name INTO w_name From Employees2 Where Employee_id = p_emp_id;
        dbms_output.put_line('ismi = ' || w_name);
    End isim_goster;  -- buraya End isim_goster; diyerek procedure ismini yazabiliriz, opsiyoneldir,
                      -- program ak�s�n� kontrol ederken faydas� olur

    Procedure isim_guncelle(p_emp_id IN Employees.Employee_id%type) IS
    Begin    
        Update Employees2
        Set last_name = Upper(last_name)
        Where Employee_id = p_emp_id
        RETURNING last_name INTO w_name;
        dbms_output.put_line('Guncel ismi = ' || w_name);
    End isim_guncelle;

Begin -- MAIN BLOCK
    isim_goster(100);
    isim_guncelle(100);
    isim_goster(100);
    rollback;
End;
/
-- Yukar�daki progrman� dinamik hale getirelim ve
-- Department_id'si 90 nolu kay�tlar�n last_name'lerini buyuk harfe cevirelim
-- Bunun icin Cursor kullanal�m

Declare
    Cursor c_emp IS (Select Employee_id From Employees Where Department_id = 90);
    -- Department_id'yide klavyeden girilmesini istersek su sekilde yapabiliriz, Yukar�daki sat�r� commentleyelim
    -- Asagidaki satirin commentini kald�ral�m
    -- Cursor c_emp IS (Select Employee_id From Employees Where Department_id = &Department_ID_GIRINIZ);
    r_emp c_emp%rowtype;
    
    w_name  Employees2.last_name%type; -- Bu Global degiskendir, bu program icinde her yerde kullan�labilir
    
    Procedure isim_goster(p_emp_id IN Employees.Employee_id%type) IS        
    Begin    
        Select last_name INTO w_name From Employees2 Where Employee_id = p_emp_id;
        dbms_output.put_line('ismi = ' || w_name);
    End isim_goster;
    
    Procedure isim_guncelle(p_emp_id IN Employees.Employee_id%type) IS
    Begin    
        Update Employees2
        Set last_name = Upper(last_name)
        Where Employee_id = p_emp_id
        RETURNING last_name INTO w_name;
        
        dbms_output.put_line('Guncel ismi = ' || w_name);
    End isim_guncelle;

Begin -- MAIN BLOCK
    Open c_emp;
      Loop
          Fetch c_emp INTO r_emp;
          Exit When c_emp%NotFound;
          
          isim_goster(r_emp.Employee_id);
          isim_guncelle(r_emp.Employee_id);
          
      End Loop;
    Close c_emp;
    
    rollback;
End;
/

Declare
    -- Cursor c_emp IS (Select Employee_id From Employees Where Department_id = 90);
    -- Department_id'yide klavyeden girilmesini istersek su sekilde yapabiliriz, Yukar�daki sat�r� commentleyelim
    -- Asagidaki satirin commentini kald�ral�m
    Cursor c_emp IS (Select Employee_id From Employees Where Department_id = &Department_ID_GIRINIZ);
    r_emp c_emp%rowtype;
    
    w_name  Employees2.last_name%type; -- Bu Global degiskendir, bu program icinde her yerde kullan�labilir
    
    Procedure isim_goster(p_emp_id IN Employees.Employee_id%type) IS        
    Begin    
        Select last_name INTO w_name From Employees2 Where Employee_id = p_emp_id;
        dbms_output.put_line('ismi = ' || w_name);
    End isim_goster;
    
    Procedure isim_guncelle(p_emp_id IN Employees.Employee_id%type) IS
    Begin    
        Update Employees2
        Set last_name = Upper(last_name)
        Where Employee_id = p_emp_id
        RETURNING last_name INTO w_name;
        
        dbms_output.put_line('Guncel ismi = ' || w_name);
    End isim_guncelle;

Begin -- MAIN BLOCK
    Open c_emp;
      Loop
          Fetch c_emp INTO r_emp;
          Exit When c_emp%NotFound;
          
          isim_goster(r_emp.Employee_id);
          isim_guncelle(r_emp.Employee_id);
          
      End Loop;
    Close c_emp;
    
    rollback;
End;
/

--*********************************************************************************************
--*********************************************************************************************
-- Nested Procedures - Parametreli Procedure (IN, OUT, IN OUT)
--*********************************************************************************************
-- Ornek; Personelin maas�n� belirli bir oranda art�� yapan bir program yazal�m

Declare
      w_maas        Employees.salary%type;
      w_zamli_maas  Employees.salary%type:=1.25; -- Burada %25 zam istedigimiz icin 1.25 yazd�k

      Procedure get_info(
                                      p_id          IN      Employees.Employee_id%type,
                                      p_salary      OUT     Employees.salary%type,
                                      p_new_salary  IN OUT  Employees.salary%type            
                                  ) IS
      Begin
          Select salary INTO p_salary 
          From Employees 
          Where Employee_id = p_id;
          p_new_salary:= p_new_salary * p_salary;
      End;

Begin
    get_info(100,w_maas,w_zamli_maas);  -- 100 Employee_id Calisan�n maasini art�r�yoruz
    dbms_output.put_line('Employee_id= ' || 100 || ' Simdiki Maas = ' || w_maas || ' Zaml� Yeni Maas = ' || w_zamli_maas);
End;
/

/*
Nested Procedures Parametrelere De�er G�nderme Y�ntemleri
PROCEDURE get_info (a number, b varchar2, c date
  A) Pozisyon Notasyonu
      �	Parametrenin tan�mland��� s�rayla
      �	get_info (x, y, z);
  B) �sim Notasyonu
      �	Parametrenin ismine g�re ( => )
      �	get_info( a => x, b => y, c => z) -- a=>x anlam� �u; a parametresine x degerini gonder
  C) Kar���k Notasyon
      �	Hem s�raya, hem isme g�re -- bu yontemde once Pozisyon Notasyonlar� sonra isim Notasyonlar� kullan�l�r
      �	get_info(x, y, c => z)
*/
-- Simdi Yukar�daki ornegi Department_id'si 60 olanlar icin yapal�m

-- Nested Procedures Parametrelere De�er G�nderme Y�ntemleri
-- Pozisyon Notasyonu, �sim Notasyonu, Kar���k Notasyon
-- Herbiri ile ayr� ayr� yapal�m
-- ilk olarak Pozisyon Notasyonu ile yapal�m
Declare
      w_maas        Employees.salary%type;
      w_zamli_maas  Employees.salary%type:=1.25; -- Burada %25 zam istedigimiz icin 1.25 yazd�k
      Procedure get_info(
                          p_id          IN      Employees.Employee_id%type,
                          p_salary      OUT     Employees.salary%type,
                          p_new_salary  IN OUT  Employees.salary%type            
                        ) IS
      Begin
          Select salary INTO p_salary From Employees Where Employee_id = p_id;
          p_new_salary:= p_new_salary * p_salary;
      End;
Begin
    For i IN (Select Employee_id From Employees Where Department_id = 60)
    Loop
        get_info(i.Employee_id,w_maas,w_zamli_maas);
        dbms_output.put_line('Employee_id= ' || i.Employee_id || ' Simdiki Maas = ' || w_maas || ' Zaml� Yeni Maas = ' || w_zamli_maas);    
        w_zamli_maas:=1.25;
    End Loop;
End;
/
-- Nested Procedures Parametrelere De�er G�nderme Y�ntemleri
-- Pozisyon Notasyonu, �sim Notasyonu, Kar���k Notasyon
-- Herbiri ile ayr� ayr� yapal�m
-- Simdi isim Notasyonu ile yapal�m(S�ras� onemli degil)

Declare
      w_maas        Employees.salary%type;
      w_zamli_maas  Employees.salary%type:=1.25; -- Burada %25 zam istedigimiz icin 1.25 yazd�k
      Procedure get_info(
                          p_id          IN      Employees.Employee_id%type,
                          p_salary      OUT     Employees.salary%type,
                          p_new_salary  IN OUT  Employees.salary%type            
                        ) IS
      Begin
          Select salary INTO p_salary From Employees Where Employee_id = p_id;
          p_new_salary:= p_new_salary * p_salary;
      End;
Begin
    For i IN (Select Employee_id From Employees Where Department_id = 60) Loop
        --get_info(p_id => i.Employee_id, p_salary => w_maas, p_new_salary => w_zamli_maas);
        -- isim notasyonunda s�ra onemli degil
        get_info(p_salary => w_maas, p_new_salary => w_zamli_maas, p_id => i.Employee_id);
        dbms_output.put_line('Employee_id= ' || i.Employee_id || ' Simdiki Maas = ' || w_maas || ' Zaml� Yeni Maas = ' || w_zamli_maas);    
        w_zamli_maas:=1.25;
    End Loop;
End;
/
-- Nested Procedures Parametrelere De�er G�nderme Y�ntemleri
-- Pozisyon Notasyonu, �sim Notasyonu, Kar���k Notasyon
-- Herbiri ile ayr� ayr� yapal�m
-- Simdi Kar���k Notasyon ile yapal�m
-- KARISIK NOTASYON ile yap�l�rken once Pozisyon Notasyonuna gore sonra isim notasyonuna gore s�ras�yla yazmam�z laz�m
Declare
      w_maas        Employees.salary%type;
      w_zamli_maas  Employees.salary%type:=1.25; -- Burada %25 zam istedigimiz icin 1.25 yazd�k
      Procedure get_info(
                                    p_id          IN      Employees.Employee_id%type,
                                    p_salary      OUT     Employees.salary%type,
                                    p_new_salary  IN OUT  Employees.salary%type            
                                  ) IS
      Begin
          Select salary INTO p_salary From Employees Where Employee_id = p_id;
          p_new_salary:= p_new_salary * p_salary;
      End;
Begin
    For i IN (Select Employee_id From Employees Where Department_id = 60) Loop
        get_info(i.Employee_id, w_maas, p_new_salary => w_zamli_maas);
        dbms_output.put_line('Employee_id= ' || i.Employee_id || ' Simdiki Maas = ' || w_maas || ' Zaml� Yeni Maas = ' || w_zamli_maas);    
        w_zamli_maas:=1.25;
    End Loop;
End
/
--*********************************************************************************************
/*
Procedures 

  A) Nested Procedures
      �	Unnamed Bloklarda yaz�lan Procedure�lerdir.
      �	Veritaban� i�inde saklanmaz.  
  Su ana kadar Nested Procedurelar uzerine calistik, simdi Stored Procedure calisalim
  
  B) Stored Procedures 
      �	Standalone ya da Package i�inde yaz�labilir
      �	Veritaban� i�inde saklan�r.
*/

--*********************************************************************************************
--   B) Stored Procedures
--*********************************************************************************************
/*
  Standalone Stored Procedures
  
  Create Syntax
  
  CREATE [OR REPLACE] PROCEDURE <proc_name>
      (
        <parameters>
      )
      IS
        <variables>
        
      BEGIN � Executable part begins
          ...
          EXCEPTION � Exception-handling part begins
      END <Proc_name>;
*/
/*
  Drop Syntax
  
  Drop PROCEDURE <proc_name>;
*/

/*

Standalone Stored Procedures Nas�l �al��t�r�l�r?

  Sqlplus ya da Sql Developer i�inde
      �	EXECUTE proc_name(params); veya EXEC proc_name(params);

  PL/SQL Bloklar�nda
      �	Unnamed PL/SQL i�inde
      �	Named PL/SQL i�inde (Stored Procedure, Function, Trigger)
          <proc_name>(params);
*/



-- Ornek; Konsola Merhaba Dunya yazd�ran bir Stored Procedure yazal�m

CREATE OR REPLACE PROCEDURE MerhabaDunya IS
        
      BEGIN
                dbms_output.put_line('Merhaba Dunya!!!');
      END MerhabaDunya;
/

Execute MerhabaDunya;
/

Exec MerhabaDunya;
/
  
--

  CREATE OR REPLACE PROCEDURE MerhabaDunya2 IS
        
      BEGIN
          dbms_output.put_line('***** Merhaba Dunya!!!');
      END;
/

Execute MerhabaDunya2;

/ 

Exec MerhabaDunya2;

/

-- Stored Procedure bir PL/SQL blogu icinden cagiral�m

Declare

Begin
  MerhabaDunya;
  MerhabaDunya2;
End;
/

-- Ornek; Departments tablosuna haftasonlar� kay�t girisini engelleyen bir Procedure yazal�m
-- Normalde bu tur engellemeler Triggerlar ile yap�l�r,
-- ama biz simdi bunu Stored Procedure ile yapal�m

Desc Departments;
/

Select TO_CHAR(sysdate, 'DY') From Dual;
Select TO_CHAR(sysdate+1, 'DY') From Dual;

Select TO_CHAR(sysdate, 'DAY') From Dual;
Select TO_Date('07/05/2023', 'DD/MM/YYYY') From Dual;
Select TO_CHAR(TO_Date('04/05/2023', 'DD/MM/YYYY'), 'DAY') From Dual;
Select TO_CHAR(TO_Date('05/05/2023', 'DD/MM/YYYY'), 'DAY') From Dual;
Select TO_CHAR(TO_Date('06/05/2023', 'DD/MM/YYYY'), 'DAY') From Dual;
Select TO_CHAR(TO_Date('07/05/2023', 'DD/MM/YYYY'), 'DAY') From Dual;

Select TO_CHAR(TO_Date('04/05/2023', 'DD/MM/YYYY'), 'DY') From Dual;
Select TO_CHAR(TO_Date('05/05/2023', 'DD/MM/YYYY'), 'DY') From Dual;
Select TO_CHAR(TO_Date('06/05/2023', 'DD/MM/YYYY'), 'DY') From Dual;
Select TO_CHAR(TO_Date('07/05/2023', 'DD/MM/YYYY'), 'DY') From Dual;
/

CREATE OR REPLACE PROCEDURE ins_deptA
              (
                p_dept_id	        IN	    number,   -- Number(4) yazamay�z yani Procedure icinde uzunluk belirtilemez
                p_dept_name	  IN	    VARCHAR2, -- VARCHAR2(30) yazamay�z yani Procedure icinde uzunluk belirtilemez
                p_dept_man_id	IN    	DEPARTMENTS.manager_id%type, -- Referans tipi kullan�labilir
                p_dept_loc_id	  IN	    DEPARTMENTS.location_id%type,-- In yazmak zorunlu degil, yaz�lmazsa IN ' dir
                p_sonuc           OUT VARCHAR2
              ) IS
BEGIN
              IF TO_CHAR(sysdate, 'DY') IN ('CMT', 'PAZ') THEN
                    p_sonuc := 'Cumartesi ve Pazar g�nleri kayit girilemez!';
              ELSE
                  INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
                        VALUES (p_dept_id, p_dept_name, p_dept_man_id, p_dept_loc_id);
                  
                  p_sonuc := 'Kayit Yapildi!';
              END IF;
END;
/
-- Procedure icerisinde (p_sonuc OUT VARCHAR2) yani OUT parametresi oldugu icin
-- Bunu Execute ile direk calistiramay�z, (tabiki farkl� yontemler var ama sade olmas� ac�s�ndan
-- Bunun yerine PL/SQL block icerisinde cagirmal�y�z

-- Execute ins_deptA(300,'IT A', 200, 1900); -- Eksik parametre yazd�g�m�z icin hata verecektir
Execute ins_deptA(300,'IT A', 200, 1900,Mesaj); -- Burada Out ile gelen bilgiyi bir degiskene atmam�z gerekir
-- ve bu degiskeni tan�mlamam�z gerekir
-- Bu nedenle PL/SQL block icerisinde cagiral�m
/
Declare
  mesaj Varchar2(200);
Begin
  -- Select * From Departments;
  ins_deptA(300,'IT A', 200, 1900,Mesaj);
  dbms_output.put_line(Mesaj);
End;
/
CREATE OR REPLACE PROCEDURE ins_deptA_Paz
              (
                p_dept_id	        IN	    number,   -- Number(4) yazamay�z yani Procedure icinde uzunluk belirtilemez
                p_dept_name	  IN	    VARCHAR2, -- VARCHAR2(30) yazamay�z yani Procedure icinde uzunluk belirtilemez
                p_dept_man_id	IN    	DEPARTMENTS.manager_id%type, -- Referans tipi kullan�labilir
                p_dept_loc_id	  IN	    DEPARTMENTS.location_id%type,-- In yazmak zorunlu degil, yaz�lmazsa IN ' dir
                p_sonuc           OUT VARCHAR2
              ) IS
BEGIN
              IF TO_CHAR(sysdate, 'DY') IN ('PAZ') THEN
                    p_sonuc := 'Pazar g�nleri kayit girilemez!';
              ELSE
                  INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
                        VALUES (p_dept_id, p_dept_name, p_dept_man_id, p_dept_loc_id);
                  
                  p_sonuc := 'Kayit Yapildi!';
              END IF;
END;
/
/
Declare
  mesaj Varchar2(200);
Begin
  -- Select * From Departments;
  ins_deptA_PAZ(400,'IT B', 200, 1900,Mesaj);
  dbms_output.put_line(Mesaj);
End;
/

-- Ornek 1
-- Sales_Orders tablosunda herbir orderid'nin yan�na onceki orderid'yi yazd�ral�m

Select
          Max(o2.orderid)
From Sales_Orders o2
Where o2.orderid < 10250;
/
Select
          o1.orderid,
          (
              Select
                        Max(o2.orderid)
              From Sales_Orders o2
              Where o2.orderid < o1.orderid
          ) as PrevOrderid
From Sales_Orders o1
Order By orderid;
/
-- Ornek 2
-- Sales_Orders tablosunda herbir orderid'nin yan�na sonraki orderid'yi yazd�ral�m
Select
          o1.orderid,
          (
              Select
                        Min(o2.orderid)
              From Sales_Orders o2
              Where o2.orderid > o1.orderid
          ) as NextOrderid
From Sales_Orders o1
Order By orderid;
/

-- Ornek 3
-- Yillara gore toplam qty'leri bulunuz ve view haline getiriniz
-- Tarih alan� olarak orderdate kullan�n�z
-- Tablolar: Sales_Orders, Sales_OrderDetails

Select
          To_Char(orderdate,'YYYY'),
          Sum(od.Qty) as TotalQty
From  Sales_Orders o
join    Sales_OrderDetails od  on od.orderid = o.orderid
Group By To_Char(orderdate,'YYYY');
/
-- Yukar�daki sorguyu view haline getirelim

Create or Replace View vw_ReportOrderYearQty as
Select
          To_Char(orderdate,'YYYY') as OrderYear,
          Sum(od.Qty) as TotalQty
From  Sales_Orders o
join    Sales_OrderDetails od  on od.orderid = o.orderid
Group By To_Char(orderdate,'YYYY');
/

Select *
From vw_ReportOrderYearQty
Order By OrderYear;

--08102023

-- Simdi Tarihi manuel gonderelim ve yeni bir Procedure yapal�m

CREATE OR REPLACE PROCEDURE ins_deptB
    (
      p_tarih	              IN	 Varchar2,
      p_dept_id	          IN 	number,   -- Number(4) yazamay�z yani Procedure icinde uzunluk belirtilemez
      p_dept_name	    IN 	VARCHAR2, -- VARCHAR2(30) yazamay�z yani Procedure icinde uzunluk belirtilemez
      p_dept_man_id	  IN 	DEPARTMENTS.manager_id%type, -- Referans tipi kullan�labilir
      p_dept_loc_id	    IN	DEPARTMENTS.location_id%type,-- In yazmak zorunlu degil, yaz�lmazsa IN ' dir
      p_sonuc             OUT VARCHAR2
    ) IS
BEGIN
    IF TO_CHAR(TO_Date(p_tarih, 'DD/MM/YYYY'), 'DY') IN ('CMT', 'PAZ') THEN
        p_sonuc := 'Cumartesi ve Pazar g�nleri kayit girilemez!';
    ELSE
      INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
    VALUES (p_dept_id, p_dept_name, p_dept_man_id, p_dept_loc_id);
        p_sonuc := 'Kayit Yapildi!';
    END IF;
END;
/

--
Set ServerOutPut On;
/

Declare
  mesaj Varchar2(200);
Begin
  -- Select * From Departments;

  ins_deptB('02/10/2023', 303, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('02/10/2023 Tarihine ' || Mesaj);
  
  ins_deptB('08/10/2023', 304, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('08/10/2023 Tarihine ' || Mesaj);
  Rollback;
End;
/
--

Select TO_CHAR(sysdate, 'D') From Dual;

Select TO_CHAR(TO_Date('04/05/2023', 'DD/MM/YYYY'), 'D') From Dual;
Select TO_CHAR(TO_Date('05/05/2023', 'DD/MM/YYYY'), 'D') From Dual;
Select TO_CHAR(TO_Date('06/05/2023', 'DD/MM/YYYY'), 'D') From Dual;
Select TO_CHAR(TO_Date('07/05/2023', 'DD/MM/YYYY'), 'D') From Dual;
Select TO_CHAR(TO_Date('08/05/2023', 'DD/MM/YYYY'), 'D') From Dual;
/
-- Hafta sonuna gelen gunu 'D' format�nda integer olarakta ogrenebiliriz
-- Buna uygun bir procedure yazal�m

CREATE OR REPLACE PROCEDURE ins_deptC
    (
      p_tarih	      IN	Varchar2,
      p_dept_id	    IN	number,   -- Number(4) yazamay�z yani Procedure icinde uzunluk belirtilemez
      p_dept_name	  IN	VARCHAR2, -- VARCHAR2(30) yazamay�z yani Procedure icinde uzunluk belirtilemez
      p_dept_man_id	IN	DEPARTMENTS.manager_id%type, -- Referans tipi kullan�labilir
      p_dept_loc_id	IN	DEPARTMENTS.location_id%type,-- In yazmak zorunlu degil, yaz�lmazsa IN ' dir
      p_sonuc       OUT VARCHAR2
    ) IS
BEGIN
    IF TO_CHAR(TO_Date(p_tarih, 'DD/MM/YYYY'), 'D') IN (6, 7) THEN
        -- 1 Pazartesi, 2 Sal�, 3 �ar�amba, 4 Per�embe, 5 Cuma, 6 Cumartesi, 7 Pazar 
        p_sonuc := 'Cumartesi ve Pazar g�nleri kayit girilemez!';
    ELSE
      INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
    VALUES (p_dept_id, p_dept_name, p_dept_man_id, p_dept_loc_id);
        p_sonuc := 'Kayit Yapildi!';
    END IF;

END;
/
--

Declare
  mesaj Varchar2(200);
Begin
  -- Select * From Departments;

  ins_deptC('01/05/2023', 303, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('01/05/2023 Tarihine ' || Mesaj);
  
  ins_deptC('06/05/2023', 304, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('06/05/2023 Tarihine ' || Mesaj);
  Rollback;
End;
/
-- Exception ekleyelim
-- Buna uygun bir procedure yazal�m

CREATE OR REPLACE PROCEDURE ins_deptD
    (
      p_tarih	      IN	Varchar2,
      p_dept_id	    IN	number,   -- Number(4) yazamay�z yani Procedure icinde uzunluk belirtilemez
      p_dept_name	  IN	VARCHAR2, -- VARCHAR2(30) yazamay�z yani Procedure icinde uzunluk belirtilemez
      p_dept_man_id	IN	DEPARTMENTS.manager_id%type, -- Referans tipi kullan�labilir
      p_dept_loc_id	IN	DEPARTMENTS.location_id%type,-- In yazmak zorunlu degil, yaz�lmazsa IN ' dir
      p_sonuc       OUT VARCHAR2
    ) IS
BEGIN
    IF TO_CHAR(TO_Date(p_tarih, 'DD/MM/YYYY'), 'D') IN (6, 7) THEN
        -- 1 Pazartesi, 2 Sal�, 3 �ar�amba, 4 Per�embe, 5 Cuma, 6 Cumartesi, 7 Pazar 
        p_sonuc := 'Cumartesi ve Pazar g�nleri kayit girilemez!';
    ELSE
      Begin
          INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
              VALUES (p_dept_id, p_dept_name, p_dept_man_id, p_dept_loc_id);
            p_sonuc := 'Kayit Yapildi!';
          Exception When Others Then
            p_sonuc := 'Hata Meydana Geldi, sqlcode = ' || sqlcode || ' Mesaj =  ' || sqlerrm;
      End;
    END IF;
END;
/
--
Desc Departments;
/
Declare
  mesaj Varchar2(200);

Begin
  -- Select * From Departments;
  ins_deptD('01/05/2023', 303, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('01/05/2023 Tarihine ' || Mesaj);
  
  ins_deptD('06/05/2023', 304, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('06/05/2023 Tarihine ' || Mesaj);
  --Rollback;
End;
/
Declare
  mesaj Varchar2(200);
Begin
  -- Select * From Departments;
  ins_deptD('01/05/2023', 30311, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('01/05/2023 Tarihine ' || Mesaj);
  
  ins_deptD('06/05/2023', 304, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('06/05/2023 Tarihine ' || Mesaj);
  --Rollback;
End;
/
CREATE OR REPLACE PROCEDURE ins_deptD_AS
    (
      p_tarih	      IN	Varchar2,
      p_dept_id	    IN	number,   -- Number(4) yazamay�z yani Procedure icinde uzunluk belirtilemez
      p_dept_name	  IN	VARCHAR2, -- VARCHAR2(30) yazamay�z yani Procedure icinde uzunluk belirtilemez
      p_dept_man_id	IN	DEPARTMENTS.manager_id%type, -- Referans tipi kullan�labilir
      p_dept_loc_id	IN	DEPARTMENTS.location_id%type,-- In yazmak zorunlu degil, yaz�lmazsa IN ' dir
      p_sonuc       OUT VARCHAR2
    ) AS
BEGIN
    IF TO_CHAR(TO_Date(p_tarih, 'DD/MM/YYYY'), 'D') IN (6, 7) THEN
        -- 1 Pazartesi, 2 Sal�, 3 �ar�amba, 4 Per�embe, 5 Cuma, 6 Cumartesi, 7 Pazar 
        p_sonuc := 'Cumartesi ve Pazar g�nleri kayit girilemez!';
    ELSE
      Begin
          INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
              VALUES (p_dept_id, p_dept_name, p_dept_man_id, p_dept_loc_id);
            p_sonuc := 'Kayit Yapildi!';
          Exception When Others Then
            p_sonuc := 'Hata Meydana Geldi, sqlcode = ' || sqlcode || ' Mesaj =  ' || sqlerrm;
      End;
    END IF;
END;
/
--
Desc Departments;
/
Set ServerOutPut On;
/
Declare
  mesaj Varchar2(200);
Begin
  -- Select * From Departments;
  ins_deptD_AS('01/05/2023', 303, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('01/05/2023 Tarihine ' || Mesaj);
  
  ins_deptD_AS('06/05/2023', 304, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('06/05/2023 Tarihine ' || Mesaj);
  --Rollback;
End;
/
Declare
  mesaj Varchar2(200);
Begin
  -- Select * From Departments;
  ins_deptD_AS('01/05/2023', 30311, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('01/05/2023 Tarihine ' || Mesaj);
  
  ins_deptD_AS('06/05/2023', 304, 'IT B', 200, 1900,Mesaj);
  dbms_output.put_line('06/05/2023 Tarihine ' || Mesaj);
  --Rollback;
End;
/
--*********************************************************************************************
-- Parametrelere DEFAULT deger atanmas�
-- isim NOTASYONU ile (=>) Parametrelere deger gondermek
-- Procedure nas�l silinir
-- Bu konularla ilgili bir calisma yapal�m
--*********************************************************************************************
-- Select * From DEPARTMENTS;
/

CREATE OR REPLACE PROCEDURE ins_deptE
    (
      p_tarih	      IN	Varchar2,
      p_dept_id	    IN	number,
      p_dept_name	  IN	VARCHAR2,
      p_dept_man_id	IN	DEPARTMENTS.manager_id%type DEFAULT 100,-- Deger verilmezse 100 olarak default deger gelir
      p_dept_loc_id	IN	DEPARTMENTS.location_id%type,
      p_sonuc       OUT VARCHAR2
    ) IS
BEGIN
    IF TO_CHAR(TO_Date(p_tarih, 'DD/MM/YYYY'), 'D') IN (6, 7) THEN
        -- 1 Pazartesi, 2 Sal�, 3 �ar�amba, 4 Per�embe, 5 Cuma, 6 Cumartesi, 7 Pazar 
        p_sonuc := 'Cumartesi ve Pazar g�nleri kayit girilemez!';
    ELSE
      Begin
          INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
              VALUES (p_dept_id, p_dept_name, p_dept_man_id, p_dept_loc_id);
            p_sonuc := 'Kayit Yapildi!';
          Exception When Others Then
            p_sonuc := 'Hata Meydana Geldi, sqlcode = ' || sqlcode || ' Mesaj =  ' || sqlerrm;
      End;
    END IF;
END;
/
--

Declare
  mesaj Varchar2(200);
Begin
  -- Select * From Departments;
  -- Pozisyon Notasyonuna gore veri girelim
  ins_deptE('02/05/2023', 310, 'IT B', 111, 1900,Mesaj);
  dbms_output.put_line('Pozisyon Notasyonuna gore 02/05/2023 Tarihine ' || Mesaj);
  
  -- isim Notasyonuna gore veri girelim / paramatre s�ras� onemli degil
  -- once s�rayla parametre verelim
  ins_deptE( p_tarih       => '03/05/2023',
             p_dept_id     => 311,
             p_dept_name   => 'IT B',
             p_dept_man_id => 111,
             p_dept_loc_id => 1900,
             p_sonuc       => Mesaj
            );
  dbms_output.put_line('S�ral� isim Notasyonuna gore 03/05/2023 Tarihine ' || Mesaj);
  
  -- isim Notasyonuna gore veri girelim / paramatre s�ras� onemli degil
  -- once s�rayla parametre verelim
  ins_deptE( 
             p_dept_id     => 312,
             p_dept_name   => 'IT B',
             p_sonuc       => Mesaj,
             p_tarih       => '04/05/2023',
             p_dept_loc_id => 1900,
             p_dept_man_id => 111
            );
  dbms_output.put_line('Farkl� Yerlerde isim Notasyonuna gore 04/05/2023 Tarihine ' || Mesaj);
  
  --Rollback;
End;
/
--Rollback;
/
Select * From Departments;
/
-- Default Degere gore Calistiral�m

Declare
  mesaj Varchar2(200);
Begin
  -- isim Notasyonuna gore veri girelim / paramatre s�ras� onemli degil
  ins_deptE( p_tarih       => '03/05/2023',
             p_dept_id     => 311,
             p_dept_name   => 'IT Space',
             --p_dept_man_id => 200,
             p_dept_loc_id => 1900,
             p_sonuc       => Mesaj
            );
  dbms_output.put_line('S�ral� isim Notasyonuna gore 03/05/2023 Tarihine ' || Mesaj);
    
  --Rollback;
End;
/
Select * From Departments;
/
-- Drop Procedure ProcedureAdi; -- ProcedureAdi adl� Procedure Drop edilir
CREATE OR REPLACE PROCEDURE ins_Test IS
BEGIN
    dbms_output.put_line('Test Procedure Call edildi');
END;
/
Execute ins_Test;
/
Drop Procedure ins_Test;
/
Execute ins_Test;
/

CREATE OR REPLACE PROCEDURE MerhabaDunyaTestB IS
BEGIN
    dbms_output.put_line('Merhaba Dunya!!!');
END MerhabaDunyaTestB;
/

Execute MerhabaDunyaTestB;

/
Drop Procedure MerhabaDunyaTestB;
/

Execute MerhabaDunyaTestB;

/
--*********************************************************************************************
-- Functions(Developer-Defined Functions)
-- Uygulama geli�tiricisi taraf�ndan geli�tirilen fonksiyonlard�r
--*********************************************************************************************
/*
  Functions

  A) Nested Functions 
      �	Unnamed Bloklarda yaz�lan Function�lardir. Veritaban� i�inde saklanmaz
  B) Functions
      �	Standalone ya da Package i�inde yaz�labilir
      �	Veritaban� i�inde saklan�r. 
--*********************************************************************************************
/*
  A) Nested Functions 
      �	Unnamed Bloklarda yaz�lan Function�lardir. Veritaban� i�inde saklanmaz
*/
--*********************************************************************************************
/*
  Nested Functions - Syntax
  DECLARE
        wsonuc	<data_type>;
        -- Declare and define function
        FUNCTION <func_name> (-- Subprogram heading begins
          <parameters>
        ) RETURN <data_type>
        IS
            <variables>
          -- Declarative part begins
        BEGIN -- Executable part begins
            ...
            RETURN (data);
            EXCEPTION -- Exception-handling part begins
        END <Proc_name>;
  BEGIN -- Main Block
      ...
      wsonuc := <func_name>(parameter Values); -- Call func
  END;
*/

-- Ornek
-- Unnamed Block icinde, Toplam bulan bir fonksiyon yazal�m

Declare
    ToplamSayi Number;
    
      Function Toplam(Sayi1 Number, Sayi2 Number) Return Number IS
      --Function Toplam(Sayi1 IN Number, Sayi2 IN Number) Return Number IS
        -- IN kullan�m� tercihe bagl�d�r
        Sayi3 Number;
      Begin
        Sayi3 := Sayi1 + Sayi2;
        Return(Sayi3);
      End;
Begin
    ToplamSayi := Toplam(99,100);
    dbms_output.put_line('Toplam : ' || ToplamSayi);
End;
/
-- IN ile kullanal�m

Declare
    ToplamSayi Number;
    
      Function Toplam(Sayi1 IN Number, Sayi2 IN Number) Return Number IS
        -- IN kullan�m� tercihe bagl�d�r
        Sayi3 Number;
      Begin
        Sayi3 := Sayi1 + Sayi2;
        Return(Sayi3);
      End;
Begin
    ToplamSayi := Toplam(99,200);
    dbms_output.put_line('Toplam : ' || ToplamSayi);
End;
/
-- Procedure ve Function kullanarak Calisanlar� listeleyelim

-- Nested Functions
-- PROCEDURE ve FUNCTION Bir arada kullanal�m

DECLARE
      
      FUNCTION dept_name(p_dept departments.department_id%type)
              RETURN departments.department_name%type IS
              
      wdeptname departments.department_name%type;
      
      BEGIN
            SELECT department_name INTO wdeptname
            FROM DEPARTMENTS
            WHERE department_id = p_dept;
            
            RETURN(wdeptname);
            
            EXCEPTION WHEN NO_DATA_FOUND THEN
              RETURN(null);
      END;
      
      PROCEDURE emp_oku (p_dept departments.department_id%type) IS
        BEGIN
        
            dbms_output.put_line(p_dept || '-' || dept_name(p_dept));
            dbms_output.new_line;
            
            FOR I IN (SELECT employee_id, last_name FROM EMPLOYEES WHERE department_id = p_dept) 
            LOOP
                  dbms_output.put_line(I.employee_id || ' ' || I.last_name);
            END LOOP;
        End;
Begin
    emp_oku(60);
End;
/
/
-- Yukar�daki Program� biraz daha gelistirelim
-- Departments Tablosundaki Tum departmanlar icin calisanlar� listelesin

DECLARE
      
      FUNCTION dept_name(p_dept departments.department_id%type)
              RETURN departments.department_name%type IS
      
      wdeptname departments.department_name%type;
      
      BEGIN
            SELECT department_name INTO wdeptname
            FROM DEPARTMENTS
            WHERE department_id = p_dept;
            
            RETURN(wdeptname);
            
            EXCEPTION WHEN NO_DATA_FOUND THEN
              RETURN(null);
      END;
      
      PROCEDURE emp_oku (p_dept departments.department_id%type) IS
        BEGIN
            dbms_output.new_line;
            dbms_output.put_line(p_dept || '-' || dept_name(p_dept));
            
            FOR I IN (  SELECT employee_id, first_name, last_name 
                              FROM EMPLOYEES
                              WHERE department_id = p_dept
                          ) 
            LOOP
                  dbms_output.put_line('       ' || I.employee_id || ' ' || I.first_name || ' ' || I.last_name);
            END LOOP;
        End;
Begin
    For j In (Select Department_id From Departments) 
    Loop
        emp_oku(j.Department_id);
    End Loop;
    
End;
/
-- Ornegimizi Cursor tan�mlay�p yapal�m
DECLARE
      Cursor c_dept IS Select Department_id From Departments;
      r_dept c_dept%rowtype;
      
      FUNCTION dept_name(p_dept departments.department_id%type)
              RETURN departments.department_name%type IS
      wdeptname departments.department_name%type;
      BEGIN
            SELECT department_name INTO wdeptname FROM DEPARTMENTS
            WHERE department_id = p_dept;
            RETURN(wdeptname);
            
            EXCEPTION WHEN NO_DATA_FOUND THEN
              RETURN(null);
      END;
      
      PROCEDURE emp_oku (p_dept departments.department_id%type) IS
        BEGIN
            dbms_output.new_line;
            dbms_output.put_line(p_dept || '-' || dept_name(p_dept));
            dbms_output.put_line('------------------------------------');
            FOR I IN (SELECT employee_id, first_name, last_name FROM EMPLOYEES WHERE department_id = p_dept) LOOP
                  dbms_output.put_line('       ' || I.employee_id || ' ' || I.first_name || ' ' || I.last_name);
            END LOOP;
        End;
Begin
    Open c_dept;
        Loop
            Fetch c_dept into r_dept;
            Exit When c_dept%NotFound;
            emp_oku(r_dept.Department_id);

        End Loop;
    Close c_dept;    
End;
/
-- Ornegimizde Procedure icerisinde Function direk dbms icinde kulland�k
-- simdi bunu degiskene aktararak yapal�m

DECLARE
      Cursor c_dept IS Select Department_id From Departments;
      r_dept c_dept%rowtype;
      
      FUNCTION dept_name(p_dept departments.department_id%type)
              RETURN departments.department_name%type IS
      wdeptname departments.department_name%type;
      BEGIN
            SELECT department_name INTO wdeptname FROM DEPARTMENTS
            WHERE department_id = p_dept;
            RETURN(wdeptname);
            
            EXCEPTION WHEN NO_DATA_FOUND THEN
              RETURN(null);
      END;
      
      PROCEDURE emp_oku (p_dept departments.department_id%type) IS
        wdept_adi departments.department_name%type;
        BEGIN
            wdept_adi:= dept_name(p_dept);
            dbms_output.new_line;
            dbms_output.put_line(p_dept || '-' || wdept_adi);
            dbms_output.put_line('------------------------------------');
            FOR I IN (SELECT employee_id, first_name, last_name FROM EMPLOYEES WHERE department_id = p_dept) LOOP
                  dbms_output.put_line('       ' || I.employee_id || ' ' || I.first_name || ' ' || I.last_name);
            END LOOP;
        End;
Begin
    Open c_dept;
        Loop
            Fetch c_dept into r_dept;
            Exit When c_dept%NotFound;
            emp_oku(r_dept.Department_id);

        End Loop;
    Close c_dept;    
End;
/
-- Evet ayn� sonucu ald�k

-- Procedure icerisinden Function cagrilabilir ve
-- Function icerisinden Procedure cagrilabilir
-- Her ikiside olur
-- Ayr�ca Select icerisinde de Function kullan�labilir

-- Function yal�n halde bakal�m

DECLARE
      FUNCTION dept_name(p_dept departments.department_id%type)
              RETURN departments.department_name%type IS
      wdeptname departments.department_name%type;
      BEGIN
            SELECT department_name INTO wdeptname FROM DEPARTMENTS
            WHERE department_id = p_dept;
            RETURN(wdeptname);
            
            EXCEPTION WHEN NO_DATA_FOUND THEN
              RETURN(null);
      END;
Begin
      dbms_output.put_line('60 -' || dept_name(60));
End;
/

--*********************************************************************************************
/*
  B) Functions
      �	Standalone ya da Package i�inde yaz�labilir
      �	Veritaban� i�inde saklan�r. 
*/

--*********************************************************************************************

--*********************************************************************************************
/*
  Standalone Functions
  Syntax

CREATE [OR REPLACE] FUNCTION <function_adi>
        (Parametreler) IS
        RETURN <data_type>
        
Silmek icin        
DROP FUNCTION <function_adi>;

*/
--*********************************************************************************************


--*********************************************************************************************
/*
 Nested Functions dersinde yazd���m�z ornegi, Standalone Function
 seklinde yaz�p veritaban�nda kal�c� hale getirelim
*/
--*********************************************************************************************

Create Or Replace Function fnc_dept_name(p_dept departments.department_id%type)
    RETURN departments.department_name%type IS
    wdeptname departments.department_name%type;
    BEGIN
          SELECT department_name INTO wdeptname FROM DEPARTMENTS
          WHERE department_id = p_dept;
          RETURN(wdeptname);
          
          EXCEPTION WHEN NO_DATA_FOUND THEN
            RETURN(null);
    END;
/    
Create Or Replace Procedure Proc_emp_oku
    (p_dept departments.department_id%type) IS
    wdept_adi departments.department_name%type;
    BEGIN
        wdept_adi:= fnc_dept_name(p_dept);
        dbms_output.new_line;
        dbms_output.put_line(p_dept || '-' || wdept_adi);
        dbms_output.put_line('------------------------------------');
        FOR I IN (SELECT employee_id, first_name, last_name FROM EMPLOYEES WHERE department_id = p_dept)
        LOOP
              dbms_output.put_line('       ' || I.employee_id || ' ' || I.first_name || ' ' || I.last_name);
        END LOOP;
    End;
/
DECLARE
Begin
          Proc_emp_oku(100); 
End;
/
Begin
          Proc_emp_oku(100); 
End;

/

DECLARE
      Cursor c_dept IS Select Department_id From Departments;
      r_dept c_dept%rowtype;    
Begin
    Open c_dept;
        Loop
            Fetch c_dept into r_dept;
            Exit When c_dept%NotFound;
            Proc_emp_oku(r_dept.Department_id);
        End Loop;
    Close c_dept;    
End;
/
--*********************************************************************************************
/*
  Standalone Functions
  
  Recursive Function
  (Yinelemeli- Kendi Kendini �a��ran fonksiyon)
*/
--*********************************************************************************************

-- Ornek;
-- Faktoriyel hesab� yapan bir function yazal�m
-- ve bu function kendi kendini ca��rarak bu i�i yaps�n

Create Or Replace Function Faktoriyel(n integer)
Return integer IS

  wfact integer;

Begin
  if    n = 0 Then
    wfact:= 1;
  Elsif n = 1 Then
    wfact:= 1;
  Elsif n < 0 Then
    wfact:= null;
  Else
    wfact:= n * faktoriyel(n-1);
  End if;
  Return(wfact);
End;
/

Select '5! = ' || faktoriyel(5)  From Dual;
Select '0! = ' || faktoriyel(0)  From Dual;
Select '1! = ' || faktoriyel(1)  From Dual;
Select '-5!= ' || faktoriyel(-5) From Dual;
Select '9! = ' || faktoriyel(9)  From Dual;

/


--*********************************************************************************************
/*
PACKAGES
PL/SQL Nesnelerinin, bir isim alt�nda toplanm�� mant�ksal kolleksiyonudur

Package ��inde Hangi PL/SQL Nesneleri Bulunabilir?
    Developer-Defined Data Types
    Variables
    Constants (Sabitler) Ornegin pi say�s�, zam oran� v.s.
    Cursors
    Functions
    Procedures
*/
--*********************************************************************************************
/*
Packages 

 
  Package Specification (Tan�mlama B�l�m�)
      �	Paket i�inde yer alacak Functions ve Procedures ba�l�k bilgilerini ve
      �	PUBLIC De�i�kenler, Sabitler, Developer Data- Types, Cursors tan�mlar�n� i�erir.

  Package Body(�al��abilir Kodlar B�l�m�) 
      �	Paket i�inde yer alan Functions ve Procedures i�in Executable kodlar� ve
      �	PRIVATE De�i�kenler, Sabitler, Developer Data-Types, Cursors tan�mlar�n� i�erir.

*/


--*********************************************************************************************
/*
Syntax 
 
Package Specification(Tan�mlama B�l�m�)

CREATE OR REPLACE PACKAGE package_name IS
    [declarations of variables and types]
    [specifications of cursors]
    [specifications of function]
    [specifications of procedure]
END [package_name];

Package Body(�al��abilir Kodlar B�l�m�) 
 
CREATE OR REPLACE PACKAGE BODY package_name IS
    [declarations of variables and types]
    [specifications of cursors]
    [specifications of function]        
          BEGIN
              ...
          END;
          
    [specifications of procedure]        
          BEGIN
              ...              
          END;
END [package_name];
*/

/*
Package Nesnesine nas�l referans verilir

Packageismi.Nesneismi
*/

/*
Package icindeki Function ve Procedure nas�l calistirilir

Variable_Name:= Paketismi.Functionismi(parametreler);

Paketismi.Procedureismi(parametreler);
*/

/*
Package Kullanman�n Avantajlar�
    Modularity(Moduler olmas�/Merkezi bir yerden yonetilebilir olmas�)
    Overloading(Birden fazla ayn� isimde ve esit say�da
                parametrik Fonksiyonlar ve Procedure'lar tan�mlanabilir
                Sadece parametrelerin veritipleri degisir)
    Better Performance (paket ilk kullan�mda diskten Memory'e yerlesir ve direk memoryden calisir
                        o yuzden daha iyi performans gosterir)
*/
--*********************************************************************************************

--*********************************************************************************************
/*
Package Specification(Tan�mlama B�l�m�)
�rnek 1

�ok kullan�lan nesnelerin tan�mland��� bir PACKAGE �rne�i olu�turaca��z.

Not: Paket i�inde FUNCTION ve PROCEDURE olmayacaksa, BODY k�sm�n� tan�mlamaya gerek yoktur.

*/
--*********************************************************************************************
CREATE OR REPLACE PACKAGE myTypes AS
    TYPE empData IS RECORD
                                          (
                                            emp_id employees.employee_id%type,
                                            f_name employees.first_name%type
                                          );
    
    PI CONSTANT NUMBER(3,2) := 3.14;
    
    TYPE cursor_type IS REF CURSOR; -- Bos bir cursor olusturuyoruz
    
    myException Exception;

END myTypes;
/


-- Ornek 2
-- Paket icinde tan�ml� nesnelerin PL/SQL bloklar�nda kullan�m�

DECLARE
    wempdata	myTypes.empData;  -- myTypes paketi icerisindeki empData olarak tan�ml� Record anlam�ndad�r
    c_cursor	myTypes.cursor_type;
    r	number := 5;  -- Yar�capi r olan dairenin alan�n� bulal�m (pi * r2)
    
BEGIN
    OPEN c_cursor FOR SELECT employee_id, first_name FROM EMPLOYEES;
        LOOP
            FETCH c_cursor INTO wempdata;
            EXIT WHEN c_cursor%NOTFOUND;
            dbms_output.put_line(wempdata.emp_id || ' ' || wempdata.f_name);
        END LOOP;
    CLOSE c_cursor;
    
     dbms_output.put_line('pi Sayisi = ' || myTypes.PI);
    dbms_output.put_line(r || ' Yaricapli dairenin alani = ' || myTypes.PI * POWER(r, 2) );
END;
/
-- Ornek
-- Paket icinde PROCEDURE tan�m�

CREATE OR REPLACE PACKAGE myTypesB AS
    TYPE empData IS RECORD
    (
      emp_id employees.employee_id%type,
      f_name employees.first_name%type
    );
   
    PI CONSTANT NUMBER(3,2) := 3.14;    
    TYPE cursor_type IS REF CURSOR; -- Bos bir cursor olusturuyoruz
    myException Exception;
    
    Procedure Calisanlar(p_dept_id Employees.Department_id%type);

END myTypesB;
/

CREATE OR REPLACE PACKAGE BODY myTypesB AS
    Procedure Calisanlar(p_dept_id Employees.Department_id%type) is
        wempdata	myTypesB.empData;     -- myTypesB paketi icerisindeki empData olarak tan�ml� Record anlam�ndad�r
        c_cursor	myTypesB.cursor_type;
        -- c_cursor	cursor_type; -- Body icinde kullanacaksak paket ad� yazmadanda yapabiliriz
        
    
    Begin
        OPEN c_cursor FOR SELECT employee_id, first_name FROM EMPLOYEES Where Department_id = p_dept_id;
            LOOP
                FETCH c_cursor INTO wempdata;
                EXIT WHEN c_cursor%NOTFOUND;
                dbms_output.put_line(wempdata.emp_id || ' ' || wempdata.f_name);
            END LOOP;
        CLOSE c_cursor;    
    End;
END myTypesB;
/

Execute myTypesB.Calisanlar(60);
Exec myTypesB.Calisanlar(60);
Exec myTypesB.Calisanlar(50);
/

DECLARE    
BEGIN    
    myTypesB.Calisanlar(60);
END;
/
BEGIN    
    myTypesB.Calisanlar(60);
END;
/

-- Ornek
-- Paket icinde BODY k�sm�nda PROCEDURE tan�mlarken paket ad�n� yazmadan ayn� ornegi yapal�m

CREATE OR REPLACE PACKAGE myTypesC AS
    TYPE empData IS RECORD
    (
      emp_id employees.employee_id%type,
      f_name employees.first_name%type
    );
   
    PI CONSTANT NUMBER(3,2) := 3.14;    
    TYPE cursor_type IS REF CURSOR; -- Bos bir cursor olusturuyoruz
    myException Exception;
    
    Procedure Calisanlar(p_dept_id Employees.Department_id%type);

END myTypesC;
/

CREATE OR REPLACE PACKAGE BODY myTypesC AS
    Procedure Calisanlar(p_dept_id Employees.Department_id%type) is
        wempdata	empData;     -- myTypesC paketi icerisindeki empData olarak tan�ml� Record anlam�ndad�r
        c_cursor	cursor_type; -- Body icinde kullanacaksak paket ad� yazmadanda yapabiliriz
    
    Begin
        OPEN c_cursor FOR SELECT employee_id, first_name FROM EMPLOYEES Where Department_id = p_dept_id;
            LOOP
                FETCH c_cursor INTO wempdata;
                EXIT WHEN c_cursor%NOTFOUND;
                dbms_output.put_line(wempdata.emp_id || ' ' || wempdata.f_name);
            END LOOP;
        CLOSE c_cursor;    
    End;
END myTypesC;
/

Execute myTypesC.Calisanlar(60);
/

-- Paket icinde FUNCTION kullan�m�

CREATE OR REPLACE PACKAGE myTypesD AS
    TYPE empData IS RECORD
    (
      emp_id employees.employee_id%type,
      f_name employees.first_name%type
    );
   
    PI CONSTANT NUMBER(3,2) := 3.14;    
    TYPE cursor_type IS REF CURSOR; -- Bos bir cursor olusturuyoruz
    myException Exception;
    
    Procedure Calisanlar(p_dept_id Employees.Department_id%type);
    Function DaireninAlani(r Number) Return Number;
END myTypesD;
/

CREATE OR REPLACE PACKAGE BODY myTypesD AS
    Procedure Calisanlar(p_dept_id Employees.Department_id%type) is
        wempdata	empData;     -- myTypesD paketi icerisindeki empData olarak tan�ml� Record anlam�ndad�r
        c_cursor	cursor_type; -- Body icinde kullanacaksak paket ad� yazmadanda yapabiliriz
    
    Begin
        OPEN c_cursor FOR SELECT employee_id, first_name FROM EMPLOYEES Where Department_id = p_dept_id;
            LOOP
                FETCH c_cursor INTO wempdata;
                EXIT WHEN c_cursor%NOTFOUND;
                dbms_output.put_line(wempdata.emp_id || ' ' || wempdata.f_name);
            END LOOP;
        CLOSE c_cursor;    
    End;
    
    Function DaireninAlani(r Number) Return Number is
        wsonuc Number;
    Begin
        wsonuc:= myTypesD.PI * POWER(r, 2);
        Return(wsonuc);
    End;
END myTypesD;
/

Select ' Yaricapli dairenin alani = ' || myTypesD.DaireninAlani(5) From Dual;
/

Declare
Begin
    dbms_output.put_line(' Yaricapli dairenin alani = ' || myTypesD.DaireninAlani(5));
End;
/

Begin
    dbms_output.put_line(' Yaricapli dairenin alani = ' || myTypesD.DaireninAlani(5));
End;
/
-- Simdi sadece function olarak sade bir paket yapal�m

CREATE OR REPLACE PACKAGE myTypesE AS
    PI CONSTANT NUMBER(3,2) := 3.14;    
    Function DaireninAlani(r Number) Return Number;
END myTypesE;
/

CREATE OR REPLACE PACKAGE BODY myTypesE AS
   
    Function DaireninAlani(r Number) Return Number is
        wsonuc Number;
    Begin
        wsonuc:= myTypesE.PI * POWER(r, 2);
        Return(wsonuc);
    End;
END myTypesE;
/

Select ' Yaricapli dairenin alani = ' || myTypesE.DaireninAlani(5) From Dual;
/


Declare
Begin
    dbms_output.put_line(' Yaricapli dairenin alani = ' || myTypesE.DaireninAlani(5));
End;
/

Begin
    dbms_output.put_line(' Yaricapli dairenin alani = ' || myTypesE.DaireninAlani(5));
End;
/

-- Yukar�daki ornegin body k�sm�ndaki Function icerisinde paket ad� yazmadan PI sayis�na ulasal�m

CREATE OR REPLACE PACKAGE myTypesL AS
    PI CONSTANT NUMBER(3,2) := 3.14;    
    Function DaireninAlani(r Number) Return Number;
END;
/

CREATE OR REPLACE PACKAGE BODY myTypesL AS
  
    Function DaireninAlani(r Number) Return Number is
        wsonuc Number;
    Begin
        wsonuc:= PI * POWER(r, 2);  -- Ayn� paket icinde oldugu icin myTypesL yazmadanda PI sabitini cagirabiliriz
        Return(wsonuc);
    End;
END;
/


Select ' Yaricapli dairenin alani = ' || myTypesL.DaireninAlani(5) From Dual;
/

Begin
    dbms_output.put_line(' Yaricapli dairenin alani = ' || myTypesL.DaireninAlani(5));
End;
/

Declare
  Sonuc Number;
Begin
    Sonuc:= myTypesL.DaireninAlani(5);
    dbms_output.put_line(' Yaricapli dairenin alani = ' || Sonuc);
End;
/


-- Function icinde procedure cagr�labilir
-- Procedure icinde function cagrilabilir

CREATE OR REPLACE PACKAGE myTypesM AS
    PI CONSTANT NUMBER(3,2) := 3.14;    
    
    Procedure Calisanlar;
    
    Function DaireninAlani(r Number) Return Number;
END myTypesM;
/

CREATE OR REPLACE PACKAGE BODY myTypesM AS
    Function DaireninAlani(r Number) Return Number is
        wsonuc Number;
    Begin
        wsonuc:= myTypesM.PI * POWER(r, 2);
        Return(wsonuc);
    End;

    Procedure Calisanlar is        
    Begin
        dbms_output.put_line(' Yaricapli dairenin alani = ' || myTypesM.DaireninAlani(5));
    End;
    
END myTypesM;
/

Execute myTypesM.Calisanlar;
/

-- Body k�sm�nda once function ve procedure farketmez
-- Yani s�ras� onemli degildir
-- Hangisi olursa olsun calisir

CREATE OR REPLACE PACKAGE myTypesM2 AS
    PI CONSTANT NUMBER(3,2) := 3.14;       
    Procedure Calisanlar;
    Function DaireninAlani(r Number) Return Number;
END myTypesM2;
/

CREATE OR REPLACE PACKAGE BODY myTypesM2 AS
    Procedure Calisanlar is        
    Begin
        dbms_output.put_line(' Yaricapli dairenin alani = ' || myTypesM2.DaireninAlani(5));
        -- veya
        -- dbms_output.put_line(' Yaricapli dairenin alani = ' || DaireninAlani(5));
    End;

    Function DaireninAlani(r Number) Return Number is
        wsonuc Number;
    Begin
        wsonuc:= myTypesM2.PI * POWER(r, 2);
        Return(wsonuc);
    End;    
END myTypesM2;
/

Execute myTypesM2.Calisanlar;
/

-- Begin End Blogunun sonunda paket ismini yazmasakta olur

CREATE OR REPLACE PACKAGE myTypesM3 AS
    PI CONSTANT NUMBER(3,2) := 3.14;       
    Procedure Calisanlar;
    Function DaireninAlani(r Number) Return Number;
END;
/

CREATE OR REPLACE PACKAGE BODY myTypesM3 AS
    Procedure Calisanlar is        
    Begin
        dbms_output.put_line(' Yaricapli dairenin alani = ' || DaireninAlani(5));
    End;

    Function DaireninAlani(r Number) Return Number is
        wsonuc Number;
    Begin
        wsonuc:= PI * POWER(r, 2);
        Return(wsonuc);
    End;    
END;
/

Execute myTypesM3.Calisanlar;
/

--*********************************************************************************************
/*
      TRIGGERS
      
  Herhangi bir durum(event) olustugunda otomatik olarak calisan(tetiklenen)
  PL/SQL programlar�d�r
*/
--*********************************************************************************************

/*
Triggers

A) DML Triggers(Table Level, Row Level)
            (Insert, Update, Delete) 
      * Before ve
      * After olmak uzere ikiye ayr�l�r

B) Schema Triggers(Create, Drop, Alter)

C) Database Triggers(Logon, Logoff, Shutdown, Startup)

*/

--*********************************************************************************************
/*
A) DML Triggers(Table Level, Row Level)
            (Insert, Update, Delete) 
      * Before ve
      * After olmak uzere ikiye ayr�l�r
*/
--*********************************************************************************************

-- DML TRIGGERS

-- Ornek (Table Level)
-- Mesai saatlari disinda DML islemleri(INSERT, UPDATE, DELETE) yapilamasin

/

Select TO_CHAR(sysdate, 'HH24:MI') From Dual;
Select TO_CHAR(sysdate, 'DY') From Dual;

/
Create Or Replace Trigger Dml_Departments
  Before insert Or update Or delete On Departments
Begin
        if TO_CHAR(sysdate, 'HH24:MI') not between '08:00' and '18:00' or
           TO_CHAR(sysdate, 'DY') in ('SAT', 'SUN', 'CMT', 'PAZ') Then
                Raise_Application_Error(-20205, 'Mesai saatleri disinda veri isleme yapilamaz!');
        End if;
End;
/

-- Select * From Departments;
delete from Departments where Department_id = 311;
Rollback;
/
-- Sartlari degistirelim
-- oglen 12-13 aras�nda DML yap�lamas�n

Create Or Replace Trigger Dml_Departments
  Before insert Or update Or delete On Departments
Begin
        if TO_CHAR(sysdate, 'HH24:MI') between '12:00' and '13:00' Then
                Raise_Application_Error(-20205, 'Oglen 12:00 - 13:00 saatlerinde (DML) veri isleme yapilamaz!');
        End if;
End;
/

Select * From Departments Where Department_id = 311;
/

delete from Departments where Department_id = 311;
Rollback;
Select * From Departments Where Department_id = 311;

-- Sartlari degistirelim
-- Sal� Gunleri DML yap�lamas�n

Select TO_CHAR(sysdate, 'DY') From Dual;
/
Create Or Replace Trigger Dml_Departments
  Before insert Or update Or delete On Departments
Begin
        if TO_CHAR(sysdate, 'DY') in ('SAL', 'TUE') Then
                Raise_Application_Error(-20205, 'Sal� Gunleri veri isleme yapilamaz!');
        End if;
End;
/
delete from Departments where Department_id = 311;
Rollback;
Select * From Departments Where Department_id = 311;
/

-- Sartlari degistirelim
-- Sal� Gunleri 08-00 - 18.00 d�s�nda DML yap�lamas�n

Select TO_CHAR(sysdate, 'DY') From Dual;
/

Drop Trigger Dml_Departments;
/

Create Or Replace Trigger Dml_Departments
  Before insert Or update Or delete On Departments
Begin
        if TO_CHAR(sysdate, 'DY') in ('SAL', 'TUE') and
           TO_CHAR(sysdate, 'HH24:MI') not between '08:00' and '18:00' Then
                Raise_Application_Error(-20205, 'Sal� Gunleri 08:00-18:00 disinda veri isleme yapilamaz!');
        End if;
End;
/

delete from Departments where Department_id = 311;
Rollback;
Select * From Departments Where Department_id = 311;
/
Drop Trigger Dml_Departments;
/
/*
DML Trigger(Table Level)
�rnek 2
    Senaryo : Mesai saatleri d���nda DML i�lemleri (INSERT, UPDATE, DELETE) yap�lamas�n
    Bu senaryoyu di�er tablolara da uygulayal�m.
    Bunun i�in yap�lan saat ve g�n kontrol�n� bir STANDALONE PROCEDURE �eklinde yaz�p bu
    PROCEDURE�� Table Level Trigger i�inde �al��t�raca��z
    -- Bu islemi PAKET icinde de yapabiliriz
*/
/
Create Or Replace Procedure dml_guvenlik_kontrolu is
Begin
        if TO_CHAR(sysdate, 'DY') in ('PAZ', 'SUN') and
           TO_CHAR(sysdate, 'HH24:MI') between '12:00' and '14:00' Then
                Raise_Application_Error(-20205, 'Pazar Gunleri 12-14 aras�nda veri isleme yapilamaz!');
        End if;
End;
/

Create Or Replace Trigger Dml_Departments
  Before insert Or update Or delete On Departments
Begin
    dml_guvenlik_kontrolu;
End;
/

delete from Departments where Department_id = 311;
Rollback;
Select * From Departments Where Department_id = 311;
/

-- Drop Trigger Dml_Departments;
Alter Trigger Dml_Departments Disable;

delete from Departments where Department_id = 311;
Select * From Departments Where Department_id = 311;
Rollback;
Select * From Departments Where Department_id = 311;

Alter Trigger Dml_Departments Enable;

delete from Departments where Department_id = 311;
Select * From Departments Where Department_id = 311;
Rollback;
Select * From Departments Where Department_id = 311;
/
-- Simdi kosullar� degistirelim

Create Or Replace Procedure dml_guvenlik_kontrolu is
Begin
    if TO_CHAR(sysdate, 'HH24:MI') between '12:00' and '18:00' Then            
            Raise_Application_Error(-20205, '12-18 aras�nda veri isleme yapilamaz!');
    End if;
End;
/

Create Or Replace Trigger Dml_Departments
  Before insert Or update Or delete On Departments
Begin
    dml_guvenlik_kontrolu;
End;
/

delete from Departments where Department_id = 311;
Rollback;
Select * From Departments Where Department_id = 311;
/

-- Drop Trigger Dml_Departments;

Alter Trigger Dml_Departments Disable;
/

delete from Departments where Department_id = 311;
Select * From Departments Where Department_id = 311;
Rollback;
Select * From Departments Where Department_id = 311;
/
Alter Trigger Dml_Departments Enable;
/
delete from Departments where Department_id = 311;
Select * From Departments Where Department_id = 311;
Rollback;
Select * From Departments Where Department_id = 311;
/
Create Table jobs as
Select *
From hr.jobs;
/
Create or Replace Trigger trg_dml_jobs
  Before insert or update or delete ON jobs
Begin
    dml_guvenlik_kontrolu;
End;
/

delete from jobs Where job_id = 'AD_PRES';
Select * From jobs Where job_id = 'AD_PRES';
Rollback;
Select * From jobs Where job_id = 'AD_PRES';
/

Alter Trigger trg_dml_jobs Disable;
/
Select * From jobs;
/
Update jobs
Set JOB_TITLE ='CEO' 
Where job_id = 'AD_PRES';
/
Select * From jobs Where job_id = 'AD_PRES';
Rollback;
Select * From jobs Where job_id = 'AD_PRES';

Alter Trigger trg_dml_jobs Enable;
/

Update jobs 
Set JOB_TITLE ='CEO' 
Where job_id = 'AD_PRES';
/
Select * From jobs Where job_id = 'AD_PRES';
-- Rollback;
Select * From jobs Where job_id = 'AD_PRES';
/
-- Simdi Employees2 tablosunda yapal�m
Create Table Employees2 as
 Select *
 From employees;
 /
 Select * From employees2;
 /
Create or Replace Trigger trg_dml_employees2
Before insert or update or delete ON Employees2
Begin
    dml_guvenlik_kontrolu;
End;
/

Update employees2 
Set EMAIL = 'kinga' 
Where job_id = 'AD_PRES';
/
Select * From jobs Where job_id = 'AD_PRES';
Rollback;
Select * From employees2 Where job_id = 'AD_PRES';
/
Desc Employees2;
/
Alter Trigger trg_dml_Employees2 Disable;
/

Update employees2 Set EMAIL = 'kinga' Where job_id = 'AD_PRES';
Select * From employees2 Where job_id = 'AD_PRES';
Rollback;
Select * From employees2 Where job_id = 'AD_PRES';
/
Alter Trigger trg_dml_Employees2 Enable;
/
Update employees2 Set EMAIL = 'kinga' Where job_id = 'AD_PRES';
Select * From employees2 Where job_id = 'AD_PRES';
-- Rollback;
Select * From employees2 Where job_id = 'AD_PRES';
/
/*
DML Trigger (Audit Trigger - Log Trigger)

Ornek 3

Senaryo : REGIONS tablosu �zerinde yap�lan DML i�lemlerinin
(INSERT, UPDATE, DELETE) Log kay�tlar�n� tutal�m

Bunun i�in �nce Log kay�tlar�n� tutan bir tablo olu�turaca��z
Daha sonra da log kay�tlar� i�in trigger yazaca��z

*/
/*
:NEW ve :OLD ifadeleri

Tabloya INSERT edilen ya da UPDATE edilen kolonlar�n YEN� bilgilerine
:NEW.<column_name> �eklinde eri�ilebilir

Tabloda DELETE edilen ya da UPDATE edilmeyen kolonlar�n ESK� bilgilerine
:OLD.<column_name> �eklinde eri�ilebilir

*/

Create Table regions as
Select *
From hr.Regions;

Desc Regions;

Select * From regions;
/

Create Table Regions_Log
(
  Region_id Number,
  Region_Name Varchar2(25),
  KimYapti  Varchar2(30),
  NeZaman   Date,
  NeYapti   Varchar2(10)
);
/
Select * From Regions_Log;
/
Create Or Replace Trigger trg_Regions_Audit_Log
After insert or update or delete On Regions
For Each Row -- Eger tek bir kolon takip edilecekse kolon ismi yaz�l�r
             -- Biz burada tum kolonlar� takip ediyoruz

Declare      -- Eger degisken olacak ise Declare icerisinde belirtebiliriz
    wislem Varchar2(10);
Begin
    wislem:= Case
                      When inserting  Then 'insert'
                      When updating   Then 'update'
                      When deleting   Then 'delete'
                 End;
             
    if inserting Then
        insert into Regions_Log(Region_id,Region_Name,KimYapti,NeZaman,NeYapti)
                    Values(:NEW.Region_id,:NEW.Region_Name, User, sysdate, wislem);
    End if;

    if updating Then
    
        insert into Regions_Log(Region_id,Region_Name,KimYapti,NeZaman,NeYapti)
                    Values(:OLD.Region_id,:OLD.Region_Name, User, sysdate, wislem || '_OLD');

        insert into Regions_Log(Region_id,Region_Name,KimYapti,NeZaman,NeYapti)
                    Values(NVL(:NEW.Region_id,:OLD.Region_id),    -- :NEW.Region_id null degilse kendisi, null ise :OLD.Region_id(2.parametreyi) donderir
                           NVL(:NEW.Region_Name,:OLD.Region_Name),
                           User, sysdate, wislem || 'NEW');   
    End if;

    if deleting Then
        insert into Regions_Log(Region_id,Region_Name,KimYapti,NeZaman,NeYapti)
                    Values(:OLD.Region_id,:OLD.Region_Name, User, sysdate, wislem);    
    End if;
    
End;
/

Select * From Regions_Log;

Select * From Regions;

insert into Regions(Region_id, Region_Name)
            Values(12,'Anadolu');
-- RollBack;         
Commit;
Select * From Regions;
Select * From Regions_Log;

insert into Regions(Region_id, Region_Name)
            Values(13,'Test');

-- RollBack;         
Commit;
Select * From Regions;
Select * From Regions_Log;

Update Regions
Set Region_Name = 'Space Universe'
Where Region_id = 13;

Commit;
Select * From Regions;
Select * From Regions_Log;


Delete Regions
Where Region_id = 13;

Commit;
Select * From Regions;
Select * From Regions_Log;

Delete Regions_Log Where Region_id is null;

/

select sys_context('USERENV','OS_USER') client_user,
       sys_context('USERENV','IP_ADDRESS') client_ip,
       SYS_CONTEXT('USERENV','HOST') client_machine, User
from dual;
/
-- Ornegimizi biraz daha gelistirelim
Desc Regions;
/
Create Table Regions2 as
Select * From Regions;
/
Desc Regions2;
-- Regions Tablosunun kopyas�n� olusturduk bunun uzerinde calisalim
/
-- Drop Table Regions2_Log;
Create Table Regions2_Log
(
  Region_id Number,
  Region_Name Varchar2(25),
  KimYapti  Varchar2(30),
  client_user Varchar2(100),
  client_ip Varchar2(20),
  client_machine Varchar2(100),
  NeZaman   Date,
  NeYapti   Varchar2(10)
);
/

Create Or Replace Trigger trg_Regions2_Audit_Log
After insert or update or delete On Regions2
For Each Row -- Eger tek bir kolon takip edilecekse kolon ismi yaz�l�r
             -- Biz burada tum kolonlar� takip ediyoruz

Declare      -- Eger degisken olacak ise Declare icerisinde belirtebiliriz
    wislem Varchar2(10);
Begin
    wislem:= Case
                    When inserting  Then 'insert'
                    When updating   Then 'update'
                    When deleting   Then 'delete'
                 End;
             
    if inserting Then
        insert into Regions2_Log(Region_id,Region_Name,
                         client_user,client_ip,client_machine,
                         KimYapti,NeZaman,NeYapti)
            Values(:NEW.Region_id,:NEW.Region_Name,
                  sys_context('USERENV','OS_USER'),sys_context('USERENV','IP_ADDRESS'),SYS_CONTEXT('USERENV','HOST'),
                  User, sysdate, wislem);
    End if;

    if updating Then
        insert into Regions2_Log(Region_id,Region_Name,
                         client_user,client_ip,client_machine,
                         KimYapti,NeZaman,NeYapti)
            Values(:OLD.Region_id,:OLD.Region_Name,
                  sys_context('USERENV','OS_USER'),sys_context('USERENV','IP_ADDRESS'),SYS_CONTEXT('USERENV','HOST'),
                  User, sysdate, wislem || '_OLD');


        insert into Regions2_Log(Region_id,Region_Name,
                         client_user,client_ip,client_machine,
                         KimYapti,NeZaman,NeYapti)
            Values(NVL(:NEW.Region_id,:OLD.Region_id),NVL(:NEW.Region_Name,:OLD.Region_Name),
                  sys_context('USERENV','OS_USER'),sys_context('USERENV','IP_ADDRESS'),SYS_CONTEXT('USERENV','HOST'),
                  User, sysdate, wislem || '_NEW');
    
    End if;

    if deleting Then
         insert into Regions2_Log(Region_id,Region_Name,
                         client_user,client_ip,client_machine,
                         KimYapti,NeZaman,NeYapti)
            Values(:OLD.Region_id,:OLD.Region_Name,
                  sys_context('USERENV','OS_USER'),sys_context('USERENV','IP_ADDRESS'),SYS_CONTEXT('USERENV','HOST'),
                  User, sysdate, wislem);   
    End if;
    
End;
/

-- Alter Trigger trg_Regions2_Audit_Log Disable;
-- Delete From Regions2 Where Region_id >=10;
-- Alter Trigger trg_Regions2_Audit_Log Enable;
-- Delete From regions2 Where region_id = 12;
Select * From Regions2;
Select * From Regions2_Log;

insert into Regions2(Region_id, Region_Name)
            Values(12,'SpaceM2');
-- RollBack;         
Commit;
Select * From Regions2;
Select * From Regions2_Log;

insert into Regions2(Region_id, Region_Name)
            Values(13,'Test');

-- RollBack;         
Commit;
Select * From Regions2;
Select * From Regions2_Log;

Update Regions2
Set Region_Name = 'Space Universes Multi'
Where Region_id = 12;

Commit;
Select * From Regions2;
Select * From Regions2_Log;

Delete Regions2
Where Region_id = 13;

Commit;
Select * From Regions2;
Select * From Regions2_Log;

Delete Regions_Log Where Region_id is null;
/

--******************************* INDEX **********************************************

Set ServerOutPut ON;
Set timing ON;

Create Table orders as
Select *
From Sales_Orders;

Select * From ORDERS;

Set autotrace ON;
Select ORDERID From ORDERS Where ORDERID = 10312;

Create Index inx_orders_orderid on ORDERS(ORDERID);

Set autotrace ON;
Select * From ORDERS Where ORDERID = 10312;

Set autotrace ON;
Select ORDERID From ORDERS Where ORDERID = 10312;

Set autotrace ON;
Select ORDERID, shipcountry From ORDERS Where ORDERID = 10312;
/
-- Drop Index inx_orders2;
/
Create Index inx_orders2 on ORDERS(ORDERID,CUSTID,EMPID);
/

Set autotrace ON;
Select ORDERID,CUSTID,EMPID From ORDERS Where ORDERID = 10312;

Set autotrace ON;
Select ORDERID,CUSTID,EMPID From ORDERS;
-- INDEX FAST FULL SCAN

Set autotrace ON;
Select * From ORDERS;
-- TABLE ACCESS FULL

Set autotrace ON;
Select SHIPCOUNTRY,SHIPCITY  From ORDERS Where ORDERID = 10312;
-- TABLE ACCESS BY INDEX ROWID | ORDERS
-- INDEX RANGE SCAN            | INX_ORDERS_ORDERID

Set autotrace ON;
Select SHIPCOUNTRY,SHIPCITY  From ORDERS;
-- TABLE ACCESS FULL| ORDERS

Create index ix_co_ci On ORDERS(SHIPCOUNTRY,SHIPCITY);

Set autotrace ON;
Select SHIPCOUNTRY,SHIPCITY  From ORDERS;
-- INDEX FAST FULL SCAN

Set autotrace ON;
Select SHIPCOUNTRY,SHIPCITY  From ORDERS where SHIPCOUNTRY = 'USA';
-- INDEX RANGE SCAN
/
Create Table customers as
Select *
From Sales_Customers;
/
Select * From customers;
/

Set autotrace ON;
Select *
From Orders o
join customers c on c.CUSTID= o.CUSTID;
-- HASH JOIN
-- TABLE ACCESS FULL| CUSTOMERS
-- TABLE ACCESS FULL| ORDERS

Set autotrace ON;
Select c.CUSTID, o.ORDERID
From Orders o
join customers c on c.CUSTID= o.CUSTID;
-- HASH JOIN
-- TABLE ACCESS FULL   | CUSTOMERS
-- INDEX FAST FULL SCAN| INX_ORDERS2

Create index ixcust1 on Customers(custid);
/
Set autotrace ON;
Select c.CUSTID, o.ORDERID
From Orders o
join customers c on c.CUSTID= o.CUSTID;
/

Set autotrace ON;
Select c.CUSTID, o.ORDERID
From Orders o
join customers c on c.CUSTID= o.CUSTID
Where c.CUSTID = 1;
/

Set autotrace ON;
Select c.CUSTID, o.ORDERID
From Orders o
join customers c on c.CUSTID= o.CUSTID
Where o.CUSTID = 1;
/

Set autotrace ON;
Select c.CUSTID, o.ORDERID, o.shipcountry, o.shipcity
From Orders o
join customers c on c.CUSTID= o.CUSTID
Where o.CUSTID = 1;
/

Set autotrace ON;
Select c.CUSTID, o.ORDERID, o.shipcountry, o.shipcity
From Orders o
join customers c on c.CUSTID= o.CUSTID
Where c.CUSTID = 1;
/
Select * From hr_employees;
/
Set autotrace ON;
Select c.CUSTID, o.ORDERID, o.shipcountry, o.shipcity
From Orders o
join customers     c on c.CUSTID = o.CUSTID
join hr_employees  e on e.empid  = o.empid;
/
Set autotrace ON;
Select shipcountry, shipcity
From Orders
Where SHIPREGION = 'BC';
-- TABLE ACCESS FULL

Create index ixo_sr1 On Orders(SHIPREGION);
/
Set autotrace ON;
Select shipcountry, shipcity
From Orders
Where SHIPREGION = 'BC';
/
Create index ixo_sr2 On Orders(Lower(SHIPREGION));
/
Set autotrace ON;
Select shipcountry, shipcity
From Orders
Where Lower(SHIPREGION) = 'bc';
-- TABLE ACCESS BY INDEX ROWID| ORDERS
-- INDEX RANGE SCAN           | IXO_SR2
/
Set autotrace ON;
Select shipcountry, shipcity
From Orders
Where shipcountry='USA' and shipcity='Seattle';
-- INDEX RANGE SCAN| IX_CO_CI |	
/
Set autotrace ON;
Select shipcountry, shipcity
From Orders
Where shipcountry='USA'  and
      shipcity='Seattle' and
      To_Char(orderdate,'YYYY') = 2007;
-- TABLE ACCESS FULL| ORDERS | 

Set autotrace ON;
Select * From Orders
Where shipcountry='USA'  and
      shipcity='Seattle' and
      To_Char(orderdate,'YYYY') = 2007;
-- TABLE ACCESS FULL| ORDERS
/
Create index ixord_ccy On Orders(shipcountry, shipcity,orderdate);
/
Set autotrace ON;
Select shipcountry, shipcity, To_Char(orderdate,'YYYY') From Orders
Where shipcountry='USA'  and
      shipcity='Seattle' and
      To_Char(orderdate,'YYYY') = '2007';
-- INDEX RANGE SCAN| IXORD_CCY
/
Set autotrace ON;
Select shipcountry, shipcity, freight From Orders
Where shipcountry='USA'  and
      shipcity='Seattle' and
      To_Char(orderdate,'YYYY') = '2007';
/*
|   0 | SELECT STATEMENT            |           |     1 |    44 |     3   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| ORDERS    |     1 |    44 |     3   (0)| 00:00:01 |
|*  2 |   INDEX RANGE SCAN          | IXORD_CCY |     1 |       |     2   (0)| 00:00:01 |
*/
/
Create index ixord_cccy On Orders(shipcountry, shipcity,custid,orderdate);
/
Set autotrace ON;
Select shipcountry, shipcity, custid From Orders
Where shipcountry='USA'  and
      shipcity='Seattle' and
      To_Char(orderdate,'YYYY') = '2007';
-- INDEX RANGE SCAN| IXORD_CCCY
/
Set autotrace ON;
Select shipcountry, shipcity, custid From Orders
Where lower(shipcountry)='USA'  and
      lower(shipcity)='seattle' and
      To_Char(orderdate,'YYYY') = '2007';
-- INDEX FAST FULL SCAN| IXORD_CCCY
/
select * from index_stats;
-- ilk kullan�mda bos gelir
/
ANALYZE INDEX ixord_cccy VALIDATE STRUCTURE;

select * from index_stats;

 SELECT
        name,
        height,
        lf_rows,
        del_lf_rows,
        (del_lf_rows/lf_rows)*100 as rebuild_orani
FROM INDEX_STATS;

/
-- Drop Table Datab;
Create Table DataB as
SELECT LOCATION_ID as id,
            STREET_ADDRESS as DISTRICT,
            POSTAL_CODE,
            CITY,
            STATE_PROVINCE as STATE,
            COUNTRY_ID
FROM hr.LOCATIONS ;
/
Select *
From DataB;
/
Set autotrace on;

Create index ixid on DataB(id);

Set autotrace on;
Select id
From DATAB;

Set autotrace on;
Select id
From DATAB
WHERE id = 2000;

Create index ixscd1 On DATAB(STATE,	CITY,	DISTRICT);

Set autotrace on;
Select STATE,	CITY,	DISTRICT, ID-- ADET, FIYAT, TUTAR
From DATAB
Where State='Washington' and City = 'Seattle';

create table testObj as select * from all_objects;

Set Timing on;
Set AutoTrace on;
Select Count(*) From TestObj;

Set Timing on;
Set AutoTrace on;
Select * From TestObj;

Select * From index_stats;
Analyze index ixscd1 Validate structure;

-- SYS ile baglanal�m
-- Diger kullan�c�lar icin baglanal�m

Select * From index_stats;
Analyze index ixscd1 Validate structure;

Select * From sys.all_indexes;

Select * From sys.all_indexes
Where TABLE_NAME = 'EMPLOYEES'

Select * From all_indexes
Where TABLE_NAME = 'EMPLOYEES'

Select * From sys.all_indexes
Order By Owner;

Select *
From sys.all_indexes
Where owner = 'ALI1' and TABLE_NAME = 'EMPLOYEES'
Order By Owner;
/

Select *
From sys.all_ind_columns
Where INDEX_OWNER = 'ALI1' and TABLE_NAME = 'EMPLOYEES'
Order By INDEX_OWNER;

-- Query
-- A. Tables accessible to the current user

select ind.index_name,
       ind_col.column_name,
       ind.index_type,
       ind.uniqueness,
       ind.table_owner as schema_name,
       ind.table_name as object_name,
       ind.table_type as object_type       
from sys.all_indexes ind
inner join sys.all_ind_columns ind_col on ind.owner = ind_col.index_owner
                                    and ind.index_name = ind_col.index_name
-- excluding some Oracle maintained schemas
where ind.owner not in ('ANONYMOUS','CTXSYS','DBSNMP','EXFSYS', 'LBACSYS', 
   'MDSYS', 'MGMT_VIEW','OLAPSYS','OWBSYS','ORDPLUGINS', 'ORDSYS','OUTLN', 
   'SI_INFORMTN_SCHEMA','SYS','SYSMAN','SYSTEM', 'TSMSYS','WK_TEST',
   'WKPROXY','WMSYS','XDB','APEX_040000', 'APEX_PUBLIC_USER','DIP', 'WKSYS',
   'FLOWS_30000','FLOWS_FILES','MDDATA', 'ORACLE_OCM', 'XS$NULL',
   'SPATIAL_CSW_ADMIN_USR', 'SPATIAL_WFS_ADMIN_USR', 'PUBLIC')
order by ind.table_owner,
         ind.table_name,
         ind.index_name,
         ind_col.column_position;
-- Yukar�daki sorguyu view haline getirelim
Create view vw_indexbilgileri as
select ind.index_name,
       ind_col.column_name,
       ind.index_type,
       ind.uniqueness,
       ind.table_owner as schema_name,
       ind.table_name as object_name,
       ind.table_type as object_type       
from sys.all_indexes ind
inner join sys.all_ind_columns ind_col on ind.owner = ind_col.index_owner
                                    and ind.index_name = ind_col.index_name
-- excluding some Oracle maintained schemas
where ind.owner not in ('ANONYMOUS','CTXSYS','DBSNMP','EXFSYS', 'LBACSYS', 
   'MDSYS', 'MGMT_VIEW','OLAPSYS','OWBSYS','ORDPLUGINS', 'ORDSYS','OUTLN', 
   'SI_INFORMTN_SCHEMA','SYS','SYSMAN','SYSTEM', 'TSMSYS','WK_TEST',
   'WKPROXY','WMSYS','XDB','APEX_040000', 'APEX_PUBLIC_USER','DIP', 'WKSYS',
   'FLOWS_30000','FLOWS_FILES','MDDATA', 'ORACLE_OCM', 'XS$NULL',
   'SPATIAL_CSW_ADMIN_USR', 'SPATIAL_WFS_ADMIN_USR', 'PUBLIC')
order by ind.table_owner,
         ind.table_name,
         ind.index_name,
         ind_col.column_position;
/     

Select *
From vw_indexbilgileri
Where schema_name = 'HR';

-- B. If you have privilege on dba_indexes and dba_ind_columns

select ind.index_name,
       ind_col.column_name,
       ind.index_type,
       ind.uniqueness,
       ind.table_owner as schema_name,
       ind.table_name as object_name,
       ind.table_type as object_type       
from sys.dba_indexes ind
inner join sys.dba_ind_columns ind_col on ind.owner = ind_col.index_owner
                                    and ind.index_name = ind_col.index_name
-- excluding some Oracle maintained schemas
where ind.owner not in ('ANONYMOUS','CTXSYS','DBSNMP','EXFSYS', 'LBACSYS',
   'MDSYS', 'MGMT_VIEW','OLAPSYS','OWBSYS','ORDPLUGINS', 'ORDSYS','OUTLN',
   'SI_INFORMTN_SCHEMA','SYS','SYSMAN','SYSTEM', 'TSMSYS','WK_TEST',
   'WKPROXY','WMSYS','XDB','APEX_040000', 'APEX_PUBLIC_USER','DIP', 'WKSYS',
   'FLOWS_30000','FLOWS_FILES','MDDATA', 'ORACLE_OCM', 'XS$NULL',
   'SPATIAL_CSW_ADMIN_USR', 'SPATIAL_WFS_ADMIN_USR', 'PUBLIC')
order by ind.table_owner,
         ind.table_name,
         ind.index_name,
         ind_col.column_position;
         
/*
Columns

  index_name - index name
  column_name - column name
  index_type - index type
  uniqueness - column indicating whether the index is unique or not
  schema_name - indexed object's owner, schema name
  object_name - indexed object's name
  object_type - indexed object's type

Rows

  One row represents one column of an index in a database
  Scope of rows:  (A) all indexes on objects accessible to the current user in Oracle database,
                  (B) all indexes on objects in Oracle database
  
  Ordered by schema name, object name, index name, index column sequence number
*/

/*
  1 ) Indeksler view�larda kullan�labilir mi?
      Bu sorunun cevab� asl�nda �okta zor de�il.
      View , bir sorgu c�mleci�inden ibarettir.
      Tablonuzda indeks olu�turduysan�z ve view olu�tururken kulland���n�z sorguda
      indeksi kullanmas�n� sa�lad�ysan�z view indeks kullan�r aksi halde kullanamaz
      
  2) Indeksler ve NULL : Bitmap indeksler ile clustered indexler hari� 
     B*Tree yap�s�ndaki indeksler NULL bar�nd�rmazlar.
     Bunu ��yle ispat etmek m�mk�n
*/
create table t2 (x int, str varchar2(15));
/
create unique index idx_t2 on t2(x);
/
Declare
Begin
             insert into t2 values(1,'bir');
             insert into t2 values(2,'iki');
             insert into t2 values(3,'uc');
             insert into t2 values(null,'bos');
             commit;
End;               
/
Declare
    sqlStr varchar2(500);
Begin
             sqlStr := 'analyze index idx_t2 validate structure';
             execute immediate sqlStr;
End;    
/
select * from index_stats;
/

select name, lf_rows from index_stats;
/
/*
  NAME               LF_ROWS
  IDX_T2            3

  G�r�ld��� �zere T2 tablosunun (x) kolonuna unique indeks uygulad�k,
  4 sat�r ekledik ama kontrol etti�imizde 4 de�il 3 sat�r�n indeksli oldugunu g�rd�k.
  (x) kolonu NULL de�eri ald��� i�in indekslenmemi�tir.

  Yine T2 tablosundan �x� kolonu i�in sorgu yapal�m :
*/
Set AutoTrace On;
select * from t2 where x = 1;     -- sorgusunda �index unique scan� ile 1 satir gelirken

Set AutoTrace On;
select * from t2 where x is null; --  sorgusunda �table Access full� ile 1 satir gelmi�tir.
/*
Yani indeks olu�turdu�umuz �x� kolonu i�in NULL sorgusu yapt�g�m�zda indeks kullan�lmam��t�r.
Bunun sebebi yukar�da da de�indi�imiz indekslerin NULL de�er i�ermemesidir.

2 ya da daha fazla kolon �zerinde indeks olu�turdugumuz durumlarda da kolonlardan en az birinin NOT NULL olup de�er i�ermesi gerekir ki indeks kullan�labilsin.NOT :  �zellikle unique indeks olu�turmak istedi�imizde �NOT NULL� k�s�t� koymak indeksi verimli kullanmam�z� sa�layacakt�r.Parent tablonun primary key alan�nda yap�lacak bir update ya da parent tablodan bir sat�r�n silinmesi child tabloda bir �table lock� olu�mas�na neden olacakt�r.Bu durumda da child tablo �zerinde hi� bir �ekilde DML i�lemi yap�lmas�na izin verilmeyecektir.Bu da �deadlock� probleminin olu�mas�na davetiye ��kar�r.Indekslenmemi� foreign key�ler a�a��daki durumlarda da probleme yol a�ar :

3) Indeksler ve Foreign key : Foreign key�in indekslenip indekslenmemesi konusu asl�nda 
   tamamen tasar�m�n�z ile ilgilidir.
   Foreign key indekslenmedi�inde bizleri bekleyen en b�y�k problem belkide �deadlock� olu�mas�d�r.
   Peki bu nas�l olur?Bunu anlamak i�in �nce �u bilgileri tekrar edelim :�child table� foreign key bar�nd�ran tablodur, �parent table� ise  foreign key�in g�sterdi�i alan�n bulundugu tablodur.

i) Child tablo da �ON DELETE CASCADE� �zelli�i olsun ve foreign key�de indeks bulunmas�n.Bu durumda parent tabloda bir verinin silinmesi durumunda child tabloda bir �full table scan� yap�lmas�na sebeb olunur.

ii) Parent tablodan child tabloya dogru olan sorgularda.EMP / DEPT �rne�i verilebilir.EMP child table, DEPT ise parent tablodur ve �rnegin depname = �XXX� olan �al��anlar� getir gibi bir sorguda s�k�nt� ya�ayabilirsiniz :
     Select * from emp, dept
     where emp.deptno = dept.deptno
     and dept.depname = �XXX�Peki tersi durumlar, yani foreign key de�erinin indekslenmesine gerek olmayan durumlar neler olabilir ? :
    a) Parent tablodan bir veri silinmeyece�inde
    b) Parent tablonun primary/unique key de�eri update edilmeyece�inde
    c) Parent tablo ile child tablo foreign key de�eri �zerinden sorgulanmayaca��nda.
       Bu �artlarda foreign key indeklemeye gerek yoktur bu sayede DML i�lemlerimizde
       gereksiz yere indekslenmeden dolay� bir yava�lamaya sebeb olmayacakt�r. 
*/       


Explain Plan for Select * From OracleDataA.Sales_Orders Where shipcountry = 'USA' and shipcity = 'Seattle';
/
Select * From Table(dbms_xplan.display);

Select * From all_indexes Where Table_Name='DATAB2';


Set AutoTrace ON;
Select * From OracleDataA.Sales_Orders Where shipcountry = 'USA' and shipcity = 'Seattle';
/
Select * From Table(dbms_xplan.display);

/

Explain Plan for Select * From OracleDataA.Sales_Orders;
/
Select * From Table(dbms_xplan.display);


--************************************************************************************************************
-- Index Ornekleri
--************************************************************************************************************

create table SalesIndex
(
  id int,
  order_id int,
  product_code varchar2(3),
  amount int,
  Date_of_sale date
);
/

-- Select DBMS_RANDOM.VALUE(Min_Value,Max_Value) From Dual;
Select DBMS_RANDOM.VALUE(1,2) From Dual; -- 1 ile 2 aras� deger uretir
Select DBMS_RANDOM.VALUE(3,9) From Dual; -- 3 ile 9 aras� deger uretir

/

INSERT INTO SalesIndex
    Select
        rownum,
        FLOOR(DBMS_RANDOM.VALUE(90,9000)),
        DBMS_RANDOM.STRING('U',3),
        FLOOR(DBMS_RANDOM.VALUE(90,9000)),
        TRUNC(SYSDATE)-FLOOR(DBMS_RANDOM.VALUE(10,900))
    From DUAL
        CONNECT BY LEVEL <=100000;
-- Yukaridaki kod ile 1 den baslayarak 100.000 Kay�t ekler
/


SELECT Count(*) FROM SalesIndex;

INSERT INTO SalesIndex
    Select
        rownum + 100000,
        FLOOR(DBMS_RANDOM.VALUE(90,9000)),
        DBMS_RANDOM.STRING('U',3),
        FLOOR(DBMS_RANDOM.VALUE(90,9000)),
        TRUNC(SYSDATE)-FLOOR(DBMS_RANDOM.VALUE(10,900))
    From DUAL
        CONNECT BY LEVEL <=200000;
-- Yukaridaki kod ile 100.001 den baslayarak 200.000 Kay�t ekler

/

INSERT INTO SalesIndex
    Select
        rownum + 300000,
        FLOOR(DBMS_RANDOM.VALUE(90,9000)),
        DBMS_RANDOM.STRING('U',3),
        FLOOR(DBMS_RANDOM.VALUE(90,9000)),
        TRUNC(SYSDATE)-FLOOR(DBMS_RANDOM.VALUE(10,900))
    From DUAL
        CONNECT BY LEVEL <=99;
-- Yukaridaki kod ile 300.001 den baslayarak 99 Kay�t ekler
SELECT * FROM SalesIndex WHERE ID >=300000 ;

EXPLAIN PLAN FOR SELECT * FROM SalesIndex WHERE ID=1 ;
/
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
/

create unique index idx_sales_id on SalesIndex(id);
/
analyze index idx_sales_id validate structure;
/
EXPLAIN PLAN FOR SELECT * FROM SalesIndex WHERE ID=1 ;
/
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
/
select * from user_segments; --where segment_name= 'IDX_SALES_ID';

EXPLAIN PLAN FOR SELECT * FROM SalesIndex WHERE ID=1000 ;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

--USABLE AND NONUSABLE INDEX
ALTER INDEX idx_sales_id UNUSABLE;
EXPLAIN PLAN FOR SELECT * FROM SalesIndex WHERE ID=1000 ;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
select * from user_segments where segment_name='IDX_SALES_ID'

ALTER INDEX idx_sales_id REBUILD;
select * from user_segments where segment_name='IDX_SALES_ID';
EXPLAIN PLAN FOR SELECT * FROM SalesIndex WHERE ID=1000 ;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Visible and invisible index
ALTER INDEX idx_sales_id invisible;
Select * from user_segments where segment_name='IDX_SALES_ID';
EXPLAIN PLAN FOR SELECT * FROM SalesIndex WHERE ID=1000 ;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

ALTER INDEX idx_sales_id visible;
EXPLAIN PLAN FOR SELECT * FROM SalesIndex WHERE ID=1000 ;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- **********************************************************************************************
-- Bir ornek �zerinde devam edelim
-- **********************************************************************************************


Select * From all_objects;
SELECT * FROM ALL_INDEXES;

-- Drop Table index_demo;
Create Table index_demo as 
Select * From all_objects;

Select * From all_objects;
Select * From index_demo;
SELECT * FROM ALL_INDEXES;

Select Count(*) From all_objects;
Select Count(*) From index_demo;
SELECT Count(*) FROM ALL_INDEXES;

SELECT * FROM ALL_INDEXES WHERE TABLE_NAME='INDEX_DEMO';

EXPLAIN PLAN FOR
  SELECT * FROM index_demo WHERE OBJECT_NAME='DUAL';

SELECT * FROM TABLE (DBMS_XPLAN.DISPLAY);

Alter Table index_demo add constraint PK_INDEX_DEMO primary key(OWNER,OBJECT_NAME,OBJECT_TYPE,OBJECT_ID);

SELECT * FROM ALL_INDEXES WHERE TABLE_NAME='INDEX_DEMO';

Select * From index_demo;
Create Unique index idx_object_id on index_demo(OBJECT_ID);
SELECT * FROM ALL_INDEXES WHERE TABLE_NAME='INDEX_DEMO';

SELECT * FROM index_demo WHERE OBJECT_NAME='DUAL';
SELECT Owner, OBJECT_NAME, Object_Type
FROM index_demo
WHERE OBJECT_NAME='DUAL';

EXPLAIN PLAN FOR
  SELECT * FROM index_demo WHERE OBJECT_NAME='DUAL';

SELECT * FROM TABLE (DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR SELECT * FROM index_demo WHERE OBJECT_NAME='DUAL' AND OWNER='SYS';
SELECT * FROM TABLE (DBMS_XPLAN.DISPLAY);

--OWNER,OBJECT_NAME,OBJECT_TYPE,OBJECT_ID
--OWNER,OBJECT_NAME,OBJECT_TYPE
--OWNER,OBJECT_NAME
--OWNER

-- Drop table trans_demo;
create table trans_demo
(
  id int,
  salary int,
  dept_no int
);
/

insert into trans_demo
select rownum,trunc(DBMS_RANDOM.VALUE(100,9000)),trunc(DBMS_RANDOM.VALUE(1,10)) FROM DUAL
CONNECT BY LEVEL <=100000;
/

EXPLAIN PLAN FOR select * from trans_demo where id =10;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

CREATE UNIQUE INDEX IDX_tran_demo ON trans_demo(ID);

EXPLAIN PLAN FOR select * from trans_demo where id =10;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR select * from trans_demo;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR select count(1) from trans_demo;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR select * from trans_demo where id =1000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);


-- * ile tum kolonlar� Select edelim
EXPLAIN PLAN FOR
    SELECT *          
    FROM index_demo
    ORDER BY OBJECT_TYPE;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- * ile tum kolonlar� Select etmek fazla veri trafigi olusturur, ihtiyac olan kolonlar� sadece cekmeliyiz
-- Ayr�ca index yukar�daki ornekte devreye girmedi

EXPLAIN PLAN FOR
    SELECT OWNER,OBJECT_NAME,OBJECT_ID,OBJECT_TYPE
    FROM index_demo
    ORDER BY OBJECT_TYPE;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
-- Yukar�daki ornekte index devreye girdi ve
-- belirli kolonlar Select edildigi icin maliyet kazanc saglad�k

EXPLAIN PLAN FOR
    SELECT OWNER,OBJECT_NAME,OBJECT_ID,OBJECT_TYPE
    FROM index_demo;
    --ORDER BY OBJECT_TYPE
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- indexte yer almayan bir kolonuda Select edelim ve Execution Plan� gorelim
EXPLAIN PLAN FOR
SELECT OWNER, OBJECT_NAME, OBJECT_ID, OBJECT_TYPE, data_object_id
FROM index_demo;
-- ORDER BY OBJECT_TYPE
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
-- Goruldugu gibi index devreye girmedi
-- ve Table Access Full yapt�

EXPLAIN PLAN FOR
SELECT OWNER,OBJECT_NAME,OBJECT_ID,OBJECT_TYPE
FROM index_demo
ORDER BY OWNER; I
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
SELECT OWNER,OBJECT_NAME,OBJECT_ID,OBJECT_TYPE
FROM index_demo
ORDER BY OBJECT_ID;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
SELECT OWNER,OBJECT_NAME,OBJECT_ID
FROM index_demo
ORDER BY OBJECT_ID;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
SELECT OWNER,OBJECT_NAME
FROM index_demo
ORDER BY OBJECT_ID;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
    Select * From trans_demo Where id=1;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR select count(1) from trans_demo;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR select count(*) from trans_demo;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

/*
EXPLAIN PLAN FOR SELECT * FROM Customer_details_idx WHERE CUSTOMER_ID=1 AND REGION = 'AP';
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

SELECT * FROM customer_details_idx WHERE CUSTOMER_ID=1 AND REGION ='AP'
UNION
SELECT * FROM customer_details_idx WHERE CUSTOMER_ID=1 AND REGION ='EMEA'
*/

drop table trans_demo cascade constraints;
-- tablomuzu droplayal�m ve id icin not null ekleyelim
-- unique indexler null degeri indexe dahil eder
-- dolay�s�yla not null diyelim
-- ve insert islemleri dahil hepsini yeniden yapal�m

create table trans_demo
(
    id int not null,
    salary int,
    dept_no int
);

insert into trans_demo
select rownum,trunc(DBMS_RANDOM.VALUE(100,9000)),trunc(DBMS_RANDOM.VALUE(1,10)) FROM DUAL
CONNECT BY LEVEL <=100000;
/
CREATE UNIQUE INDEX IDX_tran_demo ON trans_demo(ID);

EXPLAIN PLAN FOR select * from trans_demo where id =10;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR select count(1) from trans_demo;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR select * from trans_demo where id =1000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR select count(1) from trans_demo;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

--drop table trans_demo cascade constraints;

EXPLAIN PLAN FOR
select * from trans_demo where id=1;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR select count(1) from trans_demo;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- ******************************************************************************
-- indexlere su ac�danda ornekle verelim
/*
Oracle - Indexler Hakk�nda detayl� bilgi 
Yap�lan bir sorguda istedi�imiz ko�ullardaki verileri en k�sa zamanda elde etmek isteriz.Bunu sa�laman�n yollar�na �Access path�  ad� veriliyor.
Bunlar�n ba��nda da belki de en �ok bilineni ve genellikle de en etkili olan� indekslerdir.
Oracle��n her yeni s�r�m�nde farkl� indeks yap�lar� ile kar��la�mak m�mk�n.
Mesela bitmap indeksler ile fonksiyon bazl�(function-based index) indeksler �rnek olarak s�ylenebilir.
Burada bu konulara girilmeyecek s�k kullan�lan indekslerin �genel� �zelliklerinden k�saca bahsedilecektir.

NOT : Indeksler sorgularda genellikle kurtar�c� ya da en etklili yol olarak bilinse de uygun kullan�lmad�klar�nda hepimizin g�z�n� korkutan �ki  her zaman b�yle de�ildir- t�m tablonun taranmas�(Full Table Scan) i�leminden daha �ok zaman ald��� durumlar olabilmektedir.

�imdi k�saca indekslere bir g�z atal�m : Indeks kullan�m�n� anlamak i�in �nce B*Tree yap�s� hakk�nda bilgi sahibi olmakta fayda var.

btreeB*Tree yap�s�nda 3 farkl� seviyeden bahsedilir.
  Bunlar�n ilki en tepede duran �Root��tur.
  En altta da �leaf� denilen seviye ve 
  bu ikisi aras�nda da �branch� (lar) bulunur.
  
  �rne�in �root� de�erimiz 50 olsun.
    Bundan k���kleri sola,  b�y�kleri sa�a,
    branch tada boyle bir ayr�m yapt�g�mz� d���nerek yeniden bir dallanma ger�ekle�tirdi�imizde (leaf) , 
    kabaca bir B Tree olu�turmu� oluruz.
    (Bu yap�n�n etkili kullan�m� i�in dengeli bir yap�da tutulmas� gerekmektedir.
    Yani veriler bir tarafa dogru y���lma yapmamal�d�r.)
    En etkili avantaj� a�a� �zerinde milyonlarca kay�t olsa bile 
    en fazla 2 ya da 3 I/O ile bir kayda ula�man�n m�mk�n olmas�d�r.
    (Dezavantaj ise bir d���m�n silinmesi ya da de�i�tirilmesi durumunda 
    a�ac�n yeniden organize edilmesi ihtiyac�n�n olmas�d�r.)
    
    �rne�in T tablomuzda �id� kolonu �zerinde �index� oldugunu varsayarsak indeks olu�turmak i�in a�a��daki gibi yazabiliriz :

    Oracle ac�s�ndan bu a�ac�n �nemine gelecek olursak , 
    Oracle indeks yap�s�n�  bu a�a� yap�s� �zerine oturtmu�tur.
    Yani bir kolon �zerinde bir indeks olu�turdu�unuzda bu indeks (kolon de�eri) ve 
    o verinin bulundugu sat�r bilgisi(rowid) bu a�a�ta uygun yere yerle�tirilir.
    (ROWID,verinin fiziksel adresidir).
    Leaf seviyesinde ya tek bir de�er olur ya da bir de�er aral��� bilgisi bulunur.
    Ama hepsi s�ral�d�r. Leaf seviyeler birbirine linkli liste mant���na g�re ba�l�d�r.
*/
 

CREATE INDEX t_id_idx ON t(id);

--Peki bu a�amada neler ya�an�r? �id� kolonunun de�erleri artan s�rada dizilir.Degeri ve tablodaki sat�r adresi(rowid) bilgisi saklan�r, bu �ekilde indeksimiz olu�turulmu� olur.A�a��daki sorguya bakal�m :

select * from T where id = 12345;

--sorgusunda normal �artlarda indeks tarama (index scan) yap�l�r, �nce �id� de�eri indeksten bulunur ve sat�r�n�n rowid bilgisine ula��l�r ve rowid bilgisi ile tabloya nokta at��� yap�larak veriler getirilir. ��.where id between 200 and 300�� gibi bir sorguda �leaf� ler �zerinde gezilerek aral�k (range) bilgisine ula��l�r.B Tree indeks yap�s�nda tekil(unique) olmayan bir indeks de�eri yoktur.

--NOT : indeks tekil (unique) bir indeks ise tekillik sa�lamak sorun olmaz ama e�er indeks tekil de�ilse bu tekillik Oracle taraf�ndan indeks de�eri yan�na rowid bilgisi eklenerek sa�lan�r.Tekil durumunda indekse gore bir s�ra olu�turulur, tekil de�il ise bu s�ralama 2 de�ere g�re birden yap�l�r.

--K�saca indeksler bu �ekilde.Ama bunun yan�nda �index-Unique Scan, Index-Range Scan, Index-Skip Scan, Index-Full ScanIndex-Fast Full  Scan , Index Join, Index Rebuild� konular�na bakman�z� tavsiye ederim.
 

--1 ) Indeksler view�larda kullan�labilir mi? Bu sorunun cevab� asl�nda �okta zor de�il.View , bir sorgu c�mleci�inden ibarettir.Tablonuzda indeks olu�turduysan�z ve view olu�tururken kulland���n�z sorguda indeksi kullanmas�n� sa�lad�ysan�z view indeks kullan�r aksi halde kullanamaz.

--2) Indeksler ve NULL : Bitmap indeksler ile clustered indexler hari� B*Tree yap�s�ndaki indeksler NULL bar�nd�rmazlar.Bunu ��yle ispat etmek m�mk�n :
Drop table t2;
create table t2 (x int, str varchar2(15));
create unique index idx_t2 on t2(x);

declare
begin
             insert into t2 values(1,'bir');
             insert into t2 values(2,'iki');
             insert into t2 values(3,'uc');
             insert into t2 values(null,'bos');
             commit;
end;               

--

--
declare
sqlStr varchar2(500);
begin
             sqlStr := 'analyze index idx_t2 validate structure';
             execute immediate sqlStr;
end;    

Set ServerOutPut ON;
Set AutoTrace ON;
select name, lf_rows from index_stats;

EXPLAIN PLAN FOR 
  select name, lf_rows from index_stats;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

--NAME               LF_ROWS
--IDX_T2            3

--G�r�ld��� �zere T2 tablosunun (x) kolonuna unique indeks uygulad�k, 4 sat�r ekledik ama kontrol etti�imizde 4 de�il 3 sat�r�n indeksli oldugunu g�rd�k.(x) kolonu NULL de�eri ald��� i�in indekslenmemi�tir.

--Yine T2 tablosundan �x� kolonu i�in sorgu yapal�m :

select * from t2 where x = 1;     -- sorgusunda �index unique scan� ile 1 satir gelirken

EXPLAIN PLAN FOR 
  select * from t2 where x = 1;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

select * from t2 where x is null; -- sorgusunda �table Access full� ile 1 satir gelmi�tir.Yani indeks olu�turdu�umuz �x� kolonu i�in NULL sorgusu yapt�g�m�zda indeks kullan�lmam��t�r.Bunun sebebi yukar�da da de�indi�imiz indekslerin NULL de�er i�ermemesidir.
EXPLAIN PLAN FOR 
  select * from t2 where x is null;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

--2 ya da daha fazla kolon �zerinde indeks olu�turdugumuz durumlarda da kolonlardan en az birinin NOT NULL olup de�er i�ermesi gerekir ki indeks kullan�labilsin.NOT :  �zellikle unique indeks olu�turmak istedi�imizde �NOT NULL� k�s�t� koymak indeksi verimli kullanmam�z� sa�layacakt�r.Parent tablonun primary key alan�nda yap�lacak bir update ya da parent tablodan bir sat�r�n silinmesi child tabloda bir �table lock� olu�mas�na neden olacakt�r.Bu durumda da child tablo �zerinde hi� bir �ekilde DML i�lemi yap�lmas�na izin verilmeyecektir.Bu da �deadlock� probleminin olu�mas�na davetiye ��kar�r.Indekslenmemi� foreign key�ler a�a��daki durumlarda da probleme yol a�ar :
 

--3) Indeksler ve Foreign key : Foreign key�in indekslenip indekslenmemesi konusu asl�nda tamamen tasar�m�n�z ile ilgilidir.Foreign key indekslenmedi�inde bizleri bekleyen en b�y�k problem belkide �deadlock� olu�mas�d�r.Peki bu nas�l olur?Bunu anlamak i�in �nce �u bilgileri tekrar edelim :�child table� foreign key bar�nd�ran tablodur, �parent table� ise  foreign key�in g�sterdi�i alan�n bulundugu tablodur.

 

--i) Child tablo da �ON DELETE CASCADE� �zelli�i olsun ve foreign key�de indeks bulunmas�n.Bu durumda parent tabloda bir verinin silinmesi durumunda child tabloda bir �full table scan� yap�lmas�na sebeb olunur.

--ii) Parent tablodan child tabloya dogru olan sorgularda.EMP / DEPT �rne�i verilebilir.EMP child table, DEPT ise parent tablodur ve �rnegin depname = �XXX� olan �al��anlar� getir gibi bir sorguda s�k�nt� ya�ayabilirsiniz :
     
     Select * from emp, dept
     where emp.deptno = dept.deptno
     and dept.depname = 'XXX'; -- Peki tersi durumlar, yani foreign key de�erinin indekslenmesine gerek olmayan durumlar neler olabilir ? :
    -- a) Parent tablodan bir veri silinmeyece�inde
    -- b) Parent tablonun primary/unique key de�eri update edilmeyece�inde
    -- c) Parent tablo ile child tablo foreign key de�eri �zerinden sorgulanmayaca��nda.Bu �artlarda foreign key indeklemeye gerek yoktur bu sayede DML i�lemlerimizde gereksiz yere indekslenmeden dolay� bir yava�lamaya sebeb olmayacakt�r.


-- *******************************************************************************
