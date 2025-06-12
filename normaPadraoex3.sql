-- Aplicação da Normalização de relações em tabelas - ex3;

CREATE TABLE aluno(
	id INT PRIMARY KEY AUTO_INCREMENT,
    matricula INT NOT NULL UNIQUE,
    nome VARCHAR(20) NOT NULL,
    turma VARCHAR(10) NOT NULL,
    CONSTRAINT ver_turma CHECK (turma = "1°info" or turma = "2°info" or turma = "3°info")
);

CREATE TABLE endereco_aluno(
	id INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    aluno INT NOT NULL,
    FOREIGN KEY (aluno) REFERENCES aluno(id),
    CONSTRAINT ver_logradouro CHECK (logradouro = "Rua das pedras" or logradouro = "Rua da lagosta"
    or logradouro = "Rua dos lírios")
);

CREATE TABLE materias_aluno(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nomeMateria VARCHAR(30) NOT NULL,
    aluno INT NOT NULL,
    FOREIGN KEY (aluno) REFERENCES aluno(id),
    CONSTRAINT ver_materia CHECK (nomeMateria = "ECO" or nomeMateria = "BIO" or nomeMateria = "ENG")
);

INSERT INTO aluno (matricula, nome, turma) VALUES
(1001, 'João Silva', '1°info'),
(1002, 'Maria Souza', '2°info'),
(1003, 'Pedro Alves', '3°info'),
(1004, 'Ana Costa', '1°info'),
(1005, 'Bruno Lima', '2°info');


INSERT INTO endereco_aluno (logradouro, cep, aluno) VALUES
('Rua das pedras', '12345-678', 1),
('Rua da lagosta', '87654-321', 2),
('Rua dos lírios', '98765-432', 3), 
('Rua das pedras', '11223-344', 4), 
('Rua da lagosta', '55667-788', 5);

INSERT INTO materias_aluno (nomeMateria, aluno) VALUES
('ECO', 1), 
('BIO', 1), 
('ENG', 2), 
('ECO', 3), 
('BIO', 4); 

SELECT * FROM aluno;
SELECT * FROM endereco_aluno;
SELECT * FROM materias_aluno;
