/* Desafio 9
Crie uma procedure chamada albuns_do_artista que recebe como parâmetro o valor da coluna
identificadora de um artista e em retorno deve exibir as seguintes quatro colunas: o código
identificador do artista, com o apelido "artista_id", o nome do artista, com o apelido "artista",
o valor identificador do álbum produzido por aquele artista, com o apelido "album_id" e o nome do álbum, com o apelido "album".
Confirme a execução correta da procedure, chamando-a e passando o valor "1" como parâmetro. */

USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN id INT)
BEGIN
SELECT
  alart.artist_id AS artista_id,
  art.artist_name AS artista,
  alart.album_id AS album_id,
  al.album_name AS album
FROM
  SpotifyClone.album_artists AS alart
INNER JOIN SpotifyClone.artists AS art ON alart.artist_id = art.id
INNER JOIN SpotifyClone.albuns AS al ON alart.album_id = al.id
WHERE
  art.id = id;
END $$

DELIMITER ;
