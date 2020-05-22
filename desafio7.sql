USE SpotifyClone;
CREATE VIEW perfil_artistas AS
    SELECT 
        art.artista_id,
        art.artista_nome AS artista,
        al.album_id,
        al.album_nome AS album,
        (SELECT COUNT(s.usuario_id)
		 FROM artistas_seguidores s
		 WHERE s.artista_id = art.artista_id
		 GROUP BY art.artista_id) AS seguidores
    FROM artistas art
	INNER JOIN albuns al 
    ON al.artista_id = art.artista_id
    ORDER BY seguidores DESC;
        