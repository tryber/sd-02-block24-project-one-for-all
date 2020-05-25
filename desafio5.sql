CREATE VIEW top_2_hits_do_momento AS
SELECT
  s.song_name cancao,
  COUNT(h.song_id) reproducoes
FROM History h 
INNER JOIN Songs s ON s.song_id = h.song_id
GROUP BY h.song_id
ORDER BY reproducoes DESC
LIMIT 2;
