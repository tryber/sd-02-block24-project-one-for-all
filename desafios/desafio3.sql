/* Desafio 3 Crie uma VIEW chamada historico_reproducao_usuarios.Essa VIEW deverá ter apenas duas colunas.
 A primeira coluna deve ser apelidada de "usuario" e deve exibir o nome do usuário ou da usuária.
 A segunda coluna deve ser apelidada de "nome" e exibir o nome da canção ouvida por aquele usuário ou
 usuária com base no seu seu histórico de reprodução.Os resultados devem estar ordenados por nome de
 usuário ou usuária em ordem crescente. */

CREATE VIEW historico_reproducao_usuarios AS
SELECT
  us.user_name AS usuario,
  so.song_name AS nome
FROM
  SpotifyClone.users AS us
  INNER JOIN SpotifyClone.history AS hi ON us.id = hi.user_id
  INNER JOIN SpotifyClone.songs AS so ON hi.song_id = so.id
ORDER BY
  us.user_name;
