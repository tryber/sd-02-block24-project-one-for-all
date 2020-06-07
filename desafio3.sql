use SpotifyClone;
create view historico_reproducao_usuarios as
select
user as usuario,
music as nome
from reproduction_history r
inner join users u on u.id = r.user_id
inner join musics m on m.id = r.music_id
order by user, music;
