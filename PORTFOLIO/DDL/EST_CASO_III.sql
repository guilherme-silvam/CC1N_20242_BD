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

-- Criar índice em CLIENTES
CREATE INDEX idx_cnpj ON CLIENTES (cnpj);

-- Criar visão em CLIENTES
CREATE VIEW vista_clientes AS
SELECT codigo, razao_social, cnpj
FROM CLIENTES;

-- Alterações na tabela CLIENTES
ALTER TABLE CLIENTES ADD email VARCHAR(100);
ALTER TABLE CLIENTES DROP COLUMN ramo_atividade;
ALTER TABLE CLIENTES MODIFY COLUMN razao_social VARCHAR(200);
ALTER TABLE CLIENTES CHANGE COLUMN pessoa_contato contato_responsavel VARCHAR(255);

-- Criar tabela TELEFONES_CLIENTE
CREATE TABLE TELEFONES_CLIENTE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_codigo INT,
    telefone VARCHAR(15),
    FOREIGN KEY (cliente_codigo) REFERENCES CLIENTES(codigo)
);

-- Alterações na tabela TELEFONES_CLIENTE
ALTER TABLE TELEFONES_CLIENTE ADD tipo_telefone VARCHAR(50);
ALTER TABLE TELEFONES_CLIENTE DROP COLUMN telefone;

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

-- Alterações na tabela ENDERECOS_CLIENTE
ALTER TABLE ENDERECOS_CLIENTE ADD pais VARCHAR(50);
ALTER TABLE ENDERECOS_CLIENTE DROP COLUMN complemento;

-- Criar tabela EMPREGADOS
CREATE TABLE EMPREGADOS (
    matricula INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    data_admissao DATE,
    qualificacoes TEXT
);

-- Alterações na tabela EMPREGADOS
ALTER TABLE EMPREGADOS ADD departamento VARCHAR(100);
ALTER TABLE EMPREGADOS DROP COLUMN qualificacoes;

-- Criar tabela TELEFONES_EMPREGADO
CREATE TABLE TELEFONES_EMPREGADO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    empregado_matricula INT,
    telefone VARCHAR(15),
    FOREIGN KEY (empregado_matricula) REFERENCES EMPREGADOS(matricula)
);

-- Alterações na tabela TELEFONES_EMPREGADO
ALTER TABLE TELEFONES_EMPREGADO ADD ramal INT;
ALTER TABLE TELEFONES_EMPREGADO DROP COLUMN telefone;

-- Criar tabela EMPRESAS
CREATE TABLE EMPRESAS (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    pessoa_contato VARCHAR(255)
);

-- Alterações na tabela EMPRESAS
ALTER TABLE EMPRESAS ADD endereco_principal VARCHAR(255);
ALTER TABLE EMPRESAS DROP COLUMN pessoa_contato;

-- Criar tabela FORNECEDORES
CREATE TABLE FORNECEDORES (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    pessoa_contato VARCHAR(255)
);

-- Alterações na tabela FORNECEDORES
ALTER TABLE FORNECEDORES ADD categoria VARCHAR(100);
ALTER TABLE FORNECEDORES DROP COLUMN pessoa_contato;

-- Criar tabela TIPOS_ENDERECO
CREATE TABLE TIPOS_ENDERECO (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Alterações na tabela TIPOS_ENDERECO
ALTER TABLE TIPOS_ENDERECO ADD descricao VARCHAR(200);

-- Criar tabela ENCOMENDAS
CREATE TABLE ENCOMENDAS (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    data_inclusao DATE,
    valor_total DECIMAL(10, 2),
    valor_desconto DECIMAL(10, 2),
    valor_liquido DECIMAL(10, 2)
);

-- Alterações na tabela ENCOMENDAS
ALTER TABLE ENCOMENDAS ADD status VARCHAR(50);
ALTER TABLE ENCOMENDAS DROP COLUMN valor_desconto;

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

-- Alterações na tabela PRODUTOS
ALTER TABLE PRODUTOS ADD categoria VARCHAR(50);
ALTER TABLE PRODUTOS DROP COLUMN dimensoes;

-- Criar tabela COMPONENTES
CREATE TABLE COMPONENTES (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade_estoque INT,
    preco_unitario DECIMAL(10, 2),
    unidade VARCHAR(50)
);

-- Alterações na tabela COMPONENTES
ALTER TABLE COMPONENTES ADD fornecedor VARCHAR(100);
ALTER TABLE COMPONENTES DROP COLUMN unidade;

-- Criar tabela MAQUINAS
CREATE TABLE MAQUINAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tempo_vida INT,
    data_compra DATE,
    data_fim_garantia DATE
);

-- Alterações na tabela MAQUINAS
ALTER TABLE MAQUINAS ADD fabricante VARCHAR(100);
ALTER TABLE MAQUINAS DROP COLUMN data_fim_garantia;

-- DROP para excluir o banco de dados
DROP DATABASE TechSolutionDB;

-- Remover tabelas
DROP TABLE CLIENTES;
DROP TABLE TELEFONES_CLIENTE;
DROP TABLE ENDERECOS_CLIENTE;
DROP TABLE EMPREGADOS;
DROP TABLE TELEFONES_EMPREGADO;
DROP TABLE EMPRESAS;
DROP TABLE FORNECEDORES;
DROP TABLE TIPOS_ENDERECO;
DROP TABLE ENCOMENDAS;
DROP TABLE PRODUTOS;
DROP TABLE COMPONENTES;
DROP TABLE MAQUINAS;

-- Remover índices
DROP INDEX idx_cnpj ON CLIENTES;

-- Remover visões
DROP VIEW vista_clientes;

-- TRUNCATE para limpar tabelas sem remover estrutura
TRUNCATE TABLE CLIENTES;
TRUNCATE TABLE TELEFONES_CLIENTE;

-- RENAME para renomear tabelas
RENAME TABLE CLIENTES TO CLIENTES_ATUALIZADOS;





-- Adicionar comentário para uma coluna
ALTER TABLE ITENS_PRODUZIDOS MODIFY nome VARCHAR(255) COMMENT 'Nome do item produzido';



