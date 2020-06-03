/* Desafio 7 Mostre uma relação de todos os álbuns produzidos por cada artista,
juntamente com a quantidade de seguidores que aquele artista possui,
de acordo com os detalhes a seguir.Crie uma VIEW chamada perfil_artistas que,
na primeira coluna,
deve exibir a valor identificador do artista,
com o apelido "artista_id".A segunda coluna deve exibir o nome do artista,
com o apelido "artista".A terceira coluna deve exibir o valor identificador do álbum,
com o apelido "album_id".A quarta coluna deve exibir o nome do álbum,
com o apelido "album".A quinta coluna deve exibir a quantidade de seguidores que aquele artista possui e deve ser apelidada de "seguidores".Seus resultados devem estar ordenados em ordem decrescente,
baseando - se no número de seguidores. */

CREATE VIEW perfil_artistas AS
SELECT
  alar.artist_id AS artista_id,
  art.artist_name AS artista,
  alar.album_id AS album_id,
  al.album_name AS album,
  (
    SELECT
      COUNT(fo.artist_id)
	  FROM
      SpotifyClone.followers AS fo
	  WHERE
      fo.artist_id = art.id
  ) AS seguidores
FROM
  SpotifyClone.album_artists AS alar
INNER JOIN SpotifyClone.artists AS art ON alar.artist_id = art.id
INNER JOIN SpotifyClone.albuns AS al ON alar.album_id = al.id
ORDER BY
  seguidores DESC;
