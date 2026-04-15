-- Exercicio 1
CREATE TABLE Cor (
	idCor VARCHAR(80) NOT NULL,
	nome VARCHAR(80),
	fabricante VARCHAR(80),
	PRIMARY KEY(idCor)
);

CREATE TABLE Automovel (
	chassi VARCHAR(80) NOT NULL PRIMARY KEY,
	modelo VARCHAR(80),
	idCor VARCHAR(80),
	FOREIGN KEY(idCor) REFERENCES Cor(idCor)
);

-- Exercicio 2
