DROP FUNCTION IF EXISTS quantidade_musicas_no_historico ;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(input_usuario_id INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE quantidade_musicas INT;
    SELECT COUNT(*) FROM usuarios_historico_reproducao
    WHERE usuario_id = input_usuario_id
    INTO quantidade_musicas;
    RETURN quantidade_musicas;
END $$
DELIMITER ;

SELECT quantidade_musicas_no_historico(17);
