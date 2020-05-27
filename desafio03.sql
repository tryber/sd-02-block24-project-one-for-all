USE SpotifyClone;

CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        us.nome AS usuario, mus.titulo AS nome
    FROM
        historico_usuarios h
            INNER JOIN
        usuarios us ON us.id = h.usuario_id
            INNER JOIN
        musicas mus ON mus.id = h.musica_id
    ORDER BY usuario;