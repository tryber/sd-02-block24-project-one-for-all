USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
SELECT
  (SELECT COUNT(song_id) FROM SpotifyClone.Songs) cancoes,
  (SELECT COUNT(artist_id) FROM SpotifyClone.Artists) artistas,
  (SELECT COUNT(album_id) FROM SpotifyClone.Albuns) albuns;
