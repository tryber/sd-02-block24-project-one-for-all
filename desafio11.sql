USE SpotifyClone;

CREATE VIEW CancoesPremium AS
SELECT
  music_name AS nome,
  COUNT(rh.music_id) AS reproducoes
FROM
  reproduction_history AS rh
  INNER JOIN songs AS s ON s.id = music_id
  INNER JOIN users AS u ON u.id = rh.user_id
WHERE
  u.plan_id BETWEEN 2
  AND 3
GROUP BY
  rh.music_id
ORDER BY
  nome;
