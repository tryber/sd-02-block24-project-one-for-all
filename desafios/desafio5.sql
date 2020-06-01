USE SpotifyClone;

CREATE VIEW top_2_hits_do_momento AS
SELECT s.song_name AS cancao,
COUNT(l.song_id) AS reproducoes
FROM songs AS s
INNER JOIN last_played AS l ON s.id = l.song_id
GROUP BY l.song_id
ORDER BY COUNT(l.song_id) DESC
LIMIT 2;

SELECT * FROM top_2_hits_do_momento;
