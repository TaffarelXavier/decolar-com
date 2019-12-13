-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
drop database if exists decolar_db;
create database decolar_db;
use decolar_db;


CREATE TABLE Hospedagem (
hospedagem_id int(11) PRIMARY KEY AUTO_INCREMENT,
usuario_id int(11),
origem VARCHAR(100),
data_ida VARCHAR(100),
destino VARCHAR(100),
com_datas_definidas INT (1) ,
quant_quartos VARCHAR(255),
data_volta VARCHAR(255),
is_tranferir VARCHAR(255),
is_cancelado VARCHAR(255)
);

CREATE TABLE cidades (
cid_id int(11) PRIMARY KEY AUTO_INCREMENT,
uf_id INT(11),
cid_nome VARCHAR(255)
);

CREATE TABLE Passagem (
passagem_id int(11) PRIMARY KEY AUTO_INCREMENT,
usuario_id int(11),
multi_destino VARCHAR(255),
ida VARCHAR(255),
ida_e_volta VARCHAR(255)
);

CREATE TABLE Meus_Servicos (
id int(11) PRIMARY KEY AUTO_INCREMENT,
servico_fk_id int(11),
created_at VARCHAR(255),
updated_at VARCHAR(255),
FOREIGN KEY(servico_fk_id) REFERENCES Hospedagem (hospedagem_id)
);

CREATE TABLE Endereco (
endereco_id int(11) PRIMARY KEY AUTO_INCREMENT,
usuario_id VARCHAR(255),
tipo VARCHAR(255),
rua VARCHAR(20),
numero VARCHAR(150 )
);

CREATE TABLE Fornecedor_Servico (
fornecedor_servico_id int(11) PRIMARY KEY AUTO_INCREMENT,
servico_fk_id int(255),
fornecedor_id int(255),
tipo VARCHAR(45)
);

CREATE TABLE Pacote (
pacote_id int(11) PRIMARY KEY AUTO_INCREMENT,
usuario_id VARCHAR(255),
destino VARCHAR(255),
quant_quartos VARCHAR(255),
data_ida VARCHAR(255),
origem VARCHAR(255)
);

CREATE TABLE Servicos_Cancelados (
id INT(11) PRIMARY KEY AUTO_INCREMENT,
meu_serivico_fk_id VARCHAR(255),
data_cancelamento VARCHAR(255),
motivo VARCHAR(255),
FOREIGN KEY(meu_serivico_fk_id) REFERENCES Meus_Servicos (id)
);

CREATE TABLE uf (
uf_id INT(11) PRIMARY KEY AUTO_INCREMENT,
uf_nome VARCHAR(255),
codigo VARCHAR(255)
);

CREATE TABLE Pais (
codigo INT(11) PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255)
);

CREATE TABLE Usuario (
usuario_id INT(11) PRIMARY KEY AUTO_INCREMENT,
data_nascimento VARCHAR(255),
ativacao VARCHAR(255),
senha VARCHAR(255),
nome VARCHAR(255),
sobrenome VARCHAR(255),
email VARCHAR(255),
sexo VARCHAR(255)
);

CREATE TABLE Fornecedor (
fornecedor_id INT(11) PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255),
cnpj VARCHAR(20)
);

CREATE TABLE Contatos (
contato_id INT(11) PRIMARY KEY AUTO_INCREMENT,
usuario_fornecedor_id INT(255),
numero_telefone VARCHAR(20),
tipo varchar(255),
FOREIGN KEY(usuario_fornecedor_id) REFERENCES Usuario (usuario_id)
);

ALTER TABLE Hospedagem ADD FOREIGN KEY(usuario_id) REFERENCES Usuario (usuario_id);
ALTER TABLE cidades ADD FOREIGN KEY(uf_id) REFERENCES uf (uf_id);
ALTER TABLE Passagem ADD FOREIGN KEY(usuario_id) REFERENCES Usuario (usuario_id);
ALTER TABLE Endereco ADD FOREIGN KEY(usuario_id) REFERENCES Usuario (usuario_id);
ALTER TABLE Fornecedor_Servico ADD FOREIGN KEY(servico_fk_id) REFERENCES Pacote (pacote_id);
ALTER TABLE Fornecedor_Servico ADD FOREIGN KEY(fornecedor_id) REFERENCES Fornecedor (fornecedor_id);
ALTER TABLE Pacote ADD FOREIGN KEY(usuario_id) REFERENCES Usuario (usuario_id);
ALTER TABLE uf ADD FOREIGN KEY(codigo) REFERENCES Pais (codigo);
