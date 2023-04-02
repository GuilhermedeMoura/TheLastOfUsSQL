/*
Curso: ngenharia de Software - UniEVANGÉLICA

Disciplina: Sistemas Gerenciadores de Banco de Dados 

Dev: Guilherme de Moura Santos - 2110362

Data: 27/03/2023
*/

INSERT INTO personagem_inimigo (id_relacionamento, id_personagem, id_inimigo)
VALUES
        (1, 1, 1),
        (2, 1, 2),
        (3, 2, 1),
        (4, 2, 2),
        (5, 3, 1),
        (6, 3, 3),
        (7, 4, 2),
        (8, 4, 3),
        (9, 5, 2),
        (10, 5, 4),
        (11, 6, 3),
        (12, 6, 4),
        (13, 7, 1),
        (14, 7, 4),
        (15, 8, 1),
        (16, 8, 3),
        (17, 9, 2),
        (18, 9, 4),
        (19, 10, 1),
        (20, 10, 2),
        (21, 11, 3),
        (22, 11, 4),
        (23, 12, 1),
        (24, 12, 4),
        (25, 13, 2),
        (26, 13, 3),
        (27, 14, 1),
        (28, 14, 3),
        (29, 15, 2),
        (30, 15, 4),
        (31, 16, 1),
        (32, 16, 2),
        (33, 17, 3),
        (34, 17, 4),
        (35, 18, 1),
        (36, 18, 4),
        (37, 19, 2),
        (38, 19, 3),
        (39, 20, 1),
        (40, 20, 2),
        (41, 21, 3),
        (42, 21, 4),
        (43, 22, 1),
        (44, 22, 4),
        (45, 23, 2),
        (46, 23, 3),
        (47, 24, 1),
        (48, 24, 3),
        (49, 25, 2),
        (50, 25, 4),
        (51, 26, 1),
        (52, 26, 2),
        (53, 27, 3),
        (54, 27, 4),
        (55, 28, 1),
        (56, 28, 4),
        (57, 29, 2),
        (58, 29, 3),
        (59, 30, 1),
        (60, 30, 2),
        (61, 31, 3),
        (62, 31, 4),
        (63, 32, 1),
        (64, 32, 4),
        (65, 33, 2),
        (66, 33, 3),
        (67, 34, 1),
        (68, 34, 3),
        (69, 35, 2),
        (70, 35, 4),
        (71, 36, 1),
        (72, 6, 2),
        (73, 7, 3),
        (74, 7, 4),
        (75, 8, 2),
        (76, 8, 4),
        (77, 9, 1),
        (78, 9, 3),
        (79, 10, 3),
        (80, 10, 4),
        (81, 11, 1),
        (82, 11, 2),
        (83, 12, 3),
        (84, 12, 4),
        (85, 13, 1),
        (86, 13, 4),
        (87, 14, 2),
        (88, 14, 3),
        (89, 15, 1),
        (90, 15, 3),
        (91, 16, 2),
        (92, 16, 4),
        (93, 17, 1),
        (94, 17, 2),
        (95, 18, 3),
        (96, 18, 4),
        (97, 19, 1),
        (98, 19, 4),
        (99, 20, 2),
        (100, 20, 3);

SELECT j.nome_jogador, i.tipo
FROM jogador j
INNER JOIN jogador_personagem_arma jpa ON j.id_jogador = jpa.id_jogador
INNER JOIN personagem_inimigo pi ON jpa.id_personagem = pi.id_personagem
INNER JOIN inimigo i ON pi.id_inimigo = i.id_inimigo;

SELECT p.nome_personagem, i.tipo, i.habilidades
FROM personagem p
INNER JOIN personagem_inimigo pi ON p.id_personagem = pi.id_personagem
INNER JOIN inimigo i ON pi.id_inimigo = i.id_inimigo;

SELECT j.nome_jogador, p.nome_personagem, i.nome_inimigo, i.fraquezas
FROM jogador j
INNER JOIN jogador_personagem_arma jpa ON j.id_jogador = jpa.id_jogador
INNER JOIN personagem_inimigo pi ON jpa.id_personagem = pi.id_personagem
INNER JOIN inimigo i ON pi.id_inimigo = i.id_inimigo;
