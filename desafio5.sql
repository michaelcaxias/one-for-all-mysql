SELECT c.NOME_CANCAO AS cancao,
  COUNT(m.ID_CANCAO) AS reproducoes
  FROM SpotifyClone.cancoes AS c
  INNER JOIN SpotifyClone.musicas_reproduzidas AS m
  ON m.ID_CANCAO = c.ID_CANCAO
  GROUP BY c.NOME_CANCAO
  ORDER BY reproducoes DESC,
  c.NOME_CANCAO ASC
  LIMIT 2;