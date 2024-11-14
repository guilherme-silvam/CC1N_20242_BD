-- Criar o banco de dados LOJA_INOVA_TECH
CREATE DATABASE IF NOT EXISTS LOJA_INOVA_TECH;

-- Selecionar o banco de dados
USE LOJA_INOVA_TECH;

-- Tabela CLIENTES
CREATE TABLE CLIENTES (
    CLIENTE_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    TELEFONE VARCHAR(15),
    ENDERECO VARCHAR(255)
);

-- Tabela FORNECEDORES
CREATE TABLE FORNECEDORES (
    FORNECEDOR_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    TELEFONE VARCHAR(15),
    EMAIL VARCHAR(100)
);

-- Tabela PRODUTOS
CREATE TABLE PRODUTOS (
    PRODUTO_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    PRECO DECIMAL(10, 2) NOT NULL,
    ESTOQUE INT NOT NULL,
    FORNECEDOR_ID INT,
    FOREIGN KEY (FORNECEDOR_ID) REFERENCES FORNECEDORES(FORNECEDOR_ID)
);

-- Tabela VENDAS
CREATE TABLE VENDAS (
    VENDA_ID INT PRIMARY KEY AUTO_INCREMENT,
    CLIENTE_ID INT,
    DATA_VENDA DATE NOT NULL,
    TOTAL DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTES(CLIENTE_ID)
);

-- Tabela ITENS_VENDA (para armazenar os produtos vendidos em cada venda)
CREATE TABLE ITENS_VENDA (
    ITEM_ID INT PRIMARY KEY AUTO_INCREMENT,
    VENDA_ID INT,
    PRODUTO_ID INT,
    QUANTIDADE INT NOT NULL,
    PRECO_UNITARIO DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VENDA_ID) REFERENCES VENDAS(VENDA_ID),
    FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS(PRODUTO_ID)
);

-- Inserir fornecedores
INSERT INTO FORNECEDORES (NOME, TELEFONE, EMAIL) VALUES ('Fornecedor A', '1234567890', 'fornecedorA@empresa.com');
INSERT INTO FORNECEDORES (NOME, TELEFONE, EMAIL) VALUES ('Fornecedor B', '2345678901', 'fornecedorB@empresa.com');
INSERT INTO FORNECEDORES (NOME, TELEFONE, EMAIL) VALUES ('Fornecedor C', '3456789012', 'fornecedorC@empresa.com');
INSERT INTO FORNECEDORES (NOME, TELEFONE, EMAIL) VALUES ('Fornecedor D', '4567890123', 'fornecedorD@empresa.com');
INSERT INTO FORNECEDORES (NOME, TELEFONE, EMAIL) VALUES ('Fornecedor E', '5678901234', 'fornecedorE@empresa.com');

-- Inserir clientes
INSERT INTO CLIENTES (NOME, CPF, TELEFONE, ENDERECO) VALUES ('João Silva', '12345678901', '9876543210', 'Rua A, 123');
INSERT INTO CLIENTES (NOME, CPF, TELEFONE, ENDERECO) VALUES ('Maria Oliveira', '23456789012', '9876543211', 'Rua B, 456');
INSERT INTO CLIENTES (NOME, CPF, TELEFONE, ENDERECO) VALUES ('Pedro Santos', '34567890123', '9876543212', 'Rua C, 789');
INSERT INTO CLIENTES (NOME, CPF, TELEFONE, ENDERECO) VALUES ('Ana Souza', '45678901234', '9876543213', 'Rua D, 101');
INSERT INTO CLIENTES (NOME, CPF, TELEFONE, ENDERECO) VALUES ('Carlos Lima', '56789012345', '9876543214', 'Rua E, 202');

-- Inserir produtos
INSERT INTO PRODUTOS (NOME, PRECO, ESTOQUE, FORNECEDOR_ID) VALUES ('Produto A', 50.00, 100, 1);
INSERT INTO PRODUTOS (NOME, PRECO, ESTOQUE, FORNECEDOR_ID) VALUES ('Produto B', 30.00, 150, 2);
INSERT INTO PRODUTOS (NOME, PRECO, ESTOQUE, FORNECEDOR_ID) VALUES ('Produto C', 80.00, 200, 3);
INSERT INTO PRODUTOS (NOME, PRECO, ESTOQUE, FORNECEDOR_ID) VALUES ('Produto D', 120.00, 50, 4);
INSERT INTO PRODUTOS (NOME, PRECO, ESTOQUE, FORNECEDOR_ID) VALUES ('Produto E', 200.00, 75, 5);

