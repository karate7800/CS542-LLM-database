drop table produces;
drop table purchases;
DROP table transactions;
drop table discounts;
drop table producers;
drop table products;
DROP TABLE employees;
drop table storehours;
drop table stores;
drop table members;

Create table members(
    mid int primary key,
    name varchar(50),
    address varchar(50),
    phonenumber char(1)
    
);

create table stores(
    sid int primary key,
    name varchar(50),
    location varchar(50)
);
create table storehours(
    sid int references stores(sid),
    day int,
    openTime date,
    closeTime date,
    primary key(sid,day)
);
create table employees(
    storeID references stores(SID),
    eid int primary key,
    name varchar(50),
    salary float
);

create table products(
    pid int primary key,
    pname varchar(20),
    category varchar(20),
    price float,
    quantity int
);
create table producers(
    prID int primary key,
    name varchar(50),
    location varchar(50)
);

create table discounts(
    pid int references products(pid),
    storeID references stores(sid),
    newprice float,
    startDate date,
    expDate date,
    primary key(pid, storeID, startDate)
);

create table transactions(
    tid int primary key, 
    sid int references stores(sid),
    mid int references members(mid),
    pdate date
);

create table purchases(
    tid int references transactions(tid),
    pid int references products(pid),
    quantity int,
    status varchar(10),

    primary key(tid, pid)
);

create table produces(
    prID int references producers(prID),
    pid int references products(pid),
    primary key (prID,pid)
);



-- Inserting data into 'members' table
INSERT INTO members (mid, name, address, phonenumber) VALUES
(1, 'John Smith', '123 Main Street', '1');

INSERT INTO members (mid, name, address, phonenumber) VALUES
(2, 'Alice Lee', '456 Elm Avenue', '1');

-- Inserting data into 'stores' table
INSERT INTO stores (sid, name, location) VALUES
(1, 'SuperMart', '789 Oak Street');

INSERT INTO stores (sid, name, location) VALUES
(2, 'MegaStore', '321 Pine Road');

-- Inserting data into 'storehours' table
INSERT INTO storehours (sid, day, openTime, closeTime) VALUES
(1, 1, TO_DATE('09:00:00', 'HH24:MI:SS'), TO_DATE('18:00:00', 'HH24:MI:SS'));

INSERT INTO storehours (sid, day, openTime, closeTime) VALUES
(1, 2, TO_DATE('09:30:00', 'HH24:MI:SS'), TO_DATE('17:30:00', 'HH24:MI:SS'));

-- Inserting data into 'employees' table
INSERT INTO employees (storeID, eid, name, salary) VALUES
(1, 101, 'Emily Johnson', 3000);

INSERT INTO employees (storeID, eid, name, salary) VALUES
(2, 102, 'Michael Brown', 3500);

-- Inserting data into 'products' table
INSERT INTO products (pid, pname, category, price, quantity) VALUES
(1, 'Bread', 'Groceries', 2.5, 100);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(2, 'Smartphone', 'Electronics', 500, 50);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(3, 'Milk', 'Groceries', 1.5, 200);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(4, 'T-shirt', 'Apparel', 15.99, 50);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(5, 'Laptop', 'Electronics', 1200, 20);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(6, 'Toothpaste', 'Personal Care', 3.99, 100);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(7, 'Sunglasses', 'Accessories', 25.5, 30);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(8, 'Desk Lamp', 'Office', 35.99, 15);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(9, 'Backpack', 'Bags', 29.99, 40);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(10, 'Running Shoes', 'Footwear', 79.99, 25);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(11, 'Coffee Maker', 'Kitchen Appliances', 49.99, 10);

INSERT INTO products (pid, pname, category, price, quantity) VALUES
(12, 'Notebook', 'Stationery', 5.99, 80);

-- Inserting data into 'producers' table
INSERT INTO producers (prID, name, location) VALUES
(1, 'Farm Fresh', '123 Farm Rd');

INSERT INTO producers (prID, name, location) VALUES
(2, 'Tech Innovate', '456 Tech Blvd');

-- Inserting data into 'discounts' table
INSERT INTO discounts (pid, storeID, newprice, startDate, expDate) VALUES
(1, 1, 2.0, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'));

INSERT INTO discounts (pid, storeID, newprice, startDate, expDate) VALUES
(2, 2, 480, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'));

-- Inserting data into 'transactions' table
INSERT INTO transactions (tid, sid, mid, pdate) VALUES
(1, 1, 1, TO_DATE('2024-03-10', 'YYYY-MM-DD'));

INSERT INTO transactions (tid, sid, mid, pdate) VALUES
(2, 2, 2, TO_DATE('2024-03-12', 'YYYY-MM-DD'));

INSERT INTO transactions (tid, sid, mid, pdate) VALUES
(3, 1, 2, TO_DATE('2024-03-15', 'YYYY-MM-DD'));

INSERT INTO transactions (tid, sid, mid, pdate) VALUES
(4, 2, 1, TO_DATE('2024-03-18', 'YYYY-MM-DD'));

-- Inserting data into 'purchases' table
INSERT INTO purchases (tid, pid, quantity, status) VALUES
(1, 1, 5, 'completed');

INSERT INTO purchases (tid, pid, quantity, status) VALUES
(2, 2, 1, 'pending');

INSERT INTO purchases (tid, pid, quantity, status) VALUES
(3, 2, 2, 'completed');

INSERT INTO purchases (tid, pid, quantity, status) VALUES
(4, 1, 3, 'pending');

-- Inserting data into 'produces' table
INSERT INTO produces (prID, pid) VALUES
(1, 1);

INSERT INTO produces (prID, pid) VALUES
(2, 2);
