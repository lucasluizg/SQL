-- Exercicio 1
CREATE TABLE Aluno(
	nome VARCHAR(80),
	email VARCHAR(80),
	matricula INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(matricula)
);

CREATE TABLE Professor (
	Nome VARCHAR(80),
	TempoDeCasa DATE,
	SIAPE INT NOT NULL,
	PRIMARY KEY(SIAPE)
);

ALTER TABLE Professor CHANGE COLUMN TempoDeCasa TempoDeCasa DATE;

CREATE TABLE Disciplina(
	CargaHoraria INT,
	Semestre INT, 	
	Nome VARCHAR(80),
	Cod INT NOT NULL,
	SIAPE INT,
	PRIMARY KEY(Cod),
	FOREIGN KEY(SIAPE) REFERENCES Professor(SIAPE),
);

CREATE TABLE Faz (
	Estado VARCHAR(80),
	matricula INT,
	Cod INT,
	FOREIGN KEY(matricula) REFERENCES Aluno(matricula),
	FOREIGN KEY(Cod) REFERENCES Disciplina(Cod)
);

CREATE TABLE PreRequisito ( -- Exercicio 4 originalmente não coloquei.
	CodPreRequisito INT NOT NULL,
	CodDisciplina INT,
	FOREIGN KEY(CodDisciplina) REFERENCES Disciplina(Cod)
);

-- Exercicio 2
ALTER TABLE Professor ADD COLUMN Email VARCHAR(80);

INSERT INTO Professor(SIAPE, Nome, Email, TempoDeCasa)
	VALUES(1001, 'Maria Luz', 'maria.luz@ifsc.edu.br', '2015-03-10'),
		  (1002, 'Carlos Eduardo Silva', 'carlos.silva@ifsc.edu.br', '2012-07-01'),
		  (1003, 'Fernanda Costa', 'fernada.costa@ifsc.edu.br', '2018-11-23'),
		  (1004, 'João Pedro Almeida', 'joao.almeida@ifsc.edu.br', '2014-05-15'),
		  (1005, 'Mariana Gonçalves', 'mariana.goncalves@ifsc.edu.br', '2016-09-30');

-- Exercicio 3
INSERT INTO Disciplina(Cod, Nome, Semestre, CargaHoraria, SIAPE)
	VALUES(101, 'Matemática I', 1, 60, 1001),
		  (102, 'Introdução à Programação', 1, 80, 1002),	
		  (103, 'Física I', 1, 60, 1003),
		  (201, 'Algoritmos', 2, 80, 1002),
		  (202, 'Estruturas de Dados', 2, 80, 1004),
		  (203, 'Matemática II', 2, 60, 1001),
		  (301, 'Banco de Dados', 3, 80, 1005),
		  (302, 'Redes de Computadores', 3, 60, 1003),
		  (303, 'Sistemas Operacionais', 3, 80, 1004),
		  (401, 'Programação Orientada à Objetos', 4, 80, 1002),
		  (402, 'Engenharia de Software', 4, 60, 1005),
		  (403, 'Segurança da Informação', 4, 60, 1003),
		  (501, 'Inteligência Artificial', 5, 80, 1002),
		  (502, 'Computação em Nuvem', 5, 80, 1005),
		  (503, 'Projeto de Sistemas', 5, 80, 1004);
 
-- Exercicio 4
INSERT INTO PreRequisito(CodDisciplina, CodPreRequisito)
	VALUES(201, 102),
		  (203, 101),
		  (301, 202),
		  (302, 103),
		  (303, 202),
		  (401, 201),
		  (401, 203),
		  (403, 303),
		  (501, 203),
		  (501, 402),
		  (502, 302),
		  (503, 402),
		  (503, 303);

-- Exercicio 5
INSERT INTO Aluno(nome, email, matricula)
	VALUES('Lucas Luiz Guesser', 'lucas.lg17@ifsc.edu.br', '2024208');

-- Exercicio 6
INSERT INTO Faz(Cod, matricula, Estado)
	VALUES(101, 2024208, 'Concluído'),
		  (102, 2024208, 'Concluído'),
		  (103, 2024208, 'Concluído'),
		  (201, 2024208, 'Concluído'),
		  (202, 2024208, 'Cursando'),
		  (203, 2024208, 'Cursando'),
		  (301, 2024208, 'Trancado'),
		  (302, 2024208, 'Cursando');

-- Exercicio 7
SELECT Disciplina.Nome, Professor.Nome
	FROM Disciplina 
	INNER JOIN Professor ON Disciplina.SIAPE = Professor.SIAPE;

-- Exercicio 8
SELECT Disciplina.Nome
	FROM Aluno 
	INNER JOIN Faz INNER JOIN Disciplina ON Aluno.matricula = Faz.matricula AND Disciplina.Cod = Faz.Cod 
	WHERE Faz.Estado = 'Cursando' AND Aluno.nome = 'Lucas Luiz Guesser'; 
	
-- Exercicio 9
SELECT Disciplina.Nome, Disciplina.Semestre, Faz.Estado
	FROM Aluno 
	INNER JOIN Faz INNER JOIN Disciplina ON Aluno.matricula = Faz.matricula AND Disciplina.Cod = Faz.Cod 
	WHERE Aluno.nome = 'Lucas Luiz Guesser';

-- Exercicio 10
SELECT Disciplina.Nome, Disciplina.CargaHoraria
	FROM Disciplina 
	WHERE CargaHoraria > 70;

-- Exercicio 11
SELECT Disciplina.Nome
	FROM Disciplina 
	LEFT JOIN PreRequisito ON Disciplina.Cod = PreRequisito.CodDisciplina 
	WHERE PreRequisito.CodDisciplina IS NULL;

-- Exercicio 12
UPDATE Faz
	SET Estado = 'Cursando'
	WHERE Estado = 'Trancado' AND matricula = 2024208;

SELECT Estado FROM Faz;

-- Exercicio 13
UPDATE Faz INNER JOIN Disciplina ON Faz.Cod = Disciplina.Cod
	SET Faz.Estado = 'Concluido'
	WHERE Faz.Estado = 'Cursando' AND Disciplina.Semestre = 2;

SELECT * FROM Faz;

-- Exercicio 14
SELECT Professor.Nome, COUNT(Disciplina.Nome) AS QuantidadeDisciplinas 
	FROM Professor
	INNER JOIN Disciplina ON Professor.SIAPE = Disciplina.SIAPE
	GROUP BY Professor.Nome;

-- Exercicio 15
SELECT Aluno.Nome, COUNT(Faz.Estado) AS QuantidadeConcluidas 
	FROM Aluno 
	INNER JOIN Faz ON Aluno.matricula = Faz.matricula
	WHERE Faz.Estado = 'Concluído'
	GROUP BY Aluno.Nome; 
	
-- Exercicio 16
SELECT Disciplina.Nome, Professor.Nome
	FROM PreRequisito 
	INNER JOIN Disciplina INNER JOIN Professor ON Disciplina.Cod = PreRequisito.CodPreRequisito AND Disciplina.SIAPE = Professor.SIAPE
	WHERE PreRequisito.CodDisciplina = 301;

-- Exercicio 17
SELECT Disciplina.Nome, Professor.Nome, Disciplina.CargaHoraria
	FROM Faz
	INNER JOIN Disciplina INNER JOIN Professor
	ON Disciplina.Cod = Faz.Cod AND Professor.SIAPE = Disciplina.SIAPE
	WHERE Faz.Estado = 'Concluído';




