CREATE DATABASE softblue;

USE softblue;

CREATE TABLE instrutor
(
	cod_instrutor int not null auto_increment unique,
    nome varchar(50) not null,
    telefone char(11) not null,
    PRIMARY KEY (cod_instrutor)
);

CREATE TABLE tipo
(
	cod_tipo int not null auto_increment unique,
    tipo varchar(30) not null,
    PRIMARY KEY (cod_tipo)
);

CREATE TABLE curso
( 
	cod_curso int not null auto_increment unique,
    curso varchar(50) not null,
    valor double not null,
    cod_tipo int not null,
    cod_instrutor int not null,
    PRIMARY KEY (cod_curso),
    FOREIGN KEY (cod_tipo) REFERENCES tipo(cod_tipo),
    FOREIGN KEY (cod_instrutor) REFERENCES instrutor(cod_instrutor)
);

CREATE TABLE aluno
(
	cod_aluno int not null auto_increment unique,
    nome varchar(50) not null,
    email varchar(70) not null,
    sexo char(1) not null,
    PRIMARY KEY (cod_aluno)
);

CREATE TABLE endereco
(
	cod_endereco int not null auto_increment unique,
    rua varchar(100) not null,
    cidade varchar(50) not null,
    estado varchar(20) not null,
    regiao varchar(20) not null,
    PRIMARY KEY (cod_endereco),
    FOREIGN KEY (cod_endereco) REFERENCES aluno(cod_aluno)
);

CREATE TABLE compra
(
	cod_compra int not null auto_increment unique,
    data date not null,
    cod_aluno int,
    PRIMARY KEY (cod_compra),
    FOREIGN KEY (cod_compra) REFERENCES aluno(cod_aluno)
);

CREATE TABLE detalhe
(
	cod_compra int not null,
    cod_curso int not null,
    valor double not null,
    FOREIGN KEY (cod_compra) REFERENCES compra(cod_compra),
    FOREIGN KEY (cod_curso) REFERENCES curso(cod_curso)
);