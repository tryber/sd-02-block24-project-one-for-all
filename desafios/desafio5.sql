/* Desafio 5 Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas
músicas mais tocadas no momento.Crie uma VIEW chamada top_2_hits_do_momento que deve exibir as informações sobre o nome da canção e quantas vezes ela foi tocada recentemente (
considere todas canções registradas no banco como "recentemente" ).Dê à coluna que possui o nome da
canção o apelido "cancao" e a que possui a quantidade de vezes que foi tocada o apelido "reproducoes".
Seu resultado deve estar ordenado em ordem decrescente,baseando - se no número de reproduções.
Queremos apenas o top 2 de músicas mais tocadas. */

CREATE VIEW top_2_hits_do_momento AS
SELECT
  so.song_name AS cancao,
  COUNT(hi.song_id) AS reproducoes
FROM
  SpotifyClone.songs AS so
  INNER JOIN SpotifyClone.history AS hi ON so.id = hi.song_id
GROUP BY
  so.song_name
ORDER BY
  reproducoes DESC
LIMIT 2;
