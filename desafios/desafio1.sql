CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE users(
  id INT PRIMARY KEY auto_increment,
  user_name VARCHAR(50) NOT NULL,
  user_age INT NOT NULL
) engine = InnoDB AUTO_INCREMENT = 15;

CREATE TABLE plans(
  id INT PRIMARY KEY auto_increment,
  plan_name VARCHAR(50) NOT NULL,
  price DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE artists(
  id INT PRIMARY KEY auto_increment,
  artist_name VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE plans_purchases(
  user_id INT NOT NULL,
  plan_id INT NOT NULL,
  PRIMARY KEY(user_id, plan_id),
  FOREIGN KEY(user_id) references users(id),
  FOREIGN KEY(plan_id) references plans(id)
) engine = InnoDB;

CREATE TABLE albuns(
  id INT PRIMARY KEY auto_increment,
  album_name VARCHAR(80) NOT NULL
) engine = InnoDB;

CREATE TABLE songs(
  id INT PRIMARY KEY auto_increment,
  song_name VARCHAR(150) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns_songs(
  album_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY(album_id, song_id),
  FOREIGN KEY(album_id) references albuns(id),
  FOREIGN KEY(song_id) references songs(id)
) engine = InnoDB;

CREATE TABLE album_artists(
  artist_id INT NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY(artist_id, album_id),
  FOREIGN KEY(artist_id) references artists(id),
  FOREIGN KEY(album_id) references albuns(id)
) engine = InnoDB;

CREATE TABLE history(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY(user_id, song_id),
  FOREIGN KEY(user_id) references users(id),
  FOREIGN KEY(song_id) references songs(id)
) engine = InnoDB;

CREATE TABLE followers(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY(user_id, artist_id),
  FOREIGN KEY(user_id) references users(id),
  FOREIGN KEY(artist_id) references artists(id)
) engine = InnoDB;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON users
  FOR EACH ROW
BEGIN
  DELETE FROM plans_purchases
  WHERE user_id = OLD.id;
  DELETE FROM history
  WHERE user_id = OLD.id;
  DELETE FROM followers
  WHERE user_id = OLD.id;
END $$

DELIMITER ;

INSERT INTO
  users (user_name, user_age)
VALUES
  ("Thati", 23),
  ("Cintia", 35),
  ("Bill", 20),
  ("Roger", 45);

INSERT INTO
  plans (plan_name, price)
VALUES
  ("Gratuito", 0),
  ("Familiar", 7.99),
  ("Universitário", 5.99);

INSERT INTO
  artists (artist_name)
VALUES
  ("Walter Phoenix"),
  ("Peter Strong"),
  ("Lance Day"),
  ("Freedie Shannon");

INSERT INTO
  plans_purchases (user_id, plan_id)
VALUES
  (15, 1),
  (16, 2),
  (17, 3),
  (18, 1);

INSERT INTO
  albuns (album_name)
VALUES
  ("Envious"),
  ("Exuberant"),
  ("Hallowed Steam"),
  ("Incandescent"),
  ("Temporary Culture");

INSERT INTO
  songs (song_name)
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
  ('Honey, Let\'s Be Silly'),
  ('Thang Of Thunder'),
  ('Words Of Her Life'),
  ('Without My Streets');

INSERT INTO
  albuns_songs (album_id, song_id)
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

INSERT INTO
  album_artists (artist_id, album_id)
VALUES
  (1, 1),
  (1, 2),
  (4, 3),
  (3, 4),
  (2, 5);

INSERT INTO
  history (user_id, song_id)
VALUES
  (15,1),
  (15,6),
  (15,14),
  (15,16),
  (16,13),
  (16,17),
  (16,2),
  (16,15),
  (17,4),
  (17,16),
  (17,6),
  (18,3),
  (18,18),
  (18,11);

INSERT INTO
  followers (user_id, artist_id)
VALUES
  (15, 1),
  (15, 4),
  (15, 3),
  (16, 1),
  (16, 3),
  (17, 2),
  (17, 1),
  (18, 4);
