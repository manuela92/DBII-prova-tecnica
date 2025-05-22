CREATE DATABASE pascotto;
USE pascotto;

CREATE TABLE fornecedores(
	idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    cnpj VARCHAR (20),
    tel VARCHAR (20),
    cpf VARCHAR (20)    
);

CREATE TABLE produtos(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DOUBLE NOT NULL,
    quantidade INT NOT NULL,
    idFornecedor INT,
    FOREIGN KEY (idFornecedor) REFERENCES fornecedores(idFornecedor)
);

CREATE TABLE colaborador(
	idColaborador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    salario DOUBLE
);

CREATE TABLE pedidos(
	idPedido INT PRIMARY KEY AUTO_INCREMENT,
    dataPedido DATE NOT NULL,
    quantidade INT,
    idColaborador INT,
    idProduto INT,
    FOREIGN KEY (idColaborador) REFERENCES colaborador(idColaborador),
    FOREIGN KEY (idProduto) REFERENCES produtos(idProduto)
);

ALTER TABLE fornecedores ADD COLUMN email VARCHAR(100);

CREATE TABLE categorias(
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nomeCategoria VARCHAR(100)
);

ALTER TABLE produtos ADD COLUMN idCategoria INT;
ALTER TABLE produtos ADD CONSTRAINT fk_produtos_categoria
FOREIGN KEY (idCategoria) REFERENCES categorias(idCategoria);

INSERT INTO fornecedores (nome, cnpj,tel) VALUES 
("Premium Plásticos", "12345000167", "11908070605"),
("Vital Variádos", "34567000189", "13921232425");

SELECT * FROM fornecedores; 

UPDATE fornecedores SET email= "premium1@email.com" WHERE idFornecedor=1;
UPDATE fornecedores SET email= "vitalvariados1@email.com" WHERE idFornecedor=2;

INSERT INTO produtos (nome, preco, quantidade, idFornecedor) VALUES
("Garrafa plástica 500ml", 11.99, 60, 1),
("Caneta preta", 2.99, 100, 2);

SELECT*FROM produtos;

INSERT INTO categorias (nomeCategoria) VALUES
("Garrafa"), ("Caneta");

UPDATE produtos SET idCategoria= 1 WHERE idProduto=3;
UPDATE produtos SET idCategoria= 2 WHERE idProduto=4;

SELECT*FROM produtos;

INSERT INTO colaborador (nome, cargo, salario) VALUES
("Mariana Matos", "entregador", 1200.00),
("Jonas Juventino", "estoquista", 1000.00);

SELECT*FROM colaborador;

INSERT INTO pedidos (dataPedido, quantidade, idColaborador) VALUES
("2025-05-01", 4, 1),
("2025-04-30", 1, 2);

UPDATE pedidos SET idProduto = 3 WHERE idPedido=1;
UPDATE pedidos SET idProduto = 4 WHERE idPedido=2;

SELECT*FROM pedidos;

UPDATE pedidos SET idProduto = 3 WHERE idPedido=3;
UPDATE pedidos SET idProduto = 4 WHERE idPedido=4;

UPDATE colaborador SET salario = 1300.00 WHERE idColaborador = 1;

SELECT produtos.nome, fornecedores.nome FROM produtos 
INNER JOIN fornecedores ON produtos.idFornecedor = fornecedores.idFornecedor;