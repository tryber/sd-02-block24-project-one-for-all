USE SpotifyClone;

CREATE VIEW top_3_artistas AS
SELECT
a.id AS artista_id,
a.artist_name AS artista,
COUNT(f.artist_id) AS seguidores
FROM artists AS a
INNER JOIN user_follows AS f ON a.id = f.artist_id
GROUP BY f.artist_id
ORDER BY COUNT(f.artist_id) DESC
LIMIT 3;

SELECT * FROM top_3_artistas;