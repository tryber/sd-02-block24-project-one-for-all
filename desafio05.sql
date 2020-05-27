USE SpotifyClone;

CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        (SELECT mus.titulo FROM musicas mus WHERE hist.musica_id = mus.id) AS cancao,
        COUNT(hist.musica_id) AS reproducoes
    FROM historico_usuarios hist
    GROUP BY cancao
    ORDER BY reproducoes DESC
    LIMIT 2;
