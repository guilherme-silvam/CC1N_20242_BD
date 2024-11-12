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

-- 3. Inserções de dados

-- Inserindo em Alunos
INSERT INTO Alunos (nome, cpf, data_nascimento, endereco) VALUES ('João Silva', '12345678901', '1990-01-01', 'Rua A, 123');
INSERT INTO Alunos (nome, cpf, data_nascimento, endereco) VALUES ('Maria Oliveira', '23456789012', '1985-05-15', 'Rua B, 456');
INSERT INTO Alunos (nome, cpf, data_nascimento, endereco) VALUES ('Pedro Santos', '34567890123', '1992-10-10', 'Rua C, 789');
INSERT INTO Alunos (nome, cpf, data_nascimento, endereco) VALUES ('Ana Souza', '45678901234', '1988-08-08', 'Rua D, 101');
INSERT INTO Alunos (nome, cpf, data_nascimento, endereco) VALUES ('Carlos Lima', '56789012345', '1995-03-20', 'Rua E, 202');

-- Inserindo em Instrutores
INSERT INTO Instrutores (nome, cpf, especialidade) VALUES ('Carlos Mendes', '98765432101', 'Musculação');
INSERT INTO Instrutores (nome, cpf, especialidade) VALUES ('Fernanda Lima', '87654321012', 'Pilates');
INSERT INTO Instrutores (nome, cpf, especialidade) VALUES ('Ricardo Pereira', '76543210923', 'Yoga');
INSERT INTO Instrutores (nome, cpf, especialidade) VALUES ('Juliana Martins', '65432109834', 'Funcional');
INSERT INTO Instrutores (nome, cpf, especialidade) VALUES ('Renato Silva', '54321098745', 'Crossfit');

-- Inserindo em Modalidades
INSERT INTO Modalidades (nome, descricao) VALUES ('Musculação', 'Treinamento com pesos e máquinas para ganho de massa muscular');
INSERT INTO Modalidades (nome, descricao) VALUES ('Pilates', 'Exercícios focados em fortalecimento e flexibilidade');
INSERT INTO Modalidades (nome, descricao) VALUES ('Yoga', 'Prática de posturas e respiração para equilíbrio e bem-estar');
INSERT INTO Modalidades (nome, descricao) VALUES ('Funcional', 'Treinamento que simula atividades do dia a dia');
INSERT INTO Modalidades (nome, descricao) VALUES ('Crossfit', 'Exercícios de alta intensidade com variações');

-- Inserindo em PlanosDeTreinamento
INSERT INTO PlanosDeTreinamento (aluno_id, instrutor_id, descricao, data_inicio, data_fim) VALUES (1, 1, 'Plano inicial de musculação', '2024-01-01', '2024-06-01');
INSERT INTO PlanosDeTreinamento (aluno_id, instrutor_id, descricao, data_inicio, data_fim) VALUES (2, 2, 'Plano de pilates para iniciantes', '2024-02-01', '2024-07-01');
INSERT INTO PlanosDeTreinamento (aluno_id, instrutor_id, descricao, data_inicio, data_fim) VALUES (3, 3, 'Plano de yoga para equilíbrio', '2024-03-01', '2024-08-01');
INSERT INTO PlanosDeTreinamento (aluno_id, instrutor_id, descricao, data_inicio, data_fim) VALUES (4, 4, 'Plano funcional avançado', '2024-04-01', '2024-09-01');
INSERT INTO PlanosDeTreinamento (aluno_id, instrutor_id, descricao, data_inicio, data_fim) VALUES (5, 5, 'Plano de crossfit intenso', '2024-05-01', '2024-10-01');

-- Inserindo em Aulas
INSERT INTO Aulas (modalidade_id, instrutor_id, horario, capacidade) VALUES (1, 1, '08:00:00', 20);
INSERT INTO Aulas (modalidade_id, instrutor_id, horario, capacidade) VALUES (2, 2, '09:00:00', 15);
INSERT INTO Aulas (modalidade_id, instrutor_id, horario, capacidade) VALUES (3, 3, '10:00:00', 10);
INSERT INTO Aulas (modalidade_id, instrutor_id, horario, capacidade) VALUES (4, 4, '11:00:00', 12);
INSERT INTO Aulas (modalidade_id, instrutor_id, horario, capacidade) VALUES (5, 5, '12:00:00', 25);

-- Inserindo em Pagamentos
INSERT INTO Pagamentos (aluno_id, data_pagamento, valor, status) VALUES (1, '2024-01-05', 100.00, 'pago');
INSERT INTO Pagamentos (aluno_id, data_pagamento, valor, status) VALUES (2, '2024-02-05', 150.00, 'pendente');
INSERT INTO Pagamentos (aluno_id, data_pagamento, valor, status) VALUES (3, '2024-03-05', 120.00, 'pago');
INSERT INTO Pagamentos (aluno_id, data_pagamento, valor, status) VALUES (4, '2024-04-05', 130.00, 'pendente');
INSERT INTO Pagamentos (aluno_id, data_pagamento, valor, status) VALUES (5, '2024-05-05', 110.00, 'pago');

-- 4. Atualizações de dados

-- Atualizando Alunos
UPDATE Alunos SET endereco = 'Rua Nova, 1234' WHERE id = 1;
UPDATE Alunos SET data_nascimento = '1991-01-01' WHERE cpf = '12345678901';

-- Atualizando Instrutores
UPDATE Instrutores SET especialidade = 'Crossfit e Funcional' WHERE id = 5;
UPDATE Instrutores SET nome = 'Fernanda Costa' WHERE cpf = '87654321012';

-- Atualizando Modalidades
UPDATE Modalidades SET descricao = 'Treinamento funcional para atividades diárias' WHERE id = 4;
UPDATE Modalidades SET nome = 'Crossfit Avançado' WHERE id = 5;

-- Atualizando PlanosDeTreinamento
UPDATE PlanosDeTreinamento SET descricao = 'Plano intermediário de musculação' WHERE id = 1;
UPDATE PlanosDeTreinamento SET data_fim = '2024-12-01' WHERE id = 2;

-- Atualizando Aulas
UPDATE Aulas SET capacidade = 30 WHERE id = 1;
UPDATE Aulas SET horario = '07:00:00' WHERE id = 2;

-- Atualizando Pagamentos
UPDATE Pagamentos SET valor = 105.00 WHERE id = 1;
UPDATE Pagamentos SET status = 'pago' WHERE id = 2;

-- 5. Deleções de dados

-- Deletando em Alunos
DELETE FROM Alunos WHERE cpf = '56789012345';

-- Deletando em Instrutores
DELETE FROM Instrutores WHERE cpf = '54321098745';

-- Deletando em Modalidades
DELETE FROM Modalidades WHERE id = 5;

-- Deletando em PlanosDeTreinamento
DELETE FROM PlanosDeTreinamento WHERE id = 5;

-- Deletando em Aulas
DELETE FROM Aulas WHERE id = 5;

-- Deletando em Pagamentos
DELETE FROM Pagamentos WHERE id = 5;
