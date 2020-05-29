USE SpotifyClone;

DELIMITER $$
CREATE PROCEDURE quantidade_musicas_no_historico(IN idIn INT) BEGIN
SELECT
  count(user_id) AS quantidade_musicas_no_historico
FROM
  reproduction_history
WHERE
  user_id = idIn;

END $$
DELIMITER ;

CALL quantidade_musicas_no_historico(17);
