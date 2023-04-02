/*
Curso: ngenharia de Software - UniEVANGÉLICA

Disciplina: Sistemas Gerenciadores de Banco de Dados

Dev: Guilherme de Moura Santos - 2110362

Data: 27/03/2023
*/


-- Criação do banco de dados
CREATE DATABASE the_last_of_us;

-- Utilização do banco de dados criado
USE the_last_of_us;

-- Tabela Jogador
CREATE TABLE jogador (
id_jogador INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
nome_jogador VARCHAR(50) NOT NULL, -- Nome do jogador, não pode ser nulo
data_nascimento DATE NOT NULL, -- Data de nascimento do jogador, não pode ser nula
email VARCHAR(50) NOT NULL UNIQUE, -- E-mail do jogador, não pode ser nulo e deve ser único
senha VARCHAR(50) NOT NULL -- Senha do jogador, não pode ser nula
);

-- Tabela Personagem
CREATE TABLE personagem (
id_personagem INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
nome_personagem VARCHAR(50) NOT NULL, -- Nome do personagem, não pode ser nulo
idade INT NOT NULL, -- Idade do personagem, não pode ser nula
sexo ENUM('M', 'F', 'O') NOT NULL, -- Sexo do personagem, não pode ser nulo e deve ser um dos valores definidos no ENUM
habilidades VARCHAR(100) NOT NULL, -- Habilidades do personagem, não pode ser nulo
descricao VARCHAR(200), -- Descrição do personagem, pode ser nulo
CHECK (idade >= 0) -- Restrição de idade não pode ser negativa
);

-- Tabela Arma
CREATE TABLE arma (
id_arma INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
nome_arma VARCHAR(50) NOT NULL, -- Nome da arma, não pode ser nulo
tipo ENUM('Pistola', 'Rifle', 'Faca', 'Arco') NOT NULL, -- Tipo da arma, não pode ser nulo e deve ser um dos valores definidos no ENUM
municao INT NOT NULL, -- Quantidade de munição da arma, não pode ser nulo
dano INT NOT NULL, -- Dano da arma, não pode ser nulo
CHECK (municao >= 0), -- Restrição de munição não pode ser negativa
CHECK (dano >= 0) -- Restrição de dano não pode ser negativa
);

-- Tabela Inimigo
CREATE TABLE inimigo (
id_inimigo INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
nome_inimigo VARCHAR(50) NOT NULL, -- Nome do inimigo, não pode ser nulo
tipo ENUM('Zumbi', 'Cordyceps', 'Humano') NOT NULL, -- Tipo do inimigo, não pode ser nulo e deve ser um dos valores definidos no ENUM
habilidades VARCHAR(100) NOT NULL, -- Habilidades do inimigo, não pode ser nulo
fraquezas VARCHAR(100) NOT NULL -- Fraquezas do inimigo, não pode ser nulo
);
-- Cria a tabela jogador_personagem_arma
CREATE TABLE jogador_personagem_arma (
id_relacionamento INT AUTO_INCREMENT PRIMARY KEY,-- Define a coluna id_relacionamento como chave primária e autoincremento
id_jogador INT NOT NULL, -- Define a coluna id_jogador como obrigatória e referenciando a tabela jogador
id_personagem INT NOT NULL,-- Define a coluna id_personagem como obrigatória e referenciando a tabela personagem
id_arma INT NOT NULL,-- Define a coluna id_arma como obrigatória e referenciando a tabela arma
data_aquisicao DATE NOT NULL,-- Define a coluna data_aquisicao como obrigatória
FOREIGN KEY (id_jogador) REFERENCES jogador(id_jogador),-- Adiciona uma chave estrangeira na coluna id_jogador referenciando a tabela jogador
FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),-- Adiciona uma chave estrangeira na coluna id_personagem referenciando a tabela personagem
FOREIGN KEY (id_arma) REFERENCES arma(id_arma),-- Adiciona uma chave estrangeira na coluna id_arma referenciando a tabela arma
UNIQUE KEY (id_jogador, id_personagem, id_arma)-- Define uma chave única para as colunas id_jogador, id_personagem e id_arma
);

-- Cria a tabela personagem_inimigo
CREATE TABLE personagem_inimigo (
id_relacionamento INT AUTO_INCREMENT PRIMARY KEY, -- Define a coluna id_relacionamento como chave primária e autoincremento
id_personagem INT NOT NULL,-- Define a coluna id_personagem como obrigatória e referenciando a tabela personagem
id_inimigo INT NOT NULL,-- Define a coluna id_inimigo como obrigatória e referenciando a tabela inimigo
FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),-- Adiciona uma chave estrangeira na coluna id_personagem referenciando a tabela personagem
FOREIGN KEY (id_inimigo) REFERENCES inimigo(id_inimigo),-- Adiciona uma chave estrangeira na coluna id_inimigo referenciando a tabela inimigo
UNIQUE KEY '(id_personagem, id_inimigo)'-- Define uma chave única para as colunas id_personagem e id_inimigo
);