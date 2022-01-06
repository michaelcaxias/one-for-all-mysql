SELECT a.NOME_ARTISTA AS artista,
  al.NOME_ALBUM AS album
  FROM SpotifyClone.artistas AS a
  INNER JOIN SpotifyClone.albuns AS al
  ON a.ID_ARTISTA = al.ID_ARTISTA
  LIMIT 2;