-- Criação do Database
CREATE DATABASE FARMACIA
USE FARMACIA

-- Criação da Tabela
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
VALUES ('EPOCLER','6 Flaconetes','526','Hypera','Epocler age principalmente sobre o fígado evitando o acúmulo de gordura nesse órgão 
		e auxiliando na remoção de restos metabólicos e outras toxinas. Previne a infiltração (entrada) de gordura no fígado. Início de ação: cerca de 1 hora após a ingestão.', 12.96)

INSERT INTO FAR_FARMACIA (FAR_ST_NOME, FAR_ST_QUANTIDADE, FAR_ST_MARCA, FAR_ST_FABRICANTE, FAR_ST_DESCRICAO, FAR_RE_PRECO)
VALUES ('SIMETICOTINA','10 Cápsulas','L Oréal','Cimed','Simeticona atua no estômago e no intestino, diminuindo a tensão superficial dos líquidos digestivos, levando ao rompimento das bolhas (gases).', 9.39)

-- Saída de dados da tabela
SELECT * FROM FAR_FARMACIA
