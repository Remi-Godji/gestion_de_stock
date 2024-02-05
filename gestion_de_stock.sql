mysql> CREATE DATABASE store;
Query OK, 1 row affected (0.02 sec)

mysql> use store
Database changed
mysql> CREATE TABLE product (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(255),
    -> description TEXT,
    -> price INT,
    -> quantity INT,
    -> id_category INT
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE category (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO category (name) VALUES ('Electronics');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO category (name) VALUES ('Clothing');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO product (name, description, price, quantity, id_category) VALUES ('Laptop', 'Powerful laptop', 1200, 10, 1);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO product (name, description, price, quantity, id_category) VALUES ('T-Shirt', 'Comfortable cotton shirt', 20, 50, 2);
Query OK, 1 row affected (0.04 sec)
