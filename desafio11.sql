USE SpotifyClone;
CREATE VIEW CancoesPremium AS
    SELECT m.musica_titulo AS nome, COUNT(h.musica_id)
    FROM musicas m
    INNER JOIN historico_usuarios h ON h.musica_id = m.musica_id
    INNER JOIN usuarios_planos u ON h.usuario_id = u.usuario_id AND u.plano_id IN(2, 3)
    GROUP BY nome
    ORDER BY nome;
