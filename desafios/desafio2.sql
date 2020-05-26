USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(id) AS cancoes,
(SELECT COUNT(id) FROM artists) AS artistas,
(SELECT COUNT(id) FROM albums) AS albuns
FROM songs;
