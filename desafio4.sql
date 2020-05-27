use SpotifyClone;
create view top_3_artistas as
select asu.artista_id, ar.nome_artista as artista, count(artista_id) as seguidores
from SpotifyClone.artista_seguido_pelo_usuario as asu
inner join SpotifyClone.artistas as ar on ar.id = asu.artista_id
group by artista_id
order by seguidores DESC
limit 3;
