USE SpotifyClone;

DELIMITER $$ 
CREATE PROCEDURE albuns_do_artista(IN id INT) BEGIN
SELECT
  a.id AS artista_id,
  a.artist_name AS artista,
  alb.id AS album_id,
  alb.album_name AS album
FROM
  artist AS a
  INNER JOIN album_artist AS a_a ON a_a.artist_id = a.id
  INNER JOIN album AS alb ON alb.id = a_a.album_id
WHERE
  a.id = id;

END $$
DELIMITER ;
