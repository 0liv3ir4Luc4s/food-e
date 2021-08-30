CREATE SCHEMA IF NOT EXISTS food_e;

CREATE TABLE IF NOT EXISTS food_e.telefone(
    id int,
    ddi INT(3) NOT NULL,
    ddd INT(3) NOT NULL,
    numero INT(9) NOT NULL,
    PRIMARY KEY(id) 
);