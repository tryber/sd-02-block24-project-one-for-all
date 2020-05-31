USE SpotifyClone;

CREATE VIEW faturamento_atual AS
SELECT
MIN(price) AS faturamento_minimo,
MAX(price) AS faturamente_maximo,
SUM(price) / (SELECT COUNT(*) FROM users) AS faturamento_medio,
SUM(price) AS faturamento_total
FROM subscriptions;
