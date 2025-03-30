CREATE TABLE supplier(
SNO TEXT PRIMARY KEY,
SNAME TEXT,
STATUS INTEGER,
CITY TEXT
);

INSERT INTO supplier (SNO, SNAME, STATUS, CITY) VALUES
('S1', 'Smith', 20, 'London'),
('S2', 'Jones', 10, 'Paris'),
('S3', 'Blake', 30, 'London'),
('S4', 'Clarke', 10, 'New York'),
('S5', 'Adams', 20, 'Mumbai');

SELECT SNAME, CITY FROM supplier;

DROP TABLE supplier;

SELECT * FROM supplier
WHERE CITY = 'London';

SELECT * FROM supplier
WHERE STATUS BETWEEN 10 AND 20;

SELECT * FROM supplier
WHERE SNAME LIKE 'S%';

SELECT * FROM supplier 
WHERE CITY IN ('London', 'Paris') 



