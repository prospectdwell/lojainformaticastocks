DROP DATABASE IF EXISTS `LojaInformatica`;
CREATE DATABASE `LojaInformatica`;
USE `LojaInformatica`;

-- Tabela Cliente
CREATE TABLE cliente(n_cliente int AUTO_INCREMENT NOT NULL,
nome_cliente varchar(50) NOT NULL,
morada varchar(50) NOT NULL,
data_nascimento date NULL,
email varchar(50) NULL,
telefone varchar(50) NOT NULL,
NIF VARCHAR(50) NOT NULL,
CONSTRAINT PK_Cliente PRIMARY KEY (n_cliente)
);

-- Tabela Funcionarios
CREATE TABLE funcionarios(n_funcionario int AUTO_INCREMENT NOT NULL,
nome_funcionario varchar(50) NOT NULL,
morada varchar(50) NOT NULL,
email varchar(50) NOT NULL,
telefone varchar(50) NOT NULL,
data_nascimento date NOT NULL,
NIF VARCHAR(50) NOT NULL,
CONSTRAINT PK_Funcionario PRIMARY KEY (n_funcionario)
);

-- Tabela Fornecedores
CREATE TABLE fornecedores(ID_fornecedores int AUTO_INCREMENT NOT NULL,
nome_fornecedor varchar(50) NOT NULL,
email varchar(50) NOT NULL,
telefone varchar(50) NOT NULL,
morada varchar(50) NOT NULL,
NIF varchar(50) NOT NULL,
website VARCHAR(50) NOT NULL,
CONSTRAINT PK_Fornecedores PRIMARY KEY (ID_fornecedores)
);

-- Tabela Stock
CREATE TABLE stock(ID_produto int AUTO_INCREMENT NOT NULL,
preço_produto varchar(50) NOT NULL,
quantidade_stock varchar(50) NOT NULL,
CONSTRAINT PK_Stock PRIMARY KEY (ID_produto)
);

-- Tabela Produto
CREATE TABLE produto(ID_produto int,
nome_produto varchar(50) NOT NULL,
marca varchar(50) NOT NULL
);

-- Tabela CAT_PRODUTO
CREATE TABLE cat_produto(
ID_Categoria int,
ID_produto int
);

-- Tabela Categorias
CREATE TABLE categorias(ID_Categoria int AUTO_INCREMENT NOT NULL,
Categoria varchar(50) NOT NULL,
CONSTRAINT PK_Categoria PRIMARY KEY (ID_Categoria)
);

-- Tabela QUANT_PROD
CREATE TABLE quant_prod(
ID_produto int,
quantidade_vendida varchar(50) NOT NULL
);

-- Tabela Fornecedor_produto
CREATE TABLE fornecedor_produto(
ID_fornecedores int,
ID_produto int,
preço_fornecedor int NOT NULL
);

-- Tabela Compras
CREATE TABLE compras(ID_compra int AUTO_INCREMENT NOT NULL,
quantidade_produto varchar(50) NOT NULL,
data_compra date NOT NULL,
n_cliente int,
ID_produto int,
CONSTRAINT PK_Compras PRIMARY KEY (ID_compra)
);

-- Tabela Reservas
CREATE TABLE reservas(ID_reserva int AUTO_INCREMENT NOT NULL,
quantidade_produto varchar(50) NOT NULL,
n_cliente int,
ID_produto int,
CONSTRAINT PK_Reservas PRIMARY KEY (ID_reserva)
);

-- Tabela Reservas_TF
CREATE TABLE reservas_tf(ID_reserva int,
cancelamento varchar(8),
data_cancelamento date
);

-- Tabela Data_Reservas
CREATE TABLE data_reservas(ID_reserva int,
data_reserva date NOT NULL
);

-- Tabela Levantamentos
CREATE TABLE levantamentos(ID_reserva int,
data_levantamento date NOT NULL
);

-- Tabela Manutenções
CREATE TABLE manutencao(ID_manutencao int AUTO_INCREMENT NOT NULL,
data_manutencao date NOT NULL,
orcamento varchar(50) NOT NULL,
n_cliente int NOT NULL,
CONSTRAINT PK_Manutencao PRIMARY KEY (ID_manutencao)
);

-- Tabela FUN_MAN
CREATE TABLE fun_man(ID_manutencao int NOT NULL,
n_funcionario int NOT NULL
);

-- Tabela DESC_MAN
CREATE TABLE desc_man(ID_manutencao int NOT NULL,
descricao varchar(200) NOT NULL
);

