USE SpotifyClone;

DROP VIEW IF EXISTS CancoesPremium;

CREATE VIEW CancoesPremium AS (
  SELECT
    C.nome,
    COUNT(*) AS reproducoes
  FROM historico_reproducao AS HR
  INNER JOIN cancoes AS C
  ON C.id = HR.cancao_id
  INNER JOIN usuarios AS U
  ON U.id = HR.usuario_id AND U.plano_id IN (2, 3)
  GROUP BY HR.cancao_id
  ORDER BY C.nome
);
