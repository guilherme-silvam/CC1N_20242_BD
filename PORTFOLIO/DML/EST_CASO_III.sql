-- Criar Banco de Dados
CREATE DATABASE TechSolutionDB;

-- Usar o banco de dados criado
USE TechSolutionDB;

-- Criar tabela CLIENTES
CREATE TABLE CLIENTES (
    codigo INT PRIMARY KEY,
    cnpj VARCHAR(14) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    ramo_atividade VARCHAR(100),
    data_cadastramento DATE,
    pessoa_contato VARCHAR(255)
);

-- Criar tabela TELEFONES_CLIENTE
CREATE TABLE TELEFONES_CLIENTE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_codigo INT,
    telefone VARCHAR(15),
    FOREIGN KEY (cliente_codigo) REFERENCES CLIENTES(codigo)
);

-- Criar tabela ENDERECOS_CLIENTE
CREATE TABLE ENDERECOS_CLIENTE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_codigo INT,
    tipo_endereco_id INT,
    numero VARCHAR(10),
    logradouro VARCHAR(255),
    complemento VARCHAR(255),
    cep VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    FOREIGN KEY (cliente_codigo) REFERENCES CLIENTES(codigo)
);

-- Criar tabela EMPREGADOS
CREATE TABLE EMPREGADOS (
    matricula INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    data_admissao DATE,
    qualificacoes TEXT
);

-- Criar tabela TELEFONES_EMPREGADO
CREATE TABLE TELEFONES_EMPREGADO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    empregado_matricula INT,
    telefone VARCHAR(15),
    FOREIGN KEY (empregado_matricula) REFERENCES EMPREGADOS(matricula)
);

-- Criar tabela EMPRESAS
CREATE TABLE EMPRESAS (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    pessoa_contato VARCHAR(255)
);

-- Criar tabela FORNECEDORES
CREATE TABLE FORNECEDORES (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    pessoa_contato VARCHAR(255)
);

-- Criar tabela TIPOS_ENDERECO
CREATE TABLE TIPOS_ENDERECO (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Criar tabela ENCOMENDAS
CREATE TABLE ENCOMENDAS (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    data_inclusao DATE,
    valor_total DECIMAL(10, 2),
    valor_desconto DECIMAL(10, 2),
    valor_liquido DECIMAL(10, 2)
);

-- Criar tabela PRODUTOS
CREATE TABLE PRODUTOS (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cor VARCHAR(50),
    dimensoes VARCHAR(50),
    peso DECIMAL(10, 2),
    preco DECIMAL(10, 2),
    tempo_fabricacao INT,
    horas_mao_obra INT
);

-- Criar tabela COMPONENTES
CREATE TABLE COMPONENTES (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade_estoque INT,
    preco_unitario DECIMAL(10, 2),
    unidade VARCHAR(50)
);

-- Criar tabela MAQUINAS
CREATE TABLE MAQUINAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tempo_vida INT,
    data_compra DATE,
    data_fim_garantia DATE
);

-- INSERÇÕES, UPDATES, DELETES --

-- CLIENTES
INSERT INTO CLIENTES VALUES (1, '12345678901234', 'Cliente A', 'Tecnologia', '2023-01-01', 'Contato A');
INSERT INTO CLIENTES VALUES (2, '23456789012345', 'Cliente B', 'Saúde', '2023-02-01', 'Contato B');
INSERT INTO CLIENTES VALUES (3, '34567890123456', 'Cliente C', 'Educação', '2023-03-01', 'Contato C');
INSERT INTO CLIENTES VALUES (4, '45678901234567', 'Cliente D', 'Alimentício', '2023-04-01', 'Contato D');
INSERT INTO CLIENTES VALUES (5, '56789012345678', 'Cliente E', 'Financeiro', '2023-05-01', 'Contato E');
UPDATE CLIENTES SET pessoa_contato = 'Novo Contato A' WHERE codigo = 1;
UPDATE CLIENTES SET pessoa_contato = 'Novo Contato B' WHERE codigo = 2;
DELETE FROM CLIENTES WHERE codigo = 5;

