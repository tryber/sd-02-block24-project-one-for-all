use SpotifyClone;
delimiter $$
drop procedure if exists albuns_do_artista $$
create procedure albuns_do_artista (in param int)
begin
select
artist_id as artista_id,
artist as artista,
b.id as album_id,
b.album
from
artists a
inner join albums b on b.artist_id = a.id
where artist_id = param;
end $$
delimiter ;
call albuns_do_artista(1);