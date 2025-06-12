-- Aplicação da Normalização de relações em tabelas - ex2;

CREATE DATABASE normalizacaorelacoes;

USE normalizacaorelacoes;

-- Tabela normalizada

CREATE TABLE fornecedores(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL
);

CREATE TABLE tel_fornecedor(
	id INT PRIMARY KEY AUTO_INCREMENT,
	numero VARCHAR(30) NOT NULL UNIQUE,
    fornecedor INT NOT NULL,
    FOREIGN KEY (fornecedor) REFERENCES fornecedores(id)
);

CREATE TABLE endereco_fornecedor(
	id INT PRIMARY KEY AUTO_INCREMENT,
	rua VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    CEP VARCHAR(20) NOT NULL,
    fornecedor INT NOT NULL,
    FOREIGN KEY (fornecedor) REFERENCES fornecedores(id)
);

CREATE TABLE pecas(
	idPeca VARCHAR(50) NOT NULL,
    nomePeca VARCHAR(20) NOT NULL,
    preco FLOAT NOT NULL,
    qntdpecapedida INT NOT NULL
);

INSERT INTO fornecedores (nome) VALUES
('ABC Suprimentos'),
('Tecno Componentes'),
('Eletro Peças Ltda'),
('Peças & Cia');

INSERT INTO tel_fornecedor (numero, fornecedor) VALUES
('(11)98765-4321', 1),
('(11)99887-6655', 1),
('(21)91234-5678', 2),
('(21)98765-4321', 2), 
('(31)92345-6789', 3),
('(31)93456-7890', 3),
('(41)94567-8901', 4),
('(41)95678-9012', 4);

INSERT INTO endereco_fornecedor (rua, cidade, estado, CEP, fornecedor) VALUES
('Rua Alfa', 'São Paulo', 'SP', '01000-000', 1),
('Av. Beta', 'Rio de Janeiro', 'RJ', '20000-000', 2),
('Rua Gama', 'Belo Horizonte', 'MG', '30000-000', 3),
('Travessa Delta', 'Curitiba', 'PR', '80000-000', 4);

INSERT INTO pecas (idPeca, nomePeca, preco, qntdpecapedida) VALUES
('PEC001', 'Parafuso M8', 15.50, 100),
('PEC002', 'Placa de Circuito', 250.00, 50),
('PEC003', 'Fio de Cobre', 5.75, 200),
('PEC004', 'Sensor', 80.00, 30);


SELECT * FROM fornecedores;
SELECT * FROM tel_fornecedor;
SELECT * FROM endereco_fornecedor;
SELECT * FROM pecas;

SHOW TABLES;