-- TELEFONES_CLIENTE
INSERT INTO TELEFONES_CLIENTE (cliente_codigo, telefone) VALUES (1, '1111-1111');
INSERT INTO TELEFONES_CLIENTE (cliente_codigo, telefone) VALUES (1, '2222-2222');
INSERT INTO TELEFONES_CLIENTE (cliente_codigo, telefone) VALUES (2, '3333-3333');
INSERT INTO TELEFONES_CLIENTE (cliente_codigo, telefone) VALUES (3, '4444-4444');
INSERT INTO TELEFONES_CLIENTE (cliente_codigo, telefone) VALUES (4, '5555-5555');
UPDATE TELEFONES_CLIENTE SET telefone = '9999-9999' WHERE id = 1;
UPDATE TELEFONES_CLIENTE SET telefone = '8888-8888' WHERE id = 2;
DELETE FROM TELEFONES_CLIENTE WHERE id = 5;

-- ENDERECOS_CLIENTE
INSERT INTO ENDERECOS_CLIENTE (cliente_codigo, tipo_endereco_id, numero, logradouro, complemento, cep, bairro, cidade, estado) VALUES (1, 1, '100', 'Rua A', 'Apto 1', '11111-111', 'Bairro A', 'Cidade A', 'ES');
INSERT INTO ENDERECOS_CLIENTE (cliente_codigo, tipo_endereco_id, numero, logradouro, complemento, cep, bairro, cidade, estado) VALUES (2, 2, '200', 'Rua B', 'Casa', '22222-222', 'Bairro B', 'Cidade B', 'SP');
INSERT INTO ENDERECOS_CLIENTE (cliente_codigo, tipo_endereco_id, numero, logradouro, complemento, cep, bairro, cidade, estado) VALUES (3, 1, '300', 'Rua C', 'Bloco C', '33333-333', 'Bairro C', 'Cidade C', 'RJ');
INSERT INTO ENDERECOS_CLIENTE (cliente_codigo, tipo_endereco_id, numero, logradouro, complemento, cep, bairro, cidade, estado) VALUES (4, 2, '400', 'Rua D', 'Apto 2', '44444-444', 'Bairro D', 'Cidade D', 'MG');
INSERT INTO ENDERECOS_CLIENTE (cliente_codigo, tipo_endereco_id, numero, logradouro, complemento, cep, bairro, cidade, estado) VALUES (5, 1, '500', 'Rua E', 'Sala', '55555-555', 'Bairro E', 'Cidade E', 'RS');
UPDATE ENDERECOS_CLIENTE SET cidade = 'Nova Cidade' WHERE id = 1;
UPDATE ENDERECOS_CLIENTE SET cidade = 'Nova Cidade B' WHERE id = 2;
DELETE FROM ENDERECOS_CLIENTE WHERE id = 5;

-- EMPREGADOS
INSERT INTO EMPREGADOS VALUES (1, 'Empregado A', 'Cargo A', 2000.00, '2023-01-01', 'Qualificação A');
INSERT INTO EMPREGADOS VALUES (2, 'Empregado B', 'Cargo B', 2500.00, '2023-02-01', 'Qualificação B');
INSERT INTO EMPREGADOS VALUES (3, 'Empregado C', 'Cargo C', 3000.00, '2023-03-01', 'Qualificação C');
INSERT INTO EMPREGADOS VALUES (4, 'Empregado D', 'Cargo D', 3500.00, '2023-04-01', 'Qualificação D');
INSERT INTO EMPREGADOS VALUES (5, 'Empregado E', 'Cargo E', 4000.00, '2023-05-01', 'Qualificação E');
UPDATE EMPREGADOS SET salario = 2800.00 WHERE matricula = 1;
UPDATE EMPREGADOS SET salario = 3000.00 WHERE matricula = 2;
DELETE FROM EMPREGADOS WHERE matricula = 5;

