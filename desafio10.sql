DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (id INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE nsongs INT;
    SELECT COUNT(song_id) FROM SpotifyClone.History
    GROUP BY user_id
    HAVING user_id = id
    INTO nsongs;
  RETURN nsongs;
  END $$
DELIMITER ;

SELECT quantidade_musicas_no_historico(17);
