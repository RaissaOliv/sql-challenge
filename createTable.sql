-- Tabela de Produtos
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Vendas
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sale_price DECIMAL(10, 2) NOT NULL,
    sale_date DATE NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);


-- Produtos
INSERT INTO products (name, description, price)
VALUES
    ('Tênis esportivo', 'Tênis para corrida com amortecimento', 150.00),
    ('Camiseta básica', 'Camiseta de algodão unissex', 20.00),
    ('Calça jeans', 'Calça jeans slim fit', 60.00),
    ('Relógio de pulso', 'Relógio analógico com pulseira de couro', 100.00),
    ('Bolsa de couro', 'Bolsa tiracolo em couro sintético', 45.00),
    ('Óculos de sol', 'Óculos estilo aviador', 30.00),
    ('Chapéu de palha', 'Chapéu de palha para praia', 15.00),
    ('Brincos de prata', 'Brincos pequenos em prata 925', 25.00),
    ('Cinto de couro', 'Cinto marrom com fivela dourada', 18.00),
    ('Meias coloridas', 'Pacote com 5 pares de meias', 12.00);

-- Vendas
INSERT INTO sales (product_id, quantity, sale_price, sale_date)
VALUES
    (1, 3, 135.00, '2024-02-01'),
    (2, 2, 40.00, '2024-02-02'),
    (3, 1, 60.00, '2024-02-03'),
    (4, 1, 90.00, '2024-02-04'),
    (5, 4, 180.00, '2024-02-05'),
    (6, 2, 50.00, '2024-02-06'),
    (7, 1, 12.00, '2024-02-07'),
    (8, 2, 50.00, '2024-02-08'),
    (9, 1, 25.00, '2024-02-09'),
    (10, 3, 36.00, '2024-02-10'),
    (1, 2, 90.00, '2024-02-11'),
    (2, 1, 20.00, '2024-02-12'),
    (3, 3, 180.00, '2024-02-13'),
    (4, 1, 90.00, '2024-02-14'),
    (5, 2, 90.00, '2024-02-15'),
    (6, 1, 30.00, '2024-02-16'),
    (7, 2, 24.00, '2024-02-17'),
    (8, 1, 50.00, '2024-02-18'),
    (9, 3, 75.00, '2024-02-19'),
    (10, 1, 12.00, '2024-02-20');

-- select vendas de tênis de 01 de março até 04 de março de 2024 :)
SELECT s.created_at,p.name, s.sale_id from sales s
join products p on p.product_id = s.product_id
WHERE s.created_at >='2024-03-01'
AND s.created_at <= '2024-03-05'
AND p.name='Tênis Esportivo'

