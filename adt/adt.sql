

-- Example 1

SELECT datname FROM pg_database;
SELECT current_database();


SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

CREATE TYPE pan_number AS (
    first_five_chars CHAR(5),
    next_four_digits INTEGER,
    last_char CHAR(1)
);



CREATE TABLE employees (
    empid SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    photo BYTEA,
    pan_num_data pan_number
);

TRUNCATE TABLE employees;


INSERT INTO employees (name, age, photo, pan_num_data)
VALUES 
    ('Akshay Kumar', 30, E'\\xDEADBEEF', ROW('XYZT', 3214, 'F')),
    ('Dilip Joshi', 32, E'\\xDEACBEEE', ROW('LMNO', 7896, 'C')),
    ('Amitabh Bacchan', 35, E'\\xDEAFBEEE', ROW('ATEM', 8562, 'D')),
    ('Mohanlal', 40, E'\\xDEAEBAEE', ROW('VHFX', 4565, 'G'));

SELECT
    empid, name, age, photo,
    (pan_num_data).first_five_chars || (pan_num_data).next_four_digits || (pan_num_data).last_char AS pan_number
FROM employees;








-- Example 2

SELECT datname FROM pg_database;

SELECT current_database();

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'; -- Replace 'public' with your schema if needed

CREATE TYPE student_address AS (
    street_address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20)
);


CREATE TABLE students (
    prn INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    branch VARCHAR(50),
    address student_address);

INSERT INTO students (prn, name, age, branch, address)
VALUES
    (101, 'Rahul Kumar', 21, 'ELN', ROW('456 Gandhi Marg', 'Delhi', 'DL', '110001')::student_address),
    (102, 'Priya Singh', 23, 'IT', ROW('789 Nehru Nagar', 'Mumbai', 'MH', '400001')::student_address),
    (103, 'Vijay Thalapathy', 23, 'MECH', ROW('765 Vijay Nagar', 'Hyderabad', 'TL', '600501')::student_address),
    (104, 'Akshay Kumar', 22, 'IT', ROW('874 Akki Nagar', 'Mumbai', 'MH', '400001')::student_address),
    (105, 'Ananya Sharma', 20, 'CSE', ROW('101 Patel Street', 'Bangalore', 'KA', '560001')::student_address);

SELECT * FROM students;
  
SELECT prn, name, age, branch, (address).street_address, (address).city, (address).state, (address).postal_code
FROM students;

SELECT prn, name, age, branch, (address).street_address || (address).city || (address).state || (address).postal_code
FROM students;


