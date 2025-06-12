-- Aplicação da Normalização de relações em tabelas - ex4;

CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL 
);