drop database if exists doordash;
create database doordash;
use doordash;

create table customerAccount(
    emailAddress varchar(100),
    firstName varchar(100),
    lastName varchar(100),
    cellNum char(10),
    streetAddress varchar(100),
    city varchar(100),
    pc char(6),
    creditAmt decimal(6, 2),
    primary key (emailAddress));

create table foodOrder(
	orderID integer,
	totalPrice decimal(6,2),
	tip decimal(6, 2),
    orderDate date,
	primary key (orderID));

create table food (
	name varchar(100),
	primary key (name));

create table restaurant(
	name varchar(100),
	streetAddress varchar(100),
	city varchar(100),
	pc char(6),
	url varchar(200),
	primary key (name));

create table employee(
	ID integer,
	firstName varchar(100),
	lastName varchar(100),
	emailAddress varchar(100),
      restaurantName varchar(100),
	primary key (ID),
      foreign key(restaurantName) references restaurant(name));

create table manager(
	empid integer primary key,
	foreign key (empid) references employee(ID) on delete cascade);

create table serverStaff(
	empid integer primary key,
	foreign key (empid) references employee(ID) on delete cascade);

create table chef(
	empid integer primary key,
	foreign key (empid) references employee(ID) on delete cascade);

create table deliveryPerson(
	empid integer primary key,
	foreign key (empid) references employee(ID) on delete cascade);

create table payment(
	customerEmail varchar(100),
	date date not null,
	paymentAmount decimal(6,2) not null,
	primary key (customerEmail, date),
	foreign key (customerEmail) references customerAccount(emailAddress) on delete cascade);

create table shift(
	empID integer not null,
	day varchar(15) not null,
	startTime time not null,
	endTime time not null,
	primary key (empID, day),
	foreign key (empID) references employee(ID) on delete cascade);

create table chefCredentials (
	empID integer not null,
	cred varchar(30),
	primary key (empID, cred),
	foreign key (empID) references employee(ID) on delete cascade);

create table orderPlacement(
	customerEmail varchar(100) not null,
	orderID integer not null,
	restaurant varchar(100) not null,
	orderTime time,
	primary key (customerEmail, orderID, restaurant),
	foreign key (customerEmail) references customerAccount(emailAddress) on delete cascade,
	foreign key (orderID) references foodOrder(orderID) on delete cascade,
	foreign key (restaurant) references restaurant(name) on delete cascade);

create table relatedTo(
	customer varchar(100) not null,
	employee integer not null,
	relationship varchar(100),
	primary key (customer, employee),
	foreign key (customer) references customerAccount(emailAddress) on delete cascade,
	foreign key (employee) references employee(ID) on delete cascade);

create table menu(
	restaurant varchar(100) not null,
	food varchar(100) not null,
	price decimal(6, 2),
	primary key (restaurant, food),
	foreign key (restaurant) references restaurant(name) on delete cascade,
	foreign key (food) references food (name) on delete cascade);

create table foodItemsinOrder(
	orderID integer not null,
	food varchar(100) not null,
	primary key (orderID, food),
	foreign key (orderID) references foodOrder(orderID) on delete cascade,
	foreign key (food) references food(name) on delete cascade);

create table delivery(
	orderID integer not null,
	deliveryPerson integer not null,
	deliveryTime time,
	primary key (orderID, deliveryPerson),
	foreign key (orderID) references foodOrder(orderID) on delete cascade,
	foreign key (deliveryPerson) references employee(id) on delete cascade);

create table worksAt(
	employeeID integer not null,
	restaurant varchar(100) not null,
	primary key (employeeID, restaurant),
	foreign key (employeeID) references employee(ID) on delete cascade,
	foreign key (restaurant) references restaurant(name) on delete cascade);


INSERT INTO customeraccount VALUES
    ('Paul.Judson@gmail.com','Paul','Judson','3188554218','1645 King St','Kingston', 'K7L1C2', 600),
    ('jane.doe@gmail.com', 'Jane', 'Doe', '6135551234', '123 Main St', 'Toronto', 'M1N2P3', 250),
    ('john.smith@hotmail.com', 'John', 'Smith', '5145555678', '456 High St', 'Montreal', 'H3Z1X9', 1000),
    ('lisa.frank@yahoo.com', 'Lisa', 'Frank', '9055556789', '789 Baker St', 'Hamilton', 'L8S2W4', 500),
    ('sam.jones@hotmail.com', 'Sam', 'Jones', '6475551234', '321 Maple Rd', 'Toronto', 'M2N3P2', 350),
    ('matt.lee@gmail.com', 'Matt', 'Lee', '4165553456', '234 Main St', 'Toronto', 'M1M2K1', 600),
    ('rnfurhnfunrufn', 'Mat', 'Le', '41653456', '234 Ma St', 'Tonto', 'M1M2h1', 690);

