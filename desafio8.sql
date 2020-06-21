use SpotifyClone;

delimiter $$

create trigger trigger_usuario_delete before delete on users
for each row
begin
delete from reproduction_history r where r.user_id = old.id;
delete from users_follow_artist f where f.user_id = old.id;
end $$

delimiter ;
