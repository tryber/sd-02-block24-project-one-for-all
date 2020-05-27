use SpotifyClone;

create view CancoesPremium as
select
mu.nome_musica as nome,
count(*) as reproducoes
from usuario_musicas_reproduzidas as umr
inner join usuarios as us on us.id = umr.usuario_id
inner join musicas as mu on mu.id = umr.musica_id
where us.plano_id in (2, 3)
group by mu.nome_musica
order by mu.nome_musica;
