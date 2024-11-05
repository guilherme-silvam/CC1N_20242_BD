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
    AERONAVE_ID INT,
    FOREIGN KEY (AERONAVE_ID) REFERENCES AERONAVES(AERONAVE_ID)
);

-- Tabela CLIENTES
CREATE TABLE IF NOT EXISTS CLIENTES (
    PASSAGEIRO_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL
);

-- Tabela RESERVAS
CREATE TABLE IF NOT EXISTS RESERVAS (
    RESERVA_ID INT PRIMARY KEY AUTO_INCREMENT,
    PASSAGEIRO_ID INT,
    VOO_ID INT,
    DATA_VIAGEM DATE NOT NULL,
    FOREIGN KEY (PASSAGEIRO_ID) REFERENCES CLIENTES(PASSAGEIRO_ID),
    FOREIGN KEY (VOO_ID) REFERENCES VOOS(VOO_ID)
);

-- Inserir dados na tabela AERONAVES
INSERT INTO AERONAVES (MODELO, CAPACIDADE) VALUES
('Boeing 737', 180),
('Airbus A320', 160),
('Embraer E190', 110),
('Boeing 787', 250),
('Airbus A350', 300);

-- Inserir dados na tabela VOOS
INSERT INTO VOOS (NUMERO_VOO, DESTINO, AERONAVE_ID) VALUES
('AA123', 'Rio de Janeiro', 1),
('LA456', 'São Paulo', 2),
('G3789', 'Salvador', 3),
('AB101', 'Curitiba', 4),
('ZZ202', 'Florianópolis', 5);

-- Inserir dados na tabela CLIENTES
INSERT INTO CLIENTES (NOME, CPF) VALUES
('Maria Silva', '12345678901'),
('João Oliveira', '23456789012'),
('Ana Santos', '34567890123'),
('Carlos Pereira', '45678901234'),
('Fernanda Lima', '56789012345');

-- Inserir dados na tabela RESERVAS
INSERT INTO RESERVAS (PASSAGEIRO_ID, VOO_ID, DATA_VIAGEM) VALUES
(1, 1, '2024-11-15'),
(2, 2, '2024-11-20'),
(3, 3, '2024-11-25'),
(4, 4, '2024-12-01'),
(5, 5, '2024-12-05');

-- Atualizar dados na tabela AERONAVES
UPDATE AERONAVES
SET CAPACIDADE = 190
WHERE MODELO = 'Boeing 737';

UPDATE AERONAVES
SET MODELO = 'Airbus A320 Neo'
WHERE AERONAVE_ID = 2;

-- Atualizar dados na tabela VOOS
UPDATE VOOS
SET DESTINO = 'Florianópolis'
WHERE NUMERO_VOO = 'ZZ202';

UPDATE VOOS
SET AERONAVE_ID = 3
WHERE NUMERO_VOO = 'AA123';

-- Atualizar dados na tabela CLIENTES
UPDATE CLIENTES
SET NOME = 'Maria Oliveira'
WHERE CPF = '12345678901';

UPDATE CLIENTES
SET NOME = 'Ana Paula Santos'
WHERE PASSAGEIRO_ID = 3;

-- Atualizar dados na tabela RESERVAS
UPDATE RESERVAS
SET DATA_VIAGEM = '2024-11-30'
WHERE RESERVA_ID = 2;

UPDATE RESERVAS
SET VOO_ID = 4
WHERE PASSAGEIRO_ID = 5;

-- Excluir dados na tabela AERONAVES
DELETE FROM AERONAVES
WHERE MODELO = 'Embraer E190';

-- Excluir dados na tabela VOOS
DELETE FROM VOOS
WHERE NUMERO_VOO = 'G3789';

-- Excluir dados na tabela CLIENTES
DELETE FROM CLIENTES
WHERE CPF = '23456789012';

-- Excluir dados na tabela RESERVAS
DELETE FROM RESERVAS
WHERE RESERVA_ID = 1;


