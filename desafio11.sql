USE SpotifyClone;
CREATE VIEW CancoesPremium AS
    SELECT mus.titulo AS nome, COUNT(his.musica_id)
    FROM musicas mus
    INNER JOIN historico_usuarios his ON his.musica_id = mus.id
    INNER JOIN usuarios_planos us ON his.usuario_id = us.usuario_id AND us.plano_id IN(2, 3)
    GROUP BY nome
    ORDER BY nome;
