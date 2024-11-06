-- Q1 แสดงชื่อของลูกคาและคําสั่งซื้อที่มีจํานวนเงินสูงสุด (highest_order_amount) ของลูกคาแตละราย
select customer_name, max(amount) as highest_order_amount 
from customers c
join  orders o on c.customer_id = o.customer_id 
join payments p on o.order_id = p.order_id 
group by c.customer_id;
-- Q2 แสดงขอมูลวิธีการชําระเงินและจํานวนเงินรวม (sum_amount) ของแตละวิธีการชําระเงินจากตาราง “Payments” โดยที่จํานวนเงินรวมนอยกวา $200
select payment_method, sum(amount) as sum_amount from payments group by payment_method having sum_amount < 200;
-- Q3 แสดงรายการสินคาทั้งหมดพรอมกับปริมาณรวมที่ขายได(total_quantity_sold)
select product_name, sum(quantity) as total_quantity_sold 
from products p 
join order_details o on p.product_id = o.product_id 
group by p.product_name;
-- Q4 แสดงขอมูลวิธีการชําระเงินและคํานวณเปอรเซ็นตของยอดขายรวมสําหรับแตละวิธีการชําระเงิน (percentage_of_total_sales)
select payment_method,  (sum(amount)/1145.46)*100 as percentage_of_total_sales from payments group by payment_method ;
-- Q5 คํานวณรายไดรวม (total_revenue) โดยการคูณปริมาณ “quantity” และราคาตอชิ้น “unit_price”
select sum(quantity * unit_price) as total_revenue 
from order_details o  
join products p on o.product_id = p.product_id ;
-- Extra แสดงรหัสประจําตัวลูกคาและชื่อลูกคาของ 5 อันดับแรกที่มียอดสั่งซื้อรวมสูงสุด (total_order_amount)
select customer_id, customer_name, sum(order_count) as  total_order_amount from customers group by customer_id order by order_count desc limit 5;
