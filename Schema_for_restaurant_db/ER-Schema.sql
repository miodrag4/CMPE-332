-- Author: Mile Stosic
-- Student ID: 20233349
-- Date: 2023-02-17
-- Description: This file contains the ER-Schema for the restaurant database.
DROP DATABASE IF EXISTS restaurantDB;
CREATE DATABASE restaurantDB;
-- Restaurant table
CREATE TABLE Restaurants(
    Restaurant VARCHAR(20) NOT NULL,
    Address INT,
    City VARCHAR(200),
    Street VARCHAR(200),
    Postal_code CHAR(6),
    URL VARCHAR(100) NOT NULL,
    PRIMARY KEY(Restaurant, URL)
); 
-- Employee table
CREATE TABLE Employee(
    Employee_id INT NOT NULL,
    Name VARCHAR(20),
    Firstname VARCHAR(100),
    Lastname VARCHAR(100),
    Email VARCHAR(100),
    Restaurant VARCHAR(20),
    FOREIGN KEY(Restaurant) REFERENCES Restaurants(Restaurant) ON DELETE CASCADE,
    PRIMARY KEY(Employee_id)
);
-- Server table
CREATE TABLE Servers(
    Server_id INTEGER NOT NULL,
    PRIMARY KEY(Server_id),
    FOREIGN KEY(Server_id) REFERENCES Employee(Employee_id) ON DELETE CASCADE
);
-- Delivery table
CREATE TABLE Delivery(
    Delivery_id INT NOT NULL,
    PRIMARY KEY(Delivery_id),
    FOREIGN KEY(Delivery_id) REFERENCES Employee(Employee_id) 
);
-- Chef table
CREATE TABLE Chef(
    Chef_id INT NOT NULL,
    PRIMARY KEY(Chef_id),
    FOREIGN KEY(Chef_id) REFERENCES Employee(Employee_id) ON DELETE CASCADE
);
-- Credentials table
CREATE TABLE credentials(
    credentials VARCHAR(100),
    Chef_id INT NOT NULL,
    PRIMARY KEY(Chef_id),
    FOREIGN KEY(Chef_id) REFERENCES Employee(Employee_id) ON DELETE CASCADE
);
-- Management table
CREATE TABLE Management(
    Management_id INT NOT NULL,
    PRIMARY KEY(Management_id),
    FOREIGN KEY(Management_id) REFERENCES Employee(Employee_id) ON DELETE CASCADE
);
-- Schedule table
CREATE TABLE Schedule(
    Start_time TIME,
    End_time TIME,
    Days VARCHAR(20) NOT NULL,
    Employee_id INT NOT NULL,
    Restaurant VARCHAR(20) NOT NULL,
    PRIMARY KEY(Employee_id),
    FOREIGN KEY(Employee_id) REFERENCES Employee(Employee_id) ON DELETE CASCADE,
    FOREIGN KEY(Restaurant) REFERENCES Restaurants(Restaurant) ON DELETE CASCADE
);
-- Menu table
CREATE TABLE Menu(
    Restaurant VARCHAR(20) NOT NULL,
    item VARCHAR(100) NOT NULL,
    Price DECIMAL(9, 2),
    PRIMARY KEY(Restaurant, item),
    FOREIGN KEY(Restaurant) REFERENCES Restaurants(Restaurant) ON DELETE CASCADE
);
-- Customer table
CREATE TABLE Customer(
    Names VARCHAR(50) NOT NULL,
    Firstname VARCHAR(100),
    Lastname VARCHAR(100),
    Email VARCHAR(100) NOT NULL,
    Phone CHAR(10),
    Address VARCHAR(200),
    City VARCHAR(200),
    Street VARCHAR(200),
    Postalcode CHAR(6),
    PRIMARY KEY(Names)
);
-- Orders table
CREATE TABLE Orders( 
    Names VARCHAR(50) NOT NULL,
    Tip DECIMAL(5, 2),
    Price DECIMAL(9, 2),
    Delivery_time TIME,
    Placement_time TIME,
    Delivery_idd INT NOT NULL,
    PRIMARY KEY(Delivery_idd),
    FOREIGN KEY(Delivery_idd) REFERENCES Employee(Employee_id) ON DELETE CASCADE
);
-- Accounts table
CREATE TABLE Accounts(
    Credit DECIMAL(9.2),
    Payments VARCHAR(200) NOT NULL,
    Total DECIMAL(9, 2),
    Email VARCHAR(100) NOT NULL,
    Time_Info DATE,
    Customer VARCHAR(100) NOT NULL,
    PRIMARY KEY(Customer),
    FOREIGN KEY(Customer) REFERENCES Customer(Names) ON DELETE CASCADE
);
-- Relationships table
CREATE TABLE Relationships(
    Server_id INT NOT NULL,
    Customer VARCHAR(100) NOT NULL,
    Relationship VARCHAR(100) NOT NULL,
    PRIMARY KEY(Relationship),
    FOREIGN KEY(Server_id) REFERENCES Servers(Server_id) ON DELETE RESTRICT,
    FOREIGN KEY(Customer) REFERENCES Customer(Names) ON DELETE RESTRICT
);
-- Insertion values for the appropiate tables
INSERT INTO Restaurants VALUES
    ('BurgerKing','1234','Kingston','Main', 'K7L6T4','www.burgerking.com'),
    ('McDonalds','5135','Kingston','Front', 'K7L6T6','www.mcdonalds.com'),
    ('Wendys','152','Kingston','Queen', 'K7L3T8','www.wendys.com'),
    ('TimHortons','62','Kingston','West', 'K7L9T1','www.timhortons.com'),
    ('Subway','1858','Kingston','Park', 'K7L5T6','www.subway.com'),
    ('PizzaPizza','848','Kingston','Old', 'K7L4T1','www.pizzapizza.com');
    
