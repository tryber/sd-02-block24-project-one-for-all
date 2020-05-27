use SpotifyClone;
create view estatisticas_musicais as
select 
count(*) as cancoes,
(select count(*) from SpotifyClone.artistas) as artistas,
(select count(*) from SpotifyClone.albuns) as albuns
from SpotifyClone.musicas;
