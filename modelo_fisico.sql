-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Hospedagem (
hospedagem_id VARCHAR(10) PRIMARY KEY,
usuario_id VARCHAR(10),
origem VARCHAR(10),
data_ida VARCHAR(10),
destino VARCHAR(10),
com_datas_definidas VARCHAR(10),
quant_quartos VARCHAR(10),
data_volta VARCHAR(10),
is_tranferir VARCHAR(10),
is_cancelado VARCHAR(10)
)

CREATE TABLE cidades (
cid_id VARCHAR(10) PRIMARY KEY,
uf_id VARCHAR(10),
cid_nome VARCHAR(10)
)

CREATE TABLE Passagem (
passagem_id VARCHAR(10) PRIMARY KEY,
usuario_id VARCHAR(10),
multi_destino VARCHAR(10),
ida VARCHAR(10),
ida_e_volta VARCHAR(10)
)

CREATE TABLE Meus_Servicos (
id VARCHAR(10) PRIMARY KEY,
servico_fk_id VARCHAR(10),
created_at VARCHAR(10),
updated_at VARCHAR(10),
FOREIGN KEY(servico_fk_id) REFERENCES Hospedagem (hospedagem_id)
)

CREATE TABLE Endereco (
endereco_id VARCHAR(10) PRIMARY KEY,
usuario_id VARCHAR(10),
tipo VARCHAR(10),
rua VARCHAR(20),
numero VARCHAR(150 )
)

CREATE TABLE Fornecedor_Servico (
fornecedor_servico_id Número(4) PRIMARY KEY,
servico_fk_id VARCHAR(10),
fornecedor_id VARCHAR(10),
tipo VARCHAR()
)

CREATE TABLE Pacote (
pacote_id VARCHAR(10) PRIMARY KEY,
usuario_id VARCHAR(10),
destino VARCHAR(10),
quant_quartos VARCHAR(10),
data_ida VARCHAR(10),
origem VARCHAR(10)
)

CREATE TABLE Servicos_Cancelados (
id VARCHAR(10) PRIMARY KEY,
meu_serivico_fk_id VARCHAR(10),
data_cancelamento VARCHAR(10),
motivo Número(4),
FOREIGN KEY(meu_serivico_fk_id) REFERENCES Meus_Servicos (id)
)

CREATE TABLE uf (
uf_id VARCHAR(10) PRIMARY KEY,
uf_nome VARCHAR(10),
codigo VARCHAR(10)
)

CREATE TABLE Pais (
codigo VARCHAR(10) PRIMARY KEY,
nome VARCHAR(10)
)

CREATE TABLE Usuario (
usuario_id VARCHAR(10) PRIMARY KEY,
data_nascimento VARCHAR(10),
ativacao VARCHAR(10),
senha VARCHAR(10),
nome VARCHAR(10),
sobrenome VARCHAR(10),
email VARCHAR(10),
sexo VARCHAR(10)
)

CREATE TABLE Fornecedor (
fornecedor_id VARCHAR(10) PRIMARY KEY,
nome VARCHAR(10),
telefone VARCHAR(10),
cnpj VARCHAR(10)
)

CREATE TABLE Contatos (
contato_id VARCHAR(10) PRIMARY KEY,
usuario_fornecedor_id VARCHAR(10),
numero_telefone VARCHAR(10),
tipo ENUM(4),
FOREIGN KEY(usuario_fornecedor_id) REFERENCES Usuario (usuario_id)
)

ALTER TABLE Hospedagem ADD FOREIGN KEY(usuario_id) REFERENCES Usuario (usuario_id)
ALTER TABLE cidades ADD FOREIGN KEY(uf_id) REFERENCES uf (uf_id)
ALTER TABLE Passagem ADD FOREIGN KEY(usuario_id) REFERENCES Usuario (usuario_id)
ALTER TABLE Endereco ADD FOREIGN KEY(usuario_id) REFERENCES Usuario (usuario_id)
ALTER TABLE Fornecedor_Servico ADD FOREIGN KEY(servico_fk_id) REFERENCES Pacote (pacote_id)
ALTER TABLE Fornecedor_Servico ADD FOREIGN KEY(fornecedor_id) REFERENCES Fornecedor (fornecedor_id)
ALTER TABLE Pacote ADD FOREIGN KEY(usuario_id) REFERENCES Usuario (usuario_id)
ALTER TABLE uf ADD FOREIGN KEY(codigo) REFERENCES Pais (codigo)
