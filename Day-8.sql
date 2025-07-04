use ecommercedb;
-- all customers 
delimiter // 
create procedure total_customers ()
begin 
select * from customers ;
end //
delimiter ;

call total_customers;

-- insert new customer
delimiter //
create procedure `insert_customer` (in cid int, in cname varchar(100), in cmail varchar(100), in cadd text)
begin
insert into customers (customerid, fullname, email, address, registered) values (cid,cname,cmail,cadd,now());
end//
delimiter ;

call insert_customer (7,'yash', 'yash@gmail.com', 'vempalli');

-- total orders
delimiter // 
create procedure total_orders_by_customers ( in cid int, out total_orders int)
begin 
select count(*) into total_orders from orders where customerid = cid;
end // 
delimiter ;

call total_orders_by_customers (5,@total_orders);

select @total_orders;

delimiter //
create procedure get_customer_summary(in cid int,out cname varchar(100),out total_orders int)
begin
    -- Get the customer name
select fullname into cname from customers where customerid = cid;

    -- Get the order count
    select COUNT(*) into total_orders from orders where customerid = cid;
end //
delimiter ;

call get_customer_summary(5, @name, @count);

select @name as customer_name, @count as order_count;

-- for deleting a particular procedure 
drop procedure if exists total_orders_by_customers;


-- total orders per customer
delimiter //
create function get_order_count(cid int)
returns int
deterministic 
begin
    declare total int;
    select count(*) into total from orders
    where customerid = cid;

    return total;
end //

delimiter ;

select get_order_count(4) as total_orders;

select fullname from customers where get_order_count(customerid) > 1;




