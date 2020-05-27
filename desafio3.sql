USE SpotifyClone;
CREATE VIEW historico_reproducao_usuarios AS
SELECT
  (
    SELECT nome
    FROM usuarios AS U
    WHERE U.usuario_id = H.usuario_id
  ) AS usuario,
  (
    SELECT nome
    FROM musicas AS M
    WHERE M.musica_id = H.musica_id
  ) AS nome
FROM historico_reproducao AS H
ORDER BY usuario;

SELECT * FROM historico_reproducao_usuarios;