-- Relação tabela STOCK e tabela Produto
ALTER TABLE produto ADD
CONSTRAINT FK_ID_produto_prod FOREIGN KEY(ID_produto)
REFERENCES stock (ID_produto);

-- Relação tabela Produto e tabela Categoria
ALTER TABLE cat_produto ADD
CONSTRAINT FK_ID_produto_catprod FOREIGN KEY(ID_produto)
REFERENCES stock (ID_produto);

ALTER TABLE cat_produto ADD
CONSTRAINT FK_ID_categoria_catprod FOREIGN KEY(ID_Categoria)
REFERENCES categorias (ID_Categoria);

-- Relação tabela QUANT_PROD e tabela Stock
ALTER TABLE quant_prod ADD
CONSTRAINT FK_ID_produto_quantprod FOREIGN KEY(ID_produto)
REFERENCES stock (ID_produto);

-- Relação tabela STOCK e tabela Fornecedores
ALTER TABLE fornecedor_produto ADD
CONSTRAINT FK_ID_produto_forn FOREIGN KEY(ID_produto)
REFERENCES stock (ID_produto);

ALTER TABLE fornecedor_produto ADD
CONSTRAINT FK_ID_fornecedores_forn FOREIGN KEY(ID_fornecedores)
REFERENCES fornecedores (ID_fornecedores);

-- Relação tabela Compras e tabela Stock e Cliente
ALTER TABLE compras ADD
CONSTRAINT FK_ID_produto_compras FOREIGN KEY(ID_produto)
REFERENCES stock (ID_produto);

ALTER TABLE compras ADD
CONSTRAINT FK_ID_cliente_compra FOREIGN KEY(n_cliente)
REFERENCES cliente (n_cliente);

-- Relação tabela Reservas e tabela Stock e Cliente
ALTER TABLE reservas ADD
CONSTRAINT FK_ID_produto_reserva FOREIGN KEY(ID_produto)
REFERENCES stock (ID_produto);

ALTER TABLE reservas ADD
CONSTRAINT FK_ID_cliente_reserva FOREIGN KEY(n_cliente)
REFERENCES cliente (n_cliente);

-- Relação tabela Reservas e tabela Reservas_TF
ALTER TABLE reservas_tf ADD
CONSTRAINT FK_ID_reservas_reservatf FOREIGN KEY(ID_reserva)
REFERENCES reservas (ID_reserva);

-- Relação tabela Reservas e tabela Data_Reservas
ALTER TABLE data_reservas ADD
CONSTRAINT FK_ID_reservas_datareservas FOREIGN KEY(ID_reserva)
REFERENCES reservas (ID_reserva);

-- Relação tabela Reservas e tabela Levantamentos
ALTER TABLE levantamentos ADD
CONSTRAINT FK_ID_reservas_levantamentos FOREIGN KEY(ID_reserva)
REFERENCES reservas (ID_reserva);

-- Relação tabela cliente e tabela manutençao
ALTER TABLE manutencao ADD
CONSTRAINT FK_ID_cliente_manutencao FOREIGN KEY(n_cliente)
REFERENCES cliente (n_cliente);

-- Relação tabela manutenção e tabela funcionario
ALTER TABLE fun_man ADD
CONSTRAINT FK_ID_manutencao_funman FOREIGN KEY(ID_manutencao)
REFERENCES manutencao (ID_manutencao);

ALTER TABLE fun_man ADD
CONSTRAINT FK_ID_funcionario_funman FOREIGN KEY(n_funcionario)
REFERENCES funcionarios (n_funcionario);

-- Relação tabela manutenção e tabela funcionario
ALTER TABLE desc_man ADD
CONSTRAINT FK_ID_manutencao_descman FOREIGN KEY(ID_manutencao)
REFERENCES manutencao (ID_manutencao);

