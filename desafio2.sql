USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
SELECT
  COUNT(DISTINCT (am.music_id)) AS cancoes,
  COUNT(DISTINCT (a_a.artist_id)) AS artistas,
  COUNT(DISTINCT (am.album_id)) AS albuns
FROM
  album_music AS am
  INNER JOIN album_artist AS a_a ON a_a.album_id = am.album_id;
