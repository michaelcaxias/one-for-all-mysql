DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

-- https://stackoverflow.com/questions/4834390/how-to-use-mysql-decimal

CREATE TABLE planos(
    ID_PLANO INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    TIPO_PLANO VARCHAR(15) NOT NULL DEFAULT 'Sem plano',
    VALOR_PLANO DECIMAL(7, 2) NOT NULL DEFAULT 0,
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
    FOREIGN KEY `ID_PLANO_FK` (ID_PLANO) REFERENCES planos(`ID_PLANO`) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO usuarios (NOME_USUARIO, IDADE)
VALUES
  ('Tathi'),
  ('Cintia'),
  ('Bill'),
  ('Roger'),
  ('Norman');


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
    ID_USUARIO INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_ALBUM VARCHAR(50) NOT NULL DEFAULT 'Sem nome',
    FOREIGN KEY `ID_ARTISTA` (ID_ARTISTA) REFERENCES artistas(ID_ARTISTA) ON DELETE CASCADE
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
    FOREIGN KEY `ID_ALBUM` (ID_ARTISTA) REFERENCES artistas(ID_ARTISTA) ON DELETE CASCADE
    FOREIGN KEY `ID_ARTISTA` (ID_ARTISTA) REFERENCES artistas(ID_ARTISTA) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO cancoes (NOME_ALBUM)
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