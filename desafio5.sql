use spotifyclone;
create view top_2_hits_do_momento as
select
music,
count(*)
from
reproduction_history h
inner join musics m on m.id = h.music_id
group by music_id
order by count(*) desc
limit 2;
