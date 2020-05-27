USE SpotifyClone;
CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(DISTINCT mus.id) AS cancoes,
        COUNT(DISTINCT art.id) AS artista,
        COUNT(DISTINCT alb.id) AS albuns
    FROM musicas mus
    CROSS JOIN artistas art
    CROSS JOIN albuns alb;
