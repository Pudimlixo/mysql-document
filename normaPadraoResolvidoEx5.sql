-- Aplicação da Normalização de relações em tabelas - ex5;

CREATE TABLE cliente(
	cd_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE locacao(
	cd_locacao INT PRIMARY KEY AUTO_INCREMENT,
    devolucao DATE NOT NULL,
    filme INT NOT NULL,
    cliente INT NOT NULL,
    FOREIGN KEY (filme) REFERENCES filme(cd_filme),
    FOREIGN KEY (cliente) REFERENCES cliente(cd_cliente)
);

CREATE TABLE filme(
    cd_filme INT PRIMARY KEY AUTO_INCREMENT,
    titulo_filme VARCHAR(50) NOT NULL
);

INSERT INTO cliente(nome) VALUES
('Ana Clara Souza'),
('Bruno Eduardo Costa'),
('Carla Dias Pereira'),
('Daniel Rodrigues Almeida');

INSERT INTO filme(titulo_filme) VALUES
('Aventura na Montanha'),
('O Segredo do Farol'),
('Código Enigma'),
('Viagem Estelar');

INSERT INTO locacao(devolucao, filme, cliente) VALUES
('2025-06-25', 1, 1),
('2025-06-26', 2, 2),
('2025-06-27', 3, 3),
('2025-06-28', 4, 1);

SELECT * FROM filme;
SELECT * FROM cliente;
SELECT * FROM locacao;