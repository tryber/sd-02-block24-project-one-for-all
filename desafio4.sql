CREATE VIEW top_3_artistas AS
SELECT
  a.artist_id artista_id,
  a.artist_name,
  COUNT(f.artist_id) seguidores
FROM SpotifyClone.Followers f
INNER JOIN SpotifyClone.Artists a ON a.artist_id = f.artist_id
GROUP BY a.artist_id
ORDER BY seguidores DESC, a.artist_id DESC
LIMIT 3;
