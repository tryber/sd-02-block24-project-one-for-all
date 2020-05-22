USE SpotifyClone;
DELIMITER $$

DROP FUNCTION IF EXISTS quantidade_musicas_no_historico $$

CREATE FUNCTION quantidade_musicas_no_historico(id_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
	DECLARE qtde_musicas INT;
    SELECT COUNT(musica_id)
    FROM historico_usuarios
    WHERE usuario_id = id_usuario
    GROUP BY usuario_id
    INTO qtde_musicas;
    RETURN qtde_musicas;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(17);
