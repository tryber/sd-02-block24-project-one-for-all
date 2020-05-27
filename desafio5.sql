USE SpotifyClone;
CREATE VIEW top_2_hits_do_momento AS
SELECT
  (
    SELECT nome
    FROM musicas AS M
    WHERE M.musica_id = H.musica_id
  ) AS cancao,
  COUNT(H.usuario_id) AS reproducoes
FROM historico_reproducao AS H
GROUP BY H.musica_id
ORDER BY reproducoes DESC
LIMIT 2;

SELECT * FROM top_2_hits_do_momento;
