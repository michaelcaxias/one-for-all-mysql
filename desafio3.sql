SELECT u.NOME_USUARIO AS usuario,
  COUNT(m.ID_USUARIO) AS qtde_musicas_ouvidas,
  ROUND(SUM(c.DURACAO_CANCAO_SEGUNDOS / 60), 2) AS total_minutos
  FROM SpotifyClone.usuarios AS u
  INNER JOIN SpotifyClone.musicas_reproduzidas AS m
  ON (u.ID_USUARIO = m.ID_USUARIO)
  INNER JOIN SpotifyClone.cancoes as c
  ON (m.ID_CANCAO = c.ID_CANCAO)
  GROUP BY u.NOME_USUARIO
  ORDER BY u.NOME_USUARIO ASC;