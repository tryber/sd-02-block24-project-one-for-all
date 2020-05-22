use spotifyclone;
create view cancoespremium as
select
music as nome,
count(*) as reproducao
from
reproduction_history r
inner join musics m on m.id = r.music_id
group by music
order by music;
