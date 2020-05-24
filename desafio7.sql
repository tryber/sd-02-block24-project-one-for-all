CREATE VIEW perfil_artistas AS
SELECT
  al.artist_id artista_id,
  ar.artist_name artista,
  al.album_id,
  al.album_name album,
  fol.cnt seguidores
FROM SpotifyClone.Albuns al
INNER JOIN SpotifyClone.Artists ar ON al.artist_id = ar.artist_id
INNER JOIN (
  SELECT
    f.artist_id,
    COUNT(artist_id) cnt
  FROM SpotifyClone.Followers f
  GROUP BY artist_id) fol ON al.artist_id = fol.artist_id
ORDER BY seguidores DESC;
