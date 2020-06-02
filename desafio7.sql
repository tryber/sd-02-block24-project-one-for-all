USE spotifyclone;

DROP VIEW IF EXISTS perfil_artistas ;
CREATE VIEW perfil_artistas AS
	SELECT 
		ua.artista_id, ua.seguindo_artista AS artista, a.album_id, a.album, COUNT(*) AS seguidores
	FROM usuarios_artistas AS ua
    INNER JOIN albuns AS a
    ON a.artista_id = ua.artista_id
	GROUP BY a.album_id, ua.seguindo_artista, ua.artista_id
    ORDER BY seguidores DESC;
   
    
SELECT * FROM perfil_artistas;
