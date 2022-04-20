--DML include insert,delete,update and select-
-- Example-
create table HelloWorld2 (
id int identity ,
hum varchar (1000)
)



--DML operation insert for inserting a row into a table--
 insert into HelloWorld2  (hum)values ('Hello world')

 -- DML opetation select for displaying tables--
select * from HelloWorld2

--Select a specific column from the table
select hum from HelloWorld2

-- Display number of records in the table
select count(*) from HelloWorld2

/* DML operation update ,for updating a specific row in the table */
update HelloWorld2 set hum= 'Heloo,World!' where id=1
select * from HelloWorld2
update HelloWorld2 set id=2 where hum='heloo,World!' -- This will bring an error cause it is not possible to update isentity columnn

-- DML operstion DELETE, deleting a row in the table
delete from HelloWorld2 where id=1
select * from HelloWorld2

select top 10 * from Northwind.dbo.Customers

--If the database contains columns with reserved words eg date , you need to enclose the column name with brackets
 -- descending order
 select top 10 [Date] from dbo.MyLogTable
 order by [Date] desc

 select top 5 Northwind.dbo.Customers


 create table MyUniqueNamesTypes(
 FirstName Varchar (100),
 LastName Varchar (10),
 CreateDate datetime default getdate(),
 primary  key (FirstName,LastName)
 )
 select * from MyUniqueNamesTypes

 insert into MyUniqueNamesTypes values ('Humphrey','Kungu',1)


 select *from sys.objects
 -- Basic select fom the table
 select object_id,name,type,create_date from sys.objects

 -- Filter rows using WHERE clause
 select *from sys.objects Where type= 'IT'

--Sort results using order by
select *from sys.objects order by create_date

-- Group results using group by
select type,count(*) as c from sys.objects group by type

--Filter groups using having clause..Having clause removes group that do not satisfy the condition
select type,count (*) as c from sys.objects group by type having count(*)<10


-- Returning only first N rows
select top 10 * from sys.objects


-- Panigation using OFFSET FETCH
--OFFSET FETCH clause is more advanced version of TOP.It enables you to skip N1 rows and takes next N2 rows

select * from sys.objects order by object_id offset 50 rows fetch next 10 rows only

-- you can use offset without fetch to just skip maybe the first 50 rows
select * from sys.objects order by object_id offset 50 rows


--SELECT without FROM(No data source)
--select statement can be executed without from cause 
declare @var int = 17;
SELECT @var as c1, @var + 2 as c2, 'third' as c3

declare @var varchar(50) ='hum';
select @var as kariuki,'ken' as muhoro




-- Using transactions to change data safely
use master
create table trans (
col_1 varchar (10),
col_2 varchar (20)
)
insert into dbo.trans (col_1) values ('a')
select * from trans

begin transaction -- This is the beginning of the transaction
update dbo.trans
set col_1='B' 
output inserted.* where col_1='A'

rollback transaction

--- DATA TYPES
--1.Extract Numeric Dibided into two that is integer data types and fixed precision and scale

-- Integer Data Types includes bit,tinyint,smallint bigint
--Fixed Precision and scale data types inludes numeric ,decimal,smalllmoney and money

--2 Character strings include char, varchar and text
--3 Unicode character srings includes nchar,nvarchar,ntext
--3 Binary strings includes binary varbinary and image

--Other data types includes curor,timestamp,hierarchyid,uniqueidentifier,sql_variant,xml,table and spacial types


-- CONVERTING DATA TYPES

--1 TRY PARSE-It converts strings data types to target data type(date or numeric)

CREATE FUNCTION [dbo].[Calc_Age]
(
@DOB datetime , @calcDate datetime
)
RETURNS int
AS
BEGIN
declare @age int
IF (@calcDate < @DOB )
RETURN -1
-- If a DOB is supplied after the comparison date, then return -1
SELECT @age = YEAR(@calcDate) - YEAR(@DOB) +
CASE WHEN DATEADD(year,YEAR(@calcDate) - YEAR(@DOB)
,@DOB) > @calcDate THEN -1 ELSE 0 END

CREATE DATABASE MyDatabase_morning -- name of the snapshot
ON (
NAME=MyDatabase_data, -- logical name of the data file of the source database
FILENAME='C:\SnapShots\MySnapshot_Data.ss' -- snapshot file;
)
AS SNAPSHOT OF MyDatabase; -- name of source database

CREATE TABLE JsonTable
(
id int identity primary key,
jsonInfo nvarchar(max),
CONSTRAINT [Content should be formatted as JSON]
CHECK (ISJSON(jsonInfo)>0)

select *from JsonTable
)
INSERT INTO JsonTable
VALUES(N'{"Name":"John","Age":23}'),
(N'{"Name":"Jane","Age":31}'),
(N'{"Name":"Bob","Age":37}'),
(N'{"Name":"Adam","Age":65}')

SELECT *
FROM JsonTable Where
JSON_VALUE(jsonInfo, '$.Name') = 'Adam'

-- To finish on the json later


-- ALIAS NAMES IN SQL SERVER
--1 Using As
create table AliasNameDemo (id int,firsName varchar (max),lastName varchar(max))

insert into AliasNameDemo values (1,'Humphrey','Kariuki')
select *from AliasNameDemo
--There is a typing error in the column name firstName to correct it we need to change it as follows
--U just go to object explorer

