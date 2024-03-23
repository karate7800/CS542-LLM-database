SELECT location
FROM stores;

SELECT name, location
FROM producers;

SELECT pname
FROM products
WHERE category = 'groceries';

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

SELECT COUNT(DISTINCT category) AS num_categories
FROM products;

SELECT address
FROM members
WHERE address LIKE '%Elm%';

SELECT openTime, closeTime
FROM storehours
WHERE sid = 1;

SELECT p.name AS manufacturer_name
FROM products pr
JOIN producers p ON pr.prID = p.prID
JOIN discounts d ON pr.pid = d.pid
ORDER BY d.newprice / pr.price DESC
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
WHERE (pr.price - d.newprice) / pr.price > 0.2;

SELECT SUM(price * quantity) AS total_price
FROM products
JOIN producers ON products.prID = producers.prID
WHERE producers.name = 'Farm Fresh';

SELECT s.location, e.eid
FROM storehours sh
JOIN stores s ON sh.sid = s.sid
JOIN employees e ON s.sid = e.storeID
WHERE sh.day = 1
ORDER BY closeTime - openTime DESC
FETCH FIRST 1 ROW ONLY;

SELECT pr.*
FROM products pr
JOIN producers p ON pr.prID = p.prID
WHERE p.name = 'Tech Innovate'
AND pr.price < 50;

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
WHERE p.status = 'pending' AND t.pdate < SYSDATE - INTERVAL '3' DAY;

SELECT s.name AS store_name, SUM(pr.price * p.quantity) AS total_revenue
FROM stores s
LEFT JOIN transactions t ON s.sid = t.sid
LEFT JOIN purchases p ON t.tid = p.tid
LEFT JOIN products pr ON p.pid = pr.pid
WHERE t.pdate >= ADD_MONTHS(TRUNC(SYSDATE, 'Q'), -3) AND t.pdate < TRUNC(SYSDATE, 'Q')
GROUP BY s.name;

SELECT m.name AS customer_name, m.address
FROM members m
JOIN transactions t ON m.mid = t.mid
WHERE t.pdate >= TRUNC(SYSDATE, 'MM') - INTERVAL '1' MONTH AND t.pdate < TRUNC(SYSDATE, 'MM')
AND m.mid NOT IN (
	SELECT m.mid
	FROM members m
	JOIN transactions t ON m.mid = t.mid
	WHERE t.pdate >= TRUNC(SYSDATE, 'MM')
);
