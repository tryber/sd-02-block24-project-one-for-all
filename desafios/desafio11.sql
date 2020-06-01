USE SpotifyClone;

CREATE VIEW CancoesPremium AS
SELECT
s.song_name AS nome,
count(lp.song_id) as reproducoes
FROM users AS u
INNER JOIN last_played AS lp ON lp.user_id = u.id
INNER JOIN songs AS s ON s.id = lp.song_id
WHERE u.subscription IN(2, 3)
GROUP BY lp.song_id
ORDER BY s.song_name;

SELECT * FROM CancoesPremium;
