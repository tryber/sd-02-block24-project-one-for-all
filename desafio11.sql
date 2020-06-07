use SpotifyClone;
create view cancoespremium as
select
music as nome,
count(*) as reproducao
from
reproduction_history r
inner join musics m on m.id = r.music_id
inner join users u on u.plan_id = r.user_id
inner join plans p on p.id = u.plan_id
where p.plan in ('universitário', 'familiar')
group by music
order by music;
