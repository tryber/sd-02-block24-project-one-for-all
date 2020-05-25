USE SpotifyClone;

CREATE VIEW historico_reproducao_usuarios AS
SELECT
  u.user_name AS usuario,
  s.music_name AS nome
FROM
  users AS u
  INNER JOIN reproduction_history AS rh ON rh.user_id = u.id
  INNER JOIN songs AS s ON s.id = rh.music_id
ORDER BY
  u.user_name;
