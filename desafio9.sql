USE spotifyclone;
DROP PROCEDURE IF EXISTS albuns_do_artista ;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN input_id_artista INT)
BEGIN 
	SELECT artista_id, artista, album_id, album
    FROM albuns
    WHERE artista_id = input_id_artista;
END $$
DELIMITER ;

CALL albuns_do_artista (1);
