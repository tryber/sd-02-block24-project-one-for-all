USE SpotifyClone;
DELIMITER $$

DROP PROCEDURE IF EXISTS albuns_do_artista $$

CREATE PROCEDURE albuns_do_artista(IN id_artista INT)
BEGIN
    SELECT
        art.artista_id,
        art.artista_nome AS artista,
        al.album_id,
        al.album_nome AS album
	FROM artistas art
    INNER JOIN albuns al ON art.artista_id = al.artista_id
    WHERE id_artista = art.artista_id;
END $$

DELIMITER ;

CALL albuns_do_artista(1);
