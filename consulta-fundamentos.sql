/* Uso do comando USE para selecionar o banco de dados que desejo manipular*/

USE sakila;

-- Treino com conceitos de consulta de dados

-- Seleção de atributo com SELECT e de tabela com FROM
SELECT first_name, last_name FROM actor;

-- Seleção de todas as colunas de uma tabela dada por *

SELECT * FROM category;

-- Seleção de colunas de uma tabela, porém com filtro de que registros se quer ver com WHERE

SELECT title, description FROM film WHERE film_id = 20;



