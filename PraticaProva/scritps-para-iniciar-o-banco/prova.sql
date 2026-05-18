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

-- Exercicio 3
UPDATE Confeiteiro 
	SET nome = 'Carlos Eduardo'
	WHERE nome = 'Carlos';

-- Exercicio 4
ALTER TABLE Bolo 
DROP FOREIGN KEY Bolo_ibfk_1;

ALTER TABLE Bolo
ADD CONSTRAINT Bolo_ibfk_1
FOREIGN KEY(idConfeiteiro) REFERENCES Confeiteiro(idConfeiteiro)
ON UPDATE CASCADE
ON DELETE CASCADE;

DELETE FROM Confeiteiro
	WHERE nome = 'Maria';

SELECT nome FROM Confeiteiro;

-- Parte 2 da prova.

-- Banco de Dados da parte 2:

CREATE TABLE GRAVADORA (
	idGravadora INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	pais VARCHAR(50) NOT NULL
) Engine InnoDB;

CREATE TABLE ARTISTA (
	idArtista INT AUTO_INCREMENT PRIMARY KEY,
	nomeArtista VARCHAR(100) NOT NULL,
	nacionalidade VARCHAR(50) NOT NULL
) Engine InnoDB;

CREATE TABLE ALBUM (
	idAlbum INT AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	ano INT NOT NULL,
	idArtista INT NOT NULL,
	idGravadora INT NOT NULL,
	FOREIGN KEY (idArtista) REFERENCES ARTISTA(idArtista),
	FOREIGN KEY (idGravadora) REFERENCES GRAVADORA(idGravadora)
) Engine InnoDB;

CREATE TABLE MUSICA (
	idMusica INT AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	duracao DECIMAL(3,1) NOT NULL,
	idAlbum INT NOT NULL,
	FOREIGN KEY (idAlbum) REFERENCES ALBUM(idAlbum)
) Engine InnoDB;
	
-- Gravadoras
INSERT INTO GRAVADORA (nome, pais) VALUES
	('Universal Music', 'EUA'),
	('Sony Music', 'EUA'),
	('Warner Music', 'EUA');

-- Artistas
INSERT INTO ARTISTA (nomeArtista, nacionalidade) VALUES
	('Taylor Swift', 'EUA'),
	('The Beatles', 'Reino Unido'),
	('IU', 'Coreia do Sul'),
	('Tom Jobim', 'Brasil');

-- Albuns
INSERT INTO ALBUM (titulo, ano, idArtista, idGravadora) VALUES
	('1989', 2014, 1, 1),
	('Evermore', 2020, 1, 2),
	('Abbey Road', 1969, 2, 1),
	('Lovelight', 2015, 3, 2),
	('Wave', 1967, 4, 3);

-- Musicas
INSERT INTO MUSICA (titulo, duracao, idAlbum) VALUES
	('Blank Space', 3.5, 1),
	('Style', 3.7, 1),
	('Willow', 3.4, 2),
	('Something', 3.0, 3),
	('Come Together', 4.2, 3),
	('Palette', 3.5, 4),
	('Chega de Saudade', 2.5, 5),
	('Wave', 4.0, 5);

-- Exercicio 5
SELECT nomeArtista FROM ARTISTA
	WHERE nomeArtista LIKE 'Tom%';

-- Exercicio 6
SELECT ARTISTA.nomeArtista
	FROM ARTISTA
	INNER JOIN ALBUM ON ALBUM.idArtista = ARTISTA.idArtista
	GROUP BY ARTISTA.nomeArtista
		HAVING COUNT(idAlbum) > 1;

-- Exercicio 7
SELECT GRAVADORA.nome, COUNT(ALBUM.titulo) as QuantidadeAlbuns
	FROM GRAVADORA
	INNER JOIN ALBUM ON ALBUM.idGravadora = GRAVADORA.idGravadora 
	GROUP BY GRAVADORA.nome;
	
-- Exercicio 8
SELECT ALBUM.titulo, ARTISTA.nomeArtista, GRAVADORA.nome
	FROM ALBUM
	INNER JOIN ARTISTA ON ARTISTA.idArtista = ALBUM.idArtista
	INNER JOIN GRAVADORA ON GRAVADORA.idGravadora = ALBUM.idGravadora;
	
-- Exercicio 9
SELECT MUSICA.titulo, ALBUM.titulo, ARTISTA.nomeArtista, GRAVADORA.nome	
	FROM MUSICA
	INNER JOIN ALBUM ON ALBUM.idAlbum = MUSICA.idAlbum
	INNER JOIN ARTISTA ON ARTISTA.idArtista = ALBUM.idArtista
	INNER JOIN GRAVADORA ON GRAVADORA.idGravadora = ALBUM.idGravadora
	WHERE ALBUM.ano >= 2015;

