USE SpotifyClone;

DELIMITER $$

DROP PROCEDURE IF EXISTS albuns_do_artista $$

CREATE PROCEDURE albuns_do_artista (IN IN_artista_id INT)
BEGIN
  SELECT
    Al.artista_id,
    Ar.nome AS artista,
    Al.id AS album_id,
    Al.nome AS album
  FROM albuns AS Al
  INNER JOIN artistas AS Ar
  ON Ar.id = Al.artista_id
  WHERE Al.artista_id = IN_artista_id;
END $$

DELIMITER ;

CALL albuns_do_artista(1);
