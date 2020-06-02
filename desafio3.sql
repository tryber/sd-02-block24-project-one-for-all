USE spotifyclone;

DROP VIEW IF EXISTS historico_reproducao_usuarios;
CREATE VIEW historico_reproducao_usuarios AS
    SELECT usuario, historico_reproducao AS nome FROM usuarios_historico_reproducao
    ORDER BY usuario;

    
SELECT * FROM historico_reproducao_usuarios;
