-- https://www.w3schools.com/sql/func_mysql_if.asp
SELECT u.NOME_USUARIO AS usuario,
  IF(MAX(YEAR(m.DATA_REPRODUCAO)) = 2021,'Usuário ativo', 'Usuário inativo')
  AS condicao_usuario
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.musicas_reproduzidas AS m
ON u.ID_USUARIO = m.ID_USUARIO
GROUP BY usuario
ORDER BY usuario;
