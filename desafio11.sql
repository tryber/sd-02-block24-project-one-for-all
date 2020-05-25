CREATE VIEW CancoesPremium AS
SELECT
  sh.song_name nome, 
  COUNT(sh.song_name) reproducoes
FROM (
  SELECT h.user_id, h.song_id, s.song_name FROM SpotifyClone.History h
  INNER JOIN SpotifyClone.Songs s ON s.song_id = h.song_id
) sh 
INNER JOIN SpotifyClone.Users u ON u.user_id = sh.user_id
INNER JOIN SpotifyClone.UserPlan up ON u.user_id = up.user_id
WHERE up.id_plan = 2 OR up.id_plan = 3
GROUP BY sh.song_name
ORDER BY nome;
