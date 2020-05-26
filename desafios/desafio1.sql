CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE subscriptions(
id INT PRIMARY KEY AUTO_INCREMENT,
subs_name VARCHAR(50) NOT NULL,
price DECIMAL(5,2) NOT NULL
);

CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50) NOT NULL,
age INT NOT NULL,
subscription INT NOT NULL,
FOREIGN KEY (subscription) REFERENCES subscriptions(id)
);

CREATE TABLE artists(
id INT PRIMARY KEY AUTO_INCREMENT,
artist_name VARCHAR(100) NOT NULL
);

CREATE TABLE user_follows(
user_id INT NOT NULL,
artist_id INT NOT NULL,
PRIMARY KEY (user_id, artist_id)
);

CREATE TABLE albums(
id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(100) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE songs(
id INT PRIMARY KEY AUTO_INCREMENT,
song_name VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albums(id)
);

CREATE TABLE last_played(
user_id INT NOT NULL,
song_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (song_id) REFERENCES songs(id)
);

INSERT INTO subscriptions (subs_name, price)
VALUES
('Gratuito',	0),
('Familiar' , 7.99),
('Universitário', 5.99);

INSERT INTO users (id, user_name, age, subscription)
VALUES
(15, 'Thati', 23, 1),
(16, 'Cintia', 35, 2),
(17, 'Bill', 20, 3),
(18, 'Roger', 45, 1);

INSERT INTO artists (artist_name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albums (album_name, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incadescent', 3),
('Temporary Culture', 4);

INSERT INTO user_follows(user_id, artist_id)
VALUES
(15, 1),
(15, 4),
(15, 3),
(16, 1),
(16, 3),
(17, 2),
(17, 1),
(18, 4);

INSERT INTO songs(song_name, album_id)
VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Let`s Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Let`s Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO last_played (user_id, song_id)
VALUES
(15, 1),
(15, 6),
(15, 14),
(15, 16),
(16, 13),
(16, 17),
(16, 2),
(16, 15),
(17, 4),
(17, 16),
(17, 6),
(18, 3),
(18, 18),
(18, 11);
