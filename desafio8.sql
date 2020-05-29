USE SpotifyClone;
DELIMITER $$

DROP TRIGGER IF EXISTS trigger_usuario_delete $$

CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON usuarios
    FOR EACH ROW
BEGIN
    DELETE FROM artistas_seguidores
    WHERE usuario_id = OLD.usuario_id;
    DELETE FROM historico_usuarios
    WHERE usuario_id = OLD.usuario_id;
    DELETE FROM usuarios_planos
    WHERE usuario_id = OLD.usuario_id;
END $$

DELIMITER ;

DELETE FROM usuarios WHERE usuario_id = 15;
