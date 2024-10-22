-- ETAPA 1: CRIAR O BANCO DE DADOS COMPANHIA_AEREA
CREATE DATABASE IF NOT EXISTS COMPANHIA_AEREA;

-- ETAPA 2: SELECIONAR O NOVO BANCO DE DADOS
USE COMPANHIA_AEREA;

-- ETAPA 3: CRIAR AS TABELAS RELACIONADAS À COMPANHIA AÉREA

-- Tabela AERONAVES
CREATE TABLE IF NOT EXISTS AERONAVES (
    AERONAVE_ID INT PRIMARY KEY AUTO_INCREMENT,
    MODELO VARCHAR(50) NOT NULL,
    CAPACIDADE INT NOT NULL
);

-- Tabela VOOS
CREATE TABLE IF NOT EXISTS VOOS (
    VOO_ID INT PRIMARY KEY AUTO_INCREMENT,
    NUMERO_VOO VARCHAR(10) NOT NULL,
    DESTINO VARCHAR(50) NOT NULL,
    ORIGEM VARCHAR(50) NOT NULL,
    AERONAVE_ID INT,
    FOREIGN KEY (AERONAVE_ID) REFERENCES AERONAVES(AERONAVE_ID)
);

-- Tabela PASSAGEIROS
CREATE TABLE IF NOT EXISTS PASSAGEIROS (
    PASSAGEIRO_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL
);

-- Tabela RESERVAS
CREATE TABLE IF NOT EXISTS RESERVAS (
    RESERVA_ID INT PRIMARY KEY AUTO_INCREMENT,
    PASSAGEIRO_ID INT,
    VOO_ID INT,
    DATA_RESERVA DATE NOT NULL,
    FOREIGN KEY (PASSAGEIRO_ID) REFERENCES PASSAGEIROS(PASSAGEIRO_ID),
    FOREIGN KEY (VOO_ID) REFERENCES VOOS(VOO_ID)
);

-- ETAPA 4: ALTERAÇÕES NAS TABELAS UTILIZANDO ALTER TABLE

-- 1. CREATE: Criar um banco de dados e tabelas
CREATE DATABASE COMPANHIA_AEREA;

USE COMPANHIA_AEREA;

CREATE TABLE VOOS (
    voo_id INT AUTO_INCREMENT PRIMARY KEY,
    companhia VARCHAR(100) NOT NULL,
    origem VARCHAR(100),
    destino VARCHAR(100),
    data_voo DATE,
    passageiros INT
);

-- Criar outra tabela como exemplo
CREATE TABLE AERONAVES (
    aeronave_id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100),
    capacidade INT,
    ano_fabricacao YEAR
);

-- 2. ALTER: Modificar tabelas já existentes
-- Adicionar uma nova coluna na tabela VOOS
ALTER TABLE VOOS ADD tempo_estimado INT;

-- Remover uma coluna da tabela AERONAVES
ALTER TABLE AERONAVES DROP COLUMN ano_fabricacao;

-- Modificar o tipo de dado da coluna "passageiros" na tabela VOOS
ALTER TABLE VOOS MODIFY passageiros SMALLINT;

-- Renomear uma coluna da tabela VOOS
ALTER TABLE VOOS CHANGE COLUMN tempo_estimado duracao_voo INT;

-- Adicionar um índice na coluna "origem" da tabela VOOS
ALTER TABLE VOOS ADD INDEX idx_origem (origem);
-- ETAPA 5: COMANDO DROP

-- 3. DROP: Remover objetos do banco de dados
-- Remover uma tabela
DROP TABLE AERONAVES;

-- Remover um índice da tabela VOOS
DROP INDEX idx_origem ON VOOS;

-- 4. TRUNCATE: Limpar todos os dados de uma tabela
TRUNCATE TABLE VOOS;

-- 5. RENAME: Renomear um objeto
-- Renomear a tabela VOOS para VOOS_INTERNACIONAIS
RENAME TABLE VOOS TO VOOS_INTERNACIONAIS;

-- 6. COMMENT: Adicionar comentários para documentação
-- Adicionar comentário para a tabela
ALTER TABLE VOOS_INTERNACIONAIS COMMENT = 'Tabela que armazena voos internacionais da companhia aérea';

-- Adicionar comentário para uma coluna
ALTER TABLE VOOS_INTERNACIONAIS MODIFY companhia VARCHAR(100) COMMENT 'Nome da companhia aérea';