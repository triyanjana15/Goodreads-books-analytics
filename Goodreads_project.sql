CREATE DATABASE books_db;
USE books_db;
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(500),
    authors VARCHAR(255),
    average_rating DECIMAL(3,2),
    isbn VARCHAR(20),
    isbn13 VARCHAR(20),
    language_code VARCHAR(10),
    num_pages INT,
    ratings_count INT,
    text_reviews_count INT,
    publication_date VARCHAR(20),
    publisher VARCHAR(255)
);
SELECT COUNT(*) FROM Books;

-- a) Top 10 highest-rated books
SELECT title, authors, average_rating
FROM Books
ORDER BY average_rating DESC, ratings_count DESC
LIMIT 10;

-- b) Most reviewed books
SELECT title, ratings_count
FROM Books
ORDER BY ratings_count DESC
LIMIT 10;

-- a) Top 5 authors by average rating (with > 5 books)
SELECT authors, ROUND(AVG(average_rating), 2) AS avg_rating, COUNT(*) AS total_books
FROM Books
GROUP BY authors
HAVING COUNT(*) > 5
ORDER BY avg_rating DESC
LIMIT 5;

-- b) Most common book language
SELECT language_code, COUNT(*) AS total_books
FROM Books
GROUP BY language_code
ORDER BY total_books DESC;

-- c) Average number of pages per publisher
SELECT publisher, ROUND(AVG(num_pages), 0) AS avg_pages
FROM Books
GROUP BY publisher
ORDER BY avg_pages DESC
LIMIT 10;

-- a) Trend: Books published per year
SELECT RIGHT(publication_date, 4) AS year, COUNT(*) AS total_books
FROM Books
GROUP BY year
ORDER BY year;

-- b) Recommendation logic — similar to a given author (J.K. Rowling)
SELECT title, authors, average_rating
FROM Books
WHERE authors = 'J.K. Rowling'
ORDER BY average_rating DESC;

-- c) Longest books
SELECT title, num_pages
FROM Books
ORDER BY num_pages DESC
LIMIT 10;


