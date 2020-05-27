USE SpotifyClone;
CREATE VIEW top_3_artistas AS
SELECT
  (
    SELECT artista_id
    FROM artistas AS A
    WHERE A.artista_id = S.artista_id
  ) AS artista_id,
  (
    SELECT nome
    FROM artistas AS A
    WHERE A.artista_id = S.artista_id
  ) AS artista,
  COUNT(usuario_id) AS seguidores
FROM usuario_seguindo_artista AS S
GROUP BY S.artista_id
ORDER BY seguidores DESC
LIMIT 3;

SELECT * FROM top_3_artistas;
