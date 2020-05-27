USE SpotifyClone;
CREATE VIEW faturamento_atual AS
SELECT
  MIN(valor) AS faturamento_minimo,
  MAX(valor) AS faturamento_maximo,
  AVG(valor) AS faturamento_medio,
  SUM(valor) AS faturamento_total
FROM usuarios AS U
INNER JOIN planos AS P
ON U.plano_id = P.plano_id;

SELECT * FROM faturamento_atual;
