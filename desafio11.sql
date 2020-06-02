DROP VIEW IF EXISTS CancoesPremium ;
CREATE VIEW CancoesPremium AS
	SELECT historico_reproducao AS nome, COUNT(*) AS reproducoes
    FROM usuarios_historico_reproducao AS uhr
    WHERE (SELECT plano_id FROM usuarios_planos
		WHERE usuario_id = uhr.usuario_id
        AND plano_id <> 1)
    GROUP BY nome
    ORDER BY nome;
    
SELECT * FROM CancoesPremium;
