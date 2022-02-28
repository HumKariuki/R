CREATE TABLE customers (
    id      INT NOT NULL,
    name    VARCHAR(20) NOT NULL,
    age     INT NOT NULL,
    address CHAR(25),
    salary  DECIMAL(18, 2),
    PRIMARY KEY ( id )
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    1,
    'Hum',
    23,
    'Kahuro',
    200000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    2,
    'Kariuki',
    11,
    'Muranga',
    150000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    3,
    'Jecinta',
    20,
    'Murarandia',
    20000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    4,
    'Mary',
    22,
    'Murarandia',
    70000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    5,
    'Rose',
    55,
    'Murarandia2',
    20000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    6,
    'Lucy',
    17,
    'Kangema',
    13000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    7,
    'Ken',
    67,
    'Thika',
    303000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    8,
    'Ann',
    87,
    'Zion',
    303000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    9,
    'Stacy',
    67,
    'Kisumu',
    103000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    12,
    'Purity',
    97,
    'Kangema',
    603000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    10,
    'Deci',
    97,
    'Kangema',
    603000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    11,
    'Ann Imelda',
    97,
    'Kangema',
    603000.00
);

INSERT INTO customers (
    id,
    name,
    age,
    address,
    salary
) VALUES (
    13,
    'Kewarz',
    98,
    'Nyeri',
    503000.00
);

SELECT
    *
FROM
    customers
ORDER BY
    name DESC;

SELECT
    *
FROM
    customers
ORDER BY
    id ASC;
select*from  customers drop column age;
    
SELECT
    * FROM
    customers
    
select name,count (*) from customers where name like 'k' group by name order by count(*) DESC;
                                                                         COUNT(*) help
    
    
    
    
    
    
    
    
    