-- Inserir 5 clientes na tabela Cliente
INSERT INTO cliente ( nome_cliente, morada, data_nascimento, email, telefone, nif)
VALUES ('Caetana Sebastiana', 'Av. D. Avinte, 590', '1995-03-11','caetana@gmail.com', '934561864','123456789');
INSERT INTO cliente (nome_cliente, morada, data_nascimento, email, telefone, nif)
VALUES ('Armindo Silva', 'Rua 14 do Mar, 213', '1981-04-12','armindosilva@gmail.com', '913456282','987456123');
INSERT INTO cliente (nome_cliente, morada, data_nascimento, email, telefone, nif)
VALUES ('Sara Moniz', 'Avenida do Voador, 04', '2000-06-08','jksaramoniz@gmail.com', '968435189','158365678');
INSERT INTO cliente (nome_cliente, morada, data_nascimento, email, telefone, nif)
VALUES ('Pedro Tavares', 'Rua Joaquim, 5B', '1977-04-04','pedrotavares@hotmail.com', '962813458','254326579');
INSERT INTO cliente (nome_cliente, morada, data_nascimento, email, telefone, nif)
VALUES ('Março Santos', 'Rua Principal dos Santos, 4A', '2004-11-05','santosmarco@gmail.com', '912534867','254973582');

-- Inserir 5 Fornecedores na tabela Fornecedores
INSERT INTO fornecedores ( nome_fornecedor, email, telefone, morada, nif, website)
VALUES ('Nvidia', 'geral@nvidia.com', '2564525868','USA', '546821568','www.nvidia.com');
INSERT INTO fornecedores ( nome_fornecedor, email, telefone, morada, nif, website)
VALUES ('MSI', 'geral@msi.com', '25668468256','USA', '4538453828','www.msi.com');
INSERT INTO fornecedores ( nome_fornecedor, email, telefone, morada, nif, website)
VALUES ('EVGA', 'geral@evga.com', '25648641823','USA', '15186486885','www.evga.com');
INSERT INTO fornecedores ( nome_fornecedor, email, telefone, morada, nif, website)
VALUES ('ASUS', 'geral@asus.com', '25615384568','USA', '3245685686','www.asus.com');
INSERT INTO fornecedores ( nome_fornecedor, email, telefone, morada, nif, website)
VALUES ('Corsair', 'geral@corsair.com', '25648643846','USA', '586435183','www.corsair.com');

-- Inserir 5 Produtos na tabela Stock
INSERT INTO stock ( preço_produto, quantidade_stock)
VALUES ('132,99', '47');
INSERT INTO stock ( preço_produto, quantidade_stock)
VALUES ('49,90', '12');
INSERT INTO stock ( preço_produto, quantidade_stock)
VALUES ('9,99', '24');
INSERT INTO stock ( preço_produto, quantidade_stock)
VALUES ('399,99', '6');
INSERT INTO stock ( preço_produto, quantidade_stock)
VALUES ('674,99', '35');

-- Inserir 5 Produtos na tabela Produtos
INSERT INTO produto (ID_produto ,nome_produto, marca)
VALUES ('1','GT 730', 'Nvidia');
INSERT INTO produto (ID_produto ,nome_produto, marca)
VALUES ('2','GSX 300', 'EOS');
INSERT INTO produto (ID_produto ,nome_produto, marca)
VALUES ('3','PLAY 3!', 'Creative Soundblaster');
INSERT INTO produto (ID_produto ,nome_produto, marca)
VALUES ('4','RTX 3060 Ti', 'ASUS');
INSERT INTO produto (ID_produto ,nome_produto, marca)
VALUES ('5','RTX 3070', 'MSI');

-- Inserir Categorias nos Produtos
INSERT INTO cat_produto(ID_produto)
VALUES ('1');
INSERT INTO cat_produto(ID_produto)
VALUES ('2');
INSERT INTO cat_produto(ID_produto)
VALUES ('3');
INSERT INTO cat_produto(ID_produto)
VALUES ('4');
INSERT INTO cat_produto(ID_produto)
VALUES ('5');

-- Inserir 2 Categorias
INSERT INTO categorias(Categoria)
VALUES ('Placa Gráfica');
INSERT INTO categorias(Categoria)
VALUES ('Placa de Som');

-- Inserir Quantidade vendida dos Produtos
INSERT INTO quant_prod(ID_produto, quantidade_vendida)
VALUES ('1','23');
INSERT INTO quant_prod(ID_produto, quantidade_vendida)
VALUES ('2','13');
INSERT INTO quant_prod(ID_produto, quantidade_vendida)
VALUES ('3','55');
INSERT INTO quant_prod(ID_produto, quantidade_vendida)
VALUES ('4','4');
INSERT INTO quant_prod(ID_produto, quantidade_vendida)
VALUES ('5','79');

