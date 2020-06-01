USE SpotifyClone;

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id_user INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE play_times INT;
SELECT COUNT(user_id) FROM last_played WHERE user_id = id_user INTO play_times;
RETURN play_times;
END ; $$
DELIMITER ;

SELECT QUANTIDADE_MUSICAS_NO_HISTORICO(17);