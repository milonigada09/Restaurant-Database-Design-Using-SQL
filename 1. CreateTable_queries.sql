CREATE DATABASE Avengers7;
USE Avengers7;

#1_customer table
CREATE TABLE customer (
    customer_id INT NOT NULL auto_increment,
    first_name VARCHAR(45),
    last_name  VARCHAR(45),
    dob DATE,
    email VARCHAR(45),
    phone VARCHAR (12),
    address VARCHAR (225),
    PRIMARY KEY (customer_id)
); 

#2_employee_type table
    CREATE TABLE employee_type(
    employee_type_id INT NOT NULL auto_increment,
    employee_type_name VARCHAR(45),
    PRIMARY KEY (employee_type_id)
    );


#3_employee table
    CREATE TABLE employee (
    employee_id INT  NOT NULL auto_increment,
	employee_type_id INT,
    first_name VARCHAR(45),
    last_name  VARCHAR(45),
	address VARCHAR ( 225),
    email VARCHAR(45),
	phone VARCHAR (12),
	manager_id INT NULL ,
	PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_type_id) REFERENCES employee_type(employee_type_id),
    FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
    );

#4_menu table
    CREATE TABLE menu(
    menu_item_id int NOT NULL auto_increment,
    menu_item_name varchar(90),
    price decimal(6,2),
    PRIMARY KEY (menu_item_id)
);

#5_bill table
    CREATE TABLE bill(
    bill_id INT NOT NULL auto_increment,
    tax Decimal(6,2) as (bill_total*9.25/100),
    tip DECIMAL(6,2),
    bill_total DECIMAL(6,2) ,
	#gross_total DECIMAL(6,2) as (bill_total+tip+tax),
    customer_id INT,
    employee_id  INT ,
    transaction_date DATETIME,
    PRIMARY KEY (bill_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_ID),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
    );
    
#6A_line_item table
    CREATE TABLE line_item( 	
    line_item_id INT NOT NULL auto_increment,
    bill_id INT,
    menu_item_id  INT ,
    quantity INT(5) ,
    FOREIGN KEY (bill_id) REFERENCES bill(bill_id),
    FOREIGN KEY (menu_item_id) REFERENCES menu(menu_item_id),
    PRIMARY KEY (line_item_id)
    );
    
#6B - insert trigger - when new line item is added to line item table we update the bill table with bill total)
     delimiter $
     CREATE TRIGGER new_line_item_added after insert on line_item
     for each row 
     begin 
     
     declare unit_price DECIMAL(6,2)  ;
     select price into unit_price from menu where menu_item_id= new.menu_item_id ; 
     #update bill set bill_total=new.quantity  where bill.bill_id =new.bill_id ;
     update bill set bill_total = ifnull(bill_total,0)+(unit_price*new.quantity) where bill.bill_id =new.bill_id ;
     end $
     
     #drop trigger new_line_item_added;
	
#6C -update trigger -when the existing line item is updated in line item table we update the bill table with bill total
     delimiter $
     CREATE TRIGGER new_line_item_updated after update on line_item
     for each row 
     begin 
     
     declare old_unit_price DECIMAL(6,2);
     declare new_unit_price DECIMAL(6,2);
	 select price into old_unit_price from menu where menu_item_id= old.menu_item_id ; 
     select price into new_unit_price from menu where menu_item_id= new.menu_item_id ; 
	 update bill set bill_total =ifnull(bill_total,0)-(old_unit_price*old.quantity) where old.bill_id = bill.bill_id ;
     update bill set bill_total =ifnull(bill_total,0)+(new_unit_price*new.quantity) where new.bill_id = bill.bill_id ;
     
     end $
     
     #drop trigger new_line_item_updated
     
 #6D - delete trigger - if a line item is deleted , we have to reduce the bill item using the below trigger    
     
     delimiter $
     CREATE TRIGGER existing_line_item_deleted after delete on line_item
     for each row 
     begin 
     
     declare old_unit_price DECIMAL(6,2);
     declare new_unit_price DECIMAL(6,2);
	 select price into old_unit_price from menu where menu_item_id= old.menu_item_id ; 
	 update bill set bill_total =ifnull(bill_total,0)-(old_unit_price*old.quantity) where old.bill_id = bill.bill_id ;
     
     end $
     
     #drop trigger existing_line_item_deleted
     
#7_payment_type table
    CREATE TABLE payment_type(
    payment_type_id INT NOT NULL auto_increment,
    payment_mode VARCHAR(45),
    PRIMARY KEY (payment_type_id)
    );
    
#8_payment table
    CREATE TABLE payment(
    #payment_id INT NOT NULL auto_increment,
    bill_id INT,
    payment_type_id INT,
    payment_status varchar (45),
    PRIMARY KEY (bill_id),
    FOREIGN KEY (bill_id) REFERENCES bill(bill_id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_type(payment_type_id)
    );

#9 Alter table for add gross table 
	alter table bill
	add column gross_total decimal(6,2) as (ifnull(bill_total,0)+ifnull(tax,0)+ifnull(tip,0));


