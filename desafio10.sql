use spotifyclone;
delimiter $$
drop procedure if exists quantidade_musicas_no_historico  $$
create function quantidade_musicas_no_historico (param int)
returns int
deterministic
begin
select
count(*)
from
reproduction_history r
where r.user_id = param
group by user_id;
end $$
delimiter ;
