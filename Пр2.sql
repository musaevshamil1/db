SELECT * FROM Readers; --1

SELECT title, publication_year FROM Books; --2

SELECT title, publication_year FROM Books WHERE publication_year BETWEEN 1801 AND 1900 --3

SELECT * FROM Books WHERE publication_year BETWEEN 1917 AND 1991 --4

SELECT * FROM Readers WHERE phone = '+7-900-999-88-77'; --5 

SELECT * FROM Readers WHERE full_name LIKE '%ов'; --6

SELECT * FROM loans where actual_return_date IS NULL; --7

SELECT title, publication_year FROM books ORDER BY title;--8

SELECT * FROM loans WHERE actual_return_date IS NULL ORDER BY planned_return_date; --9

--10
SELECT * FROM books ORDER BY publication_year LIMIT 3;

SELECT * FROM books ORDER BY publication_year DESC LIMIT 3;

SELECT * FROM books ORDER BY title  LIMIT 3;
