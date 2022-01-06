SELECT MIN(p.VALOR_PLANO) AS faturamento_minimo,
  MAX(p.VALOR_PLANO) AS faturamento_maximo,
  ROUND(AVG(p.VALOR_PLANO), 2) AS faturamento_medio,
  SUM(p.VALOR_PLANO) AS faturamento_total
  FROM SpotifyClone.planos AS p
  INNER JOIN SpotifyClone.usuarios AS u
  ON p.ID_PLANO = u.ID_PLANO;