-- TELEFONES_EMPREGADO
INSERT INTO TELEFONES_EMPREGADO (empregado_matricula, telefone) VALUES (1, '6666-6666');
INSERT INTO TELEFONES_EMPREGADO (empregado_matricula, telefone) VALUES (1, '7777-7777');
INSERT INTO TELEFONES_EMPREGADO (empregado_matricula, telefone) VALUES (2, '8888-8888');
INSERT INTO TELEFONES_EMPREGADO (empregado_matricula, telefone) VALUES (3, '9999-9999');
INSERT INTO TELEFONES_EMPREGADO (empregado_matricula, telefone) VALUES (4, '1010-1010');
UPDATE TELEFONES_EMPREGADO SET telefone = '1122-3344' WHERE id = 1;
UPDATE TELEFONES_EMPREGADO SET telefone = '5566-7788' WHERE id = 2;
DELETE FROM TELEFONES_EMPREGADO WHERE id = 5;

-- EMPRESAS
INSERT INTO EMPRESAS VALUES ('12345678901234', 'Empresa A', 'Contato A');
INSERT INTO EMPRESAS VALUES ('23456789012345', 'Empresa B', 'Contato B');
INSERT INTO EMPRESAS VALUES ('34567890123456', 'Empresa C', 'Contato C');
INSERT INTO EMPRESAS VALUES ('45678901234567', 'Empresa D', 'Contato D');
INSERT INTO EMPRESAS VALUES ('56789012345678', 'Empresa E', 'Contato E');
UPDATE EMPRESAS SET pessoa_contato = 'Contato Atualizado A' WHERE cnpj = '12345678901234';
UPDATE EMPRESAS SET pessoa_contato = 'Contato Atualizado B' WHERE cnpj = '23456789012345';
DELETE FROM EMPRESAS WHERE cnpj = '56789012345678';

-- FORNECEDORES
INSERT INTO FORNECEDORES VALUES ('87654321098765', 'Fornecedor A', 'Contato F');
INSERT INTO FORNECEDORES VALUES ('76543210987654', 'Fornecedor B', 'Contato G');
INSERT INTO FORNECEDORES VALUES ('65432109876543', 'Fornecedor C', 'Contato H');
INSERT INTO FORNECEDORES VALUES ('54321098765432', 'Fornecedor D', 'Contato I');
INSERT INTO FORNECEDORES VALUES ('43210987654321', 'Fornecedor E', 'Contato J');
UPDATE FORNECEDORES SET pessoa_contato = 'Contato Atualizado F' WHERE cnpj = '87654321098765';
UPDATE FORNECEDORES SET pessoa_contato = 'Contato Atualizado G' WHERE cnpj = '76543210987654';
DELETE FROM FORNECEDORES WHERE cnpj = '43210987654321';

-- TIPOS_ENDERECO
INSERT INTO TIPOS_ENDERECO (nome) VALUES ('Residencial');
INSERT INTO TIPOS_ENDERECO (nome) VALUES ('Comercial');
INSERT INTO TIPOS_ENDERECO (nome) VALUES ('Cobrança');
INSERT INTO TIPOS_ENDERECO (nome) VALUES ('Entrega');
INSERT INTO TIPOS_ENDERECO (nome) VALUES ('Correspondência');
UPDATE TIPOS_ENDERECO SET nome = 'Principal' WHERE codigo = 1;
UPDATE TIPOS_ENDERECO SET nome = 'Auxiliar' WHERE codigo = 2;
DELETE FROM TIPOS_ENDERECO WHERE codigo = 5;

-- ENCOMENDAS
INSERT INTO ENCOMENDAS (data_inclusao, valor_total, valor_desconto, valor_liquido) VALUES ('2023-01-01', 1000.00, 50.00, 950.00);
INSERT INTO ENCOMENDAS (data_inclusao, valor_total, valor_desconto, valor_liquido) VALUES ('2023-02-01', 2000.00, 100.00, 1900.00);
INSERT INTO ENCOMENDAS (data_inclusao, valor_total, valor_desconto, valor_liquido) VALUES ('2023-03-01', 3000.00, 150.00, 2850.00);
INSERT INTO ENCOMENDAS (data_inclusao, valor_total, valor_desconto, valor_liquido) VALUES ('2023-04-01', 4000.00, 200.00, 3800.00);
INSERT INTO ENCOMENDAS (data_inclusao, valor_total, valor_desconto, valor_liquido) VALUES ('2023-05-01', 5000.00, 250.00, 4750.00);
UPDATE ENCOMENDAS SET valor_liquido = 1000.00 WHERE numero = 1;
UPDATE ENCOMENDAS SET valor_liquido = 2000.00 WHERE numero = 2;
DELETE FROM ENCOMENDAS WHERE numero = 5;

