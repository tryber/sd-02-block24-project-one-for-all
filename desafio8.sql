USE SpotifyClone;

DELIMITER $$

DROP TRIGGER IF EXISTS trigger_usuario_delete $$

CREATE TRIGGER trigger_usuario_delete BEFORE DELETE
ON usuarios
FOR EACH ROW
BEGIN
  DELETE FROM seguindo_artista
  WHERE usuario_id = OLD.id;
  DELETE FROM historico_reproducao
  WHERE usuario_id = OLD.id;
END $$

DELIMITER ;

DELETE FROM usuarios
WHERE id = 15;
