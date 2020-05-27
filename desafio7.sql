USE SpotifyClone;

DROP VIEW IF EXISTS perfil_artistas;

CREATE VIEW perfil_artistas AS (
  SELECT
    Al.artista_id,
    Ar.nome,
    Al.id AS album_id,
    Al.nome AS album,
    (
      SELECT COUNT(*) FROM seguindo_artista AS SA
      WHERE SA.artista_id = Al.artista_id
    ) AS seguidores
  FROM albuns AS Al
  INNER JOIN artistas AS Ar
  ON Ar.id = Al.artista_id
  ORDER BY seguidores DESC
);
