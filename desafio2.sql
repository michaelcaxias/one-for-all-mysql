SELECT COUNT(c.ID_CANCAO) AS cancoes,
  COUNT(DISTINCT a.ID_ARTISTA) AS artistas,
  COUNT(DISTINCT a.ID_ALBUM) AS albuns
  FROM SpotifyClone.cancoes AS c
  INNER JOIN SpotifyClone.albuns AS a
  ON (a.ID_ALBUM = c.ID_ALBUM);