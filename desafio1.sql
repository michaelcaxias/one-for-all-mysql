CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

-- https://stackoverflow.com/questions/4834390/how-to-use-mysql-decimal

DROP TABLE IF EXISTS planos;
CREATE TABLE planos(
    ID_PLANO INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    TIPO_PLANO VARCHAR(15) NOT NULL DEFAULT 'Sem plano',
    VALOR_PLANO DECIMAL(7, 2) NOT NULL DEFAULT 0
) engine = InnoDB;

INSERT INTO planos (TIPO_PLANO, VALOR_PLANO)
VALUES
  ('Gratuito', 0),
  ('Familiar', 7.99),
  ('Universitario', 5.99),
  ('Pessoal', 6.99);

DROP TABLE IF EXISTS artistas;
CREATE TABLE artistas(
    ID_ARTISTA INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_ARTISTA VARCHAR(50) NOT NULL DEFAULT 'Artista Desconhecido'
) engine = InnoDB;

INSERT INTO artistas (NOME_ARTISTA)
VALUES
  ('Walter Phoenix'),
  ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong'),
  ('Tyler Isle'),
  ('Fog');

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios(
    ID_USUARIO INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_USUARIO VARCHAR(50) NOT NULL DEFAULT 'Sem nome',
    IDADE INTEGER NOT NULL DEFAULT 1,
    ID_PLANO INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY `ID_PLANO_FK` (ID_PLANO) REFERENCES planos(ID_PLANO) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO usuarios (NOME_USUARIO, IDADE, ID_PLANO)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 4),
  ('Norman', 58, 4),
  ('Patrick', 33, 2),
  ('Vivian', 26, 3),
  ('Carol', 19, 3),
  ('Angelina', 42, 2),
  ('Paul', 46, 2);

DROP TABLE IF EXISTS seguindo_artistas;
CREATE TABLE seguindo_artistas(
    ID_USUARIO INTEGER NOT NULL DEFAULT 1,
    ID_ARTISTA INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY(ID_USUARIO, ID_ARTISTA),
    FOREIGN KEY `ID_USUARIO_FK` (ID_USUARIO) REFERENCES usuarios(ID_USUARIO) ON DELETE CASCADE,
    FOREIGN KEY `ID_ARTISTA_FK` (ID_ARTISTA) REFERENCES artistas(ID_ARTISTA) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO seguindo_artistas (ID_USUARIO, ID_ARTISTA)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);

DROP TABLE IF EXISTS albuns;
CREATE TABLE albuns(
    ID_ALBUM INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_ALBUM VARCHAR(50) NOT NULL DEFAULT 'Sem nome',
    ID_ARTISTA INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY `ID_ARTISTA_FK` (ID_ARTISTA) REFERENCES artistas(ID_ARTISTA) ON DELETE CASCADE,
    ANO_LANCAMENTO INTEGER NOT NULL DEFAULT 0
) engine = InnoDB;

INSERT INTO albuns (NOME_ALBUM, ID_ARTISTA, ANO_LANCAMENTO)
VALUES
  ('Envious',1,1990),
  ('Exuberant',1,1993),
  ('Hallowed Steam',4,1995),
  ('Incandescent',3,1998),
  ('Temporary Culture',2,2001),
  ('Library of liberty',2,2003),
  ('Chained Down',5,2007),
  ('Cabinet of fools',5,2012),
  ('No guarantees',5,2015),
  ('Apparatus',6,2015);

