-- Q1 ลบแอตทริบิวตOrder_count
alter table customers drop column order_count;
-- Q2 เปลี่ยนชื่อแอตทริบิวตCustomer_name เปน Cus_name
alter table customers change column customer_name cus_name varchar(50);
-- Q3 แสดงขอมูลของลูกคาทั้งหมดที่ไมไดมีชื่อขึ้นดวย A, B และ C
select * from customers where cus_name not like 'A%' 
and cus_name not like 'B%' and cus_name not like'C%';
-- Q4 แสดงลูกคาที่รหัสประจําตัวมีเลข 1 ในเลขรหัสประจําตัวทั้งหมด
select * from customers where customer_id like '%1%';
-- Q5 แสดงรหัสประจําตัวของลูกค้าที่ซื้อสินคาคนจากคําสั่งซื้อเกาที่สุดไปคําสั่งซื้อลาสุด
select customer_id from orders order by order_date desc;
-- Q6 แสดงรหัสประจําตัวของลูกคาที่มีคําสั่งซื้อลาสุดไปคําสั่งซื้อที่เกาที่สุด
select customer_id from orders order by order_date asc;
-- Q7 เปลี่ยนชนิดขอมูลในแอตทริบิวตOrder_date เปน Varchar(60)
ALTER TABLE orders MODIFY COLUMN Order_date Varchar(60);
-- Q8 แสดงจํานวนผลิตภัณฑในชื่อ count ที่มีวันหมดอายุไปแลว
select count(product_name) as count from Expired_Products where expiration_date < '2024-01-26' ;

