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
CREATE TABLE IF NOT EXISTS food_e.usuario(
    id INT,
    telefone INT NOT NULL,
    primeiro_nome VARCHAR(50) NOT NULL,
    segundo_nome VARCHAR(50) NOT NULL,
    email VARCHAR(254) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(telefone) REFERENCES food_e.telefone(id)
);
CREATE TABLE IF NOT EXISTS food_e.usuario_endereco(
    id INT,
    usuario INT NOT NULL,
    endereco INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(usuario) REFERENCES food_e.usuario(id),
    FOREIGN KEY(endereco) REFERENCES food_e.endereco(id)
);
CREATE TABLE IF NOT EXISTS food_e.usuario_metodo_pagamento(
    id INT,
    usuario INT NOT NULL,
    metodo_pagamento INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(usuario) REFERENCES food_e.usuario(id),
    FOREIGN KEY(metodo_pagamento) REFERENCES food_e.metodo_pagamento(id)
);
CREATE TABLE IF NOT EXISTS food_e.empresa(
    id INT,
    nome VARCHAR(50) NOT NULL,
    endereco INT NOT NULL,
    telefone INT NOT NULL,
    email VARCHAR(254) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(endereco) REFERENCES food_e.endereco(id),
    FOREIGN KEY(telefone) REFERENCES food_e.telefone(id)
);
CREATE TABLE IF NOT EXISTS food_e.produto(
    id INT,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(4, 2) NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    tempo_preparo TIME NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS food_e.compra(
    id INT,
    usuario INT NOT NULL,
    endereco INT NOT NULL,
    metodo_pagamento INT NOT NULL,
    data DATETIME NOT NULL,
    valor_total DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(usuario) REFERENCES food_e.usuario(id),
    FOREIGN KEY(endereco) REFERENCES food_e.endereco(id),
    FOREIGN KEY(metodo_pagamento) REFERENCES food_e.metodo_pagamento(id)
);