-- Inserir vendas
INSERT INTO VENDAS (CLIENTE_ID, DATA_VENDA, TOTAL) VALUES (1, '2024-11-01', 150.00);
INSERT INTO VENDAS (CLIENTE_ID, DATA_VENDA, TOTAL) VALUES (2, '2024-11-02', 200.00);
INSERT INTO VENDAS (CLIENTE_ID, DATA_VENDA, TOTAL) VALUES (3, '2024-11-03', 250.00);
INSERT INTO VENDAS (CLIENTE_ID, DATA_VENDA, TOTAL) VALUES (4, '2024-11-04', 120.00);
INSERT INTO VENDAS (CLIENTE_ID, DATA_VENDA, TOTAL) VALUES (5, '2024-11-05', 300.00);

-- Inserir itens de venda
INSERT INTO ITENS_VENDA (VENDA_ID, PRODUTO_ID, QUANTIDADE, PRECO_UNITARIO) VALUES (1, 1, 2, 50.00);
INSERT INTO ITENS_VENDA (VENDA_ID, PRODUTO_ID, QUANTIDADE, PRECO_UNITARIO) VALUES (2, 2, 5, 30.00);
INSERT INTO ITENS_VENDA (VENDA_ID, PRODUTO_ID, QUANTIDADE, PRECO_UNITARIO) VALUES (3, 3, 3, 80.00);
INSERT INTO ITENS_VENDA (VENDA_ID, PRODUTO_ID, QUANTIDADE, PRECO_UNITARIO) VALUES (4, 4, 1, 120.00);
INSERT INTO ITENS_VENDA (VENDA_ID, PRODUTO_ID, QUANTIDADE, PRECO_UNITARIO) VALUES (5, 5, 2, 200.00);

-- Atualizar telefone do fornecedor A
UPDATE FORNECEDORES SET TELEFONE = '9999999999' WHERE FORNECEDOR_ID = 1;

-- Atualizar email do fornecedor C
UPDATE FORNECEDORES SET EMAIL = 'novocontato@fornecedorc.com' WHERE FORNECEDOR_ID = 3;

-- Atualizar telefone de João Silva
UPDATE CLIENTES SET TELEFONE = '9888888888' WHERE CLIENTE_ID = 1;

-- Atualizar endereço de Carlos Lima
UPDATE CLIENTES SET ENDERECO = 'Rua F, 303' WHERE CLIENTE_ID = 5;

-- Atualizar estoque do Produto A
UPDATE PRODUTOS SET ESTOQUE = 120 WHERE PRODUTO_ID = 1;

-- Atualizar preço do Produto B
UPDATE PRODUTOS SET PRECO = 35.00 WHERE PRODUTO_ID = 2;

-- Atualizar o total da venda para o cliente João Silva
UPDATE VENDAS SET TOTAL = 170.00 WHERE VENDA_ID = 1;

-- Atualizar a data da venda do cliente Ana Souza
UPDATE VENDAS SET DATA_VENDA = '2024-11-10' WHERE VENDA_ID = 4;

-- Atualizar quantidade do Produto A na venda 1
UPDATE ITENS_VENDA SET QUANTIDADE = 3 WHERE ITEM_ID = 1;

-- Atualizar preço unitário do Produto B na venda 2
UPDATE ITENS_VENDA SET PRECO_UNITARIO = 32.00 WHERE ITEM_ID = 2;

-- Deletar fornecedor com ID 5
DELETE FROM FORNECEDORES WHERE FORNECEDOR_ID = 5;

-- Deletar cliente com CPF 34567890123
DELETE FROM CLIENTES WHERE CPF = '34567890123';

-- Deletar produto com ID 4
DELETE FROM PRODUTOS WHERE PRODUTO_ID = 4;

-- Deletar venda do cliente Pedro Santos (ID 3)
DELETE FROM VENDAS WHERE VENDA_ID = 3;

-- Deletar item de venda com ID 2
DELETE FROM ITENS_VENDA WHERE ITEM_ID = 2;
