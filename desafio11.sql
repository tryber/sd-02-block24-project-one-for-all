use SpotifyClone;
create view CancoesPremium as
select
m.music as nome,
count(*)
from
reproduction_history r
inner join musics m on m.id = r.music_id
inner join users u on u.id = r.user_id
inner join plans p on p.id = u.plan_id
where p.plan in ('universitário', 'familiar')
group by music
order by music;
