USE bookflow_db;
SELECT * FROM books;
SELECT * FROM members;
UPDATE members
SET full_name = 'Dd',
    email = 'dharanidharthumati@klh.edu.in'
WHERE member_id = 1;
UPDATE members
SET full_name = 'Rahul',
    email = 'rahul@gmail.com'
WHERE member_id = 2;
UPDATE members
SET full_name = 'Arjun',
    email = 'arjun@gmail.com'
WHERE member_id = 3;
SELECT * FROM members;
UPDATE books
SET published_year = 2023
WHERE book_id = 1;

UPDATE books
SET published_year = 2022
WHERE book_id = 2;

UPDATE books
SET published_year = 2024
WHERE book_id = 3;
DESCRIBE books;
DESCRIBE members;
INSERT INTO books (title, isbn, published_year)
VALUES ('Test Book', '9781234567890', 2020);
INSERT INTO books (title, isbn, published_year)
VALUES (NULL, '9999999999999', 2020);
INSERT INTO books (title, isbn, published_year)
VALUES ('Future Book', '8888888888888', 2030);
INSERT INTO books (title, isbn, published_year)
VALUES ('Future Book', '8888888888888', 2030);