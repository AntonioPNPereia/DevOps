CREATE TABLE PL_Populacao_Alvo (
  id_populacao_alvo int(11) NOT NULL,
  nome varchar(255) NOT NULL,
  PRIMARY KEY (id_populacao_alvo)
);

CREATE TABLE PL_Areas_Interesse (
  area_int int(11) NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  PRIMARY KEY(area_int)
);

CREATE TABLE PL_Voluntario (
    volun_id int NOT NULL AUTO_INCREMENT,
    username varchar(255) UNIQUE NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    telefone varchar(9) UNIQUE NOT NULL,
    cartao_cidadao varchar(8) UNIQUE NOT NULL,
    carta_conducao bit NOT NULL,
    genero varchar(255) NOT NULL,
    nome varchar(255) NOT NULL,
    freguesia varchar(255) NOT NULL,
    concelho varchar(255) NOT NULL,
    senha varchar(255) NOT NULL,
    nascimento date NOT NULL,
    foto varchar(255) NOT NULL,
    PRIMARY KEY (volun_id)
);

CREATE TABLE PL_Instituicao (
    inst_id int NOT NULL AUTO_INCREMENT,
    nome varchar(255) UNIQUE NOT NULL,
    telefone varchar(9) UNIQUE NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    email_representante varchar(255) UNIQUE NOT NULL,
    nome_representante varchar(255) NOT NULL,
    descricao varchar(255) NOT NULL,
    morada varchar(255) NOT NULL,
    distrito varchar(255) NOT NULL,
    concelho varchar(255) NOT NULL,
    freguesia varchar(255) NOT NULL,
    senha varchar(255) NOT NULL,
    website varchar(255),
    foto varchar(255),
    PRIMARY KEY (inst_id)
);

CREATE TABLE PL_Inst_Acoes (
    acao_id int AUTO_INCREMENT,
    inst_id int NOT NULL,
    nome varchar(255) NOT NULL,
    distrito varchar(255) UNIQUE NOT NULL,
    concelho varchar(255) NOT NULL,
    freguesia varchar(255) NOT NULL,
    funcao varchar(255) NOT NULL,
    numero_vagas int NOT NULL,
    Ativo varchar(3) NOT NULL,
    PRIMARY KEY (acao_id),
    FOREIGN KEY (inst_id) REFERENCES PL_Instituicao(inst_id)
);

CREATE TABLE PL_Acoes_Horario (
    horario_id int NOT NULL AUTO_INCREMENT,
    acao_id int NOT NULL,
    dia varchar(255) NOT NULL,
    periodo varchar(5) NOT NULL,
    PRIMARY KEY (horario_id),
    FOREIGN KEY (acao_id) REFERENCES PL_Inst_Acoes(acao_id)
);

CREATE TABLE PL_Inst_Interesse (
    acao_id int NOT NULL,
    area_int int NOT NULL,
    PRIMARY KEY (acao_id, area_int),
    FOREIGN KEY (acao_id) REFERENCES PL_Inst_Acoes(acao_id),
    FOREIGN KEY (area_int) REFERENCES PL_Areas_Interesse(area_int)
);

CREATE TABLE PL_Inst_Popul_Alvo (
    acao_id int NOT NULL,
    id_popul_alvo int NOT NULL,
    PRIMARY KEY (acao_id, id_popul_alvo),
    FOREIGN KEY (acao_id) REFERENCES PL_Inst_Acoes(acao_id),
    FOREIGN KEY (id_popul_alvo) REFERENCES PL_Populacao_Alvo(id_populacao_alvo)
);

CREATE TABLE PL_Chat (
    id_mensagem INT AUTO_INCREMENT,
    mensagem VARCHAR(255) NOT NULL,
    volun_id INT,
    inst_id INT, 
    sender VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_mensagem),
    FOREIGN KEY (volun_id) REFERENCES PL_Voluntario (volun_id),
    FOREIGN KEY (inst_id) REFERENCES PL_Instituicao(inst_id)
);

