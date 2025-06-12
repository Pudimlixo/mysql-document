-- Aplicação da Normalização de relações em tabelas - ex5;

CREATE TABLE projeto(
	codProj INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(200) NOT NULL
);

CREATE TABLE empregado(
	codProj INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    categoria VARCHAR(2) NOT NULL,
    sala INT NOT NULL,
    dataIni DATE NOT NULL,
    tempAi INT NOT NULL
);