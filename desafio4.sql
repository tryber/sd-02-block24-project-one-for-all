use spotifyclone;
create view top_3_artistas as
select
f.id as artista_id,
artist as artista,
count(*) as seguidores
from users_follow_artist f
inner join artists a on a.id = f.artist_id
group by artist_id
order by count(*) desc
limit 3;
