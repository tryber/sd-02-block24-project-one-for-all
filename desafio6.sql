USE SpotifyClone;

CREATE VIEW faturamento_atual AS 
DELIMITER $$ 
CREATE PROCEDURE mediaPlans(OUT media DOUBLE) BEGIN
SELECT
  AVG(p.price) INTO media
FROM
  plan AS p
  INNER JOIN users AS u ON u.plan_id = p.id;

END $$ 
DELIMITER ;

CALL mediaPlans(@media_plan);

SELECT
  MIN(s.group_type) AS faturamento_minimo,
  MAX(s.group_type) AS faturamento_maximo,
  @media_plan AS faturamento_medio,
  SUM(s.group_type) AS faturamento_total
FROM
  (
    SELECT
      SUM(p.price) AS group_type
    FROM
      plan AS p
      INNER JOIN users AS u ON u.plan_id = p.id
    GROUP BY
      p.id
  ) AS s;
