USE spotifyclone;

DROP VIEW IF EXISTS top_3_artistas;
CREATE VIEW top_3_artistas  AS
    SELECT artista_id, seguindo_artista AS artista, COUNT(*) AS seguidores
    FROM usuarios_artistas
    GROUP BY artista_id, artista
    ORDER BY seguidores DESC, artista_id;
    
SELECT * FROM top_3_artistas;
