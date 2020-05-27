USE SpotifyClone;

DROP VIEW IF EXISTS top_3_artistas;

CREATE VIEW top_3_artistas AS (
  SELECT
    A.id AS artista_id,
    A.nome AS artista,
    (
      SELECT COUNT(*)
      FROM seguindo_artista AS SA
      WHERE SA.artista_id = A.id
    ) AS seguidores
  FROM artistas AS A
  ORDER BY seguidores DESC
  LIMIT 3
);
