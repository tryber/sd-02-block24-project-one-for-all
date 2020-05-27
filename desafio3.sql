use SpotifyClone;
create view historico_reproducao_usuarios as
select us.nome as usuario, mu.nome_musica as nome
from SpotifyClone.usuarios as us
inner join SpotifyClone.usuario_musicas_reproduzidas as umr on us.id = umr.usuario_id
inner join SpotifyClone.musicas as mu on umr.musica_id = mu.id
order by us.nome;
