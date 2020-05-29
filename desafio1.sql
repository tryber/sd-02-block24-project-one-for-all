CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
  id INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(50) NOT NULL,
  price DOUBLE NOT NULL
) engine = InnoDB;

INSERT INTO
  plan(plan_name, price)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('famíliar', 7.99);

CREATE TABLE users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  current_age INT NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES plan(id)
) engine = InnoDB AUTO_INCREMENT = 15;

INSERT INTO
  users(user_name, current_age, plan_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1);

CREATE TABLE songs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  music_name VARCHAR(100) NOT NULL
) engine = InnoDB;

INSERT INTO
  songs(music_name)
VALUES
  ('Soul For Us'),
  ('Reflections Of Magic'),
  ('Dance With Her Own'),
  ('Troubles Of My Inner Fire'),
  ('Time Fireworks'),
  ('Magic Circus'),
  ('Honey, So Do I'),
  ('Sweetie, Let\'s Go Wild'),
  ('She Knows'),
  ('Fantasy For Me'),
  ('Celebration Of More'),
  ('Rock His Everything'),
  ('Home Forever'),
  ('Diamond Power'),
  ('Honey,Let\'s Be Silly'),
  ('Thang Of Thunder'),
  ('Words Of Her Life'),
  ('Without My Streets');

CREATE TABLE artist (
  id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(100) NOT NULL
) engine = InnoDB;

INSERT INTO
  artist(artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

CREATE TABLE album (
  id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(100) NOT NULL
) engine = InnoDB;

INSERT INTO
  album(album_name)
VALUES
  ('Envious'),
  ('Exuberant'),
  ('Hallowed Steam'),
  ('Incandescent'),
  ('Temporary Culture');

CREATE TABLE reproduction_history (
  PRIMARY KEY(user_id, music_id),
  user_id INT NOT NULL,
  music_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (music_id) REFERENCES songs(id)
) engine = InnoDB;

INSERT INTO
  reproduction_history(user_id, music_id)
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

CREATE TABLE follow_artist (
  PRIMARY KEY(user_id, artist_id),
  user_id INT NOT NULL,
  artist_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (artist_id) REFERENCES artist(id)
) engine = InnoDB;

INSERT INTO
  follow_artist (user_id, artist_id)
VALUES
  (15, 1),
  (15, 4),
  (15, 3),
  (16, 1),
  (16, 3),
  (17, 2),
  (17, 1),
  (18, 4);

CREATE TABLE album_artist(
  PRIMARY KEY(artist_id, album_id),
  artist_id INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist(id),
  FOREIGN KEY (album_id) REFERENCES album(id)
) engine = InnoDB;

INSERT INTO
  album_artist(artist_id, album_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5);

CREATE TABLE album_music(
  PRIMARY KEY(album_id, music_id),
  album_id INT NOT NULL,
  music_id INT NOT NULL,
  FOREIGN KEY (music_id) REFERENCES songs(id),
  FOREIGN KEY (album_id) REFERENCES album(id)
) engine = InnoDB;

INSERT INTO
  album_music(album_id, music_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 4),
  (2, 5),
  (3, 6),
  (3, 7),
  (3, 8),
  (3, 9),
  (4, 10),
  (4, 11),
  (4, 12),
  (4, 13),
  (4, 14),
  (4, 15),
  (5, 16),
  (5, 17),
  (5, 18);
