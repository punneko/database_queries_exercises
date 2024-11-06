-- Q1
create table AGENTS(agent_code char(6) primary key not null, agent_name char(40),working_area char(35),
					commission decimal(10,2), phone_no char(15), country varchar(25));
-- Q2
create table CUSTOMERS(cust_code varchar(6)primary key not null, cust_name varchar(40) not null, cust_city varchar(35),
						working_area varchar(35) not null,cus_contry varchar(20) not null, grade int, opening_AMT decimal(12,2) not null, receive_AMT decimal(12,2) not null,
                        payment_AMT decimal(12,2) not null, outstanding_AMT decimal(12,2) not null,
                        phone_no varchar(17) not null, 
                        agent_code char(6) not null,
						constraint customers_ibfk_1 FOREIGN KEY (agent_code) REFERENCES AGENTS(agent_code)
                        );
-- Q3
create table ORDERS(ord_num int primary key not null, ord_amount decimal(12,2), advance_amount decimal(12,2),
ord_date date not null, cust_code varchar(6) not null, constraint orders_ibfk_1 foreign key(cust_code) references CUSTOMERS(cust_code),
agent_code char(6) not null,constraint orders_ibfk_2 foreign key(agent_code) references AGENTS(agent_code), ord_description varchar(60)not null);
-- Q4
desc AGENTS;
-- Q5
desc CUSTOMERS;
-- Q6
desc ORDERS;
-- Q7
insert into agents (agent_code, agent_name, working_area, commission, phone_no) values('A007','Ramasundar','Bangalore', 0.15,'077-25814763'), ('A003','Alex','London', 0.13,'075-12458969'),('A008','Alford','New York', 0.12,'044-25874365'),
('A010','Santakumar','Chennai', 0.14,'007-22388644'), ('A005','Anderson','Brisban', 0.13,'045-21447739'),
('A001','Subbarao','Bangalore', 0.14,'077-12346674'), ('A002','Mukesh','Mumbai', 0.11,'029,12358964'),
('A006','McDen','London', 0.15,'078-22255588'), ('A004','Ivan','Torento', 0.15,'008-22544166'),
('A009','Benjamin','Hampshire', 0.11,'008-22536178');
pass;
pass;
pass;
pass;
pass;
pass;
pass;
pass;
pass;
-- Q6
select agent_code as agent_id, agent_name from agents order by agent_code desc;
-- Q7
select working_area, count(agent_name) as agent_count from agents group by working_area;
-- Q8
select agent_code, agent_name from agents where (agent_name like 'A%') or (agent_name like 'M%');
-- Q9
pass; 
-- Q10
select * from agents where (phone_no like '077%') or (phone_no like '008%');
-- Q11
insert into customers values('C00013','Holems','London','London','UK',2,6000.00,5000.00,7000.00,4000.00,'BBBBBBBB', 'A003'),
 ('C00001','Micheal','New york','New york','USA',2,3000.00,5000.00,2000.00,6000.00,'CCCCCCCC', 'A008'),
  ('C00020','Albert','New york','New york','USA',3,5000.00,7000.00,6000.00,6000.00,'BBBBSBBB', 'A008'),
    ('C00024','Cook','London','London','UK',2,4000.00,9000.00,7000.00,6000.00,'FSDDSDF', 'A006'),
    ('C00015','Stuart','London','London','UK',1,6000.00,8000.00,3000.00,11000.00,'GFSGERS', 'A003'),
    ('C00002','Bolt','New York','New York','USA',3,5000.00,7000.00,9000.00,3000.00,'DDNRDRH', 'A008');
    pass;
    pass;
    pass;
    pass;
    pass;
-- Q12
select cust_code, cust_name, cust_city from customers where agent_code ='A008';
-- Q13
pass;
-- Q14
select count(cust_name) as cust_count ,cust_city from customers group by cust_city;
-- Q15
select * from customers order by cust_code asc;
-- Q16
select cust_name from customers where (grade > 1) and (opening_amt > 3000) and (receive_amt <9000) and (payment_amt > 3000);
-- Q17
 alter table agents 
 drop country;
 -- Q18
  alter table agents 
 drop working_area;
 -- Q19
  drop table orders;
  -- Q20
  drop database ExamMid;
