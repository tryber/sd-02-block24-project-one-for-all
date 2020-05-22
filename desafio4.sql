USE SpotifyClone;
CREATE VIEW top_3_artistas AS
    SELECT 
        artista_id, 
        (SELECT artista_nome FROM artistas a WHERE a.artista_id = s.artista_id) AS artista, 
        COUNT(usuario_id) AS seguidores
	FROM artistas_seguidores s
	GROUP BY artista_id
    ORDER BY seguidores DESC
    LIMIT 3; 
