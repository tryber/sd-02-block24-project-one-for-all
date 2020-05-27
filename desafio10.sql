USE SpotifyClone;

DELIMITER $$

DROP FUNCTION IF EXISTS quantidade_musicas_no_historico $$

CREATE FUNCTION quantidade_musicas_no_historico(IN_usuario_id INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE quant INT;
  SELECT COUNT(*) FROM historico_reproducao
  WHERE usuario_id = IN_usuario_id
  INTO quant;
  RETURN quant;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(17);
