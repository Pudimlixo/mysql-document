-- Aplicação da Normalização de relações em tabelas - ex4;

CREATE TABLE empregado(
	codEmp INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    categoria VARCHAR(2) NOT NULL,
    sala INT NOT NULL,
    dataIni DATE NOT NULL,
    tempAi INT NOT NULL
);

CREATE TABLE projeto(
	codProj INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    codEmp INT,
    FOREIGN KEY (codEmp) REFERENCES empregado(codEmp)
);

INSERT INTO empregado(nome, categoria, sala, dataIni, tempAi) VALUES
('João Silva', 'JR', 101, '2020-01-15', 3),
('Maria Souza', 'PL', 203, '2018-05-20', 5),
('Pedro Lima', 'SR', 305, '2015-11-10', 8),
('Ana Costa', 'JR', 102, '2022-03-01', 1);


INSERT INTO projeto(tipo, descricao, codEmp) VALUES
('Dev Web', 'Criação de um novo portal de e-commerce.', 1),
('Análise de Dados', 'Estudo de mercado para novo produto.', 2),
('Consultoria de TI', 'Otimização de infraestrutura de rede.', 3),
('Suporte ao Cliente', 'Implementação de sistema de tickets.', 1);


SELECT * FROM projeto;
SELECT * FROM empregado;