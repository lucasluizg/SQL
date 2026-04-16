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
INSERT INTO Cor(idCor, nome, fabricante)
	VALUES('1', 'Preto', 'Lazzuril'),
		  ('2', 'Branco', 'PPG Industries'),
		  ('3', 'Azul', 'Glasurit'),
		  ('4', 'Verde', 'Sikkens'),
		  ('5', 'Vermelho', 'Roberlo');


INSERT INTO Automovel(chassi, modelo, idCor) 
	VALUES ('9BGRD08X04G117974', 'Celta', '1'),
		   ('7CDST72S61J358025', 'Uno', '2'),
	       ('2FRSA62D72U437348', 'Fiesta', '3'),
	       ('6CVCK31T41V293562', 'Etios', '4'),
	       ('3SFBC72D29F536231', 'March', '5');

-- Exercicio 3
CREATE TABLE Assunto (
	idAssunto INT NOT NULL,
	descricao VARCHAR(80),
	PRIMARY KEY(idAssunto)
);

CREATE TABLE Senha (
	dataHoraGerada DATETIME,
	inicioAtendimento TIME,
	fimAtendimento TIME,
	Numero VARCHAR(80) NOT NULL PRIMARY KEY,
	idAssunto INT NOT NULL,
	FOREIGN KEY(idAssunto) REFERENCES Assunto(idAssunto)
);

-- Exercicio 4
INSERT INTO Assunto (idAssunto, descricao)
	VALUES(1, 'Pagamento'),
		  (2, 'Cadastro'),
		  (3, 'Cancelamento'),
		  (4, 'Outros');

-- Exercicio 5
INSERT INTO Senha(idAssunto, Numero)
	VALUES(1, '19283'),
		  (1, '28374'),
		  (1, '37465'),
		  (2, '46519'),
		  (2, '27465'),
		  (4, '52938'),
		  (4, '63847'),
		  (4, '74121'),
		  (4, '81692'),
		  (4, '95756');

-- Exercicio 6
UPDATE Senha 
	SET inicioAtendimento = '18:31:27'	  
	WHERE Numero = '28374';
	
UPDATE Senha 
	SET inicioAtendimento = '14:23:43'
	WHERE Numero = '27465';

UPDATE Senha 
	SET inicioAtendimento = '09:34:13'
	WHERE Numero = '63847';
	
UPDATE Senha 
	SET inicioAtendimento = '07:27:37'
	WHERE Numero = '95756';