CREATE TABLE PL_Admin (
  admin_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(30) NOT NULL UNIQUE,
  senha varchar(30) NOT NULL,
  PRIMARY KEY (admin_id)
);

CREATE TABLE PL_Volun_Horario (
    horario_id int NOT NULL AUTO_INCREMENT,
    volun_id int NOT NULL,
    dia varchar(255) NOT NULL,
    hora_inicio varchar(5) NOT NULL,
    hora_fim varchar(5) NOT NULL,
    PRIMARY KEY (horario_id),
    FOREIGN KEY (volun_id) REFERENCES PL_Voluntario(volun_id)
);

CREATE TABLE PL_Volun_Interesse (
  area_int int(11) NOT NULL,
  volun_id int(11) NOT NULL,
  PRIMARY KEY(area_int, volun_id),
  FOREIGN KEY (volun_id) REFERENCES PL_Voluntario(volun_id),
  FOREIGN KEY (area_int) REFERENCES PL_Areas_Interesse(area_int)
);

CREATE TABLE PL_Volun_Populacao_Alvo (
    id_populacao_alvo int NOT NULL,
    volun_id int NOT NULL,
    PRIMARY KEY (id_populacao_alvo, volun_id),
    FOREIGN KEY (volun_id) REFERENCES PL_Voluntario(volun_id),
    FOREIGN KEY (id_populacao_alvo) REFERENCES PL_Populacao_Alvo(id_populacao_alvo)
);

INSERT INTO `PL_Admin` (`admin_id`, `username`, `senha`) VALUES ('1', 'admin', 'admin');

-- Voluntários
INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('rui', 'rui@email.com', '912345678', '12345678', 1, 'Masculino', 'Rui Silva', 'Freguesia A', 'Concelho X', 'senha123', '1990-05-15', 'foto1.jpg');

INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('ana', 'ana@email.com', '923456789', '23456789', 0, 'Feminino', 'Ana Pereira', 'Freguesia B', 'Concelho Y', 'senha456', '1988-03-20', 'foto2.jpg');

INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('carlos', 'carlos@email.com', '934567890', '34567890', 1, 'Masculino', 'Carlos Santos', 'Freguesia C', 'Concelho Z', 'senha789', '1995-08-10', 'foto3.jpg');

INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('marta', 'marta@email.com', '945678901', '45678901', 0, 'Feminino', 'Marta Ferreira', 'Freguesia A', 'Concelho X', 'senhaabc', '1992-12-25', 'foto4.jpg');

INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('luis', 'luis@email.com', '956789012', '56789012', 1, 'Masculino', 'Luís Alves', 'Freguesia D', 'Concelho W', 'senhaxyz', '1998-06-30', 'foto5.jpg');

INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('maria', 'maria@email.com', '967890123', '67890123', 0, 'Feminino', 'Maria Rocha', 'Freguesia E', 'Concelho V', 'senha1234', '1993-02-12', 'foto6.jpg');

INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('joao', 'joao@email.com', '978901234', '78901234', 1, 'Masculino', 'João Oliveira', 'Freguesia F', 'Concelho U', 'senha5678', '1996-11-05', 'foto7.jpg');

INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('ana2', 'ana2@email.com', '989012345', '89012345', 0, 'Feminino', 'Ana Sousa', 'Freguesia G', 'Concelho T', 'senhaabcd', '1994-04-18', 'foto8.jpg');

INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('joaquim', 'joaquim@email.com', '900123456', '90123456', 1, 'Masculino', 'Joaquim Pires', 'Freguesia H', 'Concelho S', 'senha9999', '1991-09-08', 'foto9.jpg');

INSERT INTO PL_Voluntario (username, email, telefone, cartao_cidadao, carta_conducao, genero, nome, freguesia, concelho, senha, nascimento, foto)
VALUES ('sara', 'sara@email.com', '911234567', '11234567', 0, 'Feminino', 'Sara Gomes', 'Freguesia I', 'Concelho R', 'senhazxy', '1997-07-22', 'foto10.jpg');

