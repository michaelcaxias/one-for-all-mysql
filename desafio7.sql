SELECT a.NOME_ARTISTA AS artista,
  al.NOME_ALBUM AS album,
  COUNT(s.ID_ARTISTA) AS seguidores
  FROM SpotifyClone.artistas AS a
  INNER JOIN SpotifyClone.albuns AS al
  ON a.ID_ARTISTA = al.ID_ARTISTA
  INNER JOIN SpotifyClone.seguindo_artistas AS s
  ON a.ID_ARTISTA = s.ID_ARTISTA
  GROUP BY artista, album
  ORDER BY seguidores DESC, artista ASC, album ASC
  LIMIT 10;