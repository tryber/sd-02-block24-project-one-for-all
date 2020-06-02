USE spotifyclone;

DROP VIEW IF EXISTS faturamento_atual;
CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(p.valor_plano) AS faturamento_minimo,
        MAX(p.valor_plano) AS faturamento_maximo,
        AVG(p.valor_plano) AS faturamento_medio,
        SUM(p.valor_plano) AS faturamento_total
    FROM usuarios AS u
    INNER JOIN planos AS p
    ON p.plano_id = u.plano_id
    WHERE EXISTS (SELECT * FROM planos);
    
SELECT * FROM faturamento_atual;
