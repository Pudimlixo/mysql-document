CREATE DATABASE db_firmaProdutosLimpeza;
USE db_firmaProdutosLimpeza;

CREATE TABLE categorias(
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(50) NOT NULL UNIQUE
);
 
INSERT INTO categorias(
	nome
) 
VALUES 
('Limpeza Geral'),
('Sabão em pó'),
('Desinfetante'),
('Amaciante'),
('Cloro');

CREATE TABLE endereco(
	id INT PRIMARY KEY AUTO_INCREMENT,
	logradouro VARCHAR(100) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    
    CONSTRAINT checar_cidade CHECK (cidade = 'São Paulo' OR cidade = 'Rio de Janeiro' 
    OR cidade = 'Belo Horizonte' OR cidade = 'Porto Alegre' OR cidade = 'Curitiba'
    OR cidade = 'Brasília' OR cidade = 'Salvador' OR cidade = 'Manaus' OR cidade = 'Fortaleza'
    OR cidade = 'Recife'),
    
    CONSTRAINT checar_bairro CHECK (bairro = 'Jardim Alegre' OR bairro = 'Centro' OR 
    bairro = 'Boa Vista' OR bairro = 'Vila Nova' 
    OR bairro = 'Floresta' OR bairro = 'Independência'
	OR bairro = 'Liberdade' OR bairro = 'Campo Belo' OR bairro = 'Praia Grande' OR bairro = 'Campo Belo'
    OR bairro = 'União')
);

INSERT INTO endereco(
	logradouro, CEP, numero, bairro, cidade
) VALUES 
('Rua das Flores', '01234567', 123, 'Jardim Alegre', 'São Paulo'),
('Avenida Principal', '98765432', 456, 'Centro', 'Rio de Janeiro'),
('Travessa da Paz', '11223344', 789, 'Boa Vista', 'Belo Horizonte'),
('Rua dos Girassóis', '55667788', 101, 'Vila Nova', 'Porto Alegre'),
('Alameda dos Bosques', '22334455', 222, 'Floresta', 'Curitiba'),
('Praça da Bandeira', '66778899', 457, 'Independência', 'Brasília'),
('Rua da Liberdade', '33445566', 9019, 'Liberdade', 'Salvador'),
('Estrada do Sol', '77889900', 444, 'Praia Grande', 'Fortaleza'),
('Rua dos Cravos', '44556677', 555, 'Campo Belo', 'Manaus'),
('Avenida das Palmeiras', '88990011', 666, 'União', 'Recife');

CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    telefone VARCHAR(12) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    limite FLOAT NOT NULL DEFAULT 1000.00,
    id_endereco INT, 
    FOREIGN KEY (id_endereco) REFERENCES endereco(id)
);

INSERT INTO clientes(
	telefone, nome, limite, id_endereco
) VALUES
('11987654321', 'Ana Souza', 1500.00, 1),
('21998765432', 'Pedro Oliveira', 2000.50, 2),
('31988776655', 'Mariana Costa', 1000.75, 3),
('41999887766', 'Lucas Pereira', 2500.00, 4),
('51977665544', 'Sofia Rocha', 1250.90, 5),
('61966554433', 'Gabriel Santos', 1800.00, 6),
('71955443322', 'Isabela Almeida', 900.50, 7),
('81944332211', 'Rafael Ferreira', 3000.00, 8),
('91933221100', 'Juliana Gomes', 1100.25, 9),
('27922110099', 'Bruno Rodrigues', 2200, 10);

CREATE TABLE pedido(
	numero INT PRIMARY KEY AUTO_INCREMENT,
    data_elaboracao DATE NOT NULL,
    id_cliente INT, 
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

INSERT INTO pedido(
	data_elaboracao, id_cliente
) VALUES
('2025-04-20', 1),
('2025-04-20', 2),
('2025-04-20', 3),
('2025-04-21', 4),
('2025-04-21', 5),
('2025-04-21', 1),
('2025-04-22', 6),
('2025-04-22', 7),
('2025-04-22', 8),
('2025-04-23', 9),
('2025-04-23', 10),
('2025-04-23', 2),
('2025-04-24', 3),
('2025-04-24', 4),
('2025-04-24', 5),
('2025-04-25', 6),
('2025-04-25', 7),
('2025-04-25', 1),
('2025-04-26', 8),
('2025-04-26', 9),
('2025-04-26', 10),
('2025-04-27', 2),
('2025-04-27', 3),
('2025-04-27', 4),
('2025-04-28', 5),
('2025-04-28', 1),
('2025-04-28', 6),
('2025-04-29', 7),
('2025-04-29', 8),
('2025-04-29', 9);

CREATE TABLE produtos(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco FLOAT NOT NULL,
    id_categoria INT, FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

INSERT INTO produtos(
	nome, preco, id_categoria
) VALUES 
('Detergente Líquido Concentrado', 8.50, 1),
('Desinfetante Multiuso Lavanda', 12.99, 2),
('Limpa Forno Cremoso', 9.75, 3),
('Limpa Vidros Spray', 6.20, 1),
('Água Sanitária Tradicional', 5.00, 2),
('Sabão em Pó Ativo', 15.80, 5),
('Alvejante sem Cloro', 11.50, 5),
('Limpeza Pesada Desincrustante', 19.90, 1),
('Limpa Banheiro Gel', 10.30, 4),
('Lustra Móveis Perfumado', 7.60, 1);

CREATE TABLE produto_pedido(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT, 
    FOREIGN KEY (id_pedido) REFERENCES pedido(numero),
    id_produto INT, 
    FOREIGN KEY (id_produto) REFERENCES produtos(codigo),
    quantidade INT NOT NULL
);

INSERT INTO produto_pedido(
	id_pedido, id_produto, quantidade
) VALUES 
(1, 3, 2),
(1, 7, 1),
(2, 1, 3),
(2, 5, 2),
(3, 9, 1),
(4, 2, 4),
(4, 6, 1),
(5, 8, 2),
(5, 10, 3),
(6, 4, 1),
(7, 3, 2),
(7, 7, 1),
(8, 1, 1),
(8, 9, 3),
(9, 5, 2),
(9, 2, 1),
(10, 6, 2),
(11, 8, 1),
(11, 10, 2),
(12, 4, 3),
(13, 3, 1),
(13, 7, 2),
(14, 1, 2),
(14, 5, 1),
(15, 9, 3),
(16, 2, 2),
(16, 6, 1),
(17, 8, 2),
(18, 10, 1),
(19, 4, 3);

-- Consultas realizadas:

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM endereco;
SELECT * FROM pedido;
SELECT * FROM produtos;
SELECT * FROM produto_pedido;
