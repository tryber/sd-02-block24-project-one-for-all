USE SpotifyClone;
CREATE VIEW perfil_artistas AS
SELECT
  (
    SELECT artista_id
    FROM artistas AS A
    WHERE A.artista_id = S.artista_id
  ) AS artista_id,
  (
    SELECT nome
    FROM artistas AS A
    WHERE A.artista_id = S.artista_id
  ) AS artista,
  AL.album_id,
  AL.nome AS album,
  COUNT(usuario_id) AS seguidores
FROM usuario_seguindo_artista AS S
INNER JOIN albuns AS AL
ON AL.artista_id = S.artista_id
GROUP BY S.artista_id, AL.album_id
ORDER BY seguidores DESC;

SELECT * FROM perfil_artistas;
