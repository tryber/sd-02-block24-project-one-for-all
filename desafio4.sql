USE SpotifyClone;

CREATE VIEW top_3_artistas AS
SELECT
  a.id AS artista_id,
  a.artist_name AS artista,
  COUNT(fa.artist_id) AS seguidores
FROM
  artist AS a
  INNER JOIN follow_artist AS fa ON fa.artist_id = a.id
GROUP BY
  a.id
ORDER BY
  seguidores DESC
LIMIT
  3;
