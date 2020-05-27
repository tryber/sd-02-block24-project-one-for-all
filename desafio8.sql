use SpotifyClone;

-- select * from SpotifyClone.usuarios;
-- select * from SpotifyClone.artista_seguido_pelo_usuario;
-- select * from SpotifyClone.usuario_musicas_reproduzidas;

delimiter $$

-- drop trigger if exists trigger_usuario_delete;

CREATE TRIGGER trigger_usuario_delete
AFTER DELETE
ON usuarios FOR EACH ROW
BEGIN
DELETE asu, umr
FROM artista_seguido_pelo_usuario as asu
INNER JOIN usuario_musicas_reproduzidas as umr on asu.usuario_id = umr.usuario_id
WHERE asu.usuario_id = old.id;
END; $$

delimiter ;

DELETE FROM usuarios WHERE id = 15;
