-- Exercicio 1
CREATE TABLE Confeiteiro (
	idConfeiteiro INT AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	dataNasc DATE NOT NULL,
	PRIMARY KEY(idConfeiteiro)
);

CREATE TABLE Bolo (
	idBolo INT AUTO_INCREMENT,
	sabor VARCHAR(45) NOT NULL,
	cobertura VARCHAR(45) NOT NULL,
	idConfeiteiro INT,
	PRIMARY KEY(idBolo),
	FOREIGN KEY(idConfeiteiro) REFERENCES Confeiteiro(idConfeiteiro)
);

-- Exercicio 2
INSERT INTO Confeiteiro(nome, dataNasc)
	VALUES('Joao', '1990-05-12'),
		  ('Maria', '1985-11-23'),
		  ('Carlos', '1992-07-01');

INSERT INTO Bolo(sabor, cobertura, idConfeiteiro)
	VALUES('Chocolate', 'Morango', 1),
		  ('Baunilha', 'Chocolate', 2),
		  ('Cenoura', 'Chocolate', 3),
		  ('Limão', 'Limão', 2),
		  ('Floresta Negra', 'Chantilly', 1);
