--drops

DROP TABLE TB_FONE;
DROP TABLE TB_ENDERECO;
DROP TABLE TB_PESSOA;
DROP TABLE TB_FUNCIONARIO;
DROP TABLE TB_CINEMA;
DROP TABLE TB_SETOR;
DROP TABLE TB_SETOR_FUNC;
DROP TABLE TB_TRABALHA;
DROP TABLE TB_SNACK_BAR;
DROP TABLE TB_PRODUTO;
DROP TABLE TB_SALA;
DROP TABLE TB_ATOR;
DROP TABLE TB_NT_ATOR;
DROP TABLE TB_FILME;
DROP TABLE TB_FILME_SALA;
DROP TABLE TB_INGRESSO;
DROP TABLE TB_VENDE_INGRESSO;
DROP TABLE TB_EXIBE;

CREATE TABLE TB_PESSOA OF TP_PESSOA(
    CPF PRIMARY KEY,
    NOME_PESSOA NOT NULL,
    DATA_NASC NOT NULL,
    ENDERECO NOT NULL
);
/

CREATE OR REPLACE TABLE TB_FUNCIONARIO OF TP_FUNCIONARIO(
    ID_FUNCIONARIO PRIMARY KEY,
    ID_SUPERVISOR NOT NULL,
    SALARIO NOT NULL
);
/
CREATE OR REPLACE TABLE TB_CINEMA OF TP_CINEMA(
    CNPJ PRIMARY KEY,
    NOME_CINEMA  NOT NULL,
    ENDERECO_CINE NOT NULL
);
/
CREATE OR REPLACE TABLE TB_SETOR OF TP_SETOR(
    ID_SETOR PRIMARY KEY,
    NOME_SETOR NOT NULL
);
/
CREATE OR REPLACE TABLE TB_SETOR_FUNC OF TP_SETOR_FUNC( 
    SETOR SCOPE PRIMARY KEY,
    FUNCIONARIO PRIMARY KEY,
    SETOR SCOPE IS TB_SETOR,
    FUNCIONARIO SCOPE IS TB_FUNCIONARIO
);
/
CREATE OR REPLACE TABLE TB_TRABALHA OF TP_TRABALHA(
    CINEMA SCOPE PRIMARY KEY,
    FUNCIONARIO PRIMARY KEY,
    CINEMA SCOPE IS TB_CINEMA, 
    FUNCIONARIO SCOPE IS TB_FUNCIONARIO 
);
/
CREATE OR REPLACE TABLE TB_SNACK_BAR OF TP_SNACK_BAR(
   ID_SNACK_BAR PRIMARY KEY,
   CINEMA SCOPE IS TB_CINEMA
);
/
CREATE OR REPLACE TABLE TB_PRODUTO OF TP_PRODUTO(
    ID_PRODUTO PRIMARY KEY,
    SNACK_BAR SCOPE IS TB_SNACK_BAR,
    NOME_PRODUTO NOT NULL,
    PRECO NOT NULL
);
/
CREATE OR REPLACE TABLE TB_SALA OF TP_SALA(
    ID_SALA PRIMARY KEY,
    CAPACIDADE NOT NULL
);
/
CREATE OR REPLACE TABLE TB_ATOR OF TP_ATOR(
    NOME_ATOR PRIMARY KEY
);
/
CREATE OR REPLACE TABLE TB_NT_ATOR OF TP_ATOR;
/
CREATE TABLE TB_FILME OF TP_FILM( 
    ID_FILME PRIMARY KEY, 
    Diretor NOT NULL, 
    Nome_Filme NOT NULL 
)NESTED TABLE Atores STORE AS TB_ATORES;
/
CREATE OR REPLACE TABLE TB_FILME_SALA OF TP_FILME_SALA(
    FILME PRIMARY KEY,
    SALA PRIMARY KEY,
    FILME SCOPE IS TB_FILME,
    SALA SCOPE IS TB_SALA
);
/

CREATE OR REPLACE TABLE TB_INGRESSO OF TP_INGRESSO(
   ID_INGRESSO PRIMARY KEY,
   FIME SCOPE IS TB_FILME,
   HORARIO NOT NULL
);
/
CREATE OR REPLACE TABLE TB_VENDE_INGRESSO OF TP_VENDE_INGRESSO(
    INGRESSO PRIMARY KEY,
    INGRESSO SCOPE IS TB_INGRESSO,
    PESSOA SCOPE IS TB_PESSOA,
    FUNCIONARIO SCOPE IS TB_FUNCIONARIO
);
/
CREATE OR REPLACE TABLE TB_EXIBE OF TP_EXIBE(
    SALA PRIMARY KEY,
    PESSOA PRIMARY KEY,
    FILME PRIMARY KEY,

    SALA SCOPE IS TB_SALA,
    PESSOA SCOPE IS TB_PESSOA,
    FILME SCOPE IS TB_FILME
);
/