USE SpotifyClone;

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE historico_musicas INT;

SELECT COUNT(musica_id)  
FROM historico_reproducao
WHERE usuario_id = id
INTO historico_musicas;

RETURN historico_musicas;
END
$$ DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
