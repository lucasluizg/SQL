CREATE TABLE Departamento (
  idDepartamento int(11) NOT NULL,
  dNome varchar(255) NOT NULL,
  Orcamento decimal(10,0) NOT NULL,
  PRIMARY KEY (idDepartamento)
);

INSERT INTO Departamento VALUES
(1,'Financeiro',15000),
(2,'TI',60000),
(3,'Gestão de Pessoas',150000),
(4,'Pesquisa e Desenvolvimento',7500),
(5,'Jurídico',1000);

CREATE TABLE Funcionario (
  idFuncionario INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Sobrenome VARCHAR(45) NOT NULL,
  idDepartamento INT NOT NULL,
  PRIMARY KEY (idFuncionario),
  CONSTRAINT fk_Funcionario_Departamento FOREIGN KEY (idDepartamento)
    REFERENCES Departamento (idDepartamento)
);

INSERT INTO Funcionario VALUES
(123,'Julio','Silva',1),
(152,'Arnaldo','Coelho',1),
(222,'Carol','Ferreira',2),
(326,'João','Silveira',2),
(331,'George','de la Rocha',3),
(332,'José','Oliveira',1),
(546,'José','Pereira',4),
(631,'David','Luz',3),
(654,'Zacarias','Ferreira',4),
(745,'Eric','Estrada',4),
(845,'Elizabeth','Coelho',1),
(846,'Joaquim','Goveia',1);

-- Exercicio 1
SELECT Sobrenome FROM Funcionario;

-- Exercicio 2
SELECT DISTINCT Sobrenome FROM Funcionario;

-- Exercicio 3
SELECT dNome FROM Departamento
WHERE Orcamento > 15000;

-- Exercicio 4
SELECT * FROM Funcionario
WHERE Sobrenome = 'Coelho' || 'Pereira'
ORDER by Nome;

-- Exercicio 5
SELECT * FROM Funcionario
WHERE idDepartamento = 1;

-- Exercicio 6
SELECT DISTINCT Nome FROM Funcionario
WHERE idDepartamento = 1 || 2;

-- Exercicio 7
SELECT DISTINCT Nome, Sobrenome FROM Funcionario
WHERE Sobrenome LIKE '%eira'
ORDER by Nome, Sobrenome;

-- Exercicio 8
SELECT SUM(Orcamento) FROM Departamento;

-- Exercicio 9
SELECT idDepartamento, COUNT(*) AS total FROM Funcionario
GROUP BY idDepartamento;

-- Exercicio 10
INSERT INTO Departamento(idDepartamento, dNome, Orcamento)
	VALUES(6, 'Compras', 100000);

INSERT INTO Funcionario(idFuncionario, Nome, Sobrenome, idDepartamento)
	VALUES(786, 'Juliano', 'Souza', 6);
	
-- Exercicio 11
SELECT Orcamento * 0.9 FROM Departamento;

-- Exercicio 12
DELETE FROM Departamento
WHERE dNome = 'Pesquisa e Desenvolvimento';

-- Exercicio 13
SELECT * FROM Funcionario
WHERE idDepartamento = 4;

UPDATE Funcionario SET idDepartamento = 2 WHERE idDepartamento = 4;

-- Exercicio 14
INSERT INTO Funcionario(idFuncionario, Nome, Sobrenome, idDepartamento)
	VALUES(123, 'Paulo', 'Aguiar', 4)
    
-- Exercicio 15
DELETE FROM Funcionario WHERE idDepartamento = 2;

-- Exercicio 16
INSERT INTO Funcionario (idFuncionario, Nome, Sobrenome, idDepartamento)
	VALUES(1001, 'Lucas', 'Guesser', 1),
		  (1002, 'Helena', 'Mazzini', 1),
		  (1003, 'Jean', 'Santos', 1);