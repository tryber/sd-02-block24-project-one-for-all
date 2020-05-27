USE SpotifyClone;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN number INT) 
BEGIN 
SELECT A.artista_id,
A.nome AS artista,
B.album_id, 
B.nome AS album
FROM artistas AS A
INNER JOIN albuns AS B
ON A.artista_id = B.artista_id
WHERE A.artista_id = number;
END
$$ DELIMITER ;

CALL albuns_do_artista(1);