-- PRODUTOS
INSERT INTO PRODUTOS (nome, cor, dimensoes, peso, preco, tempo_fabricacao, horas_mao_obra) VALUES ('Produto A', 'Azul', '10x10x10', 1.00, 10.00, 2, 1);
INSERT INTO PRODUTOS (nome, cor, dimensoes, peso, preco, tempo_fabricacao, horas_mao_obra) VALUES ('Produto B', 'Verde', '20x20x20', 2.00, 20.00, 3, 2);
INSERT INTO PRODUTOS (nome, cor, dimensoes, peso, preco, tempo_fabricacao, horas_mao_obra) VALUES ('Produto C', 'Vermelho', '30x30x30', 3.00, 30.00, 4, 3);
INSERT INTO PRODUTOS (nome, cor, dimensoes, peso, preco, tempo_fabricacao, horas_mao_obra) VALUES ('Produto D', 'Amarelo', '40x40x40', 4.00, 40.00, 5, 4);
INSERT INTO PRODUTOS (nome, cor, dimensoes, peso, preco, tempo_fabricacao, horas_mao_obra) VALUES ('Produto E', 'Preto', '50x50x50', 5.00, 50.00, 6, 5);
UPDATE PRODUTOS SET preco = 15.00 WHERE codigo = 1;
UPDATE PRODUTOS SET preco = 25.00 WHERE codigo = 2;
DELETE FROM PRODUTOS WHERE codigo = 5;

-- COMPONENTES
INSERT INTO COMPONENTES (nome, quantidade_estoque, preco_unitario, unidade) VALUES ('Componente A', 100, 1.00, 'Unidade');
INSERT INTO COMPONENTES (nome, quantidade_estoque, preco_unitario, unidade) VALUES ('Componente B', 200, 2.00, 'Unidade');
INSERT INTO COMPONENTES (nome, quantidade_estoque, preco_unitario, unidade) VALUES ('Componente C', 300, 3.00, 'Unidade');
INSERT INTO COMPONENTES (nome, quantidade_estoque, preco_unitario, unidade) VALUES ('Componente D', 400, 4.00, 'Unidade');
INSERT INTO COMPONENTES (nome, quantidade_estoque, preco_unitario, unidade) VALUES ('Componente E', 500, 5.00, 'Unidade');
UPDATE COMPONENTES SET preco_unitario = 1.50 WHERE codigo = 1;
UPDATE COMPONENTES SET preco_unitario = 2.50 WHERE codigo = 2;
DELETE FROM COMPONENTES WHERE codigo = 5;

-- MAQUINAS
INSERT INTO MAQUINAS (tempo_vida, data_compra, data_fim_garantia) VALUES (5, '2020-01-01', '2025-01-01');
INSERT INTO MAQUINAS (tempo_vida, data_compra, data_fim_garantia) VALUES (6, '2020-02-01', '2026-02-01');
INSERT INTO MAQUINAS (tempo_vida, data_compra, data_fim_garantia) VALUES (7, '2020-03-01', '2027-03-01');
INSERT INTO MAQUINAS (tempo_vida, data_compra, data_fim_garantia) VALUES (8, '2020-04-01', '2028-04-01');
INSERT INTO MAQUINAS (tempo_vida, data_compra, data_fim_garantia) VALUES (9, '2020-05-01', '2029-05-01');
UPDATE MAQUINAS SET tempo_vida = 10 WHERE id = 1;
UPDATE MAQUINAS SET tempo_vida = 12 WHERE id = 2;
DELETE FROM MAQUINAS WHERE id = 5;
