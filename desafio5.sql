USE SpotifyClone;

CREATE VIEW top_2_hits_do_momento AS
SELECT
  c.nome_cancao AS cancao,
  COUNT(h.cancao_id) as reproducoes
FROM cancoes AS c
INNER JOIN historico_reproducao as h ON c.id = h.cancao_id
GROUP BY h.cancao_id
ORDER BY reproducoes DESC
LIMIT 2;