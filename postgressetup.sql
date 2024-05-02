drop table employ;
drop table sell;
drop table purchase;
drop table does;
drop table have;
drop table owned_discounts;
drop table administrated_departments;
drop table workers;
drop table administrators;
drop table transactions;
-- drop table producers;
drop table produced_products;
drop table employees;
drop table open_storehours;
drop table stores;
drop table members;

create table members(
	mid int primary key,
	name varchar(50),
	address varchar(100),
	phonenum varchar(10)
);

create table stores(
	sid int primary key,
	name varchar(50),
	location varchar(100)
);

create table open_storehours(
	day int,
	sid int references stores(sid),
	openTime time,
	closeTime time,
	primary key (day,sid)
);

create table employees(
	eid int primary key,
	storeID int references stores(sid),
	name varchar(50),
	salary float
);

create table produced_products(
	pid int primary key,
	prID int,
	pname varchar(50),
	price float,
	quantity int,
	department int
);

create table producers(
    prID int primary key,
    name varchar(50),
    location varchar(50)
);

create table transactions(
	tid int primary key,
	pdate Date
	);

create table administrators(
	eid int references employees(eid) primary key, 
	office varchar(10)
);

create table workers(
	eid int primary key,
	contacts varchar(50),
	duty varchar(50)
);

create table administrated_departments(
	did varchar(50) primary key,
	eid int references employees(eid),
	dname varchar(50)
);

create table owned_discounts(
	pid int references produced_products(pid),
	startDate Date,
	newPrice float,
	expDate Date,
	primary key (pid,startDate)
);

create table have(
	sid int references stores(sid),
	pid int references produced_products(pid),
	startDate date,
	primary key(sid,pid,startDate)
);

create table does(
	tid int references transactions(tid),
	mid int references members(mid),
	primary key (tid,mid)
);

create table purchase(
	tid int references transactions(tid),
	pid int references produced_products(pid),
	status varchar(10),
	primary key (tid,pid)
);

create table sell(
	pid int references produced_products(pid),
	sid int references stores(sid),
	primary key(pid,sid)
);

create table employ(
	sid int references stores(sid),
	eid int references employees(eid),
	primary key (sid,eid)
);




-- Inserting data into 'members' table
INSERT INTO members (mid, name, address, phonenum) VALUES (1, 'John Smith', '123 Main Street', '1');
INSERT INTO members (mid, name, address, phonenum) VALUES (2, 'Alice Lee', '456 Elm Avenue', '1');

-- Inserting data into 'stores' table
INSERT INTO stores (sid, name, location) VALUES (1, 'SuperMart', '789 Oak Street');
INSERT INTO stores (sid, name, location) VALUES (2, 'MegaStore', '321 Pine Road');

-- Inserting data into 'storehours' table
INSERT INTO open_storehours (sid, day, openTime, closeTime) VALUES (1, 1, TO_TIMESTAMP('09:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'));
INSERT INTO open_storehours (sid, day, openTime, closeTime) VALUES (1, 2, TO_TIMESTAMP('09:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:30:00', 'HH24:MI:SS'));

-- Inserting data into 'employees' table
INSERT INTO employees (storeID, eid, name, salary) VALUES (1, 101, 'Emily Johnson', 3000);
INSERT INTO employees (storeID, eid, name, salary) VALUES (2, 102, 'Michael Brown', 3500);

--Inserting data into 'departments' table

INSERT INTO administrated_departments (did,dname) VALUES (1,'Groceries');
INSERT INTO administrated_departments (did,dname) VALUES (2,'Electronics');
INSERT INTO administrated_departments (did,dname) VALUES (4,'Apparel');
INSERT INTO administrated_departments (did,dname) VALUES (5,'Personal Care');
INSERT INTO administrated_departments (did,dname) VALUES (3,'Accessories');
INSERT INTO administrated_departments (did,dname) VALUES (6,'Home/Office');
INSERT INTO administrated_departments (did,dname) VALUES (7,'Bags');
INSERT INTO administrated_departments (did,dname) VALUES (8,'Footwear');
INSERT INTO administrated_departments (did,dname) VALUES (11,'Kitchen Appliances');
INSERT INTO administrated_departments (did,dname) VALUES (12,'Stationary');

-- Inserting data into 'products' table
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (1, 'Bread', 1, 2.5, 100);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (2, 'Smartphone', 2, 500, 50);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (3, 'Milk', 1, 1.5, 200);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (4, 'T-shirt', 4, 15.99, 50);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (5, 'Laptop', 2, 1200, 20);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (6, 'Toothpaste', 5, 3.99, 100);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (7, 'Sunglasses', 3, 25.5, 30);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (8, 'Desk Lamp', 6, 35.99, 15);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (9, 'Backpack', 7, 29.99, 40);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (10, 'Running Shoes', 8, 79.99, 25);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (11, 'Coffee Maker', 11, 49.99, 10);
INSERT INTO produced_products (pid, pname, department, price, quantity) VALUES (12, 'Notebook', 12, 5.99, 80);

-- Inserting data into 'producers' table
INSERT INTO producers (prID, name, location) VALUES (1, 'Farm Fresh', '123 Farm Rd');
INSERT INTO producers (prID, name, location) VALUES (2, 'Tech Innovate', '456 Tech Blvd');

-- Inserting data into 'discounts' table
INSERT INTO owned_discounts (pid,  newprice, startDate, expDate) VALUES (1, 2.0, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'));
INSERT INTO owned_discounts (pid, newprice, startDate, expDate) VALUES (2, 480, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'));

-- Inserting data into 'transactions' table
INSERT INTO transactions (tid, pdate) VALUES (1, TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO transactions (tid, pdate) VALUES (2, TO_DATE('2024-03-12', 'YYYY-MM-DD'));
INSERT INTO transactions (tid, pdate) VALUES (3, TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO transactions (tid, pdate) VALUES (4, TO_DATE('2024-02-18', 'YYYY-MM-DD'));

-- Inserting data into 'purchases' table
INSERT INTO purchase (tid, pid, status) VALUES (1, 1, 'completed');
INSERT INTO purchase (tid, pid, status) VALUES (2, 2, 'pending');
INSERT INTO purchase (tid, pid, status) VALUES (3, 2, 'completed');
INSERT INTO purchase (tid, pid, status) VALUES (4, 1, 'completed');








