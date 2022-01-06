SELECT u.NOME_USUARIO AS usuario,
  IF(MAX(YEAR(m.DATA_REPRODUCAO)) = 2021, 'Usuário Ativo', 'Usuário Inativo') AS condicao_usuario
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.musicas_reproduzidas AS m
ON u.ID_USUARIO = m.ID_USUARIO
GROUP BY usuario
ORDER BY usuario;