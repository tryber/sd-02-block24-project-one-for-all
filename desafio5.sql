USE SpotifyClone;

CREATE VIEW top_2_hits_do_momento AS
SELECT
  s.music_name AS cancao,
  COUNT(rh.music_id) AS reproducoes
FROM
  songs AS s
  INNER JOIN reproduction_history As rh ON rh.music_id = s.id
GROUP BY
  s.id
ORDER BY
  reproducoes DESC
LIMIT
  2;
