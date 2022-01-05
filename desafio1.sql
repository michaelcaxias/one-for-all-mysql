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
  ('Gratuito', '0'),
  ('Familiar', '7.99'),
  ('Universitario', '5.99'),
  ('Pessoal', '6.99');

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
    ID_SEGUINDO_ARTISTA INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_USUARIO INTEGER NOT NULL DEFAULT 1,
    ID_ARTISTA INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY `ID_USUARIO_FK` (ID_USUARIO) REFERENCES usuarios(ID_USUARIO) ON DELETE CASCADE,
    FOREIGN KEY `ID_ARTISTA_FK` (ID_ARTISTA) REFERENCES artistas(ID_ARTISTA) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO seguindo_artistas (ID_USUARIO, ID_ARTISTA)
VALUES
    (1,1),
    (1,2),
    (1,3),
    (2,1),
    (2,3),
    (3,4),
    (3,1),
    (4,2),
    (5,5),
    (5,6),
    (6,6),
    (6,3),
    (6,1),
    (7,4),
    (7,5),
    (8,1),
    (8,5),
    (9,6),
    (9,2),
    (9,3),
    (10,4),
    (10,6);

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
    ('Sweetie, Let''s Go Wild', 139,3),
    ('She Knows', 244,3),
    ('Fantasy For Me',100,4),
    ('Celebration Of More', 146,4),
    ('Rock His Everything', 223,4),
    ('Home Forever', 231,4),
    ('Diamond Power', 241,4),
    ('Let''s Be Silly', 132,4),
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
    ('Honey, I''m A Lone Wolf', 150,7),
    ('She Thinks I Won''t Stay Tonight',166,8),
    ('He Heard You''re Bad For Me', 154,8),
    ('He Hopes We Can''t Stay', 210,8),
    ('I Know I Know', 117,8),
    ('He''s Walking Away',159,9),
    ('He''s Trouble', 138,9),
    ('I Heard I Want To Bo Alone', 120,9),
    ('I Ride Alone', 151,9),
    ('Honey',79,10),
    ('You Cheated On Me', 95,10),
    ('Wouldn''t It Be Nice', 213,10),
    ('Baby', 136,10),
    ('You Make Me Feel So..', 83,10);