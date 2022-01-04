DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

-- https://stackoverflow.com/questions/4834390/how-to-use-mysql-decimal

CREATE TABLE planos(
    PLANO_ID INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
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
    USUARIO_ID INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_USUARIO VARCHAR(50) NOT NULL DEFAULT 'Sem nome',
    IDADE INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY `PLANO_ID` (PLANO_ID) REFERENCES `planos`(`PLANO_ID`) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO usuarios (NOME_USUARIO, IDADE)
VALUES
  ('Tathi', 23),
  ('Cintia', 23),
  ('Bill', 23),
  ('Roger', 23),
  ('Norman', 23);


CREATE TABLE artistas(
    ARTISTA_ID INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
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