USE SpotifyClone;

CREATE VIEW historico_reproducao_usuarios AS
SELECT u.user_name as usuario, s.song_name as 'nome' FROM users AS u
INNER JOIN last_played AS l ON u.id = l.user_id
INNER JOIN songs AS s ON s.id = l.song_id
ORDER BY u.user_name;

SELECT * FROM historico_reproducao_usuarios;

