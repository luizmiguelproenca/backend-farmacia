-- Cria��o do Database
CREATE DATABASE FARMACIA
USE FARMACIA

-- Cria��o da Tabela
CREATE TABLE FAR_FARMACIA(
FAR_IN_CODIGO INT NOT NULL IDENTITY CONSTRAINT FAR_PK_FARMACIA PRIMARY KEY,
FAR_ST_NOME VARCHAR(30) NOT NULL CONSTRAINT FAR_UK_NOME UNIQUE,
FAR_ST_QUANTIDADE VARCHAR(20) NOT NULL,
FAR_ST_MARCA VARCHAR(30) NOT NULL,
FAR_ST_FABRICANTE VARCHAR(30) NOT NULL,
FAR_ST_DESCRICAO VARCHAR(500) NOT NULL,
FAR_DT_DATAINCLUSAO DATE DEFAULT GETDATE(),
FAR_RE_PRECO NUMERIC(5,2) CONSTRAINT FAR_CK_PRECO CHECK (FAR_RE_PRECO >= 0),
); 


-- Inserts de exemplo
INSERT INTO FAR_FARMACIA (FAR_ST_NOME, FAR_ST_QUANTIDADE, FAR_ST_MARCA, FAR_ST_FABRICANTE, FAR_ST_DESCRICAO, FAR_RE_PRECO)
VALUES ('EPOCLER','6 Flaconetes','526','Hypera','Epocler age principalmente sobre o f�gado evitando o ac�mulo de gordura nesse �rg�o 
		e auxiliando na remo��o de restos metab�licos e outras toxinas. Previne a infiltra��o (entrada) de gordura no f�gado. In�cio de a��o: cerca de 1 hora ap�s a ingest�o.', 12.96)

INSERT INTO FAR_FARMACIA (FAR_ST_NOME, FAR_ST_QUANTIDADE, FAR_ST_MARCA, FAR_ST_FABRICANTE, FAR_ST_DESCRICAO, FAR_RE_PRECO)
VALUES ('SIMETICOTINA','10 C�psulas','L Or�al','Cimed','Simeticona atua no est�mago e no intestino, diminuindo a tens�o superficial dos l�quidos digestivos, levando ao rompimento das bolhas (gases).', 9.39)

-- Sa�da de dados da tabela
SELECT * FROM FAR_FARMACIA
