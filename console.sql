-- CRIACAO DAS TABELAS
CREATE TABLE TIPO_USUARIO (
  tipo INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(15) NOT NULL,
  PRIMARY KEY(tipo)
);

CREATE TABLE CONTA_USUARIO
(
matricula int NOT NULL,
nome VARCHAR(40),
login VARCHAR(30) NOT NULL ,
senha  VARCHAR(30) NOT NULL ,
tipoacesso INT NOT NULL,
primary key (login)
);

CREATE TABLE TIPO_PESSOA
(
  tipo CHAR(1) NOT NULL,
  descricao CHAR(2),
PRIMARY KEY (tipo)
);

CREATE TABLE PESSOA
(
matricula int NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
endereco VARCHAR(50),
telefone VARCHAR(20) NOT NULL,
email VARCHAR(30) NOT NULL,
rg VARCHAR(12),
cpf_cnpj VARCHAR(18) NOT NULL ,
status char(1) NOT NULL , -- FK Tabela STATUS feito
tipo char(1) NOT NULL, -- FK Tabela TIPO_PESSOA feito
tipo_emp char(1) NOT NULL, -- FK TIPO_EMP feito
depto CHAR(1), -- FK DEPARTAMENTO feito
cargo CHAR(1), -- FK CARGO feito
primary key (matricula)
);

-- Necessário colocar matricula, rg, cpf_cnpj como UNIQUE
ALTER TABLE PESSOA
ADD UNIQUE (matricula);

CREATE TABLE DEPARTAMENTO
(
  id CHAR(1) NOT NULL,
  departamento VARCHAR(20),
  PRIMARY KEY (id)
);

CREATE TABLE DEPARTAMENTO
(
  id CHAR(1) NOT NULL,
  departamento VARCHAR(20),
  PRIMARY KEY (id)
);

INSERT INTO DEPARTAMENTO(id, departamento)
VALUES ('1','Controle de Cargas');

INSERT INTO DEPARTAMENTO(id, departamento)
VALUES ('2','RH');

INSERT INTO DEPARTAMENTO(id, departamento)
VALUES ('3','Seg da Informação');

INSERT INTO DEPARTAMENTO(id, departamento)
VALUES ('4','Cliente');

CREATE TABLE TIPO_EMP
(
  id CHAR(1) NOT NULL,
  tipo_emp VARCHAR(15),
  PRIMARY KEY (id)
);

INSERT INTO TIPO_EMP(id, tipo_emp)
VALUES ('1','Cliente');

INSERT INTO TIPO_EMP(id, tipo_emp)
VALUES ('2','Funcionario');

CREATE TABLE CARGO
(
  id CHAR(1) NOT NULL,
  cargo VARCHAR(20),
  PRIMARY KEY (id)
);

INSERT INTO CARGO(id, cargo)
VALUES ('1','Operador');

INSERT INTO CARGO(id, cargo)
VALUES ('2','Cliente');

CREATE TABLE TIPO_PESSOA
(
  tipo CHAR(1) NOT NULL,
  descricao CHAR(2),
PRIMARY KEY (tipo)
);

INSERT INTO TIPO_PESSOA(tipo, descricao)
VALUES ('1','PF');

INSERT INTO TIPO_PESSOA(tipo, descricao)
VALUES ('2','PJ');

-- CRIA A CHAVE EXTRANGEIRA
ALTER TABLE CONTA_USUARIO
ADD CONSTRAINT fk_conta_usuario_tipo_usuario
FOREIGN KEY (tipoacesso)
REFERENCES TIPO_USUARIO(tipo);

ALTER TABLE CONTA_USUARIO
ADD CONSTRAINT fk_conta_usuario_pessoa
FOREIGN KEY (matricula)
REFERENCES PESSOA(matricula);

ALTER TABLE PESSOA
ADD CONSTRAINT fk_pessoa_status
FOREIGN KEY (status)
REFERENCES STATUS(tipo);

ALTER TABLE PESSOA
ADD CONSTRAINT fk_pessoa_tipo
FOREIGN KEY (tipo)
REFERENCES TIPO_PESSOA(tipo);

ALTER TABLE PESSOA
ADD CONSTRAINT fk_pessoa_tipo_emp
FOREIGN KEY (tipo_emp)
REFERENCES TIPO_EMP(id);

ALTER TABLE PESSOA
ADD CONSTRAINT fk_pessoa_departamento
FOREIGN KEY (depto)
REFERENCES DEPARTAMENTO(id);

ALTER TABLE PESSOA
ADD CONSTRAINT fk_pessoa_cargo
FOREIGN KEY (cargo)
REFERENCES CARGO(id);

INSERT INTO TIPO_PESSOA(tipo, descricao)
VALUES (1,'PF');

INSERT INTO TIPO_PESSOA(tipo, descricao)
VALUES (2,'PJ');



-- ==============================//=========================

CREATE TABLE DEPARTAMENTO
(
  id int NOT NULL,
  nome_depto VARCHAR(20),
  PRIMARY KEY (id)
);

CREATE TABLE CARGO
(
  id int NOT NULL,
  nome_cargo VARCHAR(20),
  PRIMARY KEY (id)
);
-- ==============================//=========================



