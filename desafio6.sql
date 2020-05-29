USE SpotifyClone;
CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(p.valor_plano) AS faturamento_minimo,
        MAX(p.valor_plano) AS faturamento_maximo,
        AVG(p.valor_plano) AS faturamento_medio,
        SUM(p.valor_plano) AS faturamento_total
    FROM
        usuarios_planos up
            INNER JOIN
        planos p ON up.plano_id = p.plano_id;
