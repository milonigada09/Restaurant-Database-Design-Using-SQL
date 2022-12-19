use avengers7;

## Business Question: Which employee was tipped the most to be considered for employee of the day? **Ask for dates? Ask Monisha

select employee.employee_id, concat(employee.first_name,' ',employee.last_name) as Employee_Name,bill.tip
from employee left join bill on employee.employee_id = bill.employee_id
order by tip desc;


## Business Question: What is the most popular item bought at the restaurant? 

select menu.menu_item_name,sum(line_item.quantity) as total_sold, menu.price as Price_Per_Item, sum(line_item.quantity)*menu.price as Revenue
from line_item
inner join menu
on menu.menu_item_id = line_item.menu_item_id
group by line_item.menu_item_id
order by total_sold desc;

select * from line_item;
select * from menu;

##Miloni

DELIMITER $$
CREATE FUNCTION total_footcount (specific_date DATETIME) RETURNS int 
BEGIN
    select customer_id, substring(transaction_date,1,10) as t_date, count(*) as foot_count from bill
    where t_date = specific_date
    group by t_date
    ORDER BY COUNT(*) DESC;
END$$


#(Procedure)
## Who are the top 3 customers who paid the most?

SELECT CUSTOMER.CUSTOMER_ID,CONCAT(CUSTOMER.FIRST_NAME , ' ' , CUSTOMER.LAST_NAME) AS CUSTOMER_NAME,
BILL.GROSS_TOTAL
FROM CUSTOMER
JOIN BILL
ON CUSTOMER.CUSTOMER_ID = BILL.CUSTOMER_ID
ORDER BY GROSS_TOTAL DESC
#LIMIT 5;

drop procedure GetPrice


DELIMITER $$
CREATE PROCEDURE GetPrice(top_price VARCHAR(10) )
BEGIN

IF (top_price  = 'TOP3') THEN
SELECT CUSTOMER.CUSTOMER_ID,CONCAT(CUSTOMER.FIRST_NAME , ' ' , CUSTOMER.LAST_NAME) AS CUSTOMER_NAME,
BILL.GROSS_TOTAL
FROM CUSTOMER
JOIN BILL
ON CUSTOMER.CUSTOMER_ID = BILL.CUSTOMER_ID
ORDER BY GROSS_TOTAL DESC
LIMIT 3;

 ELSEIF ( top_price = 'TOP5') THEN
SELECT CUSTOMER.CUSTOMER_ID,CONCAT(CUSTOMER.FIRST_NAME , ' ' , CUSTOMER.LAST_NAME) AS CUSTOMER_NAME,
BILL.GROSS_TOTAL
FROM CUSTOMER
JOIN BILL
ON CUSTOMER.CUSTOMER_ID = BILL.CUSTOMER_ID
ORDER BY GROSS_TOTAL DESC
LIMIT 5;

ELSE
  SELECT CUSTOMER.CUSTOMER_ID,CONCAT(CUSTOMER.FIRST_NAME , ' ' , CUSTOMER.LAST_NAME) AS CUSTOMER_NAME,
BILL.GROSS_TOTAL
FROM CUSTOMER
JOIN BILL
ON CUSTOMER.CUSTOMER_ID = BILL.CUSTOMER_ID
group by customer_id desc;


END IF;
 END $$
 DELIMITER ;
  
CALL GetPrice('ALL');

CALL GetPrice('TOP3');

CALL GetPrice('TOP5');


## What is the average tip given by customers

SELECT AVG(TIP) AS AVERAGE_TIP FROM  BILL;

SELECT * FROM BILL;

## What is the PERCENT OF tip given by customers

SELECT SUM(TIP) AS SUM_TIP  FROM  BILL;
SELECT COUNT(TIP) AS SUM_TIP  FROM  BILL;
SELECT (SUM(TIP)/COUNT(TIP))* 100 AS PERCENT FROM BILL;

## 
create view v_WagyuCustomers2 as
select line_item.menu_item_id, bill.bill_id, customer.customer_id, first_name, last_name
from bill, customer, line_item
where customer.customer_id = bill.customer_id
and bill.bill_id = line_item.bill_id
and line_item.menu_item_id = 1;


select * from v_WagyuCustomers2;

create view v_WagyuCustomers4 as
select distinct customer.customer_id, first_name, last_name, menu_item_name
from customer, menu, line_item, bill
where customer.customer_id = bill.customer_id
and bill.bill_id = line_item.bill_id
and menu.menu_item_id = line_item.menu_item_id
and menu.menu_item_id = 1;

select * from v_WagyuCustomers4;
 
