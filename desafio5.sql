USE SpotifyClone;
CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        (SELECT m.musica_titulo FROM musicas m WHERE h.musica_id = m.musica_id) AS cancao,
        COUNT(h.musica_id) AS reproducoes
	FROM historico_usuarios h
    GROUP BY cancao
    ORDER BY reproducoes DESC
    LIMIT 2;
