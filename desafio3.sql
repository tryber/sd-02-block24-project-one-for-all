USE SpotifyClone;

CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.usuario_nome AS usuario, m.musica_titulo AS nome
    FROM
        historico_usuarios h
            INNER JOIN
        usuarios u ON u.usuario_id = h.usuario_id
            INNER JOIN
        musicas m ON m.musica_id = h.musica_id
    ORDER BY usuario;
