-- CREATES A TABLE `books` IN THE `alx_book_store` DATABASE
CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
-- CREATES A TABLE `authors` IN THE `alx_book_store` DATABASE
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) 
);

-- CREATES A TABLE `customers` IN THE `alx_book_store` DATABASE
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);
-- CREATES A TABLE `orders` IN THE `alx_book_store` DATABASE
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- CREATES A TABLE `order_items` IN THE `alx_book_store` DATABASE
CREATE TABLE IF NOT EXISTS order_items (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);