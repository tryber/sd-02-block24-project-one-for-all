USE spotifyclone;

DROP VIEW IF EXISTS top_2_hits_do_momento;
CREATE VIEW top_2_hits_do_momento   AS
	SELECT historico_reproducao AS cancao, COUNT(*) AS reproducoes
    FROM usuarios_historico_reproducao
    GROUP BY cancao
    ORDER BY reproducoes DESC
    LIMIT 2;
    
SELECT * FROM top_2_hits_do_momento ;
