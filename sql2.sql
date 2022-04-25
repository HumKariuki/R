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

use master 
go 
backup database [Students] to disk =N'C:\Backup2\Students.bak'

-- Create a master key
use Students;
GO
create master key encryption by password = 'Hum@njeri400.';
go

--create certificate 
create certificate Students_info with subject ='Students info certificate'
go

-- Create encryption key,Encrypted by server certificate

use Students;
go
create database encryption key
with ALGORITHM =aes_128
encryption by server certificate Students_info;
go