INSERT INTO Employee VALUES 
	('1','Chris Evans','Chris','Evans','Chris.Evans@gmail.com','BurgerKing'),
    ('2','Bob Ross','Bob','Ross','Bob.Ross@gmail.com', 'PizzaPizza'),
    ('3','Jake Paul','Jake','Paul','Jake.Paul@gmail.com', 'Wendys'),
    ('4','Jake Scott','Jake','Scott','Jake.Scott@gmail.com', 'TimHortons'),
    ('5','Evan Peters','Evan','Peters','Evan.Peters@gmail.com', 'Subway'),
    ('6','Oscar Isaac','Oscar','Isaac','Oscar.Issac@gmail.com', 'McDonalds'),
    ('7','Euan Ross','Euan','Ross','Euan.Ross@gmail.com','BurgerKing'),
    ('8','Henry Paul','Henry','Paul','Henry.Paul@gmail.com', 'PizzaPizza'),
    ('9','Oscar Scott','Oscar','Scott','Oscar.Scott@gmail.com', 'Wendys'),
    ('10','Jake Peters','Jake','Peters','Jake.Peters@gmail.com', 'TimHortons'),
    ('11','Evan Isaac','Evan','Isaac','Evan.Issac@gmail.com', 'Subway'),
    ('12','Bob Evans','Bob','Evans','Bob.Evans@gmail.com', 'McDonalds'),
    ('13','Chris Ross','Chris','Ross','Chris.Ross@gmail.com','BurgerKing'),
    ('14','Bob Paul','Bob','Paul','Bob.Paul@gmail.com', 'PizzaPizza'),
    ('15','Jake Fuop','Jake','Fuop','Jake.Fuop@gmail.com', 'Wendys'),
    ('16','Evan StGermain','Evan','StGermain','Evan.StGermain@gmail.com','TimHortons'),
    ('17','Oscar Wilson','Oscar','Wilson','Oscar.Wilson@gmail.com','Subway'),
    ('18','Euan Brydie','Euan','Brydie','euan.Brydie@gmail.com', 'McDonalds'),
    ('19','Kieran dupuis','Kieran','dupuis','Kieran.dupuis@gmail.com', 'McDonalds'),
    ('20','Nick Chong','Nick','Chong','Nick.Chong@gmail.com', 'PizzaPizza'),
    ('21','Brendan Kyle','Brendan','Kyle','Brendan.Kyle@gmail.com','TimHortons'),
    ('22','Fahad Khan','Fahad','Khan','Fahad.Khan@gmail.com','Subway'),
    ('23','Jacky Chan','Jacky','Chan','Jacky.Chan@gmail.com', 'McDonalds'),
    ('24','Owen Wilson','Owen','Wilson','Owen.Wilson@gmail.com','BurgerKing');
INSERT INTO Servers VALUES
    ('1'),
    ('2'),
    ('3'),
    ('4'),
    ('5'),
    ('6');
