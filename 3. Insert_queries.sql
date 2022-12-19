USE Avengers7;

## 1_INSERT MULTIPLE VALUES INTO TABLE " MENU "
	INSERT INTO menu (menu_item_name, price)
	VALUES 
	("Wagyu Beef",230.00),
	("Big Texan Steak", 72.00),
	("New York Steak", 45.00),
	("Filet Mignon", 49.00),
	("Double-Cut Pork Chop",39.00),
	("Pork Baby Back Ribs", 27.00),
	("Prime Rib",38.00),
	("Salmon", 30.00),
	("Seasonal Vegetable Pasta", 24.00),
	("Rack of Lamb", 47.00),
	("Double Patty Burger", 24.00),
	("Warm Goat Cheese Salad", 13.00),
	("Caesar Salad",12.00),
	("House Salad", 12.00),
	("Steak Tartare", 21.00),
	("Fried Calamari", 15.00),
	("Oysters",15.00),
	("Cold Asparagus", 11.00),
	("Crème Brulee",  11.00),
	("Key Lime Pie", 11.00),
    ("Bougie Champagne",250.00),
    ("Coke",3.00),
    ("House-Made Lemonade",5.00);

select * from menu ;


##2.INSERT MULTIPLE VALUES INTO TABLE PAYMENT_TYPE

	INSERT INTO payment_type(payment_mode)
	VALUES
	("Card"),
	("Cash"),
	("Bitcoin");
	select * from payment_type;

##3.INSERT MULTIPLE VALUES INTO TABLE DESIGNATION
#delete from employee_type;

	insert into employee_type(employee_type_name)
	VALUES
	("Waiter"),
	("Chef"),
	("Receptionist"),
	("Manager"),
	("CEO");

	select * from employee_type;

##4.INSERT MULTIPLE VALUES INTO TABLE CUSTOMER
	insert into customer(first_name,last_name,dob,email,phone,address)
 	values
	( "Miloni", "Gada", "1994-09-08", "milonigada94@gmail.com", "408-456-3424", "Mill Creel Ln, 546 Apt"),
	("Moumi","Kumar" , "1992-01-08" , "moumi.kumar.js@gmail.com","408-345-9876","3455 Monroe St"),
	( "Monisha", "Gopal", "1992-07-02", "monishagopal@gmail.com", "408-226-1224", "Crane Stone Ln, 16 Apt"),
	( "Joyce", "Tse", "1996-01-01", "joycetse@gmail.com", "412-321-3111", "Lome Home Ln, 122 Apt"),
	( "Swetha", "Sarma", "1992-09-08", "swethasarma@gmail.com", "408-322-3627", "Crane Lane Ln, 56 Apt"),
	( "Tony", "Stark", "1975-12-08", "tonystark@gmail.com", "418-666-3124", "Zane Pine Ln, 12 Apt"),
	( "Bruce", "Banner", "1954-09-08", "brucebanner@gmail.com", "422-156-4455", "Mumbai street Ln, 321 Apt"),
	( "Thor", "Odinson", "1920-10-10", "thorodinson@gmail.com", "412-111-5050", "Asgard Galaxy"),
	( "Steve", "Rogers", "1960-12-12", "steverogers@gmail.com", "402-333-1414", "santana Row , 5 Apt"),
	( "Thanos", "Lagos", "1978-03-03", "thanoslagos@gmail.com", "321-309-2110", "La Joya, 21 Apt"),
	( "Ace", "Luis", "2010-12-12", "steverogers@gmail.com", "400-333-1111", "Venice Creek, 2011 Apt"),
	( "Shawn", "Wang", "2017-11-06", "shawnwang@gmail.com", "408-656-2345", "Trimble Dr, 3360Apt"),
	( "Rajesh", "Gopalan" , "2001-07-25", "rajeshgopalan@gmail.com" , "396-333-1010", "Housing Bldg, 9001 Apt"),
	( "Chris", "Arthur", "1992-09-30", "chrisarthur@gmail.com", "669-612-5451", "Mill Creek Ln, 315 Apt"),
	( "Randian", "Orton", "1972-11-22", "randianorton@gmail.com", "408-650-6060", "Hillsborough Dr, 1240 Apt"),
	( "Miss", "T", "2001-11-22", "vth@gmail.com", "408-650-6069", "Oct Dr, 1509 Apt");

	select * from customer ;


