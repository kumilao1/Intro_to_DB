-- Create the alx_book_store database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the alx_book_store database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create the Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

-- Create the Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert sample data into Authors table
INSERT INTO Authors (author_name) VALUES
('George Orwell'),
('J.K. Rowling'),
('J.R.R. Tolkien');

-- Insert sample data into Books table
INSERT INTO Books (title, author_id, price, publication_date) VALUES
('1984', 1, 9.99, '1949-06-08'),
('Harry Potter and the Philosopher''s Stone', 2, 19.99, '1997-06-26'),
('The Hobbit', 3, 14.99, '1937-09-21');

-- Insert sample data into Customers table
INSERT INTO Customers (customer_name, email, address) VALUES
('Alice Johnson', 'alice.johnson@example.com', '123 Maple Street'),
('Bob Smith', 'bob.smith@example.com', '456 Oak Avenue');

-- Insert sample data into Orders table
INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2024-08-01'),
(2, '2024-08-02');

-- Insert sample data into Order_Details table
INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1);

