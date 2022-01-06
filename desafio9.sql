SELECT COUNT(m.ID_CANCAO) AS quantidade_musicas_no_historico
  FROM SpotifyClone.musicas_reproduzidas AS m
  INNER JOIN SpotifyClone.usuarios AS u
  ON u.ID_USUARIO = m.ID_USUARIO
  WHERE u.NOME_USUARIO = 'Bill';