create database assignment_sql;
use assignment_sql;

create Table SalesPeople (
Snum int NOT NULL,
Sname varchar(100) NOT NULL,
City varchar(100),
Comm int,
PRIMARY KEY (Snum),
UNIQUE (Sname)
);

INSERT INTO SalesPeople VALUES(1001, 'Peel', 'London', 12);
INSERT INTO SalesPeople VALUES(1002, 'Serres', 'Sanjose', 13);
INSERT INTO SalesPeople VALUES(1004, 'Motika', 'London', 11);
INSERT INTO SalesPeople VALUES(1007, 'Rifkin', 'Barcelona', 15);
INSERT INTO SalesPeople VALUES(1003, 'Axelrod', 'Newyork', 10);



create table Customers (
Cnum int Not Null,
Cname varchar(100),
City varchar(50) Not Null,
Snum int,
PRIMARY KEY (Cnum),
FOREIGN KEY (Snum) references SalesPeople(Snum)
);

insert into Customers values (2001, 'Hoffman', 'London', 1001);
insert into Customers values (2002, 'Giovanni', 'Rome', 1003);
insert into Customers values (2003, 'Liu', 'Sanjose', 1002);
insert into Customers values (2004, 'Grass', 'Berlin', 1002);
insert into Customers values (2006, 'Clemens', 'London', 1001);
insert into Customers values (2008, 'Cisneros', 'Sanjose', 1007);
insert into Customers values (2007, 'Pereira ', 'Rome', 1004);






create table Orders (
Onum int Not Null,
Amt float(25),
Odate date,
Cnum int,
Snum int,
FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

insert into Orders values (3001, 18.69, '1990-10-3', 2008, 1007);
insert into Orders values (3003, 767.19, '1990-10-3', 2001, 1001);
insert into Orders values (3002, 1900.10, '1990-10-3', 2007, 1004);
insert into Orders values (3005, 5160.45, '1990-10-3', 2003, 1002);
insert into Orders values (3006, 1098.16, '1990-10-3', 2008, 1007);
insert into Orders values (3009, 1713.23, '1990-10-4', 2002, 1003);
insert into Orders values (3007, 75.75, '1990-10-4', 2004, 1002);
insert into Orders values (3008, 4273.00, '1990-10-5', 2006, 1001);
insert into Orders values (3010, 1309.95, '1990-10-6', 2004, 1002);
insert into Orders values (3011, 9891.88, '1990-10-6', 2006, 1001);




# 1. Count the number of Salesperson whose name begin with ‘a’/’A’.

	select count(Sname) from SalesPeople where Sname LIKE 'a%';

    # Output :- 	
    # 				   count(Sname)
    #				     1



# 2.  Display all the Salesperson whose all orders worth is more than Rs. 2000.

	select SalesPeople.Sname from Orders INNER JOIN SalesPeople ON Orders.Snum = SalesPeople.Snum  where Orders.Amt>2000;

	# Output :-  	
  #			       Sname
	#			       Serres
	#	           Peel
	#				     Peel





# 3.  Count the number of Salesperson belonging to Newyork.

	select count(Sname) from SalesPeople where City = 'Newyork';
    
	# Output :-   
	#		        count(Sname)
  #			      1





# 4.  Display the number of Salespeople belonging to London and belonging to Paris.

	select count(Snum) from SalesPeople where City in ('London','Paris');
	
    # Output :-  
	  # 				  count(Snum)
    #				    2 





# 5. Display the number of orders taken by each Salesperson and their date of orders.

	select SalesPeople.Snum, count(Orders.Onum), Orders.Odate from Orders INNER JOIN SalesPeople ON Orders.Snum = SalesPeople.Snum GROUP BY Orders.Snum;

	# Output :- 
  #				Snum,  count(Orders.Onum),  Odate
  #			  1003	 1					          1990-10-04
	#				1004	 1					          1990-10-03
	#				1001	 3					          1990-10-03
	#				1007	 2					          1990-10-03
	#				1002	 3					          1990-10-03

    
    
    
    
    