INSERT INTO restaurant VALUES
    ('Burger King', '123 Main St', 'Toronto', 'M1N2P3', 'www.burgerking.ca'),
    ('McDonalds', '456 High St', 'Montreal', 'H3Z1X9', 'www.mcdonalds.ca'),
    ('Tim Hortons', '789 Baker St', 'Hamilton', 'L8S2W4', 'www.timhortons.ca'),
    ('Subway', '321 Maple Rd', 'Toronto', 'M2N3P2', 'www.subway.ca'),
    ('Pizza Pizza', '234 Main St', 'Toronto', 'M1M2K1', 'www.pizzapizza.ca'),
    ('Wendys', '345 High St', 'Montreal', 'H3Z1X9', 'www.wendys.ca')
    ('Drags Pizza', '125 Main St', 'Todronto', 'M142P3', 'www.DragsPizza.ca')
    ;

INSERT INTO employee VALUES
    (1, 'John', 'Smith', 'john.smith@hotmail.com', 'Burger King'),
    (2, 'Jane', 'Doe', 'jane.doe@gmail.com', 'McDonalds'),
    (3, 'Lisa', 'Frank', 'lisa.frank@yahoo.com', 'Burger King'),
    (4, 'Sam', 'Jones', 'sam.jones@hotmail.com', 'McDonalds'),
    (5, 'Matt', 'Lee', 'matt.lee@gmail.com', 'Burger King'),
    (6, 'Paul', 'Judson', 'Paul.Judson@gmail.com', 'McDonalds'),
    (7, 'Jhn', 'Smth', 'john.smth@otmail.com', 'Burger King'),
    (8, 'Jne', 'Do', 'john.smth@otmail.com', 'Burger King'),
    (9, 'Lsa', 'Frnk', 'john.smth@otmail.com', 'Burger King'),
    (10, 'Sm', 'Jnes', 'john.smth@otmail.com', 'Burger King'),
    (11, 'Mt', 'Le', 'john.smth@otmail.com', 'Burger King'),
    (12, 'Pul', 'Jdsn', 'john.smth@otmail.com', 'Burger King'),
    (13, 'JhnN', 'Smth', 'john.smth@otmail.com', 'Burger King');

INSERT INTO shift VALUES
    (1, 'Saturday', '10:00:00', '14:00:00'),
    (1, 'Tuesday', '10:00:00', '14:00:00'),
    (1, 'Wednesday', '10:00:00', '14:00:00'),
    (1, 'Thursday', '10:00:00', '14:00:00'),
    (1, 'Friday', '10:00:00', '14:00:00'),
    (2, 'Monday', '10:00:00', '14:00:00'),
    (2, 'Tuesday', '10:00:00', '14:00:00'),
    (2, 'Wednesday', '10:00:00', '14:00:00'),
    (2, 'Thursday', '10:00:00', '14:00:00'),
    (2, 'Friday', '10:00:00', '14:00:00'),
    (3, 'Monday', '10:00:00', '14:00:00'),
    (3, 'Tuesday', '10:00:00', '14:00:00'),
    (3, 'Wednesday', '10:00:00', '14:00:00'),
    (3, 'Thursday', '10:00:00', '14:00:00'),
    (3, 'Friday', '10:00:00', '14:00:00'),
    (4, 'Monday', '10:00:00', '14:00:00'),
    (4, 'Tuesday', '10:00:00', '14:00:00'),
    (4, 'Wednesday', '10:00:00', '14:00:00'),
    (4, 'Thursday', '10:00:00', '14:00:00'),
    (4, 'Friday', '10:00:00', '14:00:00'),
    (5, 'Monday', '10:00:00', '14:00:00'),
    (5, 'Tuesday', '10:00:00', '14:00:00'),
    (5, 'Wednesday', '10:00:00', '14:00:00');