--Using = as the as the alias name
select FullName=FirstName+' '+ LastName from AliasNameDemo
select FirstName + ' '+ LastName from AliasNameDemo

--The two commands above return the same value




---NULLS

insert into AliasNameDemo values (4,'Jecinta','Kariuki')

insert into AliasNameDemo values (NULL,'Janet','Wanjiku')

insert into AliasNameDemo values (8,'Francis','Kariuki')

insert into AliasNameDemo values (NULL,'Rebecca','Kariuki')

insert into AliasNameDemo values (6,'Reuben','Kariuki')

insert into AliasNameDemo values (55,'Joseph','Kariuki')

insert into AliasNameDemo values (null,'Ken','Kariuki')


select*from AliasNameDemo
select FirstName from AliasNameDemo where ID=null

CREATE TABLE nulldemo ( id int,FirstName varchar(20),lastName varchar(20))

insert into nulldemo values (8,'Francis','Kariuki')

insert into nulldemo values (NULL,'Rebecca','Kariuki')

insert into nulldemo values (6,'Reuben','Kariuki')

insert into nulldemo values (55,'Joseph','Kariuki')

insert into nulldemo values (null,'Ken','Kariuki')

select * from nulldemo

select FirstName from nulldemo where id=null -- This one will produce no result
-- however when you use set ansi_nulls off eg
set ansi_nulls off
select fullName= FirstName+' '+LastName from nulldemo where ID=null


select * from nulldemo
 however when you use set ansi_nulls off eg
set ansi_nulls off
select* from nulldemo where ID=null


--IF...ELSE STATEMENTS
--Single if ststements
if (2=2)
begin
print 'I Love You'
end

-- Multiple If Statements
if (1=1) begin print 'First If is True' end
if (1=2) begin print 'Second If is True' end 
if(3=3) begin print 'Third If is True' end


--- Single If...Else stataments
if (1=1) begin print 'One is Equal to one' end else begin print 'First Expression was not true' end



declare @temp table(age int, name varchar(15))
insert into @temp
select 18, 'matt' union all
select 21, 'matt' union all
select 21, 'matt' union all
select 18, 'luke' union all
select 18, 'luke' union all
select 21, 'luke' union all
select 18, 'luke' union all
select 21, 'luke'
select * from @temp21

SELECT Age, Name, count(1) count
*FROM @temp
GROUP BY Age, Name

create table jecinta3 (
id int,
FirstName varchar (max),
LastName varchar (max),
DateRegistered date())

select *from jecinta
insert into jecinta values (1,'Mary','Wanjeri',GETDATE())
insert into jecinta values (2,'Lucy','Wanjiru',SYSDATETIME())
insert into jecinta values (3,'Mercy','Wangari',getdate())
insert into jecinta values (4,'Beatrice','Mso',select sysdatetime() as DateRegistered)
select sysdatetime() as humphrey

select * from jecinta order by DateRegisterded asc
select FullName= FirstName+' '+ LastName from jecinta where id=3
select * from jecinta where id=3

insert into jecinta values (1,'Humphrey','Kariuki',getdate(),10:20)
timestamp default current_timestamp on
alter table jecinta drop column TimeAdded --This command ids for deleting a coulumn fro the table
alter table jecinta add  TimeAdded time -- This command is for adding a column in a table


insert into jecinta values (5,'Mary','Wambui',getdate(), current_timestamp)
alter table jecinta add current_timestamp where TimeAdded=NULL
alter table jecinta column id=primary key
update jecinta set TimeAdded=CURRENT_TIMESTAMP where id=2

select * from jecinta

update jecinta set LastName='Kariuki' WHERE id=3
update jecinta set TimeAdded=CURRENT_TIMESTAMP where id=3
update jecinta set id=4 where FirstName='Mary'
update jecinta set id=5 where TimeAdded=




SELECT CustomerId,
SUM(TotalCost) OVER(PARTITION BY CustomerId) AS Total,
AVG(TotalCost) OVER(PARTITION BY CustomerId) AS Avg,
COUNT(TotalCost) OVER(PARTITION BY CustomerId) AS Count,
MIN(TotalCost) OVER(PARTITION BY CustomerId) AS Min,
MAX(TotalCost) OVER(PARTITION BY CustomerId) AS Max
FROM CarsTable
WHERE Status = 'READY'



--Cast and convert function
--CAST() the cast function converts data from one data type to another eg from numeric data type to caharacter or string
--This transformation only channge in the query
--CONVERT()  this also converts expressions from one data type to another data type ..it is also temporaly
--CAST AND CONVERT DIFFERENCES
--Cast is part of asi-sql while convert is not ie you can used cast in any database eg oracle mysql etc
--Convert is a sql implementation specific ie it is in sql server and some other databases
--Examples

select '07/26/199' as 'The Date'; --This is a string and its not a date nor a number because of the quotes
select cast ('07/26/2019' as datetime) as 'The Date'; --This changes the data type to date from string

select cast('1250.00' as decimal (10,2))as 'A Number'--Here we are changing the string 1250.00 to be a decimal 10,2 means 10 on the left 2 on the right

select cast(cast('6/8/1992' as datetime) -cast ('10/3/1989' as DAtetime) as int); --It will count the number of days between 1992 and 1989

select DateRegisterded as 'OurDate' from jecinta;

select cast(DateRegisterded as varchar(100)) as 'OurDate' from jecinta;