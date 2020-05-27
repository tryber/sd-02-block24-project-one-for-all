USE SpotifyClone;

DELIMITER $$

-- DROP FUNCTION quantidade_musicas_no_historico;

CREATE FUNCTION quantidade_musicas_no_historico(usuario_id int)
RETURNS INT READS SQL DATA
BEGIN
return
(
select count(*)
from SpotifyClone.usuario_musicas_reproduzidas as umr
group by umr.usuario_id
having umr.usuario_id = usuario_id
);
END $$;

DELIMITER ;

select quantidade_musicas_no_historico(16);
