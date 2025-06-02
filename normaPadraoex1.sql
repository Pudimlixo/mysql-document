CREATE DATABASE normalizacaoEx;

USE normalizacaoEx;

-- Objetivo: Corrigir a tabela, usando a primeira forma normal de atomicidade dos dados

CREATE TABLE clientes(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(100) NOT NULL
);

INSERT INTO clientes(nome, endereco, telefone) VALUES
(
	"Vinicius","Rua Paulo Price SP","(11)9947-9838 (11)9826-2009"
),
(
    "Ana Silva","Avenida Brasil, 123 RJ","(21)9876-5432 (21)2345-6789"
),
(
    "Carlos Souza","Rua das Flores, 456 MG","(31)5555-1234 (31)9988-7766 (31)2233-4455"
);

-- Correção da tabela com forma normal

CREATE TABLE clientesN(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO clientesN(nome, endereco, estado) VALUES
('Vinícius', 'Rua Paulo Price, 123', 'SP'),
('Ana Silva', 'Avenida Brasil, 123', 'RJ'),
('Carlos Souza', 'Rua das Flores, 456', 'MG');

CREATE TABLE telefone_clientes(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(50) NOT NULL UNIQUE,
    cliente INT NOT NULL,
    FOREIGN KEY (cliente) REFERENCES clientesN(codigo)
);

INSERT INTO telefone_clientes(numero, cliente) VALUES
('(11)9947-9838',1),
('(11)9826-2009',1),
('(21)9876-5432',2),
('(21)2345-6789',2),
('(31)5555-1234',3),
('(31)9988-7766',3),
('(31)2233-4455',3);

SELECT * FROM clientesN;
SELECT * FROM telefone_clientes;

-- Para apagar quando causar erros

DROP TABLE telefone_clientes;
DROP TABLE clientesN;