USE SpotifyClone;

CREATE VIEW perfil_artistas AS
SELECT
  art.id AS artista_id,
  art.artist_name AS artista,
  alb.id AS album_id,
  alb.album_name AS album,
  sq.follow AS seguidores
FROM
  album AS alb
  INNER JOIN album_artist AS a_a ON a_a.album_id = alb.id
  INNER JOIN artist AS art ON art.id = a_a.artist_id
  INNER JOIN (
    SELECT
      COUNT(artist_id) AS follow,
      artist_id
    FROM
      follow_artist
    GROUP BY
      artist_id
  ) AS sq ON sq.artist_id = art.id
ORDER BY
  sq.follow DESC;
