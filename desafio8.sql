USE spotifyclone;


DROP TRIGGER IF EXISTS trigger_usuario_delete;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON usuarios 
    FOR EACH ROW
BEGIN
    DELETE FROM usuarios_artistas
    WHERE usuario_id = OLD.usuario_id;
    DELETE FROM usuarios_historico_reproducao
    WHERE usuario_id = OLD.usuario_id;
    DELETE FROM usuarios_planos
    WHERE usuario_id = OLD.usuario_id;
END $$

DELIMITER ;

DELETE FROM usuarios WHERE usuario_id = 15;
