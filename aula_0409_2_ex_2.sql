DROP TABLE IF EXISTS MODELO, ITEM, CLIENTE, AVALIACAO, VENDA;

CREATE TABLE MODELO (
    Numero_modelo INT PRIMARY KEY,
    Nome_modelo VARCHAR(100) NOT NULL,
	Descricao_modelo VARCHAR(100) CHECK(LENGTH(Descricao_modelo)>30)
);

CREATE TABLE ITEM (
    Numero_item INT PRIMARY KEY,
    Valor_item REAL NOT NULL CHECK(Valor_item>0),
    Numero_modelo INT NOT NULL,
    FOREIGN KEY (Numero_modelo) REFERENCES MODELO(Numero_modelo)
);

CREATE TABLE CLIENTE (
    Cpf_cliente VARCHAR(11) PRIMARY KEY,
    Nome_cliente VARCHAR(100) NOT NULL,
    Data_nascimento_cliente DATE,
    Genero_cliente VARCHAR(5) CHECK(Genero_cliente IN ('M','F','Outro'))
);

CREATE TABLE AVALIACAO (
    Nota INT NOT NULL CHECK (Nota >= 0 AND Nota <= 5),
    Cpf_cliente VARCHAR(11) NOT NULL,
    Numero_item INT NOT NULL,
    PRIMARY KEY (Cpf_cliente, Numero_item),
    FOREIGN KEY (Cpf_cliente) REFERENCES CLIENTE(Cpf_cliente),
    FOREIGN KEY (Numero_item) REFERENCES ITEM(Numero_item)
);

CREATE TABLE VENDA (
    Cpf_cliente VARCHAR(11) NOT NULL,
    Numero_item INT NOT NULL,
    Data_venda DATETIME NOT NULL,
    Valor_venda REAL NOT NULL,
    PRIMARY KEY (Cpf_cliente, Numero_item, Data_venda),
    FOREIGN KEY (Cpf_cliente) REFERENCES CLIENTE(Cpf_cliente),
    FOREIGN KEY (Numero_item) REFERENCES ITEM(Numero_item)
);
