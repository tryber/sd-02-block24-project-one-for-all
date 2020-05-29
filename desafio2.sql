USE SpotifyClone;
CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(DISTINCT m.musica_id) AS cancoes,
        COUNT(DISTINCT art.artista_id) AS artista,
        COUNT(DISTINCT al.album_id) AS albuns
    FROM
        musicas m
            CROSS JOIN
        artistas art
            CROSS JOIN
        albuns al;
