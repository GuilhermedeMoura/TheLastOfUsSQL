--Curso de Engenharia de Software - UniEVANGÉLICA 
--Disciplina de Sisetmas Gerenciadores de Banco de Dados
--Dev: Guilherme de Moura Santos - 2110362 
--DATA: 30/03/2023

CREATE DATABASE the_last_of_us;

USE the_last_of_us;

CREATE TABLE jogador (
  id_jogador INT AUTO_INCREMENT PRIMARY KEY,
  nome_jogador VARCHAR(50) NOT NULL,
  data_nascimento DATE NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  senha VARCHAR(50) NOT NULL
);

CREATE TABLE personagem (
  id_personagem INT AUTO_INCREMENT PRIMARY KEY,
  nome_personagem VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  sexo VARCHAR(10) NOT NULL,
  habilidades VARCHAR(100) NOT NULL,
  descricao VARCHAR(200)
);

CREATE TABLE arma (
  id_arma INT AUTO_INCREMENT PRIMARY KEY,
  nome_arma VARCHAR(50) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  municao INT NOT NULL,
  dano INT NOT NULL
);

CREATE TABLE inimigo (
  id_inimigo INT AUTO_INCREMENT PRIMARY KEY,
  nome_inimigo VARCHAR(50) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  habilidades VARCHAR(100) NOT NULL,
  fraquezas VARCHAR(100) NOT NULL
);

CREATE TABLE jogador_personagem_arma (
  id_relacionamento INT AUTO_INCREMENT PRIMARY KEY,
  id_jogador INT NOT NULL,
  id_personagem INT NOT NULL,
  id_arma INT NOT NULL,
  data_aquisicao DATE NOT NULL,
  FOREIGN KEY (id_jogador) REFERENCES jogador(id_jogador),
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_arma) REFERENCES arma(id_arma),
  UNIQUE KEY (id_jogador, id_personagem, id_arma)
);

CREATE TABLE personagem_inimigo (
  id_relacionamento INT AUTO_INCREMENT PRIMARY KEY,
  id_personagem INT NOT NULL,
  id_inimigo INT NOT NULL,
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_inimigo) REFERENCES inimigo(id_inimigo),
  UNIQUE KEY (id_personagem, id_inimigo)
);
