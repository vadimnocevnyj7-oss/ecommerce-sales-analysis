INSERT INTO customers (registration_date, city)
VALUES
('2024-01-10', 'Москва'),
('2024-01-15', 'Санкт-Петербург'),
('2024-02-01', 'Казань'),
('2024-02-10', 'Новосибирск'),
('2024-03-05', 'Екатеринбург'),
('2024-03-20', 'Москва'),
('2024-04-01', 'Самара'),
('2024-04-15', 'Москва'),
('2024-05-10', 'Пермь'),
('2024-05-25', 'Сочи');

INSERT INTO products (product_name, category, price)
VALUES
('iPhone 15', 'Electronics', 90000),
('Samsung Galaxy S24', 'Electronics', 80000),
('Ноутбук Lenovo', 'Electronics', 70000),
('Наушники Sony', 'Electronics', 15000),
('Клавиатура Logitech', 'Electronics', 7000),
('Кофеварка Bosch', 'Home', 20000),
('Пылесос Xiaomi', 'Home', 25000),
('Кресло офисное', 'Furniture', 30000),
('Стол компьютерный', 'Furniture', 20000),
('Книга по Python', 'Books', 1500);

INSERT INTO orders (customer_id, order_date, status)
VALUES
(1, '2024-01-20', 'completed'),
(2, '2024-01-25', 'completed'),
(3, '2024-02-10', 'completed'),
(4, '2024-02-15', 'cancelled'),
(5, '2024-03-01', 'completed'),
(6, '2024-03-12', 'completed'),
(7, '2024-04-05', 'completed'),
(8, '2024-04-20', 'cancelled'),
(9, '2024-05-10', 'completed'),
(10, '2024-05-25', 'completed'),
(1, '2024-06-01', 'completed'),
(3, '2024-06-15', 'completed'),
(5, '2024-07-01', 'completed'),
(7, '2024-07-18', 'completed'),
(2, '2024-08-05', 'completed');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 4, 2),

(2, 3, 1),
(2, 5, 1),

(3, 2, 1),
(3, 10, 2),

(4, 7, 1),

(5, 6, 1),
(5, 9, 1),

(6, 1, 1),
(6, 5, 1),

(7, 8, 1),
(7, 9, 2),

(8, 4, 1),

(9, 10, 3),

(10, 3, 1),
(10, 4, 1),

(11, 2, 1),

(12, 6, 2),

(13, 9, 1),

(14, 1, 1),

(15, 5, 2);