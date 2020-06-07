use SpotifyClone;
create view perfil_artistas as
select
f.artist_id as artista_id,
a.artist as artista,
b.id as album_id,
b.album,
count(b.album) as seguidores
from users_follow_artist f
inner join artists a on a.id = f.artist_id
inner join albums b on b.artist_id = a.id
group by b.id
order by count(b.album) desc, b.album;
