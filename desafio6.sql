USE SpotifyClone;

DROP VIEW IF EXISTS faturamento_atual;

CREATE VIEW faturamento_atual AS (
  SELECT
    MIN(P.valor) AS faturamento_minimo,
    MAX(P.valor) AS faturamento_maximo,
    AVG(P.valor) AS faturamento_medio,
    SUM(P.valor) AS faturamento_total
  FROM usuarios AS U
  INNER JOIN planos AS P
  ON P.id = U.plano_id
);
