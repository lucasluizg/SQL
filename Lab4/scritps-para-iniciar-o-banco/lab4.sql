-- Exercicio 1
CREATE TABLE Bolo(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(80) NOT NULL,
	preco INT CHECK(preco >= 0),
	quantidade INT CHECK(quantidade >= 0),
	PRIMARY KEY(id)
);

-- Exercicio 2
INSERT INTO Bolo(nome, preco, quantidade)
	VALUES('Bolo de chocolate', 50, 10),
		  ('Bolo de cenoura', 30, 5),
		  ('Bolo de laranja', 40, 7),
		  ('Torta alemã', 60, 8),
		  ('Bolo Marta Rocha', 120, 3);

-- Exercicio 3
INSERT INTO Bolo(nome, preco, quantidade)
	VALUES('Bolo de morango', -20, 4);

-- Apareceu Erro SQL [3819] [HY000]: Check constraint 'Bolo_chk_1' is violated.

-- Exercicio 4
INSERT INTO Bolo(nome, preco, quantidade)
	VALUES('Bolo com chantilly', 18, -10);

-- Apareceu Erro SQL [3819] [HY000]: Check constraint 'Bolo_chk_2' is violated.

-- Exercicio 5
SELECT nome, quantidade,
	CASE 
		WHEN quantidade = 0 THEN 'Sem estoque'
		WHEN quantidade BETWEEN 1 AND 4 THEN 'Baixo'
		ELSE 'Normal'
	END AS estoque
FROM Bolo;

-- Exercicio 6
SELECT quantidade FROM Bolo
	WHERE quantidade BETWEEN 1 AND 4;

-- Exercicio 7
ALTER TABLE Bolo ADD Column categoria VARCHAR(80);

-- Exercicio 8
SELECT nome,
	CASE
		WHEN nome = 'Bolo de cenoura' OR nome = 'Bolo de laranja' THEN 'Bolos Suaves'
		WHEN nome = 'Bolo de chocolate' OR nome = 'Torta alemã' THEN 'Bolos doces'
		WHEN nome = 'Bolo Marta Rocha' THEN 'Bolos Especiais'	
	END AS categoria
FROM Bolo;

-- Exercicio 9
SELECT nome,
	CASE
		WHEN nome = 'Bolo de cenoura' OR nome = 'Bolo de laranja' THEN 'Bolos Suaves'
		WHEN nome = 'Bolo de chocolate' OR nome = 'Torta alemã' THEN 'Bolos doces'
		WHEN nome = 'Bolo Marta Rocha' THEN 'Bolos Especiais'	
	END AS categoria,

	CASE
		WHEN preco BETWEEN 0 AND 35 THEN 'Barato'
		WHEN preco BETWEEN 36 AND 50 THEN 'Médio'
		ELSE 'Caro'
	END AS faixaDePreco
FROM Bolo;

-- Exercicio 10
CREATE TABLE Venda(
	idVenda INT NOT NULL AUTO_INCREMENT,
	idBolo INT,
	dataVenda DATE,
	quantidadeVendida INT CHECK(quantidadeVendida >= 0),
	PRIMARY KEY(idVenda),
	FOREIGN KEY(idBolo) REFERENCES Bolo(id)
);

-- Exercicio 11
START TRANSACTION;
	UPDATE Bolo SET quantidade = quantidade - 2 WHERE id = 1;
	INSERT INTO Venda(idBolo, quantidadeVendida)
		VALUES(1, 2);
	COMMIT;

-- Exercicio 12
SELECT id, quantidade FROM Bolo
	WHERE id = 1;

-- Exercicio 13
START TRANSACTION;
	UPDATE Bolo SET quantidade = quantidade - 1 WHERE id = 2;
	INSERT INTO Venda(idBolo, quantidadeVendida)
		VALUES(2, 1);
	ROLLBACK;

SELECT id, quantidade FROM Bolo
	WHERE id = 2;

SELECT idBolo, quantidadeVendida FROM Venda
	WHERE idBolo = 2;

-- Exercicio 14

-- O ROLLBACK excluiu todas as transações feitas no Exercício 13, assim o estoque do Bolo de id = 2 ficou inalterado.

-- Transação com COMMIT.
START TRANSACTION;
	UPDATE Bolo SET quantidade = quantidade - 1 WHERE id = 2;
	INSERT INTO Venda(idBolo, quantidadeVendida)
		VALUES(2, 1);
	COMMIT;

-- Exercicio 15
START TRANSACTION;
	UPDATE Bolo SET quantidade = quantidade - 1 WHERE id = 3;
COMMIT;

-- Exercicio 16
SELECT Bolo.nome, SUM(Venda.quantidadeVendida) AS quantidadeVendida FROM Bolo
	INNER JOIN Venda ON Venda.idBolo = Bolo.id
	GROUP BY Bolo.nome;

