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

-- 1. ALTER: Modificar tabelas já existentes

-- Adicionar uma nova coluna na tabela CLIENTES
ALTER TABLE CLIENTES ADD email VARCHAR(100);

-- Remover uma coluna da tabela ENDERECOS_CLIENTE
ALTER TABLE ENDERECOS_CLIENTE DROP COLUMN complemento;

-- Modificar o tipo de dado da coluna "ramo_atividade" na tabela CLIENTES
ALTER TABLE CLIENTES MODIFY ramo_atividade VARCHAR(150);

-- Renomear uma coluna da tabela EMPREGADOS
ALTER TABLE EMPREGADOS CHANGE COLUMN qualificacoes formacao TEXT;

-- Adicionar um índice na coluna "razao_social" da tabela FORNECEDORES
ALTER TABLE FORNECEDORES ADD INDEX idx_razao_social (razao_social);

-- 2. DROP: Remover objetos do banco de dados

-- Remover uma tabela
DROP TABLE TELEFONES_CLIENTE;

-- Remover um índice da tabela FORNECEDORES
DROP INDEX idx_razao_social ON FORNECEDORES;

-- 3. TRUNCATE: Limpar todos os dados de uma tabela
TRUNCATE TABLE ENCOMENDAS;

-- 4. RENAME: Renomear um objeto

-- Renomear a tabela PRODUTOS para ITENS_PRODUZIDOS
RENAME TABLE PRODUTOS TO ITENS_PRODUZIDOS;

-- 5. COMMENT: Adicionar comentários para documentação

-- Adicionar comentário para a tabela ITENS_PRODUZIDOS
ALTER TABLE ITENS_PRODUZIDOS COMMENT = 'Tabela que armazena informações sobre os itens produzidos pela TechSolution Ltda.';

-- Adicionar comentário para uma coluna
ALTER TABLE ITENS_PRODUZIDOS MODIFY nome VARCHAR(255) COMMENT 'Nome do item produzido';