DROP TABLE IF EXISTS cancoes;
CREATE TABLE cancoes(
    ID_CANCAO INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_CANCAO VARCHAR(50) NOT NULL DEFAULT 'Sem nome',
    DURACAO_CANCAO_SEGUNDOS INTEGER NOT NULL DEFAULT 0,
    ID_ALBUM INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY `ID_ALBUM_FK` (ID_ALBUM) REFERENCES albuns(ID_ALBUM) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO cancoes (NOME_CANCAO, DURACAO_CANCAO_SEGUNDOS, ID_ALBUM)
VALUES
    ('Soul For Us',200,1),
    ('Reflections Of Magic',163,1),
    ('Dance With Her Own',116,1),
    ('Troubles Of My Inner Fire',203,2),
    ('Time Fireworks',152,2),
    ('Magic Circus',105,3),
    ('Honey, So Do I', 207,3),
    ("Sweetie, Let''s Go Wild", 139,3),
    ('She Knows', 244,3),
    ('Fantasy For Me',100,4),
    ('Celebration Of More', 146,4),
    ('Rock His Everything', 223,4),
    ('Home Forever', 231,4),
    ('Diamond Power', 241,4),
    ("Let''s Be Silly", 132,4),
    ('Thang Of Thunder',240,5),
    ('Words Of Her Life', 185,5),
    ('Without My Streets', 176,5),
    ('Need Of The Evening',190,6),
    ('History Of My Roses', 222,6),
    ('Without My Love', 111,6),
    ('Walking And Game', 123,6),
    ('Young And Father', 197,6),
    ('Finding My Traditions',179,7),
    ('Walking And Man', 229,7),
    ('Hard And Time', 135,7),
    ("Honey, I''m A Lone Wolf", 150,7),
    ("She Thinks I Won''t Stay Tonight",166,8),
    ("He Heard You''re Bad For Me", 154,8),
    ("He Hopes We Can''t Stay", 210,8),
    ('I Know I Know', 117,8),
    ("He''s Walking Away",159,9),
    ("He''s Trouble", 138,9),
    ('I Heard I Want To Bo Alone', 120,9),
    ('I Ride Alone', 151,9),
    ('Honey',79,10),
    ('You Cheated On Me', 95,10),
    ("Wouldn''t It Be Nice", 213,10),
    ('Baby', 136,10),
    ('You Make Me Feel So..', 83,10);

DROP TABLE IF EXISTS musicas_reproduzidas;
CREATE TABLE musicas_reproduzidas(
    ID_USUARIO INTEGER NOT NULL DEFAULT 1,
    ID_CANCAO INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY(ID_USUARIO, ID_CANCAO),
    DATA_REPRODUCAO DATETIME NOT NULL,
    FOREIGN KEY `ID_USUARIO_FK` (ID_USUARIO) REFERENCES usuarios(ID_USUARIO) ON DELETE CASCADE,
    FOREIGN KEY `ID_CANCAO_FK` (ID_CANCAO) REFERENCES cancoes(ID_CANCAO) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO musicas_reproduzidas (ID_USUARIO, ID_CANCAO, DATA_REPRODUCAO)
-- Valores inseridos com a dica do Luiz Gustavo, turma 14
VALUES
  (1, 36, "2020-02-28 10:45:55"),
  (1, 25, "2020-05-02 05:30:35"),
  (1, 23, "2020-03-06 11:22:33"),
  (1, 14, "2020-08-05 08:05:17"),
  (1, 15, "2020-09-14 16:32:22"),
  (2, 34, "2020-01-02 07:40:33"),
  (2, 24, "2020-05-16 06:16:22"),
  (2, 21, "2020-10-09 12:27:48"),
  (2, 39, "2020-09-21 13:14:46"),
  (3, 6, "2020-11-13 16:55:13"),
  (3, 3, "2020-12-05 18:38:30"),
  (3, 26, "2020-07-30 10:00:00"),
  (4, 2, "2021-08-15 17:10:10"),
  (4, 35, "2021-07-10 15:20:30"),
  (4, 27, "2021-01-09 01:44:33"),
  (5, 7, "2020-07-03 19:33:28"),
  (5, 12, "2017-02-24 21:14:22"),
  (5, 14, "2020-08-06 15:23:43"),
  (5, 1, "2020-11-10 13:52:27"),
  (6, 38, "2019-02-07 20:33:48"),
  (6, 29, "2017-01-24 00:31:17"),
  (6, 30, "2017-10-12 12:35:20"),
  (6, 22, "2018-05-29 14:56:41"),
  (7, 5, "2018-05-09 22:30:49"),
  (7, 4, "2020-07-27 12:52:58"),
  (7, 11, "2018-01-16 18:40:43"),
  (8, 39, "2018-03-21 16:56:40"),
  (8, 40, "2020-10-18 13:38:05"),
  (8, 32, "2019-05-25 08:14:03"),
  (8, 33, "2021-08-15 21:37:09"),
  (9, 16, "2021-05-24 17:23:45"),
  (9, 17, "2018-12-07 22:48:52"),
  (9, 8, "2021-03-14 06:14:26"),
  (9, 9, "2020-04-01 03:36:00"),
  (10, 20, "2017-02-06 08:21:34"),
  (10, 21, "2017-12-04 05:33:43"),
  (10, 12, "2017-07-27 05:24:49"),
  (10, 13, "2017-12-25 01:03:57");