INSERT INTO foodOrder VALUES
    (1, 21.00, 2.00, '2023-04-01'),
    (2, 15.00, 2.00, '2023-04-0'),
    (3, 20.00, 2.00, '2023-04-01'),
    (4, 25.00, 2.00, '2023-04-01'),
    (5, 30.00, 2.00, '2023-04-01'),
    (6, 35.00, 2.00, '2023-04-02'),
    (7, 40.00, 2.00, '2023-04-02'),
    (8, 45.00, 2.00, '2023-04-02'),
    (9, 50.00, 2.00, '2023-04-02'),
    (10, 55.00, 2.00, '2023-04-03'),
    (11, 60.00, 2.00, '2023-04-04'),
    (12, 65.00, 2.00, '2023-04-04'),
    (13, 70.00, 2.00, '2023-04-04'),
    (14, 75.00, 2.00, '2023-04-04'),
    (15, 80.00, 2.00, '2023-04-04'),
    (16, 85.00, 2.00, '2023-04-05'),
    (17, 90.00, 2.00, '2023-04-05'),
    (18, 95.00, 2.00, '2023-04-06'),
    (19, 100.00, 2.00, '2023-04-06'),
    (20, 105.00, 2.00, '2023-04-06'),
    (21, 110.00, 2.00, '2023-04-06'),
    (22, 115.00, 2.00, '2023-04-06'),
    (23, 120.00, 2.00, '2023-04-06');

INSERT INTO delivery VALUES
    (8, '1', '21:00'),
    (9, '2', '21:00'),
    (10, '3', '21:00'),
    (11, '4', '21:00'),
    (12, '5', '21:00'),
    (13, '6', '21:00');

INSERT INTO deliveryPerson VALUES
    (8),
    (9),
    (10),
    (11),
    (12),
    (13);
    
INSERT INTO food VALUES
    ('Burger'),
    ('Fries'),
    ('Drink'),
    ('Sandwich'),
    ('Pizza'),
    ('Salad'),
    ('Chicken'),
    ('Soup'),
    ('Ice Cream'),
    ('Donut'),
    ('Coffee'),
    ('Tea'),
    ('Milkshake'),
    ('Soda'),
    ('Water');
    
INSERT INTO foodItemsinOrder VALUES
    (1, 'Burger'),
    (1, 'Fries'),
    (1, 'Drink'),
    (2, 'Sandwich'),
    (2, 'Fries'),
    (2, 'Drink'),
    (3, 'Pizza'),
    (3, 'Fries'),
    (3, 'Drink'),
    (4, 'Salad'),
    (4, 'Fries'),
    (4, 'Drink'),
    (5, 'Chicken'),
    (5, 'Fries'),
    (5, 'Drink'),
    (6, 'Soup'),
    (6, 'Fries'),
    (6, 'Drink'),
    (7, 'Ice Cream'),
    (7, 'Fries'),
    (7, 'Drink'),
    (8, 'Donut'),
    (8, 'Fries'),
    (8, 'Drink'),
    (9, 'Coffee'),
    (9, 'Fries'),
    (9, 'Drink'),
    (10, 'Tea'),
    (10, 'Fries'),
    (10, 'Drink'),
    (11, 'Milkshake'),
    (11, 'Fries'),
    (11, 'Drink'),
    (12, 'Soda'),
    (12, 'Fries'),
    (12, 'Drink'),
    (13, 'Water'),
    (13, 'Fries'),
    (13, 'Drink'),
    (14, 'Burger'),
    (14, 'Fries'),
    (14, 'Drink'),
    (15, 'Sandwich'),
    (15, 'Fries'),
    (15, 'Drink'),
    (16, 'Pizza'),
    (16, 'Fries'),
    (16, 'Drink'),
    (17, 'Salad'),
    (17, 'Fries'),
    (17, 'Drink'),
    (18, 'Chicken'),
    (18, 'Fries'),
    (18, 'Drink'),
    (19, 'Soup'),
    (19, 'Fries'),
    (19, 'Drink'),
    (20, 'Ice Cream'),
    (20, 'Fries'),
    (20, 'Drink'),
    (21, 'Donut'),
    (21, 'Fries'),
    (21, 'Drink'),
    (22, 'Coffee'),
    (22, 'Fries'),
    (22, 'Drink'),
    (23, 'Tea');

INSERT INTO orderPlacement VALUES
    ('Paul.Judson@gmail.com', 1, 'Burger King', '14:00'),
    ('jane.doe@gmail.com', 2, 'McDonalds', '14:00'),
    ('john.smith@hotmail.com', 3, 'Burger King', '14:00'),
    ('lisa.frank@yahoo.com', 4, 'McDonalds', '14:00'),
    ('sam.jones@hotmail.com', 5, 'Burger King', '14:00'),
    ('matt.lee@gmail.com', 6, 'Burger King', '14:00'),
    ('rnfurhnfunrufn', 7, 'McDonalds', '14:00');

INSERT INTO employee VALUES
    (14, 'Henry', 'Jake', 'Henry.Jake@hotmail.com', 'Drags Pizza');