-- Inserir Produtos nos Fornecedores
INSERT INTO fornecedor_produto(ID_fornecedores, ID_produto, preço_fornecedor)
VALUES ('1','1','23,90');
INSERT INTO fornecedor_produto(ID_fornecedores, ID_produto, preço_fornecedor)
VALUES ('3','2','47,90');
INSERT INTO fornecedor_produto(ID_fornecedores, ID_produto, preço_fornecedor)
VALUES ('5','3','13,90');
INSERT INTO fornecedor_produto(ID_fornecedores, ID_produto, preço_fornecedor)
VALUES ('2','4','2,90');
INSERT INTO fornecedor_produto(ID_fornecedores, ID_produto, preço_fornecedor)
VALUES ('1','5','399,90');

-- Inserir dados na tabela manutenção
INSERT INTO manutencao ( data_manutencao, orcamento, n_cliente)
VALUES ('2020-11-12','500','1');
INSERT INTO manutencao ( data_manutencao, orcamento, n_cliente)
VALUES ('2020-12-12','250','2');
INSERT INTO manutencao ( data_manutencao, orcamento, n_cliente)
VALUES ('2020-11-12','300','3');
INSERT INTO manutencao ( data_manutencao, orcamento, n_cliente)
VALUES ('2020-11-12','750','4');
INSERT INTO manutencao ( data_manutencao, orcamento, n_cliente)
VALUES ('2020-11-12','100','5');

-- Inserir dados na tabela Funcionarios.
INSERT INTO funcionarios ( nome_funcionario, morada, email, telefone, data_nascimento, nif)
VALUES ('Joaquim Almeida', 'Av. D. Avinte, 590', 'joaquimAlmeida@gmail.com','923672111', '1982-04-11','14567234');
INSERT INTO funcionarios ( nome_funcionario, morada, email, telefone, data_nascimento, nif)
VALUES ('Arlindo Antunes', 'Av. D. Avinte, 590', 'arlindoantunes@gmail.com','944472111', '1981-03-12','153423267');
INSERT INTO funcionarios ( nome_funcionario, morada, email, telefone, data_nascimento, nif)
VALUES ('Andre Albuquerque', 'Av. D. Avinte, 590', 'andrealbuquerque@gmail.com','923938211', '1986-04-08','145679998');
INSERT INTO funcionarios ( nome_funcionario, morada, email, telefone, data_nascimento, nif)
VALUES ( 'Antonio Andre', 'Av. D. Avinte, 590', 'antonioandre@gmail.com','923672222', '1983-01-01','123456777');
INSERT INTO funcionarios ( nome_funcionario, morada, email, telefone, data_nascimento, nif)
VALUES ('Ricardo Fernandes', 'Av. D. Avinte, 590', 'ricardofernandes@gmail.com','912372181', '1982-09-11','145672341');

-- Inserir dados na tabela compras 
INSERT INTO compras ( quantidade_produto, data_compra, n_cliente,ID_produto)
VALUES ('2','2020-12-25','1','5');
INSERT INTO compras ( quantidade_produto, data_compra, n_cliente,ID_produto)
VALUES ('1','2020-12-25','2','4');
INSERT INTO compras ( quantidade_produto, data_compra, n_cliente,ID_produto)
VALUES ('1','2020-12-25','3','3');
INSERT INTO compras ( quantidade_produto, data_compra, n_cliente,ID_produto)
VALUES ('3','2020-12-25','4','2');
INSERT INTO compras ( quantidade_produto, data_compra, n_cliente,ID_produto)
VALUES ('2','2020-12-25','5','1');

-- Inserir dados na tabela Reservas 
INSERT INTO reservas ( quantidade_produto, n_cliente,ID_produto)
VALUES ('1','1','1');
INSERT INTO reservas ( quantidade_produto, n_cliente,ID_produto)
VALUES ('2','2','2');
INSERT INTO reservas ( quantidade_produto, n_cliente,ID_produto)
VALUES ('3','3','3');
INSERT INTO reservas ( quantidade_produto, n_cliente,ID_produto)
VALUES ('4','4','4');
INSERT INTO reservas ( quantidade_produto, n_cliente,ID_produto)
VALUES ('5','5','5');

-- Inserir dados na tabela reservas_tf
INSERT INTO reservas_tf (ID_reserva, cancelamento,data_cancelamento)
VALUES ('3','S','2020-11-12');

-- Inserir dados na tabela levantamentos
INSERT INTO levantamentos (ID_reserva,data_levantamento)
VALUES ('1','2020-09-08');
INSERT INTO levantamentos (ID_reserva,data_levantamento)
VALUES ('2','2020-09-08');
INSERT INTO levantamentos (ID_reserva,data_levantamento)
VALUES ('4','2020-09-08');
