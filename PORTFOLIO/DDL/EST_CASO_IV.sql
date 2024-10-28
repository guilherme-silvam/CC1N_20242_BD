-- 1. Criação do banco de dados
CREATE DATABASE AcademiaSaudeEmMovimento;
USE AcademiaSaudeEmMovimento;

-- 2. Criação das tabelas principais
-- Tabela Alunos
CREATE TABLE Alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(200)
);

-- Tabela Instrutores
CREATE TABLE Instrutores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    especialidade VARCHAR(100)
);

-- Tabela Modalidades
CREATE TABLE Modalidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Tabela PlanosDeTreinamento
CREATE TABLE PlanosDeTreinamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    instrutor_id INT NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id),
    FOREIGN KEY (instrutor_id) REFERENCES Instrutores(id)
);

-- Tabela Aulas
CREATE TABLE Aulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modalidade_id INT NOT NULL,
    instrutor_id INT NOT NULL,
    horario TIME,
    capacidade INT,
    FOREIGN KEY (modalidade_id) REFERENCES Modalidades(id),
    FOREIGN KEY (instrutor_id) REFERENCES Instrutores(id)
);

-- Tabela Pagamentos
CREATE TABLE Pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    data_pagamento DATE,
    valor DECIMAL(10,2),
    status ENUM('pago', 'pendente') DEFAULT 'pendente',
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id)
);

-- 3. Comandos ALTER para modificar as tabelas e Comando DROP para remover o schema completo
-- Tabela Alunos
ALTER TABLE Alunos ADD email VARCHAR(100);
DROP TABLE IF EXISTS Alunos;
TRUNCATE TABLE Alunos;
RENAME TABLE Alunos TO Membros;
ALTER TABLE Alunos COMMENT = 'Tabela que armazena informações dos alunos da academia';

-- Tabela Instrutores
ALTER TABLE Instrutores ADD especialidade VARCHAR(100);
DROP TABLE IF EXISTS Instrutores;
TRUNCATE TABLE Instrutores;
RENAME TABLE Instrutores TO Professores;
ALTER TABLE Instrutores COMMENT = 'Tabela que armazena informações dos instrutores da academia';

-- Tabela Modalidades
ALTER TABLE Modalidades ADD duracao INT;
DROP TABLE IF EXISTS Modalidades;
TRUNCATE TABLE Modalidades;
RENAME TABLE Modalidades TO Atividades;
ALTER TABLE Modalidades COMMENT = 'Tabela que armazena as modalidades oferecidas pela academia';

-- Tabela PlanosDeTreinamento
ALTER TABLE PlanosDeTreinamento ADD objetivo VARCHAR(100);
DROP TABLE IF EXISTS PlanosDeTreinamento;
TRUNCATE TABLE PlanosDeTreinamento;
RENAME TABLE PlanosDeTreinamento TO Treinamentos;
ALTER TABLE PlanosDeTreinamento COMMENT = 'Tabela que armazena os planos de treinamento dos alunos';

-- Tabela Aulas
ALTER TABLE Aulas ADD capacidade_maxima INT;
DROP TABLE IF EXISTS Aulas;
TRUNCATE TABLE Aulas;
RENAME TABLE Aulas TO Sessoes;
ALTER TABLE Aulas COMMENT = 'Tabela que armazena informações das aulas em grupo';

-- Tabela Pagamentos
ALTER TABLE Pagamentos ADD metodo_pagamento VARCHAR(50);
DROP TABLE IF EXISTS Pagamentos;
TRUNCATE TABLE Pagamentos;
RENAME TABLE Pagamentos TO Transacoes;
ALTER TABLE Pagamentos COMMENT = 'Tabela que armazena informações sobre os pagamentos dos alunos';

