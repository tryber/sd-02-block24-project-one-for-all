/* Desafio 11
Crie uma VIEW chamada "CancoesPremium" que exiba o nome e a quantidade de vezes que cada canção foi tocada por usuários e usuárias do plano familiar ou universitário, de acordo com os detalhes a seguir.

A primeira coluna deve exibir o nome da canção, com o apelido "nome". A segunda coluna deve exibir a quantidade de reproduções que aquela canção recebeu, com o apelido "reproducoes".

Seus resultados devem agrupar as canções através de seu nome e devem estar ordenados por nome da canção em ordem crescente. */

CREATE VIEW CancoesPremium AS
SELECT
  so.song_name AS nome,
  COUNT(hi.song_id) AS reproducoes
FROM
  SpotifyClone.history AS hi
INNER JOIN
  SpotifyClone.plans_purchases AS plp ON hi.user_id = plp.user_id
INNER JOIN
  SpotifyClone.songs AS so ON hi.song_id = so.id
WHERE
  plp.plan_id IN(2,3)
GROUP BY
  nome
ORDER BY
  nome;