INSERT INTO Delivery VALUES
    ('7'),
    ('8'),
    ('9'),
    ('10'),
    ('11'),
    ('12');
INSERT INTO Chef VALUES
    ('13'),
    ('14'),
    ('15'),
    ('16'),
    ('17'),
    ('18');
INSERT INTO credentials VALUES
    ('Certified Foodservice Professional','13'),
    ('Master Certified Food Executive','14'),
    ('Certified Chef de Cuisine', '15'),
    ('Certified Personal Chef', '16'),
    ('Certified Executive Chef', '17'),
    ('Certified Master Chef', '18');
INSERT INTO Management VALUES
    ('19'),
    ('20'),
    ('21'),
    ('22'),
    ('23'),
    ('24');
INSERT INTO SCHEDULE VALUES
    ('4:00:00', '2:00:00', 'Monday', '1','BurgerKing'),
    ('4:00:00', '2:00:00', 'Tuesday', '3','PizzaPizza'),
    ('4:00:00', '2:00:00', 'Wednesday', '4','Subway'),
    ('4:00:00', '2:00:00', 'Thursday', '2','McDonalds'),
    ('4:00:00', '2:00:00', 'Friday', '5','BurgerKing'),
    ('4:00:00', '2:00:00', 'Saturday', '6','TimHortons');
INSERT INTO Menu VALUES
    ('BurgerKing','Burger', '5.00'),
    ('McDonalds','Fries', '3.00'),
    ('Wendys','Drink', '2.00'),
    ('TimHortons','Pizza', '10.00'),
    ('Subway', 'Salad', '5.00'),
    ('PizzaPizza','Sandwich', '7.00');
INSERT INTO Customer VALUES
    ('Paul judson','Paul','Judson','Paul.Judson@gmail.com','3188554218','1645 ','Kingston','Main', 'K7L1C2'),
    ('Lucas Gagnon','Lucas','Gagnon','Lucas.Gagnon@gmail.com','7149961196','28','Kingston','Princess', 'K7L0T4'),
    ('Fadeel Khan','Fadeel','Khan','Fadeel.Khan@gmail.com','6182516321','3346 ','Kingston','Ross', 'K7L4V4'),
    ('Lucy harris','Lucy','Harris','Lucy.Harris@gmail.com','8158773812','3147 ','Kingston','Princess', 'K7M7H6'),
    ('Cory Guerin','Cory','Guerin','Cory.Guerin@gmail.com','8457785297','457','Kingston','Frontenac', 'K7L4V4'),
    ('Barra Macneil','Barra','Macneil','Barra.Macneil@gmail.com','3525276834','3','Kingston','King', 'B0P1R0');
INSERT INTO Orders VALUES
    ('Paul judson','10.45','50.00','5:15:30','4:45:00','7'),
    ('Lucas Gagnon','5.67','18.00','4:20:00','2:20:00','8'),
    ('Fadeel Khan','9.98','21.56','4:10:00','3:10:00','9'),
    ('Lucy harris','11.56','23.45','4:50:00','3:50:00','10'),
    ('Cory Guerin','5.00','17.98','4:30:00','3:30:00','11'),
    ('Barra Macneil','15.00','70.67','4:15:00','3:15:00','12');
INSERT INTO Relationships VALUES
    ('1','Paul judson','My bestFriend'),
    ('2','Lucas Gagnon','My sisters Boyfriend'),
    ('3','Fadeel Khan','Consistent Server'),
    ('4','Lucy harris','First Server to serve me'),
    ('5','Cory Guerin','Friend of a Friend'),
    ('6','Barra Macneil','Cosuisns sister');
INSERT INTO Accounts VALUES
    ('50.00', 'Visa', '50.00', 'Paul.Judson@gmail.com','2018-01-02','Paul judson'),
    ('18.00','Mastercard','18.00','Lucas.Gagnon@gmail.com','2018-01-04','Lucas Gagnon'),
    ('21.56', 'Visa', '21.56', 'Fadeel.Khan@gmail.com','2018-01-07','Fadeel Khan'),
    ('17.98', 'Visa', '17.98', 'Lucy.Harris@gmail.com','2018-01-09','Lucy harris'),
    ('70.67','Mastercard','70.67','Cory.Guerin@gmail.com','2018-01-10','Cory Guerin'),
    ('21.00', 'Visa', '21.00', 'Barra.Macneil@gmail.com','2018-01-13','Barra Macneil');