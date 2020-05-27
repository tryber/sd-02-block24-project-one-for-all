USE SpotifyClone;
DELIMITER $$

DROP PROCEDURE IF EXISTS albuns_do_artista $$

CREATE PROCEDURE albuns_do_artista(IN id_artista INT)
BEGIN
    SELECT
        art.id,
        art.nome AS artista,
        alb.id,
        alb.nome AS album
    FROM artistas art
    INNER JOIN albuns alb ON art.id = alb.artista_id
    WHERE id_artista = art.id;
END $$

DELIMITER ;

CALL albuns_do_artista(1);
