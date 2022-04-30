/** SQL server encryption
AGENDA
1.Encryption Hierachy
2. Keys
  i)Symetric Keys
  ii)Asymetric Keys
  iii) Database Encryption Key
3.Certificates
4.TDE
5.Encrypted backups
6.Call Encryption 

Encryption Hierachy
1)There is  an API code in the windows os  once you install the sql server
Windows os level data protection API
2)Master key used in the sql server
3)Master database
4)Certificate-It has a public and a private key
5)Database ecnryption key-it is created in the user database

*/
use master 
go 
create database [TESTIDE] on primary
( 
NAME=N'TESTIDE',
FILENAME=N'C:\Backup2\TESTIDE.mdf',
SIZE=10240KB,
FILEGROWTH=10240KB
)
log ON
(
NAME=N'TESTIDE_log',
FILENAME=N'C:\Backup2\TESTIDE_log.ldf',
SIZE=10240KB,
FILEGROWTH=10240KB
)
GO

USE TESTIDE
GO
CREATE TABLE dbo.TestTable(
Field1 int,
Field2 VArchar(25),
Field3 decimal(18,2),
)
go
insert into dbo.TestTable values (1,'1 Value',18.20),(2,'2 Value',19.2),(3,'3 Value',20.2),(4,'4 Value',21.2)
go

select * from dbo.TestTable
go


-- Step 1 is to backup the database
