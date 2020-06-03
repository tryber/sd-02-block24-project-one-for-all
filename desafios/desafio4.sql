/* Desafio 4 Crie uma VIEW com o nome top_3_artistas que exiba o código identificador,
o nome e a quantidade de pessoas que segue este artista.Sua VIEW deve mostrar somente os três
artistas mais populares no banco SpotifyClone.A coluna que representa o código identificador do
artista deve ser apelidada de "artista_id".A coluna que contém o nome do artista deve ser apelidada
de "artista".A coluna com a quantidade de pessoas que estão seguindo aquele artista deve receber o
apelido "seguidores".Seu resultado deve estar ordenado em ordem decrescente, baseando - se na quantidade de seguidores. */

CREATE VIEW top_3_artistas AS
SELECT
  art.id AS artist_id,
  art.artist_name AS artista,
  COUNT(fo.artist_id) AS seguidores
FROM
  SpotifyClone.artists AS art
  INNER JOIN SpotifyClone.followers AS fo ON art.id = fo.artist_id
GROUP BY
  art.id
ORDER BY
  seguidores DESC
LIMIT 3;
