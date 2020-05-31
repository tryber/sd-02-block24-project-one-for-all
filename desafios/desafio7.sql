USE SpotifyClone;

CREATE VIEW perfil_artistas AS
SELECT
al.artist_id AS artista_id,
ar.artist_name AS artista,
al.id AS album_id,
al.album_name AS album,
uf.amount_follows AS seguidores
FROM albums AS al
INNER JOIN artists AS ar ON al.artist_id = ar.id
INNER JOIN
(SELECT artist_id, COUNT(artist_id) AS amount_follows FROM user_follows
GROUP BY artist_id) AS uf ON uf.artist_id = al.artist_id
ORDER BY seguidores DESC;

SELECT * FROM perfil_artistas;
