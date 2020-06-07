use SpotifyClone;
delimiter $$
drop function if exists quantidade_musicas_no_historico  $$
create function quantidade_musicas_no_historico (param int)
returns int
deterministic
return (
select
count(*)
from
reproduction_history 
where user_id = param
group by user_id
);
$$ delimiter ;
