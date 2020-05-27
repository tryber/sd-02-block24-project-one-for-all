USE SpotifyClone;

CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(pl.valor) AS faturamento_minimo,
        MAX(pl.valor) AS faturamento_maximo,
        AVG(pl.valor) AS faturamento_medio,
        SUM(pl.valor) AS faturamento_total
    FROM
        usuarios_planos up
            INNER JOIN
        planos pl ON up.plano_id = pl.id;
