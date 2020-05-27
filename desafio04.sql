USE SpotifyClone;

CREATE VIEW top_3_artistas AS
    SELECT 
        artista_id, 
        (SELECT nome FROM artistas art WHERE art.id = seg.artista_id) AS artista, 
        COUNT(usuario_id) AS seguidores
    FROM artistas_seguidores seg
    GROUP BY artista_id
    ORDER BY seguidores DESC
    LIMIT 3;

