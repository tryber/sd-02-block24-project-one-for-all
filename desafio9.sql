DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN album INT)
BEGIN
  SELECT
    al.artist_id artista_id,
    ar.artist_name artista,
    al.album_id,
    al.album_name album
  FROM SpotifyClone.Albuns al
  INNER JOIN SpotifyClone.Artists ar ON ar.artist_id = al.artist_id
  WHERE ar.artist_id = album;
END $$
DELIMITER ;

CALL albuns_do_artista(1);
