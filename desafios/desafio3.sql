SELECT u.user_name, s.song_name AS usuario FROM users AS u
INNER JOIN last_played AS l ON u.id = l.user_id
INNER JOIN songs AS s ON s.id = l.song_id
ORDER BY u.user_name;