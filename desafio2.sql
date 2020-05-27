USE SpotifyClone;
CREATE VIEW estatisticas_musicais AS
SELECT
  COUNT(musica_id) AS cancoes,
  (
    SELECT COUNT(artista_id)
    FROM artistas
  ) AS artistas,
  (
    SELECT COUNT(album_id)
    FROM albuns
  ) AS albuns
FROM musicas;

SELECT * FROM estatisticas_musicais;
