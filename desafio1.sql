CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

-- https://stackoverflow.com/questions/4834390/how-to-use-mysql-decimal

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

CREATE TABLE usuarios(
    ID_USUARIO INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_USUARIO VARCHAR(50) NOT NULL DEFAULT 'Sem nome',
    IDADE INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY `ID_PLANO_FK` (ID_PLANO) REFERENCES planos(ID_PLANO) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO usuarios (NOME_USUARIO, IDADE)
VALUES
  ('Tathi', 23),
  ('Cintia', 35),
  ('Bill', 20),
  ('Roger', 45),
  ('Norman', 58),
  ('Patrick', 33),
  ('Vivian', 26),
  ('Carol', 19),
  ('Angelina', 42),
  ('Paul', 46);


CREATE TABLE artistas(
    ID_ARTISTA INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_ARTISTA VARCHAR(50) NOT NULL DEFAULT 'Artista Desconhecido',
) engine = InnoDB;

INSERT INTO artistas (NOME_ARTISTA)
VALUES
  ('Walter Phoenix'),
  ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong'),
  ('Tyler Isle'),
  ('Fog');

CREATE TABLE albuns(
    ID_ALBUM INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_ALBUM VARCHAR(50) NOT NULL DEFAULT 'Sem nome',
    FOREIGN KEY `ID_ARTISTA_FK` (ID_ARTISTA) REFERENCES artistas(ID_ARTISTA) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO albuns (NOME_ALBUM)
VALUES
  ('Envious'),
  ('Exuberant'),
  ('Hallowed Steam'),
  ('Incandescent'),
  ('Temporary Culture'),
  ('Library of liberty'),
  ('Chained Down'),
  ('Cabinet of fools'),
  ('No guarantees'),
  ('Apparatus');

CREATE TABLE cancoes(
    ID_CANCAO INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_CANCAO VARCHAR(50) NOT NULL DEFAULT 'Sem nome',
    DURACAO_CANCAO_SEGUNDOS INTEGER NOT NULL DEFAULT 0,
    ID_ALBUM INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY `ID_ARTISTA_FK` (ID_ARTISTA) REFERENCES artistas(ID_ARTISTA) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO cancoes (NOME_CANCAO, DURACAO_CANCAO_SEGUNDOS, ID_ALBUM)
VALUES
  ('Soul For Us', 200, 1),
  ('Reflections Of Magic', 163, 1),
  ('Dance With Her Own', 116, 1),
  ('Troubles Of My Inner Fire', 203, 2),
  ('Time Fireworks', 152, 2),
  ('Magic Circus', 105, 3),
  ('Honey, So Do I', 207, 3),
  ('Sweetie, Lets Go Wild', 139, 3),
  ('She Knows', 244, 3),
  ('Fantasy For Me', 100, 4),
  ('Celebration Of More', 146, 4),
  ('Rock His Everything', 223, 4),
  ('Home Forever', 231, 4),
  ('Diamond Power', 241, 4),
  ("Let's Be Silly", 132, 4),
  ("Let's Be Silly", 132, 5),
  ("Let's Be Silly", 132, 5),
  ("Let's Be Silly", 132, 5),
  ("Let's Be Silly", 132, 6),
  ("Let's Be Silly", 132, 6),
  ("Let's Be Silly", 132, 6),
  ("Let's Be Silly", 132, 6),
  ("Let's Be Silly", 132, 6),
  ("Let's Be Silly", 132, 7),
  ("Let's Be Silly", 132, 7),
  ("Let's Be Silly", 132, 7),
  ("Let's Be Silly", 132, 7),
  ("Let's Be Silly", 132, 8),
  ("Let's Be Silly", 132, 8),
  ("Let's Be Silly", 132, 8),
  ("Let's Be Silly", 132, 8),
  ("Let's Be Silly", 132, 9),
  ("Let's Be Silly", 132, 9),
  ("Let's Be Silly", 132, 9),
  ("Let's Be Silly", 132, 10),
  ("Let's Be Silly", 132, 10),
  ("Let's Be Silly", 132, 10),
  ("Let's Be Silly", 132, 10),
  ("Let's Be Silly", 132, 10);