-- Instituições
INSERT INTO PL_Instituicao (nome, telefone, email, email_representante, nome_representante, descricao, morada, distrito, concelho, freguesia, senha, website, foto)
VALUES ('Instituição A', '123456789', 'instituicaoA@email.com', 'repA@email.com', 'Representante A', 'Descrição da Instituição A', 'Morada A', 'Lisboa', 'Lisboa', 'Areeiro', 'senha123', 'http://www.instituicaoA.com', 'foto_instA.jpg');

INSERT INTO PL_Instituicao (nome, telefone, email, email_representante, nome_representante, descricao, morada, distrito, concelho, freguesia, senha, website, foto)
VALUES ('Instituição B', '234567890', 'instituicaoB@email.com', 'repB@email.com', 'Representante B', 'Descrição da Instituição B', 'Morada B', 'Porto', 'Porto', 'Paranhos', 'senha456', 'http://www.instituicaoB.com', 'foto_instB.jpg');

INSERT INTO PL_Instituicao (nome, telefone, email, email_representante, nome_representante, descricao, morada, distrito, concelho, freguesia, senha, website, foto)
VALUES ('Instituição C', '345678901', 'instituicaoC@email.com', 'repC@email.com', 'Representante C', 'Descrição da Instituição C', 'Morada C', 'Aveiro', 'Aveiro', 'Esgueira', 'senha789', 'http://www.instituicaoC.com', 'foto_instC.jpg');

INSERT INTO PL_Instituicao (nome, telefone, email, email_representante, nome_representante, descricao, morada, distrito, concelho, freguesia, senha, website, foto)
VALUES ('Instituição D', '456789012', 'instituicaoD@email.com', 'repD@email.com', 'Representante D', 'Descrição da Instituição D', 'Morada D', 'Faro', 'Faro', 'Faro (Sé e São Pedro)', 'senhaabc', 'http://www.instituicaoD.com', 'foto_instD.jpg');

INSERT INTO PL_Instituicao (nome, telefone, email, email_representante, nome_representante, descricao, morada, distrito, concelho, freguesia, senha, website, foto)
VALUES ('Instituição E', '567890123', 'instituicaoE@email.com', 'repE@email.com', 'Representante E', 'Descrição da Instituição E', 'Morada E', 'Braga', 'Braga', 'São Victor', 'senhaxyz', 'http://www.instituicaoE.com', 'foto_instE.jpg');

-- Acoes

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (1, 'Ação 16', 'Lisboa A', 'Odivelas', 'Ramada', 'Função P', 5, 'Nao');

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (2, 'Ação 17', 'Porto A', 'Maia', 'Águas Santas', 'Função Q', 8, 'Sim');

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (3, 'Ação 18', 'Aveiro A', 'Ílhavo', 'Gafanha da Nazaré', 'Função R', 7, 'Nao');

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (4, 'Ação 19', 'Faro', 'Albufeira', 'Albufeira', 'Função S', 10, 'Sim');

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (5, 'Ação 20', 'Braga A', 'Barcelos', 'Vila Boa', 'Função T', 6, 'Nao');

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (1, 'Ação 21', 'Lisboa', 'Sintra', 'Algueirão-Mem Martins', 'Função U', 4, 'Sim');

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (2, 'Ação 22', 'Porto', 'Gondomar', 'Rio Tinto', 'Função V', 6, 'Sim');

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (3, 'Ação 23', 'Aveiro', 'Santa Maria da Feira', 'Fiães', 'Função W', 7, 'Sim');

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (4, 'Ação 24', 'Faro A', 'Loulé', 'Quarteira', 'Função X', 5, 'Sim');

INSERT INTO PL_Inst_Acoes (inst_id, nome, distrito, concelho, freguesia, funcao, numero_vagas, Ativo)
VALUES (5, 'Ação 25', 'Braga', 'Viana do Castelo', 'Caminha', 'Função Y', 8, 'Nao');
