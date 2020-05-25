CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE Plans(
    id_plan INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(50),
    price DECIMAL(5,2)
) engine = InnoDB;

CREATE TABLE Users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100),
    Age INT
) engine = InnoDB;

CREATE TABLE UserPlan(
    user_id INT,
    id_plan INT,
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id),
    FOREIGN KEY (id_plan)
    REFERENCES Plans (id_plan)
) engine = InnoDB;

CREATE TABLE Artists(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(50)
) engine = InnoDB;

CREATE TABLE Albuns(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(100),
    artist_id INT,
    FOREIGN KEY (artist_id)
    REFERENCES Artists (artist_id)
) engine = InnoDB;

CREATE TABLE Songs(
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(100),
    album_id INT,
    FOREIGN KEY (album_id)
    REFERENCES Albuns (album_id)
) engine = InnoDB;

CREATE TABLE History(
    user_id INT,
    song_id INT,
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id),
    FOREIGN KEY (song_id)
    REFERENCES Songs (song_id)
) engine = InnoDB;

CREATE TABLE Followers(
    user_id INT,
    artist_id INT,
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id),
    FOREIGN KEY (artist_id) 
    REFERENCES Artists (artist_id)
) engine = InnoDB;

INSERT INTO Plans (plan_name, price)
VALUES
  ('Gratuito',0),
  ('Universitario',5.99),
  ('Familiar',7.99);

INSERT INTO Users
VALUES
  (15, 'Thati', 23),
  (16, 'Cintia', 35),
  (17, 'Bill', 20),
  (18, 'Roger', 45);
  
INSERT INTO UserPlan
VALUES
  (15, 1),
  (16, 3),
  (17, 2),
  (18, 1);
  
INSERT INTO Artists (artist_name)
VALUES
  ('Walter Phoenix'),
  ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong');
  
INSERT INTO Albuns (album_name, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 4),
  ('Incandescent', 3),
  ('Temporary Culture', 2);
  
INSERT INTO Songs (song_name, album_id)
VALUES
  ('Soul For Us', 1),
  ('Magic Circus', 3),
  ('Diamond Power', 4),
  ('Thang Of Thunder', 5),
  ('Home Forever', 4),
  ('Words Of Her Life', 5),
  ('Reflections Of Magic', 1),
  ('Honey, Lets Be Silly', 4),
  ('Troubles Of My Inner Fire', 2),
  ('Dance With Her Own', 1),
  ('Without My Streets', 5),
  ('Celebration Of More', 4),
  ('Time Fireworks', 2),
  ('She Knows', 3),
  ('Honey, So Do I', 3),
  ('Sweetie, Lets Go Wild', 3),
  ('Fantasy For Me', 4),
  ('Rock His Everything', 4);
  
INSERT INTO History
VALUES
  (15, 1),
  (15, 2),
  (15, 3),
  (15, 4),
  (16, 5),
  (16, 6),
  (16, 7),
  (16, 8),
  (17, 2),
  (17, 4),
  (17, 9),
  (18, 10),
  (18, 11),
  (18, 12);
  
INSERT INTO Followers
VALUES
  (15, 1),
  (15, 2),
  (15, 3),
  (16, 1),
  (16, 3),
  (17, 1),
  (17, 4),
  (18, 2);
