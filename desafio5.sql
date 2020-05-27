USE SpotifyClone;

DROP VIEW IF EXISTS top_2_hits_do_momento;

CREATE VIEW top_2_hits_do_momento AS (
  SELECT
    C.nome AS cancao,
    (
      SELECT COUNT(*)
      FROM historico_reproducao AS HR
      WHERE HR.cancao_id = C.id
    ) AS reproducoes
  FROM cancoes AS C
  ORDER BY reproducoes DESC
  LIMIT 2
);
