use SpotifyClone;
DELIMITER $$

-- DROP PROCEDURE albuns_do_artista;

CREATE PROCEDURE albuns_do_artista(
in artista_id int
)
BEGIN
SELECT ar.id, ar.nome_artista as artista, al.id as album_id, al.nome_album as album
FROM SpotifyClone.albuns as al
INNER JOIN SpotifyClone.artistas as ar on ar.id = al.artista_id
WHERE ar.id = artista_id;
END $$;

DELIMITER ;

call albuns_do_artista(1);
