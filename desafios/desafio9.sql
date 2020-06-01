USE SpotifyClone;

CREATE PROCEDURE albuns_do_artista (id_artist INT)
SELECT
al.artist_id AS artista_id, 
ar.artist_name AS artista,
al.id AS album_id,
al.album_name AS album
FROM albums AS al
INNER JOIN artists AS ar ON al.artist_id = ar.id
WHERE al.artist_id = id_artist;

CALL albuns_do_artista(1);
