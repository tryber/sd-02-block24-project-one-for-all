use spotifyclone;
create view perfil_artistas as
select
f.artist_id as artista_d,
a.artist as artista,
b.id as album_id,
b.album,
count(*) as seguidores
from users_follow_artist f
inner join artists a on a.id = f.artist_id
inner join albums b on b.artist_id = a.id
group by b.album;
