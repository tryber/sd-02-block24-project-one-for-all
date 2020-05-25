CREATE VIEW faturamento_atual AS
SELECT
  (SELECT MIN(price) FROM SpotifyClone.Plans) faturamento_minimo,
  (SELECT MAX(price) FROM SpotifyClone.Plans) faturamento_maxim,
  (SELECT AVG(price) FROM SpotifyClone.Plans p
    INNER JOIN SpotifyClone.UserPlan u ON u.id_plan = p.id_plan) faturamento_medio,
  (SELECT SUM(price) FROM SpotifyClone.Plans p
    INNER JOIN SpotifyClone.UserPlan u ON u.id_plan = p.id_plan) faturamento_total;
