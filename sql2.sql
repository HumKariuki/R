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
