USE SpotifyClone;

CREATE VIEW perfil_artistas AS
    SELECT 
        art.id,
        art.nome AS artista,
        alb.id AS album_id,
        alb.nome AS album,
        (SELECT COUNT(seg.usuario_id)
        FROM artistas_seguidores seg
        WHERE seg.artista_id = art.id
        GROUP BY art.id) AS seguidores
    FROM artistas art
    INNER JOIN albuns alb
    ON alb.artista_id = art.id
    ORDER BY seguidores DESC;
