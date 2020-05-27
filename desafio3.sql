USE SpotifyClone;

DROP VIEW IF EXISTS historico_reproducao_usuarios;

CREATE VIEW historico_reproducao_usuarios AS (
  SELECT
    U.nome AS usuario,
    C.nome AS nome
  FROM historico_reproducao AS HR
  INNER JOIN usuarios AS U
  ON U.id = HR.usuario_id
  INNER JOIN cancoes AS C
  ON C.id = HR.cancao_id
  ORDER BY usuario
);
