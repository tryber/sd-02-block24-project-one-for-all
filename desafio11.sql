USE SpotifyClone;

CREATE VIEW CancoesPremium AS
SELECT
  (
    SELECT nome
    FROM musicas AS M
    WHERE M.musica_id = H.musica_id
  ) AS nome,
  COUNT(H.usuario_id) AS reproducoes
FROM usuarios AS U
INNER JOIN historico_reproducao AS H
ON U.usuario_id = H.usuario_id
WHERE U.plano_id IN(2, 3)
GROUP BY U.usuario_id, musica_id
ORDER BY nome;

SELECT * FROM CancoesPremium;
