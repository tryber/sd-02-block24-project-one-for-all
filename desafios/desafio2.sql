/* Desafio 2 Crie uma VIEW chamada estatisticas_musicais que exiba três colunas.Cada coluna da VIEW
 deve exibir quantas vezes algo está cadastrado no banco de dados.Exiba a quantidade de canções na
 primeira coluna e dê a essa coluna o apelido "cancoes".A segunda coluna deve exibir a quantidade de artistas,
 e deverá ter o apelido "artistas".A terceira coluna deve exibir a quantidade de álbuns,
 e deverá ter o apelido "albuns". */
 
CREATE VIEW estatisticas_musicais AS
SELECT
  COUNT(DISTINCT also.song_id) AS cancoes,
  COUNT(DISTINCT alar.artist_id) AS artistas,
  COUNT(DISTINCT alar.album_id) AS albuns
FROM
  SpotifyClone.albuns_songs AS also
  INNER JOIN SpotifyClone.album_artists AS alar ON also.album_id = alar.album_id;
