-- Q1 แสดงขอมูลลูกคาที่มาจากเมือง Mora ทั้งหมด
 select * from customers where city = 'Mora';
 
-- Q2 เพิ่มลูกคาใหมที่มีรายละเอียดดังนี้ รหัสประจําตัวลูกคา '07-1137077', ชื่อลูกคา 'Audi', ชื่อประเทศ 'SU-Land',จํานวนการสั่งสินคา 0
 insert into customers(customer_id,customer_name,city,order_count) value('07-1137077','Audi','SU-Land',0);

-- Q3 เปลี่ยนชื่อลูกคาที่มีรหัสประจําตัว ‘71-4595008’ เปน 'Anna'
 update customers set customer_name = 'Anna'where customer_id ='71-4595008';

-- Q4 แสดงคําสั่งซื้อลาสุดสําหรับลูกคาแตละคน โดยมีรายละเอียดดังนี้ customer_id, latest_your_order
  select customer_id, max(order_date) as latest_your_order from orders group by customer_id;
  
-- Q5 แสดงจํานวนคําสั่งซื้อทั้งหมดสําหรับลูกคาแตละคน โดยมีรายละเอียดดังนี้ customer_id, total_orders
select customer_id, count(order_id) as total_orders from orders group by customer_id;

-- Q6 แสดงชื่อผลิตภัณฑและราคาจากตาราง “products” ซึ่งมีราคานอยกวา 20
select product_name, unit_price from Products where unit_price < 20;

-- Q7 แสดงการคํานวณจํานวนคําสั่งซื้อเฉลี่ยตอเมือง โดยมีรายละเอียดดังนี้ ชื่อเมือง, คาเฉลี่ยจํานวนคําสั่งชื่อ ("avg_order_count")
select city, avg(order_count) from customers group by city;

-- Q8 แสดงชื่อผลิตภัณฑและราคาจากตาราง “products” ซึ่งมีราคาตั้งแต 20 ถึง 50
 select product_name,unit_price from Products where unit_price between 20 and 50;
 
-- Q9 แสดงขอมูลลูกคาทั้งหมดที่ชื่อ 'Anna'
select * from customers where customer_name = 'Anna';

-- Q10 แสดงชื่อผลิตภัณฑที่มีวันหมดอายุกอนป 2023
select product_name from Expired_Products where expiration_date <'2022-12-31';