use SpotifyClone;
create view top_2_hits_do_momento as
select mu.nome_musica as cancao, count(*) as reproducoes
from SpotifyClone.usuario_musicas_reproduzidas as umr
inner join SpotifyClone.musicas as mu on mu.id = umr.musica_id
group by mu.nome_musica
order by reproducoes DESC
limit 2;
