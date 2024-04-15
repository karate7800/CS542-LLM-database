SELECT location
FROM stores;

SELECT name, location
FROM producers;

SELECT pname
FROM products
WHERE department = 'Groceries';

SELECT COUNT(DISTINCT mid) AS num_customers
FROM transactions
WHERE sid = 1;

SELECT COUNT(*) AS num_completed
FROM transactions;

SELECT name
FROM employees
ORDER BY salary DESC
FETCH FIRST 1 ROW ONLY;

SELECT pid, pname
FROM products
WHERE quantity < 50;

SELECT COUNT(DISTINCT department) AS num_categories
FROM products;

SELECT address
FROM members
WHERE address LIKE '%Elm%';

SELECT openTime, closeTime
FROM storehours
WHERE sid = 1;

SELECT pr.name AS manufacturer_name
FROM producers pr
JOIN produces p ON pr.prID = p.prID
JOIN products pro ON pro.pid = p.pid
JOIN discounts d ON pro.pid = d.pid
ORDER BY d.newprice / pro.price DESC
FETCH FIRST 1 ROW ONLY;

SELECT m.name AS customer_name, SUM(p.quantity * pr.price) AS total_price
FROM members m
JOIN transactions t ON m.mid = t.mid
JOIN purchases p ON t.tid = p.tid
JOIN products pr ON p.pid = pr.pid
GROUP BY m.name;

SELECT pname
FROM products pr
JOIN discounts d ON pr.pid = d.pid
WHERE (pr.price - d.newprice) / pr.price > 0.1;

SELECT SUM(p.price * p.quantity) AS total_price
FROM products p
JOIN produces pr ON p.pID = pr.pID
JOIN producers pro ON pr.prID = pro.prID
WHERE pro.name = 'Farm Fresh';

SELECT s.location, e.eid
FROM storehours sh
JOIN stores s ON sh.sid = s.sid
JOIN employees e ON s.sid = e.storeID
WHERE sh.day = 1
ORDER BY closeTime - openTime DESC
FETCH FIRST 1 ROW ONLY;

SELECT p.*
FROM products p
JOIN produces pr ON pr.pID = p.pID
JOIN producers pro ON pro.prID = pr.prID
WHERE pro.name = 'Tech Innovate'
AND p.price < 600;

SELECT AVG(e.salary) AS avg_salary
FROM employees e
JOIN stores s ON e.storeID = s.sid
JOIN transactions t ON s.sid = t.sid
WHERE EXTRACT(MONTH FROM t.pdate) = 3 AND EXTRACT(YEAR FROM t.pdate) = 2024
GROUP BY e.storeID
ORDER BY COUNT(t.tid) DESC
FETCH FIRST 1 ROW ONLY;

SELECT m.name, m.phonenumber
FROM members m
JOIN transactions t ON m.mid = t.mid
JOIN purchases p ON t.tid = p.tid
WHERE p.status = 'pending' AND t.pdate < CURRENT_DATE - INTERVAL '3' DAY;

SELECT t.sid AS StoreID, s.name AS StoreName, 
       SUM(pr.price * p.quantity) AS TotalRevenue
FROM transactions t
JOIN purchases p ON t.tid = p.tid
JOIN products pr ON p.pid = pr.pid
JOIN stores s ON t.sid = s.sid
WHERE EXTRACT(MONTH FROM t.pdate) = 3
GROUP BY t.sid, s.name;

SELECT DISTINCT(m.name) AS customer_name, m.address
FROM members m
JOIN transactions t ON m.mid = t.mid
WHERE t.pdate >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month' 
AND t.pdate < DATE_TRUNC('month', CURRENT_DATE)
AND m.mid NOT IN (
    SELECT m.mid
    FROM members m
    JOIN transactions t ON m.mid = t.mid
    WHERE t.pdate >= DATE_TRUNC('month', CURRENT_DATE)
);

SELECT pr.department,SUM(pr.quantity) 
FROM products pr
WHERE pr.department='Groceries' OR pr.department='Electronics'
GROUP BY pr.department
HAVING SUM(pr.quantity)<500;