## 5. insert into employee
select * from employee;
	
    #inserting manager and ceo first ;
    
	insert into  employee (employee_type_id,first_name,last_name,address,email , phone)
	values	(5, "Mona", "G", "Timesqaure, CA", "monag@gmail.com", "408-331-3339"),
    (4, "Pratham", "Vasa", "Queens Land, CA", "prathamvasa@gmail.com", "234-444-4663") ;
    
    
	insert into employee (employee_type_id,first_name,last_name,address,email , phone,manager_id)
	values 
	(1, "Mike", "Ross", "Bells Road, CA", "mikeross@gmai.com", "408-331-3339" ,2),
	(1, "Lisa", "Haydon", "Turning Lane Apt, CA", "lisahaydon@gmail.com", "308-903-2133" ,2),
	(2, "Rose", "Stewart", "Titan Lane, CA", "rosestewart@gmail.com", "402-499-3728",2),
	(2, "George", "Mayor", "Washington Apt, CA", "georgem@gmail.com", "808-303-3256",2),
	(3, "Luis", "Taylor", "Crook Road, CA", "luistaylor@gmail.com", "806-323-3409",2),
	(3, "Sarah", "Jude", "Mansion Groove, CA", "sarahjude@gmail.com", "303-453-3427",2),
	(1, "Kambi", "Dubey", "Bakers Street, CA", "kambidubey@gmail.com", "808-100-9801",2),
	(1, "John", "Salian", "Jake Road, CA", "johnsalian@gmail.com", "808-333-3209",2),
	(1, "Pratham", "Vasa", "Queens Land, CA", "prathamvasa@gmail.com", "234-444-4663",2),
	(3, "Brandon", "Gonsalves", "Winterfell Apt, CA", "brandong@gmail.com", "211-356-1212",2);


	select * from employee;
	select * from employee_type ;

#5B -updating managers details for employees 

	update employee set manager_id = 2 where employee_type_id in (1,2,3);
    select * from employee_type ;
    select * from employee;
    
    
##---------------------------------------------------------------------------------------------------------------------------------------------------------------------
##6. INSERT MULTIPLE VALUES INTO TABLE BILL
select * from bill;
    insert into bill (tip, customer_id,employee_id,transaction_date)
	values ( 10, 5, 7, "2016-01-06 22:43:12"),
    ( 20, 6, 3, "2016-10-01 20:22:26"),
    ( 30, 1, 5, "2017-12-02 12:04:01"),
    ( 40, 2, 5, "2018-08-03 13:27:09"),
    ( 50, 3, 6, "2019-01-04 16:32:10"),
    ( 60, 4, 7, "2019-02-05 19:55:11"),
    ( 20, 5, 7, "2019-03-06 20:43:12"),
    ( 20, 1, 11, "2019-04-06 22:32:33"),
    ( 10, 3, 7, "2019-05-06 19:55:56"),
    ( 20, 10, 6, "2019-06-06 18:04:39"),
    ( 40, 7, 9, "2019-07-06 20:44:04"),
    ( 30, 5, 8, "2019-08-06 19:26:33"),
    ( 20, 6, 7, "2019-09-06 22:09:22"),
    ( 10, 8, 12, "2019-10-06 20:48:12"),
    ( 20, 9, 3, "2019-11-06 20:48:12"),
    ( 10, 10, 6, "2019-12-01 20:48:12"),
    ( 13, 4, 3, "2019-12-02 21:20:23"),
    ( 10, 8, 4, "2019-12-03 21:56:54"),
    ( 40, 6, 6, "2019-12-04 20:45:22"),
    ( 50, 7, 7, "2019-12-05 19:53:13"),
    ( 10, 3, 8, "2019-12-06 19:20:24"),
    ( 10, 4, 12, "2019-12-07 18:20:14"),
    ( 20, 5, 11, "2019-12-08 18:11:36"),
    ( 50, 7, 7, "2019-12-09 19:53:13"),
    ( 10, 3, 8, "2019-12-10 19:20:24"),
    ( 10, 4, 10, "2019-12-11 18:20:14"),
    ( 20, 5, 4, "2019-12-12 18:11:36"),
    ( 50, 7, 7, "2019-12-13 19:53:13"),
    ( 10, 3, 7, "2019-12-14 19:20:24"),
    ( 10, 6, 9, "2019-12-15 18:20:14"),
    ( 20, 5, 4, "2019-12-16 18:11:36"),
    ( 50, 4, 8, "2019-12-17 19:53:13"),
    ( 10, 3, 8, "2019-12-18 19:20:24"),
    ( 10, 2, 3, "2019-12-18 18:20:14"),
    ( 70, 16, 7, "2019-12-18 21:20:36");

