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
Backup database TESTIDE to disk='C:\Backup2\TESTIDE_unenc.bak' with init,compression

-- Step 2 is to create  the DB MASTER KEY for use in TDE the master key you have to create it in the master database  because it has to exist there

use master;
go
create master key
encryption by password ='INSTANCE1_Use1Strong2Password3Here'
go

select 
name,key_length,algorithm_desc,create_date,modify_date
from sys.symmetric_keys

-- Step 3 is to create the certificate still in the master database

create certificate MyserveCert
with subject = 'My DEK Certificate'
go
-- My server certificate is encrypted by the master key
--step 4 Is to create  my database encryption key
-- whenever you see the word server like in below it means its going to look in master
USE TESTIDE
go
create database encryption key
with algorithm=AES_128
ENCRYPTION BY SERVER CERTIFICATE MyServeCert
go

--Step 5 is to backup the certificate

use master
go
backup certificate MyServeCert
to file ='C:\Backup2\MyServeCert.cer'
with private key(file ='C:\Backup2\MyServeCert.pvk',
Encryption by password = 'My1Secure2Password!')
go

