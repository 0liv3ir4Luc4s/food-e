CREATE SCHEMA IF NOT EXISTS food_e;

CREATE TABLE IF NOT EXISTS food_e.telefone(
    id INT,
    ddi INT(3) NOT NULL,
    ddd INT(3) NOT NULL,
    numero INT(9) NOT NULL,
    PRIMARY KEY(id) 
);
CREATE TABLE IF NOT EXISTS food_e.endereco(
    id INT,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    complemento VARCHAR(20) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS food_e.metodo_pagamento(
    id INT,
    numero_cartao INT NOT NULL,
    data_expiracao DATE NOT NULL,
    cvv INT(3) NOT NULL,
    PRIMARY KEY(id)
);