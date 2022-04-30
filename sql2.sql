-- Sql server Pivot and Unpivot
 create table product29 (
 customer varchar(max),
 product varchar(max),
 QTY INT
 )

 INSERT INTO product29 values ('Blue','Orange',5)
 
 INSERT INTO product29 values ('Blue','Apple',4)
 
 INSERT INTO product29 values ('Hum','Apple',3)
 
 INSERT INTO product29 values('Hum','Grape',12)
 
 INSERT INTO product29 values('Jecinta','Grape',24)
 
 INSERT INTO product29 values('Mary','Orange',12)
 
 INSERT INTO product29 values ('Janet','Banana',4)

 select * from product29

 select  * 
 into productPivot
 from product29
 pivot 
 (
 sum (QTY)
 for product in(Orange,Apple,Grape,Banana)
 )  as hum 

 select* from productPivot

 -- To UNPIVOT 
 select customer,product, QTY  from productPivot
 unpivot
 (
QTY
for product in (Orange,Apple,Grape,Banana)
 ) as hum

 CREATE TABLE tbl_stock(item NVARCHAR(10), weekday NVARCHAR(10), price INT);
INSERT INTO tbl_stock VALUES
('Item1', 'Mon', 110), ('Item2', 'Mon', 230), ('Item3', 'Mon', 150),
('Item1', 'Tue', 115), ('Item2', 'Tue', 231), ('Item3', 'Tue', 162),
('Item1', 'Wed', 110), ('Item2', 'Wed', 240), ('Item3', 'Wed', 162),
('Item1', 'Thu', 109), ('Item2', 'Thu', 228), ('Item3', 'Thu', 145),
('Item1', 'Fri', 120), ('Item2', 'Fri', 210), ('Item3', 'Fri', 125),
('Item1', 'Mon', 122), ('Item2', 'Mon', 225), ('Item3', 'Mon', 140),
('Item1', 'Tue', 110), ('Item2', 'Tue', 235), ('Item3', 'Tue', 154),
('Item1', 'Wed', 125), ('Item2', 'Wed', 220), ('Item3', 'Wed', 142);

select* from tbl_stock

select *
into Pivot3
from tbl_stock pivot
(
avg(price) for weekday in ([Mon],[Tue],[Wed],[Thur],[Fri])
) as x
select * from Pivot3


insert into Pivot2 values ((Mon+Tue+Wed+Thur+Fri)/5) where Avegage=null
alter table Pivot2 drop column Average

select* from Pivot3
(
AVG (item) for item1 in ([Average])
) as pvrt;


--DATABASE ENCRYPTION
create database Hum


use Hum
go 
backup database [Hum] to disk =N'C:\Backup2\Hum'
select* from tbl_stock
-- Create a master key
use Hum;
GO
create master key encryption by password = 'Hum@njeri400.';
go

--create certificate 
create certificate tbl_stoc with subject ='Item prices on different days'
go

-- Create encryption key,Encrypted by server certificate

use Hum;
go
create database encryption key
with ALGORITHM =aes_128
encryption by server certificate tbl_stock;
go

-- Backup Certificate
use master
GO
backup certificate tbl_stock
to file ='C:\Backup2\tbl_stock.cer'
with private key (file='C:\Backup2\tbl_stock_key.pvk',encryption by password='Hum@njeri400.')
go

-- Enable encryption
alter database Hum
set encryption on
go

---Verify Certificate Details
use master
go
select* from sys.certificates where pvt_key_encryption_type <> 'NA'
go

--Verify encryption key details
use master
go 
select encryptor_type,key_length,key_algorithm,encryption_state,create_date 
from sys.dm_database_encryption_keys
go


select * from tbl_stock


-- ALWAYS ENCRYPTED
--What is always encrypted..This is a feature to protect sensitive data,allowing client application to manage the encryption and encryption keys making sure thst only client application can decrypt and see
--It happens at the client site i.e no one unless the person who encrypted can access the data
/** Two types of key we shall mostly use 
1. column master key(CMK)-Used for encrypting CEK
2. Column encryption key(CEK)-used for securing our data
That means if one has CMK ine can encryot and decrypt data
Types of encryption include i)deterministic and ii) Randomised
In deterministic column can be ised for derching and grouping
in Randomised column cannot be used for searching

NB: To make sure that no one get acces to your CMK,it is always eremoved from the crient database and transferred to the client machine
*/
-- collate is used for always encrypted
create database hum
use hum
create table Message1 (
MessageId int identity (1,1) primary key,
MessageCode char(5) collate latin1_General_BIN2 not null,
Message Varchar (4000) collate latin1_General_BIN2 not null,
);
insert into Message1 (MessageCode,Message)
values ('AA56B','This is a test message')

select * from Message1








