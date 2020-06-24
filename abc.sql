

---------------------------- PROFESSOR ------------------------------

CREATE TABLE ceps (
cep VARCHAR(9) NOT NULL,
cidade VARCHAR(40) NOT NULL,
uf CHAR(2) NOT NULL,
CONSTRAINT pk_ceps PRIMARY KEY (cep)
)

CREATE TABLE clientes (
id_cliente INTEGER NOT NULL,
cpf VARCHAR(11) NOT NULL,
nome VARCHAR(50) NOT NULL,
telefone VARCHAR(16) NOT NULL,
CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente)
)

CREATE TABLE clientes_end (
numero INTEGER NOT NULL,
id_cliente INTEGER NOT NULL,
endereco VARCHAR(50) NOT NULL,
cep VARCHAR(9) NOT NULL,
CONSTRAINT pk_clientes_end PRIMARY KEY (numero,id_cliente),
CONSTRAINT fk_clientes_end FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE,
CONSTRAINT fk_cep_ceps FOREIGN KEY (cep) REFERENCES ceps (cep)
)

CREATE TABLE vendas (
venda_numero INTEGER NOT NULL,
data_venda DATE NOT NULL,
status SMALLINT DEFAULT 0,
data_cancel DATE,
cliente_id INTEGER NOT NULL,
endereco_numero INTEGER NOT NULL,
total NUMERIC(10,2) DEFAULT 0.0,
CONSTRAINT pk_vendas PRIMARY KEY (venda_numero),
CONSTRAINT fk_vendas_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes (id_cliente) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE,
CONSTRAINT fk_vendas_clientes_end FOREIGN KEY (endereco_numero,cliente_id) REFERENCES clientes_end (numero,id_cliente) 
)

CREATE TABLE vendas_itens (
venda_numero INTEGER NOT NULL,
codigo INTEGER NOT NULL,
qntd INTEGER NOT NULL,
preco NUMERIC (10,2) NOT NULL DEFAULT 1.0,
CONSTRAINT pk_vendas_itens PRIMARY KEY (venda_numero,codigo),
CONSTRAINT fk_vendas_venda_numero FOREIGN KEY (venda_numero) REFERENCES vendas (venda_numero) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE,
CONSTRAINT fk_vendas_codigo FOREIGN KEY (codigo) REFERENCES titulos (codigo) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
)