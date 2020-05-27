use SpotifyClone;
create view perfil_artistas as
select
ar.id as artista_id,
ar.nome_artista as artista,
al.id as album_id,
al.nome_album as album,
tabela_seguidores.seguidores
from (
select asu.artista_id, ar.nome_artista as artista, count(artista_id) as seguidores
from SpotifyClone.artista_seguido_pelo_usuario as asu
inner join SpotifyClone.artistas as ar on ar.id = asu.artista_id
group by artista_id
) as tabela_seguidores
inner join SpotifyClone.artistas as ar on ar.id = tabela_seguidores.artista_id
inner join SpotifyClone.albuns as al on al.artista_id = ar.id
order by seguidores desc;