##7 . INSERT MULTIPLE VALUES INTO TABLE "LINE_ITEM"
     insert into line_item(bill_id,menu_item_id,quantity) values
    (1,1,10), (1,20,4), (1,13,5),
    (2,12,3), (2,1,4),
    (3,11,3), (3,18,2), (3,12,1),
    (4,1,2), (4,16,1),
    (5,1,9), (5,2,1), (5,15,1),
    (6,9,1), (6,14,1),
    (7,1,4), (7,2,4), (7,7,5),
    (8,10,3), (8,11,4),
    (9,1,3), (9,18,2), (9,13,1),
    (10,1,2), (10,16,1),
    (11,1,9), (11,2,1), (11,15,1),
    (12,1,1), (12,16,1),
    (13,11,3), (13,18,2), (13,12,1),
    (14,1,2), (14,16,1),
    (15,1,9), (15,2,1), (15,15,1),
    (16,9,1), (16,14,1),
    (17,1,4), (17,2,4), (17,7,5),
    (18,10,3), (18,11,4),
    (19,1,3), (19,18,2), (19,13,1),
    (20,1,2), (20,16,1),
    (21,1,9), (21,2,1), (21,15,1),
    (22,1,1), (22,16,1),
    (23,11,3), (23,18,2), (23,12,1),
    (24,1,2), (24,16,1),
    (25,1,9), (25,2,1), (25,15,1),
    (26,9,1), (26,14,1),
    (27,1,4), (27,2,4), (27,7,5),
    (28,10,3), (28,11,4),
    (29,1,3), (29,18,2), (29,13,1),
    (30,1,2), (30,16,1),
    (31,1,9), (31,2,1), (31,15,1),
    (32,13,1), (32,16,1),
    (33,11,3), (33,18,2), (33,12,1),
    (34,1,2), (34,16,1),
    (35,1,9), (35,21,1),(35,2,1),(35,8,1) ;
    
    select * from line_item;
    
    ##8 INSERT VALUES INTO THE PAYMENT
    insert into payment (bill_id,payment_type_id,payment_status) values
    (1,1,"Successful"),
    (2,1,"Successful"),
    (3,2,"Successful"),
    (4,3,"Successful"),
    (5,1,"Successful"),
    (6,2,"Successful"),
    (7,1,"Successful"),
    (8,1,"Successful"),
    (9,1,"Successful"),
    (10,3,"Successful"),
    (11,1,"Successful"),
    (12,2,"Successful"),
    (13,1,"Successful"),
    (14,2,"Successful"),
    (15,1,"Successful"),
    (16,1,"Successful"),
    (17,1,"Successful"),
    (18,2,"Successful"),
    (19,3,"Successful"),
    (20,1,"Successful"),
    (21,2,"Successful"),
    (22,1,"Successful"),
    (23,1,"Successful"),
    (24,2,"Successful"),
    (25,3,"Successful"),
    (26,1,"Successful"),
    (27,2,"Successful"),
    (28,1,"Successful"),
    (29,1,"Successful"),
    (30,3,"Successful"),
    (31,1,"Successful"),
    (32,2,"Successful"),
    (33,3,"Successful"),
    (34,2,"Successful"),
    (35,1,"Successful");
    select * from payment;

    

##----------------------------------------------------------------------------------------------------------------------------------------------------------
  






