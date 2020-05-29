USE SpotifyClone;

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(idIn INT)
RETURNS INT READS SQL DATA BEGIN DECLARE value_history INT;
SELECT
  count(user_id)
FROM
  reproduction_history
WHERE
  user_id = idIn INTO value_history;
  RETURN value_history;
END $$
DELIMITER ;

SELECT quantidade_musicas_no_historico(17) AS quantidade_musicas_no_historico;
