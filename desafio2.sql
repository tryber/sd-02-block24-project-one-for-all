use SpotifyClone;
create view estatisticas_musicais as
select
(select count(*) from musics) as cancoes,
(select count(*) from artists) as artistas,
(select count(*) from albums) as albuns;
