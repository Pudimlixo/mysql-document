-- Aplicação da Normalização de relações em tabelas - ex6;

CREATE TABLE filme(
	cd_locacao INT PRIMARY KEY AUTO_INCREMENT,
    cd_filme INT AUTO_INCREMENT NOT NULL,
    titulo_filme VARCHAR(50) NOT NULL,
    devolucao DATE NOT NULL,
    cd_cliente INT AUTO_INCREMENT NOT NULL
);